## Custom Scripts

- [**custom_cd**](https://github.com/ianjberdahl/customz/raw/refs/heads/main/custom_cd) will always keep you in your working directory even if a new block/terminal/window is launched. Linux has 'cd' built in. This is for i3 and other Desktop env.

  `cat custom_cd >> .zshrc`

## zshrc 
Add autosuggestions and syntax-highlighting. 
```
cd $ZSH_CUSTOM/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git
https://github.com/zsh-users/zsh-syntax-highlighting.git
```
Then add to your *.zshrc*.
```
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```
