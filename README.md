# calculator.nvim
calculator.nvim is a Neovim plugin that calculates math expressions

## Usage

<p align="center">
    <img src="https://raw.githubusercontent.com/vzze/calculator.nvim/main/calc.gif">
</p>

```lua
vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()",
    { ["range"] = 1, ["nargs"] = 0 })
```

## Installation

### Packer
```lua
use 'vzze/calculator.nvim'

-- lazy loading
use {
    'vzze/calculator.nvim',
    opt = true,
    module = "calculator"
}
```

### Supported functions and notations

<center>

| abs | log | cos  | sin  | tan   | rad | pi | floor | fmod |  exp  | min | sqrt | inf |
|-----|-----|------|------|-------|-----|----|-------|------|-------|-----|------|-----|
| pow | ln  | cosh | sinh | tanh  | deg | e  | ceil  | modf | frexp | max              |
|     | lg  | acos | asin | atan  |     |    |       |      | ldexp |                  |
|     |     |      |      | atan2 |

</center>
