Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D49C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 06:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKC4ktKSTLIQlJvk3QT6VTKwhtJboT/qxDksdDXCH1Y=; b=RnHol8K2vajuso
	wi/zHSw0b2eYEC587mao0uYKZCmfkaYC300cPe1m2tZ9Hl5v5nbT9OVXIFMCyXwDn0e0RhJIZ1K7C
	kyqhJO1VnsxP9GTh2NYDo0pXbfiDyYCIgOwxZc8GgbFOaPDKElg466PUYtK4fKPm1wrxUT84bpIrQ
	atHJRjOyu91xtQdO/8N9Vq2ozaQeSZQA6DY5/I680rM/8dRjtms0EtC0lhT8oS+CU5OC56vafousa
	F2X5EElloIuo98lx5wUxD+7ZFAkrEa7KyLF+T5PfttP1Xa5U7E+2Cgrpjiq3LhOGkKptMQO0fE4Se
	Lg//3qmgGrgZoytTn5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB9Wf-0083Qo-C7; Tue, 12 Jul 2022 06:37:41 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB9WG-0083Fb-I9; Tue, 12 Jul 2022 06:37:18 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 12 Jul 2022
 14:36:59 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH 3/4] arm64:dts:meson: Add DDR PMU node
Date: Tue, 12 Jul 2022 14:36:40 +0800
Message-ID: <20220712063641.2790997-3-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_233716_908902_53E3316D 
X-CRM114-Status: UNSURE (   8.95  )
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
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        |  4 ++++
 4 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..dc9da2f29b30 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2146,6 +2146,17 @@ hdmi_tx_out: endpoint {
 			};
 		};
 
+		ddr_pmu: ddr_pmu {
+			compatible = "amlogic,g12-ddr-pmu";
+			status = "okay";
+			dmc_nr = <1>;
+			chann_nr = <4>;
+			reg = <0x0 0xff638000 0x0 0x100
+				0x0 0xff638c00 0x0 0x100>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ddr_pmu";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fb0ab27d1f64..78bd33fb5553 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -133,3 +133,7 @@ map1 {
 		};
 	};
 };
+
+&ddr_pmu {
+	model = "g12a";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index ee8fcae9f9f0..3f4df1f58f95 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -139,3 +139,7 @@ map1 {
 &mali {
 	dma-coherent;
 };
+
+&ddr_pmu {
+	model = "g12b";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 80737731af3f..a0c15fd0ce9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -543,3 +543,7 @@ &vpu {
 &usb {
 	power-domains = <&pwrc PWRC_SM1_USB_ID>;
 };
+
+&ddr_pmu {
+	model = "sm1";
+};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
