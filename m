Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA79C4828D
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Feb 2024 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uC+GpRHjeVsBubMC8NcMbaJmQ3hodQcZBeG5NpUNtE=; b=X07cCyWdIt4sR4
	D2IX83aZbYgXPNhSidc06IwIdukGFwq8gtC/wacpXY/xd1g1+JyHJMOjogynlBnfcMzv9Y8yjD9i4
	DrBVEhlsGGX/+Ytr6LIjm+NOO8pNtYn1hjNDXbc0qSwBaQSbSEBpfA2xPKYLR9Q47Dsz9K21GLUhF
	1kzITZZqLSW3Eg1H720YTuT6DsUOgJvGJvj0b54Lgic2sryxnoYz2vMuHDNApz6qqWRx2h2f5d6nM
	/8BPgcjCjkhbauN8W8t4VSFQU6GTCG5infBTQiCguAKpHtLAZp5K7zDpBIbJ2r09kXGrLdwh+wLNk
	pcfnofc1EbPGwmxiNJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcoj-00000009yzl-30m5;
	Wed, 07 Feb 2024 07:58:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcoh-00000009yye-2emI;
	Wed, 07 Feb 2024 07:58:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5114b1e8819so461991e87.1;
        Tue, 06 Feb 2024 23:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707292676; x=1707897476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faw62muK8rMq99LhU7XEIx44p0VAUyI8BL+QRChVvwA=;
        b=apP5LYpKHYHR4XGyhGLSt5xAhcUGImC7G5VbMQc1KKwtZGZCFZLY3f+UfbL6lNGx5O
         qDST5nqTMvGNYEuOmUnqImG6qw0F86gTZ756wXQNJhUXyzbKVq9Kbvn020u2EVhnvvpk
         Din5ZbVk9NCeiLHpZx1QGbTrG21iiB5fzE5WFDis4Q46BFwTTUnQ/eVR1bTF8IdbaHUy
         dgsNXo68cihhQHdcMT9ZRbEY4eDDPJIH5VG9Mp7vWd5kdzl4sR4uuK4JiaHnTobX/i1p
         /l8eW88ue9I9Vmta/m3qhXeiTOlvCP/QAscEYNCPTpSc92IHmbmbyeThduciCevnUS4Q
         okoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707292676; x=1707897476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faw62muK8rMq99LhU7XEIx44p0VAUyI8BL+QRChVvwA=;
        b=B5ZGdSa/3EK66PK5SyqxtHHkYOWeF9BFbA/E1kjvmO7rmHKPDXTEBlDMd3IkK99i+o
         voK++UcVVghEBteq+hr3XUAzsUO63iCX6grSs2flutbuoNfB3gKtDhpX1hNFgb4HTpWv
         gSQEdPuIyNZlnXTG7NOIik5KcMl+yeEOHx7YkeqkZSlFy/RH0DC0U59mEy0pe6ANjgmh
         GtRTMCKN1vXwDaGaIAYoTY1ZR3ZHVsmA+PGT7qn0uVRKfzh6/o01hBHi0Xa1pCSgyN4r
         GPE6eq6V41kF/ziw/IdKWFtgUGmkha5Ce2k8JgGu4OxTbWiJdt5+nmGox4BFqHqc+xQI
         BQgA==
X-Gm-Message-State: AOJu0Yx0sHkQw+1Lv9AgvHiKRYfOyrnCLVGlMFZmz1UqXlNjtq5cjavV
	wL5aqDnG3enXgLZAKHRiWIN0nVDOw3VlNQhJpy6oGNRbCVbOkOXl
