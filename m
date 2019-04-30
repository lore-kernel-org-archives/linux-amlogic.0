Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D4EC43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 14:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58CD20652
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 14:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5SryTh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58CD20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qG+HIyIPhmWc4ZEcgXNhNxA9SW6bSvUauwV82aWiWU=; b=Q5SryTh/PGmUZw
	FaSWQ871W4ppgLHICOKhKrRrh7d1+4+d1RxKpouGOk02Nc9CyReFajY2jTKzOasjphRilBMyTg6fy
	B7EmJH3iewz2X74ar0BtEQAlMT0TDnVPflk2FFSuy0dT3MycQcoqE0Sci1CFK3wxXLaQBi+QY7K+Y
	SfJ30nWnfuGdgzcZ2NkL5PZUhdrds/h0AwJM+tqIpJpVFdJ+baajr+TxEcd+L/efG8QTd/i7Vryaq
	Bak4eXvCIBiF8zV5Hq4n6tWT8ACvEyLfYYTyMCcv4rFvRV/mni8EUNH4Og9ElmY9vsWdRvAzQEZ/o
	6w6TqSshLEP1+rZohReQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLTT1-0002MH-Ht; Tue, 30 Apr 2019 14:10:43 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLTSy-0002Hp-9s
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 14:10:42 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 07:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="342158227"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2019 07:10:31 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hLTSn-0006VO-Gw; Tue, 30 Apr 2019 17:10:29 +0300
Date: Tue, 30 Apr 2019 17:10:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
Message-ID: <20190430141029.GK9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-23-git-send-email-info@metux.net>
 <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_071040_444420_60925EE2 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 linuxppc-dev@lists.ozlabs.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 slemieux.tyco@gmail.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux@prisktech.co.nz, matthias.bgg@gmail.com,
 khilman@baylibre.com, linux-serial@vger.kernel.org, sudeep.holla@arm.com,
 sparclinux@vger.kernel.org, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, vz@mleia.com, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Apr 29, 2019 at 05:59:04PM +0200, Christophe Leroy wrote:
> Le 27/04/2019 =E0 14:52, Enrico Weigelt, metux IT consult a =E9crit=A0:
> > Fix checkpatch warnings by using pr_err():
> > =

> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... the=
n dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:109:
> >      +		printk(KERN_ERR
> > =

> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... the=
n dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      #128: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:128:
> >      +		printk(KERN_ERR
> > =

> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... the=
n dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      +           printk(KERN_ERR
> > =

> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... the=
n dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      +           printk(KERN_ERR
> > =

> > Signed-off-by: Enrico Weigelt <info@metux.net>
> =

> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> =

> But is that really worth doing those changes ?
> =

> If we want to do something useful, wouldn't it make more sense to introdu=
ce
> the use of dev_err() in order to identify the faulting device in the mess=
age
> ?

+1 for switching to dev_*().

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
