From: ldevulder@suse.de (Loic Devulder)
Date: Fri, 13 Jul 2018 11:36:07 +0200
Subject: [PATCH v2 1/1] Fix README for Khadas VIM board
In-Reply-To: <20180713093607.26121-1-ldevulder@suse.de>
References: <20180713093607.26121-1-ldevulder@suse.de>
Message-ID: <20180713093607.26121-2-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Explicitly add 'python' call for 'acs_tool.pyc', to avoid failed
execution on some OSes.

Signed-off-by: Loic Devulder <ldevulder@suse.de>

diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
index 7eaca724f8..2f30831436 100644
--- a/board/amlogic/khadas-vim/README
+++ b/board/amlogic/khadas-vim/README
@@ -67,7 +67,7 @@ Go back to mainline U-Boot source tree then :
 	fip/bl30_new.bin \
 	bl30
 
- > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+ > python $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
 
  > $FIPDIR/blx_fix.sh \
 	fip/bl2_acs.bin \
-- 
2.13.7
