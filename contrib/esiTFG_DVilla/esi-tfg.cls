% -*- coding: utf-8 -*-

% esi-tfg.cls
%
% Copyright © 2013-2017 David Villa Alises
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esi-tfg}[2013/08/15 TFG de ESI]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\PassOptionsToClass{a4paper, 12pt, oneside, openright}{book}
\ProcessOptions\relax
\LoadClass{book}

\makeatletter

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\deactivatetilden  % FAQ-CervanTeX-6.html#ss6.7

%% -- Fundiciones
\renewcommand{\rmdefault}{ptm}   % times
\renewcommand{\sfdefault}{lmss}  % lmoderm sans sherif
\renewcommand{\ttdefault}{lmtt}  % lmoderm typewriter

\usepackage[htt]{hyphenat}
\usepackage{atbeginend}
\usepackage{xifthen}

\usepackage{enumitem}
\setlist{topsep=0pt, itemsep=0pt}
\newlist{definitionlist}{description}{1}
\setlist[definitionlist]{
  style = nextline,
}

% Las normas tipográficas que aparecen en los comentarios corresponden al libro:
% J. Martínez de Sousa. Ortografía y ortotipografía del español actual. Trea, 2008.

%% -- MEDIDAS Y DISTANCIAS -----------------------------------------------------
\usepackage[left=35mm, right=20mm, top=25mm, bottom=25mm]{geometry}
\usepackage{setspace}
\setlength{\parskip}{2mm plus 0.2mm minus 0.2mm}

%% Párrafos
% La indentación que precede al párrafo normal debe ser de un
% cuadratín (1em) (-> 13.4.1.1)
\parindent   = 1em

% El espacio en blanco al final de una línea corta debe ser mayor que
% la indentación del párrafo. (-> 13.4.1.1)
\parfillskip = 1.5em plus 1fil


%% -- GRÁFICOS -----------------------------------------------------------------
\usepackage{graphicx}
\usepackage{epsfig}
\graphicspath{{figures/}{/usr/share/arco/figures/}}

%% -- COLORES ------------------------------------------------------------------
\usepackage[table]{xcolor}
\definecolor{white}{gray}{1}
\definecolor{gray97}{gray}{0.97}
\definecolor{gray95}{gray}{0.95}
\definecolor{gray75}{gray}{0.75}
\definecolor{gray45}{gray}{0.45}
\colorlet{tabheadbg}{gray!25}
\colorlet{tabrowbg} {gray!12.5}

%% -- EPÍGRAFES ----------------------------------------------------------------
% \usepackage[font=footnotesize,
%             labelfont=sc,
%             format=hang, indention=-5mm,
%             width=.9\textwidth]{caption}

%% --  CUADROS -----------------------------------------------------------------
\usepackage{booktabs}
\usepackage{colortbl} % coloreado de cuadros

