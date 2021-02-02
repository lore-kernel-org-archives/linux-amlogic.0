Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C066C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 14:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C85264F4D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 14:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C85264F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=soSExNShTUKFduGlGWUAmQZi/xBkHRdWy18nQ4h0NNY=; b=ZPxsJ13+cXV5LLZBBR+Hedm8R
	cVhu90PG6l7qK3zIhKH2mUQqwBcmwYd1gFIoP1N6T+EqT+Oi6KZZWkXHcmzUja0p6IhRzhOuGZIUK
	S03mxELbtnB+ZQH3pzEO9sHNP/CU7eyXaQdMaSNBilDmEk9jFmL4Y/bHbl48sq1p1lEo/5VZi1X+I
	l8ifsvAJd7Ei4k1OTguVNLLlgPF9RkhZgGuSvutL8RiGb7KIw7f8ef4WqXlWOjqgiOWRlgXDPYFQw
	iJ20JQeUZ9MpdkmWBfnUn7QnqV26QbjN5AmxJmPz3YXP2sqBTNMl5SpdKKkD8aCvjOv+nQ79IPC9L
	VqtONGtDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wzA-00038L-IY; Tue, 02 Feb 2021 14:48:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wz4-00037U-TW; Tue, 02 Feb 2021 14:48:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5D9064F49;
 Tue,  2 Feb 2021 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612277329;
 bh=G3KQesqI3VgP63AXwofPugp+1nSxUQ1OQ3Asy+jaNxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=eojN5/2N4cQk8EnY0ICyh6i1TcTTpwXBuPH3WiiD+Is0PsjvGpY6et9QhxsGT5VuL
 j2sZioAI4vghYTiCSjBPzgNsLMs1/gfmvuCGiKiwY4jRuKAUk34iNtn/+vkSZEbnhr
 k9d4cJ0KKieTU51s6fPYwc2gIvP21tuqwVnRXaECdcxkgRA4n5XFeDOSnW4hKtmA8v
 aAGKa2F7Y0LeNpYwk9gqDbsPb7gTaSCc/kJQbcS0BWF8UEpHqg9XIafhyzb8kZ6WAg
 0cnqrnXAnajN7ayCTf4OOpA1XV8iLkFGReeBa9UEfwdBe1rEW+W/NUOVo2j0JJkxgi
 ZysjLyIga5lLQ==
Date: Tue, 2 Feb 2021 08:48:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/13] Add support for Hikey 970 PCIe
Message-ID: <20210202144847.GA97183@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1612271903.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_094851_143291_1EE5EE1D 
X-CRM114-Status: GOOD (  22.75  )
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
 Binghui Wang <wangbinghui@hisilicon.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Wei Xu <xuwei5@hisilicon.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 02:29:45PM +0100, Mauro Carvalho Chehab wrote:
> This series add support for Kirin 970 and for the Hikey 970
> board at the already-existing  driver.
> 
> patches 1-3 were previously submitted as RFC:
> 
> - Patch 1 converts the Synopsys Designware PCIe binding
>   documentation to the DT schema;
> - Patch 2 converts the pcie-kirin DT binding to the DT schema;
> - Patch 3 adds some extra configuration needed by
>   Kirin 970.
> 
> Patches 4-5 were imported from Manivannan's Hikey 970
> tree:
> 
>    https://git.linaro.org/people/manivannan.sadhasivam/96b-common.git/commit/?h=hikey970_pcie&id=4917380ad023c62960aa0f876bd4f23cefc8729e
> 
> It contains the original port made by Linaro.
> 
> patches 6 to 12 contains several cleanups applied on the
> top of Manivann's work, in order to simplify the extra data
> that would be required at DT, and to ensure that the power
> regulator needed to enable the PCI support on Hikey970
> will be enabled before trying to power it on, as otherwise,
> PCI resource allocation will fail.
> 
> -
> 
> patch 13 is here mostly as an example about what is needed
> in order for PCIe (and Ethernet) to start working on Hikey 970.
> 
> It won't apply cleanly, as it depends on another patch series,
> adding the needed regulator drivers.
> 
> I'll re-submit patch 13 after the pending stuff gets merged
> upstream.
> 
> Manivannan Sadhasivam (2):
>   pci: dwc: pcie-kirin: add HI3670 PCI-E controller support
>   arm64: dts: hisilicon: Add HI3670 PCI-E controller support
> 
> Mauro Carvalho Chehab (11):
>   doc: bindings: pci: designware-pcie.txt: convert it to yaml
>   doc: bindings: kirin-pcie.txt: convert it to yaml
>   doc: bindings: add new parameters used by Hikey 970
>   pci: dwc: pcie-kirin: simplify error handling logic
>   pci: dwc: pcie-kirin: simplify kirin 970 get resource logic
>   pci: dwc: pcie-kirin: place common init code altogether
>   pci: dwc: pcie-kirin: allow to optionally require a regulator
>   pci: dwc: pcie-kirin: allow using multiple reset GPIOs
>   pci: dwc: pcie-kirin: add support for clkreq GPIOs
>   pci: dwc: pcie-kirin: cleanup kirin970_pcie_get_eyeparam()
>   arm64: dts: hisilicon: cleanup Hikey 970 PCI schema

Please match:

  $ git log --oneline drivers/pci/controller/dwc/pcie-kirin.c
  60f5b73fa0f2 ("PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()")
  b9ac0f9dc8ea ("PCI: dwc: Move dw_pcie_setup_rc() to DWC common code")
  59fbab1ae40e ("PCI: dwc: Move dw_pcie_msi_init() into core")
  886a9c134755 ("PCI: dwc: Move link handling into common code")
  5bcb1757e637 ("PCI: dwc: Move MSI interrupt setup into DWC common code")
  a0fd361db8e5 ("PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common code")
  ecc3e424d190 ("PCI: kirin: Return -EPROBE_DEFER in case the gpio isn't ready")

We've already picked "PCIe" (not "PCI-E") as the preferred spelling.
Please adopt in subject lines, commit logs, comments, etc.

Similarly, "YAML" in comments & text, since acronyms are normally
capitalized.

"DesignWare" (not "Designware").

HiSilicon seems to use "HiKey" (not "Hikey"), so let's follow them.

Pick either "Kirin 970" or "HiKey 970" From
http://www.o.hisilicon.com/en/Products/ProductList/HiKey, it looks
like "HiKey 970" refers to a board, and "Kirin 970" refers to a piece
of it.

Please wrap commit logs to fill 75 columns.

>  .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
>  .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
>  .../bindings/pci/designware-pcie.txt          |  77 --
>  .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
>  .../bindings/pci/hisilicon,kirin-pcie.yaml    | 144 ++++
>  .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
>  .../bindings/pci/hisilicon-pcie.txt           |   2 +-
>  .../devicetree/bindings/pci/kirin-pcie.txt    |  50 --
>  .../bindings/pci/layerscape-pci.txt           |   2 +-
>  .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
>  .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
>  .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
>  .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
>  .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
>  .../devicetree/bindings/pci/snps,pcie.yaml    | 139 ++++
>  .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
>  .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
>  .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
>  MAINTAINERS                                   |   4 +-
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  64 ++
>  .../boot/dts/hisilicon/hikey970-pmic.dtsi     |   1 -
>  drivers/pci/controller/dwc/pcie-kirin.c       | 736 +++++++++++++++++-
>  23 files changed, 1084 insertions(+), 187 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/snps,pcie.yaml
> 
> -- 
> 2.29.2
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
