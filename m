Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61710C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Mar 2022 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ct4D1mLhen2KywfkNahBtetTU81Cdn+vnmIFHYXK3Jc=; b=i+1NEGN87aFAja
	5lDGaXuw1MK5uFWGlyjQq+PQmF9g2Fk7CCNB3bqKDIwQrrjJxwIzZqsN+D/OWc7T66evo3FVKoicJ
	xFBTxsRXjzRLRwLfbU4sPP6xYBu+oYT+AQjXrqhOsuf5WXpkHT8LtKtWyDyi8iQ7t+cc/wPDyaVGc
	yFy19sERHIzbbBoJGkPyqy/Rh3TYi832NQkTYh6OfVbitil8Mpe5hiA15ymXJfy/4c+fjHR77/K/9
	DDG4bTzbA/yYZoTxQwkbSrSsKVDDqhzEduvEnNZzxEynd2Nu9rdx+Y0THeblPMhBnQgerQHkNUh+t
	HxtDjwXcQW4+IzzeAnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYQn1-005TNc-TL; Sun, 27 Mar 2022 11:10:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYQmx-005TMU-TY
 for linux-amlogic@lists.infradead.org; Sun, 27 Mar 2022 11:10:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso6905663wmr.1
 for <linux-amlogic@lists.infradead.org>; Sun, 27 Mar 2022 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=+BzHZSvsn/H69wlmb/H6rNB8e3j/o17VqP5fAwR3vQU=;
 b=n+TM4caOAp7aEq8To+f6jO0BS7LMe0+DMBVCErD3nIzBkOALI2ZJlInZiWkvYKLyqB
 H+4F7iYjKqYaLj/OPPzW9gq+l/M9Z0u6a8WTTf6LH/6M+0VXHjVNWfLpj5h9WLbTDly9
 PJkw2fhaZ+69LqpOJ+zOCsrcktLX2QSq48Td+AlXqCzNCKa9dO0WK70MfS6fKUQC9Wtk
 +fFh+kf/2aZXUIKt7Qtoq42+r5NKVrbBQryKeKWeDT12xPt7ASgtSsTKwm8D0eA3DWUo
 8Zs14hKV4x0VtL+2deVPC7sbA3/beiz2cDtnHAf4stM2aEO3tYUFOqpZX9yriEm4A7M+
 Mq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=+BzHZSvsn/H69wlmb/H6rNB8e3j/o17VqP5fAwR3vQU=;
 b=HjzWH97PLFGofzxNkoA0So+gHGruPAndB1JYQ5pEVcqOgeQInrBoICn2vmP824B39A
 Xm6A/+mcJlfcaX7TXYBqaw+WJ00yy5a0n1IMKuoBnD4ZVYy7p6u9iCLBeyqdrOCkzbO1
 z8mwd4Hqw9Mt/4MRIO0k2Xx6twUx/mCGIa9t3+epBKsKCNMleF0YWZyVCD0j8xHpzLEk
 MWm3YQcrPXAQPQAPfAKii7UyRjC6VZOuttJN4LqEdLrr3Gpj2YTm/Vs9wYYG9qFKwbI9
 2vE9j18knR7MhV3sCEHXwoYCljNe/wNB7+layV7mEYibmDzImytuyvylFxpNWeRKgcXI
 ntMw==
X-Gm-Message-State: AOAM532bEjyF/u7rhziMDhoplrHTDbFOX4pt/viSqjZW8YF+mKZFFWCM
 7J1LNG4gnTOTmBVX13ZabagVOA==
X-Google-Smtp-Source: ABdhPJzw8TxaeNM+RLDCb4Y1lZLHWqMHpKjAx9JRCVm8lX0y2gwyKrD4U6GXSV5yvfD0ii3RXeXiXw==
X-Received: by 2002:a05:600c:1c8e:b0:38c:a386:26aa with SMTP id
 k14-20020a05600c1c8e00b0038ca38626aamr19308151wms.204.1648379425745; 
 Sun, 27 Mar 2022 04:10:25 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm9577806wrv.79.2022.03.27.04.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 04:10:24 -0700 (PDT)
References: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 narmstrong@baylibre.com, khilman@baylibre.com
Cc: martin.blumenstingl@googlemail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 13:03:14 +0200
In-reply-to: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
Message-ID: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_041028_068544_0265B402 
X-CRM114-Status: GOOD (  19.12  )
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


On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:

> The bug is here:
> 	*dai_name = dai->driver->name;
>
> For for_each_component_dais(), just like list_for_each_entry,
> the list iterator 'runtime' will point to a bogus position
> containing HEAD if the list is empty or no element is found.
> This case must be checked before any use of the iterator,
> otherwise it will lead to a invalid memory access.
>
> To fix the bug, just move the assignment into loop and return
> 0 when element is found, otherwise return -EINVAL;

Except we already checked that the id is valid and know an element will
be be found once we enter the loop. No bug here and this patch does not
seem necessary to me.

>
> Cc: stable@vger.kernel.org
> Fixes: 6ae9ca9ce986b ("ASoC: meson: aiu: add i2s and spdif support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  sound/soc/meson/aiu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d299a70db7e5..b52915c6f53b 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -61,14 +61,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>  		return -EINVAL;
>  
>  	for_each_component_dais(component, dai) {
> -		if (id == 0)
> -			break;
> +		if (id == 0) {
> +			*dai_name = dai->driver->name;
> +			return 0;
> +		}
>  		id--;
>  	}
>  
> -	*dai_name = dai->driver->name;
> -
> -	return 0;
> +	return -EINVAL;
>  }
>  
>  static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
