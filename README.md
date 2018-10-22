##
## ETNA PROJECT, 20-10-2018 by ROULE_Y
## ETNA_HEADER
## File description: 
## ETNA header for VIM users
##

## INSTRUCTIONS

1. Install PATHOGEN PLUGIN MANAGER
[pathogen vim](https://github.com/tpope/vim-pathogen)  
Add `execute pathogen#infect()` in your `~/.vimrc`  
and copy `pathogen.vim` to your folder `~/.vim/autoload/`  
To add a plugin now you only need to go to `~/.vim/bundle/` and git clone the plugin.  

2. Install the plugin etna-header
In your terminal  
```bash
cd ~/.vim/bundle/
git clone https://github.com/turukthecook/etna-header
```  

3. Configure the plugin etna-header
In `~/.vimrc` add the line:  
```
map <F4> :AddHeader<CR>
```  
In `~/.vim/bundle/etna-header/plugin/etna-header.vim`  
Replace the variable "header_etna" content " by LOGIN" with your login.  

4. Use it and go further  
Create a file with vim like test.c  
Then press F4 to add the header, modify the project name and project description, done.  

To add more filetype compatibility, check the plugin file, it is easy to understand.  
Have fun without emacs.
