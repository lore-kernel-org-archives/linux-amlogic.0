Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DEC001DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwr7Z+bzQJq9UdvQ37kEE9fyuzI170PNiaH67Vliun0=; b=QIybwJYCoco0j3chnV2GneYm/2
	eR9ZqzS4GY7CXfKM/VjtPfPYmWdsHo7cmsvsbUQjwrlivTNujtaoSkXe7IiD4RCbefSBSkxxU9TNL
	YeHO9olTpPHrUYifhI/oGjIe0r6YT9uLRri9STuJMurHu1XRviKKJ4GcIfh1Myq3IseMn4JH4jVfG
	pOx1ZQ3cKpmADNiNOMRUDZcxOPwthZM4PXTzYhmTCpJtt56IzXGPMOjBCJ69Qo0lJpv8cjjBo3y1U
	pKU/7exn6H87ZpSoOyhbIwwdVZ5X/gRmZUyN4W28bbNX8Px8zkEbaoQ1DK8/jTM8f9kCecx94/jFj
	0nFVteEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhyf-00DfV0-08;
	Tue, 04 Jul 2023 15:30:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhyc-00DfTO-0h
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 15:30:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso50227925e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jul 2023 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688484599; x=1691076599;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ynbcJpeU+uOp5aDWGQw4MCSYV+ykdJvVEaL7KRlmDM=;
        b=okbEAiMobw70dEQ9YQUu8p7gIEwn+TS+8HiC5hvDjABEOp3K3pLC/rzFH1fxYizw6r
         4L14Aolw+kBjUG0Hlp/MsbCu7QDBJQFZ7Q/f3pBMyRn+oaP/YEpWfUx12dW/CS2OmdVw
         xKi71X9aF+17koXZvn4djzuiHJLimBIysjCj3vSgDwXJ/758YVuhFI16zrdCesJDypGt
         BS88ByzU7K6dMC9Ge8ZxuA5Qq22Ha4BAWC3W77/zzSss+nEiritxJDONwwftnBXrA2Xf
         f/wgdZjMQCrlANcL9qxofg2z7fqF8VSNrIKXF7Nui9q33hfHR59pVOwx7B4t2qbcHEJ+
         BJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484599; x=1691076599;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ynbcJpeU+uOp5aDWGQw4MCSYV+ykdJvVEaL7KRlmDM=;
        b=g1ZhBFqg9wVCZ4ASDXSm+gWKux8vOW/9Upxl2GK1ocdc3iULbZTb6CEuZ9msVS33Wg
         dGqyH0sJvixwoAYpsqV0Z9SoSN+n/ZcyBDj48nwqk8Pmxbapw2WNEv3SWjB+kO+dce2r
         EKBH3LvwZ3oc53QqUHs6JXgSDBFPGqwkVykKQk4oGhOTxJyVThSzTHmVBvyjQd+OvBl5
         befXSl8U/TBhD6sIvOsswEQ/YsB2PrQ3JpcR25Y+pTXqJmGBvwmHLhtJHm9XXn9rQnnG
         Ih8q8aR7nznAS06aU6yUAfIVhaooHaEGyuqbo+cpsJf285RDcT35VzWN9kLWPBTseniJ
         iNgg==
X-Gm-Message-State: AC+VfDx0mlBUd3K7wz8KAPeegdZ3iu2rpm5KGT8lHWhgEtkL4CMMDlCK
	I2RcDNQ6OpV/BgTy3U0bi6my0g==
X-Google-Smtp-Source: ACHHUZ7CV2i82Fmv/g2TNPHCLm7tSs1nu0guu4BlXrgefmCPTT88vaGI/sJHbu2V0IMyvtTbtFRx/w==
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id k20-20020a05600c0b5400b003f5ffe346a7mr10718494wmr.9.1688484599064;
        Tue, 04 Jul 2023 08:29:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b? ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d6dc1000000b00304adbeeabbsm28635375wrz.99.2023.07.04.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 08:29:58 -0700 (PDT)
Message-ID: <9fde3632-2419-d36b-9c54-337155bb482e@linaro.org>
Date: Tue, 4 Jul 2023 17:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, jirislaby@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, kelvin.zhang@amlogic.com,
 xianwei.zhao@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-4-ddrokosov@sberdevices.ru>
 <eb0dab5b-2fc7-728c-c6e0-43d2db422ed5@linaro.org>
 <20230704145933.y3o3fhjj6q7df44d@CAB-WSD-L081021>
Organization: Linaro Developer Services
Subject: Re: [PATCH v1 3/5] tty: serial: meson: apply ttyS devname instead of
 ttyAML for new SoCs
In-Reply-To: <20230704145933.y3o3fhjj6q7df44d@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_083002_282340_E97897CC 
X-CRM114-Status: GOOD (  28.20  )
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

Hi.

