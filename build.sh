OUT_FILE="${PWD##*/}.pdf";
asciidoctor-pdf \
    --verbose \
    --trace \
    --failure-level=ERROR \
    --out-file="$OUT_FILE" \
    "$@" main.adoc

