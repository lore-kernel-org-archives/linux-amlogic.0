Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E23C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 07:02:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9609164F76
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 07:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9609164F76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mQZJknzDRcPo37HL35nJdq6yNXYcWnUxdG80K6V4j3s=; b=Iadik6VKUTKUU6iBb89eIz3fk
	7/Wvbmo4orSshlU6HuFnTNFR3FVm8sfgeXMPGx0qv15ieVi8cMkdXgI4vjnp0XHZ+2esGza6LAUIY
	EPlhfFHXc4eFXV5rZ17zDBSQXyrl5DY3jxXbq4L6XaX+M0xZ6pE/8faVjoTgJILUfFCKhN3IcvUkl
	dVbWZvDUXX9BpBeJ47Fh6VyKirrwX1Bp1Td5gsuMdlgAtEg/zWZJ/0R5mO6Uw45VnVk31dQ6taorH
	s5FvCrsW7rCRQk+Td/26m8F6rdLSyCn8xhq4EyA7JJev7A9G0nye0IhPcTchmnnPFIAD2KP+gvZEc
	D+nfJ/Lrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7CB4-0004Ro-9k; Wed, 03 Feb 2021 07:02:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7CAs-0004Lj-Rz; Wed, 03 Feb 2021 07:02:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9144864F74;
 Wed,  3 Feb 2021 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612335721;
 bh=nJFVkFVcxLt04mnBQIBfm4IXRi2ERW4Q1DqINzouepk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dGRtKb0i4HMj94TBtnNezfk1bY7Db4Y2IOYOT1gq0o8AmV9/BTWPtOJQq0wr+ijGk
 NR+UKz9zNtGRNQznPZ/3atj0aYsTZPUw6DqQ5Hd9+adHZUNvrEX4CLFAk3zbEeorOy
 IDjMlorc8V8mE07/D3zCiEjxx/pjRUOnAVHqrkWVjIlKwAYykJOdV35Ko+pkg7e9/0
 oJAWf6Yyci4LNgOmdTInEQEc6pADOmAiFAnQjZ70bDGKumNmruzHgAEqZCUa0OT8Jr
 VGP/5g6kOVfQCE/7FKSUgMjLyp7+gyb5Xgp9nHZX1LztmYx2M8QX44wrVO45kOPi8M
 3KwOje6tgrxTA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1l7CAn-001CAQ-WF; Wed, 03 Feb 2021 08:01:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Subject: [PATCH v2 01/11] doc: bindings: PCI: designware-pcie.txt: convert it
 to YAML
