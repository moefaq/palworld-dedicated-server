[docker push moefaq/palworld-server-dockerized:tagname](https://hub.docker.com/r/moefaq/palworld-server-dockerized)

# Docker部署
## 1. 安装Docker以及Docker Compose  
详细方法参详Linux发行版Wiki 或 [Docker Docs](https://docs.docker.com/manuals/)

## 2. 部署容器
### 2.1 准备所需文件文件
#### 2.1-A
下载所需文件:  
[docker-compose.yml](https://github.com/moefaq/palworld-dedicated-server/raw/master/docker-compose.yml)  
[PalWorldSettings.ini](https://github.com/moefaq/palworld-dedicated-server/raw/master/PalWorldSettings.ini)
#### 2.1-B
通过git clone本项目

    git clone https://github.com/moefaq/palworld-dedicated-server.git
### 2.2 修改配置文件
自行编辑PalWorldSettings.ini 与 docker-compose.yml
### 2.3 检查文件
确保 PalWorldSettings.ini 的owner及group为1145:1145  

    -rwxrwxrwx 1 1145 1145 1974 Jan 25 12:41 PalWorldSettings.ini
### 2.3 运行容器
    docker compose up -d

## 3. tag说明
| tag    | comment                                                                            | image size                                                                                                    |
| ------ | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| latest | steamcmd from Steam Binary Archive, Download Server Application while Container up | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/moefaq/palworld-server-dockerized/latest) |
| Repo   | steamcmd from Debian Repo，Download Server Application while Container up          | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/moefaq/palworld-server-dockerized/Repo)   |
| Binary | steamcmd from Steam Binary Archive, Download Server Application while Container up | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/moefaq/palworld-server-dockerized/Binary) |

## 4. 其它说明
### 4.1 关于添加运行参数
编辑docker-compose.yml文件，在services->server->environment->OPTIONS的Value中写入参数。  
如：服务器需设置为Community Server时，该处应为  

    OPTIONS: "EpicApp=PalServer"
### 4.2 关于修改 PalWorldSettings.ini 设置后如何生效
1. 在宿主机上修改 PalWorldSettings.ini 并保存
2. 执行 docker compose up -d 进行Recreate容器即可  

注: PalServer程序及数据已绑定至Docker命名卷中进行持久化，Recreate容器并不会影响相关数据