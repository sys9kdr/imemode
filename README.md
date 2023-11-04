# imemode

A simple IME mode selector. Inspired from im-select.

## Usage

imemode is a simple tool that enables to swich between IME modes in VSCodeVim, Neovim or Vim.
It disables the IME in normal mode and reverts to the previous IME mode when in input mode.

### VSCodeVim

Download `imemode.exe` from release and put it into `$PATH`.

To enable imemode for [VSCodeVim](https://github.com/VSCodeVim/Vim), add the following configurations in your settings.json:

```json
{
// ...
"vim.autoSwitchInputMethod.enable": true,
"vim.autoSwitchInputMethod.defaultIM": "16", // default IME value for hankaku eisu.
"vim.autoSwitchInputMethod.obtainIMCmd": "imemode.exe",
"vim.autoSwitchInputMethod.switchIMCmd": "imemode.exe {im}"
},
```

### Neovim

Download `imemode.exe` from release and put it into `$PATH`.

[im-select.nvim](https://github.com/keaising/im-select.nvim):

```lua
{ -- lazy.nvim style.
  "keaising/im-select.nvim",
  config = function()
    require('im_select').setup({
      default_im_select  = '16',
      default_command = 'imemode.exe', -- or /path/to/imemode.exe
    })
  end,
}
```

### Vim

WIP

## Build

You can build imemode on MSVC or gcc.

### MSVC

0. Install [Build Tools for Visual Studio](https://visualstudio.microsoft.com/ja/downloads/) or other MSVC C++ environments(e.g. Visual Studio)
    * I use Build Tools for Visual Studio 2017.
1. Start "x64 Native Tools Command Prompt for ..."
2. `git clone https://github.com/sys9kdr/imemode`
3. `cd imemode` and run `build.bat`

### GCC(MSYS2 Mingw64)

0. Install [MSYS2](https://www.msys2.org/)
1. Start MSYS2 Mingw64
2. `git clone https://github.com/sys9kdr/imemode`
3. `cd imemode` and `make`

## Motivation

[im-select](https://github.com/daipeihust/im-select) doesn't work correctly with Japanese IMEs because im-select.exe switches between multiple IMEs. Japanese IMEs usually switch their IME mode, not IME itself(maybe)[^fn1].
[zenhan](https://github.com/iuchim/zenhan) force the IME switch on/off, but it cannot get IME informations correctly and cannot set the IME mode.

[^fn1]: <https://github.com/VSCodeVim/Vim/issues/3930>

imemode switches the *IME modes*. It generally works quite well with Japanese IMEs.
imemode can get/set IME modes values.

## Known Issue

* At first time, imemode.exe always returns `25` if the real mode is some other.
    * Read [./doc/design.md](./doc/design.md).

## Credit

Thanks for their inspiration:

* [im-select](https://github.com/daipeihust/im-select)
* [zenhan](https://github.com/iuchim/zenhan)
