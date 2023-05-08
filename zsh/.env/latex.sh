# need texlive-core package
if command -v lualatex >/dev/null 2>&1; then
    PLANTUML_JAR="/usr/share/plantuml/plantuml.jar"
    [ -f "/usr/share/java/plantuml/plantuml.jar" ] && PLANTUML_JAR="/usr/share/java/plantuml/plantuml.jar"
    alias llatex="PLANTUML_JAR=${PLANTUML_JAR} lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error"
fi

