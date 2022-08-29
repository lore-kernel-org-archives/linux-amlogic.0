Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC21EECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnuEdmvO25PNBbT9VXWcIFbA7fucCLNaWg/YUm/YTWI=; b=qU3MCez88Oa7lc
	VvmCupCRNQPkDGTv45STsEoapjm7fyryyoUzC/nh8/DKwMEubUg8P46s/cJ80zcmB8zw9ViQKCgR7
	MPhFJhvrU/DoiyTrUt6Oq8pFIdSTEXnS/udfPfTsjMuQ/Cxsv9LQ22W+ToYgwPmx5Xv27lVeSblP8
	BDCFnYQvGf0/StOFt9vS0Agm0wXAedVjx4A3Ah32mzkEUp6dLNS4fN8HzpHBmuDwIjpWWMxauo1zy
	XL1pWOJh18Mt8SPLZ9XIO+vPwXNHNTDD7eEOOUvO5qioASzfVcFATiqO1U3HtM0hWYN/8RUvAowXb
	hIllVu+TvsTXrlbkB/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZRj-005mPU-Mu; Mon, 29 Aug 2022 07:44:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZRf-005mLS-O4
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:44:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id e20so9030413wri.13
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=QjEcd75RqT3WIgUp2pbtkalTMer+nFUQbbPAvaSW25U=;
        b=VUiIlhoZuw+u+tFb6JwkhBtkBhQutnnVLYzhx28QiSHqKDIy073Pl3gg6hbx25hxiU
         NpQbV39LEsHQPIYG5NIjf/zpr2i/EoKjMZR/u4mlHC1gIsH98yxq6j3YA9ro3cl89W75
         VE+9R7XjbrC3t5w3C9txQ9wO/MCDF/7Av2T2alAyhRJkeOC+u+XEv/cB/dLtNpOv/F9P
         XCbetVBFMArzO8UXwsfEn/L1BJYp1177u9GHxccLXiUb4j+WH0fWWrfgoqfZH71We7sK
         Frt6Yb5jjZsGjKVa/BwlHizl5JEqH4ftCYFwMtZ9ls2XAJ2SUOmya77P3Zncwz9KCoWp
         +YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=QjEcd75RqT3WIgUp2pbtkalTMer+nFUQbbPAvaSW25U=;
        b=PBc/zLEDqv3EVY6HHXyuG0+9YYnyacNQ7EWEC7U9ZPlHF2n/vG5rpqQpJLO0QbshHi
         rxZ//129R8voBhKWVh9blfpYv2eRceDb7KbfCre40tCkIOWieLL4wZby/Uy5O7rLVOrg
         B6xLvVyDDOtLL0ebE0aNziBZCIMkB/94iUdeC11yiEEGCJImFQ7nrxGsGuMyPVEgWSMx
         zK/2MYzSzuO10wTz3UkG3DahwLLil8SDPd6U3dkIBaK2eKrr1pKRH8tbfV163Uf0674Q
         ypoa8Fc2PZOh3sXMMVcyHNTIpsu8WSBxXodi5/IyegeznVl65zBK8isn9h9x+HBceabf
         3r0A==
X-Gm-Message-State: ACgBeo1LkYPXyOOlybtqTgq/nyJ1axYevEHxXGgVleXaFPHAlpvcO8+U
	RpfzCGobRDi5yx1kI0oCt8j4sQ==
X-Google-Smtp-Source: AA6agR6/W5X5eALXzIWGgg5gZJiu0WA3BEvbZhHKVoGSnQpMk97J1Zsl0Ln0n+YGVwhaoFPX4wTETA==
X-Received: by 2002:a5d:4a01:0:b0:21d:8ce1:8b6d with SMTP id m1-20020a5d4a01000000b0021d8ce18b6dmr5606743wrq.718.1661759069804;
        Mon, 29 Aug 2022 00:44:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id i12-20020a1c540c000000b003a2f2bb72d5sm8939722wmb.45.2022.08.29.00.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 00:44:29 -0700 (PDT)
Message-ID: <f14d517b-90c9-3741-6f41-6c82a7521f46@baylibre.com>
Date: Mon, 29 Aug 2022 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tty: serial: meson: Use devm_clk_get_enabled() helper
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <3f18638cb3cf08ed8817addca1402ed5e3bd3602.1661328361.git.christophe.jaillet@wanadoo.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <3f18638cb3cf08ed8817addca1402ed5e3bd3602.1661328361.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_004431_841872_4285DDBD 
X-CRM114-Status: GOOD (  24.95  )
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

On 24/08/2022 10:06, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code, the error handling paths and avoid the need of
> a dedicated function used with devm_add_action_or_reset().
> 
> That said, meson_uart_probe_clock() is now more or less the same as
> devm_clk_get_enabled(), so use this function directly instead.
> 
> This also fixes an (unlikely) unchecked devm_add_action_or_reset() error.
> 
> Based on my test with allyesconfig, this reduces the .o size from:
>     text	   data	    bss	    dec	    hex	filename
>     16350	   5016	    128	  21494	   53f6	drivers/tty/serial/meson_uart.o
> down to:
>     15415	   4784	    128	  20327	   4f67	drivers/tty/serial/meson_uart.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> devm_clk_get_enabled() is new and is part of 6.0-rc1
> 
> If the message "couldn't enable clk\n" is of any use, it could be added
> in meson_uart_probe_clocks() with a dev_err_probe() call. It wouldn't be
> exactly the same meaning, but at least something would be logged.
> ---
>   drivers/tty/serial/meson_uart.c | 29 +++--------------------------
>   1 file changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 6c8db19fd572..26de08bf181e 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -667,29 +667,6 @@ static struct uart_driver meson_uart_driver = {
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
> -
>   static int meson_uart_probe_clocks(struct platform_device *pdev,
>   				   struct uart_port *port)
>   {
> @@ -697,15 +674,15 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
>   	struct clk *clk_pclk = NULL;
>   	struct clk *clk_baud = NULL;
>   
> -	clk_pclk = meson_uart_probe_clock(&pdev->dev, "pclk");
> +	clk_pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>   	if (IS_ERR(clk_pclk))
>   		return PTR_ERR(clk_pclk);
>   
> -	clk_xtal = meson_uart_probe_clock(&pdev->dev, "xtal");
> +	clk_xtal = devm_clk_get_enabled(&pdev->dev, "xtal");
>   	if (IS_ERR(clk_xtal))
>   		return PTR_ERR(clk_xtal);
>   
> -	clk_baud = meson_uart_probe_clock(&pdev->dev, "baud");
> +	clk_baud = devm_clk_get_enabled(&pdev->dev, "baud");
>   	if (IS_ERR(clk_baud))
>   		return PTR_ERR(clk_baud);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
