Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39956C38A2A
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04ECD2082E
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UT6LGalh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ty5aisb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04ECD2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BThBAGjE/2jPchM7WG40BuR3A2CykOAx19KRDU0Nl+Q=; b=UT6LGalhyBaPLC
	bGdFdienmpwS3OwnMslsP3SlYS/bq/57NZiDcW6bYxFhAjQ8lM44SnLhCeofLT4k+WEg/7q7lzVJw
	Js56rKgTJMb2e8ptlJIRDyvO4MprcdalaLaEnIaqgxWY/5784kfP4UeqMX3z1xn7zYr4KqKPLXiQu
	ECfuBwzxT3mhx17S53CCSwvg7lngusJMBhgVMJgkJZenMMuJlkg4k9BYq1j43xMGl5tDoUOfDc7FR
	mftetKlNMG/sIxLQ+5zJsyxFIbEfl4Z7WO8dzKnlnKQRW5t7KnWx6ldFux1SDYy/q56HgFZFdZ2xu
	qmTo4DDq7sPuBZy2ggxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWSLm-0004AJ-9o; Wed, 06 May 2020 22:17:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWSLi-000460-3e
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 22:17:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id v4so5982752wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 15:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Prp52Y5a00MQ7UiUFWgZ97mkG5T8OKjyV13VHzZiu9w=;
 b=ty5aisb66j++kRcNuPiouXtTHM526s505r/8/KWSGy1fFWSsaW6lvLqi8kpDpWFDGQ
 0G0UPaU1VsEJByjGzxhJozHIEGCuOzRqyaCWzOwWPBJUMSho6m/dAqmANTx/meQ6/9rI
 U5sU9lv2FgJZu1BnANKM1A9joLIMrWoHazw6EIVw39Sf6do1qCJNS/2MuY0EZma/cNYL
 QtmpcnuBMm81K5gDBlJfo2Iktk9WQghJ6K25/O+Abqu+vXwSy4f4QkhgRtSckO3kd3Rg
 psjB/0QACh5xNw1dELfa9BrHntHte31KWln0LhUn4bdPEGJE3b6BG0xPNJzcY/NDyeIF
 gcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Prp52Y5a00MQ7UiUFWgZ97mkG5T8OKjyV13VHzZiu9w=;
 b=V2q1eqJthFVuVGgiTbpNKCsMEQ9N4fsKcBAUU1oggldkIDFt+DknU5b/z1MuQYTb9L
 2/9e01FAqsFZXV6RjBmwHSkMUYYWWwP32cFFjbAKgSFr2EjTI74A3H4Ao/o7l90Ssm8k
 wEpgP0fI0q5gUoymuk63/NLUyZsYMCTWYaaniqkeTqXzm7bo0oyhOSrD6Pc/1bmtbR6E
 ePW3r7KNnde7+73E2KxL1e5ix4EXrm6ADYUz61MsvrL2bLd5590uJorosHIVXdSHl/85
 LysDPyriTdutr01OJ0mAYbWU9kPHW9LucE+8hmQB2GIn1lYLjaXHVBgQ6eIdqZvff4yQ
 78gw==
X-Gm-Message-State: AGi0PuaP8fN0jM140y5gdLYZTpMHGvZZclAzeWN8l0PDCSFYBVlDk6fZ
 QD8r9fJQ830l2cMsEQnfKCGnTQ==
X-Google-Smtp-Source: APiQypIpHP2oFvyp2Nvd8um8TY8hC/bSKyCdRHrOH3fcUf7Mt2X9JVVO9azjqnAb8r6HBLBWYrUKCw==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr7095559wmj.161.1588803424929; 
 Wed, 06 May 2020 15:17:04 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:17:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/7] arm64: dts: meson: libretech-cc: add internal DAC support
Date: Thu,  7 May 2020 00:16:52 +0200
Message-Id: <20200506221656.477379-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_151706_147039_9A9986D9 
X-CRM114-Status: UNSURE (   8.98  )
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
DAC is provided on the 3.5mm jack connector.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index d81382b36049..5ae7bb6209cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -22,6 +22,13 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&hdmi_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -129,6 +136,12 @@ vddio_boot: regulator-vddio_boot {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GXL-LIBRETECH-S905X-CC";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -150,6 +163,10 @@ dai-link-1 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-2 {
@@ -159,9 +176,22 @@ codec-0 {
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
