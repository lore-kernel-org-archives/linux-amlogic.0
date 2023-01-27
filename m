Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A7C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvBrO8YdBJfz1J629iMDrOkP8TmpwwUdn3FX2PQbCI0=; b=sdQqWwyq07+0pKWkPqMCKvF5R4
	r80nMs3OFVFHEkLokvxyDoxal9pOZ9IXb20sSRjMyZ/DNTOb7/SWA5sl0BJ8PUYtXSOhF8jg7Ypi0
	kquIzrQ0lhbQzG2vXtPWnXk4jNeXoq0ZJR9pBq2k7o+c3VPzfJX87NO3DYas62p0/tgyf+ovDB3Lq
	H3NLD1S4yovwZZcU2FmcuuXXma9kj7ZoWzPDryS4+o0x/y+ZS+YqcX0EwYOpB7MyVZa+/LPB4Ippu
	Iwkf3IxlZvrm963Xi340LLqc4ni9kbQdfyY3MDtWwkf7YZItRioVyCloamck4b6xen9i9tFI5W0EZ
	vuNarhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP3x-00F6zw-CM; Fri, 27 Jan 2023 13:46:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOc1-00Evm7-A3
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 13:17:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id j17so3452500wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PHUtNK1QUcmBWUA4niJy/dtuN1rM7eN2dajThZv9k/I=;
        b=uff7J6FNTNQnfTZKcq9sgfIV6BLs3iEe1qO6Nkjx9qHu/qaIaBQc9wSYwLC5MuiegX
         pdQ6gcVnlPa0GluVqhZKtX9oM+Tb3O4H3AKaHKL4BM0NRG4JpIb59n9LQsvem1VMIFPw
         CQl27+lZKSq05ZqTSrjqh5aXL5L3lF+dypYSIZaWJWbn+2O4UgGHkmnTPY/Y5E3nlMXJ
         sDkgm7vx7Rvqu1pLHI9FLr1xUUF7jj1Uav6476xM2kKTHUEq3yABJXAg2S0UKSO2Lvy9
         1qnBTTbBzFZcn9beeD3yZ6boQmv8f1uhgip+Ep4vQii4VGsvE+VsDr6i3ztd6EWNqgaq
         B8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHUtNK1QUcmBWUA4niJy/dtuN1rM7eN2dajThZv9k/I=;
        b=b47gKThVltuBfnm/uwPJrzOG/Mckze6Q1zDEJlWZpgLdPDo1sw+vwlFhyVmutz79mb
         t0TxtmPl/7nXEdrM7z70dzsWSLE3jqwcc1jTGh5LN/V/juecdb3lc9eNNm0HgV2ZO+nZ
         ZzyPMThMPnRzpg1+uM1JuHWYbH2NaSUEL5xNYn3KZhZ6zTUkXKKTdSm6a1/WOJzngVc7
         2sVRGqEyM2KQUPHVXyQxDBP9OfEq55H+Y0pvuZaKlpnhOhupfeWKMRDHICTe1gywHHNj
         DUpqPRn5kAwk//t8w7ZMWdoZJFPWbUX9lqxRgIEv0xJIBB87a7JzfMlo7b33eSnryFTW
         V83w==
X-Gm-Message-State: AO0yUKVuwfzUKObb+AmkshtJ02iRxHV0hIbsqxgUYpDGruV3n7nkSOjq
	qDWM46IyjSh9bgHqzrjWozOIcCUMgfB6nGG/LAs=
X-Google-Smtp-Source: AK7set+Pxyqp8I/31T+hmD4efINPIHybA0/rjg7Snx1FZ+sWFgsJRDV3DN4kYihRGmgXKAJgOhlsgw==
X-Received: by 2002:a05:600c:4494:b0:3dc:40a0:3853 with SMTP id e20-20020a05600c449400b003dc40a03853mr803614wmo.11.1674825467622;
        Fri, 27 Jan 2023 05:17:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b003dc4050c97bsm1003279wmq.3.2023.01.27.05.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:17:47 -0800 (PST)
Message-ID: <a4b6d79f-972c-9169-16e0-b930e2c15c51@linaro.org>
Date: Fri, 27 Jan 2023 14:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson: radxa-zero: allow usb otg mode
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127103913.3386435-1-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230127103913.3386435-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_051749_452664_5F78350A 
X-CRM114-Status: GOOD (  14.19  )
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

On 27/01/2023 11:39, Christian Hewitt wrote:
> Setting dr_mode to "host" prevents otg which can be useful on a board
> with limited connectivity options. So don't force host mode.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index e3bb6df42ff3..cf0a9be83fc4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -401,5 +401,4 @@ &uart_AO {
>   
>   &usb {
>   	status = "okay";
> -	dr_mode = "host";

At some point we would need to add the fusb302 node to have proper USB-C PD and mode switch handling.

Fixes: 26d1400f7457 ("arm64: dts: amlogic: add support for Radxa Zero")
Acked-by: Neil Armstrong <neil.armstrong@linaro.org

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
