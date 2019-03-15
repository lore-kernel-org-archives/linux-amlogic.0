Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB3FC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6FD218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7mSsm+a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qdgV9tOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6FD218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b9kDP6L8T0nHd2+oVSrend0Zd4b4AmobOj+JsS4WDY=; b=q7mSsm+ayg4T4Q
	piLPbvIMMWN/sjoyt7ffs3D+iXi8KkIIYUj9Dgz9HEtDIAiSVk0EqRP9pAimR9NyHDINFNgS9OzpN
	uX1piW5UXsm582WdTVxERZ+Gh1Bl7Ep7B/djAZoQMRpTMUHikKcgfCj+5w9jEtDKXY2jCXRg1k3Lo
	FXKf+bZRG+QuywszaVa/prDB3RJKT1/GUnH0uiPxkrHMC/SoNW4Jl9bOBTIF536mtAxbyGL0lnkNx
	kaHSlcBwCzXrypyRrFeY/sggYwB94X4pHK+x4nToWJrw0y3AEvX8NfKB1I1or34qn7h0CsZuIR7QZ
	//Vgu4aOEIK5/bch3ceg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nKw-0007c3-OV; Fri, 15 Mar 2019 13:57:26 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nKY-0006rR-O4
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:57:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id f65so6610249wma.2
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ox5dhzmGa/6JQDhw+Y9moNKLx34n2K2pj1pY4zKasYU=;
 b=qdgV9tORh+lf/4sku7mYCbPT/s6p04k67zrHnrzQJA9aULYXbshCXDV4v1DhJzqhov
 1CJ6CFvTv6K/hd7gDmUPwYQZ7Ys2Uli/T1dVdn5ijxoCybkpOIjY64uxxrBLbDNUD+GT
 hgnJjEYETb2QuxHjza7tGum719AM8P/rBtMHUvdwCNh/Pp/LXqX6wrRDxOJRe48ZMHkU
 TTq6elMdoDBW9MJTYr5E0TLt8krzW0sTwPjM9CPIdfpqOKnSNs3ejOfLH3cGpP13KL8h
 d0UZKgEX5h8p6GNFfsJ3ynA4RAQ94fJy3OrwATDUx1/35JeBwc/fzA1VxGNfwtoBK5Vx
 uPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox5dhzmGa/6JQDhw+Y9moNKLx34n2K2pj1pY4zKasYU=;
 b=L6WWqTJeByBZPjrRvfeLp02Rl2TYMditWe2mcRcDsjl98EjmPUPWHhSi9drtcUuqFI
 pZvocmqyePOg+ZBXOS41fn1JX3dyrPIQcKhjGAbVANLltvuxpYWj4L3LLedLh6NYSZgz
 OQ/zdUbmL5FvNCReG4EOtYcdkB999AFJK56bTcHQKlTdWxtJAX9MwCMWogF4RWJIDtUK
 xiZKypeoHEUzZZglmyJIB3POJ7AuxoFX0lt1CYmWImreSo762KVmgEo6F96YpEnPVlxf
 cIrM0QkFD031CDMiRqAbCWfXAHmBiO7BwVCMghZM8VGzDct2xWnmhWX65rA4pc+B5sZZ
 +mfw==
X-Gm-Message-State: APjAAAV9QiqrJMHbOv8kB3/QGwmwdDGniM2uYuEUaqihWR2SaON6BW2z
 EHmcaxqKj8QnSSvscprCVUoPJw==
X-Google-Smtp-Source: APXvYqwIQoneCKa9W32nALR6Tj3GimCywQ1qdcByeYfBG/0A4RWS2a3XeyPEe0eLTiJg6DWQRGfehA==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr2217652wmh.122.1552658220950; 
 Fri, 15 Mar 2019 06:57:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a14sm2131900wrx.96.2019.03.15.06.57.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 15 Mar 2019 06:57:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/2] arm64: dts: meson-gxm: Add Mali-T820 node
Date: Fri, 15 Mar 2019 14:56:55 +0100
Message-Id: <20190315135655.28359-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190315135655.28359-1-narmstrong@baylibre.com>
References: <20190315135655.28359-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_065702_779922_587BAB1F 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

The Amlogic Meson GXM SoC embeds an ARM Mali T820 GPU.

This patch adds the node with all the needed properties to power
on the GPU.

This has been tested with the work-in-progress PanFrost project
aiming support for ARM Mali Midgard and later GPUs.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 247888d68a3a..35e59d390903 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -91,6 +91,33 @@
 		reset-names = "phy";
 		status = "okay";
 	};
+
+	mali: gpu@c0000 {
+		compatible = "amlogic,meson-gxm-mali", "arm,mali-t820";
+		reg = <0x0 0xc0000 0x0 0x40000>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gpu", "mmu", "job";
+		clocks = <&clkc CLKID_MALI>;
+		resets = <&reset RESET_MALI_CAPB3>, <&reset RESET_MALI>;
+
+		/*
+		 * Mali clocking is provided by two identical clock paths
+		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
+		 * free mux to safely change frequency while running.
+		 */
+		assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
+				  <&clkc CLKID_MALI_0>,
+				  <&clkc CLKID_MALI>; /* Glitch free mux */
+		assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
+					 <0>, /* Do Nothing */
+					 <&clkc CLKID_MALI_0>;
+		assigned-clock-rates = <0>, /* Do Nothing */
+				       <666666666>,
+				       <0>; /* Do Nothing */
+	};
 };
 
 &clkc_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
