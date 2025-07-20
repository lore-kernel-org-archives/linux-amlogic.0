Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5D0C83F1A
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Jul 2025 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cWSq2tFN3YMHIMHCwXWPGDlBRgBv2WrHs9hr38zAW8=; b=2L86C2CA7UO0Wt
	H7dRu3CRSUdWPClVPZ27Ug3r9ph+/uL1V80DawqMSlQHwefdNy7yIJeVc5azxB8IaKPH4fLmiBCFh
	XIL2wbgnWrb0FbdpsDkgt95devBBuDi02HEaHPBdVOGx6xJsS8DdCS/DWuuRKfLxoqIzI8eEkHZfK
	wsjpS/gQj6AnaTNtCEBp6FwcN9WSqqmnr9KkfgImucnmGsUK886SotBFNSwMDnvOHAbQDunOaiSlL
	+c+d6KNBCtmBB3EOmhPnV87Gti0xHqKNpaPAe4Z+UhQXYX19pVbTvLpm8ruxKDqLjIv456SGwwk1t
	eOsKKV+mlclLgn70sPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZjq-0000000Fezf-2EPQ;
	Sun, 20 Jul 2025 19:30:22 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZjm-0000000Feyy-3YDu
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Jul 2025 19:30:21 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6159e23a6dbso686650eaf.3
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Jul 2025 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753039817; x=1753644617; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgCpQGFdNKfFxGlOj3n44UsvhM4SmScTq7fqsGjnsnI=;
        b=lDYuCseu73XsazMbnDszupGQ+DKHXTzF6hfLIN7/pPMRvfWdiRg6hwE5JFeuizrJWA
         etjfYKsAQtBkrE12qLKuq3YoztfzvgkOyatlVVQDh6z+flC1qz1IXdHglY1EVHlq31iQ
         Qr2NIWU5KVD0ENHakQBDB4Sbi6iZc94JHTf/cGRauBpU6e0iMHThSTrp4CTP5gqExuXe
         B30WzU3EsOnFlCHtkh8OtuTDA5Duu0Zg5CMWzf5jVaIfrH0kd1f4jZEOzOaG1sTcEdst
         vZuLINk11/P78suxyEByxWduXLEOwOLdf1VLvxeGwsODwocIcKmvfH4DmnRwEPOOB6sO
         rFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753039817; x=1753644617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgCpQGFdNKfFxGlOj3n44UsvhM4SmScTq7fqsGjnsnI=;
        b=o3nPH5I5ugbPJ6zSFs9U0FQSJZGqN5CZwss6MXH7VJ8qsJ1XMnscdGi8o1eZZNnZFS
         ZZBjLLZx99h1wd0ZwSsjlNYB0K9s+jMBANOg4BBLu0b5YwaA4RX/CTwDMFHckFpw0ChV
         gqmN4IW5K+XjCMJYCJhTbmT70hBk0JByqxQKbooZ/QgFia+pFAHUmaCDKmVNYjpk+8BO
         cu+LZt0eA37IKcINrgIkmDxoXNFfZZiUPyi1M5DQQUja3mLvZmYJcWiH/l3yNLti/Xik
         uHilsEmJsP7lxlAhwbQz9UBKEUGmizBzN8EsVapMZnbzHPq9462I6DrdpCuEpvCsvoTm
         Va6g==
X-Forwarded-Encrypted: i=1; AJvYcCXuBA5w382OMShxEpucVrYYreprlC+xVZeD0V0/tlFj8z1Us6J+srB2cwHIajhiT4dvCmVrezGqqkaahVru@lists.infradead.org
X-Gm-Message-State: AOJu0YwMJwzl1adiSZVh1PaG+3DlHbdcFjf0/EshUiHA6VFpqT1I91KN
	oiz16W/Rgo9H2pdIrOHLwfT65OlOs3D6NiW1U8+JIRi1X+fUL8wAV1rZaSSeobWSIQA=
