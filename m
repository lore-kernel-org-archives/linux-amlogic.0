Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FFBC48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 23:01:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46041613BD
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 23:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46041613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=h5KGlwMizuDwsGPE9sJmS+tp8L6O1JPQCtvn0cVj6T8=; b=ZGCGzywBryByCs
	0BipR1ZRtv3mGss7oDuid7UM2cc2wxPPCOk/4a+6AkUNGqltOyGMVe2dSilDimS+lsB9XGhVetJd0
	TNjqZcC2sjx7Utu8bJPVohD7PI1nNm+YDkaQd3nUTk8Q1+ef2LovTHHjb90p6C16dVTXMJXGRTZFd
	10MI9pnEd/pLdAEy7GWsWbQV7abMiLqMce83r1rfU0ug0Vidcu6XfMSPoe+xft0zmGXaXwyCTXSh5
	wKNUFOosx5eAjjk9f1T5/upNFWtZ+peVnFywD2q4lkK0B5+LqNUS7fC39OyOyvXF4q/K5PprzRBJN
	xmdE8ta3ebuW02vMbuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luNUX-00Flhp-Vy; Fri, 18 Jun 2021 23:01:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luNUV-00FlhN-7t; Fri, 18 Jun 2021 23:01:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AFA1613BD;
 Fri, 18 Jun 2021 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624057294;
 bh=O1HK2H+gu/eyMSlkJPLC7a6tkuqX8DtvddAbywKNgsY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AwlM75/MLDYy2ICXfXKfgBe+lffzr9iRQdVYubIDEDRCZn2QBg8NRxVp1nmERZx0K
 VJk/xLkFoiYZh+SPdCLHlhUtra58DbPOdmy5mFL2Agnd2xL+5p74UNPN9NfEi2otoN
 8V8wCIr3mQ/R1whT+fDFA7vpHPe+cRR+9JS/SPFT/Y6g1xYhA9Njq78YxZC1BpeFIW
 9QgL0SIPuoItZvKcwfeLaefKIFggtxY9pB6CeDZKy+38jzLU2db7EcBDYCvsjq1HuU
 Gydk6a8b3tP8rJyS95wI4tkeeLoVxNpTrNWCqODTn19GCfrIJ7UD6m88vRNyXI1jfP
 DMfaE0ADiIP0w==
Date: Fri, 18 Jun 2021 18:01:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, yue.wang@Amlogic.com, khilman@baylibre.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH] PCI: dwc: meson add quirk
Message-ID: <20210618230132.GA3228427@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618063821.1383357-1-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_160135_348772_0DAB581A 
X-CRM114-Status: GOOD (  22.30  )
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

On Fri, Jun 18, 2021 at 02:38:21PM +0800, Artem Lapkin wrote:
> Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> was find some issue with HDMI scrambled picture and nvme devices
> at intensive writing...

Wait a minute.  We're getting way too much of this MRRS fiddling with 
too little understanding of what the real problem is, and this is
becoming a maintenance problem.

We need more details about what the problem is and what specific
devices are affected.  If this is a defect in the host bridge, we
should have published errata about this because AFAICT there is
nothing in the spec that limits the MRRS the OS can program.

If we need to work around a problem, the quirk should relate to the
device that is defective, not to every PCI device that could
potentially be plugged in.

Related recent issue:
https://lore.kernel.org/r/20210528203224.GA1516603@bjorn-Precision-5520

> [    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256
> 
> This quirk setup same MRRS if we try solve this problem with
> pci=pcie_bus_perf kernel command line param
> 
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 686ded034f22..e2d40e5c2661 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -466,6 +466,33 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void meson_pcie_quirk(struct pci_dev *dev)
> +{
> +	int mrrs;
> +
> +	/* no need quirk */
> +	if (pcie_bus_config != PCIE_BUS_DEFAULT)
> +		return;
> +
> +	/* no need for root bus */
> +	if (pci_is_root_bus(dev->bus))
> +		return;
> +
> +	mrrs = pcie_get_readrq(dev);
> +
> +	/*
> +	 * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
> +	 * was find some issue with HDMI scrambled picture and nvme devices
> +	 * at intensive writing...
> +	 */
> +
> +	if (mrrs != MAX_READ_REQ_SIZE) {
> +		dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
> +		pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
> +	}
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);
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
