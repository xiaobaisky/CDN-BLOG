#!/bin/sh
echo "==========================================="
echo "       欢迎使用修改版Hexo控制脚本！"
echo "            双击打开即可使用"
echo "        更多内容可以访问我的博客"
echo "          https://www.hai2020.cn"
echo "==========================================="
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
printf "\033[32m Blog 根目录："${HexoPath}"\033[0m"
echo " "
echo "[0] 退出菜单"
echo "=============以下功能需要在空文件夹内使用================"
echo "[1] 初始化安装Hexo（第一次使用hexo时使用）"
echo "[2] 从云端恢复Hexo（从github私有库里获取源码）"
echo "=============以下功能需要在Hexo文件夹内使用================"
echo "[3] 从Github拉取最新版本（需要在脚本中配置仓库URL）"
echo "[4] 提交本地修改到GitHub"
echo "[5] 安装butterfly主题"
echo "[6] 安装volantis主题"
echo "=============以下功能为全局指令================"
echo "[7] 安装ssh密钥"
echo "[8] 验证ssh密钥"
echo "[9] 清理仓库缓存"
echo " "
printf "请选择需要的功能，默认选择[3] 开启本地预览"
echo " "
printf "选择："
read answer

if [ "$answer" = "1" ]; then
printf "\033[32mINFO \033[0m 正在为您创建Hexo文件夹 ...\n"
mkdir Hexo
cd Hexo
printf "\033[32mINFO \033[0m 正在将npm源替换为阿里云镜像 ...\n"
npm config set registry https://registry.npm.taobao.org # 替换NPM源为阿里镜像
printf "\033[32mINFO \033[0m 正在为您全局安装Hexo命令集...\n"
npm install -g hexo-cli
printf "\033[32mINFO \033[0m 即将为您开始Hexo初始化安装...\n"
hexo init
printf "\033[32mINFO \033[0m 正在为您安装必要依赖...\n"
npm install --save
npm install hexo-deployer-git --save
printf "\033[32mINFO \033[0m 请查看您当前的Hexo版本...\n"
hexo version
printf "\033[32mINFO \033[0m 安装完成，您可以开始您的Hexo之旅了！\n"
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
exit 0
else
if [ "$answer" = "2" ]; then
printf "\033[32mINFO \033[0m 正在从Github拉取博客源码 ...\n"
git clone https://github.com/xiaobaisky/myblog.git Hexo # 记得替换仓库URL为自己的源码存放仓库
cd Hexo
printf "\033[32mINFO \033[0m 恢复完成！\n"
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
exit 0
else
if [ "$answer" = "3" ]; then
printf "\033[32mINFO \033[0m 正在从Github拉取最新版本...\n"
git pull origin main #2020年10月后github新建仓库默认分支改为main，注意更改
printf "\033[32mINFO \033[0m 拉取完毕，您的博客已是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "4" ]; then
printf "\033[32mINFO \033[0m 正在提交最新修改到GitHub...\n"
git add .
git commit -m "Update posts content"
git push -u origin main -f #2020年10月后github新建仓库默认分支改为main，注意更改
printf "\033[32mINFO \033[0m 提交完毕，您的修改已上传至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "5" ]; then
printf "\033[32mINFO \033[0m 正在为您下载最新稳定版butterfly主题 ...\n"
git clone -b master https://gitee.com/iamjerryw/hexo-theme-butterfly.git themes/butterfly
printf "\033[32mINFO \033[0m 正在为您安装必要依赖！\n"
npm install hexo-renderer-pug hexo-renderer-stylus --save
printf "\033[32mINFO \033[0m 安装完成，感谢您对butterfly的支持！\n"
sleep 1s
printf "\033[32mINFO \033[0m 请在/Hexo/_config.yml中将theme修改为butterfly以激活主题！\n"
sleep 3s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "6" ]; then
printf "\033[32mINFO \033[0m 正在为您下载最新稳定版volantis主题 ...\n"
git clone https://github.com/volantis-x/hexo-theme-volantis themes/volantis
printf "\033[32mINFO \033[0m 正在安装本地搜索必要依赖！\n"
npm install hexo-generator-search --save
npm install hexo-generator-json-content --save
printf "\033[32mINFO \033[0m 正在安装页面渲染必要依赖！\n"
npm install hexo-renderer-stylus --save
printf "\033[32mINFO \033[0m 安装完成，感谢您对volantis的支持！\n"
sleep 1s
printf "\033[32mINFO \033[0m 请在/Hexo/_config.yml中将theme修改为volantis以激活主题！\n"
sleep 3s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "7" ]; then
printf "\033[32mINFO \033[0m 正在重新设置github global config...\n"
git config --global user.name "xiaobaisky" # 记得替换用户名为自己的
git config --global user.email "417225230@qq.com" # 记得替换邮箱为自己的
ssh-keygen -t rsa -C 417225230@qq.com # 记得替换邮箱为自己的
printf "\033[32mINFO \033[0m 即将打开sshkey，复制后可按 Ctrl+D 返回...\n"
sleep 2s
less ~/.ssh/id_rsa.pub
printf "\033[32mINFO \033[0m 配置完成，请将sshkey添加到Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "8" ]; then
printf "\033[32mINFO \033[0m 正在验证SSHkey是否配置成功 ...\n"
ssh -T git@github.com
printf "\033[32mINFO \033[0m 验证完毕，您的SSHkey已成功绑定至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "9" ]; then
printf "\033[32mINFO \033[0m 正在清理仓库缓存\n"
git reflog expire --expire=now --all && git gc --prune=now --aggressive
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "$answer" = "0" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exit 0
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${HexoPath}/menu.sh
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
