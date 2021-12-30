Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A785C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRKno+lDY0YQA9zYMMm8LVEN3dz2z9/TrC6IHNUOLIc=; b=KPYKEPmq96Y7hx
	4yUemOeF/4STzY5RPxt6HX9uaUkXQ63xleoZQvoE6WfdyV/n2T2tY0KBzYOVnGUC4+I12PZQJ/bAN
	FgMggLS3x09xdFjxAdMyqD6m9Tvd9Cjo57t1xcVwTaTsnRnR6YMYYizLDmzRPy5WzEcqrzzHJCNAx
	kD1+DCC9G/QQ6RDt281LU/1xdtFYj5MTXCzA0wpXs36rbpwfLnDYWjLQQmpneNujnf/nfgtbgqZ2w
	PHwjVxqV0lkucvjkA8+0RIuz9zM9dLIS+X0oyN/wPMbFOPixooPVjwJZtVc5wBMysCdySVUCD1qT8
	/FHahGvRt6Rw2286FsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n34cS-005Ofz-BK; Thu, 30 Dec 2021 23:14:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n34cG-005OeM-EA; Thu, 30 Dec 2021 23:13:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id x15so103314448edv.1;
 Thu, 30 Dec 2021 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjS3WKP5qJV4EDilsIZw+xVU+rDXRT31OPDC34vv2uI=;
 b=Y07RmJGr6NZBTjFC//bhbEjk+UhhWpNPddiGau7tN3tcFkHbtGr+o1fPe4V6nB8thD
 +E2ahByORD/7KewpDKmG8Bqgz2i4v0Jgid4wQ9MWFk/uKZ8/dj+yH9zpAff381qey49V
 Xt1inaa+QOLdykM7etsTPLWUX8OUS4JUjZihy+kNo35MS/mR8wDNFQKrbrXXC09q5tin
 65mJjwVw+EUPQRrqckyRVMj8u/qQxpgAcsMvXqwv0uyB2GG69CNrPSfLJllt87faddGR
 QGiIx4I9c8OAxOUy7HGWKoLHxFPeKiiMVIQV5bT7dLV8a3yURWnKfmFt+jIcxZEHBnSn
 zppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjS3WKP5qJV4EDilsIZw+xVU+rDXRT31OPDC34vv2uI=;
 b=SL+3h6jPadK0OkXZS6OI3MotuuYbpxMCftiaCEouF3pQtaVk7IugN0gKJk9cba1+w+
 pA+bD/C4O6de+M//wCURiEyUjVaQdsJBHTtpLogRq0Ror+cy2iwLyGT8Gj61eA5VqjYw
 72TMIJzPyVSPbxW4/W6j8idUB6wanbXqhFd/Xmch7zaYFPuIFoVUjm6G3fj/G9xuV1ih
 //H2SyzhJxX6Gpm5CpedcabsNuyNa4F6YVOVjOfSUYJIms0csUABcb9vmWecBrAi/CoM
 8Ybv09Yb8SydV5GZvCdF0HMDRlF9GmCRImHqiwSN4V0d9Wbx0R1gijEOEPaTFuq8i11q
 Wrsw==
X-Gm-Message-State: AOAM5335EuAOOku3EOgL2Qi3EN3CUK8tQgZJu7vKBqTaHWBcEBbBOmHh
 wHHTinN07O3C5eahmkx37bVhbw3sCdtjFHNfehk=
X-Google-Smtp-Source: ABdhPJxBvPIVBgX5cxzud69fvSHeIG189+MSK3hCBdSdcNGtK0h/eCppV761qa/XMsD0MuRHo7R/XrhfEvxvez1M1UI=
X-Received: by 2002:a05:6402:1b9c:: with SMTP id
 cc28mr31790799edb.219.1640906026806; 
 Thu, 30 Dec 2021 15:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
In-Reply-To: <20211230102110.3861-5-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 31 Dec 2021 00:13:36 +0100
Message-ID: <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_151348_546000_6BC485F8 
X-CRM114-Status: GOOD (  24.33  )
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

