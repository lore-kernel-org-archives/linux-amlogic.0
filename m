Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F4CC4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103422064E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVjrSMwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103422064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QgNAa+3J4eQiiJox8dE2pSBr51U9VfRbWYcI9oi4Xeo=; b=nVjrSMwtu69ovWy8EtvAJIiwk
	FSnWg3tgSPPYZnOUMB488jFyvlPpW5GSJxTQPEntsKGupcidiqcVS3NLfeRABFo9iJZFc/1++28g5
	Eh9Ks7hREpxijusZBVu5dLH9QR7BTZwmw/NjFVOeZg/1pkzFVPQ9RTPi8ZIFK+mR3O6e+tcusdS5U
	jDaUYF63rxlSMTfek4C4+58ACd8fum/xUuAGqJUJ6A3NochP9IQh9UtsQLWiDXcmoLCvB2WmIgryX
	aLKqBhU9Dd7QcSUCmlqLuo57+pzcji9X59ATp+Xl+JCJKVjrF+hXfZ51rpw+/OYsASD0xcOD6Z/5k
	cLT5sb7aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEzj-0007j3-IZ; Tue, 29 Sep 2020 12:44:35 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEzf-0007hU-O4; Tue, 29 Sep 2020 12:44:32 +0000
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; d="scan'208";a="470059088"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 14:44:29 +0200
Date: Tue, 29 Sep 2020 14:44:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
In-Reply-To: <20200929123734.GC4799@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2009291441530.2808@hadrien>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
 <20200929123734.GC4799@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_084431_951181_8F798F38 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On Tue, 29 Sep 2020, Mark Brown wrote:

> On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> > On Tue, 29 Sep 2020, Mark Brown wrote:
>
> > > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > > being sent as serieses in the first place, there's no dependencies or
> > > interactions between the patches.
>
> > It was suggested (a long time ago, not with respect to this patch in
> > particular) that sending such patches in a series is useful because it
> > allows people who are not interested in the 18 patches to skip over them
> > more easily.  So there are two conflicting needs...
>
> I'm not convinced that there are huge numbers of people reading LKML as
> a list TBH, and if you are sending things as a series then the way
> you're doing it at the minute where you don't CC the cover letter to
> people makes things confusing as it's unclear if there are dependencies
> to worry about.

The cover letter goes to all of the specific mailing lists affected by the
patch, or if there is no list, then to at least one developer.  Sending
the cover letter to everyone would lead to too many recipients for some
lists.

If there is a preference for the rest of these patches to be sent one by
one, then that is possible.

julia

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
