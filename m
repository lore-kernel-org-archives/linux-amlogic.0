Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBEEB64DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOTs5SnVinUQXAIeN//FkJXltjTw13XWTXWlSmVpjsE=; b=tCNK+h0a7Wa9aZ
	Tz23g4GNbzU34xsQqfqfgH7yG1mutuq3VDDWvHok9JDpgwc1Db3fdpe0OqsOf3klnqN69Jlva1c0K
	u3hhAyIl5J4PcKL9+sgRIwEE+hzmKrKPX1eSnGEbcOb7rOhTlIwopEalBZgm9Z3Y4AV8FIVLLv1XX
	GCaB8EfBoZNyZ3KrrddFRjbRZ3AfMSGuwjqXhTq0CnjQCJzi9qnmmfuXLvJP3xEbxmOx/U7afiYJY
	Gk9LIcGGT6GpSS6dq0l7TV0zkoZJyTzvMbbFUlrOF7kse8bKNm5JdYrIkiDOwAdrLKDgRBGuTP4H/
	A86e2uX0u8ja28ol7y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9wQp-00GLIz-0D;
	Thu, 15 Jun 2023 23:31:11 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9wQm-00GLID-1J;
	Thu, 15 Jun 2023 23:31:09 +0000
Date: Fri, 16 Jun 2023 07:30:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick <nick@khadas.com>, Artem <art@khadas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 5/6] tty: serial: meson: Added T7 SOC compatibility
Message-ID: <ZIufK7uK0ZrsVTZ3@ofant>
References: <20230615182938.18487-1-tanure@linux.com>
 <20230615182938.18487-6-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615182938.18487-6-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_163108_462413_5E227C45 
X-CRM114-Status: GOOD (  17.19  )
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

Hi Lucas:

On 19:29 Thu 15 Jun     , Lucas Tanure wrote:
> Make UART driver compatible with T7 SOC UART.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/tty/serial/meson_uart.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2501db5a7aaf..0208f9a6ba7e 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -796,6 +796,10 @@ static const struct of_device_id meson_uart_dt_match[] = {
>  		.compatible = "amlogic,meson-s4-uart",
>  		.data = (void *)&meson_g12a_uart_data,
>  	},
> +	{
> +		.compatible = "amlogic,meson-t7-uart",
> +		.data = (void *)&meson_g12a_uart_data,
I think you are trying to follow previous s4 scheme - to introduce a new
compatible string, while I think it's not necessary or even wrong, this will just
make the dt_match_list longer but without obvious benefits..

as Conor already raised this question in previous dt-binding patch[4/6],
how about just using 'amlogic,meson-g12a-uart' which is the first compatible
introduced.

if people agree, we could also drop 'amlogic,meson-s4-uart' since it use same
compatible data as gl12a, anyway it should be separated into another patch..

> +	},
>  	{ /* sentinel */ },


>  };
>  MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
> --
> 2.41.0
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
