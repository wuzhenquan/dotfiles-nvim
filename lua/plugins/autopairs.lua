return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<M-e>",  -- Alt+e to trigger fast wrap in Insert mode
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      }
    }
  }
}
--[[
(foobar
()(foobar)
(foo bar
Before        Input                    After         Note
-----------------------------------------------------------------
(|foobar      <M-e> then press $       (|foobar))
(|)(foobar)   <M-e> then press q       (|(foobar))
(|foo bar     <M-e> then press qh      (|foo) bar
(|foo bar     <M-e> then press qH      (foo|) bar
(|foo bar     <M-e> then press qH      (foo)| bar    if cursor_pos_before = false
--]]
