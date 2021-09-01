\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{valbonne}[2020/08/12 Valbonne LaTeX class]

% Mis à jour par Matthieu PIQUEREZ en 2020
% Vous pouvez m'envoyer un mail à matthieu.piquerez@animath.fr si vous avez des questions (bien que je ne comprends pas tout dans ce fichier)

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\newif\ifpoly
\polyfalse

\DeclareOption{poly}{\polytrue}

\newif\iftrombi
\trombifalse

\DeclareOption{trombi}{\trombitrue}

\newif\ifsolutions
\solutionstrue

\DeclareOption{nosol}{\solutionsfalse}

\ifpoly
\solutionstrue
\fi
\ProcessOptions\relax

\LoadClass[\@@ptsize]{book}

\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{array}
% \RequirePackage{auto-pst-pdf}
\RequirePackage[french]{babel}
\RequirePackage{bbm}
\RequirePackage{comment}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{epsfig}
\RequirePackage{etex}
% \RequirePackage{eulervm}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{framed}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper,left=19mm,right=19mm,top=26mm,bottom=33mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{ifpdf}
\RequirePackage{import}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes} % loaded after inputenc
\RequirePackage{intcalc}
\RequirePackage{mathrsfs}
\RequirePackage{memhfixc}
\ifpoly % évite tout un tas de warning
\RequirePackage{minitoc}
\fi
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{palatino}
\RequirePackage{pdfpages}
\RequirePackage{pgf}
\RequirePackage{pifont}
\RequirePackage{psvectorian}
\RequirePackage{stmaryrd}
\RequirePackage{tikz}
\RequirePackage{tkz-euclide}
\RequirePackage{titlesec}
\RequirePackage{url}
\RequirePackage{verbatim}
\RequirePackage{wasysym}
\RequirePackage{xargs}
\RequirePackage{xcolor}
\RequirePackage[all]{xy}
\RequirePackage{yhmath}

\ifpdf
  \RequirePackage[pdftex]{thumbpdf}
  \RequirePackage[pdftex,                %
    bookmarks         = true,%     % Signets
    bookmarksnumbered = true,%     % Signets numérotés
    pdfpagemode       = None,%     % Signets/vignettes fermé à l'ouverture
    pdfstartview      = FitH,%     % La page prend toute la largeur
    pdfpagelayout     = OneColumn, % Vue par page
    colorlinks        = true,%     % Liens en couleur
    linkcolor         = blue,
    urlcolor          = magenta,%  % Couleur des liens externes
    pdfborder         = {0 0 0}%   % Style de bordure : ici, pas de bordure
    ]{hyperref}%
\else
  \RequirePackage{hyperref}
  \hypersetup{ colorlinks=falses }
\fi

\usetikzlibrary{arrows}
\usetikzlibrary{automata}
\usetikzlibrary{calc}
\usetikzlibrary{shapes}
\usetikzlibrary{positioning}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% STYLE DE PAGES POUR POLY %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}

\setlength{\headheight}{14.6663pt}

\fancyhead[L]{\leftmark}
\fancyhead[R]{\rightmark}
\lfoot[\large{ \fontfamily{pzc} \selectfont\thepage}]{}
\rfoot[]{\large{ \fontfamily{pzc} \selectfont\thepage}}
\cfoot{}

