Return-Path: <SRS0=yipG=TB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7ADC43219
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 May 2019 02:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBCF421734
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 May 2019 02:20:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Viu2Nm2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBCF421734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-mips.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwVPnXorV6yYId9HlwmBdSlTFyga5sZHLXCSJft32X8=; b=Viu2Nm2/hOHJDi
	jm37Ms6NvgpbnDOopwPDqR+4Jhoxdsv3yqdyVP/5rT4NwgehmNWcGS0VIWgYWjbWeKEhG9HGJQf2p
	ev6EqYN216kcET+BqbZ0t5Kvy0BrT9WRPa6Gg+bNh2D07KJ7V+smRYTYK8UlyQY/Un6wdMH2ISuoA
	n3X+nIOL1A+pAExZ7ZV0nGhxTOdBnMa4Bnp4F4yBNpPeyDvoPPWHqGNtT7Me+OJL1vMnVw0/fI3HO
	US04+D/mpq5mT9xnG6mMwLoDC8vomcuyii3cYQSJT1B1BtLwzfGHoox1DgmKo5qbcNBNGmvLKlep3
	LpE8j5IE8odRc39/JH7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLerX-0000Fd-5l; Wed, 01 May 2019 02:20:47 +0000
Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLerU-0000FJ-8G
 for linux-amlogic@lists.infradead.org; Wed, 01 May 2019 02:20:46 +0000
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
 with ESMTP id S23990394AbfEACUhiM2bj (ORCPT
 <rfc822;linux-amlogic@lists.infradead.org>);
 Wed, 1 May 2019 04:20:37 +0200
Date: Wed, 1 May 2019 03:20:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead
 of printk()
In-Reply-To: <20190429131224.GA27385@kroah.com>
Message-ID: <alpine.LFD.2.21.1905010255070.30973@eddie.linux-mips.org>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427133117.GC11368@kroah.com>
 <bae3f23b-8823-f089-c40e-024ba225555f@metux.net>
 <20190429131224.GA27385@kroah.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_192044_302464_2F3DAB28 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, linux-serial@vger.kernel.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 29 Apr 2019, Greg KH wrote:

> > >>  drivers/tty/serial/dz.c | 8 ++++----
> > > 
> > > Do you have this hardware to test any of these changes with?
> > 
> > Unfortunately not :(
> 
> Then I can take the "basic" types of patches for the driver (like this
> one), but not any others, sorry.

 I can verify changes to dz.c, sb1250-duart.c and zs.c with real hardware, 
but regrettably not right away: the hardware is in a remote location and 
while I have it wired for remote operation unfortunately its connectivity 
has been cut off by an unfriendly ISP.

 I'm not sure if all the changes make sense though: if there is a compiler 
warning or a usability issue, then a patch is surely welcome, otherwise: 
"If it ain't broke, don't fix it".

  Maciej

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