On Thu, Dec 30, 2021 at 11:21 AM Yu Tu <yu.tu@amlogic.com> wrote:
[...]
> @@ -270,14 +284,11 @@ static void meson_uart_reset(struct uart_port *port)
>  static int meson_uart_startup(struct uart_port *port)
>  {
>         u32 val;
> -       int ret = 0;
> +       int ret;
>
> -       val = readl(port->membase + AML_UART_CONTROL);
> -       val |= AML_UART_CLEAR_ERR;
> -       writel(val, port->membase + AML_UART_CONTROL);
> -       val &= ~AML_UART_CLEAR_ERR;
> -       writel(val, port->membase + AML_UART_CONTROL);
> +       meson_uart_reset(port);
I suggest splitting this into a separate patch. In general I think
it's a good idea to re-use meson_uart_reset here if possible.
However, if during testing it turns out that this doesn't work then we
can revert this single patch which updates meson_uart_startup() only -
instead of reverting the whole transition to the common clock
framework.

[...]
>  static int meson_uart_request_port(struct uart_port *port)
>  {
> +       struct meson_uart_data *private_data = port->private_data;
> +       int ret;
> +
> +       ret = clk_prepare_enable(private_data->pclk);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(private_data->baud_clk);
> +       if (ret) {
> +               clk_disable_unprepare(private_data->pclk);
> +               return ret;
> +       }
This code is from my original suggestion - and I had a doubt there
which I forgot to add as a comment originally:
Can you confirm that accessing the UART controller registers works
even when "pclk" is turned off?
I am asking this because the common clock framework can access the
clocks at any time.
And I have seen SoCs which would hang when trying to access a module's
registers while the module's pclk is turned off.

[...]
>         port->fifosize = 64;
commit 27d44e05d7b85d ("tty: serial: meson: retrieve port FIFO size
from DT") [0] from May 2021 has changed this line to:
  port->fifosize = fifosize;
So your patch currently does not apply to linux-next (or even Linus'
mainline tree).

[...]
>  static const struct of_device_id meson_uart_dt_match[] = {
> -       { .compatible = "amlogic,meson6-uart" },
> -       { .compatible = "amlogic,meson8-uart" },
> -       { .compatible = "amlogic,meson8b-uart" },
> -       { .compatible = "amlogic,meson-gx-uart" },
> +       {
> +               .compatible = "amlogic,meson6-uart",
> +               .data = (void *)false,
> +       },
> +       {
> +               .compatible = "amlogic,meson8-uart",
> +               .data = (void *)false,
> +       },
> +       {
> +               .compatible = "amlogic,meson8b-uart",
> +               .data = (void *)false,
> +       },
> +       {
> +               .compatible = "amlogic,meson-gxbb-uart",
> +               .data = (void *)false,
> +       },
> +       {
> +               .compatible = "amlogic,meson-gxl-uart",
> +               .data = (void *)true,
> +       },
> +       {
> +               .compatible = "amlogic,meson-g12a-uart",
> +               .data = (void *)true,
> +       },
> +       {
> +               .compatible = "amlogic,meson-s4-uart",
> +               .data = (void *)true,
> +       },
> +       /*
> +        * deprecated, don't use anymore because it doesn't differentiate
> +        * between GXBB and GXL which have different revisions of the UART IP.
> +        */
> +       {
> +               .compatible = "amlogic,meson-gx-uart",
> +               .data = (void *)false,
> +       },
For this change I think it's also best to split it into separate
changes, similar to the dt-bindings:
1) deprecate and replace "amlogic,meson-gx-uart"
2) another one to add the S4 compatible string
3) and a third one with the big common clock framework change (adding
the .data attributes)

This is about the "Separate each logical change into a separate patch"
rule from the Linux kernel patch submission guide [1]
Also I hope that it will make it (at least a bit) easier for others to
also review this patch.


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/tty/serial/meson_uart.c?id=27d44e05d7b85d9d4cfe0a3c0663ea49752ece93
[1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#separate-your-changes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
