CP=cp -rv
RM=rm -rf
MKDIR=mkdir -p

srcs = $(wildcard files/*)
dsts = $(patsubst files/%, $(HOME)/.%, $(srcs))

UNAME = ${shell uname}
peco_dsts = $(HOME)/local/bin/peco
ifeq ($(UNAME),Darwin)
	peco_dsts = /usr/local/bin/peco
else
	peco_dsts = $(HOME)/local/bin/peco
endif

dein_dsts=$(HOME)/.vim/.cache/dein/repos/github.com/Shougo/dein.vim

all: $(peco_dsts) $(dsts) $(dein_dsts)

clean:
	$(RM) $(dsts)
ifeq ($(UNAME),Darwin)
	brew uninstall peco
else
	$(RM) peco_dsts
endif


.PHONY: all clean

peco: $(peco_dsts)

$(peco_dsts):
ifeq ($(UNAME),Darwin)
	brew tap peco/peco
	brew install peco
else
	wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz
	mkdir -p $(HOME)/local/bin
	tar -zxf peco_linux_amd64.tar.gz
	cp peco_linux_amd64/peco ~/local/bin
	rm -rf peco_linux_amd64.tar.gz peco_linum_amd64/
endif

$(HOME)/.%: files/%
	$(CP) $< $@

$(dein_dsts):
	$(MKDIR) `dirname $@`
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh installer.sh $(HOME)/.vim/.cache/dein
	$(RM) install.sh
