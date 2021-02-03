Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD399C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 07:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A1A64F76
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 07:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A1A64F76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtNGc52xHZD+xnYY6icl1xu/BH/UgBQ7cPuzQRAsrXc=; b=plOLZRIiA3Ut1cC/CMoI3XmbBc
	AQ2Y1KFEq8XCBw3fZcgRXctLSMwFMWv9ZpYWz8k2w+10WwSx+t4F/EqBSbZpixE6r/Q+xaiO9m2AP
	9Z1d0sW3geoxlcZ923Tot0PbtzXS1nXd7WGPiKTNHqFT9B2jaNtt0TYQBAr5qw2yCWdjGPHZlZOGC
	pjjIdp+sPEWyIzVNhGwSoKchsnTe1Qy2UMOWhZWv9flPrxHoDAzk13/hKWl4C/jQkVATbcoYfnUfK
	CRBvVkkoIMRKUd9CAHaraI/DLo/h7G5kRnjZ6ntR5a6scpz/tvlTApQN7PpSkBsBFcZ3kU/xsonka
	rW6QGdGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7CAv-0004O0-Nq; Wed, 03 Feb 2021 07:02:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7CAs-0004Lg-Qq; Wed, 03 Feb 2021 07:02:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6FAB64F69;
 Wed,  3 Feb 2021 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612335720;
 bh=H8e8UvRVRIeJRBMFLtr0H3UUm6rcx/88jqoabLKu+dk=;
 h=From:To:Cc:Subject:Date:From;
 b=aS9UcuGjtxyieyW+HARPPO1G4YNg5vmzsvSepSa3s2Cbv+6GEGc2iRzlg7UEhPdb1
 4LYDPyafbn/BEe/OhxzSqAZ7XfVWhQS9SwYyN2kDspIKm5Gryk/1k6maAfOhS5D4+2
 B26dshHhKf+1VYMSqO3kU4Hf6U9aRXTE2BmGxB/nimAAYxb2uTlaE/1dW0DJ/MwnzY
 yYJUckv8WIuBX0nYKvh81NRSvrDBD+w8fduDxVbuvhzVuHVORa+eVV1vHeqLuBf086
 urFLbMPclo4U354gRiGNlLc7vaui3rVC74Offis3Bttg9MKIQ4lmHYNV9H0Ym44l+b
 2N0uIemGk5rEg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1l7CAn-001CAO-UU; Wed, 03 Feb 2021 08:01:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Subject: [PATCH v2 00/11] Add support for Hikey 970 PCIe
Date: Wed,  3 Feb 2021 08:01:44 +0100
Message-Id: <cover.1612335031.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_020203_076350_F9AE496A 
X-CRM114-Status: GOOD (  16.03  )
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
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series add PCIe support for Kirin 970 SoC.

Patch 1 converts the Synopsys DesignWare PCIe binding documentation to
the DT schema;

Patch 2 converts the pcie-kirin DT binding to the DT schema;

Patch 3 adds some extra configuration needed to support Kirin 970.

Patch 4 were imported from Manivannan's HiKey 970 96boards tree:

   https://git.linaro.org/people/manivannan.sadhasivam/96b-common.git/commit/?h=hikey970_pcie&id=4917380ad023c62960aa0f876bd4f23cefc8729e

It contains the original port made by Linaro.

The remaining patches contain several cleanups applied on the top of
Manivann's work.

They cleanup the code and change it to use the DT bindings defined on
patch 3.

---

v2:
- DTS bindings dropped, as they depend on other DTS changes that will be
   happening at staging and ARM trees;
- Use regulator_get() for Kirin 970, instead of regulator_get_optional();
- The power supply was renamed to "pcie_vdd", in order to better match the
  schematics;
- The patch descriptions were renamed in order to match the terms used
  by other PCI patches;
- dts patches removed from this series, as they depend on other patches
  being merged via other trees.

Manivannan Sadhasivam (1):
  PCI: dwc: pcie-kirin: add support for Kirin 970 PCIe controller

Mauro Carvalho Chehab (10):
  doc: bindings: PCI: designware-pcie.txt: convert it to YAML
  doc: bindings: kirin-pcie.txt: convert it to YAML
  doc: bindings: add new parameters used by Kirin 970
  PCI: dwc: pcie-kirin: simplify error handling logic
  PCI: dwc: pcie-kirin: simplify Kirin 970 get resource logic
  PCI: dwc: pcie-kirin: place common init code altogether
  PCI: dwc: pcie-kirin: add support for a regulator
  PCI: dwc: pcie-kirin: allow using multiple reset GPIOs
  PCI: dwc: pcie-kirin: add support for clkreq GPIOs
  pci: dwc: pcie-kirin: cleanup kirin970_pcie_get_eyeparam()

 .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
 .../bindings/pci/designware-pcie.txt          |  77 --
 .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
 .../bindings/pci/hisilicon,kirin-pcie.yaml    | 144 ++++
 .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
 .../bindings/pci/hisilicon-pcie.txt           |   2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |  50 --
 .../bindings/pci/layerscape-pci.txt           |   2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
 .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
 .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
 .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
 .../devicetree/bindings/pci/snps,pcie.yaml    | 139 ++++
 .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
 .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
 MAINTAINERS                                   |   4 +-
 drivers/pci/controller/dwc/pcie-kirin.c       | 749 +++++++++++++++++-
 21 files changed, 1033 insertions(+), 186 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/snps,pcie.yaml

-- 
2.29.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
