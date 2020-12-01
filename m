Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ADFC64E7B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 06:21:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284602087D
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 06:21:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kE1SbcmI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXJKZ0qW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284602087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YjAD7dLtPX2mjAJoGqEBO1DyQ3r0DuyFvFacOZnsvvQ=; b=kE1SbcmIQZxOu4cOvGdW2tYNLi
	UO1rrztPQqcfS3d/HSnIb+r7jplkjaPsCQqiAVFLxcO85vopwotI0a8d7DiQBzgxobLkh2SJ1XbLk
	SQpPLT0TZkW5q8MkOVJUHAfCXXXEe++Rqh4TEVzm5VkD/hRPItH/i/gdlJOh6Wu4GallBAdZmEVwx
	veEy4JkL8GXHvvyC6RHykJ+nn8fiZ6tb0YKSgofIYZPZahQSrEO/yUKjOuV2FZf2zQ/SontQ1UbiA
	5pZu99Jk4yCQ5Ns8b0mRotZZ1ddQHgmsPDCjde73mlLBS/5Dv31nlPyPTGWisck+RzG/8V0MCKa36
	5UhKPfgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjz2o-0007zN-6G; Tue, 01 Dec 2020 06:21:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjz2l-0007yh-2b; Tue, 01 Dec 2020 06:21:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id t4so769873wrr.12;
 Mon, 30 Nov 2020 22:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B4+vAwQ0XCGKpTMOHLaGMHXIiumHxrp3xUNQ40+C1+8=;
 b=rXJKZ0qW5KrSEWabbe0E2m7shheeGE//k5UkLxCKEibmNwbb3xc2/iAp3VyX58+7/P
 QibHPg4Rhn/mQDnynGzpK6nPXS984H0gSIdB75Yht6kObRNXRmFrav4WPk7Rws2+J1FS
 z50xoyhegyr/gZVre+FVn898P1i3GnhQIGqNq3I4eUVPbAIObq5xocfqUFkbw2pDA+Vg
 kjjCYdoud/eT+Bibe+X3EriN1zWQjnwYjoggn9uRkKpHLgb/S8eZNXZDtxK5ZMo+zfvC
 +3nTGhXnVkOQvNqZc34EioGCAE0i39rO8Icpqr7eEeNcTXttvOZQ1mW1xnsNgmIBt098
 1wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B4+vAwQ0XCGKpTMOHLaGMHXIiumHxrp3xUNQ40+C1+8=;
 b=eDGgn916WqGqRIWTjQ9ZQQgg/lWRaQS3Wtxl0njGoandfw4AVwgFGDLm0XeXZdJqIg
 udva7a+ECGWVaPgaFWnW6NOA8MyJWjx505IKYTZJ2XameGUOGIg86juMGCetIIH+ei94
 3MLHbLD3PuYEtxQvYeuPuxQdDoa/LXpu7yE9yMfjwX12//Ovenl03OjVThEZljgiPOHT
 HCZ7TF/P4GR6bUMTWCD2Yh7x+IBPyUlSkCOMJNAXMXDuHSGRW60YT1t/j8L3J49owqwt
 Qa168co/hzzEQICps/J9PZ63XHkZVUjDqKXjPP49SrkHS7LmB3nLQz5yWwz+l3iledf/
 J9Hw==
X-Gm-Message-State: AOAM530Eq6fS7YuvukU6VfLZBSu3UQdvvmuzacD6bHNzyg/EWoIFObCa
 jwVC/8EIR0CndRkdYx52pA9YVkhAAAQ=
X-Google-Smtp-Source: ABdhPJxp4scGf9eqgOeK9SrGoge69GmJOdlImhNfFcszMuRmEiHWjISTjs6y6cynMoOYb+ygD6AxTw==
X-Received: by 2002:adf:9bd0:: with SMTP id e16mr1716956wrc.196.1606803700442; 
 Mon, 30 Nov 2020 22:21:40 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 90sm1182182wra.95.2020.11.30.22.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 22:21:39 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to
 GT-King/GT-King-Pro
Date: Tue,  1 Dec 2020 06:21:35 +0000
Message-Id: <20201201062135.18241-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_012143_171741_BF686AC7 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GT-King and GT-King-Pro boxes have an RTC chip and power cell, so enable it.

GTKING:~ # dmesg | grep rtc
[    5.237245] meson-vrtc ff8000a8.rtc: registered as rtc1
[    5.261869] rtc-hym8563 0-0051: registered as rtc0
[    5.265016] rtc-hym8563 0-0051: setting system clock to 2020-11-30T09:16:54 UTC (1606727814)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts | 17 +++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-gtking.dts     | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
index f0c56a16af3d..0e5c500fb78f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
@@ -14,6 +14,11 @@
 	compatible = "azw,gtking", "amlogic,g12b";
 	model = "Beelink GT-King Pro";
 
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
+	};
+
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
@@ -112,6 +117,18 @@
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
 &tdmif_b {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index eeb7bc5539ef..10b87eb97b14 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -14,6 +14,11 @@
 	compatible = "azw,gtking", "amlogic,g12b";
 	model = "Beelink GT-King";
 
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
+	};
+
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
@@ -122,6 +127,19 @@
 	status = "okay";
 };
 
+
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
 &spdifout {
 	pinctrl-0 = <&spdif_out_h_pins>;
 	pinctrl-names = "default";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
