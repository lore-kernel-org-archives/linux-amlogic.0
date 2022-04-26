Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C10EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Apr 2022 07:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIGVLP6O+xmQwKajRo/qcMtevZCOwK+dp52+SsoYzQg=; b=eMgT8LUobjatY7
	dpJ0WN2UF8+9Lgwtlhb7o0wsOq/IyZ4qDTRHnBtynsJE6mZPGg7kSqcX2QUbsfsTtK+5kjjxHFKsQ
	Kh0s3OL4W5ya7PWWkx7tnOScbzE5KpVEaCBmRLGxfUtL1MHs9TyNnoF9f4PnqKLog0uAduoOTtUq7
	R0BcpIngIiPj9dRZw8nKaOaCNNQLZrRu53CZQ2YxJJwMtmfM55ndVLikbBBml2HLvRo10Iiq4Y4Wc
	Fe7wKyhNkZo5XmTP6AYMiihNR51KjRoaq/U1dnZ7PpyFeq8dL1B/f3fnxa0MpcXP56OW93EhHb3BS
	O3vDmdL5T0GfEi9taQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFWN-00Cw93-W7; Tue, 26 Apr 2022 07:22:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFWK-00Cw5R-Pu
 for linux-amlogic@lists.infradead.org; Tue, 26 Apr 2022 07:22:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id k2so3650317wrd.5
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Apr 2022 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kqCVW0ViFiDLfuUltD6ceLWCuS5LlNYMC1bu8RrqhkA=;
 b=MqA6/PDIxKqRH+lQ2/sTur4h7RG9s3zN7hLAijmKbA43BeyAnNAVvgN2KFE79lQ1sV
 sfMeNQ+/IJVoQeUvw21QUtFDmaQ0xXtvIuCcHJfXNMQubvKWXpRhfREfoQ1sXD0PjDk7
 dTtEIe5M9aiqy8UzdQ0netAzpEgUS4bYrhDcdgF0AHkaPbt4Fhsj5ubBOdlU2R/tgIj3
 vYBxXnc0xW6j9yGuot8ApwbG29OqTKvEOK65AZt2vtSzrakC0POxZBV8A2j+DnDBNvmH
 fDU/QMlTXgE5b01ZJ1KM/pBKcdQvl7ifDDsfb4PyRvLztQrm7Ht/4WTlEeRI5oHFPhG6
 /EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kqCVW0ViFiDLfuUltD6ceLWCuS5LlNYMC1bu8RrqhkA=;
 b=rtNQEIB/+MY5aRMIx1KxEOZXP7w2PDbhUVgi4Ddi4YZZA1mFT02D9QVhMQCVp4B0v1
 YBABlxGlxSU1Q5j8jWaZwECcBuL2+lIaPqfMe64Dqv2kbN8XtFnKO8Q6jQybByhdRh/h
 HIWLw4B2qs2TgJF+oah8/32xSgrHFTK4FyD/sTouzdX13KqiquhH6zUaTJrcss1DFKCz
 Kz17rm9X7jT0VTeK9mnQKjYTpUePwng3sMvmwKxto8vohgCu5BMtssPTUew2u6200Jhd
 Us1GAtq1yDUnPohZsTiwP2KOu6f4JyN0IqACHBGTUCOA4NJWEPJVHoiOvqC7WoAb9fB0
 gVew==
X-Gm-Message-State: AOAM530uyFiio8JnDhsCcLhbcvAJjZO0/MlvAqJVbsVkC8xIW/ZwhBcK
 kjSVZ5yF0h28OaRpbeZKMIIMz64ETTb3Eg==
X-Google-Smtp-Source: ABdhPJxCS/cGLUzaMeyiE+Z65vaMY25979f5iUpgNpSCgBY4N+ECQBbO/fBIyVDFdLn4MaFD+a25cg==
X-Received: by 2002:adf:f2cc:0:b0:20a:cfbb:ac29 with SMTP id
 d12-20020adff2cc000000b0020acfbbac29mr12853435wrp.263.1650957716481; 
 Tue, 26 Apr 2022 00:21:56 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5959:ca32:2e01:b6fc?
 ([2001:861:44c0:66c0:5959:ca32:2e01:b6fc])
 by smtp.gmail.com with ESMTPSA id
 p1-20020adfaa01000000b0020ab1e305f1sm10762654wrd.22.2022.04.26.00.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:21:55 -0700 (PDT)
