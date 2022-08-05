Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCA6C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 07:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuXUMRW2WxpcUYAd/IMAgzh6oxMuenNNbApuPskFndg=; b=jLSbCUYW1OCyWJ
	yAeTPuMNCzbuxe5PsihD1+DtUzzzeaXsul1meOS1f6/c8+BIyhMj0MMm8TQYGUidTIeME4rAlecYa
	9p92pBv39lnkAwLfvHpwBXq9HhSzH65ww262fZx8eSEKLa95qa7tOY//7Z6660zmzNMKoPL3qmwMH
	vaCUj+128Aa2OIiGtSj/NqReYiB1mLouao8Qi37/nHXLEsrrsq9V7jIw2W7qs9HK1YuJDYCt8SxTY
	y4j/3Pj6KrLTkSuGG43STG3epX+d0A9yPT5mUHdO9z+Uihk4Wy9WX1lSIQo6qYAkRd2pNM71KHqfn
	F0L2HeGRIEQ/Of1Vu7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrik-00CqO3-Sn; Fri, 05 Aug 2022 07:26:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrXq-00Cl0l-Kb; Fri, 05 Aug 2022 07:14:56 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Fri, 5 Aug 2022
 15:14:38 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH v4 3/4] arm64: dts: meson: Add DDR PMU node
Date: Fri, 5 Aug 2022 15:14:25 +0800
Message-ID: <20220805071426.2598818-3-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_001454_719016_DC86A250 
X-CRM114-Status: UNSURE (   8.86  )
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
---
Changes v3 -> v4:
  - No change

Changes v2 -> v3:
  - No change

Changes v1 -> v2:
  - Remove model, dmc_nr, chann_nr properties
  - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
    identifier
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..7e556fe575be 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2146,6 +2146,13 @@ hdmi_tx_out: endpoint {
 			};
 		};
 
+		ddr_pmu: ddr_pmu@ff638000 {
+			compatible = "amlogic,g12-ddr-pmu";
+			reg = <0x0 0xff638000 0x0 0x100
+			       0x0 0xff638c00 0x0 0x100>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fb0ab27d1f64..4a32e081e70e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -133,3 +133,7 @@ map1 {
 		};
 	};
 };
+
+&ddr_pmu {
+	compatible = "amlogic,g12a-ddr-pmu";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index ee8fcae9f9f0..d91eca5a9afc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -139,3 +139,7 @@ map1 {
 &mali {
 	dma-coherent;
 };
+
+&ddr_pmu {
+	compatible = "amlogic,g12b-ddr-pmu";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 80737731af3f..7d62c661fde5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -543,3 +543,7 @@ &vpu {
 &usb {
 	power-domains = <&pwrc PWRC_SM1_USB_ID>;
 };
+
+&ddr_pmu {
+	compatible = "amlogic,sm1-ddr-pmu";
+};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