\renewcommand{\chaptermark}[1]{ \markboth{ \large{\fontfamily{pzc} \selectfont \chaptername \, \thechapter. \, #1}} {}}
\renewcommand{\sectionmark}[1]{\markright{ \large{\fontfamily{pzc} \selectfont \thesection.\, #1}}}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\assignpagestyle{\chapter}{fancy}

\fancypagestyle{plain}{%
\fancyhead[L]{\leftmark}
\fancyhead[R]{\rightmark}
\lfoot[\large{ \fontfamily{pzc} \selectfont\thepage}]{}
\rfoot[]{\large{ \fontfamily{pzc} \selectfont\thepage}}
\cfoot{}
}

\fancypagestyle{trombi}{%
\fancyhead[L]{}
 \fancyhead[R]{}
\lfoot[\large{ \fontfamily{pzc} \selectfont\thepage}]{}
\rfoot[]{\large{ \fontfamily{pzc} \selectfont\thepage}}
\cfoot{}
}

\titleformat{\paragraph}[hang]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{0.5em}

\thispagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%
%%% MINITOC (POLY) %%%
%%%%%%%%%%%%%%%%%%%%%%
\ifpoly % Comme il n'y a pas de sommaire en général en mode pas poly, ça crée des avertissements
\dominitoc
\renewcommand\mtctitle {Contenu de cette partie}
\fi


%%%%%%%%%%%%%%%%%%%%%%
%%% ENVIRONNEMENTS %%%
%%%%%%%%%%%%%%%%%%%%%%

\theoremstyle{definition}


\newcounter{exo}[subsection]
\newcounter{sol}[subsection]

\newtheorem{theo}{Théorème}[subsection]
\renewcommand{\thetheo}{\arabic{theo}}

\newtheorem{definition}[theo]{Définition}
\newtheorem{remarque}[theo]{Remarque}
\newtheorem{proposition}[theo]{Proposition}
\newtheorem{corollaire}[theo]{Corollaire}
\newtheorem{exemple}[theo]{Exemple}
\newtheorem{lemme}[theo]{Lemme}
\newtheorem{axiome}[theo]{Axiome}
\newtheorem{rappel}[theo]{Rappel}


\makeatletter
\newenvironmentx{exo}[2][1={},2={}]
  {
   \medskip

   \def\@extit{#1}%
   \edef\@exer{#2}%
   \ifx\@exer\empty{}\else{\setcounter{exo}{#2}\addtocounter{exo}{-1}}\fi%
   \refstepcounter{exo}%
   \noindent{\bf Exercice \ifsolutions\hyperref[sol-\thechapter-\thesection-\thesubsection-\theexo]{\theexo}\else\theexo\fi} \ifx\@extit\empty{}\else{(#1)}\fi%
   \label{exo-\thechapter-\thesection-\thesubsection-\theexo}%
   ~\newline}
  {

  \medskip
  }


\makeatletter
\newenvironmentx{exoy}[2][1={},2={}]
  {
    \medskip

    \def\@extit{#1}%
    \edef\@exer{#2}%
    \ifx\@exer\empty{}\else{\setcounter{exo}{#2}\addtocounter{exo}{-1}}\fi%
    \refstepcounter{exo}%
    \noindent{\bf Exercice \ifsolutions\hyperref[sol-\thechapter-\thesection-\thesubsection-\theexo]{\theexo}\else\theexo\fi} \ifx\@extit\empty{}\else{(#1)}\fi%
    \label{exo-\thechapter-\thesection-\thesubsection-\theexo}%
    ~\newline}
  {

  \medskip
  }

\ifsolutions
  \newenvironmentx{sol}[2][1={},2={}]
    {\def\@soltit{#1}%
    \edef\@exer{#2}%
    \ifx\@exer\empty{}\else{\setcounter{sol}{#2}\addtocounter{sol}{-1}}\fi%
    \refstepcounter{sol}%
    \noindent {\it \underline{Solution de l'exercice \ref{exo-\thechapter-\thesection-\thesubsection-\thesol}}} \ifx\@soltit\empty{}\else{(#1)}\fi%
    \label{sol-\thechapter-\thesection-\thesubsection-\thesol}%
    ~\newline}
    {

    \medskip
    }
\else
  \excludecomment{sol}
\fi

% Pourquoi on voudrait faire un label bizarrement ?
\newenvironmentx{thm}[2][1={},2={}]
    {\begin{theo}[#1]
     \edef\@elabel{#2}%
     \ifx\@label\empty{\label{thm:\thechapter-\thesection-\thesubsection-\thetheo}}\else{\label{#2}}\fi%
     ~\newline
    }
  {\end{theo}}

\newenvironment{dfn}[1][]{\begin{definition}[#1]~\newline}{\end{definition}}

\newenvironment{rem}[1][]{\begin{remarque}[#1]~\newline}{\end{remarque}}

\newenvironment{pro}[1][]{\begin{proposition}[#1]~\newline}{\end{proposition}}

\newenvironment{cor}[1][]{\begin{corollaire}[#1]~\newline}{\end{corollaire}}

\newenvironment{ex}[1][]{\begin{exemple}[#1]~\newline}{\end{exemple}}

\newenvironment{lem}[1][]{\begin{lemme}[#1]~\newline}{\end{lemme}}

\newenvironment{ax}[1][]{\begin{axiome}[#1]~\newline}{\end{axiome}}

\newenvironment{nott}[1][]{\edef\@notttit{#1}\noindent\textbf{Notation}\ifx\@notttit\empty{}\else~(#1)\fi.\newline}{}

\newenvironment{preuve}[1][]{\edef\@preuvetit{#1}
  \noindent \textbf{Démonstration}\ifx\@preuvetit\empty{}\else~(#1)\fi. \,}%
  {\strut\hfill$\square$}

\newenvironment{rap}[1][]{\begin{rappel}[#1]~\newline}{\end{rappel}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SOMMAIRE ET AUTRE (POLY) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\renewcommand\thefigure{\@arabic\c@figure}
\renewcommand\thechapter{\@Roman\c@chapter}
\renewcommand\thesection{\@arabic\c@section}
\renewcommand\thesubsection{\@arabic\c@subsection}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{2em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \Huge\bfseries \thechapter. ~
      \fi
    \fi
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\renewcommand*\l@section{\@dottedtocline{1}{2em}{1.5em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{3.5em}{2.4em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{5.9em}{3.3em}}
\renewcommand\@chapapp{}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\sectionbreak}{\newpage}

\sloppy
\widowpenalty=300
\clubpenalty=300


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MODE ANIMATHEUR (pas poly) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ifpoly
\else
\AtBeginDocument{
  \ifsolutions
  % Exemple de contexte pour avoir un aperçu représentatif
  \chapter{Groupe K}
  \section{Première partie : Mathématiques}
  \subsection{Mon cours (moi)}

  % On provoque des erreurs si des animatheurs tentent d'utiliser certaines commandes réservées au poly
  \renewcommand{\section}{\ClassError{valbonne}{Commande \protect\section\space rencontree. Utilisez \protect\subsubsection}}

  \renewcommand{\subsection}{\ClassError{valbonne}{Commande \protect\subsection\space rencontree. Utilisez \protect\subsubsection}}
  \fi

  \renewcommand{\chapter}{\ClassError{valbonne}{Commande \protect\chapter\space rencontree. Utilisez \protect\subsubsection}}

  \let\forcenewenvironment\newenvironment
  \renewcommand{\newenvironment}{\ClassError{valbonne}{Commande \protect\newenvironment\space rencontree.\MessageBreak Utilisez de preference les environnements predefinis (voir la fin du fichier valbonne.cls).\MessageBreak Si vous ne trouvez pas ce qu'il vous faut, prevenez votre respo poly prefere, ou utilisez \protect\forcenewenvironment}}

  \let\forcerenewenvironment\renewenvironment
  \renewcommand{\renewenvironment}{\ClassError{valbonne}{Commande \protect\renewenvironment\space rencontree.\MessageBreak Utilisez de preference les environnements predefinis (voir la fin du fichier valbonne.cls).\MessageBreak Si vous ne trouvez pas ce qu'il vous faut, prevenez votre respo poly prefere, ou utilisez \protect\forcerenewenvironment}}
}
\fi

%%%%%%%%%%%%%%%%%%%%%
%%% OUTILS UTILES %%%
%%%%%%%%%%%%%%%%%%%%%

%%% Localisation des commandes des fichiers importés
\let\oldimport\import
\renewcommand{\import}[2]{{ \oldimport{#1}{#2} }}

%%% Insertion d'un beamer (8 slides par page), le premier argument est le nombre de rangées de slides qui rentrent dans la première page. Le second argument est une longueur à bidouiller pour que ça rende bien. Le troisième argument est le nom du fichier (sans l'extension).
\newcommand{\importbeamer}[3]{ %
  \begin{minipage}[c]{.5\textwidth} %
  \includepdf[pages=-\intcalcMul{2}{#1}, frame, scale=0.75,nup=2x#1,delta=5mm 5mm, offset=0 -#2]{#3} %
  \end{minipage} %
  %
  \includepdf[pages=\intcalcAdd{1}{\intcalcMul{2}{#1}}-, frame, scale=0.75,nup=2x4,delta=5mm 5mm]{#3} %
}

%\nstar{n} imprime n fois ⋆
\newcommand{\nstar}[1]{\ifthenelse{\equal{#1}{0}}{}{ \raisebox{.1em}{${\foreach \i in {1,...,#1} {{\star}} }$}}}

%\exomur{enonce}{etoiles}[resolv]
%enonce : L'énoncé. Le mieux est d'utiliser \import
%etoiles : Nombre d'étoiles.
%resolv : Qui a résolu l'exercice. Vide par défaut.
%Si resolv n'est pas vide, ça rajoute "Résolu par resolv" à la fin de l'environnement et transforme le numéro d'exercice en hyperlien vers la solution.
%Le numéro d'exercice vient du compteur exo.
\newcommandx{\exomur}[3][3={}]
{
  \def\@etoiles{#2}%Nombre d'étoiles
  \def\@resolv{#3}%Qui a résolu l'exercice
  \refstepcounter{exo}
  \medskip
  \noindent {\bf Exercice \ifthenelse{\equal{\@resolv}{}}{\theexo}{\hyperref[sol-\thechapter-\thesection-\thesubsection-\theexo]{\theexo}}}\nstar{#2}
  \label{exo-\thechapter-\thesection-\thesubsection-\theexo}
  ~\newline
  #1

  \ifthenelse{\equal{\@resolv}{}}{}
  {
    \medskip
    \textit{Résolu par #3}
    
  }
  \medskip
}

%\solmur{numero}{sol}{etoiles}{resolv}
%numero : Numéro de l'exercice
%sol : la solution. Le mieux est d'utiliser \import
%etoiles : Nombre d'étoiles.
%resolv : Qui a résolu l'exercice.
%Si resolv n'est pas vide,ça rajoute "Résolu par resolv" à la fin de l'environnement et transforme le numéro d'exercice en hyperlien vers la solution.
\newcommandx{\solmur}[4]
{
  \def\@numero{#1}%Numéro de l'exercice
  \def\@etoiles{#3}%Nombre d'étoiles
  \def\@resolv{#4}%Qui a résolu l'exercice
  \medskip
  \noindent {\it \underline{Solution de l'exercice \ref{exo-\thechapter-\thesection-\thesubsection-#1}\nstar{#3}}} résolu par #4
  \label{sol-\thechapter-\thesection-\thesubsection-#1}
  ~\newline
  #2

  \medskip
}


%%%%%%%%%%%%%%
%%% TROMBI %%%
%%%%%%%%%%%%%%

\ifpoly
  \iftrombi
    \newenvironment{trombi}{
      \setcounter{photo}{0}
      \small\centering
    }{
       \vfill
    }
    \newcounter{photo}
    \newcommand{\photoGenerique}[2]{
      \parbox[t][.19\textheight]{33mm}{
      \centering
      #2\\[1mm]
      #1}
      \stepcounter{photo}
      \def\photomod{\intcalcMod{\value{photo}}{4}}
      \ifnum0=\photomod
        \\ \vfil
      \else
        \hspace{2mm}
      \fi
    }
  \else
    \newenvironment{trombi}{
      \large
      \begin{multicols}{2}
      \begin{itemize}
    }{
      \end{itemize}
      \end{multicols}
    }
    \newcommand{\photoGenerique}[2]{
      \item #1
    }
  \fi

  \newcommand{\photo}[2]{
    \photoGenerique{#1}{\includegraphics[angle=-90,width=27mm]{#2}}}
  \newcommand{\pasDePhoto}[1]{
    \photoGenerique{#1}{\includegraphics[angle=-90, width=27mm]{pas-de-photo}}}\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% COMMANDES GLOBALES %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pour le poly uniquement
\ifpoly
\newcommand{\titre}[1]{\begin{center}\Huge\textbf{#1}\end{center}\bigskip}
\newcommand{\soustitre}[1]{\begin{center}\large\textbf{-- \, #1 \, --}\end{center}}
% \newcommand{\soustitre}[1]{\filbreak\begin{center}\large\textbf{-- \, #1 \, --}\end{center}}
% Rajouter \filbreak fait que les pages seront (plus susceptible d'être) sautées avant chaque \soustitre.
% Bon à savoir, mais rarement voulu.
\fi

\def\N{\mathbb N} % entiers naturels
\def\Z{\mathbb Z} % entiers relatifs
\def\Q{\mathbb Q} % nombres rationnels
\def\R{\mathbb R} % nombres réels
\def\C{\mathbb C} % nombres complexes
\DeclareMathOperator\Card{\mathrm{Card}} % cardinal d'un ensemble
\DeclareMathOperator\pgcd{\mathrm{pgcd}} % PGCD
\DeclareMathOperator\ppcm{\mathrm{ppcm}} % PPCM
\def\le{\leqslant}%\le donne ⩽, \leq donne ≤
\def\ge{\geqslant}%\ge donne ⩾, \geq donne ≥
\newcommand{\qte}[1]{\enquote{#1}} % guillemets. On a aussi \fg et \og
\renewcommand{\vec}[1]{\overrightarrow{#1}} % un vecteur ($\vec{AB}$ par exemple)
\newcommand{\norm}[1]{\left\lVert#1\right\rVert} % une norme


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENVIRONNEMENTS GLOBAUX %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dfn : définition
% pro : proposition
% thm : théorème
% preuve : preuve
% cor : corollaire
% ex : exemple
% lem : lemme
% exo : exercice
% sol : solution
% rem : remarque
% ax : axiome
% nott : notation
% rap : rappel

% Chaque environnement possède un argument optionnel pour préciser le nom, etc.
% Pour sol, vous pouvez mettre un deuxième argument optionel pour faire un saut dans la numérotation.
% Exemple : vous voulez corriger l'exercice 2 avant l'exercice 1 puis continuer, vous pouvez faire
% \begin{sol}[][2]
%   ...
% \end{sol}
%
% \begin{sol}[][1]
%   ...
% \end{sol}
%
% \begin{sol}[][3]
%   ...
% \end{sol}
%
% \begin{sol}
%   ...
% \end {sol}
% ...
