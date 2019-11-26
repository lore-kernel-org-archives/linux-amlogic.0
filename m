Return-Path: <SRS0=RHkW=ZS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03154C432C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA71A20727
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaZ1zoH0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mODUumIA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA71A20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUCFgDUE3FfoHll8Wr/CxwGgvLAYbS2RBOKmviooQ/k=; b=BaZ1zoH0tKuK0G
	NmyvTnR/j3lz1Ser3xo4tvt8/lsjiERl526FLx5MVAbDhjc6FOMQaHTZ8kMMbE2+g7RM17faJBdGh
	gMUE1WRefRlZWTSf1FCEOGqB1xuBPf17udzxSJsr5LpyY/UQNjOquXby6ySqzn7rC2+6mX+fpebnU
	Ym9ajQ8/HUXwT72zNTHcYIkuhAXeDHsf7At56E7eDvE8iAw1AZR48205oA59fTombmHy6YmJ6FNrY
	83lNyit/tp0BSdblk/Yqnl+NEA4eY9KL39EihOXD47+bgzLr7I1F7g/H0XKfJ0mX1qI9p8miQ44rH
	5+FVIyfVJE0Ye50Nve+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZYvj-00022r-R7; Tue, 26 Nov 2019 11:22:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYvc-0001hL-OC
 for linux-amlogic@lists.infradead.org; Tue, 26 Nov 2019 11:22:46 +0000
Received: by mail-wm1-x341.google.com with SMTP id g206so2801611wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Nov 2019 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IV9broTjFRnyr+MEV2mvZv/aNrg7F01VM6XYV47tjb8=;
 b=mODUumIADEX4BllknO9Vhna6txq3rBUhdhhb07fCrfRQITBfRq0HQ+pqY6QhCH1Asf
 ohRVvxHf6BoCrFh+uytmadfi6iOujKMT+LEt5JFlcgeQ++vWOtZ7/Px8QrsPemSksqmq
 QT5WgWPBuQa92y9nkCSfz9gzTBkl8B5iB0aD7Xk3XGGjL2UK88VnQRSADN7opdo3pQbR
 bDOMydg5Yt0e0QbcfnrhT1MxzHeOeVgI72dAXhfshK3aRem7NgqyaSyszv5gs6U3IIHW
 07hfrTs6e1OnjrWpOuT4+/8P/E4IeiLo4shedMErQA8eekczrBQWtJXo6AiyupJixMfa
 s8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IV9broTjFRnyr+MEV2mvZv/aNrg7F01VM6XYV47tjb8=;
 b=hERL3SFkMO+DN4ftqY7YalL9ausTEvY85d0DRF5wkLrvBgubW6ad5HppSAoVxeEbXj
 ewmsfnkcGuOhCkV+rruKuhZmvDRwd/47bu+N+LDX6+9g+ghwnY0M5z8fdbmb36rsNXjp
 UMlzpcszhanxBKrvYyGRdTk0S7fGXGvY1R+uCns/NTrcCINZMJOF5//QQ4CbkTWTeSqt
 VW70iX0SSQYAvKC40sUdf1OS/11u4JccstoULyYs9c/sQY/O5M8eaP5YJa68dpuD4pEv
 ati3K59WEVNH9XrLbD2FEg7YSY/whFtenh8nBEQ/GlWL+J+wM9f2OBpTto/kuxxxwXxy
 75NA==
X-Gm-Message-State: APjAAAVya4O0NNlch0w2k6a1uCuiKH19MiOlVBu0uJ4iTpwrkzoIMtOQ
 cHvUbLMvOeX8TtMvx9zN36I=
X-Google-Smtp-Source: APXvYqwfkXJpeQx7xBaGdw7ZPSohrLtBU8R6ur15cLp9h8gB8NX7gpS3qPlPHPNZQvCPedOa82AN5Q==
X-Received: by 2002:a1c:ca:: with SMTP id 193mr3722817wma.111.1574767363488;
 Tue, 26 Nov 2019 03:22:43 -0800 (PST)
Received: from localhost ([37.238.189.12])
 by smtp.gmail.com with ESMTPSA id v19sm15221766wrg.38.2019.11.26.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 03:22:43 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/2] arm64: dts: meson-gxbb: add support for Videostrong
 KII Pro
Date: Tue, 26 Nov 2019 14:22:35 +0300
Message-Id: <20191126112235.11390-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
References: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_032244_835538_29FC108F 
X-CRM114-Status: GOOD (  13.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
which was merged recently into the bluetooth-next tree [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=e32ec8ea0d79fac75171980f2df5d0af87a08838

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 84afecba9ec0..a795a170dcab 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
new file mode 100644
index 000000000000..bf990f3fd88f
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+
+	leds {
+		compatible = "gpio-leds";
+		red {
+			label = "status";
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		button@0 {
+			label = "reset";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4335a0";
+	};
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
+	snps,reset-active-low;
+};
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
