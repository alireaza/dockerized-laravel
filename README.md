# Linux, Nginx, PHP
The term **LEP** is an acronym that represents the configuration of a **L**inux operating system with an nginx (pronounced **E**ngine-X, hence the E in the acronym) web server and dynamic content processed by **P**HP.

## Install

Via Composer
```bash
$ git clone https://github.com/alireaza/lep.git alireaza
$ cd alireaza
<<<<<<< HEAD
$ CURRENT_UID=$(id -u):$(id -g) docker-compose up --detach --build
=======
$ docker-compose up --detach
>>>>>>> Clone https://github.com/alireaza/lep.git
```


### Some useful commands

#### Start services
```bash
$ CURRENT_UID=$(id -u):$(id -g) docker-compose up --detach --build
```

#### Stop services
```bash
$ CURRENT_UID=$(id -u):$(id -g) docker-compose down
```

#### Fix services permissions
```bash
$ sudo chown -R $(id -u):$(id -g) {./nginx/,./php/,./src/}
```

#### Nginx Log
```bash
$ docker-compose logs --tail 100 --follow nginx
```

#### Nginx CLI
```bash
$ docker-compose exec nginx nginx -h
```

#### PHP Log
```bash
$ docker-compose logs --tail 100 --follow php
```

#### PHP CLI
```bash
$ docker-compose exec --user $(id -u):$(id -g) php php -h
```

#### Composer CLI
```bash
$ docker-compose exec --user $(id -u):$(id -g) php composer -h
```

#### Run dbgpProxy
```bash
$ docker-compose exec php /usr/bin/dbgpProxy --server 0.0.0.0:9003 --client 0.0.0.0:9001
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
