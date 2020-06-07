Return-Path: <SRS0=GVd1=7U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DEFC433DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2020 20:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E002074B
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2020 20:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSfLnz4W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KdOyqU9N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E002074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a2Oo/A2NyHZvXgX9jlfuVNJVvMD5rznvxWbUSWsolAY=; b=KSfLnz4WZEE98w5wkQcGNWrG3s
	MRmfyfv8eim02RMQJGdijrZAN/s8/rHrz80VbSAgHIhWYEwxIUDx3twyN4+l8+cLgEXhC7LgNdQAs
	8f2yU3+N5bh27e94YjD032t4eoFpYCjnwBdeuZOqYiz2K8dUTy9D9zukO3Srod12f70eOhJH447qz
	XXXS3SSbdUDfC95Ujr7Ic9XaOgta8bXx9H0Gnueani8nFoFYYs+l4P4yTcbeiYbtV+Ht1H5+oSwXW
	5CpEm1EafkZSg8acY48sC8F65QYlR6JFCMgKTH61yDzPlhr/nAzpSfN9TE+3r0BnDsxqZJP2OxZuI
	vnPQ93dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ji25C-0001lp-Ts; Sun, 07 Jun 2020 20:39:54 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ji259-0001kW-M0
 for linux-amlogic@lists.infradead.org; Sun, 07 Jun 2020 20:39:53 +0000
Received: by mail-ej1-x644.google.com with SMTP id f7so15995297ejq.6
 for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2020 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=cxAlOko9t8uVXP+cvSgKgh4pcthYDznq/xdMjGJwWF8=;
 b=KdOyqU9ND3HG5d87XzvYCfQ2uByF1009R35nYXeDDMLn3vhVJNmlnwuNBXc0HasUMj
 LyKvjV0OHT0/GFgDE/03M8ppq31jNA/14gxV99DDyqL8qAre2/OHH5LtP6yQKvfznyX2
 LROlH2K/f/dx1Vn/5b4xOX0oA7ArWmNxLbjZ1JVMq+Vnt/1ms3tCRN/hGC71MCrsqjUd
 GIPFEFAU/eZqHJivwmZWwKWtr3PRkJqQ1obBpY+x+MD2ytvfqSzxenTN/wm1iaf4iXcG
 kNiefj+tDTqhRm+1eJYp0/rg7yaWUj0T9E5B1oGeYm2hbTCHEqv2buK6/vOkL0BGK6WX
 fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=cxAlOko9t8uVXP+cvSgKgh4pcthYDznq/xdMjGJwWF8=;
 b=j+XZZ2BvTrX9l1U4szWacYdo0hs8kdAHZdxikfOVLgUv6M9+SdJ+MDZIKo06/d8ZVo
 dlccIKWdS7fDr3MiZ0ftw3TusnhpHz+Lvjlf+MF6i/wXdiTuDDOR0Z48PJ6HIg66NEGZ
 ObjfUEJWokIpU4zNRq9TVGv1t38/a6XPcVaopvrLQNvOh7lBSQ7V8T1df1zuhB9URlBL
 EhO3pfadYTXLFs6u479nIMcwd+ArwOm4v/PVYwGqNHHWqHe4YGV5VQLERDA+YuK/8kZi
 IPcDZhDoNSO0Ubpqj7WPogAduUAlcCzh4R73FmjzMtQFkYR5zwdsi6USWABmQMGJn4+n
 7pOg==
X-Gm-Message-State: AOAM531y+atYP6JbjRxoGcqppy1BZMg+NT89t654+CyjQ051dW3mqHpB
 IvRH+HrLIugVvi9vTJiG8H0hhw==
X-Google-Smtp-Source: ABdhPJxhaSuBhybacMUdhNX3W1cQmnqaVuUYl4vqsJiFOjecWMYGoz4GLI7EUeGpnCcBDZ6WR7g6xQ==
X-Received: by 2002:a17:906:a387:: with SMTP id
 k7mr19195332ejz.408.1591562389607; 
 Sun, 07 Jun 2020 13:39:49 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id v29sm10754839edb.62.2020.06.07.13.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 13:39:48 -0700 (PDT)
References: <20200604171216.60043-1-colin.king@canonical.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: fix memory leak of links if allocation of
 ldata fails
In-reply-to: <20200604171216.60043-1-colin.king@canonical.com>
Date: Sun, 07 Jun 2020 22:39:47 +0200
Message-ID: <1j7dwik3u4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200607_133951_773886_384E293F 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 04 Jun 2020 at 19:12, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of ldata fails the error return path
> does not kfree the allocated links object.  Fix this by adding
> an error exit return path that performs the necessary kfree'ing.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, Thx

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/meson-card-utils.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 2ca8c98e204f..5a4a91c88734 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -49,19 +49,26 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	links = krealloc(priv->card.dai_link,
>  			 num_links * sizeof(*priv->card.dai_link),
>  			 GFP_KERNEL | __GFP_ZERO);
> +	if (!links)
> +		goto err_links;
> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
> -
> -	if (!links || !ldata) {
> -		dev_err(priv->card.dev, "failed to allocate links\n");
> -		return -ENOMEM;
> -	}
> +	if (!ldata)
> +		goto err_ldata;
>  
>  	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
> +
> +err_ldata:
> +	kfree(links);
> +err_links:
> +	dev_err(priv->card.dev, "failed to allocate links\n");
> +	return -ENOMEM;
> +
>  }
>  EXPORT_SYMBOL_GPL(meson_card_reallocate_links);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
