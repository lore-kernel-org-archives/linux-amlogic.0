Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F04C25B7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04hoJgKPGGw9D0g0w4JNCSkY+xy7L9RMFBTjExYaWuc=; b=mpZbboApJmvMv/
	QzabzgDSfft9a8wXd3cZwAgf2bAGlC3klXa99GMojEpiZccFMnkMVb7lfaqtvyUHJybqSm2Gq4R5d
	ILHqCk2hpBGk5gjjzUouW6EtBWV67FVg/Mx5L8j6DdJ/GOkXIGGm4cp3DgHcRRR3y6DhPWz4BGWJ5
	OMOflKEpafaktx1HrvMbWUN2+O9AQcE62twqVGemI02Ds3K7J4/1qoylwMsWt3a0eKg9mEsVdrB4v
	yUF7MiqMq/Rj6ZxMOpzpbRJ+nefkJbEC55P29YOAl1VCSdIDL+F9/6k4QarjsGJFXwLynF9i9AxkP
	dRjFZ3Vncdx3xDUCZh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xt9-00000001FAB-0tAM;
	Tue, 21 May 2024 22:23:19 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xt4-00000001F4I-2yGG;
	Tue, 21 May 2024 22:23:16 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A01EC120013;
	Wed, 22 May 2024 01:23:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A01EC120013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716330184;
	bh=Y5KLTru70ihF59JB6SdRG0BlaBrGNjPfEalirF6qzHI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=jMz2d8CbRa4ExoilijE8iYZK44sfA7CHUu6dGsHZKIY1Pt7nYA3ICinNLPtxh2tzl
	 3rJTL/js632kKou6QQJnUXryCTCoxKJiWzCanIpI6KlwaWt9FMLCKzEAPu0s2K8mlo
	 qYUukLxlXKh+5vyfX31+XpcDEzDold0AQCUR/SekeOu247Em+YaNhY3bfMJtd8d+uA
	 vfgbH+pm5MmmGN8wjxFZjjSBNWMuPbj6PLt34ewHYEKQ7UgLa42vogXGrVxfghXhmF
	 CJaDtg/yRqaeAJX87nRq+beiUfXoxvqiMhaVLYzMpfVbO9y3dd7sswojkQ8YKp1uyC
	 oXijpUrF0X9ZA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 May 2024 01:23:04 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 May 2024 01:23:04 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Lucas Tanure <tanure@linux.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH 3/3] arch/arm64: dts: ac200: introduce initial support of the board
Date: Wed, 22 May 2024 01:21:55 +0300
Message-ID: <20240521222155.28094-4-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
References: <20240521222155.28094-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185400 [May 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/21 08:41:00 #25230763
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_152315_282382_ADB5558D 
X-CRM114-Status: GOOD (  14.28  )
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

AC200 is Amlogic's reference board based on S905D3 SoC. The board has
support for USB, Ethernet, HDMI, WiFi, eMMC, micro SD, AV output, analog
audio.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../boot/dts/amlogic/meson-sm1-ac200.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
new file mode 100644
index 000000000000..68209a790460
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac200.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-sm1-ac2xx.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+
+/ {
+	compatible = "amlogic,ac200", "amlogic,sm1";
+	model = "Amlogic AC200";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>; /* 2GB */
+	};
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
