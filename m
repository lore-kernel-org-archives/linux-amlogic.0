Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78915C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F6520675
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bxlv3PXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F6520675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJA8pVJxT4BqCTx9EJV8n4tHbQ+J9/XflpACOerHLZE=; b=Bxlv3PXqeNGqus
	dzwtcTRtaObyT0SN0vKlWgc3ug8vNZJms/YzrOTeJVzDXb0doVsSFCMsSNf6WuJjNPH3R9uwJAVkm
	7j1KhcGXD1IDeuY4TzkgV172rMnOLS3vqksnPc3/NYCSZKB8JRFsUF/7LhopdJsI1yL3ehWiBMOQK
	tIIGfZ0uBM/1HQZHXzQXPskC32UVCB5DIH7Q5Sn+ZYEpOO5P+B8A3AQuZlsF3g/adMaN3tDMnmEzQ
	WdxPXR59/M4xFPmIT5eUpl+sMLmAvtmLr3m1obyEzOV8t3VkZzty23pUpCQisYkDafSQ/y4y1JgGN
	Ds8ukAFXGT8P0E0qh47A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8Po-0004Tw-2Z; Mon, 29 Apr 2019 15:42:00 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8Pm-0002n1-73
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:41:59 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 08:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; d="scan'208";a="295503882"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 08:39:51 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hL8Nh-0001DD-6k; Mon, 29 Apr 2019 18:39:49 +0300
Date: Mon, 29 Apr 2019 18:39:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
Message-ID: <20190429153949.GV9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
 <20190428151848.GO9224@smile.fi.intel.com>
 <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_084158_266203_A6CE4430 
X-CRM114-Status: GOOD (  11.28  )
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

On Mon, Apr 29, 2019 at 04:55:05PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:18, Andy Shevchenko wrote:
> > On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:

> >> -	int ret = 0;
> > 
> > This and Co is a separate change that can be done in its own patch.
> 
> I don't really understand :(
> Do you mean the splitting off the retval part from the rest ?

You do two things here: one of them is removing ret and other relative changes.
This should be split to a separate patch.

> > You may increase readability by introducing temporary variables
> > 
> > 	... mapbase = port->mapbase;
> > 	... mapsize = port->mapsize;
> > 	...
> > 	port->membase = ioremap_nocache(mapbase, mapsize);
> > 	...
> 
> Is that really necessary ? Maybe it's just my personal taste, but I
> don't feel the more more verbose one is really easier to read.

Up to Greg. For me it's harder to read all those port-> in several parameters.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
