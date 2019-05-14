Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68912C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39FA42168B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASmZ7f10";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zjwI0Sg5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39FA42168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGCoG+451bupwwHKUd3ofCo2aUFxW/WF5gEx5hU6By0=; b=ASmZ7f101I8/Us
	jrHJRTI0a+mJ4P+DWoznSXGYfnzsS6jHfufQM14LeEr7ZW6/NUV6ItOJhgsw8dYqxwp7vQ+T4DdkI
	5ZgYXvYN3sfXyKMpPplWUcjxst37OvClSb8yaMe+V3J3bzLl/EYvZPGfksQU26UrV//yjibH9lQ0S
	5jRnth1ERAf1oUQ4tH10U5ltCkUVqzTx+QaZO4GWPFrFCs4HzRxnQR8aeJRtGmmI4jQH89HZaTwPp
	hXeVvcrT0P7mkwldSyzeAkiR4Ui1YtiaqzK4FpFvBgUG1aRE8/E8UGrFNIEFYyqnHFW5FNkAZfT2D
	7wOGY163NSSKAd+yznRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQVPM-0001XS-B4; Tue, 14 May 2019 11:15:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQVP4-0000hh-0T
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 11:15:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id h4so18752136wre.7
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDyT1E6CK5U4vscnJX4HAz7PFMKaDLqJqgBaxE3cbqk=;
 b=zjwI0Sg5tIHprAsQ1cIZ2uDaKlCkoG6ktG8MUAeZCqwXjYDXJAPOMv5ehGnvyKxuNc
 LjMM1e9wKtQgSnzv/kNtJuq6V2PCcdyWpaEt09g9oQBgUlCFiTwhQmCghlr36WQUJBMF
 Xh5lTmGhee6uRp7CnshIKh0BpHLAGzQIB11Umm1D7gqHO8xIEYbU0wd4XSwCFu8LYj8Y
 1cOMpvgNm8bUtnJ59B40ZjuiLQvQkjUSqWTk4UhRcRjSwbPIzDTqKqKmJrDv4psp+YA7
 cduvZ1LxkcI17YIw+6i9pKXvaF3PNBx3Ra+5Dpp4ms4mK0Ds8tMzjixToxkuKxPlvhF0
 SY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDyT1E6CK5U4vscnJX4HAz7PFMKaDLqJqgBaxE3cbqk=;
 b=tYKwJMkRthZrp5FR4VOm/dmpZYCZ5d2U9fnIDmN3cVzLyFIllrZ7xpjyPABG/v8XrE
 1KV5m7lDFqqxA7ZOhVx5ZELn1uzxaK4EurtrCu7FvIsTZryobPKgvxLFZo7aSA6XqgsC
 7qQY/hlSUKfQuSpG8QyC98N1blmJMKWchjDRoxHQzVr9U7aavdmcPVP/EfnR91vtV2mo
 Cn8OTxCimJ2cTMnd5Z3Lwa5UcCJOhx6bO2NUK8MgEygdtmVF12taLZzo9t6DE5KBFh/b
 AkROZ0AxWD0H+R7PqZ4l7XaRt4/ogUNrgjH4qp5GLyaiO6frbq/OHyFU4r5aG+W3HcSW
 zRcw==
X-Gm-Message-State: APjAAAX75nvyp6yRemXa5senZUrIzL/L5q8+qwEejHMfE6niUDMxDpGR
 YSLIR3kudKaTW9pPStS+h7DQSQ==
X-Google-Smtp-Source: APXvYqzQAcU7U+wcVxg9MhAh1cKvnRqKieViTrtEFkY7/v8UDTwXcjIA0LvlG42jrQg6541aF+Tbng==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr20830144wrj.249.1557832524299; 
 Tue, 14 May 2019 04:15:24 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c130sm7289922wmf.47.2019.05.14.04.15.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 04:15:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 7/8] arm64: dts: meson: g12a: add spdifin
Date: Tue, 14 May 2019 13:15:09 +0200
Message-Id: <20190514111510.23299-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_041526_277890_0E25B780 
X-CRM114-Status: GOOD (  10.02  )
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
index 37119564274b..d4fc645f0ff3 100644
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
@@ -1510,6 +1534,19 @@
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
