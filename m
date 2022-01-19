Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEB7C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pWVxj3UthqjuBZ/g+KVYyi9ZNmZa8uHXL46R0/dNTbM=; b=R4lVgzo45NoNTIDVGQy4J8LXTR
	EQ1uxbOw5qcN0/ISGWnQ3zgAYMrS9V6zQFz+t7plLtSnAsYSjRos9claS5vlo5IfvxgFvwJh7DYzg
	MiE3m2x8l9UKY13OIBtbUeRlpTKrDigxAPbE3uvNOmgH4TQGH6umGH4LRwGmhMJ4ZkRX/Yo8KUee3
	3VIzU0vOqkk/Kteiskhd/ba06UtbMvccRaaqryS0dr043dHlvkH/0lrnxZOlYP2CUa2S46nM8UXc9
	GDyHwT8ONciSWSfKC0622McEUZ5yzliVINMu1pXNKAlpmWuUAjmaOlCXHeB5ou3CJoYGKtt76vqeT
	497OtSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6hw-004OcO-Mf; Wed, 19 Jan 2022 08:52:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6hj-004OYf-HS
 for linux-amlogic@lists.infradead.org; Wed, 19 Jan 2022 08:52:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so4302231wmb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Jan 2022 00:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YD4iLLUZyr8CeCj03I9UusKK7X+cQDyntXdR+j7XGJ8=;
 b=2bdD5fFDtv75HUstXnBK3i64pouZCKluoajegLjNS/RIy9+boLJLed8cYtKiE8oYls
 HZruaKZaiufFsHJjdrm23sDT0nX5lyuGPcuy96TROO0ii/86sQtHXWzcZlDP0mTwdisS
 9xwiPZNzd/WEZeAGkq4oG/ePhkEZ68ZcruTJFHfYBf3Kk4ybzqDiAb156U7CoDdzEtH6
 pllnlCwHANKu2EBhe16UTmuvPDvwbBDlWOAuOi16ZJrRqFY6yYEpuKFZcdyUsQC+xoJi
 UN9sbex47tUQ3XewCCsSzpNFtgLA1Xh/LUjkBqtKTJeV0vnwzjCgxoptlmyAjA2ij05V
 Chvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YD4iLLUZyr8CeCj03I9UusKK7X+cQDyntXdR+j7XGJ8=;
 b=FcEOQWVvDyB0PvDhWxN4CfETQfOWiGj84t7wMGVO8BoAWvQ/CX8f9h2VJFpm8dLqOQ
 NVomHTHUpTxoQOE8LUlIb8X5u5ErCQ3xROk8I/xPoUN79NUk2lel1Af0eMAHrU15QrwE
 CTwbKvZHqXGluitW9e2NNFldY1JI06PAQgdYSXzzFg1E+10ROqMMiK4WgXl4k+PtNtmu
 sOWSaoQV2N18INLLFiMX1E9M7GVZjCYygNsSjbRDGEkf+Q6bwkmcF5z+7lauEvvSFnj0
 3YcmOrmJQSYolgN408d66AfPDhWEZU+YfQDgF/WK0HCFJQdxnT80+RVj+eQO8cQuwylC
 Cq1w==
X-Gm-Message-State: AOAM531zND+i8F+j2JbfjoWlel91Ix3ub4fy2ePsdoEHj6dnr755OkEm
 eROkGzIKZV8ABMbfr4+xzapJfDhaIlqGKA==
X-Google-Smtp-Source: ABdhPJy1oCNGTILfQq9bNc6hI+HQu+PIjFcQi9caeNfzovHe1JtvE6p9he2B/1S2/It6iJE9m3XwRA==
X-Received: by 2002:a5d:5709:: with SMTP id a9mr27851692wrv.707.1642582349895; 
 Wed, 19 Jan 2022 00:52:29 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d394:97d0:bc02:3846?
 ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id u12sm14189172wrm.106.2022.01.19.00.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:52:28 -0800 (PST)
Subject: Re: [PATCH v2 3/4] irqchip/meson-gpio: add select trigger type
 callback
To: Qianggui Song <qianggui.song@amlogic.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20220119070809.15563-1-qianggui.song@amlogic.com>
 <20220119070809.15563-4-qianggui.song@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fb7db50f-866a-233b-1c9b-093cd50473c8@baylibre.com>
Date: Wed, 19 Jan 2022 09:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220119070809.15563-4-qianggui.song@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_005231_589754_691D03BB 
X-CRM114-Status: GOOD (  20.07  )
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

Hi,

On 19/01/2022 08:08, Qianggui Song wrote:
> Due to some chips may use different registers and offset, provide
> a set trigger type call back.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/irqchip/irq-meson-gpio.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index eefe15e1b3a6..b511f9532adc 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -55,6 +55,8 @@ struct irq_ctl_ops {
>  	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
>  				 unsigned int channel, unsigned long hwirq);
>  	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
> +	void (*gpio_irq_sel_type)(struct meson_gpio_irq_controller *ctl,
> +				  unsigned int idx, u32 val);
>  };
>  
>  struct meson_gpio_irq_params {
> @@ -278,6 +280,12 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
>  	 */
>  	type &= IRQ_TYPE_SENSE_MASK;
>  
> +	/* Some controllers may have different calculation method*/
> +	if (params->ops.gpio_irq_sel_type) {
> +		params->ops.gpio_irq_sel_type(ctl, idx, type);
> +		return 0;
> +	}
> +
>  	/*
>  	 * New controller support EDGE_BOTH trigger. This setting takes
>  	 * precedence over the other edge/polarity settings
> 

The comment on v1 hasn't been addresses here, it was asked to move the old controllers
sel_type to a callback and introduce an S4 callback instead of doing this.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
