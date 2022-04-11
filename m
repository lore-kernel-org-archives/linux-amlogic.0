Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAA6C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQnSLD39UMVk7cc+duO3H2QalJCEpITZzfE3hp0YTSQ=; b=oLar3/cQ3WJW29
	J/Pe1c4z5Kf4/p4PrKHmdHqU9+IJlEuUEbhe1T9NDnMcWGHclN03B5WWBevmlbdCamnJHaky2tfLI
	45vEelZW7CnhC8/9L3p6cycQxkN5/oqTdfBC/OBkQTRfqjaugZQT82lbchjqXT9Uod5dt+aPYVLUu
	CSPxXnzxn+rWvRh5neasNV6vJIw9XV1hDs9I3ukEBx1SowsexXP9lRlIOAHcOqy0hXWE4LSMmsvch
	iOA8ZnjDBviXtxK4auOz9DVCzu0uys1Pr1Zotl3MN9ZVe2n5SUFKsz1FYsazrzme8nKEQSDQHnmnR
	7qCDQMaJOmbudlhPpGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndplW-007dxt-6P; Mon, 11 Apr 2022 08:51:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndplM-007dtV-C8
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 08:51:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id h16so9452235wmd.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m6Rr8Q+wNYGD2XdkMJAOXQ4QLeHTvBKuFe3IakxIc9o=;
 b=2gVvFevmuFI4scv9tPcT0ePc8WClLdpec0D+yRT76NvO+/jTUBuB7nKNKaEFf3CxdE
 CGbQ95TQ/n2nlj8YRwk4C9VCNtLpzQCq3aTdJX0v/dcXGrha8M6VKP9w6E7RQPdgpIsh
 kGNtFSEet6RuGe6lEIJDpOJJyElFcJyoUugHM6G2aASpuVUwHdE5CdhruhL/q76Mr3X+
 KcVlCtjv97fQvopOKNhnYs6MSyeQnfejmbQKu6rKu6ewpVbnMid8Iw7AOn1izrVfVUqe
 DjUK2fNVVlLU6tLTBGSYgeTxiIqQQfFCLaHGooEwdL9OBhA3zn9eqv1yBOJEt81WKSBp
 Crvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m6Rr8Q+wNYGD2XdkMJAOXQ4QLeHTvBKuFe3IakxIc9o=;
 b=vTTIrnyIsXLhsAOBp3TGqF/QrXl330ls/Anih5OYOX/g7k3hLHgG9DOlj7OqOKHyHU
 hoL180JUXjBuXnnpuitmZ5eMw3UjOjpGsQtTyOnS2mf+IUUcr6XsQhuBdnAgZRnz6h56
 6oZZgg6wIhBrlYfMHdtale6cBQX4r0Rlr0Kiiag6Eyc/dEukoFP2WjbR4g7wjswtKinB
 hHAvWslPy27ymrOe9Ba4IWTvVAP+1hEqMCliwN1xW2kzHnGGIwTwTvFRZeex1Vveem4U
 vK1GItIFlJjgRhr+PUlYnj5l2WvA4H305GE5CdLC+UvAdqgx+eHYRrgU9/gS03otEEv5
 aLeQ==
X-Gm-Message-State: AOAM530X4rNC6fiJovesbq/V1evVqGxkzb8h0TIFL6/EbAW6QrLLyn+b
 LOGSUPcQXYg6+7kgsCR1meS3vw==
X-Google-Smtp-Source: ABdhPJxWXrwR4K9SIIL0U56pGlKvwNYLYLRcg+MDZygJPCmSwC0yOOXBgd65Dx2bXtovwHAtjIDEig==
X-Received: by 2002:a05:600c:2306:b0:38e:bf1a:a669 with SMTP id
 6-20020a05600c230600b0038ebf1aa669mr1381664wmo.11.1649667063694; 
 Mon, 11 Apr 2022 01:51:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adfb742000000b00205eda3b3c1sm27276509wre.34.2022.04.11.01.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 01:51:03 -0700 (PDT)
Message-ID: <d6ef87bd-8721-effd-8d26-13cd6d674cce@baylibre.com>
Date: Mon, 11 Apr 2022 10:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Content-Language: en-US
To: Guillaume Giraudon <ggiraudon@prism19.com>, kernel-dev@prism19.com
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220410205624.14295-1-ggiraudon@prism19.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220410205624.14295-1-ggiraudon@prism19.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015108_441444_BBED59A1 
X-CRM114-Status: GOOD (  14.72  )
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

Hi,

On 10/04/2022 22:56, Guillaume Giraudon wrote:
> The labels for lines 61 through 84 on the periphs-banks were offset by 2.
> Realigned them to match the Banana Pi M5 schematics.
> 
> Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 5751c48620ed..754c3d43ef0b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -448,7 +448,7 @@
>   		"",
>   		/* GPIOA */
>   		"", "", "", "", "", "", "", "",
> -		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
>   		"CON1-P27", /* GPIOA_14 */
>   		"CON1-P28", /* GPIOA_15 */
>   		/* GPIOX */

Can you repost with a Fixes tag ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
