################################################################
#
#  使用方法：
#    (1) 將本地倉庫的 BRANCHES_TO_SYNC 中所列分支上推到 GitHub 以及 idk
#      的遠端倉庫，則在命令行中執行
#		make push
#      如果需要強行推送，即，對 git push 增加選項 --force，則在命令行中執行
#      		make push-forced
#    (2) 從 GitHub 下拉某些分支到本地倉庫，則在命令行中執行
#		make pull
#      或
#		make fetch
#
################################################################

.PHONY: help clean push push-forced pull fetch

TORSOCKS = torsocks
TORSOCKS_OPT =
I2P_PROXY_IP = 10.0.2.2
GIT = git

REMOTE_GITHUB = origin
BRANCHES_TO_SYNC = main draft

help:
	@head -n $$((`grep -n PHONY $(MAKEFILE_LIST) | cut --delimiter=: -f 1 | head -n 1` -1)) $(MAKEFILE_LIST) | less

clean:
	rm -f $(shell find . -name "?*~")

push pull fetch:
	$(TORSOCKS) $(TORSOCKS_OPT) $(GIT) $@ $(REMOTE_GITHUB) $(BRANCHES_TO_SYNC)

push-forced:
	$(TORSOCKS) $(TORSOCKS_OPT) $(GIT) push --force $(REMOTE_GITHUB) $(BRANCHES_TO_SYNC)
