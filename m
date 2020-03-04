Return-Path: <SRS0=8tFv=4V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834D1C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 09:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AA620732
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2020 09:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhswmgI3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R20+ckLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56AA620732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQGxe/iT4aEqaODMCqEt1dcBD4gOESxZgGdg5bVg9no=; b=hhswmgI39EtnU2
	yPRyjPz4gKclaRXeg+2MQsbL0L/1jYyHiqlLXz0RdkrNlpRbMsEh2OSm5YnGUZ9bTiWL4AwZjmtwM
	3upbQ/54TaT4GDFRntT7nEXrIEDDsj16sLl2G/2JQPzLDwWZWLStnQPm/B9T2xjrRpzX0nc8pvx1H
	Mh0fzR43GdzUG0C+RGEUFaa0swCGo2TNkPPYlHGpy2cEdUwAisZ6rGRmWLqEf77d6NA1ziNv6ETHc
	WV1mO4Sq5Drn/3iY0C5PL/8JcxtMt1nGzqA+vjoOlSZcUAB91Z2TxmzlS82vLY2xI5v05Z6MYmTLa
	mpP74TzwD8HYz0Z2fz5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9QJW-0002Kw-P6; Wed, 04 Mar 2020 09:27:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9QJT-0002K2-MP
 for linux-amlogic@lists.infradead.org; Wed, 04 Mar 2020 09:27:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id a25so4284962wmm.0
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2020 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=FR+6EiZTn4++xDFyl+RNe/eQec06r2x5rz8CS42EZQ0=;
 b=R20+ckLixs5uaditquO+KQpOcpJsP6p76T3jB1E6dGhUN++3Y9Ti3TfAzyjehmoHvy
 NvXgYbJxfPPbUTUCMEhGvJSYJEl9pGD0fy7AX5fvNlxnS4fD7RoTHIcp2XQnqUYG47Ny
 /oxBYkM7hvufXaWy7fcUtQAjqgz5ePahBGsHMC2yrrXtbam5WWCSDNBfDXurLixumg0S
 noynA1D0XcXF/a4HJIF/YqsDN+pmarnknJXNXJFLUxdw1HuzjFrTzlxCyU7Ecsdq3M7o
 DOHWnb73Ir442OtzkM02d5hl2oAphf3giuT0TwL7gHNDjG37GcuaoicxfkXldemAcQUf
 HqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FR+6EiZTn4++xDFyl+RNe/eQec06r2x5rz8CS42EZQ0=;
 b=WTqNTU7OCXY7C/VAwQrKDWhTO898eXWEfT2v/yvB4Ktg5yRCOmyN1fXn+7ZZitxyEk
 Nq9n6VmHFiWYLrjk593QMDE66PqcrqANHwPbexA2y1zqcAaorB6FxYHBwTmlwJBnW+Ke
 NgobiRHpAyrfJcMhPYDXQYeaSGV53e24USvosnM1iiA7WtBG5DapwUl2Leh5QH0FkccH
 7k5nWuGDM/nBC03YSvNBMm0Om2tB6wB3dH6Dkx2azdhtpAl2FIz17g0y6OY/k6JrQNo7
 024BJc9PSdc60pgmsmI5u09AA9f87FpVGikHs5jnvqWfZgTKHw59rLmyqoniee5mNY4V
 YopA==
X-Gm-Message-State: ANhLgQ1km+N63WgJT0AuBmr2liKLgafJjk6nZvxqBt3+c/vnWCAfmpvd
 lZ/5DGzpp1VadJFs3dhVGcmXWid/cshw0A==
X-Google-Smtp-Source: ADFU+vu7OnoHje1mchV5tIYAgah4bdTdz9CwuL5BvHSsM9J1FtO2/HXfhJTedrjH223f2yBvshP+ww==
X-Received: by 2002:a1c:c308:: with SMTP id t8mr2584931wmf.63.1583314052887;
 Wed, 04 Mar 2020 01:27:32 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v11sm25420659wrs.54.2020.03.04.01.27.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Mar 2020 01:27:32 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Otto Meier <gf435@gmx.net>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
In-Reply-To: <0522f4cb-936d-50e0-1b6f-c885c94d7aa9@gmx.net>
References: <0522f4cb-936d-50e0-1b6f-c885c94d7aa9@gmx.net>
Date: Wed, 04 Mar 2020 10:27:31 +0100
Message-ID: <7hy2sgo4fw.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_012735_734464_36B5B167 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi Otto,

Otto Meier <gf435@gmx.net> writes:

>   Hello
>
> after having fixed the uart_c pinctrl definitions during September,
>
> this patch would revert part of the formerly Patch.

You only sent this to the linux-amlogic list.

Can you resend your comments replying to all of the original recipients
so that the pinctrl maintainers can see your concerns/comments.

Thanks,

Kevin


>
>   	/* Bank Y */
> -	GROUP(uart_cts_c,	1,	17),
> -	GROUP(uart_rts_c,	1,	16),
> -	GROUP(uart_tx_c,	1,	19),
> -	GROUP(uart_rx_c,	1,	18),
> +	GROUP(tsin_a_fail,	3,	3),
> +	GROUP(tsin_a_d_valid,	3,	2),
> +	GROUP(tsin_a_sop,	3,	1),
> +	GROUP(tsin_a_clk,	3,	0),
> +	GROUP(tsin_a_d0,	3,	4),
> +	GROUP(tsin_a_dp,	3,	5),
> +	GROUP(uart_cts_c,	1,	19),
> +	GROUP(uart_rts_c,	1,	18),
> +	GROUP(uart_tx_c,	1,	17),
> +	GROUP(uart_rx_c,	1,	16),
>
> The Numbering of uart_C pins is changed by this patch.
>
> This patch definitly breaks  the sdcard, if uart_c is enabled.
>
> bye
>
> Otto
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
