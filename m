Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E71DC43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 13:30:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EC2208CB
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 13:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lU+uEiGJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE/IsNN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EC2208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIgEB8GJL+XjGqwPK4sGDjlmUiIxdd68KM61Tu2e24k=; b=lU+uEiGJsbUNBz
	9fGBv+0qmODXn0csoD6tJrCHGAa9I3bgm6TeQ80m6SdrQ9pIoouEMNQEJUAlwWAUocN3Ep7E/f/+s
	99crR2siLl9LJwFoP2Rsy9cRocsuSlr3WV4F7KEKYbH3P2VbvRB0VqQXgSwQ1xj/vQFsVfL97vpiu
	7FUpRcqk3fAUAcD8xaOoTm78wZieE3K2V/P8MOo3sw1suuS2oj8JmxmS5Js7iRuo+uhYGV5SnhXNQ
	Jj7yBrFl9GRInIBUg7D1YMmTwOoUy9tvodd7jjk2PVyPloJGgWUezUTWbReizmlgOrqZfchGtDIh6
	hOFAFw7obpALDfpbuhdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKNPr-00085f-Kv; Sat, 27 Apr 2019 13:30:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKNPp-000855-5Q
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 13:30:54 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A4682087F;
 Sat, 27 Apr 2019 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556371852;
 bh=Lh9s0O0+A8sPU7fyQWvhROtRxYQ2VDabkJlyUvL7sek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VE/IsNN+OoggOL0lqnbBMENjYjQMHUlg6MzRjzd1wN8UG2ch8tWXwwllPaD6PTYFn
 mCF1UqTTSxvOfCSi55yzLfekiXXAcF44HsZlZXG4txLN8xZgDjNdx2St37NOCVhQjx
 TD6zDEh5JrUi3h2KNNgGkeyXD0aOAtKHV/ga5/ng=
Date: Sat, 27 Apr 2019 15:30:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 05/41] drivers: tty: serial: dz: use pr_info() instead of
 incomplete printk()
Message-ID: <20190427133050.GB11368@kroah.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-6-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556369542-13247-6-git-send-email-info@metux.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_063053_225974_70FF17A2 
X-CRM114-Status: GOOD (  13.23  )
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

On Sat, Apr 27, 2019 at 02:51:46PM +0200, Enrico Weigelt, metux IT consult wrote:
> Fix the checkpatch warning:
> 
>     WARNING: printk() should include KERN_<LEVEL> facility level
>     #934: FILE: dz.c:934:
>     +	printk("%s%s\n", dz_name, dz_version);
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/tty/serial/dz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
> index 559d076..e2670c4 100644
> --- a/drivers/tty/serial/dz.c
> +++ b/drivers/tty/serial/dz.c
> @@ -931,7 +931,7 @@ static int __init dz_init(void)
>  	if (IOASIC)
>  		return -ENXIO;
>  
> -	printk("%s%s\n", dz_name, dz_version);
> +	pr_info("%s%s\n", dz_name, dz_version);

Just drop this line, it's not needed and generally just noise.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
