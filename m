Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E53C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 12:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeEPucBm5Iro+xpqCei8WwXeespNvGvJ+tIhN5yx9+s=; b=kUzcrbPdQ9JBxh
	bTu1v/0y2fuOvgDqYj3zVvkFbG1oRvUrgPXbNcmIJhLkaivC+AWIfJ/wBiksYhyPLXaC/8h11FO+r
	1QslOCkhrYjcUTcpevG5XmtXguwYUmrButa8797vmyEusuo09/YEfl87iLRaeKYE74jrECybobWcj
	MVjtcJxWy8SMntGPCsanU6jvZ8JaFEOHgj7MZh0HiO0B9Ss8YjEYuCExSVp+HW1bLOXxnrV++vwVb
	43uc7EHO2JEhIRsg7xidRF/D6Wz4iEnoC2SDRHeSklpUCVKFpv4xPgcvut96OeTXSCfuBSQ9xdgyq
	q1vIh+MH6zcIpij1/hWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcmHa-00GJnH-00;
	Thu, 16 Mar 2023 12:00:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcmHW-00GJmI-1s
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Mar 2023 12:00:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p6so777158pga.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Mar 2023 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678968028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rSfQj6qf5hqbbH6Yb4RUUM/hOgsbRlJUqWzSs+3HciA=;
        b=ppaBvSf/JMf+Z5eP3oeLfjKnDqPp+DUlDSEkXau1n5yr51mR+tdtfQl9T5S8ZU1Xle
         kHxYR/UIbuUpD8sZhCCay8PX5MWvTcP1q/IF1pPluAOptBBNtEi7SN84wtPynC67gXLJ
         oQXeOjUyCvu3rUcyCfcfyAsG0vZQfZfTMsUOez6ox5Lj5wOWZ7/P51jL8qg3dGQ6vHv1
         rsNcnWzJnizSTSZIKNIOtfTFXQj08Smu0aGEbTVVUGNO6T10+tgcbFoHLEAj7tOjEmCq
         vEytrfNMYr0v2rx3HmKSsfKqdgBSTdVD3dwLjDRAnnGOTLl/7t41FjH50ppTmSecUavt
         w5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSfQj6qf5hqbbH6Yb4RUUM/hOgsbRlJUqWzSs+3HciA=;
        b=3ItByQNETrS+O00In010Mo2WXQLfGCX9OR5Fq/YARj4PLS4kofhT3ZL5Qft3P04ZyA
         h0gExu0EyBspWjCOngcaucPEUHQWQ+IJmPoxtiT6eGjOlig/siXEP/uavfAK/7CRsDEg
         v4FeSqL2jqcfheXG5+a2UitDBFu2ycyCikbSbyR0by4QBvXvVY1GQSadAB7nmTxSabb0
         iWPxyDl11FBvAAq1nQjIsej+OGSfzPl4h5bDT3PVigNQUN8BLp3UUfBAFSFK52xbHYSk
         WIn+YwzvEFAqbuQ7tFRL8gfORlbVMEepkF8tFnw1rhKRFGXibAqW249EFxH/cIEnaNXk
         xjbg==
X-Gm-Message-State: AO0yUKW5x6xYpsHTAevgMSkinNjJxOwkApwyOt//KX1FRFK183FYdc+4
	We7xeMfxvo69+1CgWzxRyZfTSC6mC8foMZO0Tib7hg==
X-Google-Smtp-Source: AK7set9aAHWHhqsF8oIo2aM2SwH0P3/Rrctj8ihSNGbBLFeGDpf00ov6GVeTMhDk9tyc15DJR6TeTsmwsczapFdmxng=
X-Received: by 2002:a65:5208:0:b0:50b:188d:25bb with SMTP id
 o8-20020a655208000000b0050b188d25bbmr778758pgp.5.1678968027838; Thu, 16 Mar
 2023 05:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr> <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
 <b6971cd6-80f2-522a-64fb-82b126500010@free.fr> <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Mar 2023 12:59:51 +0100
Message-ID: <CAPDyKFqYK2bEbkZ7A=t-VYwmgSYJUGxm2Ew5-7CFeO741fB-_w@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
To: Heiner Kallweit <hkallweit1@gmail.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, 
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Pierre-Hugues Husson <phh@phh.me>, 
	Rong Chen <rong.chen@amlogic.com>, Yang Yingliang <yangyingliang@huawei.com>, 
	MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_050030_629568_A4EE6875 
X-CRM114-Status: GOOD (  32.98  )
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

On Wed, 15 Mar 2023 at 16:31, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 15 Mar 2023 at 11:20, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> > On 14/03/2023 20:45, Heiner Kallweit wrote:
> >
> >> On 14.03.2023 18:24, Marc Gonzalez wrote:
> >>
> >>> With the default power-up delay, on small kernels, the host probes
> >>> too soon, and mmc_send_io_op_cond() times out.
> >>
> >> Looking at mmc_power_up() and how power_delay_ms is used
> >> I wonder what you mean with "host probes too soon".
> >
> > Hello Heiner,
> >
> > Thanks for your interest in my patch! :)
> >
> > I should have added a link to the thread that led to the patch.
> > https://patchwork.kernel.org/project/linux-wireless/patch/c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr/
> > Start at "I have run into another issue."
> >
> > Basically, I have an S905X2-based board.
> > I built a small kernel for it (with only a few drivers), that boots really fast.
> >
> > mmc2 (SDIO controller hooked to WiFi chip) would not probe at all,
> > unless I added lots of printks.
> > Basically, calling mmc_send_io_op_cond() too soon after the controller
> > has been reset leads to the CMD5 request timing out.
> >
> >
>
> I tend to agree with Heiner here.
> This patch is backing a contraint only reported on your design in the
> driver of every AML SoC supported, for every MMC controller.
>
> I think you should look first in your vmmc and vqmmc regulators and
> their setup times.
>
> "fixed-regulator" have properties which might be interesting to you,
> like
>  * startup-delay-us
>  * off-on-delay-us

If the problem is regulator specific, this would be the correct thing to do.

Although, if the problem is pwrseq specific, like that we need a delay
after enabling the clock and asserting the GPIO enable pin for the
WiFi chip, then we have the "post-power-on-delay-ms" of the pwrseq
node to play with instead.

>
> >> Are you sure that the additional delay is needed for the Amlogic MMC
> >> block IP in general? Or could it be that your issue is caused by
> >> a specific regulator and you need to add a delay there?
> >
> > The eternal question...
> >
> > I have only one type of board. (Actually, I have a reference design
> > that is slightly different, so I should test on that one as well.)
> >
> > In vendor kernels, they add delays to the WiFi drivers.
> > Maybe they have run into the issue, and they're just fixing the symptom?
> >
> > Default value for ios.power_delay_ms is 10 ms.
> > msleep(ios.power_delay_ms) is called twice in mmc_power_up().
> > So raising the delay from 10 to 20 adds 20 ms
> > to the latency of initializing SDIO/SD/MMC controllers.
> >
> > Would you be willing to test if the problem manifests on your board?
> >
> > Regards
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
