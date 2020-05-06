Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53370C38A2A
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240D720753
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYDaLEdg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G0NdJSCy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240D720753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z47bQbO3+zt3gJ+/39PEXfNw/y5Hq6cfkGOmb6t9/hU=; b=iYDaLEdgPq8r+2
	uU7UdpGFNcdmlKs6ab3Og+tpBUE0KEEtE+oCKGVYpJMa5dFu/UFYyDHs8eu9/4N+E3S+RyjfT1noY
	xLRjCNb+60z52ApeXVqmasXy3O+7VcmLo0peqecaL41mWwLFFvvaeCs6TokHKKizIL9tYapaJlPCp
	iO16Pol6vw4A1Ofign4epnX7TEqYEY4g8hoP1Oi9TBn+9G13ZaQsmwGP9sYzPROG8Rw6vQVYp+MpJ
	146LR5UgzdV0IsDoH1QECBNAp7p3tXn79Rv3lRrhyCzYBp67/14lFzNFrkjPW3PF2Grr/xcUAoNu4
	IXLt3PAeYNoPWGAtD+Ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWSLr-0004Hk-Ev; Wed, 06 May 2020 22:17:15 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWSLm-00049T-LA
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 22:17:12 +0000
Received: by mail-wr1-x442.google.com with SMTP id h9so4028216wrt.0
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 15:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTiLbnU+bbYcNina6WdSi4nhXwiJzisYjraHaG7nzCI=;
 b=G0NdJSCyn+58VpBj4IgiHTWg9VW/e1APCHxcqDdBgExXPBA5t00NZsCa5PwhQlsSR6
 32SaRv7bI9+tDwOKdFpJMKnk2342nKJASZWaiendmZxg/FmZ1e9plF4lYtddv89InDSe
 L4ZG9d53G15j2gNCSHFjxNDsKk190EmA7Cmy30mgJjVKuMktYBWUrZNHJ3bT6lHSF0DC
 p5LpbPVPUMHTuHuQRgG8HfoKi8ZBeX1c1KM4UR4T1WJA+8F1Az0FX3V39VY4Z+h+qXSU
 FjoZfdxOZQJNOQ9fvlVzMz4Q8DLGBz9xUvCO2mqAq5oV6pYUsKqvEOhSjOK9JELqCLj8
 RbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTiLbnU+bbYcNina6WdSi4nhXwiJzisYjraHaG7nzCI=;
 b=l23OldpqNfB65qJkQe0mbRBuVfxQFmBg2dXCurbuvcBtx0ZsvFb7a8D8sC4znLdBjy
 p57Ndlp9jCevCAYU5C3CPVO0NKdHNqXHq/UNcJofNLNA/iypl5D0gITunz4BF5ZZ+td9
 bp8NPC8srnhDzaWa1X3LxNRZzY6hPWvjYTXlqgS8GOWDxTZ/4HRwyfcbj5Kv3EuqvOAf
 1n5q4sRIwZ4DSk2juihaVesksWatzWLIQ1Gkbjy1jphEwifWRdJyqDL2+teGtVx2kQjZ
 qki8Z/7do6m/VwGzEFBpMqRNB+A1wnRm5Hx7Yn1JY82rTEY6VpOamU2FIYff/yCDO8Dk
 +diQ==
X-Gm-Message-State: AGi0PuaTKbToDX9+DCyxnMcuGrnQ0hGiN69oypynEZTJTnvdUFLaA3BU
 MePtxfdiayZ4BN3V7E4xWK0rxQ==
X-Google-Smtp-Source: APiQypLxQ4m4rLedaNsN99CEE6SO6iXRQQK2EGYB3T20jnsH6wn7Fc1IP+aEJEkAKpF15Cw5zD3HgA==
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr11618638wrw.319.1588803429114; 
 Wed, 06 May 2020 15:17:09 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:17:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/7] arm64: dts: meson: libretech-pc: add internal DAC support
Date: Thu,  7 May 2020 00:16:54 +0200
Message-Id: <20200506221656.477379-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_151710_704071_1C7B3471 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the internal DAC support on the libretech CC. The output of this
DAC is provided on the 9J4 connector.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 514fed57a5ce..c2480bab8d33 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -30,6 +30,13 @@ aliases {
 		spi0 = &spifc;
 	};
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&vcc5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -180,6 +187,13 @@ vddio_card: regulator-vddio-card {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GXL-LIBRETECH-S9XX-PC";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Speaker", "7J4-14 LEFT",
+				"Speaker", "7J4-11 RIGHT";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"7J4-14 LEFT", "AU2 OUTL",
+				"7J4-11 RIGHT", "AU2 OUTR";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -201,6 +215,10 @@ dai-link-1 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-2 {
@@ -210,9 +228,22 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
 	};
 };
 
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
 &aiu {
 	status = "okay";
 };
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
