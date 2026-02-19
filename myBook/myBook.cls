\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myBook}[2024/07/10 Custom book class with math and code environments]

% Based on book class
\LoadClass[11pt]{book}

% ================ Font settings (PDFLaTeX compatible) ================
% Use newpx fonts
\usepackage{newpxtext}      % text font
\usepackage{newpxmath}      % math font

% Monospaced font configuration
\usepackage{courier}        % Use Courier as monospaced font

% ================ Page layout (using configuration from ptmt) ================
\usepackage[rmargin=3.85cm, lmargin=3.85cm, bmargin=4cm, tmargin=4cm]{geometry}

% ================ Solution to avoid package conflicts ================
% Load core math packages first to avoid later conflicts
\usepackage{amsmath}
\usepackage{amsfonts}

% Special handling for amsthm: release potentially conflicting commands before loading
\makeatletter
\@ifpackageloaded{amssymb}{}{
  \let\openbox\undefined
  \let\Bbbk\undefined
}
\makeatother

% Load amsthm but avoid redefining openbox
\RequirePackage{amsthm}

% Now safely load amssymb
\usepackage{amssymb}

% ================ Other basic packages ================
\usepackage{array}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{longtable}

% ================ Color definitions ================
\definecolor{ecolor}{RGB}{0,0,0}

% Python code colors
\definecolor{python-blue}{RGB}{27,142,224}
\definecolor{python-red}{RGB}{186,33,33}
\definecolor{python-green}{RGB}{0,128,0}
\definecolor{python-purple}{RGB}{128,0,128}
\definecolor{python-black}{RGB}{0,0,0}
\definecolor{python-background}{RGB}{248,248,248}

% ================ Theorem environment settings ================
% Custom theorem style
\newtheoremstyle{namedthm}
{3pt}
{3pt}
{\normalfont}
{}
{\bfseries}
{.}
{0.5em}
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}

\theoremstyle{namedthm}

% Define all theorem environments
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{axiom}{Axiom}[section]  % add axiom environment
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{conjecture}{Conjecture}[section]
\newtheorem{example}{Example}[section]
\theoremstyle{remark}
\newtheorem{remark}{Remark}
\newtheorem{note}{Note}
\newcommand\ebibname{Bibliography}
\newtheorem{case}{Case}

% ================ Theorem reference commands ================
\makeatletter

