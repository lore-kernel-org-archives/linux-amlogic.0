Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA620C25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJAXSAoifdg7u52gnqZFNNMkkOSLvH898oqqbZdMrBA=; b=LuDYq1l/H626Kl
	Bbz0tehxkhGcsbzMOE49EOsxRY1ITYWUghddv9qB1tBF9beZJ2S7mQmE9ooXwk54z2w/vbxm46jql
	1PeX7ijojfxbpuUM7ZDvmmP6XW0HeBXXLWmlQb7isYy42gD6/2yCwuZ/B8QPfeSITzqu1mHmN/TJj
	5ngh5Ac9GddHn0ulLA7Imry7UTbk6Wpi6q85SZUE+7RgFec4uD9ffVFwI7m6CTvZeSJDTn2l2/UpN
	G082uLvfIhD2w+xVnzPhnEJ+6tFB9xcAKgH9aff2wWejisk6TpXBivzU+9spIuDii3ot2McyVFDTD
	FPIAhHv89N6fTn0lDJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K52-00000002fPC-0KD1;
	Wed, 15 May 2024 19:14:24 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7K4t-00000002fLZ-14Xt;
	Wed, 15 May 2024 19:14:17 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C59C710002F;
	Wed, 15 May 2024 22:14:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C59C710002F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715800453;
	bh=Qg4pXQQl5Lta582hsxBt1jkX2lzQKNXAMhqzfSLdzUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mi2ZikeUjgQUCsFbc5niTeo1F3w8peifiOyzC2luRNDcUzO+qKAMgELfaogBvFLGZ
	 //Z+ntr69Mi1dIie1tVpYeLtDuTTtPfqh0+wDDA3IjY9rDT1OtMgNtPdwMBaQqLy2R
	 dPtzK0SMdZO8cdZb5cTpEhTvAnW4UtHeiedpLh6qEVwlpftPwHNpDsWeKqbZVOY066
	 5TJfM7YSyjq2dhfnWe1wKXfkmyASFtCmxvrQKRePMekya3ZfP6PocE3N7MKYdyprpl
	 AZR04HhoHCYmFigFhBrgexgfDB9SJVFaQo70YhHC1OySGGgp+6pMdATV7wbkOBmn+a
	 UWD5v3+2gw4BA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 15 May 2024 22:14:13 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 15 May 2024 22:14:13 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v3 2/4] arm64: dts: amlogic: a1: declare cpu clock controller
Date: Wed, 15 May 2024 22:13:51 +0300
Message-ID: <20240515191405.25395-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515191405.25395-1-ddrokosov@salutedevices.com>
References: <20240515191405.25395-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185260 [May 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/15 13:12:00 #25231738
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_121415_777277_0912608E 
X-CRM114-Status: GOOD (  11.10  )
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

The Amlogic A1 SoC family relies on the CPU clock controller to generate
CPU clocks, serving a crucial function. It has 4 inputs: main
oscillator, fixed clocks and system pll.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index feed2bd7ae48..afb5d7361177 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/amlogic,a1-cpu-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
@@ -94,6 +95,19 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		clkc_cpu: clock-controller@fd000000 {
+			compatible = "amlogic,a1-cpu-clkc";
+			reg = <0 0xfd000080 0 0x8>;
+			#clock-cells = <1>;
+
+			clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+				 <&clkc_pll CLKID_FCLK_DIV3>,
+				 <&clkc_pll CLKID_SYS_PLL>,
+				 <&xtal>;
+			clock-names = "fclk_div2", "fclk_div3",
+				      "sys_pll", "xtal";
+		};
+
 		spifc: spi@fd000400 {
 			compatible = "amlogic,a1-spifc";
 			reg = <0x0 0xfd000400 0x0 0x290>;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
