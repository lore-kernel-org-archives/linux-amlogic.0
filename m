Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60E5FA374A
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2024 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xbycg85rgSLXzgH0iFvTDW4NQFYVChG3k3mrRSi5BRI=; b=iHX9QBY/cQGVaL
	EQUcE0IiiDZFrJgMOYt4/OmWyH/yWO/wNb26CFZxERkpGp7bPu/WpeYGxT+8q+la/hve0Jl4Xqgy2
	/0CgR+PWT4MPUzAkyiID4mGXSR3JufOUTZIoglHZDGt/R/GwdMzuISWrezkc1dqG/E04P/nMWkg+P
	Q34cK9/VvPCvrb+lnJwm5suJmBCXdNB8N0ReltstmwHRwnKHBUKkKlGTpFzc/rv0q8DILw00fBESe
	Uj0I+fwC+8ESlUcOERkRwU3oBhaFDujDHxyB181RVAL7T2d2Sav+/ZNznAp0mLP43ovZ6TUND7MJl
	pdzjjWdGlBgu/Viv4Vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5HV-0000000FsPb-0Rrl;
	Fri, 13 Sep 2024 12:20:09 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5Bf-0000000FqyJ-1R6e;
	Fri, 13 Sep 2024 12:14:10 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E0208120006;
	Fri, 13 Sep 2024 15:13:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E0208120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726229634;
	bh=e1P46PX2aQnH489x4gvHWHOmb6joxs+6jxfK9rLJ+Ao=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BtZXYPFW52K6fY2h03emEVIjUjheq2zhTMJD2Fu7VpAK0T3w5UFXlqjpWhms0P0Rc
	 0qFWEGO4temfj+DVouUhJJnviijLhCauHNPMRWgFvP8SA9Yt6/S5nvWOTkiSokgwHj
	 WPfWemoxa7GlWt819iA6Dd+vHhFQwk08esnE6eXYTuW93bXBYraW/NLTP2z4RXYqTa
	 6VeG4kSg3ELqHB1KG6G7iXk+8Cj00DGFYCTTcF5qzUWsgbhWuDz6iIDCPjDReRTkgN
	 HndOLHGrLPMkypjyxxQNVB4YVIGGSX8N0CbtR8t5DfX2GQh7TyUww5kLvcsyfql4+m
	 LKSthj61C0CKQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Sep 2024 15:13:54 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v4 5/5] arm64: dts: meson: a1: add the audio clock controller
Date: Fri, 13 Sep 2024 15:11:52 +0300
Message-ID: <20240913121152.817575-6-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.129.52]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187732 [Sep 13 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34 8a1fac695d5606478feba790382a59668a4f0039, {Tracking_smtp_not_equal_from}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/13 10:05:00 #26575345
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_051407_976208_2FE350CB 
X-CRM114-Status: GOOD (  11.02  )
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

Add the bus and audio clock controllers' device tree nodes.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index e5366d4239b1..b22cd5330606 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+#include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
 #include <dt-bindings/gpio/meson-a1-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -448,6 +449,53 @@ sd_emmc: mmc@10000 {
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
 			};
+
+			audio: bus@50000 {
+				compatible = "simple-bus";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x50000 0 0x4980>;
+				power-domains = <&pwrc PWRC_AUDIO_ID>;
+
+				clkc_audio: clock-controller@0 {
+					compatible = "amlogic,a1-audio-clkc";
+					reg = <0x0 0x0 0x0 0xb0>;
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
+						 <&clkc_periphs CLKID_DDS_IN>,
+						 <&clkc_pll CLKID_FCLK_DIV2>,
+						 <&clkc_pll CLKID_FCLK_DIV3>,
+						 <&clkc_pll CLKID_HIFI_PLL>,
+						 <&xtal>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4";
+					resets = <&reset RESET_AUDIO>;
+				};
+
+				clkc_audio_vad: clock-controller@4800 {
+					compatible = "amlogic,a1-audio-vad-clkc";
+					reg = <0x0 0x4800 0x0 0x20>;
+					#clock-cells = <1>;
+					clocks = <&clkc_periphs CLKID_AUDIO>,
+						 <&clkc_periphs CLKID_DDS_IN>,
+						 <&clkc_pll CLKID_FCLK_DIV2>,
+						 <&clkc_pll CLKID_FCLK_DIV3>,
+						 <&clkc_pll CLKID_HIFI_PLL>,
+						 <&xtal>;
+					clock-names = "pclk",
+						      "mst_in0",
+						      "mst_in1",
+						      "mst_in2",
+						      "mst_in3",
+						      "mst_in4";
+					resets = <&reset RESET_AUDIO_VAD>;
+				};
+			};
 		};
 
 		usb: usb@fe004400 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
