# Install Font
	cd && mkdir nerdfonts && cd nerdfonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip && unzip Iosevka.zip && cd 

	sudo mv nerdfonts /usr/share/fonts/


# Install Icons
	
	cd && git clone https://github.com/vinceliuice/Tela-icon-theme.git && cd Tela-icon-theme && ./install.sh && cd && rm -r Tela-icon-theme 
