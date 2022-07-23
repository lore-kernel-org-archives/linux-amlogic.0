Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A0CC43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypEQGZ5kdmYOWVN2FRXiC9omTK+8nd2vkc1OYsKuI9s=; b=Kz9xUyJlhF+pc8
	08utSa98ZtKJXgL3kU7XVhPGcVZb66bonljNZfgKpyJbHxU3SxbL01+t2kAW0T+0Jt3f+2Mpc1+1a
	sQrzwxY+Gf0VHb+iLP/QeAVOJA499iBAxRInnurTWlcEyUgQeH/t0SQU5mFRRxwxfypnCCiLWCUrO
	WLq+IUw3umus/AUImfe4+oK/7A9H3Ptb0vCzdJgjlbsM518I0Dy3XnmiQI8Ai2Wl9RfwsDC/dB1/r
	s/HeEWmxVOAAOk9Nl2qk5tNwV1l9YQsklTU3gorWBRmFiM8elEoZvqBGni/q48J2TSTZbN1glZdBQ
	dQ8yHC6jbyZUA9l+i8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTy-005FFU-0w; Sat, 23 Jul 2022 15:55:58 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTc-005EsB-JZ; Sat, 23 Jul 2022 15:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658591727; bh=Gx4CwxTdsqdu52+0AQrCjRxRkteCRe2MGjitmOS+LEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7LAQbdtLvLr9P8SzjtgQmwxorA4cL/N43LVmhwn8gP9Z7K0VsPPhMBlpL5O+Zw46
	 V+q1PjLY3hh0Jm0Xr+3YYIe6rdFTccu+j0fS7RxYaOjgYePPAGou6uQiVvYINbzoeu
	 w/KryKvF1vp8OyTbfLjhwH/qbBApPOYXR1eRQTFc=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id DD800C3C; Sat, 23 Jul 2022 23:55:24 +0800
X-QQ-mid: xmsmtpt1658591725th4zhwdeq
Message-ID: <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
X-QQ-XMAILINFO: OWaeKR31G3ne1neVORIe8q4XxFzrEY0yTx6V5Rs3eNGDmYA+z+Vhelm5jDLTFN
	 3QvDfl5Y75s2v1MFlFwYOAKk2PizrYkye69XjSpfvPCXGzNlde3pUvFHVJKSz5ChUT9KTYMBP4vv
	 S+Xcc9nBZah2pizil0AfJF2/1pwOvkVeHRKx+Uy+zu1FzRvKtxSFAMYvWKlRjJAhAhLJfV1l3AhB
	 ehSmNMBLwl03z6GzwEBZ7Vf7fpaLbKHz2PRzc+fun8HZY6j+RTgXZgVuDDWWCxCHDffOm3sDu5Qp
	 q7h7dM5XOeQ6BqJD2gOBR+EOdcB8BVTwZNU88AhuUqFin2Q0KtzduBXky3l6S+Ed33Kaeu8tYh47
	 hXN9+3/Jt9xJ6rbl1JgFTOyai3OQmzI06zvRSYhKHXMa2w6TcL2LmIK5VRJFtoTlQl624VHW5cm9
	 OkUPbZ1iBhZyrxB9k3/5U+8t8XNx1vHvcHnPUvRXAEPhp5HmONTZxQNCmdz6S1qZmRcMmyHG9CVp
	 WVAN8JQuD7pjyOnGLiGtPKToOKZSowucM9ApxnumTM1HzA5g4EVACQtRHZ7v1p8KoC7Cckj02tdK
	 8K2lCScNGX1lqF7XckJsq9iDquMhDhtKrEZ5UakUrC1rXFA2fmqmbaBY+w3XJ3Zi7h5XrxjjjnSk
	 5Dl6NvYeh2W2QrIf5MGpQ5cRdSAOz7BLPgwZpkI+8K89i7YWmHkAlpSeRha+8A7yMmrENtavYrMd
	 X2Uqp6SblzJMcUw3/kp9HKVZ4WuEkn4EtgabeEEU2MKHJPVRbfqaS48IBOJYmp+ByzBduEdD7t7y
	 gu9QIzfK6tkOgBtltHDiyo4c+ODUZvIalNc4E4uzwGSyrYtPd0Efq8EWHx+cf5G3/QgpaQ53aafw
	 +sME7o7OOsL3Nv08+/57YRCkTXlk4Vs+fDDNZjFmQloincQcTH7DmSrP4/o/RRYfxOsE3uwHU1
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH 1/2] dts/amlogic: Add MagicBox M16S support
Date: Sat, 23 Jul 2022 23:55:01 +0800
X-OQ-MSGID: <20220723155502.127404-2-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723155502.127404-1-zhangn1985@qq.com>
References: <20220723155502.127404-1-zhangn1985@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_085536_962148_4C932C52 
X-CRM114-Status: GOOD (  11.18  )
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
