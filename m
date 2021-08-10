Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724E7C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 13:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C01C60F41
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 13:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C01C60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kd+bs22DTDl7wUfI0HPcWMcEksQrYEneV53eS42SOY0=; b=cLUtZTd+V8QAJn
	bwQHmSOAzfNeY4n4aZdOstnKgZTakqAi/igJ1KbW/lvWVcWsz7eNb4iGoOdqNZ/bYz9jgKgY6WF+g
	8yX0LWPj2Z78LxVVUHMXe1VQUobqpz5agl5qL8RMeLYnlmEQMGW47fGOW/V2FxMfuMP0OGy9fRM7h
	MLtlXaEn36Zf+jc3WZMxL31Psptg3pgnojRcILhWd0IpUaagerU01pTSD3O+o595D05RrJbLVzREY
	J3jG2k30cv5FRrVXVZOFTHSWkayrThCbFl5QeCxVIcXp/6cbmgfl+Q5/s5Mopyy6WfKGqXkv9B6MT
	Z7eAil2vb5qDcK0ss1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDRva-0040eT-0Z; Tue, 10 Aug 2021 13:36:22 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDRvT-0040aw-Tv
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 13:36:20 +0000
Received: by mail-il1-x130.google.com with SMTP id f8so15384182ilr.4
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAUdFxB/nuyD8e37Y4/cSwL2QvDgaa+OvSAdElWuutE=;
 b=FiZK96vERTuIAuikDBL6Ooey+jHySbQUeXP0EOKfNnW56g/S1noMxovebcwVi9LqwN
 UzgjVfebf964xNDcNAYat32UQQSCPcH29GksaL3Zu3+e2dnptQyDj1+yCCFbjLt30UEW
 F+JL2qXk/po7FQaNvm4Bdr+NzFoIF4nnjdP3w7JweA0GmZuqpDcOfRGQC7zTASYZe0w5
 LBvKNP+bP/me5K99z4dRX0bUTnnaTSPAxDhZrO8kBQbb9kaoKJAOjQlmUKBxfHeGKD4w
 0U1MOobCPHu+8/7CgqhIwQxQbGSjxk7lo2LhL7uh4tM8GZwykestDrEJMsYPfWLGxhKd
 5Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAUdFxB/nuyD8e37Y4/cSwL2QvDgaa+OvSAdElWuutE=;
 b=ZJF37gHcLEuXJvIVXVu2YoqxpiRXFB+LEJxgUcLVF6AR0ZAbtZX4uv/Yh7KPoWuM63
 tjNf1pPdeJ4A3acj7UiQNahDcMX6UINRUgixhJbPjY6AAnbpgpMOmhq8RX05neYa72PH
 eQ0hDDwG4nm78urltXG7xarZklquI5x9sFYRA9ppqDfyqcOELIO6J5NnQKp9lVro9Fy3
 kXDA8nNc/4cpSNqOq30AWQdWxALW9TaBWLdL32vHG9NM/e45AjbS5O7EQi59m6bPW/F5
 N78wwF+Q/BzImuT8R3SPSYeSMB1kI69kLgC7iA/HWk2HCnaiHhxUTS3c1R3897mMsh2x
 0gDQ==
X-Gm-Message-State: AOAM531zS91AA6uFdgQB7iXM4z4ZChA/E02l7Jn08oNFQThYoHuHXpOx
 eVIpgPlI9tzNGeppbHWL66a3mO1w75SgWIwhmvFBEw==
X-Google-Smtp-Source: ABdhPJyBPhpZAm9pK9za4X7LfFBGg8KHUTGO1WamLDRCyuqF8oJJ8n1kh+U1CckiFSzq7xCSoeMHJzoKQjEaocRKOfc=
X-Received: by 2002:a92:c5c8:: with SMTP id s8mr651292ilt.140.1628602574443;
 Tue, 10 Aug 2021 06:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
 <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
 <20210805161506.GA3205691@p14s>
 <CAFBinCCkOgkzuxZPby-rJeH7ei-G_khiStkX9Zs3w1u1RAd7_Q@mail.gmail.com>
In-Reply-To: <CAFBinCCkOgkzuxZPby-rJeH7ei-G_khiStkX9Zs3w1u1RAd7_Q@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Aug 2021 07:36:01 -0600
Message-ID: <CANLsYkyz5h9Qb+ZLFAtegDHYeQoOYeF_6GF7jYo8kxhF-pt66Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Ohad Ben-Cohen <ohad@wizery.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_063616_038486_7D2CAD75 
X-CRM114-Status: GOOD (  41.80  )
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

On Sun, 8 Aug 2021 at 14:37, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Mathieu,
>
> On Thu, Aug 5, 2021 at 6:15 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, Aug 04, 2021 at 11:03:57PM +0200, Martin Blumenstingl wrote:
> > > Hi Mathieu,
> > >
> > > thanks for taking the time to look into this!
> > >
> > > (I will address any of your comments that I am not mentioning in this
> > > email anymore. Thanks a lot for the suggestions!)
> > >
> > > On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > [...]
> > > > > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > > > > +                            priv->sram_pa >> 14),
> > > > Indentation problem
> > > The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
> > > are both arguments to FIELD_PREP
> >
> > Right, this is what I would have expected.  When I applied the patch on my side
> > "priv->sram_pa ..." was aligned wiht the 'M' of "AO_REMAP_ ...".
> >
> > > Maybe using something like this will make that easier to read:
> > >     tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > >                                      priv->sram_pa >> 14);
> > >     writel(tmp, priv->remap_base + AO_REMAP_REG0);
> >
> > I think the main problem is that
> > AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU is simply too long.  I
> > suggest making is shorter and add a comment to describe exactly what it does.
> AO_CPU_CNTL_AHB_SRAM_BITS_31_20 is used below and when looking at it
> now I think the alignment is also strange.
> For the next version I'll go with the tmp variable as I think it
> improves readability, even with the long(er) macro names.
>
> [...]
> > > > > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > > > > +     if (IS_ERR(priv->arc_reset)) {
> > > >
> > > > Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> > > > this should be IS_ERR_OR_NULL().
> > > The logic in there is: return optional ? NULL : ERR_PTR(-...);
> >
> > Ok, so you meant to do that.  And I just checked reset_control_reset() and it does
> > account for a NULL parameter.  I'm good with this one but add a comment to
> > make sure future readers don't think you've omitted to properly deal with the
> > NULL return value.
> >
> > > I am requesting a mandatory reset line here, so reset core will never
> > > return NULL
> > > See also [0]
> >
> > Indeed, I've read that too.  Nonetheless __reset_control_get() can return NULL
> > by way of __reset_control_get_from_lookup().
> I could not find where __reset_control_get_from_lookup returns NULL in
> case optional is false (which it is in this case because
> devm_reset_control_get_exclusive requests a "mandatory" reset line).
> Can you please point me to the problematic line(s) as I'd like to send
> a patch (which fixes this) to the reset subsystem maintainers
>

I am currently traveling - I will get back to you in a week or so.

> $ git grep -A1 devm_reset_control_get_exclusive | grep IS_ERR_OR_NULL
> drivers/remoteproc/ti_k3_r5_remoteproc.c-       if
> (IS_ERR_OR_NULL(core->reset)) {
> $
>
> I suspect that this can be simplified then as well.
>
>
> Best regards,
> Martin
>
>
> [0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227
> [1] https://elixir.bootlin.com/linux/v5.14-rc4/source/drivers/reset/core.c#L932

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
