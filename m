Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4BFC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EB5//TxyPMMmOx8+nBxMdnxbNxzf6jXjvTaya31/yV8=; b=OUaDNno0i5429W
	ggb9WYVZ3JKqemoWnazc6L/V5ystQ8jxyJLJXsthvA4q89U1TuPHRI/9gpndmx45v/9nrGOr6wPZ8
	hWYhRUxfIFfFjM8zsFyKv6bt/MPdn8JZi/PR5KKbi0TN1EjXBDeM78WegigORQRIQ8taAKnvVs0ZS
	dg4M9s+koG8mDX/V4q5KVpKojRQ09dTxFLQGMTFOtpAGK9eF3ZyF95RQRR649Vwvrbg0M8XW5VT3s
	Uk/4Wq7BxJHXv5Ziu8JDYhK1U8o0oS60cdhJJSG54ruE/wYZONNmDbsP8OCW33GeI0/AHCWkqLCUh
	woaYiheuJS8EIIHnK+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0E7-004YvE-OS; Tue, 30 Nov 2021 10:19:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzxk-004Tk0-2x
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:02:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id j3so43143085wrp.1
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2StaEqVy9B8+ZfyW369JbxqFphYPc6IMTPWpr8yAUuQ=;
 b=CWupZEVGGC6d32E+1UEuD7BmkxvC73SyoaKJt1B+bj0IaS4oBm4h0YfoNhIzNybvqJ
 sDPgGk9SxiHxr2eqgHXxnmB3GUcPUGQwXvdynyLDpttddDHV/aEmiJ3/tFT/8hcAamVl
 qpHrVCfoFSHnL3MmvzxIu7YcHOMnNjlNfoRYNZI14wcn/XKs80gZd7OhmtqaUrSrsrhD
 tMKiVEwfm6WcWLbUOq6qvTeWrVW3I5FCQJIk/sEP3XhMlRDGZX/bBNcQxNMXUYi1Xb7I
 ZCqYZEPuW3RoXA3uHdYpfAZfMo96J4e/iYwUowJjC4QEsi01nZyZLhYYD5EMSKJu38xd
 VzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2StaEqVy9B8+ZfyW369JbxqFphYPc6IMTPWpr8yAUuQ=;
 b=VMi3N/7GFJe9JitYYukWh70Xd4jkw4BYOZb4Fa6EpN0hydDKqXnuzccVIr0s8k5pJD
 BngGj+fNbMa5KSe5TP2HL48VbxrxuvBgr3yS10+G4DvIN4a638VShkREbj1eOBe8KWc2
 q8t9wda/MOl8b/kaehHvIQE789EvYjSNjr2q886F4KJ8TIl1K3lGgKnc75IAezM/7KZD
 kPNxcHjzDebWbGsNAeubsYJtrsshYN22UStQqJ76Xz+44SGLlf8xmXWaYlZpylgtW24c
 8Qn/A8WMRTrntL6fwRY5sKm6Ok57BhCmM+CZQ5xMIEwGfM+stVlCzx6I+fXutagPGkYn
 41aA==
X-Gm-Message-State: AOAM533saGSdoGmHI+AQcec/5WMQ2XQERtDtI0pFXDdVHwI84JenkHYa
 7vMxPxF9vaChdE8JbMztJTeEZA==
X-Google-Smtp-Source: ABdhPJxAAvutkQ/CSzmM4k0ljhFTQPLnHG9Yg8AI6TQdmyY5geq4w7Nmn2rB8BsTgH34lKzABlDF9A==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr39425844wrj.205.1638266530710; 
 Tue, 30 Nov 2021 02:02:10 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id e12sm21117166wrq.20.2021.11.30.02.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:02:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson: p241: add sound support
Date: Tue, 30 Nov 2021 11:01:59 +0100
Message-Id: <20211130100159.214489-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211130100159.214489-1-jbrunet@baylibre.com>
References: <20211130100159.214489-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_020212_163950_2614893F 
X-CRM114-Status: UNSURE (   9.76  )
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

Add the p241 sound card support. This board can play audio through HDMI
and the internal DAC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index 9d0684a8264b..ff906becd2ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 #include "meson-gxl-s805x.dtsi"
 
@@ -21,6 +22,13 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	au2: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&vcc_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -110,6 +118,68 @@ sdio_pwrseq: sdio-pwrseq {
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-P241";
+		audio-aux-devs = <&au2>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
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
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.34.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
