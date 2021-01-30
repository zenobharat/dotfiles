vim.g.colors_name = 'night-owl'
local nvim = vim.api

local function highlight(group, guifg, guibg, attr)
  local parts = {group}
  if guifg then table.insert(parts, "guifg="..guifg) end
  if guibg then table.insert(parts, "guibg="..guibg) end
  if attr then
    if attr == 'NONE' then
      table.insert(parts, "gui=NONE")
      table.insert(parts, "cterm=NONE")
    else
      table.insert(parts, "gui="..attr)
      table.insert(parts, "cterm="..attr)
    end
  end

  -- nvim.ex.highlight(parts)
  nvim.nvim_command('highlight '..table.concat(parts, ' '))
end

local theme = {
  bold = "bold,",
  italic = "italic,",
  underline = "underline",
  NONE = 'NONE',

  white_default = "#d6deeb",
  white_light = "#C5E4FD",
  blue_default = "#011627",
  grey = "#4b6479",
  blue_dark = "#00111F",
  blue = "#82aaff",
  blue_light = "#C5E4FD",
  green_bright = "#addb67",
  pink = "#c792ea",
  red = "#ff5874",
  brown_light = "#806e6f",
  brown_dark = "#444444",
  orange_light = "#ecc48d",
  orange = "#f78c6c",
  blue_visual = "#1a2b4a",
  ash_grey = "#637777",
  cyan = "#7fdbca",
  yellow_light = "#fbec9f",
  yellow_dark = "#f4d554",
  highligter = "#263838",
  black_light = "#151d24",
  black = "#000000"
}

vim.g.terminal_color_foreground = "#d6deeb"
vim.g.terminal_color_background = "#011627"
vim.g.terminal_color_0 = "#011627"
vim.g.terminal_color_8 = "#637777"
vim.g.terminal_color_1 = "#ff5874"
vim.g.terminal_color_2 = "#addb67"
vim.g.terminal_color_10 = "#addb67"
vim.g.terminal_color_3 = "#f78c6c"
vim.g.terminal_color_11 = "#f78c6c"
vim.g.terminal_color_4 = "#82aaff"
vim.g.terminal_color_12 = "#82aaff"
vim.g.terminal_color_5 = "#c792ea"
vim.g.terminal_color_13 = "#c792ea"
vim.g.terminal_color_6 = "#7fdbca"
vim.g.terminal_color_14 = "#7fdbca"
vim.g.terminal_color_7 = "#aaaaaa"
vim.g.terminal_color_15 = "#eeeeee"

highlight("Bold", nil, nil, theme.bold)
highlight("italic", nil, nil, theme.italic)
highlight("Underline", nil, nil, theme.underline)

highlight("Normal", theme.white_default, theme.blue_default, nil)
highlight("LineNr", theme.grey, theme.blue_default, nil)
highlight("CursorLine", nil, theme.blue_dark, nil)
highlight("CursorLineNr", theme.white_default, theme.blue_dark, nil)
highlight("ColorColumn", nil, theme.black_light, nil)
highlight("Directory", theme.blue, nil, nil)
highlight("DiffAdd", theme.green_bright, theme.blue_default, nil)
highlight("DiffChange", theme.pink, theme.blue_default, nil)
highlight("DiffDelete", theme.red, theme.blue_default, nil)
highlight("DiffText", theme.green_bright, theme.blue_default, nil)
highlight("diffAdded", nil, theme.green_bright, nil)
highlight("diffRemoved", nil, theme.red, nil)

highlight("VertSplit", theme.blue, nil, theme.NONE)
highlight("MatchParen", theme.pink, nil, theme.bold..theme.underline)
highlight("Folded", theme.brown_light, nil, nil)
highlight("FoldedColumn", theme.brown_light, nil, nil)
highlight("SignColumn", nil, theme.blue_default, nil)
highlight("IncSearch", theme.blue_default, theme.pink, nil)
highlight("NonText", theme.brown_dark, nil, nil)
highlight("PMenu", theme.white_default, theme.blue_visual, nil)
highlight("PMenuSel", theme.blue_default, theme.blue, theme.bold)
highlight("Search", theme.blue_default, theme.pink, nil)
highlight("SpecialKey", theme.orange_light, nil, nil)
highlight("Title", theme.blue, nil, nil)
highlight("Visual", nil, theme.grey, nil)
highlight("EndOfBuffer", theme.brown_dark, theme.blue_default, nil)

