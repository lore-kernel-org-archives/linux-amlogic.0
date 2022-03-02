Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DAAC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 02:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPLAOy7WVbrMv1+r4pIMQlZtJW5rxnCe3lT8czxiRTE=; b=GOlb4zdxY2i07P
	egqWe7VSMoy1Yl5Ys0mD1cx1eSVquI3+7EduCoufjXSQat5zdIzHaXraZdO36XOdmmDoGujGo/Bct
	2BohsMFShl5FY9gac1uHk/EryQEm2fjSivZ+M0otKFaNeli3xhb3UdRr2+1/g3wYpD6Nw0eGQzdVn
	dbvBPivxWdSCs4BJmEKNRoVMZ5NVDQiCkOQyfJnpGUer2yXJuhdc+Um9riH8MeFUmngOhbIsgC31E
	Xqo7JT5Q1d9+9Agvd1k8Xp1S+5OcXZDFP/6CDpxRHLF7gDhX1JPGBeNNAH7be9ZXq3DV2s7Wrq61+
	m8/zihVy8oM03pzGdgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPEeW-0014Om-2x; Wed, 02 Mar 2022 02:23:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPEeD-0014LE-D4; Wed, 02 Mar 2022 02:23:26 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Wed, 2 Mar 2022
 10:23:23 +0800
From: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
To: <shunzhou.jiang@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: [PATCH V5 1/2] dt-bindings: power: add Amlogic s4 power domains
 bindings
Date: Wed, 2 Mar 2022 10:22:55 +0800
Message-ID: <20220302022256.4083714-2-shunzhou.jiang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302022256.4083714-1-shunzhou.jiang@amlogic.com>
References: <20220302022256.4083714-1-shunzhou.jiang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_182325_467609_512067A2 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the bindings for the Amlogic Secure power domains, controlling the
secure power domains.

The bindings targets the Amlogic s4, in which the power domains registers
are in secure world.

Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
V1->V2: fix spelling error, patchset use cover-letter
V2->V3: add power domain always on reason
V3->V4: clear vpu and usb power domaon always on
V4->V5: add reviewed owner in patchset
---
 .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
 include/dt-bindings/power/meson-s4-power.h    | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/meson-s4-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index 5dae04d2936c..7657721a4e96 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -12,13 +12,14 @@ maintainers:
   - Jianxin Pan <jianxin.pan@amlogic.com>
 
 description: |+
-  Secure Power Domains used in Meson A1/C1 SoCs, and should be the child node
+  Secure Power Domains used in Meson A1/C1/S4 SoCs, and should be the child node
   of secure-monitor.
 
 properties:
   compatible:
     enum:
       - amlogic,meson-a1-pwrc
+      - amlogic,meson-s4-pwrc
 
   "#power-domain-cells":
     const: 1
diff --git a/include/dt-bindings/power/meson-s4-power.h b/include/dt-bindings/power/meson-s4-power.h
new file mode 100644
index 000000000000..462dd2cb938b
--- /dev/null
+++ b/include/dt-bindings/power/meson-s4-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc.
+ * Author: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_S4_POWER_H
+#define _DT_BINDINGS_MESON_S4_POWER_H
+
+#define PWRC_S4_DOS_HEVC_ID	0
+#define PWRC_S4_DOS_VDEC_ID	1
+#define PWRC_S4_VPU_HDMI_ID	2
+#define PWRC_S4_USB_COMB_ID	3
+#define PWRC_S4_GE2D_ID		4
+#define PWRC_S4_ETH_ID		5
+#define PWRC_S4_DEMOD_ID	6
+#define PWRC_S4_AUDIO_ID	7
+
+#endif
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
