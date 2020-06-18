Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C07AC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 09:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3AA217A0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 09:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p1t2rzR+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtXMobp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3AA217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AyRw+T2kXwdRywDOJxXcVIAGBQvs0XFhumKfcSsKIGI=; b=p1t2rzR+bWW3CC
	NUp7y/Q4XasqXJhxwSxWHGlwLF0WjRR+8iJmKFpvW+PMhqM/feav1lIJhXgik1qfSCldYP7hjCfPy
	4EMRs5SMUA5ZzRjkmxorLHnjaQCSsNuRBBuypg9EO3iahp2ryS7RPFH6XT/KSF1dHZdVute7LgJss
	SARKXCOnnJ8hH2UbsNwHPZOeVYOcj+wuJe5Vz8SzxrBRz21Exzf/1k06J11LXsTihnKUPj9FGgZMY
	hGWdi3jGOg9CEJJm/+5GJ+g8jWtqoOMfCw5HSWtuUPukGMtqMnGMgXtJh8HMbA8blhL+zlKibutFQ
	nFrBD/rdPnGmZdyo0UJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlrDP-0005sT-Dy; Thu, 18 Jun 2020 09:52:11 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlrDG-0005fh-6F; Thu, 18 Jun 2020 09:52:03 +0000
Received: by mail-pf1-x444.google.com with SMTP id a127so2534480pfa.12;
 Thu, 18 Jun 2020 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=rlTaG4vEHV6obr/G85MD+Ik1qzQppM95dWbM2mQ30No=;
 b=XtXMobp1DssYwYeOkZQeegBQpybQHz6LYBfWFI/gC6jPaWEtCcHLm3SBm7d7l5QOTd
 sJjI4oNVfdezgxwoD7ebdbVqmFUJvleHwbrT99mP4y56Il/Ckp7z1p3ciPiEiAsj+3kT
 DQIR1nQJidTkiy3DYumYEOojMX08Giz8wF3Hf6odDCcNkVm+HY8776ExTFg9rfRDKG52
 pCUjJ40t9LwJ2fKXVW/9YGtS5DNRyTcQxNZFRFMTQaVjf38FhnFU51h0RsSbZ9xx9o8m
 Gp8boKfUoJtcL2gMOCgB4lZfsK0Bkh27YV6nv7CJ1q3JleSVIfcf9M7OrAxPKSWG67Ld
 24gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=rlTaG4vEHV6obr/G85MD+Ik1qzQppM95dWbM2mQ30No=;
 b=ZydZ+yAuMU2KKiQ8CElFMT17tRiqU5uEJjC8p/AKJldq/sdTxn9oy1rUdX+xy3fzEN
 faTLTs2sak8DLa27V9uJjUJ6NjUir0sxFCaYEbuIY2O5DcPu73pCFq+smxG//++kRpmK
 P0GVGCz0juxNOIkSrepH+l2geN5NjC/C/wT3z/87K8nMgUgaMGqlAAmv3xoDsIGd7nA3
 kCcBG8r74rAOMPr32pJNltQKIpIF82rshW6PSGqY5AdrQWCbcew/6hJL38w3nR9+Enj9
 9oT2f5ZQSV4WsgvqFRfBPKWEOkQPgWbMAsl9Yt4bCZX6ssKS8tVjXe8LOStGOh8BSgAU
 jCdQ==
X-Gm-Message-State: AOAM5337/GRquiMfFn/qKYyDjGLzi97NK04IJWbwiQdiOUZzgXY5OFaE
 FIjblsq0aziIR7x09kMbyDQ=
X-Google-Smtp-Source: ABdhPJyDgvg6arfypbKJjGrfCEVPwrJXeBR3QGkGNPtYZc4CCDRysB90RjiOBS4/5HzvwK83G4SfGQ==
X-Received: by 2002:a62:5ec2:: with SMTP id s185mr2954274pfb.0.1592473921435; 
 Thu, 18 Jun 2020 02:52:01 -0700 (PDT)
Received: from home-desktop ([114.204.138.55])
 by smtp.gmail.com with ESMTPSA id s26sm2045206pga.80.2020.06.18.02.51.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 02:52:00 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:51:55 +0900
From: Hyeonki Hong <hhk7734@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: odroid: add spicc0 controller node
Message-ID: <20200618095150.GA9713@home-desktop>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_025202_258754_AE256B00 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add enabled spicc0 controller node with annotations describing the
physical SPI0 pin number based on the 40 pin header on the Odroid
board.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 26 +++++++++++++++++--
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 24 ++++++++++++++++-
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 169ea283d4ee..ec6d345caaae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -16,8 +16,9 @@
 	model = "Hardkernel ODROID-N2";
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
+		spi0 = &spicc0
 	};
 
 	chosen {
@@ -328,7 +329,7 @@
 
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
-		/* Realtek RTL8211F (0x001cc916) */	
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 
@@ -451,6 +452,27 @@
 	vqmmc-supply = <&flash_1v8>;
 };
 
+&spicc0 {
+	status = "okay";
+
+	/*
+	 * 40 Pin Header : MOSI(GPIOX.8->19 Pin),
+	 *		   MISO(GPIOX.9->21 Pin),
+	 *		   SPI0_CLK(GPIOX.11->23 Pin)
+	 *		   SPI_CE0(GPIOX.10->24 Pin),
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&spicc0_x_pins>, <&spicc0_ss0_x_pins>;
+
+	spidev@0 {
+		compatible = "spidev";
+		status = "okay";
+		/* spi default max clock 100Mhz */
+		spi-max-frequency = <100000000>;
+		reg = <0>;
+	};
+};
+
 /*
  * EMMC_D4, EMMC_D5, EMMC_D6 and EMMC_D7 pins are shared between SPI NOR pins
  * and eMMC Data 4 to 7 pins.
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 00d90b30f8b4..f809b2ba6b15 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -14,8 +14,9 @@
 	model = "Hardkernel ODROID-C4";
 
 	aliases {
-		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		serial0 = &uart_AO;
+		spi0 = &spicc0;
 	};
 
 	chosen {
@@ -381,6 +382,27 @@
 	vqmmc-supply = <&flash_1v8>;
 };
 
+&spicc0 {
+	status = "okay";
+
+	/*
+	 * 40 Pin Header : MOSI(GPIOX.8->19 Pin),
+	 *		   MISO(GPIOX.9->21 Pin),
+	 *		   SPI0_CLK(GPIOX.11->23 Pin)
+	 *		   SPI_CE0(GPIOX.10->24 Pin),
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&spicc0_x_pins>, <&spicc0_ss0_x_pins>;
+
+	spidev@0 {
+		compatible = "spidev";
+		status = "okay";
+		/* spi default max clock 100Mhz */
+		spi-max-frequency = <100000000>;
+		reg = <0>;
+	};
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
