Return-Path: <SRS0=o4E8=M4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC30C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 16:15:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08D061159
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 16:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F08D061159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5Wj/9AFG8UQMgnYa8AdvokdtHfT3HyKbbF37QnXzZM=; b=3IHBVH8I6/2qrR
	f+yNWIy0+OYD/c9z9etZbAMtHwgEazg+0I3p86LAWUrkjIs40Su5USi31BwKbjhzvXFKSYVaVGG6k
	NsJwyC7D+coW/SaD3+uG1G0p0sQgQNR7vh9vI9fdAy0EgfSxLOOJ4z2OTAX8PC2d5+xa4AycgaALV
	t37stWjpHLYU4pUpdjCsXxM8YURCEg9uIrqKa4CNykf0tbSTZK5PthZ6lJebTNi105xxH//Ge3Ajv
	9gi00AeiMXUQGPO7iZjR2qW8ym8s8Frg4GPtKBb90KSsAdj7PDINbzb6mijYZWNweSgiKd1oGKnee
	prhcY4AsosTrsooGgDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBg1Z-00ADuF-Dc; Thu, 05 Aug 2021 16:15:13 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBg1W-00ADt5-K4
 for linux-amlogic@lists.infradead.org; Thu, 05 Aug 2021 16:15:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so16075942pjs.0
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Aug 2021 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rEg1BTCMGoRn0sjT3rWRNvHqW2LLrM0T5szYW+iprlY=;
 b=JeySS7sbmS28Oav7betiVjBrAJfEXz59ZQYfOpmK1BIP4wTxeWcTPwIoEpmFlC09DF
 rbWKjGUpowb+0LbpjNn5vITPzDzxcWs0S/r9mrYuq96fFbuQu3KzHqoI4u9De7IL7Jvs
 nSXt1j0MdcvtfEvJ2l/mKCUUMgFZ2rEN9MeZQX+ADKPIj6qRP4sJlewmGiF7TEk8RQ/a
 retiI4410BAKlfZSLIR3R5vhs/IlPxB6QTl7vYhseT+ggiXZVkgwOyg3d2ZiTJxFsqso
 EglMHVeuXVWvstLFr8v5Mn7Y6gZEvE9BMv4IqnTVfWITZmwiYum5VyWqhDTC02DvqtCF
 Reew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rEg1BTCMGoRn0sjT3rWRNvHqW2LLrM0T5szYW+iprlY=;
 b=rVuxaIv4PjsP3vYzfd9nX5pNylNafzv2B4czVPnYcO2SG1O4r2hR6AO9jz4HF1TwRw
 U9T+hmevswI2femjhjt1NgAwMqAs1no1vyJB5uZfkxcSgTC+nRtzpHjE9vFbYzvRLHEV
 vzWGuPkzA07dgIJp18ec494QtfTKBo/FV0gdw44OxcSAqPUzmxC4OwfTWIja/8oPavbJ
 9BrXzD7vGWeqjN5a8G6je8RNhV8rY5osj6ENA73mKUQ59nj+LDGkWIdgsb4CLWhMi3jH
 XGn9pz5UUGl7ogkUkY4sD8ScdIiJFhR/WzkDq4UHJM0zk/X4BjMn+yKw1fOON2aFrcMo
 jBwA==
X-Gm-Message-State: AOAM530i/kGvO3kyYK4WjzTS7rfd+VhSec/MsnlQ3AV+TTKmgc6i7RjT
 PB6uDxrio3h2Y7aR+iyRJdwGdg==
X-Google-Smtp-Source: ABdhPJyKLIfgIfNToEP9h1rMAx3XgFEHEXDEu9ACbcrjUhWRC7r4z1IJzJr2ZOY+2Xn5CCrJoNVmVA==
X-Received: by 2002:a65:6099:: with SMTP id t25mr48063pgu.85.1628180109269;
 Thu, 05 Aug 2021 09:15:09 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id q17sm8753280pgd.39.2021.08.05.09.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 09:15:08 -0700 (PDT)
Date: Thu, 5 Aug 2021 10:15:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, ohad@wizery.com
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
Message-ID: <20210805161506.GA3205691@p14s>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_091510_772140_A6109E5F 
X-CRM114-Status: GOOD (  30.76  )
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

On Wed, Aug 04, 2021 at 11:03:57PM +0200, Martin Blumenstingl wrote:
> Hi Mathieu,
> 
> thanks for taking the time to look into this!
> 
> (I will address any of your comments that I am not mentioning in this
> email anymore. Thanks a lot for the suggestions!)
> 
> On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> [...]
> > > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > > +                            priv->sram_pa >> 14),
> > Indentation problem
> The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
> are both arguments to FIELD_PREP

Right, this is what I would have expected.  When I applied the patch on my side
"priv->sram_pa ..." was aligned wiht the 'M' of "AO_REMAP_ ...".  

> Maybe using something like this will make that easier to read:
>     tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
>                                      priv->sram_pa >> 14);
>     writel(tmp, priv->remap_base + AO_REMAP_REG0);

I think the main problem is that
AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU is simply too long.  I
suggest making is shorter and add a comment to describe exactly what it does.

> 
> What do you think: leave it as is or use a separate variable?
> 
> [...]
> > > +     usleep_range(10, 100);
> >
> > I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> > You likely don't know why it is needed so I won't ask.
> unfortunately this is also the case here
> 
> [...]
> > > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > > +     if (IS_ERR(priv->arc_reset)) {
> >
> > Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> > this should be IS_ERR_OR_NULL().
> The logic in there is: return optional ? NULL : ERR_PTR(-...);

Ok, so you meant to do that.  And I just checked reset_control_reset() and it does
account for a NULL parameter.  I'm good with this one but add a comment to
make sure future readers don't think you've omitted to properly deal with the
NULL return value.

> I am requesting a mandatory reset line here, so reset core will never
> return NULL
> See also [0]

Indeed, I've read that too.  Nonetheless __reset_control_get() can return NULL
by way of __reset_control_get_from_lookup().

> 
> For this reason I am not planning to change this
> 
> [...]
> > This driver is squeaky clean. With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> awesome, thank you!
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
