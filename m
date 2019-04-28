Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DE7C43218
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C15D204FD
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kj5ubD7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C15D204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQLSqAP/8+vHioGlfA3YeuV5hFSUgwoStrWuviv5Sy4=; b=Kj5ubD7T2m61q9
	yZvxcs/35GpGF6acWQbBGKV7GtLxWVbE+a/OrGESdJts/uEvMVDUiOApVNP5y8VPocl051xc91bn6
	NkmIsA1BNxE6+LPaWveyJT5usmcjGAR++4UXss5ImVNTR3yygnopQiBt88hN8HvLiCk+EmZUpJmQN
	u/JTps2j5hnqYvxClhFmQ2oX9w2HfHUhQqmr4kxJpuW/o6j1qCFO9QwjydxnBFTRPAiB7I/n1YwVM
	rr3NZTY+7OS5lpTTzmOZiSuctrUmvsxrNUDdNAXVWYGfnVhBzqmTvfRVlm6Cad9lhFBOMV84623cV
	2mY62cr5bW3inKByILBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKlcA-0005IH-IQ; Sun, 28 Apr 2019 15:21:14 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKlc7-0005Hk-Gx
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 15:21:13 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 08:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,406,1549958400"; d="scan'208";a="227485600"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga001.jf.intel.com with ESMTP; 28 Apr 2019 08:21:05 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hKlbz-0005Zn-6W; Sun, 28 Apr 2019 18:21:03 +0300
Date: Sun, 28 Apr 2019 18:21:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
Message-ID: <20190428152103.GP9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556369542-13247-38-git-send-email-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_082112_106370_411F5136 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Apr 27, 2019 at 02:52:18PM +0200, Enrico Weigelt, metux IT consult wrote:
> Simpily io resource size computation by setting mapsize field.
> 
> Some of the special cases handled by serial8250_port_size() can be
> simplified by putting this data to corresponding platform data
> or probe function.


> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -105,6 +105,7 @@ struct serial8250_config {
>  
>  #define SERIAL8250_PORT(_base, _irq) SERIAL8250_PORT_FLAGS(_base, _irq, 0)
>  

> +#define SERIAL_RT2880_IOSIZE	0x100

And why this is in the header file and not in corresponding C one?

> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index d09af4c..51d6076 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2833,11 +2833,7 @@ unsigned int serial8250_port_size(struct uart_8250_port *pt)
>  {
>  	if (pt->port.mapsize)
>  		return pt->port.mapsize;
> -	if (pt->port.iotype == UPIO_AU) {
> -		if (pt->port.type == PORT_RT2880)
> -			return 0x100;
> -		return 0x1000;
> -	}
> +
>  	if (is_omap1_8250(pt))
>  		return 0x16 << pt->port.regshift;

This is good. We definitely need to get rid of custom stuff in generic
8250_port, etc.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
