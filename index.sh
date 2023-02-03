#!/usr/bin/env bash

printf "# E-books on Information Technology\n\n" >README.md
printf "## Index\n\n" >>README.md

folders=($(find . -maxdepth 1 ! -path . ! -path ./.git -type d | sort))
for folder in "${folders[@]}"; do
  printf "* [%s](%s)\n" "$(basename "${folder}")" "$(realpath --relative-to="${PWD}" "${folder}")" >> README.md 

  pdfs=($(find "${folder}" -type f -name "*.pdf" | sort))
  for pdf in "${pdfs[@]}"; do
      printf "    * [%s](%s)\n" "$(basename "${pdf}")" "$(realpath --relative-to="${PWD}" "${pdf}")" >> README.md
  done
done

printf "\n" >>README.md

