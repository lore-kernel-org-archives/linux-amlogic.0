Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69289D26D99
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ez/N9vnIumVtjZDKO2ypPmMVt8v3+5/1e4f7awwCLiI=; b=qzlSDVeQwkXfW1
	EVR7ld5r39bWVlztaGCHZpL5RuCDrrgg3P22kkrNssE06+F9Olfs1l2Spa8gE7dRHw0G84MCNtAM2
	6gjy06kSWAWJb3WXBLkh4sfJWzH8/bOZlql+mSTve4RQI2LggT4ecE+fjTiiSqzRIxqNnZaehC/5P
	fEwaRsGMQebimG/nJXqa9ayZpbn5Uc5CoC37c4hhuNukgORrfwPfpv0RWP0Jf5VOiOtTBJN16XFdI
	IjEg6A3iGXw6zdgXMjT4ep2UEcJa8nn9UREXVPnVGxL3lOultTRSGXfQjB+3zJf1kSyqy/V0Vi9L7
	9ywxc6v+ZB+gZIUiIn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJcw-000000031WN-40Mr;
	Fri, 09 Jan 2026 21:02:34 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJct-000000031Va-3GSd
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 21:02:33 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b72b495aa81so891704566b.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767992549; x=1768597349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fV2e32+Ij+WSa21EamLUbL8uiXqtCH1kWHqaBcm+AnE=;
        b=K3XObRWigGeG5R5NlytVqXXNFl6HMm8gzOQbzKkEQQnFiNW1T++MlAPUlII1R7rMQ2
         e48k1Z0UGcBt2rqLPCGpHiCcWu9ZEpMKgzdBJ5o+Obk8NgVJwIEn7kUeRs0MSeYvplbr
         MF6KPN5C52lHn8YjvB3rL0Sqw2Eoz461eQ7bqM7+KH32HOFNTt0KtW6AsbA8AOFdVZ3C
         RFwus02GudZctSc46yO2cM1Qfn1GhJmib+skimZuY88UUrKjAPox10SDmtu0xagl1bVy
         xESCQpJC82ZxZF0XdCOyoXBweZPVGbbY0IH3IKM1OcvRbL1I0tTgnp11boDnN79u5Diq
         RyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992549; x=1768597349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV2e32+Ij+WSa21EamLUbL8uiXqtCH1kWHqaBcm+AnE=;
        b=iIGMfNFXJf5H6f7kLqzd1LQwHdvkG/C+PD7YQVgVzZds2YXExFd9xPwgeEptNshVuY
         9CEdqWKq0IZuoOAKPF9VmGHOvR+HkJHmJ6XAKrbHBknWdzlUF8NxYNFiVRSvbi9Yrxfs
         TAc2liRFhgcf9uwMCH9yRnMB3ps7x6MoUX2yDI+Sh66IDaDo6pv4zMC72Z626xccKF5F
         KxLnfnnEcFQrQbHaeUBQiQuvpPtj6lfSlqzUGKhYWr0kiSfis3FseOxU2WNicpsJFnCA
         Yz9kDIx9DxuAhSlxeGcO2OCMiEQuAilHte91KLgkUpHJPkpdXNKbvbk2qRGasxg6wuQK
         cwTw==
X-Gm-Message-State: AOJu0YxKllahO6Ni2/Tqe6ksmj5CrxFZA+ToXOEIIB3uH4t2QlQb1cNl
	jwFkm3Wp/cD/l6ZjB8qWg7RqhXuRo6IK73d5XhKNnGnh9n/ScmZn+mGrWA5AUlEq
