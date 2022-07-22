Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED010C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Jul 2022 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ypEQGZ5kdmYOWVN2FRXiC9omTK+8nd2vkc1OYsKuI9s=; b=gJX7wKc95GoKH1
	5UsSRNRPGjDctWiC9fa1JXUiPSf9p7fpdNrA/XN1M13YEp09U0JPt+U+gII9FAARPVwmIOnwbGG0J
	Xg/F6g9cxw02GLAMjFdyZUaDO5MQadYR2L2ytdi+0dqVLiQtR8Dv0tjW4Upv9bEAE6sUFQm3q3Aus
	ELIle8OYyheI8Grv2MZh6uNh0O9mQ03RtDWJwvFfGnHZg+oLYKuQqW1ioSzqO3yK4+l3cBVL3o5Ao
	/6i8UiJl4lXp07SrkqAxvQoawi2OPmdQDWrPAsUmVAVc7KjcbDM9O0+AN51lVlddmWRXwOXw8FEqt
	aw1RqTTq9Px8nVaYFrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oErzT-004Q3m-EN; Fri, 22 Jul 2022 12:42:47 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oErzQ-004Pwf-0y
	for linux-amlogic@lists.infradead.org; Fri, 22 Jul 2022 12:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658493758; bh=Gx4CwxTdsqdu52+0AQrCjRxRkteCRe2MGjitmOS+LEc=;
	h=From:To:Cc:Subject:Date;
	b=yZARD4pjLUkhU3J5eSMU9M3P197yGLCrVRaXApTKCXm+FnfOOvNiX4lpEHS1oM19I
	 6U7Uskdk/9x2+9bqCajeGZ/UthhtNkb+jpyAvMT4d6MOr7sv5OU1DKtACLcA6jmN2z
	 Kjskr10CKpqF0JFYR/7zUgtdAUaAp9vnEiRSOr/w=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id AA43A68D; Fri, 22 Jul 2022 20:42:36 +0800
X-QQ-mid: xmsmtpt1658493756tw48xnl7b
Message-ID: <tencent_E909DD0619039C0BCF31DA763D1B3BE9BC07@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjoypVUBi07jmLLTrmcbFa5aHEI2JaD1iqD7tFjD6n3+K/OZONd8
	 fiX/7v6v+nMMNof37Tjh/xOi5emZ51ziqS3PZfLdh671kkLiYGA6RTntANyWiq6WFFJ6/xqdKyzU
	 SJ8z8P0bTnGSRmRBOmZ4FRqEedP3ATDdjIjau32Yd5f02uQbxf8Wq4H8hldVJAaN+CIpaoXIeAvz
	 8TmMdo0sAvZgWidY2Qn9sD+gVGjzF6eJXtdZKZ47UYgCWgRaHMm5CXC11ZpxmREl4eYBsBjwbRzp
	 lC9ZfoL5je5jKOjbWKgs+DvdRncF38qZWRVcZqwvA3LbF1i3rRrEdAaNt3jzSVpBy6WeUP554pFS
	 nZK7ZpgG7d5Z763S1JnQ4ra11krqxr5CCE14QBP4AY03+ZZ82I0/EtjpcMEaD0ndemeD8NT8oWCy
	 Wq2WQZimad33PPb48kAapoD29fsyZXJCcSZmCx+XH/BH9LUcTh7VKYmux4Ofih0CIFjaH6ek2LiI
	 nCcS2YDi7/190qfT4AhqFzL8n2EnW4OKOP5ZmkuoQKqbx8ovuimgDMQUdhocM0lzux3NCU4IM+tP
	 vKNuw9fVrN6sZuAiTB0bd5E5cK0IGaKHeWFGtZFIVlUori9sU3grKUxAHpG9DqXd78umL9vXLfYU
	 5vpf6M7JnJ7NX16TxGscFcaXnha/itvcec/jlbEChpZAfFdvfxBpZDwFsfRxJ1W7TXzYuJnvXhZC
	 53OwHfvHuuxdR1L5rvxcZ6NJE5TvJMsgyJrg47r3l0oFiHHAa5X5OTrHuNdu9+OyiWp6rdRdFAUK
	 ItTSRdfYobX4EtkkoeTmOGLcxdchF8KyoUU+qR0EIEm7+2+gQmP1Ko9/WccM8kOraeto7hlst3T+
	 MXG6GO3oQ6fQqE69qSceciwR3fFPL3H+VmqbiLW59TvPfRC0o03iE=
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	robh+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH] [V2] Add MagicBox M16S support
Date: Fri, 22 Jul 2022 20:42:02 +0800
X-OQ-MSGID: <20220722124202.124814-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_054244_454603_6AB39829 
X-CRM114-Status: GOOD (  10.64  )
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

it's q201_v1 according u-boot log.
and it's almost same as Q201 reference design.

add a simple dts to support this Tv box.

Signed-off-by: Zhang Ning <zhangn1985@qq.com>
---
 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 36 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 61a6cabb375b..3eac16a4de68 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -123,6 +123,7 @@ properties:
               - khadas,vim2
               - kingnovel,r-box-pro
               - libretech,aml-s912-pc
+              - magicbox,m16s
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
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
index 000000000000..464de73d2f0f
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
@@ -0,0 +1,36 @@
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
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
