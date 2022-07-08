Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1727C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Jul 2022 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/B3GKpDmpFC75d5U3yz+ZGtgamN5f0h68q5WfZ6ThE=; b=keI6+/f4xp+8f+
	um+txJtl4yFqlbyqbIuWBIOJyHQ33QVOPe68/zC/cxGMosjitdDFdFr5VFsygjmDd44EcRg6amyBm
	c9k3NPqMn0u7glT6PWModk0lRV5uubp5kJySKdxM/UD1d0KK1Xp4DJ04n9U9wSeXnUw5UCI+HuyOk
	tnuIjeJudOCS4FQdwBgP6VfniNl8Ev2oUWyCaZB6M/JWdwmQdQnPmPTbj4WX6Ip977Zqy1snPDeQD
	kQFRl648Z1inYUot9mf9y6UeJcN4bDYqFIw33icmTpL5sG0qTFw3VU2uGMwPfx+1cZ0wdPt0g9PnA
	uWS8y0mCcYanxMu+lmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hUq-00220S-In; Fri, 08 Jul 2022 06:29:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hUg-0021ut-G4; Fri, 08 Jul 2022 06:29:39 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 8 Jul 2022
 14:29:33 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 2/3] arm64: dts: meson: add S4 Soc clock controller in DT
Date: Fri, 8 Jul 2022 14:27:56 +0800
Message-ID: <20220708062757.3662-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220708062757.3662-1-yu.tu@amlogic.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_232938_840393_DD56AFF4 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

Added information about the S4 SOC Clock controller in DT.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ff213618a598..ad2ec26a1f4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -86,7 +86,7 @@ gic: interrupt-controller@fff01000 {
 		};
 
 		apb4: apb4@fe000000 {
-			compatible = "simple-bus";
+			compatible = "simple-bus", "syscon";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -118,6 +118,13 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			clkc: clock-controller {
+				compatible = "amlogic,s4-clkc";
+				#clock-cells = <1>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+			};
+
 			uart_B: serial@7a000 {
 				compatible = "amlogic,meson-s4-uart",
 					     "amlogic,meson-ao-uart";
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
