Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91A3C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 13:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DE320652
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 13:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ga8VLkOZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85DE320652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xcVO4kDojXi70QJzwQ/8eIxJJHY2tdRFhi4YR5gnW0=; b=Ga8VLkOZTemGcj
	uHlsl40VJmaruD/To1jR8hIF/s/RkxB67XyMd/ZyQ2ta8uILjy58Wn/eV4vgm2nMFm7rgqHUzjJGM
	A91awAuQgvlRa9SvrKY8ZDaK9HWjicIAOcSrwRfQvEF87XNDya1FE4ffoyp72ifshFJo6Dh+6c9bG
	Uqi1pI81CAgPHY7mh4TdyQwCd24/vKyVkcoZoEnCyvT0VcA08sdASsEp00MO+jLM3MyjLvQHoI5yT
	IwGZ426EzqHjSw2kGyuFchsOd5okjSjgY60J27BmhfYHbWctnjJiVsesdAtEpXy+R/257ZJ9A8HTK
	Mb6QW0fy4zpPzyA/8tYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL6Ku-0003zN-Az; Mon, 29 Apr 2019 13:28:48 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL6Kr-0003yq-Dk
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 13:28:46 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 06:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="341805320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2019 06:28:39 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hL6Kj-0008Iz-6u; Mon, 29 Apr 2019 16:28:37 +0300
Date: Mon, 29 Apr 2019 16:28:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Message-ID: <20190429132837.GF9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <20190428153905.GR9224@smile.fi.intel.com>
 <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_062845_475757_958BE2E5 
X-CRM114-Status: GOOD (  26.31  )
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
Cc: sparclinux@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Apr 29, 2019 at 12:12:35PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:39, Andy Shevchenko wrote:

> seems I've forgot to add "RFC:" in the subject - I'm not entirely happy
> w/ that patch myself, just want to hear your oppinions.
> 
> Moreover, the size argument seems wrong here.

Something went wrong with quoting style in your reply.

> hmm, I'm actually not sure yet, what the correct size really would be,
> where the value actually comes from. Just assumed that it would be the
> whole area that the BAR tells. But now I recognized that I'd need to
> substract 'offset' here.

It will be still wrong. The driver in question defines resource window based on
several parameters. So, this should be supplied with a real understanding of
all variety of hardware the certain driver serves for.

> Rethinking it further, we'd probably could deduce the UPIO_* from the
> struct resource, too.
> 
> >> +		uart_memres_set_start_len(>> +			&port,>> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);> > Please,
> avoid such splitting, first parameter is quite fit above line.
> 
> Ok. My intention was having both parameters starting at the same line,
> but then the second line would get too long again. > ...and here, and
> maybe in other places you split the assignments to the members> in two
> part. Better to call your function before or after these blocks of>
> assignments.
> the reason what I've just replaced the exactly the assignments, trying
> not to touch too much ;-)
> I'll have a closer look on what can be moved w/o side effects.

Just try to avoid

	foo(
		bar, ...

-like splitting.

> >> +static inline void uart_memres_set_res(struct uart_port *port,
> > 
> > Perhaps better name can be found.
> > Especially taking into account that it handles IO / MMIO here.
> 
> hmm, lacking creativity here ;-)
> any suggestions ?

No immediate suggestions.

uart_set_io_resource()
uart_clear_io_resource()

at least sounds more plausible to me.

> >> +				       struct resource *res)
> >> +{
> >> +	if (!res) {
> > 
> > It should return an error in such case.
> 
> It's not an error, but desired behaviour: NULL resource
> clears the value.

Oh, then why it's in this function, which is *setter* according to its name,
at all?

> 
> >> +		port->mapsize = 0;
> >> +		port->mapbase = 0;
> >> +		port->iobase = 0;
> >> +		return;
> >> +	}
> >> +
> >> +	if (resource_type(res) == IORESOURCE_IO) {
> >> +		port->iotype = UPIO_PORT;
> >> +		port->iobase = resource->start;
> >> +		return;
> >> +	}
> >> +
> >> +	uart->mapbase = res->start;
> >> +	uart->mapsize = resource_size(res);
> > 
> >> +	uart->iotype  = UPIO_MEM;
> > 
> > Only one type? Why type is even set here?
> 
> It's the default case. The special cases (eg. UPIO_MEM32) need to be
> set explicitly, after that call.

Which is weird.

> Not really nice, but haven't found a better solution yet.

Just simple not touching it?

> I don't like
> the idea of passing an UPIO_* parameter to the function, most callers
> should not care, if they don't really need to.

They do care. The driver on its own knows better than any generic code what
type of hardware it serves to.

> >> + */
> > 
> >> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> >> +					     resource_size_t start,
> >> +					     resource_size_t len)
> > 
> > The comment doesn't tell why this is needed when we have one for struct
> > resource.
> 
> Renamed it to uart_memres_set_mmio_range().

See also above about naming patterns.

> 
> This helper is meant for drivers that don't work w/ struct resource,
> or explicitly set their own len.

Then why it's not mentioned in the description of the function?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
