# docker-crond

## build
```bash
git clone https://github.com/DaoCloud-SOU-SZ/docker-crond.git

cd docker-crond

docker build -t crond:latest .

registry=your_registry

docker tag crond:latest $registry/crond:latest

docker push $registry/crond:latest
```

## example
[local-image-tools](local-image-tools)
