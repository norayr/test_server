VOC = /opt/voc/bin/voc
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir_path := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
build_dir_path := $(mkfile_dir_path)/build
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
BLD := $(mkfile_dir_path)/build
DPS := $(mkfile_dir_path)/dps

all: get_deps build_deps

get_deps:
		mkdir -p $(DPS)
		if [ -d $(DPS)/lists ]; then cd $(DPS)/lists; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/lists; cd -; fi
		if [ -d $(DPS)/Internet ]; then cd $(DPS)/Internet; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/Internet; cd -; fi
		if [ -d $(DPS)/time ]; then cd $(DPS)/time; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/time; cd -; fi
		if [ -d $(DPS)/fifo ]; then cd $(DPS)/fifo; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/fifo; cd -; fi

build_deps:
	mkdir -p $(mkfile_dir_path)
	cd $(CURDIR)/$(BUILD)
	make -f $(mkfile_dir_path)/dps/lists/GNUmakefile BUILD=$(BLD)
	make -f $(mkfile_dir_path)/dps/Internet/GNUmakefile BUILD=$(BLD)
	make -f $(mkfile_dir_path)/dps/time/GNUmakefile BUILD=$(BLD)
	make -f $(mkfile_dir_path)/dps/fifo/GNUmakefile BUILD=$(BLD)
	cd $(BLD) && $(VOC) $(mkfile_dir_path)/src/testServer.Mod -m
	cd $(BLD) && $(VOC) $(mkfile_dir_path)/src/testClient.Mod -m

clean:
			if [ -d "$(BLD)" ]; then rm -rf $(BLD); fi
