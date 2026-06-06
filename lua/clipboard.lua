-- Helper function to check if we are in an SSH session

local function is_ssh()
  return os.getenv("SSH_CLIENT") ~= nil or os.getenv("SSH_TTY") ~= nil or os.getenv("SSH_CONNECTION") ~= nil
end

-- If we are in an SSH session, configure OSC 52
if is_ssh() then
  -- Define a no-op function for pasting to prevent terminal timeout hangs
  local function no_paste()
    return function() return {} end
  end

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = no_paste(),
      ["*"] = no_paste(),
    },
  }
end
