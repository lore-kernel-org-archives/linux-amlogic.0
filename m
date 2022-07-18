Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD1AC43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jul 2022 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHGVVG7nf5RkOjyqw+amZjl1fUCXWGVwLy8Jqop72RM=; b=pUBKzk3vLrEdlF+BFqjF8L0wN3
	3t+xEOQLmZFLqpjrQFP6EThNnZdrT7kGR6RK2ENCVykxp6c8gzRYbFE5E/xV6m/Te1I8Uhubt9eSt
	dI+4ZuxjlRBpPZaajnPwIvCVjch5ZFAIkK5Q4Pun3ytlxBTlmZ7uxU59C9kThpg9G2qwTrIKOLWsZ
	DrGEWPrW5lnDQPTrPH2W3UdlFJzkj8m5p33skiU+bOVad2wBOS+Y+GwvzfV3cifPIpkboCjq61wfP
	OfMsGYcUhULKl3ZJHU+blnCnHPS0EOqs55WVWSMW5D4K5JBSqO3cf9UVUrG3FlynEUFMaMivR6wYU
	H7qIDO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLzf-00BhqO-OJ; Mon, 18 Jul 2022 08:20:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLzc-00BhpC-Dd
	for linux-amlogic@lists.infradead.org; Mon, 18 Jul 2022 08:20:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id j1so11442134wrs.4
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Jul 2022 01:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=LswNIpllzeaRcjZXloDLaya2WClMrLmY0pFQj1W8qMk=;
        b=M2XhbciZmsz4yI3oLpC8+pcNi2nt7P8doQBqBGAUb0/uXymaqc/OYVYJwlXVyy2Yk7
         dlcJr2XeErHHms6j6L7nFPIf5j+2oDowN9lxzP6uqxYyECIqhEzc5zrq6w+j82oUPVIk
         E/CKhbhzY/AFvCFsYe+KiVq5IdKog3vbVRNGREcy1LD9pWFJOJuCAc8iSvv1tHh40hvY
         RFEmLz3CvFb+BBnR5nv3JcyLvOfrDOIInvOJh7bbw1Tn8YzBS6+VoqyLUEnZcr3tiArv
         9HPgpEnwWyALbOp0s6wRx4x7SfLETrbTVWhL4Vyg3FbrPqYaq3MektSOUgUrppB8vzJM
         +uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=LswNIpllzeaRcjZXloDLaya2WClMrLmY0pFQj1W8qMk=;
        b=tiRCrIuqFODfUKXo9FmFLV4SoDEX39h4c48LhGuARbdiEVO/jfm7lBbUJccpX+p0dN
         xejNYuQuQBr9kqJE/KkOeKai8hw6HZThM7wBEvFAMpRdX7aFFpbYndTUVetokvynORHU
         AFyYX+tBJ/iZgZJe0SLl3Lrqi19uKlDNhwcNrPytTJzZkXajumEsD1BFVsxjO1Me39Pb
         Zi1gMhRRBlAg9U7lkuWoR01OskatpFN4jFXtHoGYcMHph9FupzIdXHCli4LKUASaHBwK
         9OardDb7iL4bh/VRc3qX+240hws2m21ia4TTy/78p34cRUqEht0XpewlUyoasYxiBiM/
         LmMw==
X-Gm-Message-State: AJIora/rpglHHrYipCuTKcSC9PXAvMqT+DscxLfhAVuXcxxCzCdfesxl
	/zRsYJ7ttQFkLO8pVe1sG65s+Q==
X-Google-Smtp-Source: AGRyM1vyIJSufYepP7VFYdIl/SEYBnVpYQLUVhiFpTBt3Nqas5RXKAPSgB4wy9PfATSaQvWZa5lC4w==
X-Received: by 2002:adf:fb03:0:b0:21d:70cb:d6b5 with SMTP id c3-20020adffb03000000b0021d70cbd6b5mr21389643wrr.548.1658132438039;
        Mon, 18 Jul 2022 01:20:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a2b7:375c:fabd:3626? ([2001:861:44c0:66c0:a2b7:375c:fabd:3626])
        by smtp.gmail.com with ESMTPSA id m24-20020a056000181800b0021d68e1fd42sm10256864wrh.89.2022.07.18.01.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:20:37 -0700 (PDT)
Message-ID: <71e3e938-78fb-ed82-c5fb-81ba78550526@baylibre.com>
Date: Mon, 18 Jul 2022 10:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Ask a question about why can't use GPIOAO: GPIO_TEST_N
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, linux-amlogic@lists.infradead.org
References: <tencent_CE3C171C6300ED12361ED2B813BF0D5A0608@qq.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <tencent_CE3C171C6300ED12361ED2B813BF0D5A0608@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_012040_508420_59B7210C 
X-CRM114-Status: GOOD (  22.62  )
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

On 14/07/2022 04:07, Zhang Ning wrote:
> first this is not a code review, just ask a question.
> 
> I started to enable MagicBox M16S, and sent patches for review.
> 
> but leds are not enabled.
> 
> I have tried, and found gpioao: GPIO_TEST_N can control led on off.
> 
> thus I add it to dts:
> 
>          leds {
>                  compatible = "gpio-leds";
> 
>                  led-white {
>                          color = <LED_COLOR_ID_WHITE>;
>                          function = LED_FUNCTION_POWER;
>                          gpios = <&gpio_ao GPIO_TEST_N GPIO_ACTIVE_HIGH>;
>                          default-state = "keep";
>                  };
>          };
> 
> but failed with error -22.
> 
> and simply change GPIO_TEST_N to GPIOAO_2, no error.
> 
> thus find pinctrl driver doesn't allow to use this gpio.
> 
> why?

The TEST_N pinctrl needs a SMC call to set the pin GPIO direction, so it needs
more code to control the pin.

I did an experimental support a few years ago:
https://github.com/superna9999/linux/commits/amlogic/v4.19/gpio-test-n

I would need to be refreshed to work on 5.20.

Neil

> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-gxl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 51408996255b..fb5fa88b30c7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -820,7 +820,7 @@ static struct meson_bank meson_gxl_periphs_banks[] = {
>   
>   static struct meson_bank meson_gxl_aobus_banks[] = {
>   	/*   name    first      last      irq	pullen  pull    dir     out     in  */
> -	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
> +	BANK("AO",   GPIOAO_0,  GPIO_TEST_N, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
>   };
>   
>   static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