Message-ID: <2e0d53d9-5770-7d47-4dd5-9302ee8d546b@baylibre.com>
Date: Tue, 26 Apr 2022 09:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC] tty: serial: meson: add new compatible for gxl uart
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Yu Tu <yu.tu@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <fd06c40a-4f63-3b93-8471-477506f4ef38@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <fd06c40a-4f63-3b93-8471-477506f4ef38@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_002200_875539_D408DEEE 
X-CRM114-Status: GOOD (  26.08  )
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

On 25/04/2022 22:39, Heiner Kallweit wrote:
> My SC2 test system (ah212-based HK1 RBOX X4) uses an uboot console
> speed of 921600 bps. Being able to use the same speed in Linux
> requires using a 12MHz clock source. Ideally we'd set the new
> compatible to the first chip version supporting the
> AML_UART_BAUD_XTAL_DIV2 bit.

Actually G12A is the first chip having AML_UART_BAUD_XTAL_DIV2, but SC2 is
the first one requiring it to achieve 921600 bps correctly.

> Not having access to chip documentation
> I'd appreciate a hint on when this bit was introduced.
> If fine with you in general the final series would include a
> separate patch for the new compatible.

This has been already handled in:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=368ab68b18de104719f386a5cfe3595673cc96de
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=00a7fa836dbc454faf5b7027ad67519af7c6c15b
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=9b92cc5ee2d10e6c4d327d1e4ceb77aa8b1081ee

> 
> Note: This patch doesn't consider "tty: serial: meson:
> Use DIV_ROUND_CLOSEST to calculate baud rates" yet and therefore
> won't apply cleanly on linux-next.
> I locally used the same DIV_ROUND_CLOSEST() changes before.
> ----------------------------------------------------------------
> Newer SoC versions support using XTAL / 2 (12MHz) as clock source
> for the UART. This clock source allows to support 921600 bps as used
> by vendor uboot on certain systems like ah212 ref board.
> 
> 12MHz / 13 = 923076 bps
> With the currently used 8MHz clock source only 888888bps or
> 1000000 bps are possible.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/tty/serial/meson_uart.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2bf1c57e0..0a0a0636f 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -68,6 +68,7 @@
>   #define AML_UART_BAUD_MASK		0x7fffff
>   #define AML_UART_BAUD_USE		BIT(23)
>   #define AML_UART_BAUD_XTAL		BIT(24)
> +#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
>   
>   #define AML_UART_PORT_NUM		12
>   #define AML_UART_PORT_OFFSET		6
> @@ -299,10 +300,15 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>   		cpu_relax();
>   
>   	if (port->uartclk == 24000000) {
> -		val = ((port->uartclk / 3) / baud) - 1;
> -		val |= AML_UART_BAUD_XTAL;
> +		if (of_device_is_compatible(port->dev->of_node, "amlogic,meson-gxl-uart")) {
> +			val = DIV_ROUND_CLOSEST(port->uartclk, 2 * baud) - 1;
> +			val |= AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_DIV2;
> +		} else {
> +			val = DIV_ROUND_CLOSEST(port->uartclk, 3 * baud) - 1;
> +			val |= AML_UART_BAUD_XTAL;
> +		}
>   	} else {
> -		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
> +		val = DIV_ROUND_CLOSEST(port->uartclk, 4 * baud) - 1;
>   	}
>   	val |= AML_UART_BAUD_USE;
>   	writel(val, port->membase + AML_UART_REG5);
> @@ -782,6 +788,7 @@ static const struct of_device_id meson_uart_dt_match[] = {
>   	{ .compatible = "amlogic,meson8-uart" },
>   	{ .compatible = "amlogic,meson8b-uart" },
>   	{ .compatible = "amlogic,meson-gx-uart" },
> +	{ .compatible = "amlogic,meson-gxl-uart" },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_uart_dt_match);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
