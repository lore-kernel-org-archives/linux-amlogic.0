Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B51C83F01
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcP5Lblm8/mvxoi8FyFrFzsQilBJMlzzVL9mUqjXK1g=; b=bj0BQTi6xYYCd9
	kzxFNN3B+bKl0WRI90kIoOGzM/78ibj4b3DoTvid0ndx9xHOal6FWN6tIWm8W85LFkrVwwXA36Z8J
	9wFHaK9+SDoMCJ1BV7qjU82OBozherCsuK5B/6Dx+jztkvO/V8OwP+gp+ffqTjjxyZlzTlRd7+h2m
	LJSH8l0p7o8fH9ggpPWVRIyf4bf0hUscsYbSk8OCWFx8FIDLLjCEbZ+sEOWeCbY0XH6zUuS1uryTk
	8MnDSgcM7uo4hYMGDF/Ux4e38IZBLWpuVzvPqpSxJiTn9nG0lpwAczbSixJ8K23ghHOqeUxzVBVOZ
	890B1ykvN997HqqgaFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaAoy-007dyq-0y;
	Sun, 27 Aug 2023 08:08:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaAov-007dyQ-0g;
	Sun, 27 Aug 2023 08:08:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA23861EBC;
	Sun, 27 Aug 2023 08:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBB4C433C8;
	Sun, 27 Aug 2023 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693123707;
	bh=MHJjt4eg563LiNA4ksLlQeSWc1mSO+P5YUvp3Qw59eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCLZGT5atK53aCSn14SJGisOnhcx97NH6PVBwJ65LgfZC2QXmpGQJZndYTrpVfmnG
	 j2gz5jtZxrgegiW2ANHkQfdSyRFZMLyNbPgbAw0MM/h8zvGj/yjEZy/+0bs3W8EwQH
	 5+6UMdmKxxS7YX0bvY5+ofzGExSHcLA3YW6FJ1+M=
Date: Sun, 27 Aug 2023 10:08:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Message-ID: <2023082710-synergy-spectrum-57aa@gregkh>
References: <20230827080113.2790-1-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827080113.2790-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_010829_320200_B6EA430B 
X-CRM114-Status: GOOD (  22.50  )
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

On Sun, Aug 27, 2023 at 09:01:13AM +0100, Lucas Tanure wrote:
> This reverts commit 6a4197f9763325043abf7690a21124a9facbf52e.
> New SoC will use ttyS0 instead of ttyAML, so T7 SoC doesn't need a OF_EARLYCON_DECLARE.
> 
> ---
>  drivers/tty/serial/meson_uart.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index c4f61d82fb727..790d910dafa5d 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -648,8 +648,6 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
>  
>  OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
>  		    meson_serial_early_console_setup);
> -OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
> -		    meson_serial_early_console_setup);
>  
>  #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
>  #else
> -- 
> 2.42.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
