Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4718C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA12720673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgA3j+iu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VdSslLtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA12720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/Nnyw1n53NC3Q779/gfHZjt1o2WHmakpp4mctUmluU=; b=mgA3j+iuq1eLHL
	UlGD33B+kCMQkkeqzSqOhi0gTkDxUcgjf7ZLfpvOkG10LK/3cNG1zuadHIt43bMApLtU2GOlcF3z+
	j3vOMH5ekbw2vlV1FX/hF///9ZvgV8Elcfb8cN4v95olMDK0neXtDGoz3R9TlWJRmPWgxKRkITEeg
	7C0ll2HzYHTClyUnqdzqw/SgcsZnQ7AzWUzT5UQPEnIL5EFM+4sxMnHIiAe6ED6e5efX1VjqQxOUn
	IxPRDr8HLdk8UfmZ1IU96pLdemdYwUZELCENOH4gzvMIbNyYLS9Lk/Jrb3LKVZ8AwKcI48aFxyOKr
	QxD3kGCDL3sDJmMhSGiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdye0-0000is-9S; Thu, 20 Jun 2019 15:06:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyYI-0003L3-4g
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id r16so3351612wrl.11
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
 b=VdSslLtIXp8jR0pmF12UjHiRAZxnZj61IXQmVJgReoJLPHEfMYQY6/e2NGkRzRFu8D
 us6kk3w+O5Imf29ygHn0TnHf61CISxKiE7hCnSRJMcYTA8VPFszQYzTSRW1na1aZQhO6
 +hTVcykF0PBuBlMzoCwEIZdMUUuXjc9UgHETxodcfV4oUi3rgg2GTHl7iS1ZazL2a++G
 pONuFmHIGIcHuL4GHYgFNKivOmsCsUNuedYxk2rzKekPImvLfygMg4aw5tEJADlFSJB4
 r8XU9CosbiXJT4pqWs4DjxGjTEZ5ld4TXDNxUoJseuYRaM70tnf6wAKYmghLabwgnK0A
 IvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
 b=tYcHmdCLEhBLjJukNqoW8TxStAGT9MrCq+Y7v161U3//sSuCt2evinnN/tLm8OzMkj
 /bj6kWNzW5Q2tXlNqx/VBBscOCruDs4NVsySJCMCQBuvitrKDu0IYGuMaHFFX7Ua6vKK
 QuEA+2MuTk2BXPRHSgdul7tAt8DfoeNGPcBtA4H/Qeat1fJeU6fHpvpX3viXehmmGXkm
 CmKQ0ZtxdwHkS3q/zr+Zo7yg8GGja5GNllXPLoN86ZdZpI/1upRHjOxlOhX0hEEqMg5d
 QiRitJ836st/vvKZltDwI5ltglrXwS2vdCLVFSASVkp71zrgi+50F8oYj7c2h7qW1QB/
 wTmA==
X-Gm-Message-State: APjAAAVuYJL9v4A1vX8pneYr6tbalUPpuUAogJfLsKGcDfZ6G3cYUKmy
 7Qf8QD0SFv5IsP0+xP8Gxo6QEg==
X-Google-Smtp-Source: APXvYqzFkcqp+IU136AcFO26klI3508FIczvmeG6WnfapKtGfZQW34ACEjuxr2v58Y3CPceRgYRm6w==
X-Received: by 2002:adf:f812:: with SMTP id s18mr27170003wrp.32.1561042836447; 
 Thu, 20 Jun 2019 08:00:36 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
Date: Thu, 20 Jun 2019 17:00:13 +0200
Message-Id: <20190620150013.13462-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080038_189760_242A827F 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable DVFS for the Odroid-N2 by setting the clock, OPP and supply
for each cores of each CPU clusters.

The first cluster uses the "VDDCPU_B" power supply, and the second
cluster uses the "VDDCPU_A" power supply.

Each power supply can achieve 0.73V to 1.01V using 2 distinct PWM
outputs clocked at 800KHz with an inverse duty-cycle.

DVFS has been tested by running the arm64 cpuburn at [1] and cycling
between all the possible cpufreq translations of each cluster and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index c3e0735e6d9f..0db1547bfb5a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -114,6 +114,44 @@
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_ab 0 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * Silergy SY8120B1ABC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	hub_5v: regulator-hub_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HUB_5V";
@@ -245,6 +283,48 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu100 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu101 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu102 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu103 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */	
@@ -308,6 +388,22 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ab {
+	pinctrl-0 = <&pwm_a_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
