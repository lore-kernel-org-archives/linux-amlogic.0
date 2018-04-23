From: yixun.lan@amlogic.com (Yixun Lan)
Date: Mon, 23 Apr 2018 15:29:07 +0000
Subject: [PATCH] dt-bindings: reset: fix invalid SPDX license identifier
Message-ID: <20180423152907.5113-1-yixun.lan@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This fix invalid SPDX license indentifier, also move it to
first top line according to documentation.

Link: https://lkml.org/lkml/2018/4/22/713
Fixes: c16292578ffa ("dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller")
Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 include/dt-bindings/reset/amlogic,meson-axg-reset.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
index ad6f55dabd6d..4a8e52f68fb7 100644
--- a/include/dt-bindings/reset/amlogic,meson-axg-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /*
  *
  * Copyright (c) 2016 BayLibre, SAS.
@@ -5,8 +6,6 @@
  *
  * Copyright (c) 2017 Amlogic, inc.
  * Author: Yixun Lan <yixun.lan@amlogic.com>
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
  */
 
 #ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
-- 
2.17.0
