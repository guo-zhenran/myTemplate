\ProvidesClass{myPaper}

\LoadClass[11pt]{article}

% ========== Essential packages from myBook ==========
\usepackage{amsmath}      % Advanced math typesetting
\usepackage{amssymb}      % Math symbols
\usepackage{amsthm}       % Enhanced theorem environments

% ========== Color definitions ==========
\usepackage{xcolor}
\definecolor{ecolor}{RGB}{0,0,0}
\definecolor{python-purple}{RGB}{128,0,128}

% ========== Hyperref configuration ==========
\usepackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks,
  citecolor=python-purple,
  filecolor=python-purple,
  linkcolor=python-purple,
  urlcolor=python-purple,
  pdfencoding=unicode
}

% ========== Common formatting packages ==========
\usepackage{graphicx}     % Images
\usepackage{array}        % Enhanced table columns
\usepackage{booktabs}     % Professional tables
\usepackage{subcaption}
\usepackage{float}        % Floating environments
\usepackage{enumitem}     % Customisable lists
\usepackage{parskip}      % Paragraph spacing
\usepackage{ragged2e}     % Text alignment

% ========== Code listing support (optional but from myBook) ==========
\usepackage{listings}
\usepackage{tcolorbox}
\tcbuselibrary{listings, breakable}

\definecolor{python-blue}{RGB}{27,142,224}
\definecolor{python-red}{RGB}{186,33,33}
\definecolor{python-green}{RGB}{0,128,0}
\definecolor{python-black}{RGB}{0,0,0}
\definecolor{python-background}{RGB}{248,248,248}

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

% ========== Depth settings ==========
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

% ========== Theorem environments (enhanced with amsthm) ==========
% Redefine theorem styles to match myBook
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{axiom}{Axiom}[section]
\newtheorem{assumption}{Assumption}[section]
\newtheorem{hypothesis}{Hypothesis}[section]

\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{conjecture}{Conjecture}[section]
\newtheorem{example}{Example}[section]

\theoremstyle{remark}
\newtheorem{remark}{Remark}
\newtheorem{note}{Note}

% Proof environment from amsthm
\renewcommand{\proofname}{\normalfont\bfseries\color{ecolor} Proof}

% ========== Original myPaper content (preserved below) ==========
\usepackage{newpxtext}      % text font
\usepackage{newpxmath}      % math font
\usepackage{setspace}       % line spacing control

\usepackage[left=27.6mm, right=27.6mm, top=32.7mm, bottom=25.4mm]{geometry}
\usepackage{natbib}
\usepackage{appendix}

\linespread{1.6}
\usepackage{titling}

% ========== titling configuration (vertical centering) ==========
\pretitle{%
  \begin{center}
  \vspace*{\fill}
  \LARGE\bfseries
}
\posttitle{\par\end{center}\vskip 0.5em}

\preauthor{%
  \begin{center}
  \large\lineskip 0.2em
  \begin{tabular}[t]{c}
}
\postauthor{%
  \end{tabular}
  \par\end{center}
  \vskip 0.3em
}

\predate{%
  \begin{center}
  \large
}
\postdate{%
  \par\end{center}
  \vskip 0.5em
}

% Custom abstract command
\newcommand{\myAbstract}[1]{%
  \begin{center}
    \bfseries\large Abstract
  \end{center}
  \noindent #1
  \par\vspace{0.5em}
  \vspace*{\fill}
  \clearpage
}

\newcommand{\myUpdate}[1]{(See \href{#1}{#1} for updates.)}

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

\usepackage{titlesec}
\titleformat{\section}
 {\normalfont\LARGE\bfseries}
  {\thesection}
  {1em}
  {}

% Subsection formatting
\titleformat{\subsection}
  {\normalfont\Large\bfseries}
  {\thesubsection}
  {1em}
  {}

% Subsubsection formatting
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsubsection}
  {1em}
  {}

% Paragraph formatting
\titleformat{\paragraph}
  {\normalfont\normalsize\bfseries}
  {\theparagraph}
  {1em}
  {}

% Subparagraph formatting
\titleformat{\subparagraph}
  {\normalfont\normalsize\bfseries}
  {\thesubparagraph}
  {1em}
  {}

% Spacing around section titles (adjustable)
\titlespacing*{\section}
  {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}
  {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}
  {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}


\endinput