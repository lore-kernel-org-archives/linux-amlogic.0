Return-Path: <SRS0=9aIX=M7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57155C4338F
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Aug 2021 20:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A1C60F42
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Aug 2021 20:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A1C60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPc36rEZ8QCTIvZMTDVVBRPpAU4pecjFTDqSvldw6ls=; b=JapF+xAfAT5zRd
	xhA7aQ7rnnP+DlGZGOG0Pa4riKgAiVRg3ozaacaH6ywRTA24C7outOgFozuow3eF8mXulClDDm6Wn
	1pr134CICS/ij4jY5kEeQd6RclwhyAYEadqfWBqamHaCoTmAhEeoCLOsNYq6spxL/X/rIgQCq2F7Z
	KleEfahdgd6kO2otZ3ytVm3Al86fNd3GNSfgJoLcacZWaVWA2TwDOxungrMfalGnulGW4JZyGzFp3
	J1iD7cO2H2HRRu0dtxsu8pORM4M8SY8rBypWPYsemyPeqvWpMOKpJQxfyetDwP1aapshZ5AajZutT
	m9f89E6uh0Y9D5ZQRTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCpXl-00GSYe-Mj; Sun, 08 Aug 2021 20:37:13 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCpXj-00GSXo-2u; Sun, 08 Aug 2021 20:37:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id w5so1144090ejq.2;
 Sun, 08 Aug 2021 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XsY1naXGPpmVYSXrwp+yqNB1LAnbf0RuN1r5nzhLAKc=;
 b=YpoIJarzT8405VxE8WC4sxtHg96SjtT5fNSHqFIQzaLuckx/pMl6h6p1S0I7ff24IA
 aBHvrn1OEKjvBfZanjTydEWhvbgIm4NrkFvvcEITpHJN2iAbCEbgmyeuSLW/lxUtqsK1
 HLpWOeg+qpCe3q+IX0SvIlbkcG5jad8OW0NX1dle4KmlL7ID5U1NQjVp5bN1PiXy11YP
 wnbQnnfPSRC/vWxBLU7DcvlcIKD+ckvT0uPRHnxorXsWBc3tB1tmJMKwLv78V6CbmYP5
 E0pX0bF5pUfLslrqs/8GeIpU9yFLPcdz5JKvoVWmIt/jdcwiofp4w2B4/pq9L406Pi5C
 dkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XsY1naXGPpmVYSXrwp+yqNB1LAnbf0RuN1r5nzhLAKc=;
 b=YK+m49XCV7k7HXjWmvStKsC/lFbdzDITWc1pKtRFOyjs9j8yFU210aZRjUdXL+Enm1
 V2qqKjdD2eEg+xWvoG6xwypzgrFPceTr/9wSqf7PMWtIiZEvXvMzYvqJvCi2LBjxyK5Y
 jLMpD5XJdYZbgArFNqtofOfH7nE6njB21Urn7NpHpKETXH4Z5kFcNuBwaBM/DGH4QpDJ
 yHrUu2qfXxAfhH6Koso4Jjc+ad1aHVwnKlUGDX/Qd09/QAn3blEwZufRdZ9TwRaAHFbW
 mcZZfZVWr/4JeWvjBOZHx9zJLOBezRsZ1VLb3o6z5di7avtmSjeP2wRhoG3k3S48q5vP
 EsEw==
X-Gm-Message-State: AOAM530fjdA+luYOfFu5AJ84S6OvqkVJtHVAV+VH3jCfZmi3OjF21ks4
 GZW0dp0EHNedNxqR6kpp2tn+Gxt2tTcR0YwOb24=
X-Google-Smtp-Source: ABdhPJyPS9gMgKESOwyiS54NnGzpCieUBziLcUFhhc9CCfq11oy5PHyTJqO5wmW0KuUFc3nQOb342DcKuvScoSJXQN8=
X-Received: by 2002:a17:906:b0c5:: with SMTP id
 bk5mr19137983ejb.428.1628455026119; 
 Sun, 08 Aug 2021 13:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
 <20210805161506.GA3205691@p14s>
In-Reply-To: <20210805161506.GA3205691@p14s>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Aug 2021 22:36:55 +0200
Message-ID: <CAFBinCCkOgkzuxZPby-rJeH7ei-G_khiStkX9Zs3w1u1RAd7_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bjorn.andersson@linaro.org, ohad@wizery.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_133711_195754_61BEFFAC 
X-CRM114-Status: GOOD (  35.32  )
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

Hi Mathieu,

On Thu, Aug 5, 2021 at 6:15 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
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
AO_CPU_CNTL_AHB_SRAM_BITS_31_20 is used below and when looking at it
now I think the alignment is also strange.
For the next version I'll go with the tmp variable as I think it
improves readability, even with the long(er) macro names.

[...]
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
I could not find where __reset_control_get_from_lookup returns NULL in
case optional is false (which it is in this case because
devm_reset_control_get_exclusive requests a "mandatory" reset line).
Can you please point me to the problematic line(s) as I'd like to send
a patch (which fixes this) to the reset subsystem maintainers

$ git grep -A1 devm_reset_control_get_exclusive | grep IS_ERR_OR_NULL
drivers/remoteproc/ti_k3_r5_remoteproc.c-       if
(IS_ERR_OR_NULL(core->reset)) {
$

I suspect that this can be simplified then as well.


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
[1] https://elixir.bootlin.com/linux/v5.14-rc4/source/drivers/reset/core.c#L932

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
