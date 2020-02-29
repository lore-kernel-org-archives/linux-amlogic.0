Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DA5C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:01:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C5F2073D
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxgP5D9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C5F2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkwsMnLtblZ/yt0MoB36Xjcc8v3F1MmhIoTfaE3DDJQ=; b=VxgP5D9Gq661pl
	F3xggvBE2f2TFw3AG/EwELIFCkhnXhzCEZ3vmYYFC4THOiDEoOZ+bgs6stsUhGG4W24a4zc4M9X05
	f47owz021MK7D0uvRgL7FE7J2IeHYCPsGEF647klRTG7XYK0acn7ts26BbIX3ypk1FOESWcycTqk3
	rW67pe9Kk7Ies4Sq6N2ZBDMv0y1CbGeG1CSUWk2nE5+/o+R4ytpKCG2si3g5zC25ahIALL17REJNg
	bvmwW31Xi6ojSK5uB9LHSzn4aanheYoKWPwc2WEWqf0d6mwPJ8ipBJsslF+WsIwF/0LYb1yg5Eo66
	xpJqlAZ1HXI6KV5b3egQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j85Uk-0007ti-SQ; Sat, 29 Feb 2020 17:01:42 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j85Ug-0007re-W9
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 17:01:41 +0000
Received: from localhost (lfbn-ren-1-591-115.w81-53.abo.wanadoo.fr
 [81.53.169.115]) (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 47DB6200004;
 Sat, 29 Feb 2020 17:01:17 +0000 (UTC)
Date: Sat, 29 Feb 2020 18:10:12 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v6 0/7] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
Message-ID: <20200229171012.GN2248@voidbox>
References: <20200123232943.10229-1-repk@triplefau.lt>
 <20200224141549.GB15614@e121166-lin.cambridge.arm.com>
 <7h8sklbcmo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7h8sklbcmo.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_090139_311272_BB9FA4E5 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi

On Sat, Feb 29, 2020 at 05:07:43PM +0100, Kevin Hilman wrote:
> Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> writes:
> 
> > On Fri, Jan 24, 2020 at 12:29:36AM +0100, Remi Pommarel wrote:
> >> PCIe device probing failures have been seen on AXG platforms and were
> >> due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
> >> in MIPI's PHY registers solved the problem. This bit controls band gap
> >> reference.
> >> 
> >> As discussed here [1] one of these shared MIPI/PCIE analog PHY register
> >> bits was implemented in the clock driver as CLKID_MIPI_ENABLE. This adds
> >> a PHY driver to control this bit instead, as well as setting the band
> >> gap one in order to get reliable PCIE communication.
> >> 
> >> While at it add another PHY driver to control PCIE only PHY registers,
> >> making AXG code more similar to G12A platform thus allowing to remove
> >> some specific platform handling in pci-meson driver.
> >> 
> >> Please note that CLKID_MIPI_ENABLE removable will be done in a different
> >> serie.
> >> 
> >> Changes since v5:
> >>  - Add additionalProperties in device tree binding documentation
> >>  - Make analog PHY required
> >> 
> >> Changes since v4:
> >>  - Rename the shared MIPI/PCIe PHY to analog
> >>  - Chain the MIPI/PCIe PHY to the PCIe one
> >> 
> >> Changes since v3:
> >>  - Go back to the shared MIPI/PCIe phy driver solution from v2
> >>  - Remove syscon usage
> >>  - Add all dt-bindings documentation
> >> 
> >> Changes since v2:
> >>  - Remove shared MIPI/PCIE device driver and use syscon to access register
> >>    in PCIE only driver instead
> >>  - Include devicetree documentation
> >> 
> >> Changes sinve v1:
> >>  - Move HHI_MIPI_CNTL0 bit control in its own PHY driver
> >>  - Add a PHY driver for PCIE_PHY registers
> >>  - Modify pci-meson.c to make use of both PHYs and remove specific
> >>    handling for AXG and G12A
> >> 
> >> [1] https://lkml.org/lkml/2019/12/16/119
> >> 
> >> Remi Pommarel (7):
> >>   dt-bindings: Add AXG PCIE PHY bindings
> >>   dt-bindings: Add AXG shared MIPI/PCIE analog PHY bindings
> >>   dt-bindings: PCI: meson: Update PCIE bindings documentation
> >>   arm64: dts: meson-axg: Add PCIE PHY nodes
> >>   phy: amlogic: Add Amlogic AXG MIPI/PCIE analog PHY Driver
> >>   phy: amlogic: Add Amlogic AXG PCIE PHY Driver
> >>   PCI: amlogic: Use AXG PCIE
> >> 
> >>  .../bindings/pci/amlogic,meson-pcie.txt       |  22 +-
> >>  .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  35 ++++
> >>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  |  52 +++++
> >>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  16 ++
> >>  drivers/pci/controller/dwc/pci-meson.c        | 116 ++---------
> >>  drivers/phy/amlogic/Kconfig                   |  22 ++
> >>  drivers/phy/amlogic/Makefile                  |  12 +-
> >>  .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 188 +++++++++++++++++
> >>  drivers/phy/amlogic/phy-meson-axg-pcie.c      | 192 ++++++++++++++++++
> >>  9 files changed, 543 insertions(+), 112 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
> >>  create mode 100644 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> >>  create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c
> >
> > Hi Remi,
> >
> > I am ready to pull this series in, do you want me to ? Or you prefer
> > it to go via a different tree upstream ?
> 
> To avoid conflicts, I'll take the DT patch (PATCH 4/7) through my
> amlogic tree, but feel free to take the rest.

Hi Lorenzo, Kevin,

The only issue I see here is that PATCH 6/7 does not have any
Reviewed-by/Acked-by, but if that is ok with you that will be nice to
have this upstream, thanks.

Sorry for the mail delivery error you could have received, silly me
forgot to renew the domain name.

Thanks

Remi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