highlight("Comment", theme.ash_grey, nil, theme.italic)
highlight("Constant", theme.green_bright, nil, nil)
highlight("String", theme.orange_light, nil, nil)
highlight("Character", theme.orange_light, nil, nil)
highlight("Number", theme.orange, nil, nil)
highlight("Boolean", theme.red, nil, nil)
highlight("Float", theme.orange, nil, nil)
highlight("Identifier", theme.cyan, nil, nil)
highlight("Function", theme.blue, nil, theme.italic)
highlight("Statement", theme.blue, nil, nil)
highlight("Conditional", theme.white_default, nil, nil)
highlight("Repeat", theme.white_default, nil, nil)
highlight("Label", theme.white_default, nil, nil)
highlight("Operator", theme.pink, nil, nil)
highlight("Keyword", theme.blue, nil, nil)
highlight("Exception", theme.green_bright, nil, nil)
highlight("PreProc", theme.pink, nil, nil)
highlight("Include", theme.pink, nil, nil)
highlight("Define", theme.pink, nil, nil)
highlight("Macro", theme.white_default, nil, nil)
highlight("PreCondit", theme.white_default, nil, nil)
highlight("Type", theme.green_bright, nil, nil)
highlight("StorageClass", theme.pink, nil, nil)
highlight("Structure", theme.white_default, nil, nil)
highlight("Typedef", theme.white_default, nil, nil)
highlight("Special", theme.white_default, nil, nil)
highlight("SpecialChar", theme.NONE, theme.NONE, theme.NONE)
highlight("Tag", theme.NONE, theme.NONE, theme.NONE)
highlight("Delimiter", theme.white_default, nil, nil)
highlight("SpecialComment", theme.NONE, theme.NONE, theme.NONE)
highlight("Debug", theme.NONE, theme.NONE, theme.NONE)
highlight("Underlined", theme.NONE, theme.NONE, theme.underline)
highlight("Ignore", theme.NONE, theme.NONE, theme.NONE)
highlight("Error", theme.red, nil, theme.bold)
highlight("Todo", theme.cyan, nil, theme.bold)
highlight("htmlTag", theme.ash_grey, nil, nil)
nvim.nvim_command("hi link htmlEndTag htmlTag")

highlight("jsStorageClass", theme.blue, nil, nil)
highlight("jsOperator", theme.pink, nil, nil)
highlight("jsArrowFunction", theme.pink, nil, nil)
highlight("jsString", theme.orange_light, nil, nil)
nvim.nvim_command("hi link jsCommet Comment")
nvim.nvim_command("hi link jsFuncCall Function")
highlight("jsNumber", theme.orange, nil, nil)
highlight("jsSpecial", theme.orange, nil, nil)
highlight("jsObjectProp", theme.cyan, nil, nil)
highlight("jsOperatorKeyword", theme.cyan, nil, nil)
highlight("jsBooleanFalse", theme.red, nil, nil)
highlight("jsBooleanTrue", theme.red, nil, nil)
highlight("jsRegexpString", theme.blue, nil, nil)
highlight("jsConditional", theme.pink, nil, nil)
nvim.nvim_command("hi link jsFunction Function")
highlight("jsReturn", theme.pink, nil, nil)
highlight("jsFuncName", theme.blue, nil, nil)
highlight("jsFuncParens", theme.white_default, nil, nil)
highlight("jsParensError", theme.red, nil, nil)
highlight("jsClassDefinition", theme.orange_light, nil, nil)
highlight("jsImport", theme.pink, nil, theme.italic)
highlight("jsFrom", theme.pink, nil, theme.italic)
highlight("jsModuleAs", theme.pink, nil, theme.italic)
highlight("jsExport", theme.cyan, nil, nil)
highlight("jsExportDefault", theme.cyan, nil, nil)
highlight("jsExtendsKeyword", theme.pink, nil, theme.italic)
highlight("javaScriptReserved", theme.blue, nil, nil)
highlight("javaScriptConditional", theme.pink, nil, nil)
highlight("javaScriptStringS", theme.orange_light, nil, nil)
highlight("javaScriptBoolean", theme.red, nil, nil)
highlight("javaScriptBraces", theme.white_default, nil, nil)
nvim.nvim_command("hi link javaScriptLineComment Comment")
highlight("javaScriptLineSpecial", theme.orange, nil, nil)
nvim.nvim_command("hi link javaScriptFunction Function")
highlight("javaScriptStatement", theme.pink, nil, nil)
highlight("javaScriptException", theme.green_bright, nil, nil)