Date: Wed,  3 Feb 2021 08:01:45 +0100
Message-Id: <bf3d0a5683c50062a55182922daeec5cfdbe00cc.1612335031.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612335031.git.mchehab+huawei@kernel.org>
References: <cover.1612335031.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_020203_091378_2AE52662 
X-CRM114-Status: GOOD (  20.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the file into a DT schema.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
 .../bindings/pci/designware-pcie.txt          |  77 ----------
 .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
 .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
 .../bindings/pci/hisilicon-pcie.txt           |   2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |   2 +-
 .../bindings/pci/layerscape-pci.txt           |   2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
 .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
 .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
 .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
 .../devicetree/bindings/pci/snps,pcie.yaml    | 139 ++++++++++++++++++
 .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
 .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
 MAINTAINERS                                   |   2 +-
 19 files changed, 169 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/snps,pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
index b6acbe694ffb..da9253d43550 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt
@@ -3,7 +3,7 @@ Amlogic Meson AXG DWC PCIE SoC controller
 Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and
 inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Additional properties are described here:
 
@@ -33,7 +33,7 @@ Required properties:
 - phy-names: must contain "pcie"
 
 - device_type:
-	should be "pci". As specified in designware-pcie.txt
+	should be "pci". As specified in snps,pcie.yaml
 
 
 Example configuration:
diff --git a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
index 979dc7b6cfe8..84b53ae2c376 100644
--- a/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt
@@ -1,7 +1,7 @@
 * Axis ARTPEC-6 PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,pcie.yaml.
 
 Required properties:
 - compatible: "axis,artpec6-pcie", "snps,dw-pcie" for ARTPEC-6 in RC mode;
diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
deleted file mode 100644
index 78494c4050f7..000000000000
--- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* Synopsys DesignWare PCIe interface
-
-Required properties:
-- compatible:
-	"snps,dw-pcie" for RC mode;
-	"snps,dw-pcie-ep" for EP mode;
-- reg: For designware cores version < 4.80 contains the configuration
-       address space. For designware core version >= 4.80, contains
-       the configuration and ATU address space
-- reg-names: Must be "config" for the PCIe configuration space and "atu" for
-	     the ATU address space.
-    (The old way of getting the configuration address space from "ranges"
-    is deprecated and should be avoided.)
-RC mode:
-- #address-cells: set to <3>
-- #size-cells: set to <2>
-- device_type: set to "pci"
-- ranges: ranges for the PCI memory and I/O regions
-- #interrupt-cells: set to <1>
-- interrupt-map-mask and interrupt-map: standard PCI
-	properties to define the mapping of the PCIe interface to interrupt
-	numbers.
-EP mode:
-- num-ib-windows: number of inbound address translation windows
-- num-ob-windows: number of outbound address translation windows
-
-Optional properties:
-- num-lanes: number of lanes to use (this property should be specified unless
-  the link is brought already up in BIOS)
-- reset-gpio: GPIO pin number of power good signal
-- clocks: Must contain an entry for each entry in clock-names.
-	See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-	- "pcie"
-	- "pcie_bus"
-- snps,enable-cdm-check: This is a boolean property and if present enables
-   automatic checking of CDM (Configuration Dependent Module) registers
-   for data corruption. CDM registers include standard PCIe configuration
-   space registers, Port Logic registers, DMA and iATU (internal Address
-   Translation Unit) registers.
-RC mode:
-- num-viewport: number of view ports configured in hardware. If a platform
-  does not specify it, the driver assumes 2.
-- bus-range: PCI bus numbers covered (it is recommended for new devicetrees
-  to specify this property, to keep backwards compatibility a range of
-  0x00-0xff is assumed if not present)
-
-EP mode:
-- max-functions: maximum number of functions that can be configured
-
-Example configuration:
-
-	pcie: pcie@dfc00000 {
-		compatible = "snps,dw-pcie";
-		reg = <0xdfc00000 0x0001000>, /* IP registers */
-		      <0xd0000000 0x0002000>; /* Configuration space */
-		reg-names = "dbi", "config";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000
-			  0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
-		interrupts = <25>, <24>;
-		#interrupt-cells = <1>;
-		num-lanes = <1>;
-	};
-or
-	pcie: pcie@dfc00000 {
-		compatible = "snps,dw-pcie-ep";
-		reg = <0xdfc00000 0x0001000>, /* IP registers 1 */
-		      <0xdfc01000 0x0001000>, /* IP registers 2 */
-		      <0xd0000000 0x2000000>; /* Configuration space */
-		reg-names = "dbi", "dbi2", "addr_space";
-		num-ib-windows = <6>;
-		num-ob-windows = <2>;
-		num-lanes = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
index de4b2baf91e8..9470b279e3e4 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
@@ -1,7 +1,7 @@
 * Freescale i.MX6 PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,pcie.yaml.
 
 Required properties:
 - compatible:
diff --git a/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt b/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
index 760b4d740616..2f62119d97b9 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
@@ -3,7 +3,7 @@ HiSilicon STB PCIe host bridge DT description
 The HiSilicon STB PCIe host controller is based on the DesignWare PCIe core.
 It shares common functions with the DesignWare PCIe core driver and inherits
 common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
index d6796ef54ea1..4d243bfb9709 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
@@ -3,7 +3,7 @@ HiSilicon Hip05 and Hip06 PCIe host bridge DT description
 HiSilicon PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and inherits
 common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/pci/kirin-pcie.txt b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
index 6bbe43818ad5..a38f8e38a67b 100644
--- a/Documentation/devicetree/bindings/pci/kirin-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
@@ -3,7 +3,7 @@ HiSilicon Kirin SoCs PCIe host DT description
 Kirin PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and
 inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Additional properties are described here:
 
diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
index daa99f7d4c3f..8070adfc1746 100644
--- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
+++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
@@ -1,7 +1,7 @@
 Freescale Layerscape PCIe controller
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,pcie.yaml.
 
 This controller derives its clocks from the Reset Configuration Word (RCW)
 which is used to describe the PLL settings at the time of chip-reset.
diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
index bd43f3c3ece4..4644d79e0e0c 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
@@ -1,7 +1,7 @@
 NVIDIA Tegra PCIe controller (Synopsys DesignWare Core based)
 
 This PCIe controller is based on the Synopsis Designware PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,pcie.yaml.
 Some of the controller instances are dual mode where in they can work either
 in root port mode or endpoint mode but one at a time.
 
@@ -22,7 +22,7 @@ Required properties:
   property.
 - reg-names: Must include the following entries:
   "appl": Controller's application logic registers
-  "config": As per the definition in designware-pcie.txt
+  "config": As per the definition in snps,pcie.yaml
   "atu_dma": iATU and DMA registers. This is where the iATU (internal Address
              Translation Unit) registers of the PCIe core are made available
              for SW access.
diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
index 7a813d0e6d63..4531b895e9ea 100644
--- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
+++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
@@ -1,7 +1,7 @@
 * Marvell Armada 7K/8K PCIe interface
 
 This PCIe host controller is based on the Synopsys DesignWare PCIe IP
-and thus inherits all the common properties defined in designware-pcie.txt.
+and thus inherits all the common properties defined in snps,pcie.yaml.
 
 Required properties:
 - compatible: "marvell,armada8k-pcie"
diff --git a/Documentation/devicetree/bindings/pci/pci-keystone.txt b/Documentation/devicetree/bindings/pci/pci-keystone.txt
index 47202a2938f2..ac271a0ca078 100644
--- a/Documentation/devicetree/bindings/pci/pci-keystone.txt
+++ b/Documentation/devicetree/bindings/pci/pci-keystone.txt
@@ -3,9 +3,9 @@ TI Keystone PCIe interface
 Keystone PCI host Controller is based on the Synopsys DesignWare PCI
 hardware version 3.65.  It shares common functions with the PCIe DesignWare
 core driver and inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt
+Documentation/devicetree/bindings/pci/snps,pcie.yaml
 
-Please refer to Documentation/devicetree/bindings/pci/designware-pcie.txt
+Please refer to Documentation/devicetree/bindings/pci/snps,pcie.yaml
 for the details of DesignWare DT bindings.  Additional properties are
 described here as well as properties that are not applicable.
 
@@ -82,11 +82,11 @@ reg-names: "dbics" for the DesignWare PCIe registers, "app" for the
 	   Address Translation Unit configuration registers and
 	   "addr_space" used to map remote RC address space
 num-ib-windows: As specified in
-		Documentation/devicetree/bindings/pci/designware-pcie.txt
+		Documentation/devicetree/bindings/pci/snps,pcie.yaml
 num-ob-windows: As specified in
-		Documentation/devicetree/bindings/pci/designware-pcie.txt
+		Documentation/devicetree/bindings/pci/snps,pcie.yaml
 num-lanes: As specified in
-	   Documentation/devicetree/bindings/pci/designware-pcie.txt
+	   Documentation/devicetree/bindings/pci/snps,pcie.yaml
 power-domains: As documented by the generic PM domain bindings in
 	       Documentation/devicetree/bindings/power/power_domain.txt.
 ti,syscon-pcie-mode: phandle to the device control module required to configure
diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt b/Documentation/devicetree/bindings/pci/pcie-al.txt
index 557a5089229d..6e1e20e15ae9 100644
--- a/Documentation/devicetree/bindings/pci/pcie-al.txt
+++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
@@ -2,7 +2,7 @@
 
 Amazon's Annapurna Labs PCIe Host Controller is based on the Synopsys DesignWare
 PCI core. It inherits common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Properties of the host controller node that differ from it are:
 
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 3b55310390a0..43c3086cf6ea 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -33,22 +33,22 @@
 - device_type:
 	Usage: required
 	Value type: <string>
-	Definition: Should be "pci". As specified in designware-pcie.txt
+	Definition: Should be "pci". As specified in snps,pcie.yaml
 
 - #address-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 3. As specified in designware-pcie.txt
+	Definition: Should be 3. As specified in snps,pcie.yaml
 
 - #size-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 2. As specified in designware-pcie.txt
+	Definition: Should be 2. As specified in snps,pcie.yaml
 
 - ranges:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,pcie.yaml
 
 - interrupts:
 	Usage: required
@@ -63,17 +63,17 @@
 - #interrupt-cells:
 	Usage: required
 	Value type: <u32>
-	Definition: Should be 1. As specified in designware-pcie.txt
+	Definition: Should be 1. As specified in snps,pcie.yaml
 
 - interrupt-map-mask:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,pcie.yaml
 
 - interrupt-map:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: As specified in designware-pcie.txt
+	Definition: As specified in snps,pcie.yaml
 
 - clocks:
 	Usage: required
diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
index 1810bf722350..8a4fe2d021ed 100644
--- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
@@ -13,7 +13,7 @@ maintainers:
 description: |+
   Exynos5433 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP and thus inherits all the common properties defined in
-  designware-pcie.txt.
+  snps,pcie.yaml.
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
diff --git a/Documentation/devicetree/bindings/pci/snps,pcie.yaml b/Documentation/devicetree/bindings/pci/snps,pcie.yaml
new file mode 100644
index 000000000000..eeb5dad6937d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/snps,pcie.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/snps,pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare PCIe interface
+
+maintainers:
+  - Jingoo Han <jingoohan1@gmail.com>
+  - Gustavo Pimentel <gustavo.pimentel@synopsys.com>
+
+description: |
+  Synopsys DesignWare PCIe host controller
+
+anyOf:
+  - {}
+  - items:
+      contains:
+        enum:
+          - snps,dw-pcie
+          - snps,dw-pcie-ep
+
+properties:
+  compatible:
+    description: |
+      The compatible can be either:
+      - snps,dw-pcie       # for RC mode
+      - snps,dw-pcie-ep    # For EP mode
+      or some other value, when there's a host-specific driver
+
+  reg:
+    description: |
+      Contains DBI and the configuration address space for all
+      Designware versions.
+      For Designware core version >= 4.80, should also contain the
+      ATU address space.
+    minItems: 2
+    maxItems: 4
+
+  reset-gpio:
+    description: GPIO pin number for the PERST# signal
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 8
+
+  clock-names:
+    items:
+      contains:
+        enum: [ pcie, pcie_bus ]
+    minItems: 2
+    maxItems: 8
+
+  "snps,enable-cdm-check":
+    $ref: /schemas/types.yaml#definitions/flag
+    description: |
+      This is a boolean property and if present enables
+      automatic checking of CDM (Configuration Dependent Module) registers
+      for data corruption. CDM registers include standard PCIe configuration
+      space registers, Port Logic registers, DMA and iATU (internal Address
+      Translation Unit) registers.
+
+  # The following are optional properties for RC mode
+
+  num-viewport:
+    description: |
+      number of view ports configured in hardware. If a platform
+      does not specify it, the driver assumes 2.
+    deprecated: true
+
+  # The following are mandatory properties for EP Mode
+
+  num-ib-windows:
+    description: number of inbound address translation windows
+    maxItems: 1
+    deprecated: true
+
+  num-ob-windows:
+    description: number of outbound address translation windows
+    maxItems: 1
+    deprecated: true
+
+  # The following are optional properties for EP mode
+
+  max-functions:
+    description: maximum number of functions that can be configured
+
+required:
+  - reg
+  - reg-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: snps,dw-pcie
+    then:
+      allOf:
+        - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: snps,dw-pcie-ep
+    then:
+      required:
+        - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie: pcie@dfc00000 {
+      compatible = "snps,dw-pcie";
+      reg = <0xdfc00000 0x0001000>, /* IP registers */
+            <0xd0000000 0x0002000>; /* Configuration space */
+      reg-names = "dbi", "config";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      device_type = "pci";
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      interrupts = <25>, <24>;
+      #interrupt-cells = <1>;
+      num-lanes = <1>;
+    };
+    pcie_ep: pcie_ep@dfd00000 {
+      compatible = "snps,dw-pcie-ep";
+      reg = <0xdfc00000 0x0001000>, /* IP registers 1 */
+            <0xdfc01000 0x0001000>, /* IP registers 2 */
+            <0xd0000000 0x2000000>; /* Configuration space */
+      reg-names = "dbi", "dbi2", "addr_space";
+      num-ib-windows = <6>;
+      num-ob-windows = <2>;
+      num-lanes = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
index d6cf8a560ef0..9c8733d21de4 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
@@ -10,7 +10,7 @@ description: |
   UniPhier PCIe endpoint controller is based on the Synopsys DesignWare
   PCI core. It shares common features with the PCIe DesignWare core and
   inherits common properties defined in
-  Documentation/devicetree/bindings/pci/designware-pcie.txt.
+  Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
diff --git a/Documentation/devicetree/bindings/pci/ti-pci.txt b/Documentation/devicetree/bindings/pci/ti-pci.txt
index d5cbfe6b0d89..dfebfdb9b819 100644
--- a/Documentation/devicetree/bindings/pci/ti-pci.txt
+++ b/Documentation/devicetree/bindings/pci/ti-pci.txt
@@ -12,7 +12,7 @@ PCIe DesignWare Controller
 	       number of PHYs as specified in *phys* property.
  - ti,hwmods : Name of the hwmod associated to the pcie, "pcie<X>",
 	       where <X> is the instance number of the pcie from the HW spec.
- - num-lanes as specified in ../designware-pcie.txt
+ - num-lanes as specified in ../snps,pcie.yaml
  - ti,syscon-lane-sel : phandle/offset pair. Phandle to the system control
 			module and the register offset to specify lane
 			selection.
@@ -32,7 +32,7 @@ HOST MODE
    device_type,
    ranges,
    interrupt-map-mask,
-   interrupt-map : as specified in ../designware-pcie.txt
+   interrupt-map : as specified in ../snps,pcie.yaml
  - ti,syscon-unaligned-access: phandle to the syscon DT node. The 1st argument
 			       should contain the register offset within syscon
 			       and the 2nd argument should contain the bit field
diff --git a/Documentation/devicetree/bindings/pci/uniphier-pcie.txt b/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
index c4b7381733a0..17cfe504d800 100644
--- a/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/uniphier-pcie.txt
@@ -6,7 +6,7 @@ on Socionext UniPhier SoCs.
 UniPhier PCIe host controller is based on the Synopsys DesignWare PCI core.
 It shares common functions with the PCIe DesignWare core driver and inherits
 common properties defined in
-Documentation/devicetree/bindings/pci/designware-pcie.txt.
+Documentation/devicetree/bindings/pci/snps,pcie.yaml.
 
 Required properties:
 - compatible: Should be "socionext,uniphier-pcie".
diff --git a/MAINTAINERS b/MAINTAINERS
index 2dd0a662d931..0bcba0d4994c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13673,7 +13673,7 @@ M:	Jingoo Han <jingoohan1@gmail.com>
 M:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/pci/designware-pcie.txt
+F:	Documentation/devicetree/bindings/pci/snps,pcie.yaml
 F:	drivers/pci/controller/dwc/*designware*
 
 PCI DRIVER FOR TI DRA7XX/J721E
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
