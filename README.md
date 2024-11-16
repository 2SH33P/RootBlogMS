<div align="center">
	<img src="https://gcore.jsdelivr.net/gh/2SH33P/LazyHexo/logo.jpg" width=200px style="border-radius: 25%">
	<h3>Lazy Hexo</h3>
	<p>更适合懒人体质的Hexo全云端化部署方案！</p>
</div>

# 概述

本仓库旨在实现仅需要`Github Actions`就可以摆脱本地实现全云端 Hexo 初始化到部署的一条龙流程，连 Node.js 也不用安装。

# 用法

## 初始化

 1. 点击仓库右上角的`Use this template`，选择`Create a new repository`。名字随便写，权限设为`Public`，反正也不储存数据，仅仅是调动 Actions 的工具库。
 
![Template](https://gcore.jsdelivr.net/gh/2SH33P/LazyHexo/imgs/1.png)

2. [创建](https://github.com/new)一个私有库和一个公有库（公有库可以就是本库），分别用来存储 Hexo 配置和生成的静态文件。
3. [创建](https://github.com/settings/tokens/new)一个 Token ，勾选`Repo`项并记录`ghp_`开头的字符串。

![Template](https://gcore.jsdelivr.net/gh/2SH33P/LazyHexo/imgs/3.png)

4. 到工具库（`Use this template`操作后的仓库）`Settings/Secrets amd variables/Actions`中的`Repository secrets`中按照表格创建变量。可以添加你自己的变量。

|     名字     |               内容                |                 备注                  |
| :--------: | :-----------------------------: | :---------------------------------: |
| `GH_TOKEN` |           第三步中获得的字符串。           |                 必选。                 |
|   `ROOT`   |         储存Hexo根目录的私有库。          |        格式形如`[用户名]/[库名]`，必选。         |
|    `SH`    | 在配置仓库中执行的命令（更改会推送到Github的配置库上）。 | 常用于安装主题等，也可做相关配置。应用在`theme.yml`。可选。

![](https://gcore.jsdelivr.net/gh/2SH33P/LazyHexo/imgs/2.png)

5. 到工具库设置中的`Page`项，将`Source`更改为`Github Actions`。

6. 切换到工具库的Actions页面。

点击左边的`Root folder initialization`，如图示初始化储存根目录的私有库。不出意外的话，储存根目录的私有库应该会有了`hexojs/hexo-starter`的仓库文件。

![Template](https://gcore.jsdelivr.net/gh/2SH33P/LazyHexo/imgs/4.png)

## 安装主题并生成静态文件、推送到远程仓库中

同上第四步，配置变量；克隆主题等的命令写入`SH`中（如`git clone ...`等）。

`SH`中的命令执行在根目录之中，会对 Github 远程根目录仓库的文件产生影响（即会推送到 Github 的私有库上）。

Actions 中选择`Theme install`并`Run workflow`可以实行安装/删除主题等操作。选择`Build`即会从远程根目录仓库下执行安装依赖等操作，最后部署到储存静态资源的公有库的`gh-pages`分支上。

# 额外配置

请在生成的储存配置文件的私有仓库中创建`i.sh`文件；如果需要，在其中加入依赖安装的命令。命令执行在`hexo g`操作之前。
