#!/bin/bash

source ./scripts/config.sh
source ./scripts/messages.sh

branch_checkout() {
  local branch=feature/${PREFIX}${VA}
  git fetch origin
  if [[ $(git branch --list ${branch}) ]]; then
    echo -e "${BLUE}${BRANCH_SWITCH_MSG}${RESET}"
    git checkout ${branch}
  else
    echo -e "${BLUE}${BRANCH_CREATE_MSG}${RESET}"
    git checkout -b ${branch} origin/master
  fi
}

create_base_dir() {
  echo -e "${BLUE}${SCAFFOLD_MSG}${RESET}"
  make_core_dir ${SRC_DIR}
  make_core_dir ${PREFIX}${VA}
  mkdir ${IMAGE_DIR}
  curl ${CONFIG_GIST} > config.json
  curl ${README_GIST} > README.md
  touch ${PREFIX}${VA}.${UPDATE_SET}
}

create_option_dir() {
  mkdir ${1}
  touch ${1}/${PREFIX}${VA}.${2}
}

fetch_github_user() {
  if [[ $(git config user.name) ]]; then
    echo $(git config user.name)
  else
    echo ${CONTRIB_TEMP}
  fi
}

format_data() {
  echo $(printf "%s" $1)
}

has_dashes() {
  if [[ ${args[0]} == *-* ]]; then
    name_has_dashes=true
  fi
}

main() {
  get_options
  set_name
  branch_checkout
  create_base_dir
  has_dashes
  sub_base_content
  make_commit
}

make_commit() {
  echo -e "${BLUE}${COMMIT_STATUS_MSG}${RESET}"
  cd ../../
  git add ${SRC_DIR}/${PREFIX}${VA}
  git commit -a -m "${COMMIT_MSG} ${va_name_lower}"
  echo -e "${GREEN}${DONE_MSG}${RESET}"
}

make_core_dir() {
  if [ -d $1 ]; then
    cd $1
  else
    mkdir $1 && cd $1
  fi
}

make_lowercase() {
  echo $(tr '[:lower:]' '[:lower:]' <<< ${i:0:1})${i:1}"$(make_space $1)"
}

make_space() {
  if [[ $1 ]]; then
    echo " "
  fi
}

make_uppercase() {
  echo $(tr '[:lower:]' '[:upper:]' <<< ${i:0:1})${i:1}"$(make_space $1)"
}

replace_content() {
  sed -i '' -e "s/${1}/${2}/g" ${3}
}

set_name() {
  local va_dir=()
  for i in "${inputs[@]}"; do
    va_dir+=$(echo -${i} | tr '[:upper:]' '[:lower:]')
    va_name_upper+=$(make_uppercase ${i})
    va_name_lower+=$(make_lowercase ${i})
  done
  VA=$(format_data ${va_dir[@]})
}

sub_base_content() {
  echo -e "${BLUE}${UPDATE_MSG}${RESET}"
  if [[ ${name_has_dashes} ]]; then
    local dash_readme=()
    rm=${va_name_upper}
    IFS='-' read -ra content <<< "$rm"
    for i in "${content[@]}"; do
      dash_readme+=$(make_uppercase ${i})
    done
    replace_content "${NAME_TEMP}" "${dash_readme%??}" README.md
    replace_content "${NAME_TEMP}" "${dash_readme%??}" config.json
  else
    replace_content "${NAME_TEMP}" "${va_name_upper%?}" README.md
    replace_content "${NAME_TEMP}" "${va_name_upper%?}" config.json
  fi
  replace_content "${CONTRIB_TEMP}" "$(fetch_github_user)" config.json
  replace_content "${DIR_TEMP}" "${PREFIX}${VA}" config.json
  replace_content "${DIR_TEMP}" "${PREFIX}${VA}" README.md
}

get_options() {
  echo -e "${BLUE}${START_MSG}${RESET}"
  inputs=()
  for i in "${args[@]}"; do
    inputs+=("$i")
  done
}

args=($@)
main
