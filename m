Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E936C04EB9
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 14:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4D02146D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 14:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z4OHe5Zr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VyOTRISC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A4D02146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9IsHmMAC/2tlOTGUjHkd0CL5/50wcn1GJfyoN0VfiIU=; b=Z4OHe5Zrij7yUq
	Jy4qJC8awRu8VWJedRkvp9Feuel16uBNRwXZlN9X0rcXJJmxIPp+BVCDudz7MG/TkQQSCbvTMgQrH
	8JWkWAxUsW/1wKWIoYTHvIhvcSTV8iXBZ6R9aQCrs+Coqv493QG7bxiNIPcy8uS6lLqFTiC2/HoL1
	ulKw7UC4dw3nXtHTNJ6/DDzp9TFIZU9ht0VdnSlpoWnkmOfAs6gi0C6ZXxUXjT/MJsWKgERjLuA8t
	uCMdUSjXdW6ross+U/x8GpOOEtuiSLGaAyCNgnHXiGemq8f2aj6g5ZkwSRUq7ajbYrGAoFEkpowZi
	fFYY0OnG4MEZhscMEnxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gT6hL-0004yd-Ho; Sat, 01 Dec 2018 14:56:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT6hA-0004oh-Qv
 for linux-amlogic@lists.infradead.org; Sat, 01 Dec 2018 14:56:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id n133so1645332wmd.4
 for <linux-amlogic@lists.infradead.org>; Sat, 01 Dec 2018 06:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1aw61VNM/PxG3kVDeoSIwuDnKI5aYcJZ7bCDLHHWsk=;
 b=VyOTRISCLaeQE9NuoMvzMLAXax26OcYT03Xb0YZr95LCm4F6joiUqoDREN8gzerfjk
 GDY/As24oNQkNuUV2DWS7CAzNVQNBylQytvAq/Al88MWjfX8zbAuVNnQyCanOrA0EHi/
 t6CnDNSq5mwcW1JQH4J9/uOoOLhK33cdlYg+b48iTC4oPSaRFRNptiiNS3i2jUsU8Wp0
 mdr3E72CV/vjjXGrVL45k/GVKBnRotclGFNiZbtJShsYYdJIurxis9Fhand9PqB1kVmx
 nAuNP6+iqZR+4BFq2QBWRgbggaPayeZxj68IEPUzarlU2gP3QXCXe1ERzZi5cCfinpwy
 bCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1aw61VNM/PxG3kVDeoSIwuDnKI5aYcJZ7bCDLHHWsk=;
 b=ta1tCBrk/l7dUOMyLedCkMTtJO+1cWdDP/1pamDg3gwa8zfZlQs4ikxjsfwWGHtObY
 QkV/I0mtJhh9n6abNjGrmlsexKKsXWeq5QhdAMj4IkxiTkpVhv1gbecYX6NoAP4eO2BB
 szFxPJs1qTjf+Q1zC4plHEdea4nr4Lbw//eUvDf2FCsHGh2xwC5gTZR4L4y8a5vMIsBL
 3iRRmzmTYo/p9szA6fu6Lnc+H3f0W6d5MfdRSp9NW88vHV5RM9/uNbYLA1x3uqg32BSN
 EmMye77feWAwXBjMiqEm+t3ci97pzS1aWCZWaHFza7rVgjbbACr+xRzxF9QWm22GC1jP
 tHBw==
X-Gm-Message-State: AA+aEWbTrV7bGlksna1vcPx/kFIfrAObkkfURxtLOjY6yeQp6u15TB8X
 IjM6xC4OI48EpyyckNdfsD50MlUyJ57wVcHr
X-Google-Smtp-Source: AFSGD/VguIg22D4lggkoaTiXrItoxJp1U0QsNzqz5gSsCnAeKebzLz+yja9em4K72GEU1laURrQz/g==
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr2381921wmc.43.1543676184514; 
 Sat, 01 Dec 2018 06:56:24 -0800 (PST)
Received: from localhost.localdomain ([104.207.76.73])
 by smtp.gmail.com with ESMTPSA id c129sm1626731wma.48.2018.12.01.06.56.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Dec 2018 06:56:23 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Subject: [PATCH] arm64: dts: meson-axg: Fix and enable GPIO interrupt
 controller
Date: Sat,  1 Dec 2018 14:56:14 +0000
Message-Id: <20181201145614.5381-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181201_065636_882882_5FBB0799 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GPIO interrupt controller registers are mapped to the wrong
offset in the DTSI. Fix the offset in the DTSI and enable the interrupt
controller in the DTS of the only AXG board enabled.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 18778ada7bd3..c3e4aac75782 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -374,6 +374,12 @@
 	status = "okay";
 };
 
+&gpio_intc {
+	compatible = "amlogic,meson-gpio-intc",
+		     "amlogic,meson-axg-gpio-intc";
+	status = "okay";
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..f1affc12e3e6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1415,7 +1415,7 @@
 
 			gpio_intc: interrupt-controller@f080 {
 				compatible = "amlogic,meson-gpio-intc";
-				reg = <0x0 0xf080 0x0 0x10>;
+				reg = <0x0 0x9880 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
