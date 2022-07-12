Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98FC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 14:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BLS559913psBev/anzeiYlmpfsnxMlXdAs8oH42F10s=; b=h/kcS1xqJpS28o
	mFqM7h87e+DICxUEbWnbUZj2Io0b5sRoNb8xpryHvlhn2etOjFVnXik25mFTSHbILxQS4+S6Fm33M
	Qq4BXCM+d0Rr9ZuJBg69UwUzCKYUrkmbTZX7P5XqmSgZBPrcEJpp5NKSYQks0VvnZd1AjxQYHz+se
	sm6DjQYk90P2PLRCRFM9DzExaJ/AOGLQq0otmrgq5PJHbR/LrmLJxPcvya2LlFqhnvMH163U1wVnS
	i2zg6JFHzIq2DsXFz5g4PVE1BSYFDAw87Gp4WNajzeuWHN5y1+H61zj3AGKTN22Sy7cAI89sKWmp8
	lu2smoL3Yuxhe3S8P9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGon-00BglR-3e; Tue, 12 Jul 2022 14:24:53 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGoi-00BghW-8i
	for linux-amlogic@lists.infradead.org; Tue, 12 Jul 2022 14:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1657635879; bh=/oQMXHUypDVMZ9kircvgiPPG8uI4ziB0xvtL1YmzSU4=;
	h=From:To:Cc:Subject:Date;
	b=VPDrt2jqXjSgYSo337SYqeqLvsAet5v/i8iIbxmU1HjU3ChflTqsWkEmHZVk8NR0E
	 cJSjFxjX1dI+bJirs4RuB4jx9fW23Di6bdSt0kjjl6EQXl4EnmLQfMg9Oz3aaBF43D
	 /oUsIOkLum39v5vS7ynCewllTcOBFPjjeNenkQX0=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrsza30.qq.com (NewEsmtp) with SMTP
	id 625168CE; Tue, 12 Jul 2022 22:24:37 +0800
X-QQ-mid: xmsmtpt1657635877tp7b68oxj
Message-ID: <tencent_5FC75850BB8ECD9374E98461C38C41CAC506@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIenvf2soaMAlNhDeE4FAs+rCRqYcpduDtc0UxCMmCVtd47mm9eLq
	 NvoQFnSLkFaXH19dCsqC9WcDXzcVonoC61q42iuF6dMVC6o638dplVhbgwEbeAyZA0RO4WsFCWqd
	 HntQZBbrjx0BEDEEFwlx+lSgONcgVEIxQv7KRN4UHi0B8aL/PU47OhslCpF+gMdcQTIWqKq8YW2j
	 YwsWeC3/i0z2r/hC6RHORQYh5gel/spN+38c0uTRDrQ4WYR6nzYSZYFO/tihOd6zUhEjCIjPfoCD
	 BqTa8Rwr/OiDN2ZPsI40/6jiqK/tBFDObF/Xxk3DrwWciBtcx6gu2Mgn8VfwaQJ+NCnUtm/PweqC
	 uP2yU2G1s+TvJ0Awn7Y0OrcuDL2BrJEhby6VHbh4/fdSugEjGOG3nadk8DuxcF7J8gEgr5e3HCQ5
	 v1WVeibz2dZtMEYbxIm10DIjErl1CsDoNYWvrOv1cuyWIbCyEApgtxV3py0RBS9nNnr5zPbkbNIb
	 /eDoPAsFFG4TXkeqnd00OsyyAngjT7GwiJHfq553KQF7OeHvVLVfZ1A6FeEG8JcjaPtwEEdxxUGF
	 /twX2+TUX9RdgJaB2afLuoSgz37dWaF1uYOpIqciUSMyypyWJCCP3m8pkOIr0Z4xHU43gViOb0u4
	 xTjj4Fu6rnsm2ERJFU+NTEFMCYOj+F95f9wFwUcoHXf5TR4hV1AOk5+vDE+0+Pxx1yCOLXbI3uMs
	 u6u1fM+BB9jr7037mXe/VxGhXgBpmUlNLf1Btj4Xr188Ytww9dPqeECnShlc0SsnVfHJehAqvqHg
	 WWT9mZaxzYlwR7EcSTTBd+dOQ9vX7g+tBkwqYu66dyCDckiWEk04P76Y8DvB9OdzNrXNt8PG+3MN
	 E9wp/0yVpTIkjj3zQMKm2fVcVmSW9FrP4h1qL3JWBV
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	robh+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH] Add MagicBox M16S support
Date: Tue, 12 Jul 2022 22:24:04 +0800
X-OQ-MSGID: <20220712142404.26021-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_072448_807064_1BB4182C 
X-CRM114-Status: GOOD (  10.87  )
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

MagicBox M16S or MagicBox 3Pro is popular Tv box in China.

it's gxm_q201_v1 according u-boot log.
and it's almost same as Q201 reference design.

add a simple dts to support this Tv box.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 8773211df50e..e0907fb41829 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-magicbox-m16s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
new file mode 100644
index 000000000000..be543d65a529
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
+	model = "MagicBox M16S";
+};
+&ethmac {
+        phy-mode = "rmii";
+        phy-handle = <&internal_phy>;
+};
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
