Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD8AC79F9F
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6PYen98aNde/wNm/bZDY/FXRSuBwLhDA8rLl1zmQjM=; b=GwR4KlEJRVAggo
	Guhr3reM4Lq4h9bK0TrpqkM0Ls2kq7qlM/hu4SJKOfZjo1uS44grHFQN65qf044CYKIiW7hNQ6TOP
	Rh9EK+EdlWKBNtI/PpZElovT1S3r8KGDLbJ0m8x6p27GeptguPGh8n3y16SN639aZ5M6ZJ2PDmT+/
	Fl4MWP5iOLCwTDS4iTSLf31oaYTae+LtffkbfEckxXsrSfMOetIWts2hymVeuRALsPb0qjXsNhlut
	/XTZuMcI5/e94dOQt/qNiYH5Im6Vlyq81Icd2tMwbkeh2Mbfb1knG7h1/rdnqd7gaWhixaELU1TwC
	Z+KKEkGvbalPVLcUeOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fZs-0000000EbTD-0ddE;
	Thu, 10 Sep 2026 14:16:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fZq-0000000EbT4-3mMl
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 14:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 432CB43264;
	Thu, 10 Sep 2026 14:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2465A1F000FF;
	Thu, 10 Sep 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049794;
	bh=jlbkzOzLCW57AMblPScYBFvVgRLjuwLIep83xkYzrQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2yD8kF+q9OYuYS0oX4fpiCDyPTHf34wqe/xEFgKzjT861IRj3xpatOHJjYoUXohx
	 SA/4rUPFoBcEWZKsLFcexsa1oqvAcuaNng49+jZBwaHDjPHrsW1pDbls7N96fHHYk5
	 06QlQI8DjrNbBl0GjnH11/5TEjdO9HmceN7KGU5Ag9Bzy3X5Mu8++5JliknWwea62R
	 2/lWRQX8zabsmGBe7g2hCZ0XVM1siSQ2QRLR8LV66xKxPP+an4xum1x+y/H+6sZd3l
	 voLv0fGJPaxVF7UP0u8w/HIbLUAqQqYpEEHlSNP0w0fHWW+25bH+Eyy+be0xfK9khz
	 8VybuPBina8Yw==
Date: Thu, 10 Sep 2026 15:16:29 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, neil.armstrong@linaro.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Message-ID: <20260910141629.GE1051768@google.com>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
 <20260902130216.55BC21F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902130216.55BC21F00A3A@smtp.kernel.org>
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

On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Parent MFD driver introduces child-specific private resources (fan configuration) via a platform data struct in a global MFD header, violating MFD separation and coupling principles.
> --
> 
> commit 85d716a1f91fa9e8e2f48479df8c7b07e0cf0279
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
> 
> This commit introduces per-variant configuration structures for the KHADAS MCU
> driver, adding support for VIM4 specific registers. It also introduces an enum
> for variant matching and a fan platform data struct to pass fan configuration
> to a sub-driver.
> 
> > diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> > index a99ba2ed0e4e0..7a9980ea63e7e 100644
> > --- a/include/linux/mfd/khadas-mcu.h
> > +++ b/include/linux/mfd/khadas-mcu.h
> 
> [ ... ]
> 
> > @@ -88,4 +95,21 @@ struct khadas_mcu {
> >  	struct regmap *regmap;
> >  };
> >  
> > +/**
> > + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
> > + * @fan_reg: register address to write the fan level
> > + * @levels: table mapping logical cooling-device states to raw fan levels
> > + * @nlevels: number of entries in @levels
> > + */
> > +struct khadas_mcu_fan_pdata {
> > +	unsigned int fan_reg;
> > +	const unsigned int *levels;
> > +	unsigned int nlevels;
> > +};
> 
> [Severity: Low]
> Does this struct introduce child-specific private configuration into the core
> MFD driver?
> 
> By defining khadas_mcu_fan_pdata to pass thermal cooling state levels, it
> appears the parent MFD driver will be forced to handle configurations specific
> to a single sub-driver. The MFD subsystem principles indicate that the core
> driver should only handle shared core resources, while child drivers should
> manage their own private configurations.
> 
> Could this approach create tight coupling where any new fan variant requires
> changes to the core MFD driver, rather than keeping those details contained
> within the thermal driver?

Agreed.  Why can this not live in the fan driver?

-- 
Lee Jones

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
