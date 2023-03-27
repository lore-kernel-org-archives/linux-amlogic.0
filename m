Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0F8C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUweNSFR2cdmHe6xwuohDZEUPSTS2SQx3Dr94KeXKQw=; b=XgJTVCELKUFuaD
	fIHKsoSt0DeS2vuO/MbQqg+rUjHuBqEY3zkpYnpmiN5FU+NkPwMUaNkZyoP4vqT8XDmN+6L3DL28L
	TcKTq/IOsbjXUOcTmUlcplIHGFBAgQc9wltGHB2uHSoxSennsJTnYlOSkUslpia6gtCohryRl7EjW
	G806T9H4POSjICol+9Moi1fbeARgRBQIx7IGpcWnMCJqEdrhN8m5wBYEXAC8psgLXZgJM/xRj8zS7
	gGX3jYGgRfA3JAG4uMExlHXsaNKLbFU2oMJpQebBywOysjAuuLPwjgVDQzqat64c7ILEJhw4duTV8
	bh7Nc6SO+eKByRx8Jw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiXd-00ALmn-36;
	Mon, 27 Mar 2023 08:49:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiXa-00ALld-1p
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 08:49:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id l37so4564734wms.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679906960;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=UDSqP7fpfKlKQVx/rVKsTS5+4DHlxYXGctzY/lz+9Ho=;
        b=5UJ/GXirQ7wgMEFINuifffVu8CODx5qLiO9QZwxXCtKEKM+75oZAu25XvAjTf3Mukd
         lVDHLQTo0AOOQcN5NlWIUSvcKvN32YA5hJUWuvNjyFXAByF1uiR2VcvlikFKLYKEBmOn
         eDx+RS9fSjaPFpSvMY1eVdj5AlrPgGKU31/9RH/tg2j1jU4AbH43wXOmYH7I2SbnW74s
         7py0fyyDHwvalOsnobnGpmz4MyKAxZWgrhDqMGcGyEgoifsfAdrikkoSAaPvNKx7TImx
         qNZcc3t1JrP9dMg1sXC70lpblPv+C9p97e4IDNGsXPmZvdqFu1e0O8EuVXhAqEIk+Pst
         rXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906960;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDSqP7fpfKlKQVx/rVKsTS5+4DHlxYXGctzY/lz+9Ho=;
        b=W10Uf3QudwruuH6IMb8LNH/KnlfoNW8lzbyXfHDU6VvzcEDvnsEDmnhQ/ey93bSzrJ
         nOeLTzA8IS2JpgMcP5Mbo1Or2TNO0JeGWuuqgoZeIc6CeZFQlS5EA00X9C5lbEeG+dXr
         XatUvO/jOu2+iOFyzwjGmfWNBOP/Ll8rb16NJYQddDjtvFWu1wqvNUnZXITs6rnpm54J
         +m3KYOcUWAyqqN99rtCHiK9QNeuOYQC/g2PHShi1eYZCE2Yw1YfkSBqPEflQDqE4JbLk
         qDlMFa2nzU5b5Eh7/Uc7mmtQNrm7s2ISvjfBq0Rt8TchwWKYc2fQ8s2Gj2VXbIbtf1pn
         BYPQ==
X-Gm-Message-State: AAQBX9fePGIw/PKS0kw+wcksaojI6PXmJ/k+Y21JASGE6H+12DataT6Z
	H/L1utmCU3U/E0PEG7TuVSDbyw==
X-Google-Smtp-Source: AKy350a1+/eDpxejUWxQfz4ZUV5XMrdV2fNL9j9I2+FCSXACd1jk3wa03RjMGPX4FF4onxWuoaOJcA==
X-Received: by 2002:a7b:c852:0:b0:3ef:64b4:b081 with SMTP id c18-20020a7bc852000000b003ef64b4b081mr4840082wml.39.1679906960535;
        Mon, 27 Mar 2023 01:49:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b003ef5deb4188sm8001026wmn.17.2023.03.27.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:49:20 -0700 (PDT)
References: <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Date: Mon, 27 Mar 2023 10:45:44 +0200
In-reply-to: <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
Message-ID: <1jy1nio9yo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_014922_607182_FD88EF7B 
X-CRM114-Status: GOOD (  17.44  )
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


On Sun 26 Mar 2023 at 14:43, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Use devm_clk_get_optional() instead of hand writing it.
> This saves some loC and improves the semantic.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thx.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> ---
>  sound/soc/meson/axg-tdm-interface.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
> index 7624aafe9009..5e5e4c56d505 100644
> --- a/sound/soc/meson/axg-tdm-interface.c
> +++ b/sound/soc/meson/axg-tdm-interface.c
> @@ -496,7 +496,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct axg_tdm_iface *iface;
> -	int ret, i;
> +	int i;
>  
>  	iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
>  	if (!iface)
> @@ -533,14 +533,9 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
>  	 * At this point, ignore the error if mclk is missing. We'll
>  	 * throw an error if the cpu dai is master and mclk is missing
>  	 */
> -	iface->mclk = devm_clk_get(dev, "mclk");
> -	if (IS_ERR(iface->mclk)) {
> -		ret = PTR_ERR(iface->mclk);
> -		if (ret == -ENOENT)
> -			iface->mclk = NULL;
> -		else
> -			return dev_err_probe(dev, ret, "failed to get mclk\n");
> -	}
> +	iface->mclk = devm_clk_get_optional(dev, "mclk");
> +	if (IS_ERR(iface->mclk))
> +		return dev_err_probe(dev, PTR_ERR(iface->mclk), "failed to get mclk\n");
>  
>  	return devm_snd_soc_register_component(dev,
>  					&axg_tdm_iface_component_drv, dai_drv,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
