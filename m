Return-Path: <SRS0=5ZAx=EE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FA9C4363A
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 00:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07DE20780
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2020 00:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7TIXawf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="fBZNMVGf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07DE20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=czs/dhIZRjgiFv9XRCXn22m3TbMfnmUuscPjX+19bjU=; b=q7TIXawfjCgV1X/2oLtJjDA7G
	AZXbWpLIiT9uVHfCcylygraRcDzLjcNfz87gu7JSdYlJ/idu3/KZyMJ5AoIIpIxiKD4nxJMoDbu65
	tTj9VKT2PT2kZ5p+ZTKameMMj3MAv17Lgoi5W43CK/FhnFiEhXVz28K68PrmkaERdyKoO1WhgdW8q
	qfiF6u/RWKxoXqQp/SPtXEAQvQlyLTvqmZt8LaGOyCCgTr/FHqixtDu/yvqonmDllfKTmvkTXDgmd
	BY+5gZS5ydb2OnQQtvXRc2vhZxA9VMPGLfRKbtfXmiyIErrDnSS7clFW49cnFIaTm/NRzQnFqrGTP
	cSg7HVxuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXvh6-0006Pi-W2; Thu, 29 Oct 2020 00:21:33 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXvh4-0006Or-5w
 for linux-amlogic@lists.infradead.org; Thu, 29 Oct 2020 00:21:31 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM5hY1c5jz9sTf;
 Thu, 29 Oct 2020 11:21:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603930883;
 bh=1H+0lWYSxaRNRPccmOFzTYzYgErk8Jx3rJ+1kAphuRA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fBZNMVGf2DpDigzvlO5EFKrSfhcHEKaclKWRSpd0rMT3nijHNgh+K7YZaMcJgG+I1
 Sqp0aSWWEEdsZy58/OpXsqjKdLh1Go0930GvCaNP/rPdkcm6jj8VLu+RtZAYju7Lwv
 1OyJzCDTJEPo7fb3YVK+7vVSD947EigxRUEp47FaWl3boTdjoiwTlcbdL3lqCGS/Ir
 HjS3q0q57c4NP98/lAG95E/PIIhVcbnSgznNbTvydd0ukv+wu90vIX/fgrejZmKL/x
 fFgnf7BJJuzQ19szmCiiqO1GyzQ9nRbhKLLimDSXto/YVs3qcf351XsGaZm3WEkFCR
 8YPZdn5UhcwWA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 01/13] PCI: dwc/imx6: Drop setting PCI_MSI_FLAGS_ENABLE
In-Reply-To: <20201028204646.356535-2-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
 <20201028204646.356535-2-robh@kernel.org>
Date: Thu, 29 Oct 2020 11:21:16 +1100
Message-ID: <87h7qdx4oz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_202130_653923_708668A9 
X-CRM114-Status: GOOD (  17.02  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Yue Wang <yue.wang@Amlogic.com>,
 Murali Karicheri <m-karicheri2@ti.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:
> No other host driver sets the PCI_MSI_FLAGS_ENABLE bit, so it must not
> be necessary. If it is, a comment is needed.

Yeah, but git blame directly points to:

  75cb8d20c112 ("PCI: imx: Enable MSI from downstream components")

Which has a pretty long explanation. The relevant bit probably being:

  ... on i.MX6, the MSI Enable bit controls delivery of MSI interrupts
  from components below the Root Port.


So it seems a little rash to just remove the code.

cheers


> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 5cf1ef12fb9b..7dd137d62dca 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1002,7 +1002,6 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  	struct resource *dbi_base;
>  	struct device_node *node = dev->of_node;
>  	int ret;
> -	u16 val;
>  
>  	imx6_pcie = devm_kzalloc(dev, sizeof(*imx6_pcie), GFP_KERNEL);
>  	if (!imx6_pcie)
> @@ -1167,13 +1166,6 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (pci_msi_enabled()) {
> -		u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
> -		val = dw_pcie_readw_dbi(pci, offset + PCI_MSI_FLAGS);
> -		val |= PCI_MSI_FLAGS_ENABLE;
> -		dw_pcie_writew_dbi(pci, offset + PCI_MSI_FLAGS, val);
> -	}
> -
>  	return 0;
>  }
>  
> -- 
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
