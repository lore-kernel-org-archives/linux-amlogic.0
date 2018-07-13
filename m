From: ldevulder@suse.de (Loic Devulder)
Date: Fri, 13 Jul 2018 11:36:06 +0200
Subject: [PATCH v2 0/1] Fix README for Khadas VIM board
Message-ID: <20180713093607.26121-1-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch explicitly add 'python' call for 'acs_tool.pyc', to avoid
failed execution on some OSes.

Change since v1:
 - remove USB addition, already done by Neil Armstrong
 - only let the 'python' addition in the README file

Loic Devulder (1):
  Fix README for Khadas VIM board

 board/amlogic/khadas-vim/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.13.7
