Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C97C41535
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9siGXP9Hrk9PYC7kqK1We1O2BQUwkfua5wgnRdouBQw=; b=2VRVcAv3+01+vkd1/OB1/49OtH
	HGDAHzSNklPCShas2iIb7Czj9H/AgOYdwPcuaRzsCF6pESvIk0yVb+r+/4EC0gtIJIG9Cu3yiL5XR
	rc/HgBqEetA155t2mMDzoOrBGcJp4F6koeoCR+VYlrpkybHHkmEl7YHX3DonY+6SFlrw1kQy+IjFV
	OZHGsWz/P0FGz0hI6zquK8FDnuSstYiKaVXhv99+IjR6rpb41Cc85HG10KjaOePZAaVn6nMTSpabG
	yAnulautJULzbWrIVTo2SF3brSF2HzCIK8H4jrMvzQz+EN4VTozqg9Y609ENMeouFOPfWE8OeLPhA
	XLLzOJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe7N-005s4J-1p;
	Fri, 22 Dec 2023 11:55:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe7K-005s3U-2d
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98898CE2106;
	Fri, 22 Dec 2023 11:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A5DC433C8;
	Fri, 22 Dec 2023 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246099;
	bh=MniMhNCozgeNpLkvpDvRts/bFndN88of1ENcKV/hfR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGeuGLoBSuxU+iLQjNorjscPkD3nPNqumthsvoP3JjJc94TSLtt6IZY81T0QKwxww
	 80gEpDrawf6QijZgYmhEo/Md+SRl3kDWm+jU8o34rnCJrMa/UBoRYLfRdc7R5aP3Va
	 zDMbgUOS/09sPm8tfPGmJXAW47Rfv+8QoFmzIN+gapbJrEa/t1s3inRfyAfw4PzImW
	 wWkPlmmtbhucDYGjE5tuaLh8kwI9lyU33TsRwMQoWJfKuxnNce6O13Crfq6vGKe3J2
	 uaqaEUI9SCjeyKARlkesdwr3SICCkKOpCEEWNnkU6CLhEahWrg1KBVvG3cFY7uwinS
	 IPom6sp5voG8w==
Date: Fri, 22 Dec 2023 11:54:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: lgirdwood@gmail.com,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
Message-ID: <e32e0ccd-0e7c-4d74-aa2c-0b8155d97698@sirena.org.uk>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
 <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
 <CAFBinCDJnVzE2sMwu52MQGTKW7dtCuUoj63ZZHhJPJO0+dZDkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCDJnVzE2sMwu52MQGTKW7dtCuUoj63ZZHhJPJO0+dZDkg@mail.gmail.com>
X-Cookie: Familiarity breeds attempt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035503_035781_9F848B97 
X-CRM114-Status: GOOD (  16.08  )
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
Content-Type: multipart/mixed; boundary="===============3457666907821563427=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3457666907821563427==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ege4RUChGIoDBWw+"
Content-Disposition: inline


--ege4RUChGIoDBWw+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:42:29PM +0100, Martin Blumenstingl wrote:
> On Thu, Dec 21, 2023 at 10:45=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > Hrm.  Perhaps the regulator should figure out that it's on with a
> > minimum voltage of 1.14V in this case - AIUI that broadly corresponds to
> > your change except for the fact that it doesn't recognise that there's
> > actually an output in this case since it assumes that disabling the PWM
> > disables the output which isn't the case with this hardware.  We'd need
> > to know more about the PWM in that case though I think.

> If you have any specific questions then feel free to ask.
> Generally it's a very simple PWM controller:
> - when disabled the output is LOW
> - when enabled the output matches the requested period and duty cycle
> as best as possible (depending on the available input clocks)

We would need to know more at runtime to do the correct thing I think.

--ege4RUChGIoDBWw+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFeQ0ACgkQJNaLcl1U
h9BNywgAgAfg176tAU+aqJ+Jp2hFmi4zZ/c3euJEMcr+4MM60eFhd6+i3b9uZsja
ZgEGxvrF4wFzku+4Kkv2Qip7VS5XaAIc/ewN+vzteFnL2ExWwx3FjIi8vgtTi/5Q
FfOHVvo2US7qt+pfwrCfEMMv4vgWfHfz557RYnnkiiY08sVaOprSFkMtFuxVLNWo
YrTHjUUzQv/ComapN/ZSVCjVY96cs4K/0ZiRqys6Xauh2sJBvlOtEvSPPlVxh30S
ErxN1OwlflViYeqHSoNYIR1lzOEpKanAGRx6FGDQaOsK4ES7JEShiaw0gUYL+8cE
TiL63LyYDuOhE2DJuWaetMBvLGo1qg==
=vyyB
-----END PGP SIGNATURE-----

--ege4RUChGIoDBWw+--


--===============3457666907821563427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3457666907821563427==--