X-Gm-Gg: ASbGncvG/iiH3qUmpSxV1ZJGp9nIsW0t02VdmAtxhSN3325t4AL2hBHs/p03APVXc1x
	/e114VeXvw2OAL9omCaIqlaRGRyv2H7r51oSvhTWYJ8+wg9jHu9aFUtPtTCP1slnz70gLjLOI+e
	Cd4s43jGqk0K2ipVnf9VBS0NkHwYq4u5Q660eQ1CfzOT1Avbc3chKlt5SetbBt/dB3ZW/b2XqpM
	+nyc6dAYm+eqnLLNY+zMMWNPDtJA3ewKwIdAWBHG/Mv/wIzVPAHxBnfSLTWJucv6Uk63KyMzVWl
	cLiPKtU+8QYhZN7mMl6ZTtJZl136MUN4rbxYpAHnruwV0SQGfb6U21+KeFzNdS0y6AmmbxeuH3X
	G3/w/a1jAoENnrMq2ZA3rZ5oLD2Jh+BC8zCAMdtmElXDs3u9vvreA1NGY/sIggHf/fM0azE8JVt
	w=
X-Google-Smtp-Source: AGHT+IHYlwxJWcEbEzE218c+xTVkYKK8Z8wtqJxL+cWGCmY4FshNpm6DDdkY0i7NRft8/tk1CqodKQ==
X-Received: by 2002:a05:6830:2aac:b0:727:423c:95d5 with SMTP id 46e09a7af769-73e66114315mr14839191a34.3.1753039816972;
        Sun, 20 Jul 2025 12:30:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:6b9c:951d:3d17:9e9d? ([2600:8803:e7e4:1d00:6b9c:951d:3d17:9e9d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83be07c4sm2291733a34.61.2025.07.20.12.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 12:30:16 -0700 (PDT)
Message-ID: <84ad0f66-311e-4560-870d-851852c6f902@baylibre.com>
Date: Sun, 20 Jul 2025 14:30:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: ">" <sanjaysuthar661996@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: ribalda@kernel.org, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
 <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123019_130997_24CFF915 
X-CRM114-Status: GOOD (  18.89  )
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

On 7/20/25 1:26 PM, > wrote:
> Changes in v2:
> - Fixed commit message grammar
> - Fixed subject line style as per DT convention
> - Added missing reviewers/maintainers in CC
> 

By placing this before the headers, our email clients think this
message doesn't have a subject. It should go after the ---.

> From 5c00524cbb47e30ee04223fe9502af2eb003ddf1 Mon Sep 17 00:00:00 2001
> From: sanjay suthar <sanjaysuthar661996@gmail.com>
> Date: Sun, 20 Jul 2025 01:11:00 +0530
> Subject: [PATCH v2] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
> 
> Fix minor grammatical issues by removing duplicated "is" in two devicetree
> binding documents:
> 
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml
> 
> Signed-off-by: sanjay suthar <sanjaysuthar661996@gmail.com>
> ---

This is where the changelog belongs.

>  Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> index 20dd1370660d..624c640be4c8 100644
> --- a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> @@ -9,7 +9,7 @@ title: Texas Instruments DAC7612 family of DACs
>  description:
>    The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with
>    guaranteed 12-bit monotonicity performance over the industrial temperature
> -  range. Is is programmable through an SPI interface.
> +  range. It is programmable through an SPI interface.
>  
>  maintainers:
>    - Ricardo Ribalda Delgado <ricardo@ribalda.com>
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 0cd78d71768c..5c91716d1f21 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -149,7 +149,7 @@ properties:
>        - description:
>            The first register range should be the one of the DWMAC controller
>        - description:
> -          The second range is is for the Amlogic specific configuration
> +          The second range is for the Amlogic specific configuration
>            (for example the PRG_ETHERNET register range on Meson8b and newer)
>  
>    interrupts:

I would be tempted to split this into two patches. It's a bit odd to have
a single patch touching two unrelated bindings.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
