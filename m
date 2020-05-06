Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0110C28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 10:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8798B20663
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 10:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZVM5oNf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSbK4h9s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8798B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGlBJXgDrQzr9i+yS8IAZqx6cg/ARfSgevlU+UEs9Xk=; b=cZVM5oNfsK7SBD
	u0p2wPIzHi9Pnlz4X0LQxK96KuSct//64Cay4vRlaIHvNDPE8QoB0NPVSuyX+miljFOHdv1JF4QZm
	TzpmbpXW/XKp6xCRQ6cBvBvawwuvVrHExfIN0d6wKxBNckgQbs1pMaSTlbuW9CAduQ4SUDeasp3ps
	WoaiQs2lmmlMweGJWiWSptRzmTm3xn+803uojmQYX6/vcuyKkM3WUuhWdNLPJAACFMdAdYJS/rw39
	fMfsaxhUS0tucsyENmZ98v0TJynftENy7n1DzuiW5KVQhSmBHesuwd9+i9iuEfoopXXebIi9jUoVV
	Gah9knYmmeSWnn6mxeyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWHW8-0002uR-53; Wed, 06 May 2020 10:43:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWHW5-0002u1-02; Wed, 06 May 2020 10:43:06 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9094220663;
 Wed,  6 May 2020 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588761784;
 bh=qjFxbQJhwnjLswkECG7XON/LpTe8nEe02+5NBDCvjtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cSbK4h9sQzP5m7pYiJdwdOo8ET3iaMr1rZpcO1x03ZxG4zrp7HgG27gc5E7iKlYBV
 z2CtAHjpeUw4uiCUovjFTfPrPUqzcEN6baYqdqmiSR5ifUKXGAwuafruomAwTALY0U
 9LXU2MHGZNFu4pBSupEbhF2T4zGWwTpkr0kniM8g=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jWHW2-009vEj-UY; Wed, 06 May 2020 11:43:03 +0100
Date: Wed, 6 May 2020 11:43:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kevin
 Hilman <khilman@baylibre.com>, Yue Wang <yue.wang@Amlogic.com>
Subject: Re: [PATCH] PCI: amlogic: meson: Don't use FAST_LINK_MODE to set up
 link
Message-ID: <20200506114301.7288c02d@why>
In-Reply-To: <20200429164230.309922-1-maz@kernel.org>
References: <20200429164230.309922-1-maz@kernel.org>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bhelgaas@google.com, robh@kernel.org, lorenzo.pieralisi@arm.com,
 khilman@baylibre.com, yue.wang@Amlogic.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_034305_078565_5F4DB626 
X-CRM114-Status: GOOD (  18.90  )
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 17:42:30 +0100
Marc Zyngier <maz@kernel.org> wrote:

> My vim3l board stubbornly refuses to play ball with a bog
> standard PCIe switch (ASM1184e), spitting all kind of errors
> ranging from link never coming up to crazy things like downstream
> ports falling off the face of the planet.
> 
> Upon investigating how the PCIe RC is configured, I found the
> following nugget: the Sysnopsys DWC PCIe Reference Manual, in the
> section dedicated to the PLCR register, describes bit 7 (FAST_LINK_MODE)
> as:
> 
> "Sets all internal timers to fast mode for simulation purposes."
> 
> I completely understand the need for setting this bit from a simulation
> perspective, but what I have on my desk is actual silicon, which
> expects timers to have a nominal value (and I expect this is the
> case for most people).
> 
> Making sure the FAST_LINK_MODE bit is cleared when configuring the RC
> solves this problem.
> 
> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 3715dceca1bf..ca59ba9e0ecd 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -289,11 +289,11 @@ static void meson_pcie_init_dw(struct meson_pcie *mp)
>  	meson_cfg_writel(mp, val, PCIE_CFG0);
>  
>  	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
> -	val &= ~LINK_CAPABLE_MASK;
> +	val &= ~(LINK_CAPABLE_MASK | FAST_LINK_MODE);
>  	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
>  
>  	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
> -	val |= LINK_CAPABLE_X1 | FAST_LINK_MODE;
> +	val |= LINK_CAPABLE_X1;
>  	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
>  
>  	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);

Yue, Kevin: any comment on this?

I found that the issue is reproducible even without a PCIe switch,
depending on the single device I plug in this machine (an Intel SSD
works fine, while a Marvell Ethernet adapter never shows up) as the
LTSSM times out much earlier than it really should (HW timers running
too quickly). Applying this patch makes every single device I have
lying around work fine.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
