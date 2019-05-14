Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4394FC46470
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 10:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155C721537
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 10:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VadiQuth";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BhwJiYLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155C721537
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uu9o9RtdC16v5AOYB22KLpUGGHOOtoLpwyAX3YzQZfw=; b=VadiQuthuOqBvW
	mhNGAUac5sinlM6iO8LnqL/O4YByAFDTFOSCZvRZYnmTrAZo+rYyXY4gJ8TjnqTR7589hxSUbKshW
	qazwHEvRRyTGmPqydWaXoRmfQl+n8wWFJAOv+xjg5BjLNL2iZv7+rwlQVFEbfdMEXqSfpBd2jZ0Er
	05g2P5nKiTDnZNeq8K17ba56d0N/oCNbwZq/ItYgYQLEaLgSjpuqQiHTzjQJdJlurwujeJfmx+EM0
	MG444F3mc3p9Gr8lTMLXZXWDmS5Rvru5liVrb0SwDc68x88xpJTZCmVcQOTdFveub0xuPWEqVGkr9
	+gK8n/Sr6osGhnUCJGcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQUQW-00038l-8T; Tue, 14 May 2019 10:12:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQUQU-00037m-13
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 10:12:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id w12so18540890wrp.2
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Atf8xTduPRCjHaXk5dCgP7q9YSDsKO5FSEd0MFVYX1Y=;
 b=BhwJiYLVrHp0f/xqZZSNWoay0tbstdkSlIs6prGA+SI3lltcaTNCegPX6mmnazAjux
 hUiIgZZIZd25bQGz/xHRuV+R4JE7TsiuqDekrQhlLgbMU8qkz6BYd0fnpQv49pYkLQki
 yXKJDabVln4yUT/LaIzA92sF1sGfYSqtm9UC4nBAv6n3/7/aNc0Aw04hPbGOrCqmXdpp
 b6xfEHfju50RBn0Og7uJhFVm7aiwLuw1D2atAbSAFtgZlztFgB9YB0BcPmzraj6EfMqC
 Zzp2u50Rn7ihBD5+EzKn8k3Z8vPLJ42sDh4WrSPWM84qBifGep2j0izZJtdHxgiyWx2H
 q3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Atf8xTduPRCjHaXk5dCgP7q9YSDsKO5FSEd0MFVYX1Y=;
 b=Smylf3UeuNWoEWKBHYRaEHdOdI4X7bjbrzW7bLsOWw2axeEBRNKMAzILFAxJmAV9O6
 sIzjrteBKbIQHzjIa1EKLKwOoVJ5Ix1z+Xgo0rHZM2MrcjzaBVqFrT28pz+/vxt9T6Uh
 m1+dSG/EH1AvEiJH1MlsitIrusI+r4g8G+8N8UcnKok0YWUVCAzA+n+qm/aN236S4RG+
 NCGp6Cp9377iLjCciLVI700iB0cr826BUITa7EqvYUSiHEG0XFAMAnH8e2urSMMIZG1Q
 cvA+6YBq1M5MQI4a6NStCbKhgVEAJG1jeJyQ76uUMnWW8R9nD+CcgLdtn18XkoezMLxG
 ugIg==
X-Gm-Message-State: APjAAAUCRVexzr4kH9Zx6D8nJmiu0Xi6tZw2p+4rEjIqa1oVE3JyuUvM
 Il48pV+rkBE53ujpYjnzrmwj2A==
X-Google-Smtp-Source: APXvYqycdgP46dGvov7Qs/H3XUTJIeYdFqMSfT6eFoH0Mj6MOif7X082m+VcRCv04QbmJbI343elZw==
X-Received: by 2002:adf:81a2:: with SMTP id 31mr20914699wra.165.1557828768534; 
 Tue, 14 May 2019 03:12:48 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id r23sm2219564wmh.29.2019.05.14.03.12.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 03:12:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/3] arm64: dts: meson: g12a: add i2c nodes
Date: Tue, 14 May 2019 12:12:35 +0200
Message-Id: <20190514101237.13969-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514101237.13969-1-jbrunet@baylibre.com>
References: <20190514101237.13969-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_031250_078671_D3756461 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add pinctrl and nodes for i2c support on amlogic g12a

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 268 ++++++++++++++++++++
 1 file changed, 268 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ca01064a771a..e6c0c19b3223 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -244,6 +244,188 @@
 						};
 					};
 
