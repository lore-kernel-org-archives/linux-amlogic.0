Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DFBCDB483
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83hEzxf4B7yRMJDTkuxf6bBz6LaVcNNJGUBzsX4xmIA=; b=VfpdxQyZjOs0ioWZeVAJr55wmo
	TFHMIRsm7NfCDysjL6x8dyZi5g7rT8wakev9AUBqTL4V+3SEWot71Gv9RhXzEPbsb4F9bqyN4f9eQ
	PApcKHGReTHncZXR04/76Ij6lVLjcfI5MJ9iIKGKq0gxLqYDu4tBlU3DS9RZzNdv+mwrRTlTFHO9z
	faIbIrxdkaEXFebPaL/X7TWTRDTE7GGkKTetrzUI+0bkFgwc6MelZsAzbbv00F/zeY0Kb/LWAWsEt
	pZb0ZtTBv0XlMaHlwhEPMYE/wjh4Fl5TqAiQBrQqgIqLSu2tN0xUkBtBnqnVxH1VOn47y2ASZMjzH
	NqPP+YIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKE2-003h0F-13;
	Fri, 13 Oct 2023 15:37:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKDy-003gxs-10
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 15:37:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32799639a2aso2038777f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Oct 2023 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697211428; x=1697816228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5oyTNCPKWdkGABnn1l8QHV8SiFeKXaFhQsDAfS3/jU=;
        b=swIr1Y2BTQzVtRfSFYyDRw8I5SkFtIeKVSgsuG7wC65mDOpUusM5Iud0iI7pmqX0DU
         GfSVfbXENEJEgu8AXbqSbLSuyM54oZOfC71zzy9/rzdeYDShCFNf9A9jFpt7F1JjUTfV
         CPqO3hnczPBTiRWhZh4tT+vTb+7Wl2RupYnvZKFuv+tjFbZnnbejmSKYjQK5Hwb8BcOS
         VkbqnSlFO0DPr7xuRfYbr93wSPXgW3xMrJ1sE6reGpcltK4h+8NAh93dPQcYSnEV9dk7
         eGy03o0SjyozsHXzix22LTx5cAngp6BhMeqm8i6AHs7ww6IKxJCLBLkPEbUHmgMxHgTD
         TjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211428; x=1697816228;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G5oyTNCPKWdkGABnn1l8QHV8SiFeKXaFhQsDAfS3/jU=;
        b=I432dLeNkDUQ8E7i9wwdVQGc8CysTfsbSVAHpb+Ipptne6fU/NipvgQcSqQD5/epp0
         lkiBeCoJiw2a/qYHPDp7uFdK0mEErriuhhoPub4WNsssLE6VkBAaTjEBHrnbSMC0zEsF
         iY3UFjGw1G+EskXPZXWz2GabQaIGBgCwMkFXKwbxDkfCSH0AOc/21q1DamwfZZju7JnJ
         WFyFMeOcrUmvjISsB4o9YQveTI9YDYGy/0gr2S91IjgC8yTNKq0i7zWBpovcwIyx7Fxb
         niCuoD7t2KaTh4ttSGVDS9ErwNuGxbMyvLW4sb7Bd0keCJP0hjMp3NB3w+kbpSKBEdVL
         QPHw==
X-Gm-Message-State: AOJu0YxIuz+eD1ZFy6mn71UltN1GY71DKw8SQt+WUx1Q08K6wriZUcCS
	aROeBXkFVdF8u3xoBpOaCqidyg==
X-Google-Smtp-Source: AGHT+IFI4ILutivv2eLxcQlHbN7zkoPuh7ogi1AL06gLefp4u5sMqFPNWTdX3w2XIt20z9wTmiFJGQ==
X-Received: by 2002:adf:f005:0:b0:321:52fb:5703 with SMTP id j5-20020adff005000000b0032152fb5703mr24943473wro.13.1697211427824;
        Fri, 13 Oct 2023 08:37:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:535e:33c9:c7dd:4940? ([2a01:e0a:982:cbb0:535e:33c9:c7dd:4940])
        by smtp.gmail.com with ESMTPSA id bw14-20020a0560001f8e00b0032d886039easm6912044wrb.14.2023.10.13.08.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 08:37:07 -0700 (PDT)
Message-ID: <5765a10c-8f75-4bf4-830b-b5fba501d164@linaro.org>
Date: Fri, 13 Oct 2023 17:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4] tty: serial: meson: fix hard LOCKUP on crtscts mode
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@salutedevices.com>,
 Pavel Krasavin <pkrasavin@imaqliq.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <OF55521400.7512350F-ON00258A47.003F7254-00258A47.0040E15C@gdc.ru>
 <20231013141818.adq6eujrx2wueobp@CAB-WSD-L081021>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231013141818.adq6eujrx2wueobp@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_083714_350444_F791B464 
