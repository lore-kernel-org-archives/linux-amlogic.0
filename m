Return-Path: <SRS0=Mql2=42=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6FC10F27
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:46:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE81721D56
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fl0rOEPk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h5JVtoab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE81721D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F+xWNZ1kHvZ3vEiN2GKgnnj/8Fq+7eQ/o7BB1daVEIU=; b=fl0rOEPkABFvBn/nKfcbQwX0Ub
	ny+fTwMLk8erekC1vJF2iqgNlMPxctpTFmE1AGqAGB2x3USW5X61E4UCRT4r1u29G0is+gLF/D7jd
	msz7axFVedBeyZdqo7PbVlnakETxQWzJHzPFmZ5AbUIcJjLpXyf87DzXz7yo7dQ87LkvcIgmeO1Ob
	sseG91KWtRLweEAgMQy0WpTzfAyXqMmZy46XZO8eUNJlRhQHCjUor2XyOhQnlkDVeX59rqt7lplhx
	RqI9Ihu+z05ckorTMdvgmS1++kLoNDTpIS7miKW85IVyx1vHrDj+6P06V+RNnwdSSLHWkefoze4wu
	Rf8K7HGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBLXx-00060Q-NJ; Mon, 09 Mar 2020 16:46:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBLXt-0005zK-ON
 for linux-amlogic@lists.infradead.org; Mon, 09 Mar 2020 16:46:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id m3so231266wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Mar 2020 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=FcE2MUIl7tIBAlEEfVJMghDlrIoIaJrggtMzoLGQxtU=;
 b=h5JVtoabxOIa7/d1qTmT5zFHcuKiW3eFaUaAw56br6NvCKb7Xxtj2MSf6wc1+OXmHg
 /vHfQJh47n8iC0us2CSsP4Ac5/jxY5ma3lZIso7eZu16F7hYSdqcZz5xxOzmP3B3vzkS
 ubFLyWhRvA1Fre8XovsCqZ1AmD/HbIF/+hO1NUM1YjF1v7IvG2HmaTieZwBq8MvtlBHN
 ecPyfGyotLu7BxZJuWzYcWNxjedKrUDAoJrNDjT3Us+RfsOkXstzb2J9eba7kR5IFEF+
 a/lX1j5LS2op0Ft+pTfa05PHD3Fh3FD+p2XsC2zfjUdUTPV1pW+cmN5+2Na+99LWlIcX
 zBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=FcE2MUIl7tIBAlEEfVJMghDlrIoIaJrggtMzoLGQxtU=;
 b=UHffs4X/VkJyFSH+epxmerosKVV0NZyCTy3akjrLvhnzMm/BwaNwapM1fh6I/T7fGe
 TblaQRM6iuj4sJ6pi6/iZ8Lf7M+oiqIQXFRqgXWJmon+Oged4BSrQUMqVno9/AYtWJZf
 pdxgofX14rbimEmMFy+yxFqZ3qlj6tLj2HfTiT+TnzaOX3vZk+aui+SdmDGgUkLgZsTq
 3/AY7Y7Rxu4MNHWc1vVem1+pyYeDqvI2Q/Pekjah2dMaiXJhT2K4g4b6fcICsb4wW2Jx
 qCkfyrsXCmMf6c+c9QV+F/SQHnEYtWIVqm5Lslua63YXwCTJvaZALnhDcAQJOfgif5xs
 MGMA==
X-Gm-Message-State: ANhLgQ0Bvr/AMlTyP0fbRXL39OCENQvRMjOOT3nukuuiyjnfGh17sMHy
 jsQ/ysaflgXI29TE6sNqJx6T/g==
X-Google-Smtp-Source: ADFU+vt6CRz1E/i0REBSGntcAZc9hZwMe0YmueP+IrwFjMtabYMdUF0pqSki2o/pSjJ8sm/pLgl2wA==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr150270wmn.47.1583772382078; 
 Mon, 09 Mar 2020 09:46:22 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e22sm110182wme.45.2020.03.09.09.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 09:46:21 -0700 (PDT)
References: <20200309162912.GA21498@amd>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pavel Machek <pavel@ucw.cz>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/meson: fix irq leak in error path
In-reply-to: <20200309162912.GA21498@amd>
Date: Mon, 09 Mar 2020 17:46:20 +0100
Message-ID: <1jeeu14gtf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_094625_938309_0BCA5CB3 
X-CRM114-Status: GOOD (  13.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 09 Mar 2020 at 17:29, Pavel Machek <pavel@ucw.cz> wrote:

> Irq seems to be leaked in error path. Fix that.
>

Thanks for fixing this.

the Fixes tag is missing here.
Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")

> Signed-off-by: Pavel Machek <pavel@denx.de>
>
> ---
>
> I noticed problem during -stable review, and don't have hardware or
> ability to test the patch. Handle with care.
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 2f44e93359f6..fbac6de891cd 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Enable pclk to access registers and clock the fifo ip */
>  	ret = clk_prepare_enable(fifo->pclk);
>  	if (ret)
> -		return ret;
> +		goto free_irq;
>  
>  	/* Setup status2 so it reports the memory pointer */
>  	regmap_update_bits(fifo->map, FIFO_CTRL1,
> @@ -270,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Take memory arbitror out of reset */
>  	ret = reset_control_deassert(fifo->arb);
>  	if (ret)
> -		clk_disable_unprepare(fifo->pclk);
> +		goto free_clk;
> +
> +	return 0;
>  
> +free_clk:

This label is misleading as it won't free the clock but turn it off.
how about 'err_rst' ?

> +	clk_disable_unprepare(fifo->pclk);
> +free_irq:

and 'err_pclk' here ?

> +	free_irq(fifo->irq, ss);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
