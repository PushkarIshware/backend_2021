# backend_2021

Generate SSH keys:
- ssh-keygen

Check Private SSH Key:
- cat .ssh/id_rsa

Check Public SSH Key:
- cat id_rsa.pub

Give permission to certain folder:
- sudo chown -R $USER:$USER .

Install Docker and docker-compose:
- sudo apt  install docker.io

    For DOCKER-COMPOSE:
        Install pip3:
            sudo apt install python3-pip
        sudo pip3 install docker-compose


Show your branch name on your terminal:

- gedit  ~/.bashrc

Add below code
```
# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```

Reload the .bashrc file:
- source ~/.bashrc


ERROR_FIX:

- docker.errors.DockerException: Error while fetching server API version

    - sudo gpasswd -a $USER docker
    - newgrp docker


- Start Django project:
    
    -  sudo docker-compose run backend_service django-admin startproject backend . [NOTE: `backend_service` is service name from Dockerfile]


- Check Docker container related info:
    ```CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES```
    - docker ps


- Create new app using docker:

    - docker exec backend_2021_backend_service_1 python3 manage.py startapp <app_name>
            - NOTE: backend_2021_backend_service_1 is NAME from `docker ps` command.

- Create superuser for django admin panel:
    - docker exec -it <dockercontainerid> python manage.py createsuperuser


- Create `.env` folder in `backend_2021 and create following txt files:

    -   django.env
            
```
SECRET_KEY=FirstProjectSecrit
DEBUG=1
ALLOWED_HOSTS=localhost 127.0.0.1 [::1]


# Environment Variable which is used in setting.py in django
# setting.py file to configure the database connection for
# application
SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=postgres
SQL_USER=postgres
SQL_PASSWORD=postgres
SQL_HOST=db
SQL_PORT=5432
```

    -   posgresql.env


```
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=postgres
```
