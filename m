Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12676C00144
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXAlqLL6JSx99G/cj788TjsQ4nJWLYSnmbLn/cWQunw=; b=gB8r66O1dpZ0EH
	e5WRu/fpKQ9LOvJNU72r1w7tLJCPwiygF+2uwBD+SG0tr0SAA/gxSNU6EumHBWup/SPfqgiJ78Wfs
	Zh9J/gddxAwyvISmo8NSNJ2URxUXLWVBgMlpvCtnwnVcYvuXPGyiaj7Yu8cpIoagdHTqDLSW7i9ie
	YqLQiFp3Gtcj+37ocwAkVdz6JnWZCn22CcXAAfACLd5sxYbPbZmkgS2fAidZj9HnmCmgbP+1wVKzF
	v06prE8NBYFD1mJM1wYGn7N55kP+32/WoPfkdI8VcNmxjHOCHpfw8vrnai6taRyL2Oi2J2en7sxS2
	UQDhIYyzMYziiiBxCwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgR-000Gz5-Ex; Tue, 26 Jul 2022 14:37:15 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgO-000Gw7-0w
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658846230; bh=VxkGhbXjGf37LnI7x26RsBh80K+FEHVEbibSo7zm8cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yJGnmzkeSAK0ZLvzPBgNVyjHkLRrUdH7Qn9OrrKJ4dwpsEcFKTJf4KGfcXJuFqGwK
	 8rNu+KxisAThLZYjZfj6ecQhNwYQEFxhyF0bmNwoNX9DFIV14/q8Qn7ozM2wg/2nW/
	 lYsK6CZqGRrNYaXbSvZ6+1ZHYwqHbjoCI0plZnc8=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
	id 940102AA; Tue, 26 Jul 2022 22:37:00 +0800
X-QQ-mid: xmsmtpt1658846227tk4yqb6fo
Message-ID: <tencent_A16341ED813658D205133A0DEA065D17A508@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85Nos30XMnk6Jb63+VT5ZFymwx5Q//fj4kWrLODFvjX0PoV2LHK8ef
	 ppjO0/t95Xv1Nl1gs6ErWm+W+V87rAsm05QGgCt66FnHwI2DiM4Pw/pHiZHKOte7i7a33wsZEo6p
	 gUCUuLgCB/wS69A3kxEt/dEPmB02n0COvad/6UFFhkOwn+w0g2FSCRDubc6lTVHpMv85hJwwg/40
	 mRSfiEkh0vFCdy0HCV/sMHMNaaZPM+WaLsSDnqON++mIy/RQ7+Jxaz98oDxA2kyYoiUIbkof1j4Z
	 fetFYQurnGnZueYO+5QG0Htl6Hm4hbYmKrlvpRxIqTMmUZ1RkZiEs9n8wcjt9MfWvAOPeBkixXFX
	 fqptl/HJPVjpSzX8PXJGYvykyBJzKcnyoVW7gcFZdHoI9bTDITh8E56e86jaHkbOj4A+ajRYhTtn
	 z0e4J5ka/elI0LTA7pqoMa032PP82JWBjRhlLILBWKFlaKFvkXSuDnwf0bx3k5Bv1W7r45nHlGPz
	 tmqr2j/VwpO/2horBs14RHGuMrtur4uhRoO7bNGlpfyMrNHqhFhJohmqRzPn3PMqTl8yBm/lv/vG
	 PhGEYVrLOzpKx2aATjER4A2FbDv201I3eHg7B+4qbUDaQkgKXgPIIXL++fCllO//pKgj9ufG2l7r
	 2h/+ze+6ZTUbOc+G+hPnfF13EbJA6ThG7U1lWQuqUdnWMpdScLd48A1uJaS0NN7hS7kdmWb+6xrf
	 NSvwx0qnQlzmrNN5xiqXDw+kyuR5QCNF6leGzdRyt4k8LNw0sdxJeyvycg7fWj5itj16GTty4Qn+
	 cA0wBIpLZB7KGYomWrVNY+T0+Fc6IvIMGXtpsHW4GBPDet0lYglSwruDB0SKv05bmrWYljoIjf6B
	 b8Zkf5Lr/N4K2gLaVZBhZfQ99S+ADv+AJstRImDhuh9/W4gh1R8hNZlHssKF/e0afvPOW1ohe5
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v7 4/4] arm64: dts: meson: Add MagicBox M16S support
Date: Tue, 26 Jul 2022 22:36:49 +0800
X-OQ-MSGID: <20220726143649.142574-5-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726143649.142574-1-zhangn1985@qq.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_073712_394688_FD76C5DA 
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
 - IR receiver
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
index 000000000000..5ec905b90d87
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
+	compatible = "tmall,magicbox-m16s", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Tmall MagicBox M16S";
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
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&ir {
+	linux,rc-map-name = "rc-magicbox";
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
