#!/bin/bash -vx
# 前日のログファイルをelasticsearchに登録するシェル
#
# 基本設定
#
HOMEDIR=/fluentd/work

# -------------------------------------------------------------------------------------------------------------------- #

STORAGE=${HOMEDIR}/logs
TAILLOG=${HOMEDIR}/tail.log

# tail.logファイルの中身を消す
echo -n > ${TAILLOG}

# 古いファイルを削除(30日以前に作られたもの)
# find ${STORAGE} -maxdepth 1 -type f -mtime +30 | xargs -i rm -rf {}
# 1日前に作られたファイルをtail.logに追記
find ${STORAGE} -maxdepth 1 -type f -daystart -mtime 1 | xargs -i cat {} >> ${TAILLOG}

# -------------------------------------------------------------------------------------------------------------------- #
