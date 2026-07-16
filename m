Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDBEC4450A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLLSaBYpnq7C4IH4Z8jr/jkzwBfZBV6ROcNg7AsVCWQ=; b=pR9R7EW318nhzl
	VQ7mRbLxHS9siLZA7Gb4rQo31ZzvOL8BcxCoU3HikWVn1VHSu3lZntT3mMYSryMu7Sev3j1Zg9fB8
	IR2f/pDYV8qaPS/QkKBGwdDl3tw8XDmnlGanszKkpMgWzFu+b3ciqPVu6U8F6ZX5tZKwv8ZmocxK/
	o36GGV9r86Q0Ea3xUxVsv67/SMB8LABeofFEiu9COn60GWDPlIfOpLKOAweKl08EsGUVPHUGYCb/y
	zwmb0Uibc07LtbI9AXcmq3UKlQDDHkooEHGASkTJ929TOS0+BBlyQZtjcWfd0+ZBEE2gzsp6T0BNY
	HIDqORKdVFTrORO+ksVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN3K-0000000HUQJ-0iDO;
	Thu, 16 Jul 2026 14:27:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN3H-0000000HUPj-0nBt
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 14:27:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493ec555a26so43854635e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2026 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784212021; x=1784816821; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lxE5XZQtOH+yq3837rq2MGs0Vy95QDtnOg1qhcM8VUw=;
        b=KZtkFxuhGeVhAxZuu/sIgOK3G1s4BIGLYGBqihDX/l0+cDKKHSYNK/4tO08cqV8W7u
         xiw1m2SWG0s2/4/qSRvWjTB5kpUXmDSBSB6GpzFAwKjuqx3HPEu8Z4y3q/WaUypMc1EW
         XWP8sBv6sfD8qwcEcWXcDdNaR3cltgRCf9dXwS/wf6YQDN4Q71GzHMvBaDPB5ChR+WIG
         TwS9ZPmvDLrIFfcb4KJBO/7HjoO+xiRq+buHpbWqyvovTkV4TL1eWEkkoOBTwD5LA47P
         dltDqU596AESDvjfw+OhO9pIARhbryKcOIFOAS9jGB2xGQQS/Qp7W7Ii5zB1+SXQLdYq
         VfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212021; x=1784816821;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lxE5XZQtOH+yq3837rq2MGs0Vy95QDtnOg1qhcM8VUw=;
        b=Lo9yU7nZoGHsMt44IynJUVVDaw4etSMrcpdQ7tYJm5hfd67UAOIPvBX6AQ4IWht78S
         ckG+xwjN9HFDI9aSLmoZMMtmJmHSUc8eMhlEGSCqWY+8/wHgm+GCuTcemvfaiaG7kK7u
         2QrLIg8mVkHZIyXSFbdasXLbacxM6TvAR1qej6bqMKmu8Bpwa4vbJJVrNejBj4MzM/p3
         8XyvU7jbOlixfVi0coJGhWl4lk65YWx8WlMpIG6di9crAD65nG3qd7lwW3cBCSFNZ3Rg
         7Q4gCMGm3keqW2mxGYBIhq2wfAliqWwfqVAWTXxa13zLne1JJc2If4ICjbiE10QON6JZ
         GpqQ==
X-Forwarded-Encrypted: i=1; AHgh+RofF4W2PcSeRyCSfjdNyfaAy+B5wIibzp5gXNDFeis6iFglBEKYjHS5R0XepR5NHZvgJU8DBDXIBs0OBHol@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc70q1sdltXYedzgEM2hZco25XwKZiWa3/oywhEYXHWnUf2X2y
	W76N340BefwE7chaepo/XjaxToXeBAvfpuynmr9Lqfy9Ke0HZvtTE2iZQNKg+F/AyOc=