+
+					i2c0_sda_c_pins: i2c0-sda-c {
+						mux {
+							groups = "i2c0_sda_c";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+
+						};
+					};
+
+					i2c0_sck_c_pins: i2c0-sck-c {
+						mux {
+							groups = "i2c0_sck_c";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c0_sda_z0_pins: i2c0-sda-z0 {
+						mux {
+							groups = "i2c0_sda_z0";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c0_sck_z1_pins: i2c0-sck-z1 {
+						mux {
+							groups = "i2c0_sck_z1";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c0_sda_z7_pins: i2c0-sda-z7 {
+						mux {
+							groups = "i2c0_sda_z7";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c0_sda_z8_pins: i2c0-sda-z8 {
+						mux {
+							groups = "i2c0_sda_z8";
+							function = "i2c0";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sda_x_pins: i2c1-sda-x {
+						mux {
+							groups = "i2c1_sda_x";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sck_x_pins: i2c1-sck-x {
+						mux {
+							groups = "i2c1_sck_x";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sda_h2_pins: i2c1-sda-h2 {
+						mux {
+							groups = "i2c1_sda_h2";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sck_h3_pins: i2c1-sck-h3 {
+						mux {
+							groups = "i2c1_sck_h3";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sda_h6_pins: i2c1-sda-h6 {
+						mux {
+							groups = "i2c1_sda_h6";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c1_sck_h7_pins: i2c1-sck-h7 {
+						mux {
+							groups = "i2c1_sck_h7";
+							function = "i2c1";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c2_sda_x_pins: i2c2-sda-x {
+						mux {
+							groups = "i2c2_sda_x";
+							function = "i2c2";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c2_sck_x_pins: i2c2-sck-x {
+						mux {
+							groups = "i2c2_sck_x";
+							function = "i2c2";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c2_sda_z_pins: i2c2-sda-z {
+						mux {
+							groups = "i2c2_sda_z";
+							function = "i2c2";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c2_sck_z_pins: i2c2-sck-z {
+						mux {
+							groups = "i2c2_sck_z";
+							function = "i2c2";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c3_sda_h_pins: i2c3-sda-h {
+						mux {
+							groups = "i2c3_sda_h";
+							function = "i2c3";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c3_sck_h_pins: i2c3-sck-h {
+						mux {
+							groups = "i2c3_sck_h";
+							function = "i2c3";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c3_sda_a_pins: i2c3-sda-a {
+						mux {
+							groups = "i2c3_sda_a";
+							function = "i2c3";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c3_sck_a_pins: i2c3-sck-a {
+						mux {
+							groups = "i2c3_sck_a";
+							function = "i2c3";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
 					pwm_a_pins: pwm-a {
 						mux {
 							groups = "pwm_a";
@@ -589,6 +771,42 @@
 						gpio-ranges = <&ao_pinctrl 0 0 15>;
 					};
 
+					i2c_ao_sck_pins: i2c_ao_sck_pins {
+						mux {
+							groups = "i2c_ao_sck";
+							function = "i2c_ao";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c_ao_sda_pins: i2c_ao_sda {
+						mux {
+							groups = "i2c_ao_sda";
+							function = "i2c_ao";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c_ao_sck_e_pins: i2c_ao_sck_e {
+						mux {
+							groups = "i2c_ao_sck_e";
+							function = "i2c_ao";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
+					i2c_ao_sda_e_pins: i2c_ao_sda_e {
+						mux {
+							groups = "i2c_ao_sda_e";
+							function = "i2c_ao";
+							bias-disable;
+							drive-strength-microamp = <3000>;
+						};
+					};
+
 					uart_ao_a_pins: uart-a-ao {
 						mux {
 							groups = "uart_ao_a_tx",
@@ -723,6 +941,16 @@
 				status = "disabled";
 			};
 
+			i2c_AO: i2c@5000 {
+				compatible = "amlogic,meson-axg-i2c";
+				status = "disabled";
+				reg = <0x0 0x05000 0x0 0x20>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_I2C>;
+			};
+
 			pwm_AO_ab: pwm@7000 {
 				compatible = "amlogic,meson-g12a-ao-pwm-ab";
 				reg = <0x0 0x7000 0x0 0x20>;
@@ -826,6 +1054,46 @@
 				status = "disabled";
 			};
 
+			i2c3: i2c@1c000 {
+				compatible = "amlogic,meson-axg-i2c";
+				status = "disabled";
+				reg = <0x0 0x1c000 0x0 0x20>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_I2C>;
+			};
+
+			i2c2: i2c@1d000 {
+				compatible = "amlogic,meson-axg-i2c";
+				status = "disabled";
+				reg = <0x0 0x1d000 0x0 0x20>;
+				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_I2C>;
+			};
+
+			i2c1: i2c@1e000 {
+				compatible = "amlogic,meson-axg-i2c";
+				status = "disabled";
+				reg = <0x0 0x1e000 0x0 0x20>;
+				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_I2C>;
+			};
+
+			i2c0: i2c@1f000 {
+				compatible = "amlogic,meson-axg-i2c";
+				status = "disabled";
+				reg = <0x0 0x1f000 0x0 0x20>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc CLKID_I2C>;
+			};
+
 			clk_msr: clock-measure@18000 {
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
