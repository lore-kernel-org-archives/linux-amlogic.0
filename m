Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC93CCA48F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbcO9mLin6e7PjDnYTgj6OZfQbL0pclCjtWutsfNvfA=; b=1V/ozDUpTAVRZZ
	7rt098UXxbEukUe1u4MT9XfbOyHUQQSydlUqiXbpwSdUM2qb3yMTdyu7dSGxng/CaE3t/ux639bkM
	iV2T/owEU+S4RieiVG1Z2wbP4ZatU28lUC+uv/zg37xicURzPOhoay/trjhm9SlAoXyDeJJ8TNfWe
	9/xaVb3YT5GpmmJivUVenMgI82LZXYiMTE2U6CjxT41NcFWCqIAgQqc/RNpBuHlSfHZ67gRphnhvE
	IpUAiLGEPQUi972LHImCrb5Pl2DRfB4jTB8VF+rkSJLfDiUCmn3+PxPjMVF7dsQrY/beh5B5d+2SS
	vRu2qfPG3kP9QCmEWX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPo-00HJ2d-8K; Tue, 26 Jul 2022 13:16:00 +0000
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPi-00HIyi-87
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658841352; bh=Ay3uGCdj6UXBUBlX0YszGUrHgL/M41qJVH3zomvxdkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uR/CVcHLmwE0qukIFVO/bg5QlN9cqH26rp+WAo00xbLZIhcka0enqeoA8IWbkTSsx
	 8a4Tt7cBC39wVh22LGPp9oEdJ0P4Dxej8dMiSR4NCOSGpbd2BfFyIIw3g34erF94RM
	 XUWhRMvQW5G3HU7ykPXnlyuL2OHjPRXgD7ow9jSo=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 3EA1E4DA; Tue, 26 Jul 2022 21:15:42 +0800
X-QQ-mid: xmsmtpt1658841350td02hp0ix
Message-ID: <tencent_5B7303B78BDD31AE76439B1BE9D289908607@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtRE6wXnMXRvfCgYPmk+nx31mr2g5WgCbDD+u5e2a144Tc56yfAz
	 SEUDKDj/glL7LjGIjCd4hZg8DMl36KOv74KO9d42PNdeabfdXCKnE9zBhBsuXZ4I4M+QayqVxh1y
	 tTcGI3EGJpI19vRop3YaD0UeCUtQ2OoNvKS/FGgZq69cBhNdsbafnPbprGb4kjylsnmwnOXQkkz1
	 A/gm7GaWA57kVaRUse2Ua4cv4bD0cUO776YdpBfgp9zPh6X7dpyVGsDJbtZOHhitZOykgHWOyVQ0
	 gEbERuUoeuiwwn/esW0boUYZmO7OKuSfWVLUWbR/wZ4NSxza0Cr6BMEsDbqhmWU5pbgzZVzuwiyJ
	 0fr+mLNoRu/0x5SezVM2wLxJYQ6kVQIPm4esJxUI5QpYMHglmLL2IO95DChWSG/sltE9mVbHULzZ
	 ftwiJRP/E+giRpOIgOxK+ecmikHSVsAxC3PE9AzK1258PUhThSF5fTC3dctVFgTtqwh12Rkn2Tup
	 LWYlHt5ppUPhQh3z+Z0D1VBa3+HddnWtS+sg8dNOC4e3vC7pk6OdLXo2fkHHXiZcR4x9LwTpv5lR
	 X/sYse3LY8PnWWHFUxmTit2A9bGNR0Q70eUFfzLhoaBWKLmrJJpXJ2sDOjH5rSjB2RSoJrjwhOpk
	 8Q85AI5XydiNY1dWJ3vx2lDAu0eXnVrtLfOd/EdwqCwYedcE9/00IcXcNYN+FtR6Nha3EG8OvrBI
	 lmhnr6FmIN4ZhyNbyQGgE9GRO5dMIBZb0mUVY4oEuDprmP3wEThwe8DU9gZORc5emd4069pmlcVp
	 DarzoW5AP8sft1nEXb0+4Lu2XZOllKI0RZiqLpMGMnDes4kqHYGaRt8UEOerRhFUsTdHRx8wPE1v
	 7ytIaRTfpSqOgdcJmphoF6RKfv4vsPwkN4zyyMdQEO1y4MOVrbgxXgYrcp2eis1UZT0hQHsfpClP
	 +O3N9IfpDBipQACFATkKekCdw5uZs7W4wv9FakO40=
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v6 4/4] arm64: dts: meson: Add MagicBox M16S support
Date: Tue, 26 Jul 2022 21:15:23 +0800
X-OQ-MSGID: <20220726131523.140581-5-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726131523.140581-1-zhangn1985@qq.com>
References: <20220726131523.140581-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_061554_651197_34E5A611 
X-CRM114-Status: GOOD (  11.86  )
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
with spec:

 - Amlogic S912-H (S912 with dolby and dts)
 - 2G ddr3
 - 16G emmc
 - Marvell sd8897 BT/wifi module
 - 100M ethernet
 - IR reciever
 - 4K HDMI
 - AV out
 - Rest hole
 - 5V2A power input
 - white LED

it's q201_v1 according u-boot log.
and it's almost same as Q201 reference design.

add a simple dts to support this Tv box.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
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
index 000000000000..f1805115b177
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
@@ -0,0 +1,39 @@
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
+
+/ {
+	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
+	model = "MagicBox M16S";
+
+	gpio-keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		key-power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ethmac {
+        phy-mode = "rmii";
+        phy-handle = <&internal_phy>;
+};
+
+&ir {
+        linux,rc-map-name = "rc-magicbox";
+};
+
+&sdio_pwrseq {
+	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
+};
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
