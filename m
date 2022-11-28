Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31C8C43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6ZVYRdgz2MOCtvuHFiUvwuumIZVYsPds/s0ZjD8HmQ=; b=4QcSgBwzofdQd8
	HzQ7dyqa3R2nYj/lYwzwYwJGGicebnN0X7LpTceb5NyUkqQMhCj0rRITc4S/QF/hIikn1WLSVXb9g
	71f+a4H36lrmadcV6GxYtDarCtxc0XF5Q5/CiAlOyxM0krqnk5jyAblDKCeqonGp/hCF8jLzRoh9M
	649owjzQrn7wKrK6cVpXXph2V2hBgChKNtv+ksv57efNr+rQ/az6gKv5FIEC24/YANLQgzAsz3X9R
	DWh1eGi3Elin5T9ERFhM/65W852aKl+hxpvzKLne11s5vEadZ+oWXlLsrk6GnCRF3Q/DjYTuK0RyH
	78TQF9uWzP3Xfhfgq+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcXN-001Nhy-Gf; Mon, 28 Nov 2022 11:43:01 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcXB-001Ndf-Tt
	for linux-amlogic@lists.infradead.org; Mon, 28 Nov 2022 11:42:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id be13so16915933lfb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Nov 2022 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JW3L3Bp1tixWEJFW9KkuTzunuGdrxdHxaArzuZlqgwg=;
        b=uZMNnGTqFeYPmqTg00CGhxLquKegPgAX2zJBqPZfiUeepL3qhbOEodUwGiZVN23jld
         BjB7flA9VQd7+kCSugUnXRnssi4xtrAw54Jk4llVaMtT5H9XGV2veC4QKcLSQ3YFFiiS
         pjsakE+P/0dePdn7joy1xZpRIRu5EgbWf3Cj0SH/IFbB7RAF00IYpbL5pxXyHugPdMlS
         g0eEcl6LiLSC1vTIeBdYkweH8ipDmUofCJUUq4Pdl8DPb03UruvsAi8IVqkstGIWdeXz
         jUTvAfkLkt3wFor5QlpuDU106doC4kLAYg5utiVFc+x+iGfWefgGQHOFprW+s1Xqx//6
         PMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JW3L3Bp1tixWEJFW9KkuTzunuGdrxdHxaArzuZlqgwg=;
        b=dp8VsQK+LLYHKIxzLiIu+7bSWjd50TNpXEuPa9il0XVcRpKeYNbzwEFTXVShDpfNDs
         5Et3bvhUKpSKRehW7PjZSFm7oBsYdnvcXzg3DMkXAcqUGEP2D2ifa/Pm4psU5iitOxgW
         rgcxEtmoH9jZIJXDEBxUeConhPTdUj1e5WvGikXSlIPMT+cPfyNw1j8Q/SojNJofgbr0
         mYhqju/T3vDk6W9otQ7mt9AChors7rQDKXcmDakI6eLoDnHb6Svg/WHdEivawdfI5ope
         x9LX+uo1td/7ca/r7lHO2HDB0fPTbl41pTcYujboseWv2MeCsCxi40iBFrcuxTQzvWa2
         IgWQ==
X-Gm-Message-State: ANoB5plsPNC2jAuG+8B0W3+TUvvVYlLSKe2idO+LUtRUAr7ZZphqJ4dZ
	eupj6FmBdkyc/8ReNjOC9a+RRQ==
X-Google-Smtp-Source: AA0mqf7olWvb5Zj1dxpRFdUBBN8BxguAWCuanq9QQAYqwve+t01cFZUYcM98HAzPlkT7uQSr6rkzxA==
X-Received: by 2002:a05:6512:3603:b0:4b4:b5d8:880d with SMTP id f3-20020a056512360300b004b4b5d8880dmr15662151lfs.121.1669635767332;
        Mon, 28 Nov 2022 03:42:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25cd8000000b004a44ffb1050sm1684825lfq.171.2022.11.28.03.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 03:42:46 -0800 (PST)
Message-ID: <8f26bc40-10eb-fb0a-8a69-a303b42c9e60@linaro.org>
Date: Mon, 28 Nov 2022 12:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: reset: meson-g12a: Add missing NNA
 reset
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
 <20221128111740.39003-2-tomeu.vizoso@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128111740.39003-2-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_034250_087614_EA10350C 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

On 28/11/2022 12:17, Tomeu Vizoso wrote:
> Doesn't appear in the TRM I have, but it is used by the downstream
> galcore driver.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

This is a v2, what are the changes? Please include a changelog either in
cover letter or in every patch.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
