if vim.loop.os_uname().sysname == "Windows_NT" then
   require('nvim-treesitter.install').compilers = { "clang" }
end



require("alexkalak")
require("alexkalak.keymaps")
