## emojitracker.R
## Create a table of emoji counts using a snapshot of emojitracker.com.

library(tidyverse)
library(rvest)


page <- read_html("./data-raw/emojitracker.html", encoding = "utf-8")

emojitracker <- page %>%
  html_nodes(css = "li.emoji_char") %>%
  map_df(~ {

    attrs <- html_attrs(.)

    emoji <- html_node(., "span.emojifont") %>%
      html_text(trim = TRUE)

    score <- html_node(., "span.score") %>%
      html_text(trim = TRUE) %>%
      as.numeric()

    tibble(emoji_id = attrs[["id"]],
           emoji_text = str_to_sentence(attrs[["data-title"]]),
           emoji = emoji,
           score = score)

    })

usethis::use_data(emojitracker, overwrite = TRUE)