X-CRM114-Status: GOOD (  18.88  )
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

On 13/10/2023 16:18, Dmitry Rokosov wrote:
> I believe it would be necessary to include a 'Fixes' tag for that. Neil,
> what do you think?
> Since a HARDLOCKUP is an undesirable situation, I don't think we want to
> have it in the LTS kernels either.

Yes, and please keep the previous Reviewed-by Dmitry and I added on v3 and send a v5 with the Fixes added.

It should be:
Fixes: ff7693d079e5 ("ARM: meson: serial: add MesonX SoC on-chip uart driver")

Hopefully it will be the last iteration.

Thanks,
Neil
> 
> On Fri, Oct 13, 2023 at 11:48:39AM +0000, Pavel Krasavin wrote:
>> From: Pavel Krasavin <pkrasavin@imaqliq.com>
>>
>> There might be hard lockup if we set crtscts mode on port without RTS/CTS configured:
>>
>> # stty -F /dev/ttyAML6 crtscts; echo 1 > /dev/ttyAML6; echo 2 > /dev/ttyAML6
>> [   95.890386] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>> [   95.890857] rcu:     3-...0: (201 ticks this GP) idle=e33c/1/0x4000000000000000 softirq=5844/5846 fqs=4984
>> [   95.900212] rcu:     (detected by 2, t=21016 jiffies, g=7753, q=296 ncpus=4)
>> [   95.906972] Task dump for CPU 3:
>> [   95.910178] task:bash            state:R  running task     stack:0     pid:205   ppid:1      flags:0x00000202
>> [   95.920059] Call trace:
>> [   95.922485]  __switch_to+0xe4/0x168
>> [   95.925951]  0xffffff8003477508
>> [   95.974379] watchdog: Watchdog detected hard LOCKUP on cpu 3
>> [   95.974424] Modules linked in: 88x2cs(O) rtc_meson_vrtc
>>
>> Possible solution would be to not allow to setup crtscts on such port.
>>
>> Tested on S905X3 based board.
>>
>> Signed-off-by: Pavel Krasavin <pkrasavin@imaqliq.com>
>> ---
>> v4: More correct patch subject according to Jiri's note
>> v3: https://lore.kernel.org/lkml/OF6CF5FFA0.CCFD0E8E-ON00258A46.00549EDF-00258A46.0054BB62@gdc.ru/
>> "From:" line added to the mail
>> v2: https://lore.kernel.org/lkml/OF950BEF72.7F425944-ON00258A46.00488A76-00258A46.00497D44@gdc.ru/
>> braces for single statement removed according to Dmitry's note
>> v1: https://lore.kernel.org/lkml/OF28B2B8C9.5BC0CD28-ON00258A46.0037688F-00258A46.0039155B@gdc.ru/
>> ---
>>
>> --- a/drivers/tty/serial/meson_uart.c	2023-10-12 15:44:02.410538523 +0300
>> +++ b/drivers/tty/serial/meson_uart.c	2023-10-12 15:58:06.242395253 +0300
>> @@ -380,10 +380,14 @@ static void meson_uart_set_termios(struc
>>   	else
>>   		val |= AML_UART_STOP_BIT_1SB;
>>   
>> -	if (cflags & CRTSCTS)
>> -		val &= ~AML_UART_TWO_WIRE_EN;
>> -	else
>> +	if (cflags & CRTSCTS) {
>> +		if (port->flags & UPF_HARD_FLOW)
>> +			val &= ~AML_UART_TWO_WIRE_EN;
>> +		else
>> +			termios->c_cflag &= ~CRTSCTS;
>> +	} else {
>>   		val |= AML_UART_TWO_WIRE_EN;
>> +	}
>>   
>>   	writel(val, port->membase + AML_UART_CONTROL);
>>   
>> @@ -705,6 +709,7 @@ static int meson_uart_probe(struct platf
>>   	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
>>   	int ret = 0;
>>   	int irq;
>> +	bool has_rtscts;
>>   
>>   	if (pdev->dev.of_node)
>>   		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
>> @@ -732,6 +737,7 @@ static int meson_uart_probe(struct platf
>>   		return irq;
>>   
>>   	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
>> +	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
>>   
>>   	if (meson_ports[pdev->id]) {
>>   		return dev_err_probe(&pdev->dev, -EBUSY,
>> @@ -762,6 +768,8 @@ static int meson_uart_probe(struct platf
>>   	port->mapsize = resource_size(res_mem);
>>   	port->irq = irq;
>>   	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
>> +	if (has_rtscts)
>> +		port->flags |= UPF_HARD_FLOW;
>>   	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MESON_CONSOLE);
>>   	port->dev = &pdev->dev;
>>   	port->line = pdev->id;
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