\newcommand{\tabheadformat}{\rowcolor{tabheadbg} \parbox[c][.4cm]{0pt}{}}
\newcommand{\tabfootformat}{\tabheadformat}
\newcommand{\tabhead}[1]{{\textscale{.8}{\textbf{#1}}}}
\newcommand{\tabfoot}[1]{#1}
\newcommand{\tabcolorrow}{\rowcolor{tabrowbg}}

% cebreado para cuadros
\newcommand{\myrowcolors}[1]{\rowcolors{#1}{tabrowbg}{}}
\AfterEnd{tabular}{\rowcolors{1}{}{}}
\AfterBegin{document}{\renewcommand\bibname{Referencias}}
\BeforeEnd{document}{\attributionArco}

%% -- LISTADOS DE CÓDIGO -------------------------------------------------------
\usepackage{listings}
\usepackage[scaled=.73]{beramono}
\renewcommand{\lstlistlistingname}{Índice de listados}
\renewcommand{\lstlistingname}{Listado}

% de tocbibind, para que el índice de listados aparezca en la ToC
\renewcommand{\lstlistoflistings}{%
  \begingroup
  \tocfile{\lstlistlistingname}{lol}
  \endgroup}

% \newcommand{\lstfont}{\ttfamily\fontfamily{pcr}}
\newcommand{\lstfont}{\ttfamily}

\lstset{%
     aboveskip          = 2mm,
     belowskip          = 2mm,
     %
     frame              = Ltb,
     framerule          = 0pt,
     framextopmargin    = 3pt,
     framexbottommargin = 3pt,
     framexleftmargin   = 0.4cm,
     framesep           = 0pt,
     rulesep            = .4pt,
     captionpos         = b,
     floatplacement     = htbp,
     %
     basicstyle         = \footnotesize\lstfont,
     showstringspaces   = false,
     commentstyle       = \color{gray45},
     keywordstyle       = \bfseries,
     %
     numbers            = none,
     stepnumber         = 1,
     numbersep          = 15pt,
     numberstyle        = \scriptsize,
     numberblanklines   = false,
     %
     breaklines         = true,
   }

\lstnewenvironment{listing}[1][]
   {\pagebreak[3]\singlespacing\lstset{#1}}%
   {\pagebreak[3]}

\lstdefinestyle{consoleStyle}{
  basicstyle=\scriptsize\bf\lstfont,
  backgroundcolor=\color{gray75},
  numbers=none,
}

\lstnewenvironment{console}[1][]
   {\pagebreak[0]\lstset{style=consoleStyle,#1}}
   {\pagebreak[0]}



%% -- ACRÓNIMOS Y GLOSARIO -----------------------------------------------------
\usepackage[printonlyused]{acronym}

\renewcommand*{\acsfont}[1]{\textsc{\textscale{.85}{#1}}} % enunciado del acrónimo: OO
\renewcommand*{\acfsfont}[1]{#1}
\renewcommand*{\acffont}[1]{#1}

% imprime: "Object Oriented (OO)"
\newcommand{\acx}[1]{\acused{#1}\acs{#1} %
  \nolinebreak[3] %
  (\acl{#1})}

\newcommand{\Acro}[2]{\acro{#1}{#2}\acused{#1}}
\newcommand{\sigla}[1]{\textsc{\textscale{.85}{#1}}}


%% -- HIPER-ENLACES PARA PDF ---------------------------------------------------
\usepackage[%
    bookmarks,
    hyperfootnotes = false,
    pdfview        = {fitv},
    hidelinks      = true,
    colorlinks,
    linkcolor      = black,
    citecolor      = black,
    urlcolor=      = black,
    % backref, % debug: refs desde la bibliografía
    ]{hyperref}

\hypersetup{
  pdftitle   = {\@title},
  pdfauthor  = {\@author},
  pdfsubject = {Trabajo Fin de Grado},
}

% -- urls
% https://www.joachim-breitner.de/blog/archives/519-guid.html
\let\UrlSpecialsOld\UrlSpecials
\def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\_{\Url@underscore}}%
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.2em}%
    {\kern-.0em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
\def\Url@underscore{\nfss@text{\leavevmode \kern.06em\vbox{\hrule\@width.3em}}}
\let\urlOld\url


%% -- BIBLIOGRAFÍA -------------------------------------------------------------
\bibliographystyle{es-alpha}

\newcommand{\bibfont}{\small}      % Bibliography's font size
%% \setlength{\bibhang}{4ex}       % Indent of Bibliography entries
%% \setlength{\bibsep}{3pt}

% añadir listados, bibliografia, etc a la tabla de contenido
\usepackage{tocbibind}


%% -- FORMATO DE CAPÍTULOS Y SECCIONES -----------------------------------------
\usepackage[rigidchapters, clearempty, pagestyles]{titlesec}
% - rigidchapters: Todos los títulos de capítulo tienen la misma altura
% - clearempty: Elimina encabezados y pies de páginas (izquierdas) vacías.

\newcommand{\chapterformat}[1]{%
  \fontsize{22}{22}\selectfont\sffamily #1%
}

% doc: \titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before }[ after ]

\titleformat{\section}
  {\normalfont\fontsize{15.0pt}{1em}\selectfont\bfseries}{\thesection}{.7em}{}
\titleformat{\subsection}
  {\normalfont\fontsize{13.5pt}{1em}\selectfont\bfseries}{\thesubsection}{1em}{}

%-- standard definitions
% \titleformat{\subsubsection}
%   {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
% \titleformat{\paragraph}[runin]
%   {\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
% \titleformat{\subparagraph}[runin]
%   {\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}


\newcommand{\frontchapterformat}{
  \titleformat{\chapter}[display]%
    {}
    {}
    {0mm}
    {\chapterformat}

  \titlespacing{\chapter}{0cm}{2cm}{2cm}
}

\let\frontmatterorig\frontmatter
\renewcommand{\frontmatter}{
  \frontmatterorig
  \singlespacing
  \pagestyle{mainstyle}
  \frontchapterformat
}

\newcommand{\mainchapterformat}{
  \titleformat{\chapter}[display]
    {\normalfont\large\sffamily}
    {\chaptertitlename\ \thechapter}
    {0mm}
    {\chapterformat}

  \titlespacing{\chapter}{0cm}{1cm}{3.8cm}
}

\let\mainmatterorig\mainmatter
\renewcommand{\mainmatter}{
  \cleardoublepage
  \mainmatterorig
  \onehalfspacing
  \pagestyle{mainstyle}
  \mainchapterformat
  \cleardoublepage
}

\newcommand{\backchapterformat}{
  \mainchapterformat
}

\let\backmatterorig\backmatter
\renewcommand{\backmatter}{
  % \backmatterorig
  \pagestyle{backstyle}
  \backchapterformat
  \cleardoublepage
}

% espaciado entre secciones, subseciones, etc.
% doc: \titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]
\titlespacing{\section}{0pt}{5mm}{0mm}
\titlespacing{\subsection}{0pt}{4mm}{-1mm}
\titlespacing{\subsubsection}{0pt}{4mm}{-1mm}


%% -- ESTILO DE PÁGINA, ENCABEZADOS Y PIES -------------------------------------
\newcommand{\UCLMhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-1.3,-1.42){
      \includegraphics[height=3cm]{uclm_logomarca_1.pdf}}
  \end{picture}
}

\newcommand{\ESIhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-4,-1.5){
      \includegraphics[height=1.6cm]{esi.pdf}}
  \end{picture}
}

\newpagestyle{firstpage}[\small\sffamily]{
  \sethead{\UCLMhead{}} %
          {} %
          {\ESIhead{}}
}

\newpagestyle{mainstyle}[\small\sffamily]{
  \sethead[\thechapter.\ \textsc{\chaptertitle}][][]{}{}{\textsc{\sectiontitle}}
  \setfoot{}{\thepage{}}{}
}

\newpagestyle{backstyle}{
  \sethead{}{}{}
  \setfoot{}{\thepage{}}{}
}

\addtolength{\footskip}{8pt}


%% -- Otros paquetes
\usepackage{relsize}  % tamaños relativos para el texto


%% -- VARIABLES DEL PAQUETE ----------------------------------------------------
\usepackage{etoolbox}

\newcommand{\@authortitle}{}
\renewcommand{\author}[2]{%
  \renewcommand{\@author}{#1}
  \renewcommand{\@authortitle}{#2}}
\newcommand{\theauthor}{\@author}

\newcommand{\@putAuthor}{
  Autor: \@author\par}

\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\@city}{Ciudad Real}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand{\@country}{Spain}
\newcommand{\country}[1]{\renewcommand{\@country}{#1}}
\newcommand{\phone}[1]{\newcommand{\@phone}{#1}}
\newcommand{\email}[1]{\newcommand{\@email}{#1}}
\newcommand{\@homepage}{}
\newcommand{\homepage}[1]{\renewcommand{\@homepage}{#1}}

\newcommand{\@intensification}{}
\newcommand{\intensification}[1]{%
  \renewcommand{\@intensification}{#1}}

\newcommand{\@advisor}{}
\newcommand{\@advisortitle}{}
\newcommand{\advisor}[2]{%
  \renewcommand{\@advisor}{#1}
  \renewcommand{\@advisortitle}{#2}}

\newcommand{\@advisorFirst}{}
\newcommand{\advisorFirst}[1]{%
  \renewcommand{\@advisorFirst}{#1}}
\newcommand{\@putAdvisorFirst}{Tutor académico: \@advisorFirst\par}

\newcommand{\@advisorSecond}{}
\newcommand{\advisorSecond}[1]{%
  \renewcommand{\@advisorSecond}{#1}}
\newcommand{\@putAdvisorSecond}{
  \ifdefempty{\@advisorSecond}{}{
  Coautor académico: \@advisorSecond\par}}

\newcommand{\@advisorDepartment}{}
\newcommand{\advisorDepartment}[1]{\renewcommand{\@advisorDepartment}{#1}}

\newcommand{\@docmonth}{}
\newcommand{\@docyear}{}
\newcommand{\docdate}[2]{%
  \renewcommand{\@docyear}{#1}
  \renewcommand{\@docmonth}{#2}}


\newcommand{\@license}{%
  \begin{minipage}{1.1\textwidth}
    \begin{singlespace}
      Permission is granted to copy, distribute and/or modify this
      document under the terms of the GNU Free Documentation License,
      Version 1.3 or any later version published by the Free Software
      Foundation; with no Invariant Sections, no Front-Cover Texts,
      and no Back-Cover Texts.  A copy of the license is included in
      the section entitled \hyperlink{chap:GFDL}{"GNU Free
        Documentation License"}.

      \smallskip
      Se permite la copia, distribución y/o modificación de este
      documento bajo los términos de la Licencia de Documentación
      Libre GNU, versión 1.3 o cualquier versión posterior publicada
      por la \emph{Free Software Foundation}; sin secciones
      invariantes. Una copia de esta licencia esta incluida en el
      apéndice titulado \hyperlink{chap:GFDL}{«GNU Free Documentation
        License»}.

    \smallskip
    Muchos de los nombres usados por las compañías para diferenciar
    sus productos y servicios son reclamados como marcas
    registradas. Allí donde estos nombres aparezcan en este documento,
    y cuando el autor haya sido informado de esas marcas registradas,
    los nombres estarán escritos en mayúsculas o como nombres propios.
  \end{singlespace}
  \end{minipage}
}
\newcommand{\license}[1]{\renewcommand{\@license}{#1}}



%% -- PÁGINAS ESPECIALES

\newcommand{\cover}{%
  \begin{center}
    \fontsize{60}{22}\selectfont
    \thispagestyle{empty}
    \Large \bfseries
    \setstretch{1.3}

    \vspace*{\stretch{6}}
    \includegraphics[width=4.1cm]{esi_logo.pdf}

    \vspace*{\stretch{6}}

    UNIVERSIDAD DE CASTILLA-LA MANCHA
    \vspace*{\stretch{1}}
    ESCUELA SUPERIOR DE INFORMÁTICA

    \vspace*{\stretch{2}}
    GRADO EN INGENIERÍA EN INFORMÁTICA

    % \vspace*{\stretch{2}}
    % \begin{spacing}{0.9}
    %  {\normalsize TECNOLOGÍA ESPECÍFICA DE\\\MakeUppercase{\@intensification}}
    % \end{spacing}

    % \vspace*{\stretch{3}}
    % TRABAJO FIN DE GRADO

    \vspace*{\stretch{4}}
    {\LARGE \@title}

    \vspace*{\stretch{2}}
    {\large \@author}

    \vspace*{\stretch{4}}
  \end{center}

  \vfill
  \hfill
  {\large \textbf{\@docmonth, \@docyear}}
  \vspace{\stretch{1}}
  \cleardoublepage
}

% - portadilla
% Sólo aparece el título de la obra a la misma altura, fuente y estilo
% que en la portada pero en un tamaño 2/3 el de ésta. Opcionalmente
% puede aparecer el autor.
\newcommand{\bastardtitle}{%
  \thispagestyle{empty}
  \vspace*{\stretch{8}}%
  \begin{center}%
    {\large \textsc{\@title}}
    \par
  \end{center}%
  \vspace*{\stretch{2.3}}%
  \cleardoublepage
}

\newcommand{\frontpage}{%
  \thispagestyle{empty}
  \begin{center}
    \Large \bfseries
    \setstretch{1.3}

    \vspace*{2cm}
    \includegraphics[width=4.1cm]{esi_logo.pdf}

    \vspace{1.2cm}

    \begin{spacing}{1.09}
    UNIVERSIDAD DE CASTILLA-LA MANCHA
    ESCUELA SUPERIOR DE INFORMÁTICA
    \end{spacing}

    \vspace{0.4cm}

    \@advisorDepartment

    \vspace*{\stretch{6}}

    GRADO EN INGENIERÍA EN INFORMÁTICA

    \begin{spacing}{0.9}
      {\normalsize \MakeUppercase{\@intensification}}
    \end{spacing}

    \vspace*{\stretch{6}}
    {\LARGE \@title}
  \end{center}

  \vspace*{\stretch{7}}

  {\large \bfseries
    \@putAuthor
    \@putAdvisorFirst
    \@putAdvisorSecond
  }

  \vspace*{\stretch{4}}

  \vfill
  \hfill
  {\large \@docmonth, \@docyear}
  \cleardoublepage
}

\newcommand{\dedication}[1]{%
  \cleardoublepage
  \null\vspace{\stretch{1}}
  \begin{flushright}
    \textit{#1}
  \end{flushright}
  \vspace{\stretch{2}}\null
  \cleardoublepage
}


\newcommand{\copyrightpage}{%
  \newpage
  \begin{singlespace}
    \null \vfill \noindent
    \textbf{\@author} \par
    \smallskip \noindent
    \@city\ -- \@country

    \vspace{-1cm}
    \begin{tabbing}
      \hspace*{1.7cm} \= \\
      \ifdefempty{\@email}   {}{\emph{E-mail:}   \> \@email \\}
      \ifdefempty{\@phone}   {}{\emph{Teléfono:} \> \@phone \\}
      \ifdefempty{\@homepage}{}{\emph{Web site:} \> \url{\@homepage} \\}
    \end{tabbing}
    \vspace{-1cm}
    \noindent
    \copyright\ \number\@docyear\ \ \@author \par
    \smallskip \noindent
    \begin{minipage}{0.8\textwidth} \raggedright \footnotesize
      \@license
    \end{minipage}
  \end{singlespace}
  \cleardoublepage
}


\newcommand{\jury}{%
  \vspace*{2cm}
  \noindent\underline{\textbf{{\Large TRIBUNAL:}}}
  \vspace{1.3cm}
  \par
  \textbf{{\large Presidente:}} \\ \par
  \textbf{{\large Vocal:}} \\ \par
  \textbf{{\large Secretario:}} \\ \par
%  \textbf{{\large Vocal 2:}} \\ \par
  \vspace{2.5cm}
  \noindent\underline{\textbf{{\Large FECHA DE DEFENSA:}}} \par
  \vspace{2.2cm}
  \noindent\underline{\textbf{{\Large CALIFICACIÓN:}}} \par
  \vspace{3.6cm}
  \textbf{PRESIDENTE \hfil\hspace{0.5cm} VOCAL \hfil\hspace{1.2cm} SECRETARIO} \par
  \vspace{3.1cm}
  Fdo.: \hfil Fdo.: \hfil Fdo.: \par
}

\addto\captionsspanish{\renewcommand{\appendixname}{Anexo}}

\newcommand{\appendixtitle} {
  \cleardoublepage
  \thispagestyle{backstyle}
  \vspace*{5cm}%
  \begin{center}%
    \sffamily\scshape\Large\scalebox{3}{ANEXOS}%
  \end{center}%
}%

% http://tex.stackexchange.com/a/237251/27822
% \def\versiondate{\leavevmode\hbox{0.\the\year\twodigits\month\twodigits\day}}
\def\versiondate{0.20181017}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}

\newcommand{\attributionArco} {
  \cleardoublepage
%  \pagestyle{empty}
  \null\vfill
  \rule{0pt}{8cm}
  \begin{singlespacing}
  \begin{center}
    Este documento fue editado y tipografiado con \LaTeX{} empleando\\
    la clase \textbf{esi-tfg} {\small (versión \versiondate)} que se puede encontrar en:\\
    \url{https://bitbucket.org/esi_atc/esi-tfg}

    \bigskip
    {\scriptsize [respeta esta atribución al autor]}
  \end{center}
  \end{singlespacing}
  \cleardoublepage
}


%% -- símbolos
\usepackage{pifont}
\usepackage{tipa}


%% -- letras capitales
\usepackage{lettrine}
\newcommand{\drop}[2]{%
  \lettrine[lines=2,findent=2pt,nindent=3pt,loversize=0.1]% lhang=0.33
  {\textcolor[gray]{0.4}{#1}}{#2}%
  }


\AtBeginDocument{
  % separación entre filas en los cuadros
  \setlength{\extrarowheight}{1pt}
}


%% -- Algunos comandos útiles
\newcommand{\quoteauthor}[1]{\par\hfill#1\hspace{1em}\mbox{}}
\newcommand{\FIXME}[1]{\noindent\textcolor{red}{\textbf{FIXME:} #1}}
\newcommand{\FIXED}[1]{\noindent\textcolor{green}{\textbf{FIXED:} #1}}

%\makeatother
