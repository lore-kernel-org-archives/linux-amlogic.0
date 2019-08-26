Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C8C3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:28:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5EBF20874
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WkA9y3+W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZBhPb8S5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5EBF20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwmKmL0TNQOT9BTkoVdqeNf3+yXhe6adBBJVIwCuE7s=; b=WkA9y3+WvzJBtN
	nKQmXXJP+gVmYRWjlwXL+PQW9mFl6j/ENJDbaHlPlsnZLyGZ57NuFpKSU6MsFfJyF9gBqU3KMx9j2
	SpjmPee56fq8IU0q+3jNJuNTdaYNpRcoScr5ah6KVsPr20zT7Q+uPY9LEHQHJN0LL+RBxN8xKhfOd
	5lhcr9Iti53XkexiYVtvz5QyGPHXE5Xx+wd4FJ1Ja3gEmqhX0jFfWzwvXJeVDWrSW1z88155AXLDg
	x6nn2Qfy6B8bI4/bVO7rYkzhdoR9+nDxnfRedQh4N/pKM30DVZJ0MDFn9jv+DSbu7zCO8CxI+73pn
	TjSBqTsZ216FXriPIL5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29Q8-0002jD-Fu; Mon, 26 Aug 2019 07:28:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i29Nt-00010T-6D
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 07:25:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id f72so14408076wmf.5
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lJWN6yc2oSLIy8e/NpmjZbGiQp2MPG9LyZte54Al8Bo=;
 b=ZBhPb8S5icK5OaHjj8nREnrShAt9d65o0KQXZQWvX6hZlbOPv/tlza04LnSDzUxERS
 +ZVPzetbr8yBgmevfO9sCVkAMqSRwKz7Tz1lWO31xodPGgo4LtMJsMFiK1g4VcO4PBDl
 5q2l0u9Snj/B3SWYO+ZpCicgX/1btVO28UXhqtl+kDG/2KmbIyi7/cvh2bvtbNDTDVm0
 3cUnEI6A8eLPALn2SynOaVaBPSFqAU4+fZyrF64sH6yGm/uwFmSTWHrzPjsDccbU6H7d
 fzzj/p0xZb6pWcF9ZWbzKZV9E5ZarCQfhW/z7MTPCeOpH250VSw4xMmdiui1gLyVPQcV
 pNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lJWN6yc2oSLIy8e/NpmjZbGiQp2MPG9LyZte54Al8Bo=;
 b=s3zyLtorfh3B/Gj4BVsPrlmcicsBmvIdn861OTVtqi65DJNR6p19pt/k/BuoSkjo4c
 Kg8ZtTownZl7beyS5H7tM9q9UfXQ+ncDBju2OZC0N+j5xLfmuF7UNadi/Gg2bUV1b3K8
 UFYOsR+RgLitUv1Wh2WaQHm3AVCTql312prgTPa0wqKS0XzB+o68opmTtre/za6QgevO
 77x36nPJVemULfZLmUrDnF7QjW52jKn2dw9FCPpBU08Y3tzDMw/eCFXsjst3qNT3z44V
 rRUrdX1gP/3kGNEXUvIbJ785PC/anIUDj9Aw1rhqE7uk/K6pGux4tcKqfi5kinwPvN81
 wakw==
X-Gm-Message-State: APjAAAVZTA16ekyWK/5SIL9pfF4eQusdCTNkbuuRH3CffhP6s75RZaVm
 t5GdVPVl93nj/Lw+u55jthbENw==
X-Google-Smtp-Source: APXvYqzE5m3bhkRCPJOKD1nm7hBmgNoGuEItiKQi3bWA+fIhFikIWwEcPQPUTJi4ZmiFDHOc1fmwBA==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr18758168wml.134.1566804347402; 
 Mon, 26 Aug 2019 00:25:47 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm10821324wmg.45.2019.08.26.00.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 00:25:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH v2 5/5] arm64: dts: meson-sm1-sei610: enable DVFS
Date: Mon, 26 Aug 2019 09:25:39 +0200
Message-Id: <20190826072539.27725-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_002549_362597_574B70C0 
X-CRM114-Status: GOOD (  12.24  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This enables DVFS for the Amlogic SM1 based SEI610 board by:
- Adding the SM1 SoC OPPs taken from the vendor tree
- Selecting the SM1 Clock controller instead of the G12A one
- Adding the CPU rail regulator, PWM and OPPs for each CPU nodes.

Each power supply can achieve 0.69V to 1.05V using a single PWM
output clocked at 666KHz with an inverse duty-cycle.

DVFS has been tested by running the arm64 cpuburn at [1] and cycling
between all the possible cpufreq translations of the cpu cluster and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 59 ++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 69 +++++++++++++++++++
 2 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 36ac2e4b970d..69966e2e0611 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -19,10 +19,6 @@
 		ethernet0 = &ethmac;
 	};
 
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
@@ -136,6 +132,25 @@
 		regulator-always-on;
 	};
 
+	vddcpu: regulator-vddcpu {
+		/*
+		 * SY8120B1ABC DC/DC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <690000>;
+		regulator-max-microvolt = <1050000>;
+
+		vin-supply = <&dc_in>;
+
+		pwms = <&pwm_AO_cd 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddio_ao1v8: regulator-vddio_ao1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
@@ -182,6 +197,34 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU1_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU2_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU3_CLK>;
+	clock-latency = <50000>;
+};
+
 &ethmac {
 	status = "okay";
 	phy-handle = <&internal_ephy>;
@@ -220,6 +263,14 @@
 	clock-names = "clkin0";
 };
 
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 37064d7f66c1..2b61406b0610 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -50,6 +50,71 @@
 			compatible = "cache";
 		};
 	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <730000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <730000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <730000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <750000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <770000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <780000>;
+		};
+
+		opp-1404000000 {
+			opp-hz = /bits/ 64 <1404000000>;
+			opp-microvolt = <790000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <810000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <850000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <900000>;
+		};
+
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <950000>;
+		};
+	};
 };
 
 &cecb_AO {
@@ -60,6 +125,10 @@
 	compatible = "amlogic,meson-sm1-clk-measure";
 };
 
+&clkc {
+	compatible = "amlogic,sm1-clkc";
+};
+
 &ethmac {
 	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
