Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A99C44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63DFecDR+7aUOOU7aoyfPOIDfaYTjxPPlpw0hSOryDU=; b=On0zarRd1dJdFT
	3eaZ2mHLlLLIOoKnohTZ9EZ95JBK+G8USgG5RqOTFox64u1Uo9o0aLiAIPpew6Wserd+tiOtFOErU
	aZxhirrT5GK38dwujJKl163w3qfYkcQ1PITW0ojmsKm8SeYwE0C7ehDerHjgFZhNoruovxs6qsKEs
	Ioc1qnIpOOw5VnTWfm5nfTHk01yP1EVRw+hwFlRzlaxtXkJ7S+Lv0Z0EmZ1itHXl0je/++aufPvhK
	lVVXgUlYwoK1XQB18ctOYhnPIgT+M+7DhIt418ocw+6qdFRp6P6WCP1Dld/urfZpCD2MuTqUxNjsb
	/as+5FSSG2MjRWdhuhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmu-0000000Bosk-1CfV;
	Tue, 14 Jul 2026 11:59:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbms-0000000BorK-3nWO
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 11:58:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 021FE60120;
	Tue, 14 Jul 2026 11:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09801F000E9;
	Tue, 14 Jul 2026 11:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784030337;
	bh=giljRTyf1/GeNOSQzfIPJUop85WcABknb2AO0qQE6u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otdtft7koRJ9KTpp8Lc1Kbd0yTLVGKldNWh2Pgdgbxv8Vhn1tQWMLDJynabMil1As
	 IrLVwudKY43tMQ9K6lC2xCblgiQpsMzzIu8kyX5MB1Pq4tQwGM2VRaFypD5LmPW27m
	 uOTxcSvsUa0iJZynDx6ZFSBUFGAZQlplKAV+jiOZ+JNcad24LpbxRVDVUSP+N9TyW+
	 d6Tm20PG90euvR1VHnSL3YbTZoIopdrLYRDoKH/5I651gQlF+115Hm3m5qube0LMct
	 VFIQrwY6uFGKPdKbvNaoIwRdEJulEZsufvfX3wsCqFDI45tmf1B7KgR6qRIVC3+aRZ
	 951wTJfKaMlmQ==
Date: Tue, 14 Jul 2026 17:28:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: sashiko-bot@kernel.org
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, neil.armstrong@linaro.org,
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v11 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <alYkfmsBU0UqI6Hz@vaman>
References: <20260714-amlogic-dma-v11-0-de79c2394282@amlogic.com>
 <20260714-amlogic-dma-v11-1-de79c2394282@amlogic.com>
 <20260714081942.2E0B91F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714081942.2E0B91F000E9@smtp.kernel.org>
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

On 14-07-26, 08:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The macros DMA_TX and DMA_RX in the global DT binding header lack an Amlogic/SoC specific prefix, leading to namespace pollution and potential build conflicts.
> --
> 
> --- Patch [1]: [PATCH v11 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA ---
> commit 093f368eaa67418008421d43d724ce2e98651039
> Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> dt-bindings: dma: Add Amlogic A9 SoC DMA
> 
> This commit adds device tree binding documentation for the Amlogic A9 SoC
> general-purpose DMA controller. It introduces the YAML schema and a header
> file defining the channel type macros.
> 
> > diff --git a/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml b/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
> [ ... ]
> > +  '#dma-cells':
> > +    const: 2
> > +    description:
> > +      The first cell is the DMA channel type(DMA_TX or DMA_RX).
> > +      The second cell is the DMA channel index.
> [ ... ]
> > diff --git a/include/dt-bindings/dma/amlogic,a9-dma.h b/include/dt-bindings/dma/amlogic,a9-dma.h
> > new file mode 100644
> > --- /dev/null
> > +++ b/include/dt-bindings/dma/amlogic,a9-dma.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +
> > +#ifndef __DT_BINDINGS_DMA_AMLOGIC_DMA_H__
> > +#define __DT_BINDINGS_DMA_AMLOGIC_DMA_H__
> > +
> > +#define DMA_TX			0
> > +#define DMA_RX			1
> 
> [Severity: Low]
> Are these macro names too generic for a global dt-bindings header?
> 
> Since headers in include/dt-bindings/ are globally visible and frequently
> included by C drivers, unprefixed names like DMA_TX and DMA_RX could lead
> to namespace pollution and macro redefinition build failures if a driver
> includes this alongside other headers that use the same common names.
> 
> Would it be safer to add a vendor or SoC prefix, such as AMLOGIC_A9_DMA_TX?

I think this makes sense to add here

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
