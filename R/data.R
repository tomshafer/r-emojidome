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


#' Emojitracker Data Set
#'
#' A dataset containing scores and metadata from \url{http://emojitracker.com},
#' downloaded April 2, 2019.
#'
#' The scores are *very* large integers, stored as \code{numeric} type.
#'
#' @format A data frame with 845 rows and 4 variables:
#' \describe{
#'   \item{emoji_id}{emojitracker (UTF-8 derived) indentifer for an emoji}
#'   \item{emoji_text}{alternate text or description for an emoji}
#'   \item{emoji}{emoji character}
#'   \item{score}{usage score as reported by emojitracker}
#' }
#' @source \url{http://emojitracker.com}
"emojitracker"