% Define a new label command that can accept a name
\newcommand{\namedlabel}[2]{%
  \label{#1}%
  \ifx\\#2\\%
  \else
    \expandafter\gdef\csname name@#1\endcsname{#2}%
  \fi
}

% Redefine reference commands
\newcommand{\thmref}[1]{%
  \@ifundefined{name@#1}{%
    \textbf{theorem~\ref{#1}}%
  }{%
    \textbf{theorem~\ref{#1}, \csname name@#1\endcsname}%
  }%
}

\newcommand{\propref}[1]{%
  \@ifundefined{name@#1}{%
    \textbf{proposition~\ref{#1}}%
  }{%
    \textbf{proposition~\ref{#1}, \csname name@#1\endcsname}%
  }%
}

\newcommand{\lemmaref}[1]{%
  \@ifundefined{name@#1}{%
    \textbf{lemma~\ref{#1}}%
  }{%
    \textbf{lemma~\ref{#1}, \csname name@#1\endcsname}%
  }%
}

\newcommand{\corref}[1]{%
  \@ifundefined{name@#1}{%
    \textbf{corollary~\ref{#1}}%
  }{%
    \textbf{corollary~\ref{#1}, \csname name@#1\endcsname}%
  }%
}

\newcommand{\axiomref}[1]{%
  \@ifundefined{name@#1}{%
    \textbf{axiom~\ref{#1}}%
  }{%
    \textbf{axiom~\ref{#1}, \csname name@#1\endcsname}%
  }%
}

\makeatother


% ================ Code environments ================
\usepackage{listings}
\usepackage{tcolorbox}
\tcbuselibrary{listings, breakable}

\lstdefinestyle{python-style}{
    basicstyle=\ttfamily\small\color{python-black},
    commentstyle=\color{python-green},
    keywordstyle=\color{python-blue},
    stringstyle=\color{python-red},
    showstringspaces=false,
    breaklines=true,
    frame=none,
    backgroundcolor=\color{python-background},
    numbers=left,
    numberstyle=\tiny\color{gray},
    numbersep=5pt,
    tabsize=4,
    language=Python
}

\newtcblisting{pythoncode}[1][]{
    colback=python-background,
    colframe=gray!50!black,
    listing only,
    listing options={style=python-style},
    breakable,
    #1
}

\newtcblisting{pythoncodenotitle}[1][]{
    colback=python-background,
    colframe=gray!50!black,
    listing only,
    listing options={style=python-style},
    breakable,
    title={},
    #1
}

\newtcbox{\pythoninline}{
    on line,
    boxrule=0.5pt,
    colback=python-background,
    colframe=gray!50!black,
    fontupper=\ttfamily\small\color{python-black},
    boxsep=2pt,
    left=2pt,
    right=2pt,
    top=1pt,
    bottom=1pt
}

\newtcbox{\pythoninlinenoframe}{
    on line,
    boxrule=0pt,
    colback=python-background,
    fontupper=\ttfamily\small\color{python-black},
    boxsep=2pt,
    left=2pt,
    right=2pt,
    top=1pt,
    bottom=1pt
}

% ================ Other packages ================
\usepackage[algoruled]{algorithm2e}
\usepackage[british]{babel}
\usepackage{booktabs}
\usepackage[2.0, compress]{bxpdfver}
\usepackage{csquotes}
\usepackage[onehalfspacing]{setspace}
\usepackage{enumitem}
\usepackage{fancyhdr}
\usepackage{float}
\usepackage[bottom, hang, symbol]{footmisc}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{mdframed}
\usepackage[babel=true, final]{microtype}
\usepackage{parskip}
\usepackage{ragged2e}
\usepackage{titlesec}
\usepackage{hyperref}
\usepackage{multirow}
\usepackage{pdfpages,tikz}
\usetikzlibrary{matrix, positioning}
\usepackage{nicematrix}
\usepackage{wrapfig}

% ================ Header and footer settings ================
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancyfoot{}
\fancyhead[LE, RO]{\thepage}
\fancyhead[LO, RE]{\normalfont\rightmark}
\renewcommand{\headrulewidth}{0.5pt}

% ================ Chapter format ================
\titleformat{\chapter}[display]
  {\bfseries\huge}
  {\filright \bf{\chaptertitlename} \Huge\thechapter}
  {1ex}
  {\titlerule\vspace{1ex}\filleft}
  [\vspace{1ex}\titlerule]

% ================ List settings ================
\setlist[itemize]{leftmargin=*, nosep, noitemsep}
\setlist[enumerate]{leftmargin=*, nosep, noitemsep, label=(\arabic*)}
\setlist{
  leftmargin=4em,
  itemindent=6pt,
  labelsep=0.5em,
  itemsep=2pt,
  parsep=2pt,
  topsep=2pt
}

% Special list for Case environment
\newlist{casenv}{enumerate}{4}
\setlist[casenv]{leftmargin=*,align=left,widest={iiii}}
\setlist[casenv,1]{label={{\itshape\ \casename} \arabic*.},ref=\arabic*}
\setlist[casenv,2]{label={{\itshape\ \casename} \roman*.},ref=\roman*}
\setlist[casenv,3]{label={{\itshape\ \casename\ \alph*.}},ref=\alph*}
\setlist[casenv,4]{label={{\itshape\ \casename} \arabic*.},ref=\arabic*}

% ================ Hyperlink settings ================
\hypersetup{
  pdfborder={0 0 0},
  colorlinks,
  citecolor=python-purple,
  filecolor=python-purple,
  linkcolor=python-purple,
  urlcolor=python-purple,
  bookmarks=true,
  frenchlinks=true,
  pdfencoding=unicode,
  pdftitle={Name of the Book},
  pdfauthor={First Author et al.},
  pdfsubject={computer science},
  pdfkeywords={computer science}
}

% ================ Depth settings ================
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

% ================ Custom commands ================
\newcommand{\undersign}{
    \begin{flushright}
        \vfill
        First Author {\normalfont\textit{\&}} Second Author
        \rmfamily\normalfont
    \end{flushright}
}

\newcommand{\diam}{\operatorname{diam}}
\newcommand{\cball}{\bar{\mathbb{B}}}
\newcommand{\oball}{\mathbb{B}}
\newcommand{\Int}[1]{\overset{\circ}{#1}}
\newcommand{\col}{\operatorname{Col}}
\newcommand{\row}{\operatorname{Row}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}

% ================ Proof environment adjustment ================
\renewcommand{\proofname}{\normalfont\bfseries\color{ecolor} Proof}

% ================ Theorem environment names ================
\providecommand{\casename}{Case}
\providecommand{\claimname}{Claim}
\providecommand{\conjecturename}{Conjecture}
\providecommand{\corollaryname}{Corollary}
\providecommand{\definitionname}{Definition}
\providecommand{\examplename}{Example}
\providecommand{\exercisename}{Exercise}
\providecommand{\factname}{Fact}
\providecommand{\lemmaname}{Lemma}
\providecommand{\problemname}{Problem}
\providecommand{\propositionname}{Proposition}
\providecommand{\remarkname}{Remark}
\providecommand{\solutionname}{Solution}
\providecommand{\theoremname}{Theorem}
\providecommand{\axiomname}{Axiom}  % add axiom name

% ================ Bibliography support ================
\usepackage{natbib}
% Default bibliography style
\providecommand{\bibstyleoption}{apalike}
\newcommand{\setbibstyle}[1]{\renewcommand{\bibstyleoption}{#1}}

\endinput