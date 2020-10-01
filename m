Return-Path: <SRS0=49YJ=DI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0604C4727F
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 11:03:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9684B2087D
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2020 11:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQSSlaDJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEei53Pb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9684B2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OhlxlA9I6QqZZ73Yc6IHuzRC5dRTVRSLrBT50TT3hPs=; b=CQSSlaDJCULMm+dOcenJl2pG4
	tgXAGhajWFBDieYGsMIx+tQQik9sTxoArLb+7DfWcZFUu7EwGDVOMjTy+l2hjstuf5kEhqObYzJjV
	zq/ToxDGdvjS4GiaITCtvF9QcN9QLZ2I9juu054fW4meoLD350HPs4dWIfF6ljjFzMIzKt16eWVhR
	eXGswoSx8ffHWhxsqdF5GGTdtJIOPFeglD8Np5EIErU/msIrdybywCmbf6otjLFGRDU/me+s/DSnF
	+a8C7u1KEKlZcJC9YD8smfuh6gqY+LJL0ni4QSBdKFqejma8jH4Jk08eJbEHBtFUk/XdZ3ZCPENP/
	/NjMZ62Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNwMP-00010G-Tb; Thu, 01 Oct 2020 11:02:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNwMN-0000yn-DO; Thu, 01 Oct 2020 11:02:52 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D93AE20B1F;
 Thu,  1 Oct 2020 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601550170;
 bh=xYiMC3INrKF34oEyrsmUUrqjbwI/zSijaQlQHN9HorA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KEei53PbBIIkdzQLDb/7K/52YSbflBQYn3bG/m713eKa8/9nV0fPPDI4yq6H+/fvV
 xVqht4hR38nzz4Qgnh/AAp0mk+5WyFzIOOYfEFPMoUP75ral06RLc43LxHUnNG4hb1
 tZZP4hijlYOR/icBsCoZV1jH7RB2VuKegMZKFfws=
Date: Thu, 1 Oct 2020 12:01:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20201001110150.GA6715@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_070251_513135_5353CF86 
X-CRM114-Status: GOOD (  14.50  )
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
 Julia Lawall <Julia.Lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============4625942014519582742=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4625942014519582742==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 12:33:39PM -0700, Joe Perches wrote:
> On Tue, 2020-09-29 at 12:37 +0100, Mark Brown wrote:

> > Feel free to submit patches to b4.

> Have you tried the existing option to send
> thank you's on a specific ranges of patches?

I am relying on b4 to identify which patches that I've downloaded are in
the pushed branches.  Given that it explicitly lists the patches that
are applied it appears to be doing an OK job here.

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl91tx4ACgkQJNaLcl1U
h9D1IAf/a6Dh+mjW+LjpuCd+hkWCJa8iJTLmYSy9suf32mX9fM1T/gbOLQ1RJtu4
ZQP0A5w52htIbRIWtYHrgtZQGXrq2SIm+peRmnKP0DXly+Fj0/G0zxg4lqxKzXtV
+XpQjLbvcjF6JIV1ok5ScRg5HH8bfLJQvbGBbpmL9pvI+WniF4smB5bQRwd3qWEf
MrBNI79S+kr1Cvjxnya+/TP7O4TtOQzzpB695ejEGvqxlTJQM5GGaZTLNJlBivOz
ygXvOFlrffOajvN1K7URe41xznaDG4+c8pfziFXllSoEGp3yzANBNTtCGEvny0SY
Nx0W3O8/sebfFJPHQ89w2atWG/nVEQ==
=onQ8
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--


--===============4625942014519582742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4625942014519582742==--

