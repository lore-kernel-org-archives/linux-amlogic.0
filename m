Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524F8C52D7C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2024 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeabjixHHbZ080YrIhHo2BxZT14+AxRMpgFlbqqlFyY=; b=m3fl7N+0za68ja
	WDCo3zv92w2Q+LTvsILkzpGH5WfC12WyMZE9+W96sHbRwRn3bOnXQ3Bs8aGzOwUWVXx5V5pCzPyy4
	gHJoN8y5e6g/v192CyTaQzPHCV1DTki93UFpAnDHnpUcEgivnGqA7Ghoq4RiNWwOZqWCu2aD5zy8q
	7PbaO/1+Xb8ueWbWy+mTHt8svg45ImmDlRCEdjeXW3zmmjtdSLvoH/PuaKG7Nr7D1EvNemET2hOl5
	edoExYZltQnVlIKMTGt/BeMESFkZejJ3OgcT8+dIT/XMf6SguI8Hfwyj9qyjlqV9t42an39TUKfdH
	6vu7hYbsv7zjhhRMrrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdU6A-00000000GfD-49dX;
	Mon, 12 Aug 2024 12:24:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdU5Y-00000000Gaa-03gB
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Aug 2024 12:23:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42809d6e719so32516455e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2024 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723465430; x=1724070230; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XehwAsVHbXNGMp5RdCTcg+jS1mcwWOdOd2oDmc3/TGI=;
        b=iOaUXVnci2fLsMxhod0tF1Nmt59CvItdjP6YiO+bl4caVn1uVEFQhTDnShEMo1u7G1
         VlN1sZTmJT3ArMYjcHLB1R+44ScYqR//l2Z2ovzQxj+6VVOuQ/dwc9IdyFUec1j3Vugr
         Yj0+MDKhkvTAd8mQAEriNc+Dxfb2M/4nMpYUmyPqSl8mcY2lOOc37/Z/sE3Uj89byG6V
         nPwNJigyFuaGp1Be0RQDfqIkvk6uXzf8N7jo5xp2MppT7/VKaLJ+vD6j7lsW6hEbH5cq
         bssEqCufiYkzd0ZYg6V1h3OhqOGXyptqP6pbRVh1g3abepR2qKk8hl48q6V9ePWHdCBN
         ygVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465430; x=1724070230;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XehwAsVHbXNGMp5RdCTcg+jS1mcwWOdOd2oDmc3/TGI=;
        b=TFXZQg45CXAArh4EY734VAZ0KDa8z0EUQO3PRAJxRu29i51Nm6zvtp2FHJnncU8MRX
         edJ1pTPN8N/swyKGerMiaGDhxZL3KkKJRU+pZo3lzf6Gif+xDu/fRq+EQCmUWbkjcdJs
         EeUgUpZGp0sI6v16hCudjE9Gp8N++fiqc+8nHSt1H5nOYAEyKCQ5WH5hanW14qTvBPxc
         xmUoAY/Hv5u3EQWR7TGC/tW4RWdE0IDQs6D4vsK3rRiPFkflTPZpTbRAcgqwb/pRgnOW
         0yUdwzpxLZhbFmn1ouky8Bfn7/jupqQlOvdGG9/LEfTyHFzwqqC+/xSOuzihLzTPC+uc
         B4hw==
X-Forwarded-Encrypted: i=1; AJvYcCXz9tC4bSQl4n8JmOyMeG4OUOUhWVUoCORQC4EZvFLVHAQrvYu9oECShV9r5gcvqB3oVZUc35q4Lqfz1L626g4E3dx+iYTIrV/Pvf9UpmAR1KE=
X-Gm-Message-State: AOJu0Yxvf8C9RmcjuL11ut2wsfeLJ8Q/MKNvqAkIrP6x+OqMO/b3zLzB
	JP5yqJDeKdZn/7F/dpK8/WGYSGvZ2WWC3OiLmC1mG9C80EsIoX+bvkIsxo9Y+6Q=
X-Google-Smtp-Source: AGHT+IG8N1oZwbzivFuOXMO8KjI25Y2SXPR/dyyxOki85347hWjVPqJg+oatclhLoGiEpsJJCbZ3lw==
X-Received: by 2002:a05:600c:468d:b0:426:55a3:71af with SMTP id 5b1f17b1804b1-429d4894febmr1580465e9.33.1723465429768;
        Mon, 12 Aug 2024 05:23:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e555:6809:45b3:2496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c775e0e8sm100690605e9.41.2024.08.12.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 05:23:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-mmc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mmc: meson-gx: fix wrong conversion of __bf_shf to __ffs
In-Reply-To: <20240812115515.20158-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Mon, 12 Aug 2024 13:55:10 +0200")
References: <20240812115515.20158-1-ansuelsmth@gmail.com>
Date: Mon, 12 Aug 2024 14:23:48 +0200
Message-ID: <1j8qx2x73f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_052352_138562_F5835550 
X-CRM114-Status: GOOD (  25.22  )
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

On Mon 12 Aug 2024 at 13:55, Christian Marangi <ansuelsmth@gmail.com> wrote:

> Commit 795c633f6093 ("mmc: meson-gx: fix __ffsdi2 undefined on arm32")
> changed __bf_shf to __ffs to fix a compile error on 32bit arch that have
> problems with __ffsdi2. This comes from the fact that __bf_shf use
> __builtin_ffsll and on 32bit __ffsdi2 is missing.
>
> Problem is that __bf_shf is defined as
>
>   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
>
> but the patch doesn't account for the - 1.
>
> Fix this by using the __builtin_ffs and add the - 1 to reflect the
> original implementation.
>
> The commit also converted other entry of __bf_shf in the code but those
> got dropped in later patches.
>
> Fixes: 795c633f6093 ("mmc: meson-gx: fix __ffsdi2 undefined on arm32")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

Are you fixing an actual problem you've seen with the platform and or
this solely based on the original commit description ?

If I dump the shift values with what we have right now, on sm1 at least
* Mux shift is 6
* Div shift is 0

This is aligned with the datasheet and has been working for while now.

> Cc: stable@vger.kernel.org # see patch description, needs adjustements for < 5.2
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index c7c067b9415a..8f64083a08fa 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -464,7 +464,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>  	init.num_parents = MUX_CLK_NUM_PARENTS;
>  
>  	mux->reg = host->regs + SD_EMMC_CLOCK;
> -	mux->shift = __ffs(CLK_SRC_MASK);
> +	mux->shift = __builtin_ffs(CLK_SRC_MASK) - 1;
>  	mux->mask = CLK_SRC_MASK >> mux->shift;
>  	mux->hw.init = &init;
>  
> @@ -486,7 +486,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
>  	init.num_parents = 1;
>  
>  	div->reg = host->regs + SD_EMMC_CLOCK;
> -	div->shift = __ffs(CLK_DIV_MASK);
> +	div->shift = __builtin_ffs(CLK_DIV_MASK) - 1;
>  	div->width = __builtin_popcountl(CLK_DIV_MASK);
>  	div->hw.init = &init;
>  	div->flags = CLK_DIVIDER_ONE_BASED;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
