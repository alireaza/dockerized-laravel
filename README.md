# Dockerized Laravel based on [LEP](https://github.com/alireaza/lep)
Laravel application in a Docker container

## Install

Via Composer
```bash
$ git clone https://github.com/alireaza/dockerized-laravel.git laravel
$ cd laravel
$ CURRENT_UID=$(id -u):$(id -g) docker-compose up --detach --build
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

#### Laravel artisan CLI:
```bash
$ docker-compose exec --user $(id -u):$(id -g) php php artisan
```

#### Fix Laravel storage permission:
```bash
$ docker-compose exec --user root php chown -R www-data:www-data /var/www/html/storage
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
