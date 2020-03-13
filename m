Return-Path: <SRS0=FIcl=46=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7633AC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:11:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D9CD2073E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2020 09:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZxO3Zobb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ehu6PcgP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D9CD2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fc34wdZCj0ndvUCWURTKeRVdhlBWMJ+3CveUhOX8Nos=; b=ZxO3ZobbKcDCuU
	IXfv5l8MkOJI/KdaDMY/ZRaZgZagEGcEV4IORX/KXFqTyjHg+V1ynryLId2Kfzgi1ojBZ+NESqBKe
	W3OlM22McquuAyqep79Ga44/GGToPt5A0OnNk/gH4fM9kMf3ma2WPsNH9BoCKhfP6WdZ5fpHPcuFx
	tCk3ze4fWmL/hECo02TALrU/DdO4k4Q9Id8LiOnpW8aSJkzz2u9tYmmja0QNDvU4CGrORpm62XqHn
	OYcgVmWVoTl9wJoS0XJ9MqOfKHAtqPNyzhoD8WGHjJ8F8a4idibqGVvQGz6fSFiiZ4Gap+1a1BRmo
	EXxfN+AEiqOIp8xO/qug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgLZ-0000bo-6L; Fri, 13 Mar 2020 09:11:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgHo-0003oQ-C9
 for linux-amlogic@lists.infradead.org; Fri, 13 Mar 2020 09:07:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id x11so6295386wrv.5
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Mar 2020 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noym7N9HZ+0j3iemfyMolfTdAyqS68kNioWo1cBTRwM=;
 b=ehu6PcgPt850KQjzoV4GQagTdcUkLwYwh710xe+NU9v3iKlSKlhiukznVO0+fscCuX
 ScMV50BTelVKnRfFRKF9i6Vqn+RkQNHi1mN91q7nY0c0GYa9PXXbs+WXKLhWFVuew+vu
 BmmzNXNA8BPF9/bpDsmnAjsV7wcjvbQe5l9Gn8oVQYrxWIoI8fouyIhVJLhMr7iH4ubA
 FoLE1KQn+dGzWQPq0mepHbGk8DAZRmrZ9xpg3G8PiOnY/eZAr2u2NVRRzFhETaB8BqA8
 ZK4NEQXE18nuIuTn8tuluoTFL3TfuMX8qP3OUMCxsUjq9/wZWXwGqY5VofbKyzUZ2v8U
 nmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noym7N9HZ+0j3iemfyMolfTdAyqS68kNioWo1cBTRwM=;
 b=kcFyykV9gDrBtbgRBaRfoY+V2c7c+acSZhr16oj0F2nsvnFro9WyAU6PXvQn1VMDuh
 etz4/vr9wLSEVhi9MDWtQXFBZzM/jBQwxI+WR0mdrYdOn+ALXYXGTPVlBeOTBJnopdD2
 1UgjCOR471sVbc2dbmqZR32EhOYbhEIm3+NLfAmciedr5aGC1dX7Vva+WKZn6Rhqf01f
 PQ7Ss1Acgq4MTbNaSNQaSUXmeg6SlByn+oBzE2Qa2LqWcrI/pJuLIZO6v0CF7I2MjI5m
 pkvP5YKsFpRVMoemaa+Pmaubktn9TcinjiqrsxIk3Uv69aATwIotC75IIg8y5BO5ZxMF
 Iq4w==
X-Gm-Message-State: ANhLgQ2/BXl9jV0COh3ZoNOTsWTq5N4rxIt/kWwCHvJMQU4q3GWfVyej
 rSJwL0EvAUjETuNXVxISZQuzxRNaDZxj8A==
X-Google-Smtp-Source: ADFU+vvGEUqKOHAbXHeHU9sk0wLV/5ZlhtBmNDC8otoQy0IjrRf1k/8Ec6KWw0KmFvH2+W0feRZgzA==
X-Received: by 2002:adf:c40e:: with SMTP id v14mr16353044wrf.408.1584090438334; 
 Fri, 13 Mar 2020 02:07:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id i1sm61872399wrs.18.2020.03.13.02.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 02:07:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/4] arm64: dts: meson-g12: split emmc pins to select 4 or 8
 bus width
Date: Fri, 13 Mar 2020 10:07:10 +0100
Message-Id: <20200313090713.15147-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200313090713.15147-1-narmstrong@baylibre.com>
References: <20200313090713.15147-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_020720_431076_4066351E 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Khadas VIM3 shares the eMMC pins 4 to 7 with the SPI NOR, in order
to enable the eMMC and the SPI NOR interface, we need to omit the
4 last pins from the eMMC pinctrl.

As it was done for the Khadas VIM2, split the eMMC pinctrls in ctrl, data
and ds pins with either 4bits data or 8bits data, and update the current
board accordingly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 40 ++++++++++++++-----
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  2 +-
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 +-
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  2 +-
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts |  2 +-
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  2 +-
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  2 +-
 8 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 87b9a47a51b9..d09efb86ec33 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -295,17 +295,9 @@
 						};
 					};
 
-					emmc_pins: emmc {
+					emmc_ctrl_pins: emmc-ctrl {
 						mux-0 {
-							groups = "emmc_nand_d0",
-								 "emmc_nand_d1",
-								 "emmc_nand_d2",
-								 "emmc_nand_d3",
-								 "emmc_nand_d4",
-								 "emmc_nand_d5",
-								 "emmc_nand_d6",
-								 "emmc_nand_d7",
-								 "emmc_cmd";
+							groups = "emmc_cmd";
 							function = "emmc";
 							bias-pull-up;
 							drive-strength-microamp = <4000>;
@@ -319,6 +311,34 @@
 						};
 					};
 
+					emmc_data_4b_pins: emmc-data-4b {
+						mux-0 {
+							groups = "emmc_nand_d0",
+								 "emmc_nand_d1",
+								 "emmc_nand_d2",
+								 "emmc_nand_d3";
+							function = "emmc";
+							bias-pull-up;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					emmc_data_8b_pins: emmc-data-8b {
+						mux-0 {
+							groups = "emmc_nand_d0",
+								 "emmc_nand_d1",
+								 "emmc_nand_d2",
+								 "emmc_nand_d3",
+								 "emmc_nand_d4",
+								 "emmc_nand_d5",
+								 "emmc_nand_d6",
+								 "emmc_nand_d7";
+							function = "emmc";
+							bias-pull-up;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
 					emmc_ds_pins: emmc-ds {
 						mux {
 							groups = "emmc_nand_ds";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 168f460e11fa..b00d0468c753 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -472,7 +472,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 2a324f0136e3..a26bfe72550f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -271,7 +271,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 4f2596d82989..1b07c8c06eac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -443,7 +443,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 8830d3844885..b59ae1a297f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -435,7 +435,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index ccd0bced01e8..325e448eb09c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -485,7 +485,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 90815fa25ec6..b6f22a0bd318 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -312,7 +312,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index a8bb3fa9fec9..71cc730a4913 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -518,7 +518,7 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
