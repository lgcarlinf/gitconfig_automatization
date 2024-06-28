#!/bin/bash

echo "Ingrese el nombre de la carpeta de trabajo"
read name_work_directory
echo
echo "Ingrese el nombre del usuario"
read name_user
echo
echo "Ingrese el nombre de usuario de github"
read user_github
echo
echo "Ingrese el correo del usuario"
read email_user
echo

directory_ssh=".ssh"
directory_git=".gitconfig"

create_ssh_key(){
  cd .ssh
  ssh-keygen -f id_rsa_$name_work_directory -N "" 
  echo "Se generó tu nueva key ssh con el nombre '$name_work_directory'"
  echo
}

create_or_update_gitconfig_global(){
  cd ~
  if [ -d "$directory_git" ]; then
    echo "El directorio '$directory_git' ya existe"
    echo
    cat <<EOL >> "$directory_git"

    [includeIf "gitdir:~/$name_work_directory/"]
    path= ~/$name_work_directory/.gitconfig.$name_work_directory
EOL
  else
    mkdir "$directory_git"
    echo "El directorio '$directory_git' se creó correctamente"
    echo
    cat <<EOL >> "$directory_git"
    [init]
    defaultBranch = main

    [includeIf "gitdir:~/$name_work_directory/"]
    path= ~/$name_work_directory/.gitconfig.$name_work_directory

EOL
  fi
}

create_git_config_directory() {
  cd "$name_work_directory" || return
  touch "$directory_git.$name_work_directory"
  cat <<EOL >> "$directory_git.$name_work_directory"

  [user]
  email = $email_user
  name = $name_user

  [github]
  user = "$user_github"

  [core]
  sshCommand = "ssh -i ~/.ssh/id_rsa_$name_work_directory"
EOL

  echo "Se ha creado el archivo '$directory_git.$name_work_directory' y se ha configurado correctamente."
}

cd ~

if [ -d "$directory_ssh" ]; then
  echo "El directorio '$directory_ssh' ya existe"
  create_ssh_key
  echo "Se creó la ssh key correctamente"
else
  mkdir "$directory_ssh"
  echo "El directorio '$directory_ssh' se creó correctamente"
  create_ssh_key
  echo "Se creó la ssh key correctamente"
fi

cd ~

if [ -d "$name_work_directory" ]; then
  echo "El directorio '$name_work_directory' ya existe"
  echo
else
  mkdir "$name_work_directory"
  echo "El directorio '$name_work_directory' se creó correctamente"
  echo
  create_or_update_gitconfig_global
fi

create_git_config_directory