X-Gm-Gg: AfdE7cmBb0Rd61NRSv6WV3N6u8QV0kVc4dWrlkBEK5wVmwJtJEB95tp/qt3JD2Ty3TV
	8KPDN+egR/4qTpKWoj6sOlblvEi2hCkMF6atkKf3EPU8H3coBUb1WCs2Z2n050OqEZZIazxMbGh
	U/GRtP049IK8i/XO/Fbe8wYP+PRpH+hmJQXqvoLo6CYB5uScO+tNZcDMkYsAQ+WwRkHogIPZHxT
	OaN2HqeBAaFxFwVObf0UPuKzFd8m0db7+uCvrzW3auaWC5PHBz4qA+oNonkhcC9zklfRHLMVDDa
	eZ8TGvcONBom98gdd+z244F1M0duZV1VxbURMRa0qykz+2by6PiUrY2vMKJFqWfGF4l0H9k0KtN
	W3xd2tMDnzqWQxZinDsCF+cl7o7LzVv5LWKUYiY/xwz/vvIStwaHFbyVBAEimY+lYJvnvvW1yEF
	wcpLku9T4lAP0=
X-Received: by 2002:a05:600d:6446:20b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-4953c27ab18mr65173875e9.24.1784212021209;
        Thu, 16 Jul 2026 07:27:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9758:7353:c342:aed3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c704bfasm134422995e9.2.2026.07.16.07.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:27:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: "Linmao Li" <lilinmao@kylinos.cn>,  sashiko-reviews@lists.linux.dev,
  linux-amlogic@lists.infradead.org,  neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
In-Reply-To: <20260716102544.8B7681F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 16 Jul 2026 10:25:44
	+0000")
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
	<20260716102544.8B7681F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 16 Jul 2026 16:26:58 +0200
Message-ID: <1jbjc7f1sd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072703_245245_D7AF5459 
X-CRM114-Status: GOOD (  16.72  )
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

On jeu. 16 juil. 2026 at 10:25, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unbinding the device causes a use-after-free because `meson_card_remove` frees `card->dai_link` manually before the devres callbacks unregister the card.
> --
>
> --- Patch [1]: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure ---
> commit 677ad75f5fb5a578b984e744f26d24b961c89685
> Author: Linmao Li <lilinmao@kylinos.cn>
>
> ASoC: meson: Keep link pointers valid on realloc failure
>
> This commit fixes a potential use-after-free and double free in the error
> path of meson_card_reallocate_links(). It updates the card->dai_link
> pointer immediately after the first successful krealloc(), ensuring the
> cleanup path can safely free the memory if the second krealloc() fails.
>
>> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> index cdb759b466ad4..38c1b2ae227ff 100644
>> --- a/sound/soc/meson/meson-card-utils.c
>> +++ b/sound/soc/meson/meson-card-utils.c
>> @@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>>  	if (!links)
>>  		goto err_links;
>>  
>> +	priv->card.dai_link = links;
>> +
>>  	ldata = krealloc(priv->link_data,
>>  			 num_links * sizeof(*priv->link_data),
>>  			 GFP_KERNEL | __GFP_ZERO);
>>  	if (!ldata)
>> -		goto err_ldata;
>> +		goto err_links;
>>  
>> -	priv->card.dai_link = links;
>>  	priv->link_data = ldata;
>>  	priv->card.num_links = num_links;
>>  	return 0;
>>  
>> -err_ldata:
>> -	kfree(links);
>>  err_links:
>>  	dev_err(priv->card.dev, "failed to allocate links\n");
>>  	return -ENOMEM;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does unbinding the device
> cause a use-after-free because meson_card_remove() frees card->dai_link
> manually before the devres callbacks unregister the card?
>
> When the driver is unbound, the driver core calls meson_card_remove(), which
> calls meson_card_clean_references() to free the links:
>
> sound/soc/meson/meson-card-utils.c:meson_card_clean_references() {
>     ...
>     kfree(card->dai_link);
>     ...
> }
>
> Only after .remove returns does the driver core run devres callbacks, which
> includes unregistering the card via devm_snd_soc_register_card's cleanup
> handler.
>
> The ASoC unregister path iterates over all PCM runtimes and dereferences
> rtd->dai_link, which points directly to elements of the already freed
> card->dai_link array.

Indeed. We need to move away from devres card registration to deregister
the card before freeing the rest in the ressource clean up. I'll do so
as soon as we have the v2 of this change.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
