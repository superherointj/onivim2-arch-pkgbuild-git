FROM superherointj/archlinux-base
RUN pacman -S --noconfirm git base-devel

RUN pacman -S --noconfirm ragel nodejs wget fontconfig fuse2 glu gtk3 harfbuzz libglvnd libice libpng libsm libx11 libxcursor libxext libxi libxinerama libxrandr libxt libxxf86vm nodejs ragel wget fuse2

RUN pacman -S --noconfirm npm

#RUN pacman -S --noconfirm sudo
RUN npm -g i esy

RUN mkdir /workdir
RUN useradd -m user
RUN chown user /workdir

RUN chgrp nobody /workdir
RUN chmod g+ws /workdir
RUN setfacl -m u::rwx,g::rwx /workdir
RUN setfacl -d --set u::rwx,g::rwx,o::- /workdir

USER user
WORKDIR /workdir



#RUN git clone https://aur.archlinux.org/esy.git
#RUN cd esy && sudo -u nobody makepkg -si
##USER root
#RUN makepkg -i

USER user
RUN git clone https://aur.archlinux.org/onivim2-git.git
RUN cd onivim2-git && makepkg -s




# http://allanmcrae.com/2015/01/replacing-makepkg-asroot/
