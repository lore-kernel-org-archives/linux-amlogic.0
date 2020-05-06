Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68415C54E49
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388AA20753
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZCMOHP8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R/XprMhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 388AA20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8lLnR/OT+u+ACmUCOJDkmWPLDVEIy8UZ0uTCT5Gjl0=; b=mZCMOHP8BEq7MS
	9yqbpVFh/XxU1X05RtRlL5dbTJdDiOuiuKJsTIznIvPAWX8YoJQjrxMFDal3C2+mSs2UwFOyc2EmQ
	cW/Mc/YM8PoKCZHLT+ubPGcW8kdE8yU7Iv4RtH3qzt5juLc/4TZpMjBhE21jpjS08b2zQIzK1D1Ac
	pVqjesTT8g4bkAG2F9XxZqFWACJImRokCvQbvCFf9RqTNtSnqoCcBu+s7mxRHqEDdbSw4T2qmTYQx
	WYLxec2SDhtKc2sUsXEMAvkYEWAJCbMoO75wHrg4UjANIE528OgxHR2wG0rLRJ3Ahqj/R15bpMtMt
	sWm7+ia06KkWo5+ZhncQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWSLl-00048s-E5; Wed, 06 May 2020 22:17:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWSLh-00045l-72
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 22:17:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id l18so4003827wrn.6
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MMsqSs/SSZ3pe/sBbExNqHgguhkBo7qZyyilemVOFmk=;
 b=R/XprMhFIHT73MOJsNm/08fO4X1XbkAG8F09dAKe5z7OhBsUZKFIr+hbWrI4dU4PpN
 ClomDlzaWGVcCoNAjnpvhsQvdzvalf9g2X3azJZ/6zlFKmQ9sMLyiMnn8lpCLDW+JzqR
 2BNXZj6cNzAgkxQOgWTitjGL0M0/PjSTEVW3TYgUddQnB9x/v+3bb7XjmtEqT8XKPwG8
 Ep1vNi8AA9JYHabMT9wxwLYjDOd4QNfip9AsvZRIvWWEgRg3zYqD1R48xhPrJLPZ1Uqx
 R5w7BF2kSIf6qoD/2n9xTKPMrBacFnzO1AKCU35bO1D233Fdtt9Y6fR3zhKWo1DzITWe
 MTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMsqSs/SSZ3pe/sBbExNqHgguhkBo7qZyyilemVOFmk=;
 b=rIKN/gTIv9t8OQnr0ARNW3EruYpGiSUnDW/F3WRuU9m2jf7DQykSWHL4sPRqDzQe+9
 PNMVwqkRCLrocDMSuBUpZxGzDR132U6xB5D0fLboOBfqHKpzBMNep0gYkzACtTlyt+Zi
 J4Gy1kwV0Lp1h9R7R+Gy9MpmXj4isesc/G5vbLMVLZZIbspLdDp1dVRfm/laJ+gWd1DC
 Ab5UsPtCmxI2lfIXdJw+n2D0xWH8lG/NRD8X5Dx9GhNyb07Kkc+CLgt09bZYSScPGWbM
 XzfwHiEGftMg01R58XAcVuQwJLTfjwelJ98dtrUfWj9amxL/7jRdXSUgnP2Rjar5YGuL
 1HYQ==
X-Gm-Message-State: AGi0Pua+8VzTDectR+IsmIqT+FcHRb87hMaHmeQFoFZnx6W1dy7E/L7v
 QyEFQo3OAWI1tcb2NetatAtlUA==
X-Google-Smtp-Source: APiQypJQBg086iQTTx6VFZFje8o4xqNCPjNd3ec/pqGfUNwp2w2xdZlzaN3MmJl8MdEj1hpq6QMcdw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr13089933wrq.158.1588803423764; 
 Wed, 06 May 2020 15:17:03 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:17:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/7] arm64: dts: meson: p230-q200: add internal DAC support
Date: Thu,  7 May 2020 00:16:51 +0200
Message-Id: <20200506221656.477379-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_151705_249812_21CF9479 
X-CRM114-Status: UNSURE (   9.22  )
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

Add the necessary bits to support the internal audio DAC the p230/q200
reference design derivated boards. The output of this DAC is provided
on the 3.5mm jack connector

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index acb05a756aca..6b57e15aade3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -16,6 +16,13 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&hdmi_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
@@ -115,6 +122,14 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GX-P230-Q200";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLP",
+				"AU2 INR", "ACODEC LORP",
+				"AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -140,6 +155,10 @@ dai-link-2 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-3 {
@@ -157,9 +176,22 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-5 {
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
 	pinctrl-0 = <&spdif_out_h_pins>;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
