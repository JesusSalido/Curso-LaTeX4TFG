% !TEX root = master.tex
%%
%% Este es el fichero 'proyecto.cls' creado para realizar los
%% proyectos fin de carrera en latex
%% 
%% Modificar solo en caso de saber lo que se esta haciendo
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{proyecto}
              [2016/05/06 v1.0
 Clase basada en report]
\LoadClass[twoside,openright,12pt]{report}
%% paquetes 
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{latexsym}
\RequirePackage{fancyhdr} 
\RequirePackage[official,right]{eurosym}
\RequirePackage[spanish,es-noquoting,es-tabla]{babel}
\usepackage[svgnames]{xcolor}

% links
\usepackage[hyperfootnotes=false,colorlinks=true,linkcolor=gris,citecolor=gris,urlcolor=gris]{hyperref}

% dimensiones
\usepackage[a4paper,inner=35mm,outer=20mm,top=25mm,bottom=25mm,%
headsep=0.65cm,footskip=0.6cm]{geometry} 

% títulos de secciones e índice
\usepackage{titlesec}
\usepackage{titletoc}

% color gris 
\definecolor{gris}{gray}{.25}

% carpeta para ficheros gráficos
\graphicspath{{./graficos/}}

% ampliar espacio entre filas de las tablas
\renewcommand{\arraystretch}{1.3}


% Para evitar los overfull a toda costa  
\pretolerance=300
\tolerance=1000

% definiciones de titulo, autor, ... para la portada

\def\titulo#1{\global\def\maketitulo{#1}}
\def\numero#1{\global\def\makenumero{#1}}
\def\autor#1{\global\def\makeautor{#1}}
\def\director#1{\global\def\makedirector{#1}}
\def\fecha#1{\global\def\makefecha{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cabeceras

\fancyhfoffset{0mm}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{\color{black}\chaptername~\thechapter\ \ \protect\rule[2pt]{3pt}{3pt}\ \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\color{black}\thesection\ \ \protect\rule[2pt]{3pt}{3pt}\ \ #1}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\newcommand{\helv}{%
   \fontfamily{phv}\fontseries{r}\fontsize{9}{11}\selectfont}
\fancyhf{}
\fancyhead[O]{\helv\rightmark\hfill\thepage}
\fancyhead[E]{\helv\thepage\hfill\leftmark}


\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyhead{\helv\hfill\thepage} 
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% títulos de capítulos y secciones

\setcounter{secnumdepth}{5}

\titlespacing*{\chapter}      {0pt}{50pt}{30pt}
\titlespacing*{\section}      {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}   {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}   {0pt}{2.25ex plus 1ex minus .1ex}{1.ex plus .1ex}

% capítulos
\titleformat{\chapter}[display]
  {\sffamily\bfseries\Large}
  {\filleft\MakeUppercase{\chaptertitlename}\ \fboxsep5pt\colorbox{gris}{\Huge\sffamily\textcolor{white}{\thechapter}}}
  {4ex}
  {\titlerule
   \vspace{2ex}%
   \filcenter\MakeUppercase}
  [\vspace{2ex}\hrule\vspace{1pt}%
   \titlerule]


% secciones
\titleformat{\section}[block]
  {\normalfont\sffamily}%
{\noindent\hspace{0ex}\small\sffamily\fboxsep2pt\colorbox{black}{\textcolor{white}{\thechapter}}\hspace{.8ex}%
\fboxsep2pt\colorbox{gris}{\textcolor{white}{\arabic{section}}}}
{1em}{\titlerule\\*[.8ex]\bfseries}

% subsecciones
\titleformat{\subsection}
  {\normalfont\sffamily}
{\raisebox{.3ex}{{\noindent\hspace{.0ex}\scriptsize\sffamily\fboxsep2pt\colorbox{black}{\textcolor{white}{\arabic{chapter}}}%
\hspace{.6ex}\scriptsize\sffamily\colorbox{black}{\textcolor{white}{\arabic{section}}}%
\hspace{.6ex}\scriptsize\sffamily\colorbox{gris}{\textcolor{white}{\arabic{subsection}}}
}}}
{.5em}{\bfseries}

