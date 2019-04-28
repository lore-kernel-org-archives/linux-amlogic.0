Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10426C43219
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B81204FD
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 15:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNkgkSPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B81204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgf7xnORdtsFMPzumJaHLNe8JephMxpDZ6Dfi2esqxM=; b=JNkgkSPbxRGhEZ
	EoxzDFApr3pkOJjdEsrWjBmDajdyXC5YIMIV3ZLBEHEp9LV+d6ZsncqaL3SjuyoaelZzS9KZWdKyB
	5Lh4oNf7ah2D/nwL6AqAkAEEQN0yQx7NHEaZf1C0SRNEFRy+WKEx1SAG+ho1z3MTTHHSioz0Xi6jS
	nCR17JNP+D0EhQsZfS0v1eJP1jiKkBzCC+yIslHwFpCwpe0U5gnuH05JTa6uI6VTNZXTKxezi9NUz
	FBJbaOpr7kyiZ+M7+gIo00P58hIRj1ctYhGEbvSj1gVZKc8c5aWdggHQq7qJnV/eHXxksfTilEv7R
	O2J5MZie7qtRenA6Xviw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKlZz-0003vn-KR; Sun, 28 Apr 2019 15:18:59 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKlZx-0003vI-0Y
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 15:18:58 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 08:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,406,1549958400"; d="scan'208";a="341531946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2019 08:18:51 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hKlZo-0005Ys-RD; Sun, 28 Apr 2019 18:18:48 +0300
Date: Sun, 28 Apr 2019 18:18:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
Message-ID: <20190428151848.GO9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556369542-13247-37-git-send-email-info@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_081857_062659_3A1016EB 
X-CRM114-Status: GOOD (  14.50  )
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

On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:
> The io resource size is currently recomputed when it's needed but this
> actually needs to be done once (or drivers could specify fixed values)

io -> IO

> 
> Simplify that by doing this computation only once and storing the result
> into the mapsize field. serial8250_register_8250_port() is now called
> only once on driver init, the previous call sites now just fetch the
> value from the mapsize field.

Do I understand correctly that this has no side effects?

Which hardware did you test this on?

> @@ -979,6 +979,9 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>  	if (up->port.uartclk == 0)
>  		return -EINVAL;
>  
> +	/* compute the mapsize in case the driver didn't specify one */
> +	up->mapsize = serial8250_port_size(up);

I don't know all quirks in 8250 drivers by heart, though can you guarantee that
at this point the device reports correct IO resource size? (If I'm not mistaken
some broken hardware needs some magic to be done before card can be properly
handled)

> -	unsigned int size = serial8250_port_size(up);
>  	struct uart_port *port = &up->port;

> -	int ret = 0;

This and Co is a separate change that can be done in its own patch.

> +			port->membase = ioremap_nocache(port->mapbase,
> +							port->mapsize);

You may increase readability by introducing temporary variables

	... mapbase = port->mapbase;
	... mapsize = port->mapsize;
	...
	port->membase = ioremap_nocache(mapbase, mapsize);
	...

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
