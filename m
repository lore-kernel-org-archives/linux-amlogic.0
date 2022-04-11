Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF450C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmcAw3rZIPCJnne5DTHzpWARYPrhMu9tELPw7/So71Q=; b=Dv2GNryEMqsYYM
	eMsBZtyeIvUEPifzozzldQJNpKp0eN2fYLzMamvewEP9ciYiaEv7yYnWQrF/1DsSPu/CSXBmBMuXx
	0no8rtx9pDH1d+8gXQCxEYaGq8r52DjeFlxQbtCbTg/SevEcaxpb6FCP9KExfp6BgppNp6PvyFw+p
	triYCHxEoRV84KK5TQ2M8UhqLfjwjebINuDr+VydQS9k08Uekx5MGGpMjwhTypXtkkUiwR51DZCfB
	9me0qa80oNgUtdPY+GOrlU0nkvQT5lHygl00JdMaVC/X+nSdXj8hGrFzJIyKGWl/b/kLoA34amzLR
	1CN/9FVOymMNi6R869ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndwMz-009g4s-NF; Mon, 11 Apr 2022 15:54:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndwMv-009g3g-NE
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 15:54:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id r7so10193411wmq.2
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tlR52mYiE9r7eSIRLMcwLn8IMEON/6GE7sgWO6ZBnBk=;
 b=wa0W+SMBcn4p5tTd/xN9SHSkxbSIdpuOoKk4xWg0YXMi8qwrcsoPTfMVZqmkYEw+Xh
 Ysps6vXjV065zNiOuFdsaB9zzDAsiKS/7cB3dqKpAjXeJxAN1h+YDN89MB1QdI5+8Y5a
 g6MNrkqtFK9AJO4c70tr6wAxiEwfdKiCPBXYG2IUOCBFH0ZWjbSP0rowK2Gcdg9J8e6f
 OqotiZu8cDdALhicKUKT6TTTnulhk6TKjr48lXRlpSwSY0UK8qutQNm+/bMsgj+ZzQZ4
 dk0IbKg6vG2Thyw90kfGRk9KjNhf229PxMpJKl9F6w56Zua2ScgLG3frlvzFbszR32tn
 VMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tlR52mYiE9r7eSIRLMcwLn8IMEON/6GE7sgWO6ZBnBk=;
 b=V4bSI6bCCM2nZm8tRZjHQm4lUP7ppqN8IuVV0omYPF8J0RHRxkYtX4FTi1ycDx4ejz
 PIhxuYe93aOkLM6OQgij4tJx22GbwVoO2yRlH6r0qGmIO7u+Yhmaq6JBh5UCWfRjahIJ
 3AFNhT5v7ELrU7SwcXm3ZjLrJYSadzb24RncMZ43pTdMFM+qOTPEcsyeU5RevVCjabQ8
 MmBaPqqsbaO5x84CRPG9X/SxvF/2LsWIIGY7/mlYmX2y/CQWvYRJ4JxcIIxnpXcK3UQs
 FV/8bZG8yXf9cA+H32+N6mQIc+CvN7PkCHKfJe057jJ9ITcxLpch7jaiNlUb5mozUB6n
 Ftdg==
X-Gm-Message-State: AOAM532H4PKXSJKNNEhE+tM5GrKjA/PuP9BMB8ZTVnGA2BSNZHKTB9dS
 voM75BGxNl8yV3TPp4DeunaVRQ==
X-Google-Smtp-Source: ABdhPJyuzEkE7dFzuOWFDkdd4xVdCuj8DDoi39proBdkUw6lKXK5xnrf67uJ25lDoXqZUJvxQLdYFA==
X-Received: by 2002:a05:600c:34c4:b0:38e:b628:da95 with SMTP id
 d4-20020a05600c34c400b0038eb628da95mr9011973wmq.150.1649692460341; 
 Mon, 11 Apr 2022 08:54:20 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm26066633wmq.27.2022.04.11.08.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 08:54:19 -0700 (PDT)
Message-ID: <a4bc92f8-1d10-84bf-00d9-fd2c22dacd55@baylibre.com>
Date: Mon, 11 Apr 2022 17:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Content-Language: en-US
To: Guillaume Giraudon <ggiraudon@prism19.com>, kernel-dev@prism19.com
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220411144427.874-1-ggiraudon@prism19.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220411144427.874-1-ggiraudon@prism19.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_085422_004347_DD9C9AA3 
X-CRM114-Status: GOOD (  15.07  )
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

On 11/04/2022 16:44, Guillaume Giraudon wrote:
> The labels for lines 61 through 84 on the periphs-banks were offset by 2.
> 2 lines are missing in the BOOT GPIO lines (contains 14, should be 16)
> Added 2 empty entries in BOOT to realigned the rest of GPIO labels
> to match the Banana Pi M5 schematics.
> 
> (Thanks to Neil Armstrong for the heads up on the position of the missing pins)
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> 
> Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 5751c48620ed..84489525c75f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -437,6 +437,7 @@
>   		"",
>   		"eMMC_RST#", /* BOOT_12 */
>   		"eMMC_DS", /* BOOT_13 */
> +		"","",

Missing space after first comma, will add while applying.

>   		/* GPIOC */
>   		"SD_D0_B", /* GPIOC_0 */
>   		"SD_D1_B", /* GPIOC_1 */

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
