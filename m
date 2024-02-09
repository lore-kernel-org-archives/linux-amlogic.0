Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22914C48297
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Feb 2024 21:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogKtmIrZBl3m6gb6vL7n0Upeh6wHoDqnPfxKgW3lvh4=; b=HokpUnRgacD8xM
	Ont/8zEy1uRaJojz2NeW5jIjmdu/2RSCs0xnTf/NJU0ugrpbO909hI2IiX1y2go40ugfDI5k4zT0d
	xrnICmStjn6JYxK5FhKnoOiSuzNSg2cRoOyo1d5XaiBEf1yzCcTAKdYXx/ze4ip/tkWDtihlO00Jy
	37d/kAETPh/hHoKKOfuAnl7bsF2RfDe8Z3VaDhC4OCP8pt8uaK/eUDWYWZAWkjK3zC5f/1drQSLt7
	8PIniNZAxHCwW3HFLMlUROZsjTWALkBrqBnn1rCWpPitdHcOPFIxviOxmP74DSgn3Z1Yak2O4T6Io
	Kv4F+JFAVN9Ze6026Yhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYYQF-00000000e6t-3eBx;
	Fri, 09 Feb 2024 21:28:35 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYYQB-00000000e5a-2wjj;
	Fri, 09 Feb 2024 21:28:33 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B5415100003;
	Sat, 10 Feb 2024 00:28:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B5415100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707514105;
	bh=Eg+ityGP9rRaB35HLWZFr9cbeY7LycCsMeGBmIKbnDQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=KU20LfmD28/1tOTu66gfksmeNT/jBygd6gypPcL8DKj0jDOgA/Nu0io84j7cxnAI4
	 UrNzk1jDMa1SG0crSUHfhnJGzM0kIpXg5m8XZHQglKdUfn/RahbLd8FWo6o61LBfQr
	 okA88sPPeDnBi7nfIljeph+9se7Qom9BwxWljsKnSfIpt+LnhOFXz0yvPv3+9aYrMu
	 iY5QEhya4lEo5kfOi3GyeEQKeRmye63MhwoJyeKtyLFqjiyL6hiIDapXPEu1GlMvZM
	 nsDbbbHMOeB0QaeJBAL9Srcs3d8AQkamGNjYkpqQfcE67BswWmwJm+vbaZI8bJdzbd
	 b/QF6ZkZYPXWA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 10 Feb 2024 00:28:25 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 10 Feb 2024 00:28:25 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <adeep@lexina.in>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 1/2] arm64: dts: amlogic: axg: move cpu cooling-cells to common dtsi
Date: Sat, 10 Feb 2024 00:28:05 +0300
Message-ID: <20240209212816.11187-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209212816.11187-1-ddrokosov@salutedevices.com>
References: <20240209212816.11187-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183341 [Feb 09 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/09 20:35:00 #23447606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_132832_287824_4F52642D 
X-CRM114-Status: GOOD (  11.24  )
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

The CPU cooling-cells property should be located in the meson-axg common
dtsi, as it is required for all AXG-based boards with DVFS.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../amlogic/meson-axg-jethome-jethub-j1xx.dtsi   | 16 ----------------
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi       |  4 ++++
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index db605f3a22b4..55802fb03a46 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -332,19 +332,3 @@ &gpio {
 		"", "", "", "", "", // 80 - 84
 		"", ""; // 85-86
 };
-
-&cpu0 {
-	#cooling-cells = <2>;
-};
-
-&cpu1 {
-	#cooling-cells = <2>;
-};
-
-&cpu2 {
-	#cooling-cells = <2>;
-};
-
-&cpu3 {
-	#cooling-cells = <2>;
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 7e5ac9db93f8..ea96fef328e8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -74,6 +74,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -83,6 +84,7 @@ cpu1: cpu@1 {
 			enable-method = "psci";
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -92,6 +94,7 @@ cpu2: cpu@2 {
 			enable-method = "psci";
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,6 +104,7 @@ cpu3: cpu@3 {
 			enable-method = "psci";
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache0 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
