Return-Path: <SRS0=qPrc=6V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7E4C38A2A
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 21:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F9F20731
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2020 21:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DOJMcL/T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F9F20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyao+N7qjdoJsvAaS9QFTEZdfocM/5qNE1W5eEC0zvE=; b=DOJMcL/TMto7gR
	3naPNv96fv6H/xECB879j/6cdWNbQfCoe80N4sZnERH252HVNNuxFxzKSyOiT9LVqStbjYQYwB51b
	u4y44CEINimVRF5l/xTn4pODauQaDznT1wki6ZbyuYWVpFYLd5gxClb0zon/lkztnzcIEcm11nfNA
	NmAjQJ6NQ8pQgAHR86SqFl+9el3ZOR5yjj4QRptrjpI+qPQMmq+xOC6pPHXba5W6ADe8oQ5yRlarH
	XAiC2Qbmkn/T6xSDa3a7cAT2qZfCloomQ20qPICjQFA/cmFgcBnnecIpkY2eh2qHEctF3Z6wUmSi3
	iPlE1D1KKOhTcVHgbF9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWnfr-0007GS-Nx; Thu, 07 May 2020 21:03:19 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWnfp-0007G0-Vi; Thu, 07 May 2020 21:03:19 +0000
Received: by mail-ot1-f68.google.com with SMTP id m13so5765665otf.6;
 Thu, 07 May 2020 14:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VyDpqjFf92FEuiIHFMXtKbzqroXrkI/e2oOzUcuJwg4=;
 b=WFtsAYsEOXEPtidC3yPPiwfL8ALf0BEr5bcEVh0AC79BWPb+VsZe9ZeRyCHw2KbBgU
 +gnjL+WnfhLalMFl0lHzJIv1Kq7VA2J/xqOq1Vte95rKtHz9v+GP6Oee3Sbb4Co38nGB
 BWwttZHdacUgCQ9Th5EJqClMYBwcWzoQ2ZInKliYcm6hnGlmvjYlP6d5gKbqcPhrPacf
 trapTOS2DdYh9JXPVcUfqonbpG4yiJVNDxz4+vJBOQt1dmZecpz227Cujb9C8zv/Dbb9
 FsSxM2n5AqQdJ22aSlgp4EVnEDiKcyxG6BH30bkgdetejC5/Dh+ArnXeI64d9b/SIFle
 pjAw==
X-Gm-Message-State: AGi0Puahw3Wmow9SDIzIgqPkqjAfvqcX5wd6Jx7e1vKdmByZ9HWdxdai
 knlNH5I1FGqNiGxME1JV7w==
X-Google-Smtp-Source: APiQypIvjGiPp77s+t3QROHzGlT5BlLPBuZkwM7E4Px8YsppOcYnIGj84LS8p2dt85sZiqhftDFgJg==
X-Received: by 2002:a9d:3785:: with SMTP id x5mr11888606otb.81.1588885396749; 
 Thu, 07 May 2020 14:03:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g25sm1645901ots.21.2020.05.07.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:03:16 -0700 (PDT)
Received: (nullmailer pid 19976 invoked by uid 1000);
 Thu, 07 May 2020 21:03:15 -0000
Date: Thu, 7 May 2020 16:03:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] PCI: amlogic: meson: Don't use FAST_LINK_MODE to set up
 link
Message-ID: <20200507210315.GA19547@bogus>
References: <20200429164230.309922-1-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429164230.309922-1-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_140318_020564_C3FC8011 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 17:42:30 +0100, Marc Zyngier wrote:
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

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
