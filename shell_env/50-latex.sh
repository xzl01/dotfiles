# need texlive-core package
[ -f "/usr/share/plantuml/plantuml.jar" ] && PLANTUML_JAR="/usr/share/plantuml/plantuml.jar"
[ -f "/usr/share/java/plantuml/plantuml.jar" ] && PLANTUML_JAR="/usr/share/java/plantuml/plantuml.jar"
if command -v lualatex >/dev/null 2>&1; then
	if [ -n "${PLANTUML_JAR}" ]; then
		alias llatex="PLANTUML_JAR=${PLANTUML_JAR} lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error"
	else
		alias llatex="lualatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error"
	fi
fi

if command -v xelatex >/dev/null 2>&1; then
	if [ -n "${PLANTUML_JAR}" ]; then
		alias xlatex="PLANTUML_JAR=${PLANTUML_JAR} xelatex -shell-escape"
	else
		alias xlatex="xelatex -shell-escape"
	fi
fi
