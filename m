Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102C7C282CE
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F1C2171F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KlUuYn0p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wKIzkJkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F1C2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THjxAIaolWD+JQ2yo77lDS8nSjcdLyflDskeXsk/kLA=; b=KlUuYn0pHQC1Nc
	DSbXuhsTcjIf0h8oJ684griNddvNXuG3NoWWtWrSEr+g+SgCl7EzqZ5VCvFNPtsa44PocD7HXHQ/Y
	hJJKsC8U0lj2si/wX96bTUQY5hb+jDYaIiGtNYuHkKdARHIzoF0X39C3DGcwkM2a76vGKlyXEQ4QN
	cj1mgkDluFg1n3a37knmgMBWvX/Q5ZnjOilRNf7tqDClwLtsXb84bTaCqdouIgJNX61nsvv2s8Xe6
	TohFVQswGAEQYisgBdVjxGmUZEGC3ls3ZJgqgGtYfzDQQB3bHRKDwNEal6OY6yoTjqKbcI0KJywOH
	XNAJ/G4nHNQ0xQXR6YXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvex-00031M-Vq; Fri, 12 Apr 2019 12:52:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEven-0002qD-NI
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:51:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id j9so11809873wrn.6
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pD/ha1o6xuuVhzSZWIPaFNtC4/6La9+pE80liTrfGdE=;
 b=wKIzkJkJ1lUE+QbaeCtOMd1B8P8cFTBCdaIFNAXADJ+vHY3yVSwLaa4P+9ANa6hZ1W
 nwgZJnhZxPBXqBoUt7QgV6HeNNiNMdsHP3EDrxMj/PVqOpkdmYuKzpK1FYybttWQwLMX
 Yym2l14aXy7blpoLTzcdpiw9IowoFnPKmQkr/ICIipVRtRxC9QablDJr7rJqGsuVFnks
 bzuDNOPDFJ+TmKgy5MFoBF+uzUbiVCbO2KKov9ZDuRoXWpArUr4sBk4PoKXvgfSbF3ws
 m7MZl6FF1WVf6t3ur/pPsaozmHw+wmTWXox0jwMIYPfkEbw/Hubs1FZ3r+W5CaRMSH4O
 YZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pD/ha1o6xuuVhzSZWIPaFNtC4/6La9+pE80liTrfGdE=;
 b=O2UsTeZ/XudTTesHL1gtv357j3UL4N1rMNWbNRrd8h1hjPx7aWuHLeBg1fU+6CLoDF
 QdkIxm4lzszA4hb9IV+fDS9iPa+ssksnte7/ZVkCoJd+5JyPcp2fT8+6ZUlSULlLCmcM
 LMglJUIUy1eEm5gAbpRnHs0bM0gWJYGzcCWe2egb9R9LZxnv/Ip+zA2Sdv/bnUHad1Ju
 SB8orqQ6mxyQ4Yhfb5F1N0UC30IsdoszsrNGsZPXuW30KClCBxGSidlMg2PzBZ+T6lWG
 KQPWPTbR0BS5WDjFNixAG4zOPnazWfkyYeNMuU4DsJXNcPmFSVt6HGsEv8a3qGDqfUwK
 ZNSQ==
X-Gm-Message-State: APjAAAXpamgY3MCT2DQ2MC2fxPMXrIjxdHPPzeK2Ga8Quq+Ift+mZDmQ
 DFWukebZX4nofzQMAUkUWoMj0A==
X-Google-Smtp-Source: APXvYqz8A36P9ZWbN4122tC3oJ0vZQQEooXHFzHbMajUhOclVDtOFX2+hq6RxAvjq57thiJ3WD3ipw==
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr26023039wrn.270.1555073508457; 
 Fri, 12 Apr 2019 05:51:48 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/7] arm64: dts: meson: g12a: add audio clock controller
Date: Fri, 12 Apr 2019 14:51:30 +0200
Message-Id: <20190412125136.28232-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055149_763054_0B84FEE2 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the controller dedicated to audio clocks found on the g12a SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index d6ca0bbd8f74..1ab2a77b01eb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 
 / {
 	compatible = "amlogic,g12a";
@@ -202,6 +203,42 @@
 					};
 				};
 			};
+
+			audio: bus@42000 {
+				compatible = "simple-bus";
+				reg = <0x0 0x42000 0x0 0x2000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x42000 0x0 0x2000>;
+
+				clkc_audio: clock-controller@0 {
+					status = "disabled";
+					compatible = "amlogic,g12a-audio-clkc";
+					reg = <0x0 0x0 0x0 0xb4>;
+					#clock-cells = <1>;
+
+					clocks = <&clkc CLKID_AUDIO>,
+						 <&clkc CLKID_MPLL0>,
+						 <&clkc CLKID_MPLL1>,
+						 <&clkc CLKID_MPLL2>,
+						 <&clkc CLKID_MPLL3>,
+						 <&clkc CLKID_HIFI_PLL>,
+						 <&clkc CLKID_FCLK_DIV3>,
+						 <&clkc CLKID_FCLK_DIV4>,
+						 <&clkc CLKID_GP0_PLL>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4",
+						      "mst_in5",
+						      "mst_in6",
+						      "mst_in7";
+
+					resets = <&reset RESET_AUDIO>;
+				};
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