highlight("scssSelectorName", theme.green_bright, nil, nil)
highlight("cssTagName", theme.red, nil, nil)
highlight("cssClassName", theme.green_bright, nil, theme.italic)
nvim.nvim_command("hi link cssClassNameDot cssClassName")
highlight("cssBraces", theme.white_default, nil, theme.italic)
highlight("cssPositioningProp", theme.cyan, nil, nil)
highlight("cssBoxProp", theme.cyan, nil, nil)
highlight("cssDimensionProp", theme.cyan, nil, nil)
highlight("cssTransitionProp", theme.cyan, nil, nil)
highlight("cssTextProp", theme.cyan, nil, nil)
highlight("cssFontProp", theme.cyan, nil, nil)
highlight("cssBorderProp", theme.cyan, nil, nil)
highlight("cssBackgroundProp", theme.cyan, nil, nil)
highlight("cssUIProp", theme.cyan, nil, nil)
highlight("cssIEUIProp", theme.red, nil, nil)
nvim.nvim_command("hi link scssFunctionName Function")
highlight("cssPositioningAttr", theme.red, nil, nil)
highlight("cssTableAttr", theme.red, nil, nil)
highlight("cssCommonAttr", theme.red, nil, nil)
highlight("cssColorProp", theme.cyan, nil, nil)
highlight("cssIncludeKeyword", theme.cyan, nil, nil)
highlight("cssKeyFrameSelector", theme.cyan, nil, nil)
highlight("cssPseudoClassId", theme.green_bright, nil, theme.italic)
highlight("cssBorderAttr", theme.red, nil, nil)
highlight("cssValueLength", theme.orange, nil, nil)
highlight("cssUnitDecorators", theme.yellow_light, nil, nil)
highlight("cssIdentifier", theme.yellow_dark, nil, theme.italic)

highlight("markdownHeadingDelimiter", theme.ash_grey, nil, nil)
highlight("markdownCodeDelimiter", theme.orange_light, nil, nil)
highlight("markdownCode", theme.white_light, nil, nil)
highlight("mkdCodeStart", theme.white_light, nil, nil)
highlight("mkdCodeEnd", theme.white_light, nil, nil)
highlight("mkdLinkDef", theme.cyan, nil, nil)
highlight("mkdCodeDelimiter", theme.ash_grey, theme.blue_default, nil)

highlight("htmlH1", theme.blue, nil, nil)
nvim.nvim_command("hi link htmlH2 htmlH1")
nvim.nvim_command("hi link htmlH3 htmlH1")
nvim.nvim_command("hi link htmlH4 htmlH1")
nvim.nvim_command("hi link htmlH5 htmlH1")
highlight("htmlBold", theme.cyan, nil, theme.bold)

nvim.nvim_command("hi link shComment Comment")
highlight("Sneak", theme.black, theme.pink, theme.bold)
highlight("SneakLabel", theme.black, theme.pink, theme.bold)

highlight("SignifySignAdd", theme.green_bright, nil, nil)
highlight("SignifySignDelete", theme.red, nil, nil)
highlight("SignifySignChange", theme.orange, nil, nil)

highlight("illuminatedWord", nil, theme.highligter, nil)

