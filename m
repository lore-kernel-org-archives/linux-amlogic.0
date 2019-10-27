Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0469BCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E5A21850
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bc3yu6la";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DJKRsi+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E5A21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPHN+cAUqORl/b54/+dE5raKe+pBZD+P8E9g86far6U=; b=bc3yu6laEaBkUj
	NexbKxScPTH12r4HOdaVgVzxuVVU5ecRa58wMCMxEcyHEcrO4QiJ7c9ABa9Z616cgFpOkZ+JupNTS
	nY3MRYEXyTfVcdDVCqEp/9hlPMqAjE4q8RX+r7dVwtdG4cWhMGWIMmkHDmHUEiRgRasDCWI/42OBQ
	JRyxozeO24L3F/IvQ3+0/wqzvGccaWvBX+XE2QAgoR5oyVv3uANyYml4Oi53oi2u4/QRv5zq+3VGj
	cHquYawECAEG928gu2VO1D3knrF+mWvpAdVQaihmzzg78c8Fp1+mMji/YkpP9dWIkHLdBV3/Q86tT
	jx5UzgPWDVMNuativjIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlLN-00024I-Rx; Sun, 27 Oct 2019 16:24:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlKU-0001F2-Kf; Sun, 27 Oct 2019 16:23:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id c2so7362685wrr.10;
 Sun, 27 Oct 2019 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR91Xkho7A58iCTl5ApNx6Gn9blyxo7jlHkr4Z2ufbE=;
 b=DJKRsi+4xUNfRqEYSANnCE2BCk4qocBMxIHxvNaFwMv+6reNOJ1yDYZzxawhOVKc+u
 uTJs8mvzJAJRnXdV3PBCK7J+OLejIm0UExJaXQogyWv2+BgWDBWfXTg3kZpu0Jmdk7lG
 /TyFplsRJQ2IpcuqsNqJKTxyHc9uJ2l/2CiD1tpl4bJ5csKhETxra1ZBvxjQGJGCtawL
 yOxoKoQ/Qczup8O23yRK//AG/vdy4hLOGN68aA6tPyya/7qZ+H27V1gYV5prUio4nJDb
 IQWqqg+8jrprGeXqbfvnrir+EWjX38frqDR51u3xD1yBKGVj/PN1HyM3z5ncT5s0Ameu
 /Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR91Xkho7A58iCTl5ApNx6Gn9blyxo7jlHkr4Z2ufbE=;
 b=pjO9br1zuHHKGUIwOZyXOMfX4cHO1fVSUCbOf5EaWaYgiq8iXU5b5ddlxBi3YE2L1I
 RN1sj07KfYZ14dX/m+jvwwe5Y/V5Rm/oWrlGPgrohQ5i1SRfcFYyhxN7Xh5NwUHALUJv
 g0omjoG6TYaVk9HnVyk39lFroonqrK216Z2oO7EBzZLm98vuawFatXm2/zKIowJ9v5y4
 UYwRLMExAy5F3q6ckBe/VfX3K4OhX9T2oKcb9VUmTbfftfSLjJbIMSYyD9eIifg5W03a
 hLZH3X4caY+WU5i8NgldpX8acuJg/9gKgmxleSYCn+8aNLqB/x9sv8h4XGvq9bPrz0Gi
 YnIQ==
X-Gm-Message-State: APjAAAWaS/hmcQovt4QIgwy1G1Bv4wplxC5YsOL/89QE+tjgvCtn3AKH
 awk4E43N/F261Nn1vn/6TtA=
X-Google-Smtp-Source: APXvYqwYcUCsvwTfCVC8G8QhpTTpc/gHzJpzRKp5RQnLVauGHvqBTZj2iIoo9YjsXmaCQ/Mnq8Vf2g==
X-Received: by 2002:a5d:640e:: with SMTP id z14mr11475473wru.311.1572193425067; 
 Sun, 27 Oct 2019 09:23:45 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 1sm8243299wrr.16.2019.10.27.09.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:23:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 4/5] ARM: dts: meson8: add the DDR clock controller
Date: Sun, 27 Oct 2019 17:23:27 +0100
Message-Id: <20191027162328.1177402-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_092346_730713_5A3DD6EB 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DDR clock controller and pass it's DDR_CLKID_DDR_PLL to the main
(HHI) clock controller as "ddr_clk". The "ddr_clk" is used as one of the
inputs for the audio clock muxes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 4f59a4c8f036..257c1364864c 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2014 Carlo Caione <carlo@caione.org>
  */
 
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
@@ -195,6 +196,14 @@
 		#size-cells = <1>;
 		ranges = <0x0 0xc8000000 0x8000>;
 
+		ddr_clkc: clock-controller@400 {
+			compatible = "amlogic,meson8-ddr-clkc";
+			reg = <0x400 0x20>;
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			#clock-cells = <1>;
+		};
+
 		dmcbus: bus@6000 {
 			compatible = "simple-bus";
 			reg = <0x6000 0x400>;
@@ -455,8 +464,8 @@
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
+		clocks = <&xtal>, <&ddr_clkc DDR_CLKID_DDR_PLL>;
+		clock-names = "xtal", "ddr_pll";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