% subsubsecciones
\titleformat{\subsubsection}
  {\normalfont\sffamily}
{\raisebox{.3ex}{{\noindent\hspace{.0ex}\scriptsize\sffamily\fboxsep2pt\colorbox{black}{\textcolor{white}{\thechapter}}}%
		\hspace{.4ex}\scriptsize\sffamily\fboxsep2pt\colorbox{black}{\textcolor{white}{\arabic{section}}}%
		\hspace{.4ex}\scriptsize\sffamily\fboxsep2pt\colorbox{gris}{\textcolor{white}{\arabic{subsection}}}%
		\hspace{.4ex}\scriptsize\sffamily\fboxsep2pt\colorbox{gris}{\textcolor{white}{\arabic{subsubsection}}}
}}
{.8em}{\small\bfseries}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% índice de contenidos
\newlength{\anchocaja}
\newlength{\altocaja}

\titlecontents{chapter}
[0pt]{\addvspace{1pc}\sffamily}%
{\contentsmargin{0pt}%
\sffamily%
\settowidth{\anchocaja}{\Huge\sffamily\thecontentslabel}%
\settoheight{\altocaja}{\Huge\sffamily\thecontentslabel}%
\hspace*{15pt} \makebox[0pt][r]{\textcolor{gris}{%
\rule[-.4em]{1.45\anchocaja}{1.45\altocaja}}\hspace{10pt}}%
\makebox[0pt][r]{\textcolor{white}{\Huge \sffamily \thecontentslabel}\hspace{13pt}}%
\large\bfseries}
{\hspace{20pt}\large\bfseries}
{\ \dotfill\contentspage}
[\addvspace{.3pc}]


\contentsmargin{1.55em}
\titlecontents{section}
              [3.5em]
              {\addvspace{.2pc}\sffamily}
              {\contentslabel{2.3em}}
              {\hspace*{-2.3em}}
              {\dotfill\contentspage}
              [\addvspace{.07pc}]


\contentsmargin{1.55em}
\titlecontents{subsection}
              [5em]
              {\addvspace{.2pc}\sffamily}
              {\contentslabel{2.6em}}
              {\hspace*{2em}}
              {\dotfill\contentspage}
              [\addvspace{.05pc}]


\contentsmargin{1.55em}
\titlecontents{figure}
              [3.5em]
              {\addvspace{.2pc}\sffamily}
              {\contentslabel{2.3em}}
              {\hspace*{-2.3em}}
              {\dotfill\contentspage}
              [\addvspace{.07pc}]
              
              

\contentsmargin{1.55em}
\titlecontents{table}
              [3.5em]
              {\addvspace{.2pc}\sffamily}
              {\contentslabel{2.3em}}
              {\hspace*{-2.3em}}
              {\dotfill\contentspage}
              [\addvspace{.07pc}]              
   

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
\titlecontents{chapter}
[0pt]{\addvspace{1pc}\sffamily}%
{\contentsmargin{0pt}%
\sffamily%
\settowidth{\anchocaja}{\LARGE\sffamily\thecontentslabel}%
\settoheight{\altocaja}{\LARGE\sffamily\thecontentslabel}%
\hspace*{15pt} \makebox[0pt][r]{\textcolor{gris}{%
\rule[-.4em]{1.45\anchocaja}{1.45\altocaja}}\hspace{10pt}}%
\makebox[0pt][r]{\textcolor{white}{\LARGE \sffamily \thecontentslabel}\hspace{13pt}}%
\large\bfseries}
{\hspace{20pt}\large\bfseries}
{\ \dotfill\contentspage}
[\addvspace{.3pc}]
}

              

\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\bibname}{\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
