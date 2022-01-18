Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3D4C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNnSdN0In4ODmEmjfmr2gaacJQDu8q8VKdRMBwEjQe8=; b=rl3pTqvb5gLJW7
	aB+lXEw6hqpqs6j6O97Qoc5v2RiL8Cf/Vjx//3F1PBWk7yZjevKnYPvb2W94jqc7HbxKJogqpHkSg
	bkTayr7gQ5vdg86jC8MB4l7LVCqj59AMY6Fq2p7Tod8cD1OAoC5mWX+Jz7lde3HTOOUZRpOqHpiVT
	aj+8tgRRKzmehV3bZCKdjKxIAlkdGlWWOm7WdEMb9OOr22uRmuXdio+tvPY/3b1kzpdizgDkJKMQn
	L72i6L9z6kUL1zMcT31sHx644eSAleR5hIpJSn4I4in5WOxhfpnxwop2FVgqV6DDu659mSB2/5wvE
	GQd/eT5CCdKVCnGY7ajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kxu-000wYy-Vg; Tue, 18 Jan 2022 09:39:47 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9kxd-000wUb-5L; Tue, 18 Jan 2022 09:39:30 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso4214583wmc.3; 
 Tue, 18 Jan 2022 01:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mpMvg9Xq83m6YgFkwSrnYeaarj8V2qnTV6HoEOfUKrc=;
 b=faRRjSiYgeh1z96KvIdDGRCjyNQfbEQR5pHFg7/9RE3cK3uE17LAWxKFxU2iyeoNSo
 ORtyz8Pv6YeGPAe9s8KaBbcLI3DcpzVQNFUt292+uLxnyUgEnuwmSf+vVXQpooCs+nQ/
 /MVu68ExXq/92YZ2Qklk/CpbxVuALEt6je+91rcl+qv2HouMy0vrYWzLFeOwR0gFcg2l
 7T03a5K+Zv4yv+7SIrQJYf9R0WfD4iImFtDT5Ye3j+NdNSyNOnbdtiYswRBB471CV/Fs
 WpNNRJQTAsiU3FuiRO7jSusnf5L5Oo+l9SCG1lDZDNt0SC8hIRH2C3HOft3ysU2v4JGU
 4q3g==
X-Gm-Message-State: AOAM532tNwV1HiLtQHbjf3Gz0bSb3EbdclPoH0TJ53g+cLQZvNFGXF6C
 X5s0s9P9wsrVsFJDQmMVhlb3k0bwNTk=
X-Google-Smtp-Source: ABdhPJw1cCHpAySIqyCarXq5MJKNu6tszRGXIckjEH6mzi+KENvCwwLTlOyRKIEaPx5b3RDe6kUqzQ==
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr16847619wmm.50.1642498767408; 
 Tue, 18 Jan 2022 01:39:27 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id s12sm89617wru.25.2022.01.18.01.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:39:26 -0800 (PST)
Message-ID: <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
Date: Tue, 18 Jan 2022 10:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V6 3/5] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-4-yu.tu@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220118030911.12815-4-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_013929_245528_8A1CF5A0 
X-CRM114-Status: GOOD (  16.08  )
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

On 18. 01. 22, 4:09, Yu Tu wrote:
> Using the common Clock code to describe the UART baud rate clock
> makes it easier for the UART driver to be compatible with the
> baud rate requirements of the UART IP on different meson chips.
...
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
...
> @@ -629,57 +640,105 @@ static struct uart_driver meson_uart_driver = {
>   	.cons		= MESON_SERIAL_CONSOLE,
>   };
>   
> -static inline struct clk *meson_uart_probe_clock(struct device *dev,
> -						 const char *id)
> -{
> -	struct clk *clk = NULL;
> -	int ret;
> -
> -	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk))
> -		return clk;
> -
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "couldn't enable clk\n");
> -		return ERR_PTR(ret);
> -	}
> -
> -	devm_add_action_or_reset(dev,
> -			(void(*)(void *))clk_disable_unprepare,
> -			clk);
> -
> -	return clk;
> -}
> +static struct clk_div_table xtal_div_table[] = {

This can be const, right?

> +	{0, 3},
> +	{1, 1},
> +	{2, 2},
> +	{3, 2},

Not sure if you didn't remove too much whitespace. I think it should be 
like: "{ 0, 3 },". But I actually don't care, it's a minor thing.

I cannot comment on the rest (clk and OF part) as my knowledge is pretty 
limited there. Leaving up to others.

thanks,
-- 
js
suse labs

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
