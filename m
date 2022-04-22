Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A5C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66WDtwnKf8QSnr0CQ2PsxxsbxwgXj3W1AyANdlmm1IQ=; b=C0zFxLHJ66Wg6Z
	fOfpO3XjPLBq0+iM9R3ajJpcJJNUcY/6i0c3+tTU3acHPG+H0CnEvbFIHCOdIIpOG4SpDjPJVOLqj
	CkKC2ykoppsxKxhbyJPVjml5mTth/cxLGeUfg9pv7n9dbK/zpd1cxJbXoRmXxay5JUXG2EU20jwol
	xiINjLgxff11cCGSCvVH+GDFc/9K+u9xGPNgbmmqK1clKCpdwrQnejzTV8Sf7zbLpntAZG1UtGssr
	N5WEZ/gm16Z4q6KgOPkQsBVkskyk0cxSGgFATlhZOtzL7FFhbPfW5hiIVD/l6iA3oNiZWbNINocr8
	q4EA5pR0j97eIyluwdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsQw-000PAO-A8; Fri, 22 Apr 2022 12:30:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsQa-000P0g-7O
 for linux-amlogic@lists.infradead.org; Fri, 22 Apr 2022 12:30:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id r19so5014858wmq.0
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Apr 2022 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BoMVUFOEl6nR+FPyhiLBNUhDYjBNRueFaMw3cK0djfg=;
 b=OS02zn8X0KgjK9iT9Xgk16HCgAt33owcXhXxaYbK3kIjjJj/yoAwIZIl0xhse1yIFe
 O3ZYcXjEg478fq+/nX9frDJkZVaHZTldmZ+h+ZpmNZ5d0Ea91Qcn5ahbRWFbQ5Nn24B4
 WEqUCsC4H9QeiL3lT88hNFBmoWykZeBLJUjp1uWtahTnjJzwWNJ6cIVp9G/lBDHsJPyb
 +VMnIOu+bcMJRbCWjxfeO4Gr0ehqtFEnkdsnXGx4GAk8gxv4sFmsl2kBRZRf1zmoRC7N
 ayMEUxl0pKrgkEijMCdti/qjBDvgOlQyue9W60uRaCwYDPg/vOwpACJpSjactVpzQhKC
 TUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BoMVUFOEl6nR+FPyhiLBNUhDYjBNRueFaMw3cK0djfg=;
 b=5mSwUoaIS58p2pFR5IRleMU9i9wg0305uD64VHh51tl1FePA2AkF5Zv9wcJctJaSsX
 L5ErZ8/MbCNtvw+y9XngRfCgffwgv6g9lxXUxFedt0ZRQT7NUM2cvDMW6R/f4AMrya+K
 AS0XERstzi9zzP44K5EKtz+uDe6LAzqekLX3c7MlPxbZRh3hAz0YIjlyHfy5wQNwLB8t
 OjvjGclcTt6sN3AOL2s4lDSdq9aBN16lqHdEeRqxTRmDnJFSgXtEfxvonyrspr/nA2TF
 pzBbMY0+llXmYQpKSisX/X9UIWTNxplfpzsJHleyklJsy9FgVwWApDzTFU1yR03bJpdE
 NEUg==
X-Gm-Message-State: AOAM532MnRWIGygG/X+MNZdGeEkUS0brZgTLTe7EVGvc4zl1R0QQu5RP
 iA4SctrkJ58JS4VW4LBq7ZwHpw==
X-Google-Smtp-Source: ABdhPJwoZXt4bknR+hx1/TNbRlb+8yw8nHVeheySphVKUd/dY2/71ZZMppN8uXv7A3bTsypj7rUQyA==
X-Received: by 2002:a05:600c:35c9:b0:392:8e2a:d7aa with SMTP id
 r9-20020a05600c35c900b003928e2ad7aamr4130493wmq.34.1650630621966; 
 Fri, 22 Apr 2022 05:30:21 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49?
 ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adfe104000000b00205b50f04f0sm1630593wrz.86.2022.04.22.05.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:30:21 -0700 (PDT)
Message-ID: <c4805983-7e07-73cf-39c2-5dc5728029f4@baylibre.com>
Date: Fri, 22 Apr 2022 14:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 2/2] tty: serial: meson: Added S4 SOC compatibility
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220422111320.19234-1-yu.tu@amlogic.com>
 <20220422111320.19234-3-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220422111320.19234-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_053024_336171_53F7E62D 
X-CRM114-Status: GOOD (  15.25  )
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

On 22/04/2022 13:13, Yu Tu wrote:
> Make UART driver compatible with S4 SOC UART. Meanwhile, the S4 SOC
> UART uses 12MHz as the clock source for baud rate calculations.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 58bd2723c004..c748e5dd5348 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -790,11 +790,19 @@ static int meson_uart_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static struct meson_uart_data s4_uart_data = {
> +	.has_xtal_div2 = true,
> +};
> +
>   static const struct of_device_id meson_uart_dt_match[] = {
>   	{ .compatible = "amlogic,meson6-uart" },
>   	{ .compatible = "amlogic,meson8-uart" },
>   	{ .compatible = "amlogic,meson8b-uart" },
>   	{ .compatible = "amlogic,meson-gx-uart" },
> +	{
> +		.compatible = "amlogic,meson-s4-uart",
> +		.data = (void *)&s4_uart_data,
> +	},
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_uart_dt_match);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
