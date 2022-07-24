Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B203C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 23:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw5iZtnEiW75IC4vzh0vib7Lr2GS9j5uZ2cgQJdfuGY=; b=gZp1Zxx93MkOj2
	e7gbO8oRWeT5mdKsBfaLgP3IURVfTwX3Ek6IY/duIy1xp0spH4OMBHMCm66Rge6LhQrg7dp0DORVb
	iGzkpMuIH/7Bec/Pu90QFtPcNwkFBlrHMYuge6JhjXUSymenUmx6191189vdmRS5irWMs1zCo8qTd
	u2vGdg5ccmEKAZqfEL/sf1xc3aYayZqrtVnbFsoUat1AEz9zQci8BEj2NWBnMtNDoPt1pvUgCfaAg
	f/WlUb+dnRLNkpxPaUiKt5N+XE1/g+gl1v0gYyLD5z64U4kDKTAoyzBfxPdmDt8nAJOHZb8zRF//8
	Jg3NEP+MoEi5Tc5Lfggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqr-00G7Av-A8; Sun, 24 Jul 2022 23:17:33 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqm-00G752-3W
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 23:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658704640; bh=8aApajzEktIG6Zsp/DJOg+Sx9VlGRE26o0ibiFJZVlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sAwTs0CpHdJ9H2egM2JwCPhtyQgvZrN9AB+1uyslKN8L1N/T8pWQkUk3fKmApM6UB
	 xnCo0BkU21xlEt+Hdbz0GqnIx3pvnX/QKmHKtCfvuOFeEe8s0fjVVxntAz+5WdZ5mf
	 dD9DrovF/oIk3hNARbK+d6MgEb07UOE7WN0seV6U=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 44B2EEC3; Mon, 25 Jul 2022 07:17:11 +0800
X-QQ-mid: xmsmtpt1658704638tc2eswaci
Message-ID: <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIe0XFJ+V02CZDLlqyBJ2EqOeVb35jiqyZHUdzZQ7KtjcfSnqqk8u
	 gH5rbU0yd5E8+yHJVC4LVFONp4FzeCRos5eugP0etwEAa35UJoab4LPZtQAkKRvVCqb0uRI2F3C/
	 +gz7yXHkKmSTr/ZGr5gW20KsihfbjxI9kWEy7gEjhajpp/b4COZwAE17OtI3t/u6Zyu6b0HcDyRW
	 F0ehg8A2s8Aib24OMCFAjiAIH8RjP6frtWkrROSkc19eBT4VUB3edr/w8rBam7+99ZhUyo2/96+J
	 +405m93PUUh0nlFIJ7eFk8Z3mkeFCnB6oIZW8BeiwloKGipkh1ZMr/KYZe3gykCA85S7peRoUP9p
	 oVMH/syBL07sXbThJG/FWfnr/7T3HCtd7ekgCIX1g6azq7X85lGc7b3LDtVnwdN5zDUe+gokZWj/
	 VvgEeViR/Z6SzFT+Q2fwB5bjNE3HwhTwP5pWdOn/7wSQsIcngn/T+Z0xlA/gT3Q/hOsTq+faA8ci
	 l8/pj/5XScuOomMCniPtRUCMi6VBEfYaMQCR3VsiqbKZnHIBJ9mbikKLAvoIXEBbOkB1WRo62Hmd
	 XD1K7CBna09poEL5towOUYWXOUFE2d9FcibkMJrkSlDdEtmZPx0UPwn1RXqbauUJsciniF+xCIKD
	 UJm1J9Mo1PliXgp/bfNIEt3NGLE2ne7vqPSnHfXCEV/IUNhzNmYZh+T3Ta/Zu8T3En6MOmHZZBrs
	 EVvdZEo5JOzIBk1kObFB2cKDwQtROQ1C6jTTezCiJCG/PIvRoiLcLDKLDGWssNqkKn+R91VqmXsc
	 nxPGob6Z1Wllsp1skf35uUoMgv7xyhZ2PP/x/GGv7YotQUH/P4SgpREmMxxhOIaFi4FR6LABGAyC
	 fhuJfaLoIWGPLr+XdGWuDmCBl243j91zd0PtwcDmW2Rdh8xyyv+KKYa3MiyCxr9g8PAh6OTdYBN9
	 IxyDxb5gQ=
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
Subject: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
Date: Mon, 25 Jul 2022 07:17:04 +0800
X-OQ-MSGID: <20220724231704.132472-5-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724231704.132472-1-zhangn1985@qq.com>
References: <20220724231704.132472-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_161728_612456_C0DB4291 
X-CRM114-Status: GOOD (  12.01  )
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
