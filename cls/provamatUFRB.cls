%==========================================================%
% provamatUFRB.cls                                         %
% Copyright © 2022 Ícaro Vidal Freire                      %
%----------------------------------------------------------%
% Licença:  Esse trabalho está licenciado com uma licença  % 
%           CC BY-NC 4.0 (Creative Commons Atribuição-     %
%           NãoComercial 4.0 Internacional).               %
%           Abaixo está um quadro resumo, mas para maiores %
%           informações, acesse o link:                    %
%              <creativecommons.org/licenses/by-nc/4.0/>   %
%----------------------------------------------------------%
%        Permissões      Condições        Limitações       %
%      ✔ compartilhar  ⚠ atribuição     ✘ responsabilidade %
%      ✔ adaptar       ⚠ não comercial  ✘ garantia         %
%----------------------------------------------------------%
% Versão   : 0.1.0                                         %
% Descrição: Classe, não oficial, para confecção de        %
%            atividade avaliativa, com cabeçalho da UFRB,  % 
%            estilizado (não oficial).                     %
% Uso      : A composição tipográfica deve ser realizada   % 
%            com LuaTeX.                                   %
%            Para mais informações, visite o repositório:  %
%               <github.com/icaro-freire/provamatUFRB>     %
%----------------------------------------------------------%
%                _         _____   __  __                  %
%               | |    __ |_   _|__\ \/ /                  %
%               | |   / _` || |/ _ \\  /                   %
%               | |__| (_| || |  __//  \                   %
%               |_____\__,_||_|\___/_/\_\                  %
%==========================================================%

% indentificações internas ====================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eadProva}[2022/06/18 v0.1.0
  'Classe extra-oficial para Atividades Avaliativas da UFRB']
\LoadClass{exam}

% pacotes carregados ==========================================================

\RequirePackage{eulervm} %---------------------------------> fontes matemáticas

\RequirePackage{fontspec} %-------------------> seleção e codificação de fontes
  \setmainfont[Scale = 1.1]{Aref Ruqaa}
  \setsansfont{Fontin Sans}
  \setmonofont[Scale = 0.8]{CodeNewRoman Nerd Font}
  \newfontfamily{\intimacy}{intimacy}

\RequirePackage[brazil]{babel} %---------------------------------------> idioma

\RequirePackage{mathtools, amsthm, amssymb} %----> expressões matemáticas e cia

\RequirePackage
[
  a4paper,
  top    = 1cm,
  bottom = 1.5cm,
  outer  = 1.5 cm,
  inner  = 1.5 cm
]{geometry} %---------------------------------------------------------> margens

\RequirePackage{graphicx} %-------------------------------------------> figuras
  \graphicspath{{./figs/}} %---------------------------> todas as figuras devem 
                           %                             estar num diretório 
                           %                             por nome 'figs'
  
\RequirePackage{fancybox} %--------------------------------> caixas estilizadas

\RequirePackage{microtype} %----------------------------> protução das palavras

\RequirePackage{setspace} %--------------------------> espaçamento entre linhas

\RequirePackage{multicol} %---------------------------------> múltiplas colunas

\RequirePackage{xcolor} %-----------------------------------------------> cores

\RequirePackage{tcolorbox} %------------------------> para caixa das instruções
	\tcbuselibrary{skins} %---------------------------> para caixa das instruções 
\RequirePackage{xparse} %---------------------------> para caixa das instruções 
\RequirePackage{varwidth} %-------------------------> para caixa das instruções 

% configurações para as 'instruções' ==========================================

\newtcolorbox{mybox}[2][]{enhanced,
before skip=3mm,after skip=5mm,
colback=blue!0,colframe=black!60,boxrule=0.3mm,
attach boxed title to top left={xshift=1cm,yshift*=1mm-\tcboxedtitleheight},
varwidth boxed title*=-3cm,
boxed title style={frame code={
\path[fill=tcbcolback!30!black]
([yshift=-1mm,xshift=-1mm]frame.north west)
arc[start angle=0,end angle=180,radius=1mm]
([yshift=-1mm,xshift=1mm]frame.north east)
arc[start angle=180,end angle=0,radius=1mm];
\path[left color=tcbcolback!60!black,right color=tcbcolback!60!black,
middle color=tcbcolback!80!black]
([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
-- (frame.south east) -- (frame.south west)
-- ([xshift=-1mm,yshift=-1mm]frame.north west)
[sharp corners]-- cycle;
},interior engine=empty,
},
fonttitle=\bfseries\sffamily,
title={#2},#1}

% definindo variáveis para o cabeçalho ========================================

\def\tituloDaProva#1{\gdef\@tituloDaProva{#1}}
\def\curso#1{\gdef\@curso{#1}}
\def\semestre#1{\gdef\@semestre{#1}}
\def\disciplina#1{\gdef\@disciplina{#1}}
\def\prof#1{\gdef\@prof{#1}}
\def\numeroDaProva#1{\gdef\@numeroDaProva{#1}}
\def\dataDia#1{\gdef\@dataDia{#1}}
\def\dataMes#1{\gdef\@dataMes{#1}}
\def\dataAno#1{\gdef\@dataAno{#1}}

% comando para escrita das instruções =========================================

\newcommand{\instrucoes}
{
  \begin{minipage}{0.9\textwidth}
    \begin{mybox}[colbacktitle=blue!80!black,left=-5pt]{Instruções}
      \vspace{-0.3cm}
        \begin{multicols}{2} 
          \singlespacing 
          \scriptsize
          \begin{enumerate} 
            \item Essa avaliação terá valor máximo de \textbf{100 pontos}. 
            \item Toda avaliação deve ser feita de caneta \textbf{azul} ou \textbf{preta}. 
            \item Questões rasuradas e sem cálculos serão desconsideradas. 
            \item Se houver indícios de fraude, as provas envolvidas terão pontuações zeradas. 
            \item Provas com respostas copiadas da \textit{internet}, terão pontuações zeradas. 
          \end{enumerate} 
        \end{multicols}
    \end{mybox}
  \end{minipage}
}

% cabeçalho estilizado ========================================================

\newcommand{\titulo}
{
  \noindent
  \begin{minipage}[t][2.5cm]{\textwidth}
  %  
    \begin{minipage}{0.26\linewidth}
      \centering 
      \includegraphics[width = 3.5cm]{ufrb}
    \end{minipage}
    \hfill
    \begin{minipage}{0.74\linewidth}
    %
      \ovalbox
      {
        \begin{minipage}{0.99\linewidth}
          $\blacktriangleright$ 
          \hspace{\stretch{1}} 
          \textbf
          {
            \sffamily \@tituloDaProva \phantom{/} 
          }
          \hspace{\stretch{1}}
          $\blacktriangleleft$ 
        \end{minipage}
      }
      \par
      \vspace{0.1cm}
      \ovalbox
      {
        \begin{minipage}{0.99\linewidth}
          {\sffamily \textbf{Professor: }} \@prof
          \hfill
          {\sffamily \textbf{Disciplina: }} \@disciplina  
          \phantom{/}
        \end{minipage}
      }
      \par
      \vspace{0.1cm}
      \ovalbox
      {
        \begin{minipage}{0.99\linewidth}
          {\sffamily \textbf{Curso: }} \@curso 
          \hfill
          $ {\@semestre}^{\circ} $ {\sffamily semestre}
          \phantom{/}
        \end{minipage}
      }
    %  
    \end{minipage}
    \vfill 
    \ovalbox
    {
      \begin{minipage}{0.995\linewidth}
        \textsf{\textbf{Aluno (a):}} \quad \hfill 
        \textsf{\textbf{Data: } \@dataDia/\@dataMes/\@dataAno}
      \end{minipage}
    }
  %
  \end{minipage}
  %
  \par
  \vspace{0.8cm}
  \centering
    \instrucoes
  %
  \par 
  \vspace{0.5cm}
  \begin{minipage}{\textwidth}
    \centering
    \rule[2ex]{5cm}{0.8pt} \\
    {\Large  \intimacy Avaliação \@numeroDaProva } \\
    \rule{5cm}{2pt} \\
    \vspace{-0.35cm}
    \rule{5cm}{0.8pt}
  \end{minipage}
}

% configurando a classe exam ==================================================

% singular ou plural na pontuação
\pointpoints{\,ponto}{\,pontos}

% formatando o nome da pontuação
\qformat{
  \ovalbox{\bfseries \sffamily Questão \thequestion}\; 
  {\bfseries \sffamily (\thepoints)}
  \hfill
}

% configurações para o ambiente das soluções ----------------------------------
% renomeando o nome para as soluções 
\renewcommand{\solutiontitle}{\noindent\textbf{\textsf{Solução:}}\enspace}

% configurando o tamanho do texto das soluções
\SolutionEmphasis{\small}

% colocando uma 'sombra' no ambiente da solução 
\shadedsolutions 

% definindo a cor de fundo do ambiente das soluções 
\definecolor{SolutionColor}{rgb}{.95,.95,.95}

% configurações para as margens -----------------------------------------------
\pagestyle{headandfoot}
\runningfootrule
\firstpagefooter{}{\thepage}{}
\runningfooter{}{\thepage}{}

% configurando novos comandos =================================================

\DeclareMathOperator{\sen}{sen}
