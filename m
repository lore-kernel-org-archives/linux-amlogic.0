Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA215C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Nov 2022 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pux6SLhMgtIcSNHs6AtHj3bcd05WxWyTT+Zog2rIvM=; b=fB5bKuHwcjSBzu
	aA6hMXzq56SR87MfDifci4MpP73gg1k5l1JYnM+n7iSsvpncXsQxzncGXAlPWvedrQUydHS0CBZyq
	XhQcuZ0LC3g4k/bPAhdJfHqX/jwnBcC57L/SESr1EKgg+XZvxeF/vaoE86ZFRjQokTIrev2NUGGbZ
	mqaWaHzmYdUQ+0KTRH6QcS+0OmdT4/AEQjj9dr0eNxZhxGcKCFyxi/R3gNAplxos3TREdhbMJnO06
	UmbI43n9Y1wnwFE/O9KzD6SXrmkPjciNSGxlGAW7+/W5yZbTzMdeN/M5A/HahXtziz7IpxaU/B4OL
	0HAFw2KUOHpM6nynFSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouh5S-0057NX-F6; Mon, 14 Nov 2022 21:33:50 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouh5G-0057Ll-6C; Mon, 14 Nov 2022 21:33:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id z18so19205153edb.9;
        Mon, 14 Nov 2022 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKfZHCbbq2pbj5ZCKNOXHjHou+CBwHckbUbOdThGkZk=;
        b=lJfxyhuW1VKX/07EXNu42iSxH+OmYQe5UV10zPkKDz50jdMFRoarCeseVuO8CUyrb4
         yIqkG7eanrwUklwAHftXYmGYeCTNNIvmljt58CzTKAi2dyzmNTODcdd07zHTGxsFCZ4w
         LZXmcB7yTVITKLPIVl1eodewAiPXamreg5zAI3wWp068c/9bj8M//J2FBWcMskPuFaBw
         uLp3iaivBg+TtLMTWD4TbiHa52y5cVLeAkuqygomMd0wnqVKEMxQbZhiH4UkPDoLtK8w
         9Ql+WgvGduqDlC4CPFFK2hdwPGnUkcGLqV+rXDe3/G6ZbTWLJZjhUmykEGHVLK/+gSfM
         kAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKfZHCbbq2pbj5ZCKNOXHjHou+CBwHckbUbOdThGkZk=;
        b=p/uU3McyDGJ0P6joFzFthGrIUtULUMxb9RBBfFtsyWmdKwfShZO48qaBU69D+A2vOR
         R44hCoJDuMwqAmISTfV1tD0+L+ruutcuZL6TcZm8SG03waQyEU57+hOlHVhrxrlohWmn
         1aE00ONbf9klqVkaNDiCNHNzEGUGrWzFaSgKjhUsDRxXcPgKGGPSAjgjCD6838bNe7zS
         R9xpRhJwOj17MiVWETFR9NzhBvtd933O6pEzynXdZdeVEaBtT7wCD7cQbBo68UUbeTmS
         9r8r2I6UG7VeWdi901n8W0ZnpU1Bum0VH2zJXZFqc/W2BfqejazI7xptuinR5asIBL9I
         J+xA==
X-Gm-Message-State: ANoB5pntLvCLmrXUon/xKNzGy6J8KOAsf4opyb63IduY9kuJJyFe++zI
	mGU7RWXZI34CImE0jDGcPeQ=
X-Google-Smtp-Source: AA0mqf6AAIdOaVTwo9dnJzgZOFGDw+mo3rfN3f53F3NHXaHAbqTHoeeHbU7uD3L4MQaRfmOlTwl0Kg==
X-Received: by 2002:aa7:da55:0:b0:464:718c:b271 with SMTP id w21-20020aa7da55000000b00464718cb271mr12581926eds.287.1668461614528;
        Mon, 14 Nov 2022 13:33:34 -0800 (PST)
