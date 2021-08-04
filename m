Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906AFC4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F9F60F35
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52F9F60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nQ/LQz/kyhFerqSYFBrb2q9s0pFnxnIy3AxXQ1aWBs=; b=FPrXJYft10WHFK
	oZdhJJ013Eyz/itXtIhSi4NwcOQWg2FGrhBEdRVo/WRSCGptT7ZzrrQ7U+uKso8L6DceNs5HlnqJ/
	pN52TvrmTaRtlVeGPSlIVZZAAQGJaplzcrrAEz/jyBGpRJxIypNDZJxD0m2VcUD6Jy9QAIEUJF5VE
	0ppoIq0Me+Jv7wU39I3oPjBoSh6vJgTIw3d17VPyysasUgUQMziw0xi57z7PoduGoBWiX2wxptSvy
	LmCR40mQLwcSuy2R+/VLmVaY+vU0R3EyZ26kwDSiWON1XFht6918EkATOXhrMZYjuqLadPxd56Uab
	4HRwiaDJmVo+RmiWPZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBO3i-007RXZ-8W; Wed, 04 Aug 2021 21:04:14 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBO3f-007RWw-4i; Wed, 04 Aug 2021 21:04:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id z2so6812597lft.1;
 Wed, 04 Aug 2021 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bRgs0NPKh4Mw3gD6S/OL3j4+WTypBMMGrOvKDK40lo0=;
 b=DbK0lw1BL42tvqX/clZcnrxev3xx9WcpJBvlbzNzaBPpeLoZ/66un1phJ20lQtU7mp
 3ovVprD8QmuPl5Ah3Z08GKO+RIJoHWc44HDT5iF3n812zdjNKCpywqzK1dYgOkeetMnZ
 aYlQSuwI2I3MXm8L+NuqZ7fYD8mQXyN83hsk0+4XMNtDPw7JelN0ENd9taOeknSMXtKY
 TfYQuFxzYrTd4+2qVKRQHmdRGOhCWliGByO9S8IUrk/OaQMnLJtZci9HA8rTyLfHDyPM
 nU6gl32lzkb5v0PXtk42himNI538Ad4HYhgm7Rw/UNe7a9986mYTW+jAGt52HCdCnTBV
 qupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRgs0NPKh4Mw3gD6S/OL3j4+WTypBMMGrOvKDK40lo0=;
 b=uS/hsyc7MZj6Qada0swCQXVcpDKmstp7q3inp4B9l6hsf14RFbecNtMhQC/q6OxIMn
 kE76jYzn+ksvGzR9QDozZc7/Jm2e+V4GmwBGFAGkDJDGWoqHHenlPr2n0akpavrb9B1B
 5KlQv6dI18EGbGN008DWPkSH5rZWubCRla96v8eeXGD8pJhogQl4ZnWLfYTU95E+J0eM
 XIUqliZWE9LWZLjylxaLiNd3J13xsINyNkuEEn0ScgsuwF7HRX4WrXep8ioO8MQOVRUD
 lojQiufZtbyxp4CrESRtBitDtLwUTDUmcwrgF7RyQmvN79sXs+e/9BBD3HJBs7YxFy1/
 D9+g==
X-Gm-Message-State: AOAM530/7QtoBaYtLt+gP2N2/cRBha464s7B0oAsgwfQ7B54oH4r3Ihm
 lQqVuA9vdyZBdBPn68B2x+9f+NfRP8cynMYlaxI=
X-Google-Smtp-Source: ABdhPJxCGu1zBOUwbc3sME3niD4I85/4MNH4QCPLuk+2DyDyECbtIPi3zXHPCvRxAGKTz1kM4LV2nrn+dLtUad1+fOc=
X-Received: by 2002:a19:c202:: with SMTP id l2mr812180lfc.276.1628111048404;
 Wed, 04 Aug 2021 14:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
 <20210717234859.351911-3-martin.blumenstingl@googlemail.com>
 <20210728175823.GA2766167@p14s>
In-Reply-To: <20210728175823.GA2766167@p14s>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 4 Aug 2021 23:03:57 +0200
Message-ID: <CAFBinCB0-bAa7Y+YhscczarGrGuio37F8vRyfW6U2DiiDAvr-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bjorn.andersson@linaro.org, ohad@wizery.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_140411_231420_B71277E9 
X-CRM114-Status: GOOD (  16.76  )
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

thanks for taking the time to look into this!

(I will address any of your comments that I am not mentioning in this
email anymore. Thanks a lot for the suggestions!)

On Wed, Jul 28, 2021 at 7:58 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
[...]
> > +     writel(FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
> > +                            priv->sram_pa >> 14),
> Indentation problem
The idea here is to align priv->sram_pa with AO_REMAP_REG0... which
are both arguments to FIELD_PREP
Maybe using something like this will make that easier to read:
    tmp = FIELD_PREP(AO_REMAP_REG0_REMAP_AHB_SRAM_BITS_17_14_FOR_ARM_CPU,
                                     priv->sram_pa >> 14);
    writel(tmp, priv->remap_base + AO_REMAP_REG0);

What do you think: leave it as is or use a separate variable?

[...]
> > +     usleep_range(10, 100);
>
> I've seen this kind of mysterious timeouts in other patchset based vendor trees.
> You likely don't know why it is needed so I won't ask.
unfortunately this is also the case here

[...]
> > +     priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(priv->arc_reset)) {
>
> Function __reset_control_get() in __devm_reset_control_get() can return NULL so
> this should be IS_ERR_OR_NULL().
The logic in there is: return optional ? NULL : ERR_PTR(-...);
I am requesting a mandatory reset line here, so reset core will never
return NULL
See also [0]

For this reason I am not planning to change this

[...]
> This driver is squeaky clean. With the above:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
awesome, thank you!


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.14-rc4/source/include/linux/reset.h#L227

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
