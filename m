Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4EECAAA1
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Sep 2022 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esacGTk18/7qhmyBISEjP5wRaEjeoSW1kneeq9Sm9W8=; b=nl+kf32cHNzpPZ
	4+yTVAi3ccelG0nUCAGguOtCsMii1GEK5a3h2KwsklmJZM85pQQv2FPL3QYVm7lT3vO+gcWWxzDYx
	NLksTAimFcM1q/MXryk7Yiz/mOCQymGxJhloPXx9fHlWS+lLkMJ5VcQPmFUL2+rtkv0TA/Ml0Iugg
	Wv+BhZUN6ydEXAq7eqs83mUmAWOdReR52bAN9E8I18/KeZClXOXJ9qWwgAsRP4maeAtxzv7FdCuld
	IEmWsIMnA2fUccn4IPkzlcS7DCSew0avQkzQiUBmWbM0HJyVxg7ORgv+FdrtpIVOTAYsxEqpO/uFs
	c5J8BlqO+CdlQ9zpAXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXHCo-00GaTl-HL; Sun, 11 Sep 2022 07:16:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXHCH-00Ga4F-Nm; Sun, 11 Sep 2022 07:16:07 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Sun, 11 Sep 2022
 15:15:47 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH v7 4/4] arm64: dts: meson: Add DDR PMU node
Date: Sun, 11 Sep 2022 15:15:19 +0800
Message-ID: <20220911071519.2881258-4-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220911071519.2881258-1-jiucheng.xu@amlogic.com>
References: <20220911071519.2881258-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_001605_891386_E2BD831D 
X-CRM114-Status: UNSURE (   8.59  )
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

Add DDR PMU device node for G12 series SoC

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes v6 -> v7:
  - No change

Changes v5 -> v6:
  - No change

Changes v4 -> v5:
  - Split reg into two items
  - Alphabet order location

Changes v3 -> v4:
  - No change

Changes v2 -> v3:
  - No change

Changes v1 -> v2:
  - Remove model, dmc_nr, chann_nr properties
  - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
    identifier
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..9dbd50820b1c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1705,6 +1705,12 @@ internal_ephy: ethernet_phy@8 {
 			};
 		};
 
+		pmu: pmu@ff638000 {
+			reg = <0x0 0xff638000 0x0 0x100>,
+			      <0x0 0xff638c00 0x0 0x100>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		aobus: bus@ff800000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff800000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fb0ab27d1f64..0e8b57283f31 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -133,3 +133,7 @@ map1 {
 		};
 	};
 };
+
+&pmu {
+	compatible = "amlogic,g12a-ddr-pmu";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index ee8fcae9f9f0..18791ef51f58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -139,3 +139,7 @@ map1 {
 &mali {
 	dma-coherent;
 };
+
+&pmu {
+	compatible = "amlogic,g12b-ddr-pmu";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 80737731af3f..c307b34ccd72 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -520,6 +520,10 @@ &pcie {
 	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
 };
 
+&pmu {
+	compatible = "amlogic,sm1-ddr-pmu";
+};
+
 &pwrc {
 	compatible = "amlogic,meson-sm1-pwrc";
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
