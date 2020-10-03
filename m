Return-Path: <SRS0=e5Du=DL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C602C4363C
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:40:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7A9206DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUSqneeP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hkLBIu63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7A9206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CmyvnhY0lEpl53eXwoljCs2+bLcB+m/q31if31gUcRw=; b=FUSqneeP0eAvoCdIJgTya32hS
	qHsHEPIX6MUWRNmc6EMBdjw1I89gaNL4OVF6caNo+Vkn9lYp8uDhk3MMB2pDs+FjGUvHG19WPZOdP
	t1tbwH4nxDGOc+mAMv2AnTebJpC5TZ97s3hVaENcJ7/97ngHegGtnoF7ISBMk/aLExj07jGGN3Aki
	Kd/T9OMPdiEFZcQNqzfyJPyw3IafJRY+K5ANHYxXw/3QoKfd2cpI1BT9MYXaxYVi71Lp5M2X3/yqj
	5O21hUOFbBVK2A6+2vJcfikYqYPo/y6i3LJDyxATJrc038mWcvrVsmV+MxwciAcsAl7GYUraUdSB3
	sqOBlK5rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvp1-0003Jo-Bx; Sun, 04 Oct 2020 04:40:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvoz-0003JR-Vv; Sun, 04 Oct 2020 04:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=H2Mp3pj3F/szUe8WvqGuzUD/xQ1Sk3qtd6XZU+PhloU=; b=hkLBIu633G2wsHK9ZVtD6FPuUh
 OZjOX1Oq4eepZOQjakoPEPeCaMC8HzjsA1y9cXrKYScEQUcV/ojJSuTu4vEXbLlWlkjw/7n8bSBGp
 EdSsW/bAefid8oyaqQjAfnSu3hIbNKRsDIa1sMphLXG2+/QyxrT+KFWnQ9wwkeWRdTp2FT6DkDx7W
 6c5wMtnYzC+UQtlp8o1kCvVGD92KmvtxynhB3FHKmS9C4TkALjZlBm8rAkI7OcT67U3bUbis6IvFo
 GwP8q7YRQMkD1i3+u7b6zCdh5hYZkXKXCEHnsFmOEx7FGdU9tYTN9lvL2TLHnQceGq3WbMQfkE+Ge
 Rzsf/aRA==;
Received: from smtprelay0250.hostedemail.com ([216.40.44.250]
 helo=smtprelay.hostedemail.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOnRD-0003Vh-K7; Sat, 03 Oct 2020 19:43:27 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 91E911DED;
 Sat,  3 Oct 2020 19:43:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: loss06_3d0c09b271af
X-Filterd-Recvd-Size: 4162
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Oct 2020 19:43:15 +0000 (UTC)
Message-ID: <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Julia Lawall
 <julia.lawall@inria.fr>
Date: Sat, 03 Oct 2020 12:43:13 -0700
In-Reply-To: <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
 <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_204324_300385_816E6CDC 
X-CRM114-Status: GOOD (  27.95  )
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
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 tools@linux.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2020-10-03 at 15:31 -0400, Konstantin Ryabitsev wrote:
> On Sat, Oct 03, 2020 at 09:18:51PM +0200, Julia Lawall wrote:
> > > > There seems to be some mismatch between b4's use of the
> > > > cover letter to a patch series and what maintainers that
> > > > apply a subset of the patches in the patch series.
> > > > 
> > > > The merge description shows the entire patch series as
> > > > applied, but the actual merge is only a subset of the
> > > > series.
> > > > 
> > > > Can this be improved in b4?
> > > 
> > > So, the following logic should be applied:
> > > 
> > > - if the entire series was applied, reply to 0/n
> > > - if a subset only is applied, reply to each n/n of the patch that was
> > >   cherry-picked out of the series
> > > 
> > > Is that an accurate summary?
> > 
> > That sounds good.
> 
> I'm worried that this can get unwieldy for series of 50 patches where 49 
> got applied. Would the following be better:
> 
> -----
> From: ...
> To: ...
> Subject: Re: [PATCH 00/18] use semicolons...
> 
> On Sun...
> > These patches...
> > 
> > [...]
> 
> A subset of these patches was applied to
> 
>   https://...
> 
> Thanks!
> 
> [5/18] regmap: debugfs:
>        commit:
> 
> (etc)
> -----
> 
> In other words, we:
> 
> - specifically say that it's a subset
> - instead of just enumerating the number of patches that were applied, 
>   as is currently the case ([1/1]) we list the exact numbers out of the 
>   posted series (e.g. [5/18])
> 
> I think this is a better solution than potentially flooding everyone 
> with 49 emails.

I think it would be better to reply individually as
the likelihood that the maintainer skips just a few
patches of a large series is relatively low.

It's more likely for a treewide or multi-subsystem
patch set for a maintainer to apply just a single one
or a selected few of the patches and individual
replies make it much easier to determine which ones
were applied.

thanks, Joe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
