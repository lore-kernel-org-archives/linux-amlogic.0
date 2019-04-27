Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F31C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 13:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8381A206E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 13:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OMF2yROe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nexBWa1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8381A206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd7jcEsT4bGkkesNl6IXCURf0QnsApl40uaCHxtTsBU=; b=OMF2yROej8ygd4
	BBObp63MvSOY3ezjrfC6ULZbQdIm9pEZQL6EA7ODFCXpCcUYycyK8MCJj+M0MivowPCOZUWnsCL3F
	UZapMXDvcEIZSZKp8qw5YkUT90G3u5rQRCdtg1G4IKWPbWHm5IkJN7kI3RidOnw7fFAf7qqyykxTy
	ErStXANS5gbNOW+cY5XpNNiXWbKmU9uZsu/9WltNV63Jje75jaTAlh8Ybk1MzMmsv6+fmRiMfmCLs
	hmJ52ZOtf80eL71i1xUGGhfAuHORWf1IvyBarjS2yqq19PW4+8axBuxd73GmV8ruQ28tE4KBMGKE4
	h0E/KJ//r3JkSzr9E/xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKNRE-0008Hj-41; Sat, 27 Apr 2019 13:32:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKNRB-0008HF-M9
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 13:32:18 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E433F2087F;
 Sat, 27 Apr 2019 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556371937;
 bh=F/Ri3rbRNbdBS8CeJ3YkqZ5ALE9RaYzYV4i/TX+VbhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nexBWa1sKOnsIU/+eE/Arr0X7crav6ldqrhFgjM7W8ztYCtpv+iiTXftfvQTPlJG3
 Z8PjosvAL9baHK8g4HVoOep4odQGPEL6uE1Db+W4FngO8Erm7fuwx70sU6Qt1CWHRh
 QbmdhCLabzZBpyFVy53w/oRoRA4SbXzVCZ0vDS90=
Date: Sat, 27 Apr 2019 15:32:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 10/41] drivers: tty: serial: sb1250-duart: fix missing
 parentheses
Message-ID: <20190427133215.GD11368@kroah.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-11-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556369542-13247-11-git-send-email-info@metux.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_063217_743226_2DED17A9 
X-CRM114-Status: GOOD (  12.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Apr 27, 2019 at 02:51:51PM +0200, Enrico Weigelt, metux IT consult wrote:
> Fix checkpatch warning:
> 
>     ERROR: Macros with complex values should be enclosed in parentheses
>     #911: FILE: drivers/tty/serial/sb1250-duart.c:911:
>     +#define SERIAL_SB1250_DUART_CONSOLE	&sbd_console
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/tty/serial/sb1250-duart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
> index 1184226..ec74f09 100644
> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c
> @@ -908,7 +908,7 @@ static int __init sbd_serial_console_init(void)
>  
>  console_initcall(sbd_serial_console_init);
>  
> -#define SERIAL_SB1250_DUART_CONSOLE	&sbd_console
> +#define SERIAL_SB1250_DUART_CONSOLE	(&sbd_console)

No, that's foolish.

checkpatch is a hint, it's not always right.

Also, checkpatch cleanups for really old drivers is not generally a good
idea, especially if you do not have the hardware for them.  Please don't
cause unneeded churn for this type of thing in this subsystem, unless
you have the hardware.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