On 04/07/2023 16:59, Dmitry Rokosov wrote:
> Hello Neil,
> 
> Thank you for quick feedback!
> 
> On Tue, Jul 04, 2023 at 04:42:39PM +0200, neil.armstrong@linaro.org wrote:
>> On 04/07/2023 15:59, Dmitry Rokosov wrote:
>>> It is worth noting that the devname ttyS is a widely recognized tty name
>>> and is commonly used by many uart device drivers. Given the established
>>> usage and compatibility concerns, it may not be feasible to change the
>>> devname for older SoCs. However, for new definitions, it is acceptable
>>> and even recommended to use a new devname to help ensure clarity and
>>> avoid any potential conflicts on lower or upper software levels. In
>>> addition, modify the meson_uart_dt match data for g12a, a1, and s4 to
>>> their appropriate values to ensure proper devname values and
>>> functionality.
>>
>> I'm not confident about modifying a global struct from a probe,
>> I think you should add a separate meson_uart_driver/meson_serial_console couple
>> with ttyS instead of ttyAML, refer to the right uart_driver in meson_uart_data
>> and in probe() register it and pass it to uart_add_one_port().
> 
> Could you provide some insight into why you believe this solution may
> not be acceptable? It appears that the meson_uart_driver and
> meson_serial_console are not labeled with __init, which means it stay in
> memory forever.
Yes but nothing forbids registering a g12a and an a1 uart on the same system,
but you modify the meson_uart_driver/meson_serial_console struct.
This could cause some issues.

In practice this will never happen, but since we don't control the DT passed
to the system we must make sure we take in account any scenario.

> 
> To clarify, are you suggesting a solution that involves segregating the
> meson_uart_driver and meson_serial_console objects for each scenario and
> subsequently declaring pointers to both objects within the
> meson_uart_data? I want to make sure that I have accurately grasped the
> essence of your proposed approach.

Not both, only the appropriate one.

So either we make sure ttyAML and ttyS at exclusive at runtime, in this case we can
modify the global meson_uart_driver/meson_serial_console, or you add
a second set of uart_driver/console structs to handle this improbable case.

Neil
> 
>>>
>>> For more information please refer to IRC discussion at [1].
>>>
>>> Links:
>>>       [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03
>>>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>> ---
>>>    drivers/tty/serial/meson_uart.c | 33 +++++++++++++++++++++++++++++++--
>>>    1 file changed, 31 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>>> index 87c0eb5f2dba..361f9326b527 100644
>>> --- a/drivers/tty/serial/meson_uart.c
>>> +++ b/drivers/tty/serial/meson_uart.c
>>> @@ -82,6 +82,7 @@ static struct uart_driver meson_uart_driver;
>>>    static struct uart_port *meson_ports[AML_UART_PORT_NUM];
>>>    struct meson_uart_data {
>>> +	const char *dev_name;
>>>    	bool has_xtal_div2;
>>>    };
>>> @@ -683,6 +684,7 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
>>>    static int meson_uart_probe(struct platform_device *pdev)
>>>    {
>>> +	const struct meson_uart_data *priv_data;
>>>    	struct resource *res_mem;
>>>    	struct uart_port *port;
>>>    	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
>>> @@ -729,6 +731,18 @@ static int meson_uart_probe(struct platform_device *pdev)
>>>    	if (ret)
>>>    		return ret;
>>> +	priv_data = device_get_match_data(&pdev->dev);
>>> +
>>> +	if (priv_data) {
>>> +		struct console *cons = meson_uart_driver.cons;
>>> +
>>> +		meson_uart_driver.dev_name = priv_data->dev_name;
>>> +
>>> +		if (cons)
>>> +			strscpy(cons->name, priv_data->dev_name,
>>> +				sizeof(cons->name));
>>> +	}
>>> +
>>>    	if (!meson_uart_driver.state) {
>>>    		ret = uart_register_driver(&meson_uart_driver);
>>>    		if (ret)
>>> @@ -748,7 +762,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>>>    	port->x_char = 0;
>>>    	port->ops = &meson_uart_ops;
>>>    	port->fifosize = fifosize;
>>> -	port->private_data = (void *)device_get_match_data(&pdev->dev);
>>> +	port->private_data = (void *)priv_data;
>>>    	meson_ports[pdev->id] = port;
>>>    	platform_set_drvdata(pdev, port);
>>> @@ -780,6 +794,17 @@ static int meson_uart_remove(struct platform_device *pdev)
>>>    }
>>>    static struct meson_uart_data meson_g12a_uart_data = {
>>> +	.dev_name = "ttyAML",
>>> +	.has_xtal_div2 = true,
>>> +};
>>> +
>>> +static struct meson_uart_data meson_a1_uart_data = {
>>> +	.dev_name = "ttyS",
>>> +	.has_xtal_div2 = false,
>>> +};
>>> +
>>> +static struct meson_uart_data meson_s4_uart_data = {
>>> +	.dev_name = "ttyS",
>>>    	.has_xtal_div2 = true,
>>>    };
>>> @@ -794,7 +819,11 @@ static const struct of_device_id meson_uart_dt_match[] = {
>>>    	},
>>>    	{
>>>    		.compatible = "amlogic,meson-s4-uart",
>>> -		.data = (void *)&meson_g12a_uart_data,
>>> +		.data = (void *)&meson_s4_uart_data,
>>> +	},
>>> +	{
>>> +		.compatible = "amlogic,meson-a1-uart",
>>> +		.data = (void *)&meson_a1_uart_data,
>>>    	},
>>>    	{ /* sentinel */ },
>>>    };
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
