# Enter the Emojidome

<a href="https://xkcd.com/2131/" title="XKCD 2131: Emojidome">
  <img src="https://imgs.xkcd.com/comics/emojidome.png" width=256 />
</a>


## R Package

This R package, named `emojidome` contains ~two~ three datasets:

  - `games`: a data.frame (a tibble) containing players and scores
  - `commentary`: a data.frame (a tibble) containing game commentary
  - `emojitracker`: a data.frame (a tibble) containing metadata and scores
    collected from [emojitracker][]

You can install it easily using [devtools][]:

```r
devtools::install_github("tomshafer/r-emojidome")
```

[emojitracker]: http://emojitracker.com
[devtools]: https://github.com/r-lib/devtools
