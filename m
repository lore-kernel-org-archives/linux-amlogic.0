Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C74FC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A0320693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sK2Cno81";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TsN+9sj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A0320693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFo5u4DzjQbv69fVtS/P5VRTovHyF3PHuzw1KZA3UsM=; b=sK2Cno81DzYiFl
	V4mtugf4wxXmWzit0w1pcECNPBaAHtwK1lHuzeXxAT8TVGJt0E18z00hWSevV3GceBHSdXmw/kuSK
	3i14qhdEPDtqgry4D3NP0HlaEQSukddXXImKRtlW9AZSVlH3HQ4P17wLgd7qLsJt3WkNjXDok8OHd
	3Bt8Pvo0QbutKd6C4zKTHqikpHpjJjnBmTgmk2BSUQo2pkTuwbOt4isZISastKc+uBhQ+FZmof+ZK
	o6cTv2m4HOZtOGQfOchXWo8w+pp8pv/0Ppjf00BkB7vb+OUrjfS26exK44RmFI8mjJXcUwjKG3zZb
	AWRYbz1obQz5oqUxqeRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p9s-00028M-1b; Mon, 18 Mar 2019 10:06:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8k-0008RZ-Of
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:10 +0000
Received: by mail-wm1-x343.google.com with SMTP id z11so3801216wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrU7oOZF/XD8UT4BF226LZ7D8K1QM3Y0TXhUURbvrB0=;
 b=TsN+9sj+Hz+Sa6E4DPKcieTcPZJrb2JZbT2uLEeOV/z9stXQgJB33zafHM7LXV7zG8
 oXrWCACLEQTI9pJk+PuceITOTywgor9UfADMbgkz1sKS3CbR9POjfTmmmKrAskc5WLUM
 tDQG146IqhUg5AqdyyqU2jWrK4bXVyYA0unqv510MckRExi8M3khA826CpmEpj48ksCs
 t9sAtScQluR0BSCZ+flK+FWF8L0rB1mWR9h2HwaBVtq3rvMaGQVKsgQxtvMMgjOr+DQz
 /0cNK7eK2p/lOFZNJQpG+y4sWnXOG45nEDYj9BBWv22ddiQyZqpb/bPQOvWg/a2W2Yvn
 p+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrU7oOZF/XD8UT4BF226LZ7D8K1QM3Y0TXhUURbvrB0=;
 b=uhJlxAk9X2DqGprtXFLDRgMVn4aFOcAqZP/IF4jExNhjLr7PbpVVpMLcn21wf+urTC
 X8ymyawWcwhLA6eiBLj1W70sXBUXdL8vH6o1m56EO5NwwldQsvicfClJP589CipTSro5
 1lio+Nj05BRd+sG59ViXhFfLMiH+qQU1hWWLNhEnTv3TDlxp6Xqt8cfYwiQEgf7yGOM1
 ZGPNtkL3aDDqjHMJ5bEZeNZFVzJOIo179J0BTgGY/XSNY8jO9+oU/R6wHTnoOMXwrf2h
 Rv2+Ae/RDRAZhyjA2ZsSB4lELigyQW8d+3v5CjahFrSDR204wPZyGSNZ08/Moe5sIu7H
 QgZw==
X-Gm-Message-State: APjAAAUf7lT1lX+M8tBB8ksfEg199soxBl3Vr7dmb+X0Y4CMsnIt++Wd
 Nt+eu6Lmy6zrwJTcoOdCsl0QMg==
X-Google-Smtp-Source: APXvYqxwhCV+9YHPpEYO2QBp5e/pxcjvrA3D3nHEn0mXz9CPZi2TS3xuPDpz+DqLLY9lxx+6p548RQ==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr9876623wma.57.1552903505087; 
 Mon, 18 Mar 2019 03:05:05 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 05/11] arm64: dts: meson-g12a-sei510: add regulators
Date: Mon, 18 Mar 2019 11:04:52 +0100
Message-Id: <20190318100458.5619-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030507_103378_63F79511 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add some regulators. Still missing
* VDD_EE (0.8V - PWM controlled)
* VDD_CPU(PWM controlled)
* VDDQ1_5

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 63c515fe4996..43d57e20294a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
 	compatible = "seirobotics,sei510", "amlogic,g12a";
@@ -15,10 +17,36 @@
 		serial0 = &uart_AO;
 	};
 
+	ao_5v: regulator-ao_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AO_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dc_in: regulator-dc_in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	emmc_1v8: regulator-emmc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "EMMC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -31,6 +59,35 @@
 			no-map;
 		};
 	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	vddao_3v3_t: regultor-vddao_3v3_t {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3_T";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddio_ao1v8: regulator-vddio_ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
