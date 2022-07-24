Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BB0C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw5iZtnEiW75IC4vzh0vib7Lr2GS9j5uZ2cgQJdfuGY=; b=tXdpGznSnhrd3D
	tARyHjrPB89GhilC4x3D7hqeV4boiEhXrEUn0nME5KsIU4Dxg3Rwnh9lVfoOOZ31Me/PqxVL2aSRj
	T2/rBQL9fNivFXznEtpS837BHHLI9XbV76b+quA/UbiX6MHXEMPyQZ5ACM/Gn1jP/dhTmJBU6gZNH
	bcL9ChMpBzEkuBg5H46ZzejsQsW2NrqD3C6qTvSAdMM3qu+Ubhb7YHJb08TOwm0b1y0bq9hIRLWQh
	r+wPsGFJxQclX6aX+EBiCel+Cc8doBSqv8hrdeRgyA/BhJ1Eo2N3dBqakoRwu/eQ/JhNffgu5nX4U
	GasogaKU3ziR6GECDYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcR0-006WM9-Sy; Sun, 24 Jul 2022 14:18:18 +0000
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQx-006WHD-O6
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 14:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658672293; bh=8aApajzEktIG6Zsp/DJOg+Sx9VlGRE26o0ibiFJZVlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i46R+rE1M43YMggNnv90wujLs6bMojaFZ+zpN2ZNSpWrLJlby/FusMGj/LAK7QF6o
	 7O+haa4p2EJnSuPbyECqnmvSS5Hnen9IAwCSJAsdk+zse2EwTYYl8PMdQSUVw2Uosu
	 CN18kcXkqsdQCPd6Yo1NWMk9+JROoRX+KBppVNSU=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 48289623; Sun, 24 Jul 2022 22:18:02 +0800
X-QQ-mid: xmsmtpt1658672291t0r5bgcdz
Message-ID: <tencent_D2763D1B2769C109B8067A83878B86B1E707@qq.com>
X-QQ-XMAILINFO: M0yQCYO1Pk4BOayfUrq5rfDfRwVDsX5gyYZ0UITeKys8486O1c/KX3YTRKEFYl
	 FMmCJHLLQjR5Yi1+80+pFkILHOR8LKJXZ0jfV8wjHmVK+2LoyYgL3EM2K9E0qxrjJNDIIDJ5Gf4S
	 S5CLAQ9drMbGPX+7/6o5Wv3eXMlqRXIoumkRAiUsnImXLJzy8WBmtN8SC0D84kHqwLqla3IfSwKb
	 TjRjxBL7eIYhGmf3h2N4F0w5L4LqGCWhi7MBVWYg9yo4mmuOXINq/Mx9IihJVq2SKfbJhFdTvqnO
	 Ec1hE8Sb2t6eGl52TatHb0OLcUQj4CGUhHL+D+0JiMJKY9icQp/bfJVRqi7AmL+NHtb6sHTq/AUd
	 2dZBbx2i0CV3zQv8+Mf4TGBzc0PLu6/xFrV8XA5tRvd0LsZ1LrPmJZrp6aubpB1BeKgXPSz5d0ij
	 VzaPY2HAsPzBFYxzHZyWo1x/xz0XJD9ye25p2FqSE1kaR8ak+VknCtQ3707WRgCY6FSI3FiTs6Yo
	 /4SRQPoZebS6OSaxfvyF9WDuJw7SOB7hDUsnQVtw8YyISQSXe3cDYpQr8rjk2IVQSzAIVVySIxTe
	 Dz8t3v+X2KylceMN+NhqN+AdNrQ2dd3UbJb0YxIHv8/SO5IbofXMJR/X43yilAA092U3hDlKpkw+
	 vOmo1SLeLD0Y5iltPrSbIkzUnXd/8Cb92TPZOUvzNIaQG9U4w29aWZxBwpaWu0vZcSg9ajo3arIO
	 WjQw4AOSmLsiNOVYDvXjjhXnT/xp/INWEZZFOkhpa8rXCgffymJutI40eesmqStVPIhhRy/57jGV
	 wuO5EjLERnpSF4e3QlKFTr18S8v7LAPS5/ZnzdFxlZu2qCH/NQbXUNt21YVyE8KjKPQOHu4+qNva
	 iIc5S51DmBl0pYnwWRDNYGsDiYM41yA5evovGpPbvt4C1JHGpIqYaJ2eyUpjGKRQ==
From: Zhang Ning <zhangn1985@qq.com>
To: martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sean@mess.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v4 4/4] arm64: dts: meson: Add MagicBox M16S support
Date: Sun, 24 Jul 2022 22:17:49 +0800
X-OQ-MSGID: <20220724141749.131724-5-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724141749.131724-1-zhangn1985@qq.com>
References: <20220724141749.131724-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_071816_109003_857A8B8E 
X-CRM114-Status: GOOD (  11.59  )
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
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
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
index 000000000000..69e72687ac9c
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
@@ -0,0 +1,40 @@
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
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button-power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+&ethmac {
+        phy-mode = "rmii";
+        phy-handle = <&internal_phy>;
+};
+
+&sdio_pwrseq {
+	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
+};
+
+&ir {
+        linux,rc-map-name = "rc-magicbox";
+};
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