X-Google-Smtp-Source: AGHT+IHrOG4ej7Nc8ic00cewvUn2sqV1hsMqwojBzY8/6TzL9zMPEDbPRaGu93Tp6EIf/bcp6ZT7zw==
X-Received: by 2002:ac2:42d5:0:b0:511:5b47:1fe8 with SMTP id n21-20020ac242d5000000b005115b471fe8mr3472289lfl.6.1707292676205;
        Tue, 06 Feb 2024 23:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCJTQDT9qidD5GSnJxXCfNIUbZHTrA3J5SEMhoGXkwZ8UHtixP6Uu2E0dmz4PJCKV0lED018lrWOuIW368bJFU2nzD5CDed1ZTSKe19z8Dczg0RB0oxZ18Tfzbw8jOsM3Vb4ps4gOqQxHxVRB2ycP8l0JoiKbzhUHUzu9kY77hcC/6ESLjmv6wB3ujRzYOM6FqR2iizc7p/MiKL8nGcQIzct0Kx7YECuXvtTQ9NaYsOxZ7IWQSOGJ0UUs/qUnnVg+iZGKxQ9qxnhKxDng2I6N/+oAD7xAqY6oz5HYas2dUWL2SvBTcPKkJUSKrP3NFocMBv1vjMJMPfX2e4ZOZ4mIxqR6h3uNnOeEUhALQJzGRZKTpfZ08hHuHVBkhqayVq00SB/lUS+4ITMiHqiFEm13zTZ25gt09zSGyk6LunSj+PVdw8u9Ovw4jIvD7iw75kK35MgkLo5fULXOjp3QV9olbvzUPtuN9c6s/lPW7tFOpXimlnGV/BItO7P8F3p3D9N1AgDPOCYl4+5jazyW5qGeUF53lIBl6lzWtfX2/BcIkjPP/p5Apwv7TNC21ji4rpHUfe/ZK1E+L/gXrM8DcgkQUMOIzkVQBh8bYZjJ5tOE=
Received: from ?IPV6:2001:14ba:7426:df00::2? (drtxq0yyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:7426:df00::2])
        by smtp.gmail.com with ESMTPSA id n2-20020a056512310200b0051140df84fdsm96155lfb.12.2024.02.06.23.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 23:57:55 -0800 (PST)
Message-ID: <ab8d9d0a-aad4-42b7-9e24-9ae6acf7c939@gmail.com>
Date: Wed, 7 Feb 2024 09:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/18] mfd: rohm: convert to use maple tree register cache
Content-Language: en-US, en-GB
To: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org,
 marek.vasut+renesas@gmail.com, support.opensource@diasemi.com,
 neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 rf@opensource.cirrus.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-12-liubo03@inspur.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240206071314.8721-12-liubo03@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_235759_711786_45D1ED1B 
X-CRM114-Status: GOOD (  14.41  )
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

On 2/6/24 09:13, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd71828.c | 4 ++--
>   drivers/mfd/rohm-bd718x7.c | 2 +-
>   drivers/mfd/rohm-bd9576.c  | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index 594718f7e8e1..2f3826c7eef4 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -197,7 +197,7 @@ static const struct regmap_config bd71815_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &bd71815_volatile_regs,
>   	.max_register = BD71815_MAX_REGISTER - 1,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static const struct regmap_config bd71828_regmap = {
> @@ -205,7 +205,7 @@ static const struct regmap_config bd71828_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &bd71828_volatile_regs,
>   	.max_register = BD71828_MAX_REGISTER,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   /*
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 4798bdf27afb..7755a4c073bf 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -87,7 +87,7 @@ static const struct regmap_config bd718xx_regmap_config = {
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
>   	.max_register = BD718XX_MAX_REGISTER - 1,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static int bd718xx_init_press_duration(struct regmap *regmap,
> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> index bceac7016740..3a9f61961721 100644
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
> @@ -62,7 +62,7 @@ static struct regmap_config bd957x_regmap = {
>   	.val_bits = 8,
>   	.volatile_table = &volatile_regs,
>   	.max_register = BD957X_MAX_REGISTER,
> -	.cache_type = REGCACHE_RBTREE,
> +	.cache_type = REGCACHE_MAPLE,
>   };
>   
>   static struct regmap_irq bd9576_irqs[] = {

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
