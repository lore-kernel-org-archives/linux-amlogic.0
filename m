Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DC5C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 16:53:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95AC207F7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 16:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBVfrW8y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBC/IzIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A95AC207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9oaMwzlR1oXFwaT6P87Gu3soqzVGJiKWIE+6WPhzrxs=; b=XBVfrW8ygCjAkmiFxsmorgljL
	AfJmJ3qx0vU72v5A6DDD/SIGpAxmxTOjQTerdIo9vBlQPEYIzTYEFBHDmehAvRSGQQXGt2KYZXHDK
	aqZ8vEFMeQU2LaeCwnCzm0ZbsepheOuWb794/NWLKQEXMb/b0F9W8lZqJX42rxx2AVlXPBF3Uu2Lf
	lZM/EPe4awnejZtTfPVQX8jJZREKTmnz1bFhu8G2Ys8WyuyzbMVJN2L31zUJHo6d8OeXuBYV9Jc2H
	Ix/UxxRGgvxwXUICRpUKYrmSCQUp0OPB7n/D8UctmsUEWbKxz+ImN0AHYAYi068PQWl6AjFXZTO7e
	UUUsBJipQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPTje-0002En-2Z; Mon, 05 Oct 2020 16:53:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPTjb-0002E0-0T; Mon, 05 Oct 2020 16:53:11 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BDA1207BC;
 Mon,  5 Oct 2020 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601916790;
 bh=p/E99tTjql4QstxaT4SSl5drfyNj4h+kQn/1L+FU6Hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gBC/IzIeywxmI9gsb/JTsx+zOOUJIooFw3wfYC06TBiHzICVtnlgNaAv/yO1EfA51
 zVseZLj5T0M70hmLa6qq17YAe111X+Q9rT1NlLPW8KVTi2SkXaQsGts5rIE+F43U3z
 nybuOkwnpLc2tf4yEu29xxvUOBIsDUDyDKfTSVTQ=
Date: Mon, 5 Oct 2020 17:52:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20201005165206.GA2440@sirena.org.uk>
References: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
 <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
 <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
X-Cookie: God is real, unless declared integer.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_125311_159027_CC63676D 
X-CRM114-Status: GOOD (  20.49  )
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
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, tools@linux.kernel.org
Content-Type: multipart/mixed; boundary="===============8944237239650901500=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8944237239650901500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2020 at 12:43:13PM -0700, Joe Perches wrote:
> On Sat, 2020-10-03 at 15:31 -0400, Konstantin Ryabitsev wrote:

> > I'm worried that this can get unwieldy for series of 50 patches where 4=
9=20
> > got applied. Would the following be better:

=2E..

> > A subset of these patches was applied to
> >=20
> >   https://...
> >=20
> > Thanks!
> >=20
> > [5/18] regmap: debugfs:
> >        commit:

It's definitely an improvement but TBH I'm not sure how much it's going
to help those struggling to parse the current messages.

> > I think this is a better solution than potentially flooding everyone=20
> > with 49 emails.

I would tend to prefer cutting down on mail volume but I don't think
there's any way to keep everyone happy with this stuff.

> I think it would be better to reply individually as
> the likelihood that the maintainer skips just a few
> patches of a large series is relatively low.

It's not at all unusual for driver updates to both add new DT bindings
(either for entirely new drivers or new properties/compatibles for
existing drivers) and also have DTS file updates using those bindings,
these go via separate trees.

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97TzUACgkQJNaLcl1U
h9DI9Qf/dhOghwYGEqexRQ644ACI4w9j7rH7Z4qsTYl+rdj06q5wrcOFnyypjB/j
N/Qx3llsTbG0UagMLyGeuFi5bzhxALnrvmrbv8cBPI0/3jS2D7u22cD5m6toS+Tp
f08tgo7VkjfkB3QCZn9A7XGAPq3bEvoaCvFalxqGt0FPUw5kVGrboVa1dgJCzRL/
CtWXDQfG9vy5ZVs0cY+s+O9yvAbrZJyMPaKkeoa7dwnqzOQz1Ga4ADtUZsUWyieK
wuCO/HNGdf77CmSbOuG6BMrWi5SGoEtRmVO+w5NmYO1yOfnooSih3uWDR4H01xVg
3zFgbOHRZMIwAEzTfTqRA4vzPMXRQQ==
=wwYC
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--


--===============8944237239650901500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8944237239650901500==--

