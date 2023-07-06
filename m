Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C3C001B0
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqj+zWuIsQ4enNwh6E6Lj0rCq2TQSHznuAXJlQTwvH8=; b=GV64oAcmI3n+Xr
	1uM1/kZ0kg6ehcEqZdrrtxHH/3QcleYCJNu/ZMU7dMOVbTktvnWaLrbwCdpON1sgwrEAdOslXAcKN
	bhjJ7H4I06QZFhVFVTGCfuB33MPA1uE1R1zf/pwSHUXbiQWiA4H2vhxEm4Fa2rtf2WCNnxSVz9El6
	Q4wbwixb1ju5TwLjC54u+A6z9fjGSir8VvBR0aPPsAP8v8WihF8xjuMCjvxZHfsnkHwNLkeJwAm0a
	nifv5WFba/uS1sq0GWLnKD4T2hrT1yRVeOwr2SpevedFmbK/fhBOpfQ3LarwOy3rP5xHSVUAAL77l
	ZUL5rqEl3bKJamuxpG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHL9r-00143R-1u;
	Thu, 06 Jul 2023 09:20:15 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHL9n-0013zU-26;
	Thu, 06 Jul 2023 09:20:12 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 6 Jul 2023
 17:19:52 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 2/2] arm64: dts: add board AN400
Date: Thu, 6 Jul 2023 17:19:53 +0800
Message-ID: <20230706091954.3301224-3-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230706091954.3301224-1-xianwei.zhao@amlogic.com>
References: <20230706091954.3301224-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_022011_686043_D95D1C0A 
X-CRM114-Status: GOOD (  11.42  )
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

Add devicetrees support for Amlogic AN400  board based T7 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V1 -> V2: fix bug when  use "DTC CHECK_DTBS=yes"
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/amlogic-t7-a311d2-an400.dts   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 91fa425116ea..8b6f57a94863 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
+dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-an400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-khadas-vim4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
new file mode 100644
index 000000000000..c05edebb90b5
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "amlogic-t7.dtsi"
+
+/ {
+	model = "Amlogic A311D2 AN400 Development Board";
+	compatible = "amlogic,an400", "amlogic,a311d2", "amlogic,t7";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart_a;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x00000000 0xE0000000
+			0x00000001 0x00000000 0x00000000 0x20000000>;
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+};
+
+&uart_a {
+	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+	status = "okay";
+};
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
