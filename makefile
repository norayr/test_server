VOC = /opt/voc/bin/voc
BUILD="build"
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir_path := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

all:
		mkdir -p $(BUILD)
		cd $(BUILD) && \
		voc -s \
		$(mkfile_dir_path)/Internet/src/netTypes.Mod \
		$(mkfile_dir_path)/Internet/src/netdb.Mod \
		$(mkfile_dir_path)/Internet/src/netSockets.Mod \
		$(mkfile_dir_path)/Internet/src/Internet.Mod \
		$(mkfile_dir_path)/Internet/src/netForker.Mod \
		$(mkfile_dir_path)/Internet/src/server.Mod \
		$(mkfile_dir_path)/Time/src/time.Mod \
		$(mkfile_dir_path)/src/testServer.Mod -m
		cd $(BUILD) && \
		voc $(mkfile_dir_path)/src/testClient.Mod -m

clean:
		if [ -d "$(BUILD)" ]; then rm -rf $(BUILD); fi
