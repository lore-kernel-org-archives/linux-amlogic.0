Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2BDC3DA79
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Dec 2022 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5apbo/ooK54M965Im2ib1tj/FDvt0esK2d+akXabMeM=; b=wQxJXmPOJqzcdO
	DLDnBjZbDrhpMILRirYGtn3vsr7ONZSjISTwAAAxCGcY1SjrT8LUYhFZehzFWdrZ6AG905ygqQceq
	b3WGFI6Tc3sc06bY9zj3cKQC4Lh7vHv8wwIF75aG1CSrMXv89u3fEcLXeb+/+URU9yPV9AYXZ4vkS
	+5Ori7m+WIprEHbICI4tHSVZpu4GWUgCAlOmlBIgcwZD3zF190EJMsQogXpR8DNe2QyZtgtIaHGIR
	AfSi+jJtJPKVClX2BPGoz3o3DM2+Zhy/TZxao02fLIrqlv1hWLU7UAzQqrLGNhovBSg8oOQD/zVVl
	+DZKLDGyh0sDu1JknM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyoW-001SfV-Gm; Thu, 29 Dec 2022 19:43:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAyoT-001Sdy-IB
	for linux-amlogic@lists.infradead.org; Thu, 29 Dec 2022 19:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77406617F3;
	Thu, 29 Dec 2022 19:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C02C433EF;
	Thu, 29 Dec 2022 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672343014;
	bh=OF2QBuIivwLI2yVtSZKFRSp8bN1Ke056/VS/n7wByCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Otu5AevErYtodelmxt2WZnb1eqn6EdT//+dP2yuR13RAhiN1MJrCTglbBeMmPSNwB
	 MDE5/NQGT46ucxCTLPQZxgunwaw0AruuMmpPBrsOLJl4H/xRgHLbcwE86e5XmTrGvL
	 OnBeyUn4DOJKFf6LEciXysOfbtVpxTbdrGl1ZEZNdEU94p3OrITBgKIbbOwIMw4ABp
	 i0RRmmw5yqeczQLPIQLgFFeua22UBxW+ybmhnD77bBnkmyweMI9Fv4inGJ28d6fe/7
	 fPQsv2lVfXT/UfAfML2KMroB4luuWyMsqH4GFEH+uG4MLiS4beGzXoP7JBmQcaEX/h
	 Z2DXfow9d7hnw==
Date: Thu, 29 Dec 2022 13:43:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Aleksandr Burakov <a.burakov@rosalinux.ru>
Cc: Yue Wang <yue.wang@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] PCI: amlogic: The check for devm_add_action_or_reset's
 return value added
Message-ID: <20221229194333.GA625014@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220092137.6527-1-a.burakov@rosalinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_114337_663144_F2471947 
X-CRM114-Status: GOOD (  18.40  )
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

Hi Aleksandr,

Thanks for the patch!

On Tue, Dec 20, 2022 at 12:21:37PM +0300, Aleksandr Burakov wrote:
> The return value of the function devm_add_action_or_reset() was not
> checked hence an error code would not be returned.

You can save Lorenzo and Krzysztof some work by:

  - Rewording the subject line in the typical "<verb> <object>"
    imperative form, e.g., "Check for devm_add_action_or_reset()
    failure"

  - Rewording the commit log similarly.  Note that the existing commit
    only describes the current situation and doesn't actually say what
    the patch does.

Here's a good guide to commit logs: https://cbea.ms/git-commit/

> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index c1527693bed9..3d82f0b65480 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -187,9 +187,13 @@ static inline struct clk *meson_pcie_probe_clock(struct device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	devm_add_action_or_reset(dev,
> +	ret = devm_add_action_or_reset(dev,
>  				 (void (*) (void *))clk_disable_unprepare,
>  				 clk);
> +	if (ret) {
> +		dev_err(dev, "couldn't reset clk\n");
> +		return ERR_PTR(ret);
> +	}
>  
>  	return clk;
>  }
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
