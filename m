Return-Path: <SRS0=Uhi5=E6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5ACC64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2020 12:18:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5D12076E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2020 12:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rVazSRDR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYglDP4G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5D12076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wi6kKRCPuQCEmjBpdgqrhYAGsz+YacS4ocPLlWabijk=; b=rVazSRDR5969dVDvphlgbFW3QO
	5PAMfiFOagZ8MYOJizirI5FBYxj3mFuSzghQml3HOYqKJ6jfkHL/KDPlRMe2wSM/xR2RWw8RGYcLj
	1t+Rv9V8gHr0gu1g4XXMRdIYmTR+mESPjHSqI4s3bzlrAIsPbO/h3K3FS9X8g4lkmocz6HfCltLdo
	Hjiq5GnUTUYi6JvXiBGkll+v5hsxPeyCCi2MdqVJpOdQYKnCuqEqU2sq4X/oL65jq73DsjF5bDsE2
	+SUj1qm+vuTHJgSCM0x8wOBSiPYrYP3+ZvMWXaABvFEK1MW/TAi03d7dLthtZ0q6gt4BLAUjW5yic
	E330vfIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khXGf-0000Tx-3J; Tue, 24 Nov 2020 12:17:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khXGV-0000Qc-NA; Tue, 24 Nov 2020 12:17:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id e7so4565862wrv.6;
 Tue, 24 Nov 2020 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2ze0FxjajqB9xsntXc3VBzUcaN4KJqWiZjSyHlQppPA=;
 b=LYglDP4Go4I1gx4f0SE8o1rFgXGJwISGeVThoyl+0T6t9Z0sFC2RUXzqeE6hKI7NdU
 AgQ/W13W8623wHeZLEWm9n9x5y7jv0/UAZHDIRJBzxarzpdd7SDVm2V/uONDHCO3sWT6
 nlzEflhPch9A5r4eJ2OU5DqWrILBW1SrVetNTV5KF9if2XQaR7/nHfuuhat0JK0EJo4o
 Mi77k5Asb/t9VrA2Ks4D+y4iTIM0R5pbuxXL81Le/ITrHrE7zovhb3U5G4/xUIOuRj1s
 gUPvVO97FYPiSR1rLJ48YA5UKz+1FFykF0CeLpuowMBO2D4Rnv6MAPgP6hcB9fPNn2Ud
 KDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2ze0FxjajqB9xsntXc3VBzUcaN4KJqWiZjSyHlQppPA=;
 b=g6f2GmcL7puso0gSGHz+XzcLBpjKmQ4Qlh85ysyMqgpVJZDp6vvrFvNqUDF/OS4SRP
 cdUmXMIv1voQfODw9NwyFOc03SjzhU4meMSIycTgL0/kWSHncYaKsrsbYbZDQRgcWe0E
 sNtxLIBs4yO9PQ0EpvfukaL2/bxoK/1U040qU34YDVEhD/KDrMUr7boD8h6qsHb319+w
 cS2N9e7Vn2m9B3Zwnkys5MYw2S0fDZMEznt3sOfVXGzzLI4qpOtarwxphvOr1k/YzXv/
 d9yQrN5D/Ho+01ENL0jWUtZdhxHT1zjmejv4FMEw7EXF9+ZiZDOAm79vxitw7G+PI/yh
 4Srg==
X-Gm-Message-State: AOAM532udQw3LNGGDmSO/JPwZ5Ku3WHo4ff+99hQiAjoVPZ89IZtmKm3
 I8/vwjJ3Tg17NRo7wR/AYYA=
X-Google-Smtp-Source: ABdhPJyT5ODyn5nQtch+qDirLFfOJdv9xEUlNm14hIaS36eTvBVPVunz3OQgV58Kag+47+gNcgPoXQ==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr5072246wrn.114.1606220265112; 
 Tue, 24 Nov 2020 04:17:45 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id p21sm5141572wma.41.2020.11.24.04.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 04:17:44 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: Add capacity-dmips-mhz attributes to GXM
Date: Tue, 24 Nov 2020 12:17:40 +0000
Message-Id: <20201124121740.25704-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_071747_850447_37A1D00F 
X-CRM114-Status: GOOD (  13.19  )
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

GXM (S912) is a big-little design with CPUs 0-3 clocked at 1.5GHz
and CPUs 4-7 at 1.0GHz. Adding capacity-dmips-mhz attributes allows
the scheduler to factor the different clock speeds into capacity
calculations and prefer the higher-clocked cluster to improve
overall performance.

This was inspired by the similar change for G12B [0] boards. The
diference here is that all cores are A53's so the same dmips-mhz
value is used.

VIM2:~ # cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
1512000
1512000
1512000
1512000
1000000
1000000
1000000
1000000

before:

VIM2:~ # cat /sys/devices/system/cpu/cpu*/cpu_capacity
1024
1024
1024
1024
1024
1024
1024
1024

after:

VIM2:~ # cat /sys/devices/system/cpu/cpu*/cpu_capacity
1024
1024
1024
1024
677
677
677
677

The after value matches my table-napkin calculation:

(1000000 / 1512000 = 0.661) * 1024 = 677

[0] https://github.com/torvalds/linux/commit/6eeaf4d2452ec8b1ece58776812140734fc2e088

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index fe4145112295..411cc312fc62 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -42,11 +42,28 @@
 			};
 		};
 
+		cpu0: cpu@0 {
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu1: cpu@1 {
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu2: cpu@2 {
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu3: cpu@3 {
+			capacity-dmips-mhz = <1024>;
+		};
+
 		cpu4: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -57,6 +74,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -67,6 +85,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
@@ -77,6 +96,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 1>;
 			#cooling-cells = <2>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
