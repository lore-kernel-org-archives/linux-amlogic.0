Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DD2C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NQCL7nJOEGmPTwZ0u5VWdtK13+SXwNZ3ZiwO8dMdzs4=; b=zVZt8ZTXuL/rr8zdUQkGah+akz
	Ullp/MZFdad++6i09WT/tKcf7xTgiVD8E5CTwYYlk1KXVGpKtacMyqBUJk/jQu0nxjaFHTFnIPssG
	iTyvUVArD90f7Iyi6ZkG7CAld58zOLJCLcHw1WyFBEiQczssSsjAswOShtaslLtzaRx/qpZ/rhmnm
	3FYEmKXbUbIfqN9w7vShtMidVoDJz8NJTBgLzTI6mlTET7r91BiDBrx8Y+JEAUyq7uJbpSwbRvDJM
	1hokEZX1LuXGdJnXePoixdQ+E3M3/Gs1Lap6dNlZj/oDswP4dhgtnG3ZhMz/MyoTkbQTLYBzP57aZ
	zpE5qxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z1n-001XPl-RQ; Wed, 12 Jan 2022 08:30:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Z1k-001XNd-Vs
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:30:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id w26so1031979wmi.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zeGkS/AWYnZy47we+qF8wCuwX52GEkI6vQJfLEPaRTM=;
 b=tisGOzLAWxSxmmGKxIOeVzPciTEN9rH2KFH9Do55+GiVOO50bmLiwt3AEhdYYG42Po
 aHDhJq32SXbrFH40QHtpSfox94sDcOJmebPmt6VYf/FyAX0hBz7bTx6V74ZUzJjHRMFT
 NKSsDLag8uUI6DX2OlfLhMw0Uq8aelMqibO86f+oellRFdSU2Z8vznyCpT41Rht/TsZ9
 YpBcCMh0AvGURo15h6GZxdcGoThQggQuIh5Z3s6o1GH0vq9YzD8nbLoP91RvGeCWRp0Y
 2ZqA5XuNDZqJqYXWj/T1Vy+yGyMQ9v+MqHS713torJ8+XxAnkLqfNorHiSEHmJpiuObF
 6ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zeGkS/AWYnZy47we+qF8wCuwX52GEkI6vQJfLEPaRTM=;
 b=6852PD7rHJnulGDfAaRXwrxOFjYoatcry+ywnCOSYA9BpWTMFwYpA4vIkP9OYu8Pav
 mjG/wXHsypTdN/lLKg/3CqTSuuh7zhbrhyNXZBYLubOaNbwbOU3Ee+tws09q1RNWeEuW
 O/jrRV4Ut2jjjLGluvfu/Znrwbqp5/ookk6Fm6JIZSy7v/dwCRzp+b2dP0LMx3vD6Uyc
 VDQ85pMgDUFtVH6d06Aw+seULz9cz7mpDeNdP6Mr1dVhYFwrXO7CFCm617yu5s3fw0KB
 nsBMOR8TGVXNPRTTFIDrZh/Sq1eigRbltghtspBi/2BhIJ9kkO5s1g562ADbyh70y7Ud
 z4xw==
X-Gm-Message-State: AOAM532PzSOFFyuxx+feG+jvhqJ05LgOCHojmQRXqWOLj6INl37DseM5
 8eVmR/WT7WOvKKpqpfL9M9fFNg==
X-Google-Smtp-Source: ABdhPJyXFR6mrywvto4d9XMnjLkxRHK9EpZKHxrQ7Z64/zyNjYP4o9flE665UZPXnZvUNqaJuhAqFQ==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr5869719wmg.62.1641976239060; 
 Wed, 12 Jan 2022 00:30:39 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id b6sm11730973wri.56.2022.01.12.00.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:30:38 -0800 (PST)
Subject: Re: [PATCH 1/3] pinctrl: meson-g12a: add more pwm_f options
To: Gary Bisson <gary.bisson@boundarydevices.com>,
 linux-amlogic@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-2-gary.bisson@boundarydevices.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <cd92df54-caa1-deed-3a93-929ba43adba8@baylibre.com>
Date: Wed, 12 Jan 2022 09:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103154616.308376-2-gary.bisson@boundarydevices.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003041_072090_C207C36E 
X-CRM114-Status: GOOD (  16.79  )
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

On 03/01/2022 16:46, Gary Bisson wrote:
> Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index cd9656b13836..d182a575981e 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -283,6 +283,8 @@ static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
>  static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
>  
>  /* pwm_f */
> +static const unsigned int pwm_f_z_pins[]		= { GPIOZ_12 };
> +static const unsigned int pwm_f_a_pins[]		= { GPIOA_11 };
>  static const unsigned int pwm_f_x_pins[]		= { GPIOX_7 };
>  static const unsigned int pwm_f_h_pins[]		= { GPIOH_5 };
>  
> @@ -618,6 +620,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
>  	GROUP(tdm_c_dout2_z,		4),
>  	GROUP(tdm_c_dout3_z,		4),
>  	GROUP(mclk1_z,			4),
> +	GROUP(pwm_f_z,			5),
>  
>  	/* bank GPIOX */
>  	GROUP(sdio_d0,			1),
> @@ -768,6 +771,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
>  	GROUP(tdm_c_dout3_a,		2),
>  	GROUP(mclk0_a,			1),
>  	GROUP(mclk1_a,			2),
> +	GROUP(pwm_f_a,			3),
>  };
>  
>  /* uart_ao_a */
> @@ -1069,7 +1073,7 @@ static const char * const pwm_e_groups[] = {
>  };
>  
>  static const char * const pwm_f_groups[] = {
> -	"pwm_f_x", "pwm_f_h",
> +	"pwm_f_z", "pwm_f_a", "pwm_f_x", "pwm_f_h",
>  };
>  
>  static const char * const cec_ao_a_h_groups[] = {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
