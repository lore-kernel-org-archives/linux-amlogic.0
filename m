Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2380AC48BD6
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:13:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2452054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GmHBN2jb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J0NS7bRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2452054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/Nnyw1n53NC3Q779/gfHZjt1o2WHmakpp4mctUmluU=; b=GmHBN2jb7ggBV1
	r6jBiJwcCKjKPb4o+mzanp7GMMQQaX7UHGM59vsufgRNTKeWuHODRve7RQwCToVaoP4HAJi5mNhQd
	JK61V7663S9EgaKz5pfKDcjGE68xFBc7KruP7UwELefvmEgAc08ojHdHPL9PRwougsTwzjCbUpn9k
	JaCze21RnSTNnen/zyU7hxUWLH5ojw9ue1hrpjcpa+Pf/9tZZXKgBNnu8JTN3B1GKeC61ZiqKKl88
	gAaagmmmucFa/c84RzbNJr4qUhQwEGVksO+6ZTTLFP+KRC3S6Y7LG3iESS2odK0Aw8hoCXQ2vIPE8
	/GkIJngNzXH8mDJrzusQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3zR-0000UE-8o; Wed, 26 Jun 2019 09:13:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3tF-0002js-C6
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id v19so1241166wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
 b=J0NS7bRqNS0ZD9B+lSRFe4le6yXmNDFrR2upnXhCDY5C4V5LEnqtg1cGQuQwS/EfnD
 JfBSP+JFXSv+TxAihAgDuOJ02RCAacyf9xthx/r/0gVK7VHp1Q04mqoWqz115l6wz4Tg
 5GGeO1VgatZQvjZPxf+PVdabu+FbJrVvSUBdqNy9zrDeawHHyO/pVOI5wRdj/WLlb52Z
 vGA4sx71G+qwn4y8vzoNOair6gePijN4Ipj26Q7+3GBKbpugvF352+RtX/+yEKIix+aR
 njX6Hbjb2DLxusCypboZqfZLYqU3j5VNpolmTezfmqzgcp1IoFoBjpPc8cvBUIS9n3Cz
 sUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
 b=rQxH6PmzrCTmGOMpMbsGh7x1eAOjEfHpnikSEG22r9EMYX9NTi6XUqyimyRBTUEJmB
 m9zVolqWZm/ixH5pqgLpYTg6Ws4twng5pfCDYxlIGeoyUSbemVejI9PWarz4cm3/sua+
 LRqcIvjYBzeE+ws+tHAFUOWNJtPt0l0jrqCX5lT3Kqlrs1O0Ms6A0EaOubfsQ4+NVn8v
 y3GqaXfvUUghIeJlHGiPudv0B9dzGgbKbjc46t06z4q7SxDAbEB/f9ifx6BE19+o/7Qg
 Of9sotaToZJVWZl8XlYF0myw9IPH81XHjYHpnIzhn2BpnOFWXTeuOTtYGE+zTrlSurA5
 d5Pg==
X-Gm-Message-State: APjAAAVn0nroy9JEIzQ2kgEgsSVbmbrFcxtkTdi/rDM/r5iRWUpWNN9j
 4jC56A0Fqmn61SgmTiP8gM0klg==
X-Google-Smtp-Source: APXvYqwxDozI/FKA1vAkTzJa0CO5JhJdf4H6DJgUxSxrWePq7VprAaD6psUV7Ud7fw3drOIzxbfu8g==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr1887295wme.12.1561540011512; 
 Wed, 26 Jun 2019 02:06:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 02:06:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v2 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
Date: Wed, 26 Jun 2019 11:06:32 +0200
Message-Id: <20190626090632.7540-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020655_055064_342636D0 
X-CRM114-Status: GOOD (  11.33  )
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
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
