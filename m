Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87085C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRZbZ6tBln+JPvRPIcr280iF3jkatw6D+AdeJLbxoTg=; b=mHuO5jXcRItINT
	GuGuz8Q/B8qKCxLmACmdnjMSRNhc0EYT041V2zUQmCulYGcMtfSq0Nfw8qjepZ74dsXsl/hRT6ipM
	ew5NUxDApud2HR6Wo9unjtqifN1vx3lk7VJ6AEvwEqkwOgA5dgaImqIO4EMrUOir2tIWN9WSFUniP
	cJWCGnhki+6/oLSgYBqHa5+J8zwuwzahohy0UMZYjNtbwQI6Y7dNKododaw+N9HSpndZ74h3SrgVf
	HFMc6T5YW70FqncHx0hOL0tJiXXOXl0iyxxH6FBlJQ2AD0MjMVXanZGV3RqQjXNGgf/qrwXoG64di
	pSq3TuMha7C6uf8VxjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPeL-00FGnV-VK; Fri, 27 Jan 2023 14:24:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPcq-00FFzX-Dh; Fri, 27 Jan 2023 14:22:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5508692wml.3;
        Fri, 27 Jan 2023 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+77rbk+LDQVY8LBXczWlnz0WIcfcLWhxX1pA+0THIM=;
        b=DIeRH1fBk0Zr4EXjV4aqhp5gScRisiOALZ2XOFLU7Q0n8nO7/EziamoLUfm/eDSYWd
         827I/fLTu+v+S+nCJD/e9D7oCXv3FCGu0H5i6AuILcmle9F/COzaU8OsZFRDwV12OvC8
         zEE2sJxidMPnx7SXOEeELgPrwwuqj9HfzY178FGQQNHkFufhgxI32BbOdnON2+amNJME
         UMD3kPy1aFWnxjRWtPm4uOhmcWAdWhtRMqQO9fX6Lk+/6dVIvs7yeqVwIVa1VS0dFIq6
         BHq26IY9/rjAiwJPsNItdr6zbTQ5xQXbtzHI1ws5evkSxB5ns2cmWfb6/yTy9TSjEvJU
         djyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+77rbk+LDQVY8LBXczWlnz0WIcfcLWhxX1pA+0THIM=;
        b=xtH7CyIi2DHGCke+sg1tehDgZLSIEr+7MSv0qH5Zy5rNRW0VtbDCW/6j2E/oMIk6X+
         4VKXQDiEGwmuc5lXqm9cnwWrjQllg3JI6TEhsn3PP2pIttt07PycSXxXLXnw7vDudGVS
         SCY5yWD11QHFet6jUg7OCSwauW4ppLfmx13UqxXs94Bj7pSEN5fBcBKEMUbQKLQaw0f1
         CZVkwJzWwrP4+kH46PICfF8+q2j774mzSCdC/6ojoHQvkq4JU9gYQtokzxMuHDkENb07
         jCGItvjFLQPVcEWTQNtnbVyvU1OZEvIxQEQZEQPGFG9g8K0zINTLXK8Y71Zs4Mq4U9dU
         JINg==
X-Gm-Message-State: AFqh2kop+DqTamiZ9tAUvmIPU9NTNn+XFIYUDgnqcUuFfLXbXicE1pxe
	FXXM2ysDPLywCRGWD22McDo=
X-Google-Smtp-Source: AMrXdXtx3MnOapAVHXeUKN5GkcF+H2YwoBHQnjNyk30TwP6ay34MaBM1nFR/iFba9qEOoRsF9nSNhQ==
X-Received: by 2002:a05:600c:2108:b0:3cf:98e5:f72 with SMTP id u8-20020a05600c210800b003cf98e50f72mr47632385wml.3.1674829359774;
        Fri, 27 Jan 2023 06:22:39 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm4301039wrb.21.2023.01.27.06.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:22:39 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: meson: add support for BananaPi M2-Pro
Date: Fri, 27 Jan 2023 14:22:21 +0000
Message-Id: <20230127142221.3718184-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127142221.3718184-1-christianshewitt@gmail.com>
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062244_495923_0DC5D2CC 
X-CRM114-Status: GOOD (  13.88  )
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

BPI-M2-PRO is based upon the BPI-M5 design except for a different
physical board layout and the following changes:

- USB 3.0 ports reduced from 4x to 2x
- 3.5mm Combined CVBS/Audio Jack removed
- RTL8821BU WiFi/BT module (internal USB connected)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 97b42e2100e0..644451794aca 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
new file mode 100644
index 000000000000..586034316ec3
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 BayLibre SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1-bananapi.dtsi"
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
+	model = "Banana Pi BPI-M2-PRO";
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "BPI-M2-PRO";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-3 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-4 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