Received: from ?IPV6:2a01:c23:c14f:9a00:5c5e:411:c829:d51c? (dynamic-2a01-0c23-c14f-9a00-5c5e-0411-c829-d51c.c23.pool.telefonica.de. [2a01:c23:c14f:9a00:5c5e:411:c829:d51c])
        by smtp.googlemail.com with ESMTPSA id l27-20020a170906079b00b0073022b796a7sm4680770ejc.93.2022.11.14.13.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 13:33:33 -0800 (PST)
Message-ID: <fedda473-3233-4dfa-e2a3-3f22c2b894e8@gmail.com>
Date: Mon, 14 Nov 2022 22:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Peter Suti <peter.suti@streamunlimited.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221114093857.491695-1-peter.suti@streamunlimited.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: fix SDIO interrupt handling
In-Reply-To: <20221114093857.491695-1-peter.suti@streamunlimited.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_133338_282431_BE9CE1FB 
X-CRM114-Status: GOOD (  21.09  )
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

On 14.11.2022 10:38, Peter Suti wrote:
> With the interrupt support introduced in commit 066ecde sometimes the
> Marvell-8987 wifi chip entered a deadlock using the marvell-sd-uapsta-8987
> vendor driver. The cause seems to be that sometimes the interrupt handler
> handles 2 IRQs and one of them disables the interrupts which are not reenabled
> when all interrupts are finished. To work around this, disable all interrupts
> when we are in the IRQ context and reenable them when the current IRQ is handled.
> 

IIRC I had a similar/same problem in mind when discussing the following:
https://lore.kernel.org/linux-arm-kernel/CAPDyKFoameOb7d3cn8_ki1O6DbMEAFvkQh1uUsYp4S-Lkq41oQ@mail.gmail.com/
Not sure though whether it's related to the issue you're facing.

> Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")
> 
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213b47..972024d57d1c 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -950,6 +950,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	struct mmc_command *cmd;
>  	u32 status, raw_status;
>  	irqreturn_t ret = IRQ_NONE;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&host->lock, flags);

Typically you wouldn't have to use _irqsave version in a hard irq handler.
Or is to deal with forced threaded irq handlers?
Do you use forced threaded handlers on your system?

> +	__meson_mmc_enable_sdio_irq(host->mmc, 0);
>  
>  	raw_status = readl(host->regs + SD_EMMC_STATUS);
>  	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
> @@ -958,11 +962,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  		dev_dbg(host->dev,
>  			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
>  			 IRQ_EN_MASK | IRQ_SDIO, raw_status);
> -		return IRQ_NONE;
> +		goto out_unlock;
>  	}
>  
>  	if (WARN_ON(!host))
> -		return IRQ_NONE;
> +		goto out_unlock;
>  
>  	/* ack all raised interrupts */
>  	writel(status, host->regs + SD_EMMC_STATUS);
> @@ -970,17 +974,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	cmd = host->cmd;
>  
>  	if (status & IRQ_SDIO) {
> -		spin_lock(&host->lock);
> -		__meson_mmc_enable_sdio_irq(host->mmc, 0);
>  		sdio_signal_irq(host->mmc);
> -		spin_unlock(&host->lock);
>  		status &= ~IRQ_SDIO;
> -		if (!status)
> +		if (!status) {
> +			spin_unlock_irqrestore(&host->lock, flags);
>  			return IRQ_HANDLED;
> +		}
>  	}
>  
>  	if (WARN_ON(!cmd))
> -		return IRQ_NONE;
> +		goto out_unlock;
>  
>  	cmd->error = 0;
>  	if (status & IRQ_CRC_ERR) {
> @@ -1023,6 +1026,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	if (ret == IRQ_HANDLED)
>  		meson_mmc_request_done(host->mmc, cmd->mrq);
>  
> +out_unlock:
> +	__meson_mmc_enable_sdio_irq(host->mmc, 1);
> +	spin_unlock_irqrestore(&host->lock, flags);
> +
>  	return ret;
>  }
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
