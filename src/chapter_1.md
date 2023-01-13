# Introduction  {#ch:introduction}

This is an overengineered thesis template.

It uses:

- [Nix](https://nixos.org/)
- [Pandoc](https://pandoc.org/)
- \LaTeX
- [dot](https://graphviz.org/)
- [Inkscape](https://inkscape.org)
- [Python](https://www.python.org/)

It can embed PNG images (see [@fig:png]), SVG images via Inkscape (see [@fig:svg]) or DOT graphs (see [@fig:dot]).
You can also cite references like [@moore_cramming_1965].

Just include them like seen in [@lst:import].

```{#lst:import .latex caption="Import example"}
\begin{figure}[h]
  \includegraphics{tmp/format/name}
  \caption{My label}
  \label{fig:lab}
\end{figure}
```

![A graph from a PNG file](img/png/graph.png){#fig:png}

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

