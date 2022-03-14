Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB5C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Mar 2022 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YtGVV8ia1VtXlMRt+bVv7OnS+DwpC13oDls/GH4xUE=; b=buryEjfEuK3rZD
	aQbUM0OGyH4O+smuZFC3GFIBpJIwxxQxtZPhIFRl6Uz1g9kE72wD8EYJBeo3pCyzpQBQmv7+dDrJ7
	pc3xQohMFG/jzTDViBRRzCk9+LniM739THd0s4zGAoXjue9TfuDV6emLHcobR2jQ7Xmg0eMq50BeJ
	G3yvd0q9Wdw8q0tPMSbN3UdNqkhF92lYnlC0AZd+LYYOHkeHh/Wo9AIxnMRBFxj7Z9a/fsvppfZ97
	jOVA0MswQHvUgmIrwtMbKrrR67XF0A0q/pOG4+tGv7digMTiOoDAPfkFpC5JZkKbw1GR+dnsGLnDO
	3QVsVLJTWYsfp3VbMd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfur-004PsZ-Hc; Mon, 14 Mar 2022 08:18:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfej-004IQZ-A0
 for linux-amlogic@lists.infradead.org; Mon, 14 Mar 2022 08:02:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id p9so22429181wra.12
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Mar 2022 01:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FCTa1MEHZ8RflaCaL+Kv3IB7oupUyUxIYhWpI7cZElk=;
 b=CPYvO7CXsDtRHFv+aDgUHU3k7MoLfFq17gtgRZR4JdQQpMZli8AiYNEUu+PbzficSb
 kDLK7fNDlYCoxWfM3BOU2HueKNJDZIK7I8FZ6wWB9ui2crHxS9Xs4NT9/goKSvhMxDaC
 Su/z3KOd5lN3ajtVx0cM1iXhpFPSDH2ClbJUQMQ4FZayf+7vJ1C2ZcNeR5klliK+Zh8G
 yC+yUtrQhzURXVIK4aC3wcr1GxrSzO65DF7KDecC6oL00uM9/eG1Nn13sUKmdnUE3x+J
 HCgbhL6ICpV2tGofvMIQEVBoxio1VM2bYHKzKXhsw+s4FNCnL8RBXUZ86ObcZVOCX5IQ
 z8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FCTa1MEHZ8RflaCaL+Kv3IB7oupUyUxIYhWpI7cZElk=;
 b=Fjd+AL9Jljo7f6Hols1MM9lPFWKp7IVE4AO83Y+FBXb+SeCDqGcBazwkHEntyKRMMg
 Im74cDZK4iS4Jdd8pgFWIntDEL0Px2yi4za2GV3Eo29pKgW/eysQyScC3wbHwPP/U8gQ
 mZh5VMYzRq7r+sn4f6/tOPtql3V7eVP8NlO8K7Dj+IEHvVzelbzEwHe2u0UXeKnYqXDO
 D74gY3gRHGddtbEHBe96RaaN+5890HLpbJ4mEIrf69ZYtrr3jutDS/b5VT7CtCnFJNx3
 PQJSQ9JRGRk5DXngEdP7+4TRa4gXoRuvV9PddcRECIZUkkQJxVQb0v3Aq1o8cm8viilB
 yKSA==
X-Gm-Message-State: AOAM530gbMVMTOHulhqbTQggHYRyg4pDu/KygOrrn4F+nGum9myfu9vS
 zGWNZyywlrbpcB8SRv3GPbZ8uQ==
X-Google-Smtp-Source: ABdhPJygPodjlvvW7OainAGLKsdDvzFoilMLfj02cRFY2jabbkEhO2PBY0GqOsOjtLsFBdJBcYu+Ag==
X-Received: by 2002:a5d:51cb:0:b0:203:8dff:e9e4 with SMTP id
 n11-20020a5d51cb000000b002038dffe9e4mr13637700wrv.512.1647244935364; 
 Mon, 14 Mar 2022 01:02:15 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:67f0:57f7:2185:6d18?
 ([2001:861:44c0:66c0:67f0:57f7:2185:6d18])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm12331808wrw.107.2022.03.14.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 01:02:14 -0700 (PDT)
Message-ID: <846c8a4f-73ed-5003-1c7c-578d580a9833@baylibre.com>
Date: Mon, 14 Mar 2022 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] media: meson-ir-tx: fix platform_get_irq.cocci warning
Content-Language: en-US
To: Yihao Han <hanyihao@vivo.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@vivo.com
References: <20220310074059.12269-1-hanyihao@vivo.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220310074059.12269-1-hanyihao@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_010217_449575_F75F5DA7 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/03/2022 08:40, Yihao Han wrote:
> Remove dev_err() messages after platform_get_irq*() failures.
> platform_get_irq() already prints an error.
> 
> Generated by: scripts/coccinelle/api/platform_get_irq.cocci
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>   drivers/media/rc/meson-ir-tx.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
> index 63e1dbf0a4e9..abdb62b16e98 100644
> --- a/drivers/media/rc/meson-ir-tx.c
> +++ b/drivers/media/rc/meson-ir-tx.c
> @@ -323,10 +323,8 @@ static int __init meson_irtx_probe(struct platform_device *pdev)
>   		return PTR_ERR(ir->reg_base);
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "no irq resource found\n");
> +	if (irq < 0)
>   		return -ENODEV;
> -	}
>   
>   	ir->dev = dev;
>   	ir->carrier = MIRTX_DEFAULT_CARRIER;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
