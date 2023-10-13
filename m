Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4162CDB47E
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGFoDQYeL+F9y7JcJu3b/i9KSylhPgltb60VDM1i7NU=; b=01uUh7VAvwc7rt9PXsSkuZC8TR
	dAQ7z4gPcKdmIsYmhGFVjY7iZrtJU3i+9f5ja53ZhohZI9p7cOuXiJfwpJ+oWkFGtfslt7yP1bB62
	/aMNzonrQDzMKuNqyi8PBGxf9SQDaE5awPq4PYG1dD6tmLExegtsO/fAEH4DElsNTDAJoD583lahG
	nffUPUbdkY2vJrdnD1D9lS/vmm/8hjS9iaEqpxBHj5ObNQp1vgbYweu3yfyvhwiPZpWDPoKMNpYeU
	wYAMCP3OHJvOBw+m9f9Qi7RezSIA5p3Nx1BVRabQUkGy1Wv1Aps4JZjAbD8/6t75bbUQzAapythLS
	0fKk23ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCxG-002kkI-1t;
	Fri, 13 Oct 2023 07:51:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCxC-002kjD-1a
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 07:51:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-405361bba99so18202015e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Oct 2023 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697183484; x=1697788284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGLLNmMEIoHetPjQdGeJ01Fu1b8ChkbYllNK8qDfC4A=;
        b=oEaYXTKV33svNMsqeoMM1ju/kCzL4eGnMeTyu1oHix6NInx2ynejDijk5nx5qJQ2AK
         1/+zY/9gycwQkXNYZhYFyaTXnwRfqF39+oLObouaUt7FNj/2wjvHbPquzTCo7A9NndLS
         ZpOrMUPS7My7STdLsRL6VadsRN45nAKp7XSN/Cb9P5lBPjjsDK683qNZPpM6remL4oxr
         h8Bt74+c1UEmFjiK13IAlr4Y+mWmh+y/tAAaKwfLdsqHAG4YVMEV3jp9w5MOHRQCCtFS
         LvyJikdpx5Qvjnvju4xwf4LWagrCQADxOpMnp8lXSc+EnoofhT8sOPGmVMHWgXlxYzy6
         pyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183484; x=1697788284;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QGLLNmMEIoHetPjQdGeJ01Fu1b8ChkbYllNK8qDfC4A=;
        b=FRbG90StxVK3edwWQfiCJT/PCr0zENVvKVHqpCq3OHm7rG5ymbZsHfQT7R6VpXKDG2
         4fijGBH6vjXSSHZ/FAUd/Bve1f2/WSY7ugFTe23uX+3auMUjc33thExKf/Zr1XZcNVuE
         1bYiCutS54Vs54xWm83LY3MOGEsiKtWdgKFkYQC3OUKCbNMMG73/uqymSN0eflRKgcS6
         R1KK3epIMcppDyV76rs/D6zlEgTBVi2/GBnibUzypt1OlwSnpz83kHx815fTrlS+dcPf
         9dMivBoqCUXm9EMkLnX4xYfgv4ZJNuwNHxJRLkH3yLodemRrqrh9V9JYx6/ab1SxuVzi
         Blqg==
X-Gm-Message-State: AOJu0Ywkb3VnLMT3PlmnQFogjomHsNDWDhsYEYNtnS1DO9U3ZGwzsIAO
	4Kg3mS507ZAXyxo3/v3YeELbhA==
X-Google-Smtp-Source: AGHT+IELG391V1Ud7elbQt4QWMSF5GEdV2anomcs+s+Wryke+mq9djUBHEODiUiryn2RFZg18FUapQ==
X-Received: by 2002:a05:600c:ac1:b0:405:39b4:3145 with SMTP id c1-20020a05600c0ac100b0040539b43145mr23450412wmr.2.1697183484112;
        Fri, 13 Oct 2023 00:51:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:535e:33c9:c7dd:4940? ([2a01:e0a:982:cbb0:535e:33c9:c7dd:4940])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b00401b242e2e6sm1783318wmj.47.2023.10.13.00.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 00:51:23 -0700 (PDT)
