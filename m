Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B17C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYkE0evWYwrUdTIOaWY5brQf+wYbH2/ha1y4h6/fTWU=; b=iJPCARewHRXnf7wlP40AO0SzG8
	UHpG5B5qSmbnf3dMr4RGBmDJ1TrWuIlFc8LdUyxVQn/bEmbRiOBbBNEVLgzn1MqsrUeSXh2RJVDi5
	q5cxruV8gyHEczOrG9Be97Fn8Xb5xozrDIlWsLPkj1H40BhNSK+zIIz+0VoT3k+7K8OMh3MT2G7jr
	YVGw/Jt5l/VY3xUq6RCJWJTVIkjuKu/OApgMnSj2Y7wMd6UrM/4zVwYRgxnl+DWZV9+dAT5ik+oBq
	tJeMav1XZk9aFi5upkMcrYW8FiuXkwbDl/e+ao2WsuLHTZqTyb38WqkPwDuAQxHl3pAYtTM93Gl+C
	8cYo+d5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxPr-00CCNf-JC; Mon, 08 Aug 2022 07:43:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxPo-00CCJm-Ob
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 07:43:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id q1-20020a05600c040100b003a52db97fffso2137729wmb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Aug 2022 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=H423BeLAypCbCKSxmHZM0X+T6gytpYF1rvFZiDskpVU=;
        b=mHhrQpWeXaeFNOE9biXzg8I5rVYNPNwvVXmJV6sdmAfbpvq6ZFGuXgN4ftIS/iNkpU
         /cLhTsyGuVr0wM2e/waI33FgzvqJuyaNqsJ1TJk0EPoy8ANHvjgKixwzedCUGlABT3Vp
         7aRMxTX9jz2QGpLKxnb3gla+1doKgmy58gRamGkfVzivQ+JhMzZfCfcLEBLtxMe0H2BX
         7V1djW8vB9LLKQWpkU9LxgtVVpruoC1TVNst/v6LytQ6n65LWYV6GK68qn1y/TqChl6m
         4xcBLyJP0ZCjxG1CX7E772t8P+RZv0Yt+0+1TYh2f+oHKQXg12dNGLjAXr5T6gNeSj15
         ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=H423BeLAypCbCKSxmHZM0X+T6gytpYF1rvFZiDskpVU=;
        b=VDdB/sPXcraXMKdiw+M+I79aOu3bh1Wo/y4yVKdNC4+P7rUdcGTFbOomLKzOdvFc28
         4wT3vP8fIy8mt8x3BlCyVa2L0gZah00jXA7hfm7jjSiIo1FW5eyvvGk6pnL48dSETu6H
         huoq2S/YBybCT1l9dTOtVFRekXQi0hJTipuA8Oz4mCUoL3fm+QfpdW2fQH5oPt8lJtV2
         f6SU3tgLZH4nlS2wME5KyYFwcgSCc6x9C2u5TLLNy0oM4VGjtO/OKIHOKOeqidW8LkWz
         mMBpeLi+XGkDjm5DERTHo9L+BfwjkcUFop9mFbH/uMbKcrIiJCVZy4Kz5sFVWOijuFm2
         vBZw==
X-Gm-Message-State: ACgBeo0PDZZgRSH8+qdd64Vj8a4VaOMlMb1ylj437aPRQsK0YdnIIibb
	8DqzvzJQlOiDZbBWv+HiTmhArw==
X-Google-Smtp-Source: AA6agR54HRv6Gzeefc3fvv7sxuxnu2DTZR/UUyqF4zfyLnu0iiHsgS467TzMfSXGDWYg5TGJ+BIQtg==
X-Received: by 2002:a05:600c:35d5:b0:3a3:2490:c984 with SMTP id r21-20020a05600c35d500b003a32490c984mr17216699wmq.162.1659944584427;
        Mon, 08 Aug 2022 00:43:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b? ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d5406000000b0021e491fd250sm10873022wrv.89.2022.08.08.00.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 00:43:03 -0700 (PDT)
Message-ID: <ba811c93-62ac-b8ad-8b06-d76dd7b5f33b@baylibre.com>
Date: Mon, 8 Aug 2022 09:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
Content-Language: en-US
To: Liang He <windhl@126.com>, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
References: <20220726010722.1319416-1-windhl@126.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220726010722.1319416-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_004308_828973_CDA9F875 
X-CRM114-Status: GOOD (  18.84  )
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

On 26/07/2022 03:07, Liang He wrote:
> In this function, there are two refcount leak bugs:
> (1) when breaking out of for_each_endpoint_of_node(), we need call
> the of_node_put() for the 'ep';
> (2) we should call of_node_put() for the reference returned by
> of_graph_get_remote_port() when it is not used anymore.
> 
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Signed-off-by: Liang He <windhl@126.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 1b70938cfd2c..bd4ca11d3ff5 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -115,8 +115,11 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
>   	for_each_endpoint_of_node(dev->of_node, ep) {
>   		/* If the endpoint node exists, consider it enabled */
>   		remote = of_graph_get_remote_port(ep);
> -		if (remote)
> +		if (remote) {
> +			of_node_put(remote);
> +			of_node_put(ep);
>   			return true;
> +		}
>   	}
>   
>   	return false;

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
