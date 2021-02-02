Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6BAC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 13:30:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E1764F6A
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 13:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E1764F6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jUxMxtBlDSR0ZN5IWfptXeZfQUqkt8KLElDTNyk59h8=; b=nE/MtTUT4gS47gaW4lStGFsgGE
	qA1aMWjnJfDamN6DCl9irRoiSH9ONkRY5Dt5skkgCPdjlZ+FIs60Lwmt/BIzsnbqWSgHk+kLcdIlX
	eDhSrVDfixd11HCcr1qs3JruJeg1CviU0XJh4iy+0iTrh4CwBZVQ+JObeEnTB98IntwN1aeKuRx9Q
	kwp26RY92SkSPK7gQzv7YWtorMvrdZmWMFATDrBzdIVEQ6ExcWJrjJ9L/wgTtyTB6nNCHXySq2Q01
	66q9OAl/nUBgINXsZZEf8zeSTJFLYLGR36yt4VAl6i18BMns54+bPvYz5WVICOTyQNDqKWTTR1wNm
	1Lku2jjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6vkz-0000YX-Ko; Tue, 02 Feb 2021 13:30:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6vkp-0000St-FJ; Tue, 02 Feb 2021 13:30:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EEB764F7B;
 Tue,  2 Feb 2021 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612272602;
 bh=9D7RURM2JxS7qUzT8CayBMlStaKkCkiMbZwsrnGaQCo=;
 h=From:To:Cc:Subject:Date:From;
 b=PQrTP3tIhNzqa5zVo1AOWI+wPETJ61DSKiKgzA+vs38unwkC9i8KDCyYpbZZV/frV
 cwJwhQQMHfHYykVeyG9iJubrGxWtaC2i8hKOzt8ObJQpOvwOn+9lyRJlySo3F27aaX
 3vlBIPzGd4G9PWZ0ltVOdnqe7ZqCE9mT0c9Wp+H1ICKHr1GorqhQGx32rLwtIdGu6c
 GpAC7ACnL3RXPhW0a249qRiUW6HxV6MMUg1cZ0SSnJiP8ZhZ8O7+HXzzZjccvwluiJ
 qyd83TUVFGqP80Qx8Cc5jx2RzaL0ixBbCSKMuXJVIrMx6rZhELjCqA8tuDimOlgYNz
 QdBU3BiiPeYMA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1l6vkl-0011yl-Bo; Tue, 02 Feb 2021 14:29:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Subject: [PATCH 00/13] Add support for Hikey 970 PCIe
Date: Tue,  2 Feb 2021 14:29:45 +0100
Message-Id: <cover.1612271903.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_083003_645278_06B6CB0A 
X-CRM114-Status: GOOD (  15.52  )
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
 Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
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
 linux-arm-kernel@axis.com, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

This series add support for Kirin 970 and for the Hikey 970
board at the already-existing  driver.

patches 1-3 were previously submitted as RFC:

- Patch 1 converts the Synopsys Designware PCIe binding
  documentation to the DT schema;
- Patch 2 converts the pcie-kirin DT binding to the DT schema;
- Patch 3 adds some extra configuration needed by
  Kirin 970.

Patches 4-5 were imported from Manivannan's Hikey 970
tree:

   https://git.linaro.org/people/manivannan.sadhasivam/96b-common.git/commit/?h=hikey970_pcie&id=4917380ad023c62960aa0f876bd4f23cefc8729e

It contains the original port made by Linaro.

patches 6 to 12 contains several cleanups applied on the
top of Manivann's work, in order to simplify the extra data
that would be required at DT, and to ensure that the power
regulator needed to enable the PCI support on Hikey970
will be enabled before trying to power it on, as otherwise,
PCI resource allocation will fail.

-

patch 13 is here mostly as an example about what is needed
in order for PCIe (and Ethernet) to start working on Hikey 970.

It won't apply cleanly, as it depends on another patch series,
adding the needed regulator drivers.

I'll re-submit patch 13 after the pending stuff gets merged
upstream.

Manivannan Sadhasivam (2):
  pci: dwc: pcie-kirin: add HI3670 PCI-E controller support
  arm64: dts: hisilicon: Add HI3670 PCI-E controller support

Mauro Carvalho Chehab (11):
  doc: bindings: pci: designware-pcie.txt: convert it to yaml
  doc: bindings: kirin-pcie.txt: convert it to yaml
  doc: bindings: add new parameters used by Hikey 970
  pci: dwc: pcie-kirin: simplify error handling logic
  pci: dwc: pcie-kirin: simplify kirin 970 get resource logic
  pci: dwc: pcie-kirin: place common init code altogether
  pci: dwc: pcie-kirin: allow to optionally require a regulator
  pci: dwc: pcie-kirin: allow using multiple reset GPIOs
  pci: dwc: pcie-kirin: add support for clkreq GPIOs
  pci: dwc: pcie-kirin: cleanup kirin970_pcie_get_eyeparam()
  arm64: dts: hisilicon: cleanup Hikey 970 PCI schema

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
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  64 ++
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c       | 736 +++++++++++++++++-
 23 files changed, 1084 insertions(+), 187 deletions(-)
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
