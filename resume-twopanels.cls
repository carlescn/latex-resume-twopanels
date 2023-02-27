%--------------------------------------------------------------------------------%
% TEMPLATE FOR A RESUME WITH TWO PANELS
% For use with the file resume-template.tex provided in the same GitHub repository
% Author: Carles Criado Ninà
% E-mail: carlesbioinformatics@gmail.com
%--------------------------------------------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-twopanels}[Resume with two panels]


%--------------------------------------------------------------------------------%
% Parse options
%--------------------------------------------------------------------------------%

% If option "color" is passed, name and titles will be in contrasting color
\RequirePackage{ifthen}
\newboolean{usecolor}
\setboolean{usecolor}{False}
\DeclareOption{color}{
    \setboolean{usecolor}{True}
}
\ProcessOptions\relax


%--------------------------------------------------------------------------------%
% Load packages and define options
%--------------------------------------------------------------------------------%

\LoadClass{article}
\RequirePackage[utf8]{inputenc} % utf8x breaks package hyperref

% Document structure
    \RequirePackage[a4paper]{geometry} % A4: 210 mm x 297 mm

    % Set all margins, padding, etc. to zero
    \geometry{margin=0pt}           % document magins
    \setlength{\parindent}{0pt}     % paragraph indentation
    \renewcommand{\arraystretch}{0} % table vertical padding
    \setlength{\tabcolsep}{0pt}     % table horizontal padding

    % Set the sizes for the base structure
    \newcommand{\topheight}{35mm}
    \newcommand{\mainheight}{\dimexpr \textheight - \topheight}
    \newcommand{\leftwidth}{75mm}
    \newcommand{\rightwidth}{\dimexpr \textwidth - \leftwidth}


% Graphics
    \RequirePackage[dvips]{graphicx} % provides \graphicspath, \includegraphics
    % Set the folders to look for images:
    \graphicspath{{assets/}{photos/}}


% Colors
    \RequirePackage[usenames,dvipsnames]{xcolor} % provides color names
    \RequirePackage{sectsty} % provides \paragraphfont

    % Custom color palettes:
    % Sepia and aqua
    %    \definecolor{dark}  {HTML} {434242}
    %    \definecolor{clear} {HTML} {F3EFE0}
    %    \definecolor{color} {HTML} {22A39F}

    % Dark blue and orange
    \definecolor{dark}  {HTML} {2C394B}
    \definecolor{clear} {HTML} {FFFFFF}
    \definecolor{color} {HTML} {FF4C29}

    % Set background color
    \pagecolor{dark}

    % Set name and titles color depending on boolean usecolor
    \ifthenelse{\boolean{usecolor}}{
        \newcommand{\customparagraphcolor}{\color{color}}
    }{
        \colorlet{color}{clear}
        \newcommand{\customparagraphcolor}{}
    }


% Fonts
    % Text font
    \renewcommand{\rmdefault}{qhv} % TEX Gyre Heros (Helvetica-like)
    % Titles font:
    \paragraphfont{\fontfamily{qcs}\selectfont \customparagraphcolor \large \uppercase} % TEX Gyre Schola


% Tables
    \RequirePackage{colortbl} % provides \cellcolor


% Lists
    \RequirePackage{enumitem} % provides options in the itemize environment
    \setlist{topsep=1em}

% Links
    \RequirePackage{url} % provides \url
    \RequirePackage[hidelinks]{hyperref} % provides \hyperref


%--------------------------------------------------------------------------------%
% Custom environments and commands
%--------------------------------------------------------------------------------%

\newenvironment{resume}{%
    \thispagestyle{empty}%
    \begin{tabular}{p{\leftwidth} p{\rightwidth}}%
    }{%
    \end{tabular}%
}

\newenvironment{leftpanel}{%
    \begin{minipage}[t][\mainheight][t]{\leftwidth}%
        \color{clear}%
        \vspace{7mm}%
        \hspace{5mm}%
        \begin{minipage}[t][\dimexpr \mainheight - 22mm][s]{\dimexpr \linewidth - 12mm}%
        }{%
        \end{minipage}
    \end{minipage}%
}

\newenvironment{rightpanel}{%
    \begin{minipage}[t][\mainheight][t]{\rightwidth}%
        \cellcolor{clear}%
        \color{dark}%
        \vspace{7mm}%
        \hspace{5mm}%
        \begin{minipage}[t][\dimexpr \mainheight - 22mm][s]{\dimexpr \linewidth - 15mm}%
        }{%
        \end{minipage}%
    \end{minipage}%
}


\newcommand{\printheader}[3]{%
%    Aruguments:
%    #1: Name
%    #2: Job
%    #3: Image file
    \begin{minipage}[t][\topheight][b]{\leftwidth}%
        \centering%
        \includegraphics[width=3cm]{#3}%
    \end{minipage}%
    & %
    \begin{minipage}[t][\topheight][c]{\rightwidth}%
        {\color{color}%
        \fontfamily{qcs}\selectfont%
        \Huge%
        \bfseries%
        \scshape%
        #1}%

        \vspace{1em}%
        {\color{clear}%
        \fontfamily{qcs}\selectfont%
        \Large%
        #2}%
    \end{minipage}%
    \\%
}

\newcommand{\resumeitem}[4]{%
%    Aruguments:
%    #1: Title
%    #2: Date
%    #3: Institution
%    #4: Description (optional: pass an empty string as {})
    \item%
    \textbf{#1} {(#2)}\newline%
    {#3}%
    \ifthenelse{\equal{#4}{}}{%
        % Nothing
    }{%
        \newline%
        \small%
        \textsl{#4}%
    }%
}

\newcommand{\contactitem}[2]{%
%    Aruguments:
%    #1: Image
%    #2: Text
    \item[\raisebox{-0.3em}{\includegraphics[width=1.2em]{#1}}] #2%
}