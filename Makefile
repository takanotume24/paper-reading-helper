build: src/paper-reading-helper.cr
	crystal build src/paper-reading-helper.cr -o build/paper-reading-helper

install:
	sudo ln build/paper-reading-helper /bin/paper-reading-helper

uninstall:
	sudo rm /bin/paper-reading-helper

update:
	git pull origin master