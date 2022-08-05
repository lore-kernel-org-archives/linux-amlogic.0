Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9079BC00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgPPpzuM6s7XN09IyC++sOsy6qfmj8WmRpkSap/M3i0=; b=B5iXPtXS7TdHRr
	OYLbj0XI/QhyejUkzdx3qgPk4iRvlwn5GGUbllJkB0tHLJ6fPq1bhfpScxqu2vB2uhgIEpxpUbC/w
	vT6qoFGmI68rNPoVcYG8hPx6PbFrqqEO2fpdlJ9XFFCqrgcky8MCRR491ifgbfnsBPC8/oXYwIs1p
	0ONZHUxCld8jKPGDFE6U5+uN1hgtNwA2xOr3dCv8MIAbrpuhj3yGw9bbOVI0hpyXDYF6TCYKKj7Qo
	TLHgTXrJ/ajQNM3IfpF3bjDUoaSBgUP2gSZvofGiaP7ZDQmMHE2+tn6r/3JR4FYcD9moRb/IkaYeF
	OHeCB++LHk0ifcHbFj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtBA-00DMjo-OP; Fri, 05 Aug 2022 08:59:36 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtAf-00DMNr-2Y; Fri, 05 Aug 2022 08:59:06 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Fri, 5 Aug 2022
 16:59:02 +0800
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
Subject: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock controller in DT
Date: Fri, 5 Aug 2022 16:57:12 +0800
Message-ID: <20220805085716.5635-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220805085716.5635-1-yu.tu@amlogic.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_015905_184270_1371FFA1 
X-CRM114-Status: UNSURE (   6.71  )
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

Added information about the S4 SOC PLL Clock controller in DT.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ff213618a598..a816b1f7694b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -92,6 +92,14 @@ apb4: apb4@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_pll: pll-clock-controller@8000 {
+				compatible = "amlogic,s4-pll-clkc";
+				reg = <0x0 0x8000 0x0 0x348>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				#clock-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,meson-s4-periphs-pinctrl";
 				#address-cells = <2>;
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
