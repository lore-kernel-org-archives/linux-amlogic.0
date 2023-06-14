Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D720EB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFUB2ATSfBfVyLNn0J8kNSCkTnP/tB7Vhz8RCKHeu9U=; b=Mx7h9HrKtdOBm8
	K5+hnncTSwjoXTWhx1LbRJu5ljJWdG7le32SsEI5onFc9VqJaRgbtBMKD21YwrCa6gs8Dp5WWnXJi
	O4eDDTLdpH40GA8/VPAySeIImFc33oUfKKT//w6QdMgY3tc5mVh7TW2tgqR2Yzv8BMLtEsCdVvJWf
	+U8fGiLYr2kQ5rYAaTFyUf0jDTksRhwe8PaFFOtqlRmFmM1rc0hJKaYiuLdBQ9q1Oe9C09MPWz5Df
	3f5v02TqGOLQtRnuHNo3i/lWmiGwB6VT1uc7OCtA633zSOIQZsQvyKrUlMxrtMkquOqPhjxDT529g
	JcAnqc7TYa3htU36fZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9R9D-00BrRF-2i;
	Wed, 14 Jun 2023 14:06:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9R99-00BrPe-1V
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jun 2023 14:06:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30fba11b1ceso3995242f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jun 2023 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686751610; x=1689343610;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=eATVzpknI9vc12mAnk+3E8tRwnRlRtGyRp8XCmtZkaM=;
        b=jV+FuvFr57hMTM6OFjSFLXVbjzQAfmXySdUUckZXro/5AOsBR6XEcc8i2kSttpnEJT
         x53AGbhlgp+es3Jfipn2qsyzL1hkJX6wFEsYVQtObJ4/5i6SqhbWUL+8UA6tNlKRrumv
         zl7xgnXzMIONm1mNdNnsK/yZSIB20bONCQPJB6/VANLqqPrjSkqQ9Zmql/b7X3U3w+2q
         hOZ5XxQhFtTwmwLdIJKnhSIKFK4KC/Idu3x8tK3CzSvPSaHAwaLGaLib2AlStBCWWaSF
         RBEzxVISbq5FUFDjwx7VJiZ+iL5mD9HckqTm+ErLOAEEfLZQPh3msSLthRwcBFOAa54R
         FDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751610; x=1689343610;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eATVzpknI9vc12mAnk+3E8tRwnRlRtGyRp8XCmtZkaM=;
        b=MaKsodCspRDxJZ297cZUnLhXZ0rCmRSx/GCwwhI33SEANnapXjji4K7EdcRz9wkuWh
         iH/QX8bTsCcM1z6OFWirMmNCBTkv1RHRYnS9al28pbAw+36ej/vJulfKuYVqDg1x2jx9
         eXxfSenNWGhZd9r7ZPvLaCjWLF21xgctNTuj5zKLFWeuVcb4kC8noD+nzTOe1BGH+/AG
         dIBUHkcfFb7S/sLckg2zihVpioR73uVmPb2Ftcz4CAYAADkkgq6/Qj9345B3FtQci2UL
         N7EwdLhboHAoakJgs9DPemEYWd2148RvdzedaIcq2dh+Q1bmUQU4HHobHth44O5L8u7B
         z4KA==
X-Gm-Message-State: AC+VfDzhJZfAediieV+xBpkvcZ76QoQGu/MhL2pCZCoHkfGktsky+97C
	D8It3iBerd0n+eETqk/JC4+VHA==
X-Google-Smtp-Source: ACHHUZ6a4exHUhNfyj26R+XQpCs0IWFQfsm1S2MG5jN8npheMWegY7/+qYhEIR4M6d2x6nbpM3+wkw==
X-Received: by 2002:a05:6000:1814:b0:310:b979:d00f with SMTP id m20-20020a056000181400b00310b979d00fmr2362939wrh.45.1686751609916;
        Wed, 14 Jun 2023 07:06:49 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o17-20020adfe811000000b0030fafcbbd33sm12673191wrm.50.2023.06.14.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:06:49 -0700 (PDT)
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, neil.armstrong@linaro.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
Date: Wed, 14 Jun 2023 16:05:30 +0200
In-reply-to: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
Message-ID: <1jr0qef893.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_070651_507852_9768D153 
X-CRM114-Status: GOOD (  11.11  )
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


On Wed 14 Jun 2023 at 16:48, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:

> No functional modification involved.
>
> ./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5533

Not sure this tag is relevant

> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Apart from this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 56ec2210f1ad..8fef90bf962f 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -370,7 +370,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		usleep_range(10, 20);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
>  		usleep_range(40, 50);
> -	};
> +	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>  		meson_parm_write(clk->map, &pll->l_detect, 1);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
