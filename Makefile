CP=cp -r
RM=rm -rf

srcs = $(wildcard files/*)
dsts = $(patsubst files/%, $(HOME)/.%, $(srcs))

UNAME = ${shell uname}
peco_dsts = $(HOME)/local/bin/peco

ifeq ($(UNAME),Darwin)
	peco_dsts = /usr/local/bin/peco
else
	peco_dsts = $(HOME)/local/bin/peco
endif


all: $(peco_dsts) $(dsts)

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
