Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB3EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThoEzXbNRgbQsKnRJc7juzMRZaQLEvpu0Xs7yRjQTQI=; b=wiLtSfFO405+Ok
	v1WWw3wUYszBNTGMEqQXumpRklQMSurxbDmtGSQ6xMAU6S29NvKFEIt+q9D7/SkHbJoVM7XU07k5L
	u0pcWkQ1Y66u9IXfD0zeGmakqWYhHOX1b+RZvYY+7PL2RMNRW3JaIdYoHuc5pqYfzTghbbRkSSNtC
	KujvXFSeLM9nab06klZ0QEPv8YuJA9udtguGrOfChslGhH4Rc4UdL+DJNAWc5dSJLdoF89jAnnW6c
	SGkMx8YJEfskWOtd2J5bxPTAKBK44SIZPTL2iDEMASkOMn9RCkK34vRITXFY0m02Gp6X1X1T/mVJ6
	LRAqlVY/GOVJh1xIyRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tJr-00BFOH-4G; Mon, 10 Jan 2022 11:58:35 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tJf-00BFLP-29; Mon, 10 Jan 2022 11:58:24 +0000
Received: by mail-ed1-f47.google.com with SMTP id m21so52765886edc.0;
 Mon, 10 Jan 2022 03:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KEFVGpTwnkjkTyLurQERHyZuoZQJijyZqzd+Dp5wm7s=;
 b=biPB5GmjQOrV+3zAvRw8KvUKB96ewDdw61nCwzwHR6WJpgQndAHoW8LmnF3hYwYzOf
 eVydQ0mMiq4re58O+/71tUR1tJJ8UbNfA0xU7Yx8/3wjUd1ZQDqC2jHfB2rrtL+MuGqk
 zUygGP6jc4SCJizVxsZr3YQSHMr5GSPJomyID0wGFGs/QdAmPiV6u57wfFUKej+Cm5pa
 oHR1GpXMTpdg8Nw+x74vHSnFzQSFzwALuw1RPO505mhKxW7mV7wFQysyEWOjsFhyHXB9
 jojHtNI17EY6O98cStlpUrz1daWKNw5Pdq3xYPj0y8VQRbQoe6gaH88ftR4oSzmXfpXz
 hyaw==
X-Gm-Message-State: AOAM530W0SQd1EtlxtVOeGHRqAX3YnNQfc4h4sccK/Cxh32LnDGVmnms
 JtXA7RHACEDoTaNv2ATs2g8=
X-Google-Smtp-Source: ABdhPJxPQN6eEpI/Cx0t8t3HmA+D5/UumywGmwuBUCnHq3Kyy0xcAtzWOMjXt3wqLkF9xhVd+an9Xg==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr60694868ejc.275.1641815900997; 
 Mon, 10 Jan 2022 03:58:20 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id b2sm2353271ejh.199.2022.01.10.03.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 03:58:20 -0800 (PST)
Message-ID: <01066e66-5d97-ab40-b4a6-99e962b47073@kernel.org>
Date: Mon, 10 Jan 2022 12:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5 2/5] tty: serial: meson: Move request the register
 region.
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-3-yu.tu@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220110104214.25321-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_035823_149656_B45F5774 
X-CRM114-Status: GOOD (  20.19  )
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

On 10. 01. 22, 11:42, Yu Tu wrote:
> This simplifies resetting the UART controller during probe
> and will make it easier to integrate the common clock code
> which will require the registers at probe time as well.

And you are *also* switching devm_request_mem_region+devm_ioremap into 
devm_ioremap_resource without even noting it here. It should've been 
done in a separate patch.

And no, do not resend a new version in the next few days. Having v5 in 
20 days is a bit too much. Give maintainers and reviewers some more 
space to express themselves.
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 45e00d928253..7570958d010c 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -395,24 +395,11 @@ static int meson_uart_verify_port(struct uart_port *port,
>   
>   static void meson_uart_release_port(struct uart_port *port)
>   {
> -	devm_iounmap(port->dev, port->membase);
> -	port->membase = NULL;
> -	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
> +	/* nothing to do */
>   }
>   
>   static int meson_uart_request_port(struct uart_port *port)
>   {
> -	if (!devm_request_mem_region(port->dev, port->mapbase, port->mapsize,
> -				     dev_name(port->dev))) {
> -		dev_err(port->dev, "Memory region busy\n");
> -		return -EBUSY;
> -	}
> -
> -	port->membase = devm_ioremap(port->dev, port->mapbase,
> -					     port->mapsize);
> -	if (!port->membase)
> -		return -ENOMEM;
> -
>   	return 0;
>   }
>   
> @@ -733,6 +720,10 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	if (!port)
>   		return -ENOMEM;
>   
> +	port->membase = devm_ioremap_resource(&pdev->dev, res_mem);
> +	if (IS_ERR(port->membase))
> +		return PTR_ERR(port->membase);
> +
>   	ret = meson_uart_probe_clocks(pdev, port);
>   	if (ret)
>   		return ret;
> @@ -754,10 +745,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, port);
>   
>   	/* reset port before registering (and possibly registering console) */
> -	if (meson_uart_request_port(port) >= 0) {
> -		meson_uart_reset(port);
> -		meson_uart_release_port(port);
> -	}
> +	meson_uart_reset(port);
>   
>   	ret = uart_add_one_port(&meson_uart_driver, port);
>   	if (ret)

thanks,
-- 
js
suse labs

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