Message-ID: <39193720-d105-47c0-8475-3e321f7095b5@linaro.org>
Date: Fri, 13 Oct 2023 09:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] tty: serial: meson: hard LOCKUP on crtscts mode
Content-Language: en-US, fr
To: Pavel Krasavin <pkrasavin@imaqliq.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <OF6CF5FFA0.CCFD0E8E-ON00258A46.00549EDF-00258A46.0054BB62@gdc.ru>
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
In-Reply-To: <OF6CF5FFA0.CCFD0E8E-ON00258A46.00549EDF-00258A46.0054BB62@gdc.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_005126_530400_E25BA7F9 
X-CRM114-Status: GOOD (  15.32  )
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

On 12/10/2023 17:25, Pavel Krasavin wrote:
> From: Pavel Krasavin <pkrasavin@imaqliq.com>
> 
> There might be hard lockup if we set crtscts mode on port without RTS/CTS configured:
> 
> # stty -F /dev/ttyAML6 crtscts; echo 1 > /dev/ttyAML6; echo 2 > /dev/ttyAML6
> [   95.890386] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   95.890857] rcu:     3-...0: (201 ticks this GP) idle=e33c/1/0x4000000000000000 softirq=5844/5846 fqs=4984
> [   95.900212] rcu:     (detected by 2, t=21016 jiffies, g=7753, q=296 ncpus=4)
> [   95.906972] Task dump for CPU 3:
> [   95.910178] task:bash            state:R  running task     stack:0     pid:205   ppid:1      flags:0x00000202
> [   95.920059] Call trace:
> [   95.922485]  __switch_to+0xe4/0x168
> [   95.925951]  0xffffff8003477508
> [   95.974379] watchdog: Watchdog detected hard LOCKUP on cpu 3
> [   95.974424] Modules linked in: 88x2cs(O) rtc_meson_vrtc
> 
> Possible solution would be to not allow to setup crtscts on such port.
> 
> Tested on S905X3 based board.
> 
> Signed-off-by: Pavel Krasavin <pkrasavin@imaqliq.com>
> ---
> v3: "From:" line added to the mail
> v2: https://lore.kernel.org/lkml/OF950BEF72.7F425944-ON00258A46.00488A76-00258A46.00497D44@gdc.ru/
> braces for single statement removed according to Dmitry's note
> v1: https://lore.kernel.org/lkml/OF28B2B8C9.5BC0CD28-ON00258A46.0037688F-00258A46.0039155B@gdc.ru/
> ---
> 
> --- a/drivers/tty/serial/meson_uart.c	2023-10-12 15:44:02.410538523 +0300
> +++ b/drivers/tty/serial/meson_uart.c	2023-10-12 15:58:06.242395253 +0300
> @@ -380,10 +380,14 @@ static void meson_uart_set_termios(struc
>   	else
>   		val |= AML_UART_STOP_BIT_1SB;
>   
> -	if (cflags & CRTSCTS)
> -		val &= ~AML_UART_TWO_WIRE_EN;
> -	else
> +	if (cflags & CRTSCTS) {
> +		if (port->flags & UPF_HARD_FLOW)
> +			val &= ~AML_UART_TWO_WIRE_EN;
> +		else
> +			termios->c_cflag &= ~CRTSCTS;
> +	} else {
>   		val |= AML_UART_TWO_WIRE_EN;
> +	}
>   
>   	writel(val, port->membase + AML_UART_CONTROL);
>   
> @@ -705,6 +709,7 @@ static int meson_uart_probe(struct platf
>   	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
>   	int ret = 0;
>   	int irq;
> +	bool has_rtscts;
>   
>   	if (pdev->dev.of_node)
>   		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
> @@ -732,6 +737,7 @@ static int meson_uart_probe(struct platf
>   		return irq;
>   
>   	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
> +	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
>   
>   	if (meson_ports[pdev->id]) {
>   		return dev_err_probe(&pdev->dev, -EBUSY,
> @@ -762,6 +768,8 @@ static int meson_uart_probe(struct platf
>   	port->mapsize = resource_size(res_mem);
>   	port->irq = irq;
>   	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
> +	if (has_rtscts)
> +		port->flags |= UPF_HARD_FLOW;
>   	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MESON_CONSOLE);
>   	port->dev = &pdev->dev;
>   	port->line = pdev->id;

Looks fine, I expected the tty core to check uart-has-rtscts or UPF_HARD_FLOW, but seems I was naive.

LGTM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
