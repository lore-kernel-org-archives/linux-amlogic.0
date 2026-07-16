Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313CAC44512
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmbMOcbsMBlAsjM312v/wWo5qT9vtNxgNiW/jHbBkdM=; b=V7Z+ixre5NP4g+
	okW24p4iyr0aJ9Dw0n80PtgIOwfQDY/v19Lx6fklr9bbdidiM0GXiDlKOWbx8dtp/IQUjFqnQS4fR
	OC/mFx+1cjCVKpessMX1U8Kxe+bG09J/yynDs+4rWL0uYW/uMebMOt2SFBBueI7beJ/07Lx2eKFXD
	4VN4yM3zwwe3wUbKFlJADEmNnYs23oXPlZJoiiVrZfCz4rgeaKTGjg7Q+d3JRhRou5bEWfGrO+5R3
	PQuzHMqciCNcoaRYs3kcLJ+ICAaOg1ouKEDV2KB9hxflOXsSwPiil0FHgN7pyB+zJhFP6VJNl/Lph
	N1h+t8zfyk4nmERnFVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMpq-0000000HSSk-3O0Z;
	Thu, 16 Jul 2026 14:13:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMpn-0000000HSRY-1r58
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 14:13:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b1710405so37070865e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784211185; x=1784815985; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=FGRm9C7kzKEYX93WvtwsscraOiSXZeauJw6EsDm+uZUiSsUlHpklZ/6lNX2hevEsRA
         Z+9tY0YzQSewEEpxFJVilx3mqQwhwQNab/QVq+9zagMO+lWtwOhs9zjAJTsrsATYb287
         2MSsXhB8N+Impcaw4ssweNRASb3fqwvrGLrB0Wa0dp+BrnSFOinIoyrGImGSmugD9jXj
         g+SnrQzQ6kBI94P6JOHAon9V0YVKE+ovgG6Pnquf91G+pm4pL2rYkgE48wbbU2103XBw
         vVCOVoryNg4PI4y6KkK35kqlheYuvcUYqiCmtVUkrEW9mbz5X0auJUfjkgT/okhO2MT9
         bMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211185; x=1784815985;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t/xbg5vG2nKWr3fodMKyYC2B3wNiKq/HK47SCCd7AP8=;
        b=TOMrN+fnbPdH1dT0gelbX4gzzxarDl4OV45JX60SsdBtumO3h459vjhfOSVE9P1pcl
         00lsMlHGYhZDbMKB1MhkwkJsEbUS9uq1BccjE+x2EqR0TjMScQtyespGKYHK/RF0pLyS
         V2iSA0Man5nGvpx9sFtqIkXjj5TtawOsUeBPHaGEubQ1/0yLxTv9H+gcV9Vc5pCldt29
         naW8TKln+bCxpFW0uo8lGUiXOnQSDSa38PcOkaMJDmRnrItbhhV/xj4vfvrK+wWgQvfd
         AC17kNIAIb3FEz3iGabl+ois2XnU9fwmOsEGfasdg8KRFksmABw3XW3RO6IZyYCImVqN
         WM7g==
X-Forwarded-Encrypted: i=1; AHgh+RpJxJAIMbSIMfeEgGA1092hq4MOdvkglIL5ur8DwmmHCdijhozhem439QwLMIMOh1J6nfXd87XGuvb04LTJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gaFshIqDqBGI9XSLB9Q9Zi0Bk/GzuXb9OcJCyFhk87z91qm2
	Hy9hmgUaDJNXhXptBO3uo8hggKFePchQW+p8bujipnAa0w4nQDaM7Tn3hNCFVCMVWsmhrQkkNGZ
	PSpbJ
X-Gm-Gg: AfdE7cmYcEzieFhS1xXW72IcKCh0gxabevvz6K/M5/0X4hvbOpClCk+QZlRAeqJ2Wkr
	1Wyucx+W6pE/lb94XMFQhp6wfXUW9hme0JBzu/Iy1zDEBOiXwV07ZUE9A14Dq4HjV4tiILI+yB2
	KJ0aYNpb7sTlYRWrCQh0ksp/i+bA1sKhksw/LWm0A2J3Y5aL1hziHPryKowBEDFccdFlBlY6npG
	HsVKUbqAVZmrlIetwh3x3kH5gJK29ABqtuwu5lbKbqktt6mFEuRk/J0hNPy4bj29im2geqVxUdN
	6S/oII2qrIxXInyLwIdvBNgRHpsmdoXqjPAIujdNquLzV7EShUFUTtm41e3Xhjwafzw9vbUDgDM
	rVjFM8iZ5DjNT8qNVNZb+D9vx5UJ76QijoRRViM5UAQGrGgu2izbGzqgWJA1NB6MfZ4GHbDFy6c
	G0VZgQTdDfYJM=
X-Received: by 2002:a05:600c:8509:b0:493:e451:fb8 with SMTP id 5b1f17b1804b1-49515904c4cmr154217465e9.21.1784211184975;
        Thu, 16 Jul 2026 07:13:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9758:7353:c342:aed3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c1f84sm25108252f8f.29.2026.07.16.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:13:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc failure
In-Reply-To: <20260716100939.1381759-1-lilinmao@kylinos.cn> (Linmao Li's
	message of "Thu, 16 Jul 2026 18:09:39 +0800")
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 16 Jul 2026 16:13:02 +0200
Message-ID: <1jh5lzf2fl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_071307_498308_F9CB011E 
X-CRM114-Status: GOOD (  19.86  )
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

On jeu. 16 juil. 2026 at 18:09, Linmao Li <lilinmao@kylinos.cn> wrote:

> meson_card_reallocate_links() grows the DAI link and private data
> arrays with two consecutive krealloc() calls and updates the owner
> pointers only after both calls have succeeded.
>
> A successful krealloc() may move the data: it frees the old block and
> returns a new one. When that happens for the link array and the second
> krealloc() then fails, card->dai_link still points to the block that
> krealloc() already freed, and the error path frees the new block too.
> The probe error path then calls meson_card_clean_references(), which
> dereferences card->dai_link and kfree()s it again, resulting in a
> use-after-free and a double free.
>
> Set card->dai_link right after the first krealloc() succeeds and keep
> the resized array when the second call fails, so the pointer always
> refers to a valid allocation that the normal cleanup path can free.
> card->num_links is still updated only on full success, which keeps the
> cleanup limited to initialized links.
>
> Fixes: 7864a79f37b5 ("ASoC: meson: add axg sound card support")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Thanks for this

With this fix there is not much point in keeping the labels doing the
goto error handling. Please remove those (and the err print) and just return
-ENOMEM.

> ---
>  sound/soc/meson/meson-card-utils.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index cdb759b466ad..38c1b2ae227f 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -52,19 +52,18 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  	if (!links)
>  		goto err_links;
>  
> +	priv->card.dai_link = links;

You must assign num_links too for this to be consistent.

> +
>  	ldata = krealloc(priv->link_data,
>  			 num_links * sizeof(*priv->link_data),
>  			 GFP_KERNEL | __GFP_ZERO);
>  	if (!ldata)

Adding a comment here saying that meson_card_clean_references() will
take care of the above on the exist path would be helpful

> -		goto err_ldata;
> +		goto err_links;
>  
> -	priv->card.dai_link = links;
>  	priv->link_data = ldata;
>  	priv->card.num_links = num_links;
>  	return 0;
>  
> -err_ldata:
> -	kfree(links);
>  err_links:
>  	dev_err(priv->card.dev, "failed to allocate links\n");
>  	return -ENOMEM;

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
