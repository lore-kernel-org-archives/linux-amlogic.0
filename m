Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA80C47423
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2952206B2
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AoAg5SUt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT/dm23d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2952206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y17kKEVlBSrZBxTR0WFjnwVod5LtYPPsA2ZKDMxR+Ps=; b=AoAg5SUtgZYc2vFVhKNZ3MOwxa
	uBL3smvuSbkYvMQ1aDB70FHaUP3f8jVNiRXeYrUhqfQiG2gwg+KXadx1iQrdU8hJ2lqAMZ2LXmbDW
	j43GJVykzwMXLD6ePu16eqXdAH0hbgAHhf+GKcYWXIKWmu6WTsqdBkEUe7b4pn1LZy/rO46rhRyvK
	c3pSSkfUiAK3fUelfpH+2xxPtOO609v9HLvbixnlMkAxCa1bIDIlueUToaV957dLtctlps/T2/cl1
	m7lndeiGGtuItS3uJg6+jo5nEo0MJC28ps4CKixET3m0fFtVz53Y1RQXUAwdpWEz9IccPiaDrQkYw
	CwDXx4ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6v-0001kL-Az; Fri, 02 Oct 2020 14:32:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6K-0001O9-OO; Fri, 02 Oct 2020 14:32:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id v12so1985163wmh.3;
 Fri, 02 Oct 2020 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3IIVS7MhfURH0UVnp76zcUfKlv8hfdezuu29h1qTO9Q=;
 b=MT/dm23dknknl82NUiKS5toDjY8Dspqh3oVRx6cYbQvsHxdLfjJWVbNgZzypwLeabf
 oOuITmGGf4OYIRwKH6bwjLX8GVWNVI82hCm3QfoWk9V4xqg/umNEFtMAwgIfoHjRsSbo
 tTYa7XrKRAjYEErslFHmdRDeEw5vBtJFQtM1/isIpN96Qg0SIag8z/uucfCQF7nTP8tO
 jYjyxZKUsi0xe4qBduKgRIvHY1iPEFZZXEMvetBySN28M/VkCUIILbVJlimPoyRvtSTE
 uZBvvpBqRIlNDcziMG4eYGHW36sDNIp1fkgPvWRQeBIRbSvKtS42ReFg0AyURmVFLr7I
 gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3IIVS7MhfURH0UVnp76zcUfKlv8hfdezuu29h1qTO9Q=;
 b=N6BivS5q1BouOQzO+p0FmVr+dN40/TVVMlWPr549ZMdE2eV0HZD0bVpYYZUx/jD1Ia
 TnOEs1gMfc4bNe7tFlEt5UliQyH6GaryQkg2Nokrqzi4CDLdl4PhBcEU7IZZIqiwi/kK
 OKXX6ujPxH3ATAjo64vi28Da3gvyo231EEGIt6sBcPIgBLWHNw14eP7gRzHcuPOq9+we
 nbGSsQtlyWGAjkKHK7lxcmA8aFi7Ibsnp7ZKdmQCJnJDWU0WfKkvC4/SIskjEMP3L9Aa
 WttGXr8AKOlIyqVDsBQj1iBmWmYLcqmveZMijuU1nCfx43AggCnJVRzPghPWk1Ikrada
 kxtg==
X-Gm-Message-State: AOAM532Ks1tx7dMTIoLBXirPuO+T9tcQgpNEqtW/AqYuuq2wPPYD4yYF
 9slPrVSqm7kOYx4E3DiwOYQ=
X-Google-Smtp-Source: ABdhPJxv1FFukIDOsjMvcoPqLpB+sbG6b0+XAnD0u2gDzADjf1Rjnv7//yRTGH7MKvpfzkEGMlv0NQ==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr3137007wmh.1.1601649119669;
 Fri, 02 Oct 2020 07:31:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] arm64: dts: meson: add audio playback to p200
Date: Fri,  2 Oct 2020 14:31:37 +0000
Message-Id: <20201002143141.14870-7-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103200_845573_B646D028 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-p200.dts      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 3c93d1898b40..a16dac72600d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -9,11 +9,19 @@
 
 #include "meson-gxbb-p20x.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p200", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P200 Development Board";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	avdd18_usb_adc: regulator-avdd18_usb_adc {
 		compatible = "regulator-fixed";
 		regulator-name = "AVDD18_USB_ADC";
@@ -57,6 +65,59 @@
 			press-threshold-microvolt = <0>; /* 0% */
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-P200";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_y_pins>;
+	pinctrl-names = "default";
 };
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
