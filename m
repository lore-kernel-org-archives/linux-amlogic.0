Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED15C83F12
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fv+p0VhurPbYgw3mEQ8djtdqgjMCuUle3+QhXmB96T8=; b=C5xDuyIBewn8AK
	pSZDulTQEKjb1TtWPvcJfg4Hv1Y82L2V6oGD7AiWZ1A3p2BLEeJPm1sMlN0jwHKl6FnGibI3ra+OK
	02HNZBNziSj/daH73qzHuPQX8LGdvLtUtdRKgbXERt9g8Q+W2Z0Lq+ybZqlt9TEbYfPREjsjESfmh
	Wdc/4DdYV/ccCe0vWjDtailKzVARPcMZDdwh5MSVIL7d4Ff6rg/08s9no4SaYVL7jJzUbx7E0OFMe
	0xaomOboTn1NWroOAHkRCu/R0QAD+e9HhA7IqmEoAN3XfsBTn+qag5Sb+2rfCLN7yqoWWiz8OAeK1
	QDraGzztCAQj/otQqamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadWO-009jdh-1G;
	Mon, 28 Aug 2023 14:47:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qadWM-009jdD-0U;
	Mon, 28 Aug 2023 14:47:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 691B762B48;
	Mon, 28 Aug 2023 14:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF44C433C7;
	Mon, 28 Aug 2023 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693234032;
	bh=t4UYsFixGBWU+iQLBjiupWXXolJDGFOG986A39rhGqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcyb3VRkhGoZGw9T/045gq6wy3bRR/5rGAtlNrFRlm8hbkAWx9gmdoEAx7ASCmlpt
	 XkzxG3rFG69tUteuUSj6/sB0X4YJCo1ydUt/pisYfLSzX0TFFGAEbMkcGXVg9HJb1m
	 BAeva63G3b5bXBQll6h1h030wIJ9mEv8DAuzYra8=
Date: Mon, 28 Aug 2023 16:47:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lucas Tanure <tanure@linux.com>, Jiri Slaby <jirislaby@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Message-ID: <2023082803-alone-tingle-b639@gregkh>
References: <20230827082944.5100-1-tanure@linux.com>
 <944f1370-c092-484e-a13d-b7f8211c4835@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <944f1370-c092-484e-a13d-b7f8211c4835@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_074714_234632_0354B4B3 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, Aug 28, 2023 at 02:31:06PM +0200, Neil Armstrong wrote:
> Hi Greg,
> 
> On 27/08/2023 10:29, Lucas Tanure wrote:
> > This reverts commit 6a4197f9763325043abf7690a21124a9facbf52e.
> > New SoC will use ttyS0 instead of ttyAML, so T7 SoC doesn't need a OF_EARLYCON_DECLARE.
> > 
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> > Since V1:
> > - add Signed-off-by:
> > 
> >   drivers/tty/serial/meson_uart.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> > index c4f61d82fb727..790d910dafa5d 100644
> > --- a/drivers/tty/serial/meson_uart.c
> > +++ b/drivers/tty/serial/meson_uart.c
> > @@ -648,8 +648,6 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
> >   OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
> >   		    meson_serial_early_console_setup);
> > -OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
> > -		    meson_serial_early_console_setup);
> >   #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
> >   #else
> 
> After some clarifications, it's ok to merge the revert:
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Already merged :)

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
