Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C06C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MifPOVV3VJS0NK3zRVtEhTjGuUYNtjDGTpI6qKuv5w=; b=eUbZQe6nPgfhuwBSkIJ+5tAUAV
	Qnd2/Rm3tyAkSikp/Z7qTHpClDEsbwA9euNRS3DX6DEbpEQSEumUP8Et6671hn4bk9BrOr5wogDWf
	fOFQw4L/ObV3C8jTQgCr3UpAyX6tZi7vo06YSIvTYRtqzoPw9A6q7gzPiXr+nlfx1olM4fMD3sIBf
	RTcKJ7Z7FWwfSOf4PPtdrS2hKBvZK9vwgaAlZMUMZPIdxmob/WpvUO4txvuPzxTbyLdHSAobtkSLs
	zU4xsYcWPOE4pvd5ncb0jDhOKsl9QPhmSI6d/NuKLF1Ar2ppMYSgAryzegM8JAoDCwTAdyA69hqtY
	pRSqFVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOdR-00Eb3v-0x;
	Mon, 31 Jul 2023 08:52:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOdN-00Eb2s-3A
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:52:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31758eb5db8so4468575f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793522; x=1691398322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VLfWbi9LpC+kAc3VGMMFbleVV5XYZZSHuZj8dV0MRNQ=;
        b=FJR40C7sbicVIIcodXp71hYuVhBgeudkRgQSSBTx58mWsaH14NYH2tlakcOZMZqxk7
         ZL7focUOBxoBxzDKQFyr62olZJnM5/eixvH5KuTthddb/IS6gutu2nYMxkCDFtQ8MFPG
         cjISnP0BxDZBVSzf2l+qf6IS+SYQMQICsrI8Rpkp7VxHpjfD7nRj/HkTdaiW53VBJoiR
         WJjR19qOxlk8eSS7V60zZdQvW1a//lYBM92R31yTBqbDPd2Nj1u4X7MNruDANA4IHaSj
         XBKu/q/zb8Ik1sDaiP8p8A4W5WCMKVFg9IoezXR9B1VcqVVaZE6NvqIQJINfaw7dKVTd
         KfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793522; x=1691398322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLfWbi9LpC+kAc3VGMMFbleVV5XYZZSHuZj8dV0MRNQ=;
        b=CjFbXNqxZQLQSE66I56oeX1T5Op3Vzzr9oV/b4b3Mfvwrd4y9QiOF9jYa9ef+kA6Ta
         j2Y0vHdXabgfop9vZTBTKUbzTVq9+uN0H2EUCpK4OsS5svglsHfqcGxPM5SFx1oAOu1F
         6+EWzWpzvq+cgAyuA2/2laU/a5roQotMwx1MS5dCn6wrtDRxy+A6/z3tn/rPK9n6ESg9
         qwmgHt5cKIJsp7FCoYWKHPqqP7aa+x4yshsOttws9rn5+uVSQ0utKOo3Z2XyhxqvMQ1q
         Dsk0Y9llXaI8Q8tlXmUSDCe9SMZAqf1+3rMbc1OXDxbXRsXnyO8rhs6zxyTwNQXurjMW
         o7JQ==
X-Gm-Message-State: ABy/qLbWNW5L5B+mAeeCTUZajRw69gaVHeJfDIxL/VfwNPdVQU92+V/3
	8C8FrslxaVkdDQbbe4UPcDklkd5QgLXYA9cZYy7EFCRE
X-Google-Smtp-Source: APBJJlHwcsFlqzq6Ui6fHsJxLcC3Q8EQl4TVADmOlbJQGH/OQBQpfNySHW5H12XqkePG0iNJ6TGrMA==
X-Received: by 2002:a5d:60cb:0:b0:313:fbd0:9813 with SMTP id x11-20020a5d60cb000000b00313fbd09813mr6600073wrt.28.1690793521863;
        Mon, 31 Jul 2023 01:52:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id t8-20020adff048000000b00317878d83c6sm10179563wro.72.2023.07.31.01.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:52:01 -0700 (PDT)
Message-ID: <78f54ba9-2ef9-02b2-63ed-85b73f5b0429@linaro.org>
Date: Mon, 31 Jul 2023 10:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ARM: meson: Drop unused includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230717225623.3214384-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230717225623.3214384-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_015210_046545_EDD14BA1 
X-CRM114-Status: GOOD (  13.53  )
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

On 18/07/2023 00:56, Rob Herring wrote:
> of_platform.h is not needed, so drop it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   arch/arm/mach-meson/meson.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-meson/meson.c b/arch/arm/mach-meson/meson.c
> index de56e707c7aa..d3ae89dd84bb 100644
> --- a/arch/arm/mach-meson/meson.c
> +++ b/arch/arm/mach-meson/meson.c
> @@ -3,7 +3,6 @@
>    * Copyright (C) 2014 Carlo Caione <carlo@caione.org>
>    */
>   
> -#include <linux/of_platform.h>
>   #include <asm/mach/arch.h>
>   
>   static const char * const meson_common_board_compat[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
