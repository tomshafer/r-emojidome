#' Emojidome Game Log (XKCD 2131)
#'
#' A dataset containing game identifiers, players, and scores.
#'
#' XKCD comics are released under a Creative Commons BY-NC license.
#'
#' @format A data frame with 1,022 rows and 5 variables:
#' \describe{
#'   \item{round_id}{indentifer for collecting all games in one round}
#'   \item{game_id}{unique ID for the game}
#'   \item{end_date}{end date and time of the game}
#'   \item{competitor}{a competitor emoji}
#'   \item{score}{final score for a competitor in the specified game}
#' }
#' @source \url{https://emojidome.xkcd.com/2131/socket}
"games"


#' Emojidome Commentary Log (XKCD 2131)
#'
#' A dataset containing per-game commentary strings. Commentary is indexed in
#' ascending order (older comments come first) as far as I can tell.
#'
#' XKCD comics are released under a Creative Commons BY-NC license.
#'
#' @format A data frame with 1,263 rows and 5 variables:
#' \describe{
#'   \item{round_id}{indentifer for collecting all games in one round}
#'   \item{game_id}{unique ID for the game}
#'   \item{end_date}{end date and time of the game}
#'   \item{comment_id}{sequential per-game comment ID}
#'   \item{comment}{commentary string}
#' }
#' @source \url{https://emojidome.xkcd.com/2131/socket}
"commentary"
