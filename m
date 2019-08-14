Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6158C32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EAC216F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiwD9B+z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IqI94GTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EAC216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIH03VM2TYXnXDY05D/prlLD4CM/gi1VjCQXsOiu7jA=; b=HiwD9B+zT00/Dy
	4vwbxgv7dBWGUdAZzOCligQx2GkDs1tur0uuNSN6ODSNIZb015xsxDMYYZrOSbqfzv6EmINicKVwq
	SCvkTywmQYbi0pgxx2ph3L9X8crJfV9n60ZD/QZevGDR0q576epwUcLa3zcImHBLKs+Ow614D8QX/
	9tMOIEvzayK6wmJuPTCj6TmsaCHMxPTn/rhhfmLIn0RyHJIfxRZimfRj5/sXcEdO7q/INUyrb4ooU
	VcEZ9rnSqDQXUVEcAYkBQZ9kMSGD+oK2JSLxW05phIRNgU5RLV4v0SSVGOamErXnoLld1tg/8HFaY
	oYOAlMsjisKTIcWV8e5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuIB-0004e4-Gl; Wed, 14 Aug 2019 14:30:23 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHK-0002YV-5B
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id 207so4789649wma.1
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7YNeFtjeLzj2ZP9RpFGGR+B2jpIWWxMTHTrjexUO1g=;
 b=IqI94GTGPdf2nsFVn/NaqhSNgaLWaaNXfva4TMtTbghi5rmmed/neyPAG12guX3hgn
 OgJnnT+YECRo7t8BaNVHm+UoKdfQJ7iVxUmhEI+HeuE0cu/eQYzUja4iJZA4QwbPqtbM
 iTxXj2TpNLXzWxNOCza13xIcgidwbcVwdmuP4kzJic0bfQXN/gPYZhpHtxm1z/H02dWS
 3x3sNkme8gT2p88S+bce2cadVd9nnYGJUVMtDlbIuNI16G62WIkYgJevByfqXhzbQznl
 s8vBLlba/qd+xjD9Tn4hBV1CGEY4fsbkKYiqstn4Esn+TNGM4iHcZm/UftUP6fsm1Ysx
 MxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7YNeFtjeLzj2ZP9RpFGGR+B2jpIWWxMTHTrjexUO1g=;
 b=r9VEizjqJP7kS4y9zLY3T9ka+V19i5gPoFWEZZ+MlemGZ4F7d+epLhxysmT+3WiI6Z
 D6PdI28/Ol6kXJMyAxsciejuF6/QzmPy884DUW8SzeHgRYYGgwtU5pGrHuZgllOZq58o
 xG93kA5234CCWNl8zaWcQuF80QKtLFy5IRYVMX6nazUZRO0W4lpSVkCAqNGqGpyXw7YH
 8ERyLds4X+n/qr5mxDCCULv/DYvbdiYeaAMPp3F/8zwUSxedQksMgm80ML2qmISHEJhH
 IqbUvDZj4fG0e9wS83Xin/fU3VdKF45ttQyRCtly/f7I8PZbVdl6A2OULPOGDREcH/TF
 XpiA==
X-Gm-Message-State: APjAAAWp+VTupz4AMLJK/mJxgOVjxNYXfPhFos+nlUCqw8RCEPZAmuAx
 dboFXlCADvjGjhDJQE6+YxMeug==
X-Google-Smtp-Source: APXvYqzEG9vlt4nb60z8dSoEcbqG0CeS9wVZUb0NXzJLu7/9wK5u+UmsjQi5pe9uBCsgDDoedOTp5g==
X-Received: by 2002:a05:600c:23d1:: with SMTP id
 p17mr3470755wmb.175.1565792963898; 
 Wed, 14 Aug 2019 07:29:23 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 01/14] arm64: dts: meson: fix ethernet mac reg format
Date: Wed, 14 Aug 2019 16:29:05 +0200
Message-Id: <20190814142918.11636-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072930_236863_93710135 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-axg-s400.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
meson-axg-s400.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
meson-g12a-u200.dt.yaml: soc: ethernet@ff3f0000:reg:0: [0, 4282318848, 0, 65536, 0, 4284695872, 0, 8] is too long
meson-g12a-u200.dt.yaml: ethernet@ff3f0000: reg: [[0, 4282318848, 0, 65536, 0, 4284695872, 0, 8]] is too short
meson-gxbb-nanopi-k2.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long
meson-gxl-s805x-libretech-ac.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too lon

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 3 ---
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6219337033a0..4a134d29491d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -174,8 +174,8 @@
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
 				     "snps,dwmac";
-			reg = <0x0 0xff3f0000 0x0 0x10000
-			       0x0 0xff634540 0x0 0x8>;
+			reg = <0x0 0xff3f0000 0x0 0x10000>,
+			      <0x0 0xff634540 0x0 0x8>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index f8d43e3dcf20..465106d37289 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -141,8 +141,8 @@
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
 				     "snps,dwmac";
-			reg = <0x0 0xff3f0000 0x0 0x10000
-			       0x0 0xff634540 0x0 0x8>;
+			reg = <0x0 0xff3f0000 0x0 0x10000>,
+			      <0x0 0xff634540 0x0 0x8>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 74d03fc706be..faff77175486 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -489,8 +489,8 @@
 			compatible = "amlogic,meson-gxbb-dwmac",
 				     "snps,dwmac-3.70a",
 				     "snps,dwmac";
-			reg = <0x0 0xc9410000 0x0 0x10000
-			       0x0 0xc8834540 0x0 0x4>;
+			reg = <0x0 0xc9410000 0x0 0x10000>,
+			      <0x0 0xc8834540 0x0 0x4>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index c959456bacc6..ee1ecdbcc958 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -80,9 +80,6 @@
 };
 
 &ethmac {
-	reg = <0x0 0xc9410000 0x0 0x10000
-	       0x0 0xc8834540 0x0 0x4>;
-
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
 		 <&clkc CLKID_MPLL2>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