X-Gm-Gg: AY/fxX4MXrxFhBBVkriqEoxTnZgfXSUQ3jBissBa8CzTg+lVZv2pYbxNLngQ3fP8mFq
	Y3M2poqWrK+r+bP6oyOMbcsxxZRzPjrHvnydbgrezK5UTCstCa9Dr5iDT4U4KhDylVobB54Q6mf
	AAY9bMqWGeJLhVAQ0BcgxjWjqKH4Irf9MJAQOCvzLBx7uNtkId5cmW2R91TBUION1Rx/AK+PFPF
	mrt2fMnL0qo7OI1XVSGp/c6ap8QsNgpyt83NBPrymWwf99UUxtHftVDFpjF6fZmkUIWsk6Ia4FO
	4/akX8K8l2A5SedmwkG+tI0Uljgn2/JPBgoQFDlOnxpfTRFnck8BiFNw9C4FCwzYXIrXIdbv8uV
	A9insfYCFCca3604CD5+uHVmB9c9NGhjNrjW1xxf4iCRVQsFkyMSVauCXjGIiMaUlfhgbSS+VVI
	qplHnKxFLja29jOOgz+m/sDidVCsDuFPCfTdI+/n8cw+fYd+Zo9RHOFh7h67n+4utSscsxhZcA3
	0Pxvln7dBPsa6nw8sIa+ddd4gMSJSdZ0ZScR99WAc4=
X-Google-Smtp-Source: AGHT+IGRZySNRyM85Hacs42nYDTPpBQ3MX8sowJF4XP7WFryeun3vhdWyZgSoov4UeJOWt3GLTnYCQ==
X-Received: by 2002:a17:907:7f86:b0:b84:2b4b:ab12 with SMTP id a640c23a62f3a-b84453a1251mr1037515966b.40.1767992548990;
        Fri, 09 Jan 2026 13:02:28 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-afbb-db00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:afbb:db00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm1217894866b.43.2026.01.09.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 13:02:27 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi
