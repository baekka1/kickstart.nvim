-- ~/.config/nvim/LuaSnip/tex.lua
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta

-- condition: only expand if file is empty & cursor on first line
local function at_top_of_new_file()
  return vim.fn.line '.' == 1 and vim.fn.line '$' == 1 and (vim.fn.getline(1):match '^%s*$' ~= nil)
end

return {
  s(
    { trig = 'header', name = 'LaTeX header', snippetType = 'autosnippet', condition = at_top_of_new_file },
    fmta(
      [[
\documentclass{article}

\usepackage{amsmath, amsxtra, verbatim}
\usepackage{amssymb, amsthm}
\usepackage{graphicx}
\usepackage[cmtip,all]{xy}
\usepackage{xypic}
\usepackage[notcite, notref]{showkeys}
\usepackage[colorlinks, linkcolor=blue]{hyperref}

\theoremstyle{definition}
\newtheorem{exercise}{Exercise}
\newtheorem{problem}{Problem}
\newtheorem*{solution}{Solution}
\newtheorem*{definition}{Definition}
\newtheorem{defins}{Definitions}
\newtheorem{example}{Example}
\newtheorem*{remark}{Remark}
\newtheorem*{note}{Note}
\newtheorem*{conjecture}{Conjecture}

\title{<title>}
\author{Katie Baek}
\date{\today}

\begin{document}

\maketitle

\section{Introduction}

\end{document}
]],
      {
        title = i(1, 'Title'),
      }
    )
  ),

  s('vb', {
    t '\\verb|',
    i(1),
    t '|',
  }),
}
