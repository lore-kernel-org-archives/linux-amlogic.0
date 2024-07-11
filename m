Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83673C3DA42
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 03:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZautjTYO5da1x9+olbSRrxrC/ndhtwiYsvMgq7yBW8=; b=bqHVunH/0u2eP4
	qUbiJ/ts3Nl+yjMvX0MIeOfQTiC5wtl6wHJSoVXQ8erZulRHOyiyVo5v+HTFF6P1oEQjFLt99oz1m
	QOx4AHz9kv0nyC+N95pQxnQUA9FzyWnL597lRtbSp5/BMbivP4gao4fiXNejDZ6K5lVzJZ3ag2UG+
	FkoAO1Iv95ufqwa0EcLFE0hFFRNEP7NM1Mxv1P06UeBNk0gxpHYfKtUoviYlV7ckB6aLhSuupcsRR
	NZMENA70qYXswIxucU69iGcEuKdnEEAAvlOnjzo4hYSyE2C1qUE9NqKZzK/ivXMpHw/gO3RyZXrIP
	4OoldDMiUWM1Auc925ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkgR-0000000Cak9-1Gfj;
	Thu, 11 Jul 2024 03:41:27 +0000
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkgO-0000000CajJ-0kWn
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 03:41:25 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 46B3eorh032509;
	Thu, 11 Jul 2024 12:41:01 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 2/2] arm64: dts: amlogic: change product name for Radxa ZERO 2 (Pro)
Date: Thu, 11 Jul 2024 12:40:35 +0900
Message-ID: <20240711034035.3921122-2-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240711034035.3921122-1-naoki@radxa.com>
References: <20240711034035.3921122-1-naoki@radxa.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_204124_678474_01FE7651 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

a while ago, we changed product name (hardware is same),

from: Radxa ZERO2
  to: Radxa ZERO 2 Pro

this patch reflect the change in dts.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 arch/arm64/boot/dts/amlogic/Makefile                        | 2 +-
 ...-g12b-radxa-zero2.dts => meson-g12b-radxa-zero-2pro.dts} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm64/boot/dts/amlogic/{meson-g12b-radxa-zero2.dts => meson-g12b-radxa-zero-2pro.dts} (98%)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 29417f04f886..5694ad0edcde 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -31,7 +31,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero-2pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
similarity index 98%
rename from arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
rename to arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
index 8445701100d0..5514ca9a62fb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2pro.dts
@@ -16,8 +16,8 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "radxa,zero2", "amlogic,a311d", "amlogic,g12b";
-	model = "Radxa Zero2";
+	compatible = "radxa,zero-2pro", "amlogic,a311d", "amlogic,g12b";
+	model = "Radxa ZERO 2 Pro";
 
 	aliases {
 		serial0 = &uart_AO;
@@ -169,7 +169,7 @@ vddcpu_b: regulator-vddcpu-b {
 
 	sound {
 		compatible = "amlogic,axg-sound-card";
-		model = "RADXA-ZERO2";
+		model = "RADXA-ZERO-2PRO";
 		audio-aux-devs = <&tdmout_b>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
