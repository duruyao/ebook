#!/usr/bin/env bash

printf "# INDEX\n\n" >index.md

folders=($(find . -maxdepth 1 ! -path . ! -path ./.git -type d | sort))
for folder in "${folders[@]}"; do
  printf "* [%s](%s)\n" "$(basename "${folder}")" "$(realpath --relative-to="${PWD}" "${folder}")" >> index.md 

  pdfs=($(find "${folder}" -type f -name "*.pdf" | sort))
  for pdf in "${pdfs[@]}"; do
      printf "\t* [%s](%s)\n" "$(basename "${pdf}")" "$(realpath --relative-to="${PWD}" "${pdf}")" >> index.md
  done
done

printf "\n" >>index.md

