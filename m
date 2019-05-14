Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424AEC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161D821473
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 14:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPi9Jc0C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jEs81h1a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161D821473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MxI37W7YmInoZG7v1Pmlx82kviDtjY9W1iwVLrrTxU=; b=DPi9Jc0CbotDsB
	Kw9Pg2uxcUDt7QUiFu3nTYsAFkgqh1lQXKteuPESJASvoQOOWwTwkZS7BqHAiG7MeifJ21ZUf8Cu8
	P3O5uV7/C5XE0qhfbf5dfJP9a/pY0QTjzKf8NPhrzWFIfbf/jiwNURapK/MA6ygbLD4o4i5nbbJTF
	BDSng7sGa44EMuzdvxGYleTaSZZ4JWo7BPhwGLcPOi6vdJll04TWk6XtvFy8w0mAOYzwsA4XHjUcb
	AA8CzMrUV5Uph4LO5JjWzmEyAdtYxxL7eS0UTnJUwIHJTBdaLAFQUA4Xg4FCM6UY7Cl+xLDSXaKxX
	cSHBA5N3wl57emaqvuHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQYOe-0005SW-Rl; Tue, 14 May 2019 14:27:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQYOW-0005Fd-3y
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 14:27:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id y3so3126538wmm.2
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVVyuMvOECdnykHOg06JMYBC0CP3Jj/vLDrIXkB+hBI=;
 b=jEs81h1ajv0Mq+rqCs5b30885SiDPdTBh3OyhKqv8gKw5qS8VuT6tBfJsEjItE8bdk
 VkeovzQsr+gFHJnI/NTPM2nkLtnTzRqm/QB8by757kG1YvJXF4trV1rBPldpQ6UcVbCz
 n/WI4tdrqWa4VWBwiMIA5hBUZcHXe9K50/XpMDTZGsWhOLxR75d5QQ3vj7FjepEnCzFy
 /DLfdwRT+MXvOGDmeqpDGwrPCqezrTuXJ9n4KYV6nqCs7b7VGcA/6fhX0keVsO3Ie7jf
 8JUFIX6riORBclj/D6TTo+HIQymhklyLbTHzJF/411jb/AolIDp/mLqYQ2clGfZstw+8
 P23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVVyuMvOECdnykHOg06JMYBC0CP3Jj/vLDrIXkB+hBI=;
 b=eBvxndRP522IwNkxqdoqitiKh9JK7ycml4n+uyO+Eq79HjXjz21oftfHhhpfbbToQ5
 KepjkLIFeWKegrpVl/4lWzXQWjPxISo7e2zH04GxUI5tcyYnSGapF2hPEEnUWobDs4ZP
 1kr5Y3kdev0w6YSiS9LZntBdxP650598MNAur0FACM+KiHYzT3tLth09dZmdB2sGwWZm
 wQHTcgMYfNqhcikzVpA+Os3UDwcVcOGuXsp2yHPWEU11FO6mgCqPOU3CSnnOD31t1KWJ
 gCfEDq5khsJOCzbSBykaXJFZgjcLaz0s3SxPh9aiEsA6AecsqQpclAjVi94J045zewUc
 TFTQ==
X-Gm-Message-State: APjAAAX0cD5O6oVfiJWVuSyeU0t0xyIroDPddLvFGb0x9dnzu24gTDGo
 OblLz1WAhRS0MYvMfysPo1Vz4Q==
X-Google-Smtp-Source: APXvYqxGAyi+CZ3nqvmR/sh1VIPkflen3Zz1B6mLaq7ed4bmv3GwqxMt+X2Q7sRF92Dx4Q75JgBZKw==
X-Received: by 2002:a1c:4145:: with SMTP id o66mr20386116wma.68.1557844022765; 
 Tue, 14 May 2019 07:27:02 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm12343642wru.52.2019.05.14.07.27.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 07:27:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 7/8] arm64: dts: meson: g12a: add spdifin
Date: Tue, 14 May 2019 16:26:48 +0200
Message-Id: <20190514142649.1127-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514142649.1127-1-jbrunet@baylibre.com>
References: <20190514142649.1127-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_072704_257918_D22EFCE2 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the spdif input device node and the pinctrl definition for
this capture interface g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 8dbdcbea5945..d6c6408281e9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -807,6 +807,30 @@
 						};
 					};
 
+					spdif_in_a10_pins: spdif-in-a10 {
+						mux {
+							groups = "spdif_in_a10";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
+					spdif_in_a12_pins: spdif-in-a12 {
+						mux {
+							groups = "spdif_in_a12";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
+					spdif_in_h_pins: spdif-in-h {
+						mux {
+							groups = "spdif_in_h";
+							function = "spdif_in";
+							bias-disable;
+						};
+					};
+
 					spdif_out_h_pins: spdif-out-h {
 						mux {
 							groups = "spdif_out_h";
@@ -1516,6 +1540,19 @@
 					status = "disabled";
 				};
 
+				spdifin: audio-controller@400 {
+					compatible = "amlogic,g12a-spdifin",
+						     "amlogic,axg-spdifin";
+					reg = <0x0 0x400 0x0 0x30>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "SPDIFIN";
+					interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+						 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+					clock-names = "pclk", "refclk";
+					status = "disabled";
+				};
+
 				spdifout: audio-controller@480 {
 					compatible = "amlogic,g12a-spdifout",
 						     "amlogic,axg-spdifout";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
