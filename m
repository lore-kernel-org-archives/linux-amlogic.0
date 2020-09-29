Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EC7C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 00:45:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2AB20738
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 00:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M0oBPfb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2AB20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UnMPmnjxvoSadCPJzpXvboFHi4nyZUKP/IiQxnbUXBI=; b=M0oBPfb87eO1vZXVHyL7rybFi
	XdJwb7RzZGNalN+dxanRRqnUcdKalnKHuBYQPEG955XMVnd9k3pgDYPbXOrs/NPTn05r5H9pOmaBe
	Not8A6AtAKaLbOApm4BUY24qPm2Gf+xN3ClAhspxqzzYvtnYGSpXVcPmY1Tthra4lees32eKHLeLF
	94kidd74cv5uuA1Yyze1o3PeYQYu8jjnss74NQSYCblRo5BEEwxRh4a5OpSew6MrT61oenPEADN0c
	UvOWjyBxD8mQpy+5+BNCpXz0AXEKD+RhiLe88arzeEScbq/SqJ9GjcLw45MlT8U9uv7rzaaOyx828
	kx12gt+2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN3lt-0004mu-A6; Tue, 29 Sep 2020 00:45:33 +0000
Received: from smtprelay0254.hostedemail.com ([216.40.44.254]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN3lq-0004mN-Un; Tue, 29 Sep 2020 00:45:31 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 780A9100E7B40;
 Tue, 29 Sep 2020 00:45:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: self77_011759527186
X-Filterd-Recvd-Size: 2723
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Tue, 29 Sep 2020 00:45:25 +0000 (UTC)
Message-ID: <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, Julia Lawall
 <Julia.Lawall@inria.fr>
Date: Mon, 28 Sep 2020 17:45:24 -0700
In-Reply-To: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_204531_042254_FDC74823 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: linux-ide@vger.kernel.org,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-block@vger.kernel.org,
 linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:
> On Sun, 27 Sep 2020 21:12:10 +0200, Julia Lawall wrote:
> > These patches replace commas by semicolons.  This was done using the
> > Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> > 
> > This semantic patch ensures that commas inside for loop headers will not be
> > transformed.  It also doesn't touch macro definitions.
> > 
> > Coccinelle ensures that braces are added as needed when a single-statement
> > branch turns into a multi-statement one.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> 
> Thanks!
> 
> [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
>       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

Hi Mark.

Rather than replying to the 0/n cover letter to a patch
series, can you reply to each of the specific patches in
the patch series you are applying?

Otherwise, it's a bit difficult to figure out which patches
you are applying.

thanks


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
