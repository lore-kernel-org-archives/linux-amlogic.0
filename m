Return-Path: <SRS0=GVd1=7U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46507C433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2020 20:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175342074B
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2020 20:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flaQjfLe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XA88GXBC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175342074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MCq1OneXDjpp2ENqF+/KobHY+Tqrr7CDHdmFbol4oDo=; b=flaQjfLeJNwhr60iT4+a5qrnMh
	zzOlPg4w3hQWADKkZe+s1tFq/NWunKndv2gdo+9Nugmu2q8zMyfDkl8cA+J6ySfQlcbBFR3andC1G
	DAv3cfRHe3fUEPhYGLjIETrI4Tyy3jB8jVsQaP5a06r+IiU30W3wYp4oul1ILr0Nsjpq6IN94L3HH
	H5mUVWMm1lQIZ6TV5fb2vk05aUo6jjvgxapMh2WwCOTnY95xTOGyvftJmpsltT9xndVXuUW5862i9
	TKutJMLX6sMwFwc+p2GTAoNvZx7L/YzMvg1C62kf0paB53Y3Xg+ZjhHbMg6daM2WVCnqZ/T8E/SKW
	y0TpTBDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ji28a-0004ih-UZ; Sun, 07 Jun 2020 20:43:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ji28Y-0004i9-8M
 for linux-amlogic@lists.infradead.org; Sun, 07 Jun 2020 20:43:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id q11so15278235wrp.3
 for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2020 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=lZvTa+fi3q1fHKnC1NQ/5Z2Ndj1/0QXtbAGtm+dp8V4=;
 b=XA88GXBCMwRC8ua5Zu1G1aq1EuoHHamyB7XfFDreblLDNy9oepc7VRQ+RnWPezXhWu
 F/sI2GLdvWzRd2LxwU/Jh7tU/CChLMG1Oz3GnckfQo2g/B6LZUrz4IbKP5TR7QtIVryP
 y009CvtbXFo+0gbUCpZ3WN7kG1sYxQuZ8XxK70kTohvaJirXKC7V5/0kkvEcW9jYi2eS
 VZoAXCn1itpeEVSF8tIc0A3xYlXfV8sJN9jSgNaKkFxx6bfxFx3kCWUalLQnwP+M/9K8
 DbYTUCE+VM14CJcRNr9eEBr+Fy6SoV9OEf9k/l86n4NH1qcTy4jSFhjhs/6CUxOfnA9d
 tQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=lZvTa+fi3q1fHKnC1NQ/5Z2Ndj1/0QXtbAGtm+dp8V4=;
 b=mKtQjWe4apyi/Ddoj5NS7ABpyGexUzXjDcCCeshiLzPKLHUUtrmuAUr8AbSUYx34MF
 xrsIsdREpefOqHaVm3TeqQAkZd93wI5ek409J/dFnwCoKLLr7MeFXcPF6ELMiQoEIIqW
 Q812PDa6UV1oytFDz22LtSCtT2dQrjQ+rSKPRYLKFCpxZOZXs1BDDNjsN1Yp1IvVIJa9
 I/q1J+oHfLpgJ69kz69rnfbAH5FTazD3E4o0UCgXaFTF0g3xvb1ypchgarfeQ7mysM5o
 RL9MQ9aC9M5WRymJd1FxSenEHDQ/l/tbni5k2l9zDy6wHpfy/gU1y9ZysRhRJ88B5b4n
 yiWQ==
X-Gm-Message-State: AOAM5317YxZu1LLePJTkKW02zutl1mZlKjZwL4wsVG3+pmmzomRBm8Gk
 3Zhryh+TEvpUTQ7W7bTf/ehCDA==
X-Google-Smtp-Source: ABdhPJwRg2AKDExNqQAafPVcv9hmJIPslCiSScJq+j3/O2XbJjP3NCsn9vcvUZhDPos5i3JhgsynoA==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr19363506wrx.141.1591562600771; 
 Sun, 07 Jun 2020 13:43:20 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id j4sm21175221wma.7.2020.06.07.13.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 13:43:20 -0700 (PDT)
References: <20200606153103.GA17905@amd>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pavel Machek <pavel@ucw.cz>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
In-reply-to: <20200606153103.GA17905@amd>
Date: Sun, 07 Jun 2020 22:43:18 +0200
Message-ID: <1j5zc2k3o9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200607_134322_295861_CB82E75E 
X-CRM114-Status: GOOD (  10.12  )
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


On Sat 06 Jun 2020 at 17:31, Pavel Machek <pavel@ucw.cz> wrote:

> free_irq() is missing in case of error, fix that.
>
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 2e9b56b29d31..b2e867113226 100644
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
> @@ -269,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Take memory arbitror out of reset */
>  	ret = reset_control_deassert(fifo->arb);
>  	if (ret)
> -		clk_disable_unprepare(fifo->pclk);
> +		goto free_clk;
> +
> +	return 0;
>  
> +free_clk:
> +	clk_disable_unprepare(fifo->pclk);
> +free_irq:
> +	free_irq(fifo->irq, ss);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
