## xkcd.R
## Convert XKCD websocket data to R data frames.
## The XKCD data is © 2019 XKCD.
## XKCD comics are liccensed CC BY-NC, and hopefully so is this data.

library(tidyverse)
library(jsonlite)
library(lubridate)

json <- read_json("data-raw/xkcd.json")
games_json <- json$bracket$played


# The games are organized by round, and each round contains
# all the games played in that round.
num_rounds <- length(games_json)
games_master <- tibble()
for (i in seq_along(games_json)) {
  this_round <- num_rounds - (i - 1)
  these_games <- games_json[[i]] %>%
    map_df(~ {
      commentary <- unlist(.x$extra$commentary)
      end_time <- .x$extra$end_time
      # Assumes that player and score ordering line up
      scores <- map_int(.x$game, `[[`, "score")
      competitors <- map_chr(.x$game, `[[`, "competitor")
      tibble(
        round = this_round,
        end_time = ymd_hms(end_time),
        competitors = list(competitors),
        scores = list(scores),
        commentary = list(commentary))
    })

  games_master <- bind_rows(games_master, these_games)
}

# Assign game IDs
games_master <- games_master %>%
  arrange(end_time) %>%
  mutate(game_id = row_number()) %>%
  select(round_id = round, game_id, end_date = end_time,
         competitors, scores, commentary)


# Derived data frame: game x date x player x score
games <- games_master %>%
  select(round_id, game_id, end_date, competitors, scores) %>%
  # Unnest should line up player and score in parallel
  unnest() %>%
  arrange(round_id, game_id) %>%
  rename(competitor = competitors, score = scores)

# Derived data frame: game x date x comment
commentary <- games_master %>%
  select(round_id, game_id, end_date, commentary) %>%
  unnest() %>%
  group_by(game_id) %>%
  mutate(comment_id = n() - row_number() + 1) %>%
  ungroup() %>%
  select(round_id, game_id, end_date, comment_id, comment = commentary) %>%
  arrange(round_id, game_id, comment_id)


usethis::use_data(games, overwrite = TRUE)
usethis::use_data(commentary, overwrite = TRUE)
