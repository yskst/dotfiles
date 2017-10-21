CP=cp -r
RM=rm -rf

srcs = $(wildcard files/*)
dsts = $(subst files/%, $(HOME)/%, $(srcs))

peco_dsts = $(home)/local/bin/peco

UNAME = ${shell uname}


all: peco $(dsts)

clean:
	$(RM) $(dsts) $(peco_dsts)

.PHONY: all clean

peco: $(peco_dsts)

$(peco_dsts):
ifeq ($(UNAME),Darwin)
	brew install peco
else
	wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz
	mkdir tmp/
	tar -zxf peco_linux_amd64.tar.gz
	cp peco_linum_amd64/peco ~/local/bin
	rm -rf peco_linux_amd64.tar.gz peco_linum_amd64/
endif

$(HOME)/%: files/%
	$(CP) $< $@
