Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32EAEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1r4eMu3HrDCVWcsRjGA0EC0E6WZqC+qA/ax1qyQFPY=; b=R6YiTXJ49OYtIR0AHGqfXeHL/5
	a7kiAme3y9wuhbUoOaHt7X3i3g/D6xXTKAceOvmFkOjG+iDgLtJhS2ZuRAYmNzvlYjHymudgbfF13
	2AfkyhdYjb0qO06DPX2k5sdx8AfjhPblw6D/VF0CBlkQQhUoOkRCuY95bhTu3ALf+ESReS9QyCeH5
	IV61yb0Eq7ETM62yymayTGtwRkqJ9TuCzcA3eK7jWRHBcEV5XsstDwkh4EAGNe1Mdm6+7sOES6vzd
	nQySWJ3QxYvg3UJCP5fsdfuD9+pnxbD7rDo0jbe3pa6gFTQAEFLS743fwnbOMq95df8neJm2xF209
	tJLms5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGett-00DDHF-0d;
	Tue, 04 Jul 2023 12:12:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGetq-00DDA8-1B
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 12:12:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso67352615e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jul 2023 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688472769; x=1691064769;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LhKrYRWaKadZinHNjk4IjxV4XB16+8Bcs0W8RkZyZfw=;
        b=hRg9xQ86UTETw+vimhaWGpKVW/q6p9fdF5zB1ZvVG5JemfAMh8HcOmqShqdMyeNtsg
         zY6N2rpcD+PHCml7jUOldharNXZmXQFQrTaTJgHNODjhjVA/0ryMosxz8XGCwkCJZAhX
         WAGh07QPaPddLCGwn+ZrVHi4J/v+GOX8g07WePNLM9jSVU47rgIRtX6JHQY8rGR2Mu1Q
         GnjaMgVMWXbZ7AVsfsGrfLaoJdOl91brTvRHEvjUiJDyylF52aAT8BK++xh0ikiiopxj
         7ATBO9vnwL+rcyFwMQvAuo4ygOqAfmVr18pNL4CDubqDEPVf9Ovbazvhyw9l3us0BE5a
         F8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688472769; x=1691064769;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhKrYRWaKadZinHNjk4IjxV4XB16+8Bcs0W8RkZyZfw=;
        b=fU3M35CO10SABghlBJfR/hvu41YhinZIkNxWraTmTCm8aBpM5sOJm4WDtPenFQeeMA
         J9TxUalvaOBmQs1y9lDnPW3cXvtNlSui73rCE0cwpMHwcjJPaa2ngVTn3ouYrikIg1UL
         10VNScOdL/tOQyD7dnsbzK6mO1xyySj34+srdPfEi8d8wGbKDUb71FvJ0C92wiF0faKD
         iunBNMk/xIPr7M5NDCCo/sAsZ07RQ64fSBK3HwSd9k8waa8G61QNKIKeNuFRsTYOPCGQ
         RtDdg5XGJSPhRyF9zqwc5KAnL/jrtlh47d9pzWw5UygZ+l2qYfCx8t98ZuH2KJ8oTgo6
         GW/Q==
X-Gm-Message-State: AC+VfDxqwXh+oVc9jM6XCMAhIoZOLw0KUVWxhbA6yfWtnVNL122+zPEB
	JP0rLi5wFTP3t3VBYf3ff/iIyQ==
X-Google-Smtp-Source: ACHHUZ7EwEWsy9m15nLEYSLtXvQCNPfOglovegeNcg9TvJO0iQGw8ybbV6xToc1WUY3fMRQ1m7KlQw==
X-Received: by 2002:a1c:e909:0:b0:3fb:b05d:f274 with SMTP id q9-20020a1ce909000000b003fbb05df274mr17669372wmc.4.1688472769013;
        Tue, 04 Jul 2023 05:12:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b? ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
        by smtp.gmail.com with ESMTPSA id d11-20020a1c730b000000b003fb416d732csm22395302wmb.6.2023.07.04.05.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 05:12:48 -0700 (PDT)
Message-ID: <c6d4daa1-d58a-2a29-3121-e1405c3ccc15@linaro.org>
Date: Tue, 4 Jul 2023 14:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/7] reset: meson-audio-arb: Convert to
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230704120211.38122-1-frank.li@vivo.com>
 <20230704120211.38122-2-frank.li@vivo.com>
Organization: Linaro Developer Services
In-Reply-To: <20230704120211.38122-2-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_051254_438094_747D718C 
X-CRM114-Status: GOOD (  14.88  )
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

On 04/07/2023 14:02, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/reset/reset-meson-audio-arb.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
> index 6a3f6a6a3bbf..355e041214bd 100644
> --- a/drivers/reset/reset-meson-audio-arb.c
> +++ b/drivers/reset/reset-meson-audio-arb.c
> @@ -138,7 +138,6 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	const struct meson_audio_arb_match_data *data;
>   	struct meson_audio_arb_data *arb;
> -	struct resource *res;
>   	int ret;
>   
>   	data = of_device_get_match_data(dev);
> @@ -154,8 +153,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>   	if (IS_ERR(arb->clk))
>   		return dev_err_probe(dev, PTR_ERR(arb->clk), "failed to get clock\n");
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	arb->regs = devm_ioremap_resource(dev, res);
> +	arb->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(arb->regs))
>   		return PTR_ERR(arb->regs);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
