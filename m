Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE21CECAAD3
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Sep 2022 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEGCVxHs09juKS9x8UDsoG0Gf+08DfQlmw5lafQ1nBo=; b=W9WBfRssQt4T7GNB8ZMjZbYNel
	iSxmwbIxfCZJexWzgPIiy/bSmHUD2oqtc4ZWNz4SQF37O3zjPuqPq4YH8MxzywODH2tF21xWH5Sxv
	oFW+QhxZK7VZoAYr1VWsLMHgnLLn8Pa5EH2nyZKnCet4boCuDH629MLOfEbfMjiAbc7gmBZGkTKP2
	0C1OvuOkTiCrnH2pHcqObkZac/RLf+9RcUPIIvY3Ki0+dHr4h/ft6fAMoJIKhCOtbxY7Lpqth9Jr6
	oJT489kl8vvyS++uBIuZAnqT/ZIXUd/v2vnvDGiUUtOoaCZaFjPOWQPfhm+VZ4aNo6in/zT1TK3yu
	IrebtdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcBS-00Fipy-U7; Fri, 09 Sep 2022 11:28:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcBO-00FipE-AF
	for linux-amlogic@lists.infradead.org; Fri, 09 Sep 2022 11:28:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c11so2196655wrp.11
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Sep 2022 04:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=woBZw+XonV0Wc5qhjXcMw+kc+9HKENdHdC390sUdFNc=;
        b=CJplOplyAgy/Vnq0Ovubf6ZmFSNmgvIHDH6Gz2pXyPAYV3zCIZpBNn7CjwI8ssgrqw
         5pe6G9ZH2SnhW/sKmnhkuCtDFiG7LS094v3vNgNqtpX8ZEyKyCeHRQ7tMTUT/1CoY+0E
         2ESenDcG3ddIMi6ZwvDF+QFXUuxBcWVSmTg0iKIwOaF1jIbvW+IXBa1ZCHf9ydTwjMcV
         kaom5lcMmT9nQFcvDuTZ2vX3NTkT3fM0RyIM5Y7mn4SmXodyaqwD8XAEsDPWcX6JO0YI
         YfJzELN9gXMw5i8MRZbnkVYXjIk30Sv9hYwXKsYokjyGMARLWGFiPYFC0uP9hDqT7b4c
         OkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=woBZw+XonV0Wc5qhjXcMw+kc+9HKENdHdC390sUdFNc=;
        b=lQvMGtGHFRJy91Nnu2vQr4ri21GfvANqAw0eoI0tj+57lLPxZC7cB7z83FT+DNRa/b
         iVBOdmDN4g7QMBCDtdESJi5w9z1LnQ/sdoM2qdJ1YY/rYKUOS2mhWqG7DAkTA73AGu8U
         YZp7jhRLiMG+eVz3ScMRjZPCf+1JjBZe2Ckq8EUWap3WkPK+avAZWlhIeIauLUTifhnY
         8unS/U/IH428BONC4Xf4xmUgMBnuaHcBBmBQUQZdA5eAcaOyBUqDUoPEDpdSIbJYPy0Q
         yQ59CB62wT2jFoTGF52po9IvGY55YeuBMry8OdDTnM3+Zyll0bRnrC3b0yLcsTci0Ojx
         N6KQ==
X-Gm-Message-State: ACgBeo1ZCsoS9SqE3pfynb0eFcYUs37WwIr1cWsuW1WpMgF2WGOxAbkt
	dqe/H8PQ4K2JrrriiusnI9uorg==
X-Google-Smtp-Source: AA6agR55oRIIYdaAGAIVusivzoDiLjqbkaH4/1As5zVRm7+2An/RNlFPdwa+FcvHJz1TcqoKmZQ4qQ==
X-Received: by 2002:a5d:6c6e:0:b0:225:5a20:1bd1 with SMTP id r14-20020a5d6c6e000000b002255a201bd1mr7652932wrz.717.1662722899518;
        Fri, 09 Sep 2022 04:28:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab? ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
        by smtp.gmail.com with ESMTPSA id h189-20020a1c21c6000000b003a845621c5bsm318327wmh.34.2022.09.09.04.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 04:28:18 -0700 (PDT)
Message-ID: <595e620a-1d0d-73e7-cd20-79b145727a70@baylibre.com>
Date: Fri, 9 Sep 2022 13:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Correct OSD1 global alpha value
Content-Language: en-US
To: Stuart Menefy <stuart.menefy@mathembedded.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_042826_607604_4E3F3B35 
X-CRM114-Status: GOOD (  15.48  )
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

Hi,

Thanks for submitting this patch !

On 08/09/2022 17:51, Stuart Menefy wrote:
> VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
> value is 0x100 not 0xff.

Indeed it's 9bit, but all bits to 1 would be 0x1ff then, but indeed vendor
uses :
#define OSD_GLOBAL_ALPHA_DEF 0x100

> 
> This matches the vendor kernel.
>
Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")

> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index d5cbc47..45088f0 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -163,7 +163,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   
>   	/* Enable OSD and BLK0, set max global alpha */
>   	priv->viu.osd1_ctrl_stat = OSD_ENABLE |
> -				   (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
> +				   (0x100 << OSD_GLOBAL_ALPHA_SHIFT) |
>   				   OSD_BLK0_ENABLE;
>   
>   	priv->viu.osd1_ctrl_stat2 = readl(priv->io_base +

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
