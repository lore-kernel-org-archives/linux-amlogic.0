Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A54C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84738206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XTqiHrEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RGJNY07d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84738206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s3U0zwNSF8QOsVOj0xG6gcYRcMLpAgOWollHb8TuN0=; b=XTqiHrEVjGZrWp
	WMA9cddQQVHcEr52y9nNyTfjeXoecZSoex0pbv18kpMrNz87EW9NBuq0aQOCKIt+b19oLhEjrXLd3
	/nguP2KzUVkM8JuFEhEBy0dP4sn3VVQbPt9YPIYR/8YrbL85KXzC8Y0wDxMDKevwvX7etgMHehB6N
	q24xnj+xjVfF11B8/EGuDlNinPiYPY9O8sIYVfDkS5k0cKTheSPCyO/9ZdQo/v3mZKyHvumohZGR+
	6we2pwb7WguDrZn0n9UigwpYTVocbgnhQ4GZ42K5IArt39BBr4xynxR4NROkMMqocCh+aMXb0LW/A
	6zHPxxUN6mtbt0lTDjCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3HgZ-0001rr-JN; Mon, 11 Mar 2019 09:57:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfV-0000Hr-4a
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id d17so4296107wre.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MSNQTLqMB/8h3L0fCnZ1wRymG/adNoTDMkerJITNlY=;
 b=RGJNY07df0n0jjZPwALiz5w2XOskz7MC3nvGBA0RukWuLqFXaemuMNSzxzlLpORAde
 YpnNtHajDYuFJZ58QhgL9Tr/haPLbpL4h5GY9sAL9cQiXeGecXvfNoNNjAHRGHDbHqw/
 RwWBdvi7cjE8DTzrNAPverd3yXaeiLaDxg6FjJurfCCqe89f8SzjnatBPDJQqNL+ATSb
 9C8z1EkIW9ZwheSnWyBYAvCcr055w5wuQW+p+4VAptPftuZvx64RsnmzmEwxDRkbuopk
 Pn0DBmKQ8Yj6zHhXG57J/B9LBgZ/EJmBL0FLbYzE1bNFWKfO2fcFarJ21KC4wymm/95D
 mdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MSNQTLqMB/8h3L0fCnZ1wRymG/adNoTDMkerJITNlY=;
 b=fiqMvjtmjXXCHga2gL44RRakNXYn+sH/v4xvRhqvsBLHMB3BdtzyRS+BAcQPY6Hmfi
 tBCQ3k7IFYqetAAYCftoiCMXbvKvouBzSuUPexIYN//tc6WjBDmfkendIifmPFwNhgj1
 Xn8q0j5VA9Zq0ZTu8V9PeC1UvLrToXwDUjXb49WUwk5B54PYsn22tJSAFdkqSdltm0Jy
 i8bSkuGvXO+/hYFDQ1GNa9qpC6DuexjuRrrgVSXJ4ZaZ8zcsStvicUw+u8XsOIq0oeN/
 GeyCBkc4orLJZQKVDhLEJwhsQTU+7yzJJf7+NYZO42QWxrmc1Zfyji2+sYU2l5Xk08Y+
 qbhA==
X-Gm-Message-State: APjAAAXSqx5k5fl5fA+6W425Y6bQhWEWEDDtmSwNzxoPsOamiD1bNvP4
 PMP75sw6JlVAVG3vvbNZk+gvAQ==
X-Google-Smtp-Source: APXvYqzy6AxK7m7X0/HRKIqJMolEaNRyk1YblL79Pj5DcTJ/AAFCC6EVX2k0jYZX2oQ1/Sl9rQf5pA==
X-Received: by 2002:adf:f690:: with SMTP id v16mr19993910wrp.139.1552298183370; 
 Mon, 11 Mar 2019 02:56:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 08/11] arm64: dts: meson-g12a-sei510: Add ADC Key and BT
 support
Date: Mon, 11 Mar 2019 10:56:10 +0100
Message-Id: <20190311095613.11371-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025625_461901_13C5903C 
X-CRM114-Status: GOOD (  10.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the :
- ADC Touch key
- Bluetooth Module on UART A

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 2b11b5893958..3d230545122e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
 	compatible = "seirobotics,sei510", "amlogic,g12a";
@@ -15,6 +17,19 @@
 		serial0 = &uart_AO;
 	};
 
+	adc_keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+
+		button-onoff {
+			label = "On/Off";
+			linux,code = <KEY_POWER>;
+			press-threshold-microvolt = <1700000>;
+		};
+	};
+
 	ao_5v: regulator-ao_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
@@ -85,7 +100,23 @@
 		vin-supply = <&vddao_3v3>;
 		regulator-always-on;
 	};
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
 
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
