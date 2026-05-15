vim.cmd 'highlight clear'
vim.cmd 'syntax off'
vim.g.colors_name = 'melange'

local bg = vim.opt.background:get()

-- package.loaded['melange/palettes/' .. bg] = nil -- Only needed for development
local palette = require('melange/palettes/' .. bg)

local a = palette.a -- Grays
local b = palette.b -- Bright foreground colors
local c = palette.c -- Foreground colors
local d = palette.d -- Background colors

for name, attrs in pairs {
  ---- :help highlight-default -------------------------------

  Normal = { fg = a.fg, bg = a.bg },
  NormalFloat = { bg = a.float },
  -- FloatBorder = { },
  FloatTitle = { fg = c.yellow, bg = a.float },
  FloatFooter = { fg = c.yellow, bg = a.float },
  -- NormalNC = {},

  -- Cursor = {},
  -- lCursor = {},
  -- CursorIM = {},
  -- TermCursor = {},

  ColorColumn = { bg = a.float },
  CursorColumn = 'ColorColumn',
  CursorLine = 'ColorColumn',
  WinSeparator = { fg = a.ui },

  LineNr = { fg = a.ui },
  CursorLineNr = { fg = c.yellow },

  Folded = { fg = a.com, bg = d.cyan },
  FoldColumn = 'LineNr',
  SignColumn = 'LineNr',

  Pmenu = 'NormalFloat',
  PmenuSel = { bg = a.sel },
  PmenuThumb = 'PmenuSel',
  PmenuMatch = { fg = b.yellow },
  PmenuMatchSel = { reverse = true },
  ComplMatchIns = { fg = a.com },
  WildMenu = 'NormalFloat',

  StatusLine = 'NormalFloat',
  StatusLineNC = { fg = a.com, bg = a.float },
  -- StatusLineTerm = {},
  -- StatusLineTermNC = {},
  TabLine = 'StatusLineNC',
  TabLineFill = 'StatusLine',
  TabLineSel = { bg = a.float },
  -- WinBar = {},
  -- WinBarNC = {},

  CurSearch = { fg = a.bg, bg = b.yellow },
  -- IncSearch = {},
  MatchParen = 'Substitute',
  Search = { fg = a.bg, bg = d.yellow },
  Substitute = { bg = d.red },
  Visual = { bg = a.sel },
  -- VisualNOS = {},

  Conceal = { fg = a.com },
  Whitespace = { fg = a.ui },
  -- EndOfBuffer = {},
  NonText = 'Whitespace',
  SpecialKey = 'Whitespace',

  Directory = { fg = c.fg },
  Title = { fg = c.yellow },
  ErrorMsg = { bg = d.red },
  ModeMsg = { fg = a.com },
  -- MsgArea = {},
  -- MsgSeparator = {},
  MoreMsg = { fg = c.green },
  WarningMsg = { fg = c.red },
  Question = 'MoreMsg',

  QuickFixLine = 'PmenuMatch',
  qfFileName = 'Directory',

  -- SnippetTabstop = {},

  ---- :help :diff -------------------------------------------

  DiffAdd = { bg = d.green },
  DiffChange = { bg = d.magenta },
  DiffDelete = { fg = a.com, bg = d.red },
  DiffText = 'DiffAdd',

  DiffAdded = 'DiffAdd',
  DiffRemoved = 'DiffDelete',

  ---- :help spell -------------------------------------------

  SpellBad = { fg = c.red, },
  SpellCap = { fg = c.blue, },
  SpellLocal = { fg = c.yellow, },
  SpellRare = { fg = b.yellow, },

  ---- :help group-name --------------------------------------

  Comment = { fg = a.com },
  Identifier = { fg = a.fg },
  Function = { fg = c.green, bg = c.greenbg },
  Constant = { fg = a.fg },
  String = { fg = b.red2, bg = b.redbg },
  Character = { fg = b.red2, bg = b.redbg },
  Number = { fg = b.magenta },
  Boolean = 'Number',

  Statement = { fg = c.blue2, bold = true },
  Operator = { fg = a.fg },

  PreProc = { fg = a.fg },
  Type = { fg = a.fg },

  Special = { fg = a.fg },
  Delimiter = { fg = a.com },
  -- SpecialComment = {},
  -- Debug = {},

  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },

  Ignore = { fg = a.ui },
  Error = { bg = d.red },
  Todo = { fg = a.com },

  ---- :help treesitter-highlight-groups  --------------------

  ['@variable'] = 'Identifier',
  ['@variable.builtin'] = 'Identifier',

  --- NOTE: Queries for these highlight groups are really hacky.
  --- Inaccurate syntax highlighting is worse than no highlighting at all,
  ['@constant'] = 'Identifier',
  ['@constant.builtin'] = '@constant',
  ['@constant.macro'] = '@constant',

  ['@module'] = 'Identifier',
  ['@module.builtin'] = '@module',
  ['@label'] = { fg = a.fg },

  ['@string.escape'] = { fg = b.red, bg = b.redbg },
  ['@character.printf'] = '@string.escape',
  ['@string.regexp'] = '@string',
  ['@punctuation.special'] = { fg = c.blue2, bold = true },

  ['@type.builtin'] = '@type',

  ['@function.macro'] = '@function',
  ['@function.call'] = { fg = a.fg },
  ['@function.method.call'] = { fg = a.fg },
  ['@function.builtin'] = { fg = a.fg },
  ['@constructor'] = '@function',

  -- ['@comment'] = {},
  ['@comment.documentation'] = { fg = a.com, nocombine = true },
  ['@comment.error'] = 'Todo',
  ['@comment.note'] = 'Todo',
  ['@comment.todo'] = 'Todo',
  ['@comment.warning'] = 'Todo',

  ['@markup.italic'] = { italic = true },
  ['@markup.strong'] = { bold = true },
  ['@markup.strikethrough'] = { strikethrough = true },
  ['@markup.underline'] = { underline = true },

  ['@markup.heading'] = 'Title',
  -- ['@markup.heading.1'] = {},
  ['@markup.heading.2'] = { fg = b.yellow },
  ['@markup.heading.3'] = { fg = b.green },
  -- ['@markup.heading.4'] = '@markup.heading',
  ['@markup.heading.5'] = '@markup.heading.2',
  ['@markup.heading.6'] = '@markup.heading.3',

  ['@markup.quote'] = 'Comment',
  ['@markup.math'] = '@markup.raw',

  ['@markup.link'] = { underline = true },
  -- ['@markup.link.label'] = {},
  ['@markup.link.url'] = '@string.special.url',

  ['@markup.raw'] = '@string.special',
  ['@markup.raw.block'] = { fg = a.com },

  ['@markup.list'] = 'Delimiter',
  -- ['@markup.list.checked'] = {},
  -- ['@markup.list.unchecked'] = {},

  ['@diff.plus'] = 'DiffAdd',
  ['@diff.minus'] = 'DiffDelete',
  ['@diff.delta'] = 'DiffChange',

  -- ['@tag'] = {},
  -- ['@tag.builtin'] = {},
  ['@tag.attribute'] = '@label',
  ['@tag.delimiter'] = 'Delimiter',

  ---- :help diagnostic-highlight ----------------------------

  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = b.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticUnderlineError = { underline = true, sp = c.red },
  DiagnosticUnderlineWarn = { underline = true, sp = b.yellow },
  DiagnosticUnderlineInfo = { underline = true, sp = c.blue },
  DiagnosticUnderlineHint = { underline = true, sp = c.cyan },
  DiagnosticUnderlineOk = { underline = true, sp = c.green },
  -- DiagnosticVirtualTextError = {},
  -- DiagnosticVirtualTextWarn = {},
  -- DiagnosticVirtualTextInfo = {},
  -- DiagnosticVirtualTextHint = {},
  -- DiagnosticVirtualTextOk = {},
  -- DiagnosticFloatingError = {},
  -- DiagnosticFloatingWarn = {},
  -- DiagnosticFloatingInfo = {},
  -- DiagnosticFloatingHint = {},
  -- DiagnosticFloatingOk = {},
  -- DiagnosticSignError = {},
  -- DiagnosticSignWarn = {},
  -- DiagnosticSignInfo = {},
  -- DiagnosticSignHint = {},
  -- DiagnosticSignOk = {},

  DiagnosticDeprecated = 'DiagnosticUnderlineError',
  DiagnosticUnnecessary = { undercurl = true, sp = a.com },

  ---- :help lsp-highlight -----------------------------------

  LspReferenceText = { bg = a.float, underline = true },
  -- LspReferenceRead = {},
  -- LspReferenceWrite = {},
  -- LspReferenceTarget = {},
  -- LspInlayHint = {},
  -- LspCodeLens = {},
  -- LspCodeLensSeparator = {},
  -- LspSignatureActiveParameter = {},

  ---- :help lsp-semantic-highlight --------------------------

  -- ['@lsp.type.class'] = {},
  -- ['@lsp.type.comment'] = {},
  -- ['@lsp.type.decorator'] = {},
  -- ['@lsp.type.enum'] = {},
  ['@lsp.type.enumMember'] = 'Constant',
  ['@lsp.type.function'] = {},
  ['@lsp.type.method'] = {},
  ['@lsp.typemod.function.declaration'] = "@function",
  ['@lsp.typemod.method.declaration'] = "@function",
  -- ['@lsp.type.interface'] = {},
  ['@lsp.type.macro'] = {},
  -- ['@lsp.type.method'] = {},
  ['@lsp.type.namespace'] = 'Directory',
  -- ['@lsp.type.number'] = {},
  -- ['@lsp.type.operator'] = {},
  ['@lsp.type.parameter'] = { fg = a.fg },
  -- ['@lsp.type.property'] = {},
  -- ['@lsp.type.struct'] = {},
  -- ['@lsp.type.type'] = {},
  -- ['@lsp.type.typeParameter'] = {},
  -- ['@lsp.type.variable'] = {},

  ['@lsp.typemod.comment.documentation'] = '@comment.documentation',
  -- ['@lsp.typemod.variable.functionScope'] = {},

  ---- netrw -------------------------------------------------

  -- netrwDir = 'Directory',
  netrwClassify = 'Delimiter',
  netrwTreeBar = 'Delimiter',
  netrwExe = { fg = c.red },
  netrwSymLink = { fg = c.magenta },

  ---- Markdown ----------------------------------------------

  markdownCode = '@markup.raw',
  markdownCodeBlock = '@markup.raw.block',

  ---- "lervag/vimtex" :h vimtex-syntax-reference ------------

  texOptSep = '@punctuation.delimiter',
  texOptEqual = 'Operator',
  texFileArg = 'Constant',
  -- texEnvArgName = 'PreCondit',
  texRefArg = 'Constant',
  texMathZone = '@markup.math',
  texMathDelimZone = 'Statement',
  texMathEnvArgName = 'texEnvArgName',
  texMathCmd = 'Function',
  texMathDelim = 'Delimiter',
  texMathSymbol = 'Operator',
  texItemLabelConcealed = '@label',

  ---- "echasnovski/mini.nvim" -------------------------------
  ---- https://github.com/echasnovski/mini.nvim/blob/main/CONTRIBUTING.md#list-of-highlight-groups

  -- MiniAnimateCursor = {},
  -- MiniAnimateNormalFloat = {},

  -- MiniClueBorder = {},
  -- MiniClueDescGroup = {},
  -- MiniClueDescSingle = {},
  -- MiniClueNextKey = {},
  -- MiniClueNextKeyWithPostkeys = {},
  -- MiniClueSeparator = {},
  -- MiniClueTitle = {},

  -- MiniCompletionActiveParameter = {},
  -- MiniCompletionInfoBorderOutdated = {},

  -- MiniCursorword = {},
  -- MiniCursorwordCurrent = {},

  MiniDepsChangeAdded = { link = 'DiffAdd' },
  MiniDepsChangeRemoved = { link = 'DiffDelete' },
  -- MiniDepsHint = {},
  -- MiniDepsInfo = {},
  -- MiniDepsMsgBreaking = {},
  -- MiniDepsPlaceholder = {},
  -- MiniDepsTitle = {},
  -- MiniDepsTitleError = {},
  -- MiniDepsTitleSame = {},
  -- MiniDepsTitleUpdate = {},

  MiniDiffSignAdd = { fg = c.green },
  MiniDiffSignChange = { fg = c.magenta },
  MiniDiffSignDelete = { fg = c.red },
  -- MiniDiffOverAdd = {},
  -- MiniDiffOverChange = {},
  -- MiniDiffOverChangeBuf = {},
  -- MiniDiffOverContext = {},
  -- MiniDiffOverContextBuf = {},
  -- MiniDiffOverDelete = {},

  -- MiniFilesBorder = {},
  -- MiniFilesBorderModified = {},
  MiniFilesCursorLine = 'PmenuSel',
  -- MiniFilesDirectory = {},
  -- MiniFilesFile = {},
  -- MiniFilesNormal = {},
  MiniFilesTitle = { fg = a.com, bg = a.float },
  -- MiniFilesTitleFocused = {},

  -- MiniHipatternsFixme = {},
  -- MiniHipatternsHack = {},
  -- MiniHipatternsNote = {},
  -- MiniHipatternsTodo = {},

  MiniIconsAzure = { fg = b.blue },
  MiniIconsBlue = { fg = c.blue },
  MiniIconsCyan = { fg = c.cyan },
  MiniIconsGreen = { fg = c.green },
  MiniIconsGrey = { fg = a.fg },
  MiniIconsOrange = { fg = d.yellow },
  MiniIconsPurple = { fg = c.magenta },
  MiniIconsRed = { fg = b.red },
  MiniIconsYellow = { fg = b.yellow },

  MiniIndentscopeSymbol = { fg = a.sel, nocombine = true },
  -- MiniIndentscopeSymbolOff = {},

  -- MiniJump = {},

  MiniJump2dSpot = { fg = c.magenta, bold = true, nocombine = true },
  MiniJump2dSpotAhead = { fg = c.cyan, bg = c.float, nocombine = true },
  -- MiniJump2dSpotUnique = {},
  -- MiniJump2dDim = {},

  -- MiniMapNormal = {},
  -- MiniMapSymbolCount = {},
  -- MiniMapSymbolLine = {},
  -- MiniMapSymbolView = {},

  -- MiniNotifyBorder = {},
  -- MiniNotifyNormal = {},
  -- MiniNotifyLspProgress = {},
  -- MiniNotifyTitle = {},

  -- MiniOperatorsExchangeFrom = {},

  -- MiniPickBorder = {},
  -- MiniPickBorderBusy = {},
  -- MiniPickBorderText = {},
  -- MiniPickCursor = {},
  MiniPickIconDirectory = { fg = b.cyan },
  -- MiniPickIconFile = {},
  -- MiniPickHeader = {},
  MiniPickMatchCurrent = { bg = a.sel },
  -- MiniPickMatchMarked = {},
  -- MiniPickMatchRanges = {},
  -- MiniPickNormal = {},
  -- MiniPickPreviewLine = {},
  -- MiniPickPreviewRegion = {},
  MiniPickPrompt = { fg = b.yellow, bg = a.float },
  -- MiniPickPromptCaret = {},
  -- MiniPickPromptPrefix = {},

  -- MiniSnippetsCurrent = {},
  -- MiniSnippetsCurrentReplace = {},
  -- MiniSnippetsCurrentFinal = {},
  -- MiniSnippetsCurrentUnvisited = {},
  -- MiniSnippetsCurrentVisited = {},

  -- MiniStarterCurrent = {},
  MiniStarterFooter = { fg = c.yellow },
  -- MiniStarterHeader = {},
  -- MiniStarterInactive = {},
  -- MiniStarterItem = {},
  -- MiniStarterItemBullet = {},
  MiniStarterItemPrefix = { fg = c.red },
  MiniStarterSection = { fg = c.green },
  MiniStarterQuery = { fg = c.blue },


  MiniTablineFill = { link = 'TabLineFill' },

  ---- "Saghen/blink.cmp" :h blink-cmp-config-appearance -----

  BlinkCmpLabelMatch = { fg = b.yellow, bold = true },
  BlinkCmpKindText = '@text',
  BlinkCmpKindMethod = '@method',
  BlinkCmpKindFunction = '@function',
  BlinkCmpKindConstructor = '@constructor',
  BlinkCmpKindField = '@field',
  BlinkCmpKindVariable = '@variable',
  BlinkCmpKindClass = '@type',
  BlinkCmpKindInterface = '@type',
  BlinkCmpKindModule = '@namespace',
  BlinkCmpKindProperty = '@property',
  BlinkCmpKindUnit = '@constant',
  BlinkCmpKindValue = '@constant',
  BlinkCmpKindEnum = '@field',
  BlinkCmpKindKeyword = '@keyword',
  BlinkCmpKindSnippet = '@string.special',
  BlinkCmpKindColor = '@constant',
  BlinkCmpKindFile = '@string.special.path',
  BlinkCmpKindReference = '@type',
  BlinkCmpKindFolder = '@string.special.path',
  BlinkCmpKindEnumMember = '@field',
  BlinkCmpKindConstant = '@constant',
  BlinkCmpKindStruct = '@type',
  BlinkCmpKindEvent = '@type',
  BlinkCmpKindOperator = '@operator',
  BlinkCmpKindTypeParameter = '@type',

  ---- "hrsh7th/nvim-cmp" :h cmp-highlight -------------------

  CmpItemAbbrMatch = { fg = b.yellow },
  CmpItemAbbrMatchFuzzy = { fg = b.yellow },
  CmpItemKindVariable = '@variable',
  CmpItemKindValue = '@constant',
  CmpItemKindUnit = '@constant',
  CmpItemKindTypeParameter = '@type',
  CmpItemKindText = '@text',
  CmpItemKindStruct = '@type',
  CmpItemKindSnippet = '@string.special',
  CmpItemKindReference = '@type',
  CmpItemKindProperty = '@property',
  CmpItemKindOperator = '@operator',
  CmpItemKindModule = '@namespace',
  CmpItemKindMethod = '@method',
  CmpItemKindKeyword = '@keyword',
  CmpItemKindInterface = '@type',
  CmpItemKindFunction = '@function',
  CmpItemKindFolder = '@string.special.path',
  CmpItemKindFile = '@string.special.path',
  CmpItemKindField = '@field',
  CmpItemKindEvent = '@type',
  CmpItemKindEnumMember = '@field',
  CmpItemKindEnum = '@type',
  CmpItemKindConstructor = '@constructor',
  CmpItemKindConstant = '@constant',
  CmpItemKindColor = '@constant',
  CmpItemKindClass = '@type',

  ---- "lewis6991/gitsigns.nvim" :h gitsigns-highlight-groups

  GitSignsAdd = 'MiniDiffSignAdd',
  GitSignsChange = 'MiniDiffSignChange',
  GitSignsDelete = 'MiniDiffSignDelete',
  GitSignsCurrentLineBlame = { fg = c.blue },

  ---- "lukas-reineke/indent-blankline.nvim" :h ibl.highlights

  IblIndent = 'MiniIndentscopeSymbol',
  IblWhitespace = 'IblIndent',
  -- IblScope = {},

  ---- "nvim-neo-tree/neo-tree.nvim" :h neo-tree-highlights

  NeoTreeFloatBorder = 'Normal',
  NeoTreeNormal = 'Pmenu',
  NeoTreeNormalNC = 'NeoTreeNormal',
  NeoTreeCursorLine = 'PmenuSel',
  NeoTreeWinSeparator = { fg = a.bg, bg = a.bg }, -- hide

  ---- "hiphish/rainbow-delimiters.nvim" :h rb-delimiters-colors

  RainbowDelimiterRed = { fg = b.red },
  RainbowDelimiterYellow = { fg = b.yellow },
  RainbowDelimiterBlue = { fg = b.blue },
  RainbowDelimiterOrange = { fg = c.yellow },
  RainbowDelimiterGreen = { fg = b.green },
  RainbowDelimiterViolet = { fg = c.magenta },
  RainbowDelimiterCyan = { fg = b.cyan },
} do
  if type(attrs) == 'table' then
    vim.api.nvim_set_hl(0, name, attrs)
  else
    vim.api.nvim_set_hl(0, name, { link = attrs })
  end
end

-- See https://github.com/neovim/neovim/pull/7406
vim.g.terminal_color_0 = a.float
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = a.com
vim.g.terminal_color_8 = a.ui
vim.g.terminal_color_9 = b.red
vim.g.terminal_color_10 = b.green
vim.g.terminal_color_11 = b.yellow
vim.g.terminal_color_12 = b.blue
vim.g.terminal_color_13 = b.magenta
vim.g.terminal_color_14 = b.cyan
vim.g.terminal_color_15 = a.fg

-- vi:nowrap
