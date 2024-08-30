Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BACA1008
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZkZdbfD0IPC1QwxI7v7JC3/UFEUJuUYaPCJXKChP/0=; b=RksA6snUZdcumm
	oLSQdszcwkffFBx80Lk+FqB42fMj353814VJMw476I/8NXU3QoirGuvWC5d9y0ziU4YkWltnfgftt
	Z4zP6PVcuEaXYSGKlwAMS+7bONugmMsEuqg6o9kon/aHosyPjm8qqEuuPPl1tGhbMgwCY+tq/Rbk0
	LNkmBJpFsvRcq4XeHNv/JZT7edFHu4ZU7g3g4HV4rd6QXHmQsbR0BK+DmLK3x2jiiPhlet0T0xxmR
	wYbylt4LJZJ/HAIvIk0L9e+MDTlU+OMUKteVFHVIOSRDoc2I4QDGhrSzFu55lAO5KdxvhtwgrFZft
	d1HHzhWLZtMnO00vqemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk43l-00000006vx5-1COF;
	Fri, 30 Aug 2024 16:01:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk2tj-00000006euY-3kux
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 14:46:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so16101265e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725029206; x=1725634006; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Brwv7WkyKWkecwEKCwzjm/DnVp0GE0+gH9FyFHdLPWE=;
        b=f2jfuBA/yU7tuwtDLNTqm7OlISwkOq0Uff15q4wSeTq7phbX90NbxNSL/Vau+Z/kBr
         1SAV32i4AS77RdcgHyI0D/zHgWYDL7862abv1nmQ5NCj1bC9yVK5VFYa0zP4RlxNqTa2
         j9NroVu84lfPhAXOFsoOGRlzi4KcW6x0ScDhYRIrPNo0P++yRaHsaaOGoBX2Q76RS7rf
         4Ee6xGMOL7XKxe3gZW9PG7YnRcCjewBOqIt3JYbO0H6N/kf3J3oPYhmznIYyG9Z124SB
         73RPwXp+0icpYc676OKRAF2mlIoiFLV5usHbFC2ze19W/4iLivKGrKrvwPD+AmYImZ5c
         cjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725029206; x=1725634006;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Brwv7WkyKWkecwEKCwzjm/DnVp0GE0+gH9FyFHdLPWE=;
        b=GdmglnSnZHYR8zeOQ9WDdDIcgLGCe5KxBgxzjg+cGSlBy/Rl7PI1itsrAO2umMM6XP
         AkUgm5UMZW6LBUeUdSrLFJHpX58OOtODwyrpuleE355/be753X8YwCg9jCyo0i4/IDec
         q+GH6nf42ZRWw5hwmlAjeLdGWkZvu8l+hTBlP07qkox00T8QOKezOiC70xFXFEH0h+Ik
         T/C09gqbzYIAO6i2XKUIkhCbUZPxsirf0C9vqjltwdPGbw9MNF4/AqffA3NwqMCBtMKS
         36Odoo9bkNuHWwTUHJXSdRzRkyz7Vr74fn77o6GuwXTWeUTNtCnwaoJc3v/K1/pzCMMD
         wk5g==
X-Forwarded-Encrypted: i=1; AJvYcCVkbRYcnVBRTfnc4BuMeZRtuX0UEqNcKSVLcuSbgg3YKh7k0UnPUs2J/lPADKb/ESea54K86cUvSL/PUlNg@lists.infradead.org
X-Gm-Message-State: AOJu0YyO676WvZuKVts3xLc2O6HHnK5dBl24jTugVGhSVSVdXzG8fIeG
	YdjjUUAmR6I3y2TN/bRF1XEy9QLDcmKcw/dARawvOhAPJ9+bGqn+Cc00pbDK4CY=
X-Google-Smtp-Source: AGHT+IEjziblHdL1ANj39f0Tsx5zrgnDRCiXQmkd4mvEzUd9Pok8R2rHgDvXpf4OC34vXqXaoNYHpw==
X-Received: by 2002:a05:600c:1c83:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-42bb0256d38mr46357805e9.10.1725029205602;
        Fri, 30 Aug 2024 07:46:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd15:900f:f8f5:46f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm48102005e9.19.2024.08.30.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:46:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  opensource.kernel@vivo.com
Subject: Re: [PATCH v1] clk: meson: axg-audio: Use dev_err_probe() to
 simplfy code
In-Reply-To: <20240830080103.12811-1-chenyufan@vivo.com> (Chen Yufan's message
	of "Fri, 30 Aug 2024 16:01:03 +0800")
References: <20240830080103.12811-1-chenyufan@vivo.com>
Date: Fri, 30 Aug 2024 16:46:44 +0200
Message-ID: <1jfrqmrru3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_074647_965040_5C624C42 
X-CRM114-Status: GOOD (  18.36  )
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

On Fri 30 Aug 2024 at 16:01, Chen Yufan <chenyufan@vivo.com> wrote:

> Use dev_err_probe() can make code a bit simpler.

It surely does but ...

>
> Signed-off-by: Chen Yufan <chenyufan@vivo.com>
> ---
>  drivers/clk/meson/axg-audio.c | 12 ++++--------

Why this driver alone ?

I have nothing against the change you are doing but I would not want to get a
single patch for each and every amlogic clock drivers.

>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index e03a5bf899c0..0637b05a4c89 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1761,10 +1761,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		return PTR_ERR(regs);
>  
>  	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
> -	if (IS_ERR(map)) {
> -		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
> -		return PTR_ERR(map);
> -	}
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap: %ld\n");

This does not inspire a lot of confidence. Did you perfom any test
before sending this ?

I know you sent a v2 fixing this, but still ...

>  
>  	/* Get the mandatory peripheral clock */
>  	clk = devm_clk_get_enabled(dev, "pclk");
> @@ -1772,10 +1770,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  		return PTR_ERR(clk);
>  
>  	ret = device_reset(dev);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to reset device\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to reset device\n");
>  
>  	/* Populate regmap for the regmap backed clocks */
>  	for (i = 0; i < data->regmap_clk_num; i++)

Finally, it does not apply on my tree.
Check the PR sent to Stephen, you'll get all the details.

https://lore.kernel.org/linux-clk/1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com/

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
