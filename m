Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C84C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2Bde0Xw4YKYNAFgzygoLC8E0PIn2nL+8RNQfdyMmO4=; b=2rAKb8KRbdG+fs
	bz3L+JJefi+VPq1OYhUOkSuOrxZoWQFn+iRib+FFT0CfQMRpdTY3wJWFXmtDlCUEi4Lxie+Y140tF
	CHw/zU7vtwDSWhdznzTJTIZ2waNOfOrHA5oUE/OJxMFzPPKRe7ZaUd1ZvHI7lV2mcJYkesu4EZeWn
	YZBlaBQ+0CH1GZi6DSw21zfsKMnJgZUYP6O733Y7EDlHmrVOvxelEqcfIgXkCsSpIsr+56XGxQoOE
	/cqUiyXmiMUawZguLZD4gwf6iMHAbZf8SP4YKu41+tq+vkyKh585XhEI55ZyT4VGGJQcB5pHsbP11
	+/+E+UZqFECw2aI4j0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeOk-0047OY-1u;
	Fri, 24 Mar 2023 10:11:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeOi-0047NQ-1X
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Mar 2023 10:11:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so2809598wmq.4
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Mar 2023 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679652703;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=begInB01sukj5RGggFoHNUNKWw4p2fTlflH92RQjtys=;
        b=HhT1nB29ydzX5PF0bXW52RYVNTs9v6IuqXvD72m0nvfScE2FIMQR8UlgwgNOuDzXAE
         zIU4NptYFbipst4gm3n2Brq4NesPRdckCLpMQaJfm4bj6o8eNQf1ppjkudLpJhwYmVlI
         j1MZ5zHTg+uFaTEZJWq5F6UmQhxkQh0QCR4+Qei8X6V1ar0BRu3Y15FkHMM9UU6/BOGE
         t4WMQ0Dsz8Fj9E3T3gBMkTvzaJ7vV7UBqPtUzfck8lOpxzz9+dCSmeEUL78WkPTtIT47
         mbsrSgnBRz1yADJw34LQtf4jTvZhwVHkwqoyQWz7YZmRQ0ySlDycLQbDU69s5BqB71W+
         qMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679652703;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=begInB01sukj5RGggFoHNUNKWw4p2fTlflH92RQjtys=;
        b=4yORt4APYR+EMi3PxqXvPlgOU2bYoCn54BMW8+/T+X6qPWuYmph8Pp7aWzpU0ZwPb7
         IelafBi6/84fEtTj/icXk0uLqAtvSfBs83XkW/aMf/lJqb6m4EHwlhy8CQD/amlzfcEo
         AwOUIcLXAMpdsBmfvh1LjxGCa2e96miBKvhyLjFb+d8mT52RsL9BzF516jIW3c2emh9q
         R4K7y3wZfDW85TPlOlOeX3LMQloWrLcTyeO7k1NrFjTehb7MUnQ7vRxrTAwaYRBJhdOD
         +h9+ZaozcpUSZkl0vBLVUz7v/dFQ+fk05qAQTGbDV+GQYlB78Qfggp++Td8ceBySdoaQ
         /oqw==
X-Gm-Message-State: AO0yUKUl3EEMlBUy38HjXKLWOhCeJ2tmjtRuYctcQTs1ueLwQxUUSNEC
	Y1f1siorbwpQJ/BYYxpP6yl0kQ==
X-Google-Smtp-Source: AK7set/9fgXTuSp8Lq5Om/uWBWc1ygPFrBf1H4iOs0sxSyWuq5jLXqCdoTLtU1j867CZLG4lhpeziQ==
X-Received: by 2002:a1c:ed14:0:b0:3e1:374:8b66 with SMTP id l20-20020a1ced14000000b003e103748b66mr1808811wmh.40.1679652703013;
        Fri, 24 Mar 2023 03:11:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0? ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b003ee65e7acbcsm4700489wmb.20.2023.03.24.03.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 03:11:42 -0700 (PDT)
Message-ID: <19b78f85-141e-eab7-2f4f-a30db3f8fb7e@linaro.org>
Date: Fri, 24 Mar 2023 11:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] thermal: amlogic: Use dev_err_probe()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, glaroque@baylibre.com
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202303241020110014476@zte.com.cn>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <202303241020110014476@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031148_512494_5A41F147 
X-CRM114-Status: GOOD (  15.74  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 24/03/2023 03:20, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>   drivers/thermal/amlogic_thermal.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 4bf36386462f..3abc2dcef408 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -262,11 +262,8 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   		return PTR_ERR(pdata->regmap);
> 
>   	pdata->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(pdata->clk)) {
> -		if (PTR_ERR(pdata->clk) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get clock\n");
> -		return PTR_ERR(pdata->clk);
> -	}
> +	if (IS_ERR(pdata->clk))
> +		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
> 
>   	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
>   		(pdev->dev.of_node, "amlogic,ao-secure");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
