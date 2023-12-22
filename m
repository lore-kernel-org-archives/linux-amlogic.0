Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F714C41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DP3m1cmgUD9ATKdpCX8PmxHs24PLUl2iL821IXG93U=; b=gIsiRAL/fVu+vYr6eJ8mjiCiR3
	ABVgCDVhvpVTk/9OeM0CtF0s2wPn62reY51i2xWMhEVnqXWLZKXOViyrgb8fzanAL34ffyq4H2hiW
	JzXXkP1hmTI/MK5hsP94nrka4SoP6zurTleQCysZN4GCbQZbIvLY+Gv1aVoIkLQ4ueS6qVdGmS4TO
	2JwUirDIHkdXywz3qBOd7MQam8CIpQwKf/H4M/Dbzu1Y5rYKdI1c8TG/fXpksf1VqOOaBOwHsmVnm
	jU2JGztaeTqCFJIwN9X3LSsqznB1h+Vk2bvV4Ve3Xat0lzpH0Eq/YgC+Q/cwmEkfFil0XlwB8VKAP
	EKRvQZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe6E-005rwF-18;
	Fri, 22 Dec 2023 11:53:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe6C-005rvp-1V
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7F386B82171;
	Fri, 22 Dec 2023 11:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF083C433C9;
	Fri, 22 Dec 2023 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246029;
	bh=NB+xhNYLL2YOdGSpb6W2PV8TAmLE5kyfK0/CSF8eFIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrqUVWwBAexAmLH6SS89GdnnPZVenC6P6AoqYY0UThGRiUAno75Gh6cHuyckYQINa
	 1Jj+4RW1ipA/uzJyVng4YogC9NnCoVqqG87AO2yIjoi25EGrPE06YyXvpPZsycCT5w
	 v9tr41gtXiPbx7purKSLuw/zjsyao1Xxse05sA2kNtAi0Zux31V4aYOZd7LXWispLx
	 X2reeQDUco/vioRoNOs1JgYoRx7gozydCH3INKjBUBvDKW8s6z868oFgaM+SWyVhWb
	 rctVbS2HVc9lLYWRtgpR9MTJU4wdTtBiCNJOdpJt9DBVUNedKKmQTvwqqyzMAgcZzL
	 UK4pucHaUaDuA==
Date: Fri, 22 Dec 2023 11:53:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	lgirdwood@gmail.com, linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
Message-ID: <54905287-855d-47b4-880f-bfb1b8b1f49d@sirena.org.uk>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
 <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
 <jx2vspy4cfuidf3mwmje675igspxdpgrenw5jz35ud5bm65klc@s4ovjad4fusg>
MIME-Version: 1.0
In-Reply-To: <jx2vspy4cfuidf3mwmje675igspxdpgrenw5jz35ud5bm65klc@s4ovjad4fusg>
X-Cookie: Familiarity breeds attempt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035352_657919_D3A7FFA7 
X-CRM114-Status: GOOD (  20.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5383796347493259878=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5383796347493259878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KJDHjVYfXsFaJRDn"
Content-Disposition: inline


--KJDHjVYfXsFaJRDn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:07:41PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Dec 21, 2023 at 09:45:49PM +0000, Mark Brown wrote:

> > > -       voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
> > > +       if (pstate.enabled)
> > > +               voltage =3D pwm_get_relative_duty_cycle(&pstate, duty=
_unit);
> > > +       else if (max_uV_duty < min_uV_duty)
> > > +               voltage =3D max_uV_duty;
> > > +       else
> > > +               voltage =3D min_uV_duty;

> > AFAICT this means that enabling the PWM changes the voltage read back
> > which isn't what we expect (other than a change from 0 to target) and is
> > likely to cause issues.  get_voltage() should not change after an
> > enable(), and indeed I'm unclear how this change works?  I'd expect a
> > change in the init_state() function, possibly one that programs the PWM
> > to reflect the actual hardware state but I'm not 100% confident on that
> > without digging into the PWM API more.

> What is your question here? Looking at pwm_regulator_set_voltage() I
> think this lacks a

> 	pstate.enabled =3D true;

> which might also fix Martin's problem?

That's not really a question, it's a statement - I don't see how the
change works at all and as it stands it introduces a problem with the
behaviour when the regulator is enabled.

--KJDHjVYfXsFaJRDn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFeMcACgkQJNaLcl1U
h9DDmAf+MtgUxQLU77WJx9BvRbmHOIj3BusmZ5Vz4wKLhcxHaZ6kCJ6cqgwBBMv0
HLih1IgKLkKVBYuFGW3v3I2a8KjNglIqo9zDArCmFI16cB7zJ/XB7/oOQoBipnxd
ttQtIshQIlBeLbxFQcdK9iecfoyYw4uxVoDdmCwo4OKvTIGYz8DEY2ahHEZdDl20
BpfrAA9JeECG/IuFn3SbSlrKzJ5uNwnctynsPfTOMVqKh7bD6kK2OpVx7W2huR7G
Gsd8LXK2UGABOa5zc4dC5pe4pG2aqRbwRHoUbHOlC6N1ZF0NNP4cmDxQ8YnJZZG3
sQafS5nyBfCGJlWOmwecR7JkXeEFhg==
=Hl8j
-----END PGP SIGNATURE-----

--KJDHjVYfXsFaJRDn--


--===============5383796347493259878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5383796347493259878==--

