config.load_autoconfig(False)

c.tabs.show = "switching"
c.statusbar.show = "in-mode"

# Setting the default page
c.url.default_page = "file:///home/dat-adi/dotfiles/browser/src/dawnpage.html"

# Putting up the start page
c.url.start_pages = ["file:///home/dat-adi/dotfiles/browser/src/dawnpage.html"]

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "am": "https://www.amazon.in/s?k={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "goog": "https://www.google.com/search?q={}",
    "gogo": "https://gogoanime.pe/search.html?keyword={}",
    "re": "https://www.reddit.com/r/{}",
    "gh": "https://www.github.com/search?q={}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "co": "https://crates.io/search?q={}",
}

# Setting Dark Mode on
# config.set("colors.webpage.darkmode.enabled", True)

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ["#9cc4ff", "white", "white"]

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = "#1c1f24"

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = "#232429"

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = "#e1acff"

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = (
    "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)"
)

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = "#3f4147"

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = "#3f4147"

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = "#282c34"

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = "#ecbe7b"

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = "#c678dd"

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = "#c678dd"

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = "white"

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = "#282c34"

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = "#ff6c6b"

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = "#282c34"

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = "#98be65"

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = "#282c34"

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = "#282c34"

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = "white"

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = "#497920"

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = "#34426f"

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = "#282c34"

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = "yellow"

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = "#1c1f34"

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = "#282c34"

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = "#282c34"

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = "#282c34"

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = "#282c34"

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = "seagreen"

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = "darkseagreen"

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = "#282c34"

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = "#282c34"

c.content.user_stylesheets = ["~/dotfiles/config/qutebrowser/qute.css"]
c.fonts.default_family = '"SauceCodePro Nerd Font"'
c.fonts.web.family.standard = '"SauceCodePro Nerd Font"'
c.fonts.web.family.serif = '"SauceCodePro Nerd Font"'
c.fonts.web.family.sans_serif = '"SauceCodePro Nerd Font"'
c.fonts.web.family.fixed = '"SauceCodePro Nerd Font"'

c.fonts.default_size = "11pt"

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '11pt "SauceCodePro Nerd Font"'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '11pt "SauceCodePro Nerd Font"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = "default_size sans-serif"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '11pt "SauceCodePro Nerd Font"'

config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Zv", "hint links spawn alacritty -e youtube-dl {hint-url}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)
config.bind("Za", "hint links spawn alacritty -e ytdla {hint-url}")
