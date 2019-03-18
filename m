Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14522C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:08:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D4A20854
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6dSz5uq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q2mm25yP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D4A20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIGz0H+Hwig7OMxMJwsYznyfq2VjUQDnrhS9kGK2NKM=; b=q6dSz5uqGWt5DU
	K1/nhbUXG1dQ2fqd6mrKzD5V6x81LdvMIFIAzfjr5OwwQSt6qce/ao1iLRFGU7Z6l6/rJz8/qi3wg
	N06v3R3CkPvWmE+hClFMq9/+39aWS0/HHbdIt/zR//fOXnnIurFhEuoi4GtVygWT6zdFByjlgFmKH
	dkDnJ1KxIqRXBfaprKd9RSszg1DQ0yrsgdSvb7cAa3LPP4lJZM86fC3Eli8y7j+0POhQLPMnag++6
	cXkLwfr8ZoDPGSGvovJJr899sUM6hO75NwR8L2O/LX8i9eNU2C44C0o46TnUS1ZyOvwM6sRr+IOfV
	ET/iZNiTTZ5uK+lsDnyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pBi-0004S5-C2; Mon, 18 Mar 2019 10:08:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8n-0000LZ-II
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id 81so4784947wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTSmlAuPBb+wFgaEuXPpRyLK6j0/0XQ2Tmwdu0EaftU=;
 b=Q2mm25yPZpTAixhSBfuM11tBTZPawjVW8RLyhlZgr2LkqG/ArXBMqfPBD8oi0Cnf/M
 7WWOa2anbdQL7CoOhBlI6bV3FEeSAEBOXYnIbZjz+ovmroP9dC8HxQTvsMcYEzS2p3ro
 U7Kojl2qWPzl+NcA353n0+CEA6qe7I9SnZdYg6IDM/uQ/C4egsu3GBiR6y5Hag44szEE
 dP16aRBajcIr6ad/M1Oed689/4lS8/Uq8klpoYKxEboDDGn3ADCXhE/15HdNe/74+Vvh
 UPO3EjpZe8+ijiH4vrc+Q9UemFUIOUTUQY6d0I03WW/ZosBg1xvjYf835Njdp98BESbt
 Q2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTSmlAuPBb+wFgaEuXPpRyLK6j0/0XQ2Tmwdu0EaftU=;
 b=lyinTN8qazN6JMUuiNq6O+tm2aj90TV31vQOimoCHbI4Hy6F5dJaIplIU7adUofYSw
 vYzPhepqBf7Ga9rvMlFPRIO/3WV7+d5WDUPAbpx56HrEZeAQqRk5OUJspRnCZeeoLd6U
 nzlVTUaIOFA+aJ089kpL4yz5KcBoRr2x6OJy3QDHTtkf7P+rz9vckymX5nzDbcXKSgdk
 JehGnx0M8QQkVmuV98KDn15NZcfYNrS9049/WjiZ56muZ1l+Sq78wXyfoiNkDGXguHnb
 tP940k5WFuXFno8Fw3717QOgNTZpj4N7mI+bgTeNmBgoWxFotCuDg6X1wG/2O6XjLPut
 RSTg==
X-Gm-Message-State: APjAAAVYfvoHs6DySM7L6/7bJfXRJQHVRCgftbwFhFD60tWwxlIklIuB
 SGBWZtXtVIL4OLrNUn+mmmDZcA==
X-Google-Smtp-Source: APXvYqwVQ1pVzmsB48agHDckPFiHVmwqyBVJ5BGRS7CkFn3MEPbM1qlEtrwYIxu8AYXsdVtnrT5dDw==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr10073625wmh.86.1552903508027; 
 Mon, 18 Mar 2019 03:05:08 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 08/11] arm64: dts: meson-g12a-sei510: Add ADC Key and BT
 support
Date: Mon, 18 Mar 2019 11:04:55 +0100
Message-Id: <20190318100458.5619-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030510_242342_A1723FC7 
X-CRM114-Status: GOOD (  10.70  )
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
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 43d57e20294a..ebdad5a192f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -7,6 +7,7 @@
 
 #include "meson-g12a.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
@@ -17,6 +18,19 @@
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
@@ -87,7 +101,23 @@
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
