Return-Path: <SRS0=q/GU=MT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5332C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jul 2021 19:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B5760C51
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jul 2021 19:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88B5760C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FN8f8RHFe6EpyYNDnvGL6Bc2QrBwyF8IYEVQAHCSKH4=; b=j+rQY8DZXwC6AX
	B45jmnG1axIallabbzpb1Fr5k2XddW0Wf5g9wmfx4SI0gE830jnB0BjkvlTjIEkYuWA66iRCa7CcP
	60+/BjTL0VN6xt6h/nrWKScqqK+LrDlokXIP5BdO5Z3DcvELjqAODfUSSaLqwKUBqxG6cmxIBY9wM
	I2elswBUM6FouIdikaP5ho9K+quZI+seS26uHgTT9oE50Qw1c0Roh7iRS5ycgQ6fsA4wkMVPEFEfO
	AewzydiZxVvYCuERvnk+5V/Uk3JZvdqw4rvVDf3/SxVaTi5TRL2PfSddhPlaOw/3VOIy3eIvLHnb2
	5XTsSVcVe3iVHKx4PCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8SzB-00GA5r-QT; Tue, 27 Jul 2021 19:43:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Sz8-00GA4c-97; Tue, 27 Jul 2021 19:43:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6346060F59;
 Tue, 27 Jul 2021 19:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627415005;
 bh=o6qWwx7LdlYs6TGKj7dgZgd0iWbyc7atqvh4Ovs2fko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=RS8H78fdsFyi4w/OrL3WrlSktn9h34cK7B8JSHNGqMS1kjAyJCQZlGODWDDYrLAfI
 1te8Spsqb3qfMXlCauJNLjAC/BeR++OJkpsyYF/UEnRuXDWT+K/qsN3BXCEFFGpYwh
 M0zoDB8mLW1D+xQuPdKSKFv5oUgQCrmTEDFe42t+0NP2k9XlE/uH4mh/maIQADIKwx
 HfOE21k3DsD0Ambrlt8KPTHBVxhgv9oUC9xZ1YD9W33sKiPMVmFLHfwCb7gCRN6Jz5
 Iv4XCmM6WcjWMLMXXSpxF5KqV1qkxX9m3I2YEI62OasEA7/FM/8LO+WIQiHTml+Ex+
 lx4d/EoXaSe+A==
Date: Tue, 27 Jul 2021 14:43:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, yue.wang@Amlogic.com, khilman@baylibre.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v2] PCI: DWC: meson: add 256 bytes MRRS quirk
Message-ID: <20210727194323.GA725763@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727023000.1030525-1-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_124326_397357_368090A0 
X-CRM114-Status: GOOD (  30.72  )
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

On Tue, Jul 27, 2021 at 10:30:00AM +0800, Artem Lapkin wrote:
> 256 bytes maximum read request size. They can't handle
> anything larger than this. So force this limit on
> any devices attached under these ports.

This needs to say whether this is a functional or a performance issue.

If it's a functional issue, i.e., if meson signals an error or abort
when it receives a read request for > 256 bytes, we need to explain
exactly what happens.

If it's a performance issue, we need to explain why MRRS affects
performance and that this is an optimization.

> Come-from: https://lkml.org/lkml/2021/6/18/160
> Come-from: https://lkml.org/lkml/2021/6/19/19

Please use lore.kernel.org URLs instead.  The lore URLs are a little
uglier, but are more functional, more likely to continue working, and
avoid the ads.  These are:

  https://lore.kernel.org/r/20210618230132.GA3228427@bjorn-Precision-5520
  https://lore.kernel.org/r/20210619063952.2008746-1-art@khadas.com

> It only affects PCIe in P2P, in non-P2P is will certainly affect
> transfers on the internal SoC/Processor/Chip internal bus/fabric.

This needs to explain how a field in a PCIe TLP affects transfers on
these non-PCIe fabrics.

> These quirks are currently implemented in the
> controller driver and only applies when the controller has been probed
> and to each endpoint detected on this particular controller.
> 
> Continue having separate quirks for each controller if the core
> isn't the right place to handle MPS/MRRS.

I see similar code in dwc/pci-keystone.c.  Does this problem actually
affect *all* DesignWare-based controllers?

If so, we should put the workaround in the common dwc code, e.g.,
pcie-designware.c or similar.  

It also seems to affect pci-loongson.c (not DesignWare-based).  Is
there some reason it has the same problem, e.g., does loongson contain
DesignWare IP, or does it use the same non-PCIe fabric?

> >> Neil
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 686ded034..1498950de 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -466,6 +466,37 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void meson_mrrs_limit_quirk(struct pci_dev *dev)
> +{
> +	struct pci_bus *bus = dev->bus;
> +	int mrrs, mrrs_limit = 256;
> +	static const struct pci_device_id bridge_devids[] = {
> +		{ PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },

I don't really believe that PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 is the
only device affected here.  Is this related to the Meson root port, or
is it related to a PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3 on a plug-in card?
I guess the former, since you're searching upward for a root port.

So why is this limited to PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3?

> +		{ 0, },
> +	};
> +
> +	/* look for the matching bridge */
> +	while (!pci_is_root_bus(bus)) {
> +		/*
> +		 * 256 bytes maximum read request size. They can't handle
> +		 * anything larger than this. So force this limit on
> +		 * any devices attached under these ports.
> +		 */
> +		if (!pci_match_id(bridge_devids, bus->self)) {
> +			bus = bus->parent;
> +			continue;
> +		}
> +
> +		mrrs = pcie_get_readrq(dev);
> +		if (mrrs > mrrs_limit) {
> +			pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
> +			pcie_set_readrq(dev, mrrs_limit);
> +		}
> +		break;
> +	}
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_mrrs_limit_quirk);
> +
>  static const struct of_device_id meson_pcie_of_match[] = {
>  	{
>  		.compatible = "amlogic,axg-pcie",
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
