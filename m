Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6441C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:38:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEE92076A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 12:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xyC6Bu4e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWmjA8UF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEE92076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=92rz6QaP6FlSX1ciCCAGhIwc2B4Uv4z8rLiL1aFcybI=; b=xyC6Bu4evA5whRNLEGiTKrFgx
	1E9IV/XDU5DtUgc8HatBE6lulV4r/CoCaAsnCKPSfxnQnIhzlG4EqvxpeCTORcE9e7oUMaP6EQD17
	fa1GNyehzAJGaB1Vwyk4+xzCLpUk25NfV+QwRzMGZJOpLwzd8fdO+qaOSl1SxikPL4ehRajtM8zoQ
	hM6OcwQx160BgbVb5SDS2qOS9BbuP5e5Xaih4SV6QOSWsAFnVecwEvpJERexT2TwXJkqYaeii/sHb
	+jJ/GhFBMrqx4qRhBRHBJz9r3mc2h0n91DCFhuzz3LipB5CCxlaOr0kBlIVkVXwa9tEWRrpwXWqPq
	kVItyga1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEtv-0005ym-RT; Tue, 29 Sep 2020 12:38:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEtt-0005xs-QQ; Tue, 29 Sep 2020 12:38:34 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74C452075F;
 Tue, 29 Sep 2020 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601383113;
 bh=1agHRxXJKhB2RD26+gZ4x8RWV4EKhITxeEYpiuBbO3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWmjA8UFdsFWnaqLQDJfMWuIbOP31zKYrwaHNjRkhgkkbyol6UJQNOL2g65mEmM7z
 r3wh0aEAIXzhRSusZ2U0MLVqmtsLu8t/8GK56UP3hceV/6s4ECE+CCU/O8tZzN6Rvf
 K42OX9LCLHmQUHnGEYx+BhHjmTGzPz+rvHs8rKnU=
Date: Tue, 29 Sep 2020 13:37:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20200929123734.GC4799@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
X-Cookie: I left my WALLET in the BATHROOM!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_083833_944071_7FA1ED22 
X-CRM114-Status: GOOD (  19.07  )
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
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>,
 openipmi-developer@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============0528571307293899714=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0528571307293899714==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Mark Brown wrote:

> > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > being sent as serieses in the first place, there's no dependencies or
> > interactions between the patches.

> It was suggested (a long time ago, not with respect to this patch in
> particular) that sending such patches in a series is useful because it
> allows people who are not interested in the 18 patches to skip over them
> more easily.  So there are two conflicting needs...

I'm not convinced that there are huge numbers of people reading LKML as
a list TBH, and if you are sending things as a series then the way
you're doing it at the minute where you don't CC the cover letter to
people makes things confusing as it's unclear if there are dependencies
to worry about.

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9zKo0ACgkQJNaLcl1U
h9BJ9wf4mEIT3UglAONn9EPv4I6DolXuWfJHGs52mxyy1JeuXGyjVMYRuKfw8ZE5
TbgRR0pAg1aZUsqI/T/PWSVDmUCNzL6QM4RbG8ZUSFw47v509iCABBidbK+PLnwo
y5A+IrAPTDVviLFNJm2SfFN3XEgpsGmOqhyuhKiGNeLOryaPNvOmiRF6cwND7Vbq
97kDmafX0KgHVsmK/br50D/XJpOJSR9T2hB5hjQRoVl44a6aV0eZWwDDZyH57kat
KO59OyGGHDyWrsF9oHWajymCB1kMZZ4YLiwCyjx98g74uRLSiSaGwrsr4IeXGn66
Mmpn90mfVDnP/Es10vbKsC+JZShG
=qH7V
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--


--===============0528571307293899714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0528571307293899714==--