Date: Fri,  9 Jan 2026 22:02:17 +0100
Message-ID: <20260109210217.828961-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_130231_985435_D96F3215 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Move the assignment of the CPU clocks and the CPU OPP table(s) from
board.dts to SoC.dtsi to reduce the code duplication.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- rebase on top of 6.19-rc1 (previously I had a temporary change as
  parent of this one (which resulted in v1 not applying)


[0] https://lore.kernel.org/linux-amlogic/890f1ce6-60d2-47d4-8552-940f3abd7c1e@linaro.org/T/#m25c47d91bbc194cc228ea3c4efc653edccadf7db


 .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  8 -------
 .../dts/amlogic/meson-g12a-radxa-zero.dts     |  8 -------
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  8 -------
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  8 -------
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  8 -------
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  8 +++++++
 .../amlogic/meson-g12b-a311d-libretech-cc.dts | 13 ----------
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 24 +++++++++++++++++++
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 12 ----------
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi | 12 ----------
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 12 ----------
 .../amlogic/meson-g12b-odroid-go-ultra.dts    | 12 ----------
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   | 12 ----------
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 12 ----------
 .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 24 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 12 ----------
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  7 ++++++
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  8 -------
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  8 -------
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  8 -------
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  8 -------
 .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  9 -------
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  8 -------
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  8 +++++++
 24 files changed, 71 insertions(+), 186 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
index d0a3b4b9229c..abf6b63ea0d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -265,26 +265,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index 4353485c6f26..a85f383a1699 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -218,26 +218,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index f39fcabc763f..5b6716aeaae5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -312,26 +312,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index b5bf8ecc91e6..dd9da7a5ec5f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -405,26 +405,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &clkc_audio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5ab460a3e637..015e3c7e3a91 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -261,26 +261,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 1321ad95923d..51317d11f263 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -25,6 +25,8 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu2: cpu@2 {
@@ -55,6 +59,8 @@ cpu2: cpu@2 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu3: cpu@3 {
@@ -70,6 +76,8 @@ cpu3: cpu@3 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		l2: l2-cache0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index 82546b738977..5747acf8f337 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/clock/g12a-clkc.h>
 #include "meson-g12b-a311d.dtsi"
 #include "meson-libretech-cottonwood.dtsi"
 
@@ -74,38 +73,26 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index 8ecb5bd125c1..f15baa708b36 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -109,3 +109,27 @@ opp-2208000000 {
                 };
 	};
 };
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu100 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu101 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu102 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu103 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 39011b645128..7a204d324dd4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -153,38 +153,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 1b08303c4282..4321d08d11a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -261,38 +261,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index fc737499f207..b16247e0df9f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -49,38 +49,26 @@ vddcpu_b: regulator-vddcpu-b {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &pwm_ab {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index d5938a4a6da3..c81d7fdbe2f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -279,38 +279,26 @@ &arb {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 /* RK817 only supports 12.5mV steps, round up the values */
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 3298d59833b6..88d995006f94 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -225,38 +225,26 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 1e5c6f984945..e95e193eaebc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -257,38 +257,26 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu_thermal {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
index 19cad93a6889..eef98add05c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
@@ -99,3 +99,27 @@ opp-1908000000 {
 		};
 	};
 };
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table_0>;
+};
+
+&cpu100 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu101 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu102 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
+
+&cpu103 {
+	operating-points-v2 = <&cpub_opp_table_1>;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 9b6d780eada7..4834f418bef5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -211,38 +211,26 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table_0>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu100 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu101 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu102 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cpu103 {
 	cpu-supply = <&vddcpu_a>;
-	operating-points-v2 = <&cpub_opp_table_1>;
-	clocks = <&clkc CLKID_CPUB_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 23358d94844c..18506d54d239 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -57,6 +57,7 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -73,6 +74,7 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu100: cpu@100 {
@@ -89,6 +91,7 @@ cpu100: cpu@100 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu101: cpu@101 {
@@ -105,6 +108,7 @@ cpu101: cpu@101 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu102: cpu@102 {
@@ -121,6 +125,7 @@ cpu102: cpu@102 {
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		cpu103: cpu@103 {
@@ -137,6 +142,8 @@ cpu103: cpu@103 {
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpub_opp_table_1>;
+			clocks = <&clkc CLKID_CPUB_CLK>;
 		};
 
 		l2_cache_l: l2-cache-cluster0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index 9be3084b090d..661e454ca673 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -145,26 +145,18 @@ &cecb_AO {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &cvbs_vdac_port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 5e07f0f9538e..f0e4b168a411 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -183,26 +183,18 @@ &arb {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index a3d9b66b6878..4e1e9a502666 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -49,26 +49,18 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &pwm_AO_cd {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index c4524eb4f099..ad886d446e96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -248,26 +248,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ext_mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
index 5daadfb170b4..2a16f54332df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
@@ -6,7 +6,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/clock/g12a-clkc.h>
 #include "meson-sm1.dtsi"
 #include "meson-libretech-cottonwood.dtsi"
 
@@ -62,24 +61,16 @@ sound {
 
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu_b>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 024d2eb8e6ee..e275b0f36b09 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -357,26 +357,18 @@ &clkc_audio {
 
 &cpu0 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU_CLK>;
 };
 
 &cpu1 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU1_CLK>;
 };
 
 &cpu2 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU2_CLK>;
 };
 
 &cpu3 {
 	cpu-supply = <&vddcpu>;
-	operating-points-v2 = <&cpu_opp_table>;
-	clocks = <&clkc CLKID_CPU3_CLK>;
 };
 
 &ethmac {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index e5db8ce94062..8f5b850b1774 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -63,6 +63,8 @@ cpu0: cpu@0 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU_CLK>;
 		};
 
 		cpu1: cpu@1 {
@@ -78,6 +80,8 @@ cpu1: cpu@1 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU1_CLK>;
 		};
 
 		cpu2: cpu@2 {
@@ -93,6 +97,8 @@ cpu2: cpu@2 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU2_CLK>;
 		};
 
 		cpu3: cpu@3 {
@@ -108,6 +114,8 @@ cpu3: cpu@3 {
 			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPU3_CLK>;
 		};
 
 		l2: l2-cache0 {
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
