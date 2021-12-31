Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3FEC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9mARITgszz2CvabNJux3czvtfXb1fqdxr/jtrlsQeY=; b=AAyNg3D0cKBOAy
	PMdknQrFdece0nzwNEFOcBE3rZ/tgmv0+xOiQ2YMJA35rGQF69kHTx2R0t34iWkcXYdstRmlo2jUo
	9+YTH8H9nNdqrxvMJbCZ01qqPQnN3KpAx9+hYh2NTYi/6pVh8xZlBvnpnEbKLPxJ48FzAgQNlKHX0
	Aug6FFCz2PBUifJ8pdD+R5KFiOytEDnkpBAQS1jKHIidZsdA6h4ROq3Bx7ve90gYT8nYgsc26ifJn
	kawOtky5yU873Dgc66he0Dn+BLcZHZef6ega+U038+OzV6bxN9/++MOkL0vxyGaXw8SOys75SRlai
	FbyhI2Gq6AoTORhOsE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Ju4-006Df5-QD; Fri, 31 Dec 2021 15:33:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Jts-006De3-Gw; Fri, 31 Dec 2021 15:33:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id j6so109747927edw.12;
 Fri, 31 Dec 2021 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VysC3BYXJYli8788JzEtZNXjhfyXYrLxhWoo/L00x/E=;
 b=A5uw6B+NLxc54AYITgqbaMurE9BkhaMQycGBQ+64od14Ko3v4KZQ0LBEARMrOY0WWq
 BX4Q9tVxPWvGMEq69UVdh/66w0MXgK2hFrCDKomg3HJsqW2FZq+8fH7p2y248KmEq635
 DF816PiLjuuOdI+pRjldBagq752gNBnP52rVgUuOt7J2gOa62B8wis3gfhNryBDZZ4yY
 WvdvrumpkRfLRm/f20fzTrw2D2jLfZM+twPVLcjI0J1tCHQiOw+x1/osk0JkRLbbk6ta
 Dg1Kz5LCGrQyBm1xSY1jchqnFpAttMGxP9HtxH8YvMX2lFQv0oTG0YA+jtbhEOpPro+z
 Z8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VysC3BYXJYli8788JzEtZNXjhfyXYrLxhWoo/L00x/E=;
 b=Qma2AXBj2X8i+oEXlsLc+QBJB4D4O9WXj7xs3IyyPIG0o+HEz2XdVqCNZZfuxt5ppy
 0rYs/SLZUqEsCSIKrsNTokqYYWkBYEO4zjrKhPQqPLqGqd0LC5WCcWevAGj8PmNF/tIr
 n/+u4tL2pRXjSISwhpmraZiZ4SvduVgZt57x0+PppIr4m0K2/6re9+KPIFt9lQMiu8UE
 dc6473XkIBIbCK3qVJdxbMQ8kab9gtR1NwArLztW6PSEQTtNOgoyBhE598Z2Q7AvzlEH
 urmr+sCeEt81vw4xQ4zt+GPxEKtGK9WL1cEkETCz5d0zt1t8dFRizrDi37YkJ02BMiQN
 lDIg==
X-Gm-Message-State: AOAM531dCbTKNQmDNFJ0MB1wkdGHf+hFh2d0OtuM6jAjMag379WqHemh
 GyqoUW+UXTbepdGwKPdTSHxzBtEWlCmJICpfH8E=
X-Google-Smtp-Source: ABdhPJwwyGmCRzsWC1+J5FYszmJ9Zjgj16AmXBvLzezgiA1gx+LbEMKOekxvjbgJhjN/PIHipJwl0+Zy8IHnasqVFB8=
X-Received: by 2002:a50:eacb:: with SMTP id u11mr35038865edp.290.1640964777172; 
 Fri, 31 Dec 2021 07:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
 <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
In-Reply-To: <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 31 Dec 2021 16:32:46 +0100
Message-ID: <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211231_073300_621330_5DC97F64 
X-CRM114-Status: GOOD (  28.22  )
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

On Fri, Dec 31, 2021 at 12:24 PM Yu Tu <yu.tu@amlogic.com> wrote:
[...]
> >>   static int meson_uart_request_port(struct uart_port *port)
> >>   {
> >> +       struct meson_uart_data *private_data = port->private_data;
> >> +       int ret;
> >> +
> >> +       ret = clk_prepare_enable(private_data->pclk);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret = clk_prepare_enable(private_data->baud_clk);
> >> +       if (ret) {
> >> +               clk_disable_unprepare(private_data->pclk);
> >> +               return ret;
> >> +       }
> > This code is from my original suggestion - and I had a doubt there
> > which I forgot to add as a comment originally:
> > Can you confirm that accessing the UART controller registers works
> > even when "pclk" is turned off?
> > I am asking this because the common clock framework can access the
> > clocks at any time.
> > And I have seen SoCs which would hang when trying to access a module's
> > registers while the module's pclk is turned off.
> On all meson platforms, the default pclk for all UART is turned on
> during the u-boot phase. When registering uart pclk in the kernel phase,
> the CLK_IGNORE_UNUSED flag is added. So the real shutdown is when the
> standby goes down, the parent clk shuts down.
Interesting, thanks for sharing that u-boot turns these clocks on.
Let's say someone wanted to make u-boot save power and turn off all
UART clocks except the one for uart_AO (where we typically connect the
serial console).
In that case the pclk of uart_C (just to choose an example here) is
turned off. Would there be a problem then accessing the registers of
uart_C before clk_prepare_enable is called?

[...]
> >>          port->fifosize = 64;
> > commit 27d44e05d7b85d ("tty: serial: meson: retrieve port FIFO size
> > from DT") [0] from May 2021 has changed this line to:
> >    port->fifosize = fifosize;
> > So your patch currently does not apply to linux-next (or even Linus'
> > mainline tree).
> >
> So do I need to wait for [0] patch merged before I can continue to make
> changes ?
These changes are already merged.

> What can I do before?
You should base your changes on top of the tty.git/tty-next branch [1]
where Greg (the maintainer of this tree) will pick up the patches once
they are good (got enough Acked-by/Reviewed-by, etc.).
I suspect that you based your changes on an older or stable kernel
version (let's say 5.10). New functionality should always get into the
-next tree where various auto-build robots will compile-test the
changes and we even have Kernel CI where changes are tested on real
hardware (BayLibre even maintains Amlogic boards in their Kernel CI
labs). Let's say Amlogic updates to Linux 5.17 next year then the
patches are already included in that kernel version - instead of being
only available in Linux 5.10.


Best regards,
Martin


[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
