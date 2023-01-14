# Introduction  {#ch:introduction}

This is an overengineered thesis template.

It uses:

- [Nix](https://nixos.org/)
- [Pandoc](https://pandoc.org/)
- \LaTeX
- [dot](https://graphviz.org/)
- [Inkscape](https://inkscape.org)
- [Python](https://www.python.org/)

![A graph from a PNG file](img/png/graph.png){#fig:png}

It can embed PNG images (see [@fig:png]), SVG images via Inkscape (see [@fig:svg]) or DOT graphs (see [@fig:dot]). You can also cite references like [@moore_cramming_1965], use inline math like $\frac{1}{n}$ or display math:

\begin{align}
  0 + 1 + 2 + 3 + 4 + \dotsb + n = 
  \sum_{k=0}^n k = \frac{n(n+1)}{2} = \frac{n^2+n}{2}
\end{align}

Just include it like seen in [@lst:display].

```{#lst:display .latex caption="Display math example"}
\begin{align}
  0 + 1 + 2 + 3 + 4 + \dotsb + n =
  \sum_{k=0}^n k = \frac{n(n+1)}{2} = \frac{n^2+n}{2}
\end{align}
```


\begin{figure}[h]
  \centering
  \import{tmp/svg}{graph.pdf_tex}
  \caption{A graph from an SVG file with embedded text}
  \label{fig:svg}
\end{figure}

\begin{figure}[h]
  \centering
  \includegraphics{tmp/dot/graph}
  \caption{A graph from a dot file}
  \label{fig:dot}
\end{figure}

