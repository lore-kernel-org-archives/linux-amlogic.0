Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87E8C4727F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801BB208B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DB0mqg5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801BB208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oBybPCFqt/3qZhrOHhD5F4SX/6gC8i48xDY7W5lP13g=; b=DB0mqg5RMSQiWF4WKVwCgLNQh
	eUZByNdUIbeXEZbDp5T1Hs4CpnmcLCqpCnS8oOLLGnKtwxP9TP7pXnu78gKvMP2GUu2PB5Yu/GQXs
	vtGwWyw3H1RNIr/CltyZ8zUNsHwRVj+5SLoU5C4lU7yR70ctx/7usgNIGtt/asfnecQVVkt1lcGVA
	QaW3uWVnmerHLUPhVkMpKnWiQhYufOB7GIy8lhGRP2jS56LvGuOxVixpWCpz3jLnA3iChNkXMEH6j
	Tn0lV2zHN+J9Jy/WoRUdxBlIZGwM+MZMehgDH/BAE7Y7nDcOjKI6KF5+777CKpTBfM7uUug3kwmH3
	sma6Zdu2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNF2d-0000NC-Cl; Tue, 29 Sep 2020 12:47:35 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNF2a-0000Lj-7c; Tue, 29 Sep 2020 12:47:33 +0000
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; d="scan'208";a="470060117"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 14:47:29 +0200
Date: Tue, 29 Sep 2020 14:47:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
In-Reply-To: <20200929124108.GY4282@kadam>
Message-ID: <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084732_462087_21BE33D1 
X-CRM114-Status: GOOD (  15.00  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On Tue, 29 Sep 2020, Dan Carpenter wrote:

> On Tue, Sep 29, 2020 at 02:20:00PM +0200, Ard Biesheuvel wrote:
> > On Sun, 27 Sep 2020 at 21:56, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> > >
> > > These patches replace commas by semicolons.
> >
> >
> > Why?
> >
>
> In the best case, these commas are just uninitentional mess, like typing
> an extra space character or something.  I've looked at them before and
> one case I see where they are introduced is when people convert a
> struct initializer to code.
>
> -	struct foo {
> -		.a = 1,
> -		.b = 2,
>  		...
> +	foo.a = 1,
> +	foo.b = 2,
>
> The times where commas are used deliberately to replace curly braces are
> just evil.  Either way the code is cleaner with semi-colons.

I also found exaamples like the following to be particularly unforunate:

                                fprintf(stderr,
                                        "page_nr %lu wrong count %Lu %Lu\n",
                                       page_nr, count,
                                       count_verify[page_nr]), exit(1);

The exit is very hard to see, unless you know to look for it.

julia

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
