FROM registry.cn-hangzhou.aliyuncs.com/zw-php/php-docker:php8
LABEL maintainer = "holmescheng"
# swoole local url for production config
ENV SWOOLE_LOCAL_DIR ./
ENV PROJECT_DIR /data/release/
ENV PIG dev

#expose port 9501
EXPOSE 9501

#create easyswoole dir
WORKDIR ${PROJECT_DIR}

#开发完成后, 将开发机器上的文件全部拷贝到容器里的easyswoole目录下,打包成镜像发布
COPY ${SWOOLE_LOCAL_DIR} ${PROJECT_DIR}

WORKDIR ${PROJECT_DIR}
CMD php easyswoole start ${PIG}

#最后通过映射端口和挂载volume开发： docker run -p 80:80 -v $(pwd):/data/release -d registry.xx.com