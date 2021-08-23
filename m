Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B94C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 15:30:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C3D613AB
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 15:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1C3D613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mkk7x7QhvLinzANl7CWX/8e5ZjtUEYMjzIRiuA2Q9YA=; b=DqJKHaKAlKk/5M
	dGK6tfGA7i/JbTFl9P2SUsEVImWExclNDG0jc8Xjc+vW7so2PkO4f2rB7Bm9kJhZjPQ1hcpfHvppI
	jdv2h+ulmi7xRg+oDN1q/M7/Dt1VoTqTphvr8GTnX+OCLHkoEbboesO78d0crIVpIbroxUYfKO6w/
	nwOhSUgwvPWgoNJOc+eGlg/CSb86wvItU10mpfi0RaNu1AEI1SMg2diSC0yeyxfehlA/eBbYwb4jg
	my6OGbqpfE1LdDKOJyJY2k9HUMVpaXcoPmifu9a05/CqFz5Y0R/+gk2WzSB2OPTopRMS6XCUwv2Yb
	yQR1FaXzBSLYjkI3/eXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIBtc-00HSa2-MT; Mon, 23 Aug 2021 15:29:56 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIBtH-00HSTp-Tx
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 15:29:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id 18so15697134pfh.9
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vEaoUziBq3E6zdwPq0ckEpXVtz+BXh6RGLuJML224RM=;
 b=R1zKGChQimXrdBmVgI9Yg84uCfa/0GDmxaEIaiwyz1EnBS/laU7lveYFQIF/zReUWK
 9xYFzvI9mL2SgpPDe3K8n2UaUoAjLsUmyJyyx7RgjeievBH3qw7jD5dgZ4wx75bnKY0p
 ReTmKrg/Z9DAvdfl7ymFeVlu2Pf4A5M9oGEuJRFo5kAnnkTJ6tnPGH6bHd3T+rbg16a5
 BkCBX4VRt+y15qgq5yIMoguvdYlq1nfYXEaBTgtjU0UVuvIj0a3IRU3/OxwqVevCsy7y
 ClCO/O0E6c2hTSy7hO4U5D049p/+YUlHBvuzX2agZ57rzp9a+SQHas7Wd/PvQJi25LAg
 guSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vEaoUziBq3E6zdwPq0ckEpXVtz+BXh6RGLuJML224RM=;
 b=SrYek6qxYvKHWEl8pRktrOxgSGHsJrH0/4Sc56a6n2LrVL9XD6ULERpH3ln5dX0yIS
 7CNOezpyS9wMBKI/rGaFlE5E3I4zzqN8WhoSqPvAlyf7wIG4XOoFWGbUemOaNXAmUg+2
 nsriZP8LG+zmGCRUmChUa9qvGp/kVhHOr4MuJ6WvoxDEE4WbhXLr0JPZKbsGxwxSwJUs
 K87IfPFoq3zhxw7NVXNRDYWsNi4fiB6Auc3uLsLrvJz9PqxUUm1/OFNKecXQZd02Gr4r
 zOFAxP/70pUFTnZBrEE2fLtqz39J+SAx3RbYamagPYDTY4yzcAT6q8KTz+EI7Y6RVg+y
 qyEg==
X-Gm-Message-State: AOAM532WwnJqGbPfUllvTcarzvNwR7B60aTadmCeJ9xvO/cLIWxnOyUZ
 mXuHpkXCe5VePuZHzyAOJADUpw==
X-Google-Smtp-Source: ABdhPJzQAhNqugUUs6GMowMfc4TjiW/1LoOtbJAtnbpyMIjp7QrKeuxyQDwOXMzT37JWwkO6ncyjsw==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr34979881pfl.51.1629732573011; 
 Mon, 23 Aug 2021 08:29:33 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id p10sm15697567pfw.28.2021.08.23.08.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:29:32 -0700 (PDT)
Date: Mon, 23 Aug 2021 09:29:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, ohad@wizery.com
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
Message-ID: <20210823152930.GA595498@p14s>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
 <20210805161506.GA3205691@p14s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805161506.GA3205691@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_082936_077201_45DADD9D 
X-CRM114-Status: GOOD (  37.45  )
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

On Thu, Aug 05, 2021 at 10:15:06AM -0600, Mathieu Poirier wrote:
> On Wed, Aug 04, 2021 at 11:03:57PM +0200, Martin Blumenstingl wrote:
> > Hi Mathieu,
> > 
> > thanks for taking the time to look into this!
> > 
> > (I will address any of your comments that I am not mentioning in this
> > email anymore. Thanks a lot for the suggestions!)
> > 
> > On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > [...]
> > > > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > > > +                            priv->sram_pa >> 14),
> > > Indentation problem
> > The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
> > are both arguments to FIELD_PREP
> 
> Right, this is what I would have expected.  When I applied the patch on my side
> "priv->sram_pa ..." was aligned wiht the 'M' of "AO_REMAP_ ...".  
> 
> > Maybe using something like this will make that easier to read:
> >     tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> >                                      priv->sram_pa >> 14);
> >     writel(tmp, priv->remap_base + AO_REMAP_REG0);
> 
> I think the main problem is that
> AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU is simply too long.  I
> suggest making is shorter and add a comment to describe exactly what it does.
> 
> > 
> > What do you think: leave it as is or use a separate variable?
> > 
> > [...]
> > > > +     usleep_range(10, 100);
> > >
> > > I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> > > You likely don't know why it is needed so I won't ask.
> > unfortunately this is also the case here
> > 
> > [...]
> > > > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > > > +     if (IS_ERR(priv->arc_reset)) {
> > >
> > > Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> > > this should be IS_ERR_OR_NULL().
> > The logic in there is: return optional ? NULL : ERR_PTR(-...);
> 
> Ok, so you meant to do that.  And I just checked reset_control_reset() and it does
> account for a NULL parameter.  I'm good with this one but add a comment to
> make sure future readers don't think you've omitted to properly deal with the
> NULL return value.
> 
> > I am requesting a mandatory reset line here, so reset core will never
> > return NULL
> > See also [0]
> 
> Indeed, I've read that too.  Nonetheless __reset_control_get() can return NULL
> by way of __reset_control_get_from_lookup().
> 

You are correct, in your case checking for IS_ERR() is sufficient.

> > 
> > For this reason I am not planning to change this
> > 
> > [...]
> > > This driver is squeaky clean. With the above:
> > >
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > awesome, thank you!
> > 
> > 
> > Best regards,
> > Martin
> > 
> > 
> > [0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
