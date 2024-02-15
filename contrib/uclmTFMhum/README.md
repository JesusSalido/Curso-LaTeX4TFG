# Plantilla guía de TFM de la Facultad de Letras (UCLM-CR)

Esta plantilla es una adaptación de la plantilla para el TFG de la [Escuela Superior de Informática](http://webpub.esi.uclm.es/) (ESI) de la Univ. de Castilla-La Mancha (UCLM) preparada por el prof. Jesús Salido para el curso de enseñanzas propias impartido en la ESI: [LaTeX esencial para preparación de TFG, Tesis y otros documentos académicos](http://visilab.etsii.uclm.es/?page_id=1468), en el que se explican las estrategias fundamentales para aumentar la productividad y la calidad de resultados finales empleando el sistema de preparación de documentos [LaTeX](https://www.latex-project.org/) en el contexto académico.

Esta plantilla está organizada en ficheros y directorios del modo que se indica a continuación:
  - Este fichero ``README.md``.
 ``uclmTFMhum.sty`` en el que se incluyen los paquetes que emplea la plantilla. Algunos de los paquetes son opcionales (señalado en los comentarios con el tag `OPT.`).  
  - Directorio ``/frontmatter`` con ficheros con los elementos de la parte delantera del documento no incluidos en las portadas (``Creditos.tex``, ``Resumen.tex``, ``Agradecimientos.tex``, e ``Indices.tex``).
  - Directorio ``/caps`` con ficheros para los capítulos principales de la memoria.
  - Directorio ``/anexos`` con ficheros para los anexos.
  - Directorio ``/figs`` de figuras contenidas en el documento final.
  
    > __NOTA__: Si alguno de los ficheros incluidos en los directorios ``/frontmatter``, ``/caps`` y ``/anexos``, no es necesario, su inclusión en el fichero maestro se debe eliminar/comentar. 
 

### Compilación 

Esta plantilla ha sido preparada para compilarse con `pdflatex` y `bibtex`. Su complicación se puede realizar en Overleaf o en modo local con la distribución TeXLive.

Para su compilación en modo local se aconseja utilizar `latexmk` (requiere para su ejecución de un intérprete [`Perl`](http://strawberryperl.com/)):

> \$> latexmk -gg -pdflatex -bibtex-cond1 -quiet -outdir=build uclmTFMhum.tex

Para la automatización del trabajo con esta plantilla es recomendable el empleo de un IDE dedicado como [TeXstudio](https://www.texstudio.org/).

-----
#### Citación y contacto

[![DOI](https://zenodo.org/badge/191907589.svg)](https://zenodo.org/badge/latestdoi/191907589)

Si esta plantilla le resulta útil considere la posibilidad de citarla con la información del registro `bib`:

```
@www{salidoTFGgit,
  author       = {Jesús Salido},
  title        = {Plantilla guía de TFG de la ESI-UCLM},
  year         = {2019},
  editor       = {GitHub},
  organization = {Universidad de Castilla-La Mancha},
  url          = {https://github.com/JesusSalido/TFG_ESI_UCLM},
  doi          = {10.5281/zenodo.4561708}
}
```

Comunique cualquier asunto relacionado con esta plantilla (comentarios, errores, incompatibilidades, mejoras, etc.) a:

`jesus.salido@uclm.es`

<img src="./figs/by-nc-sa.png" width="150">
