Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5E2C35274
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPXl2LyRIcMTJODf717vhOzP8HE0vteutfrRFQcFH8o=; b=DPuVQcI6jYQkSy5uhOZrs03t8y
	GKls3eBNlECLk+3C9Qv5+xLOrjo7w9VlgBDy8hs3jZRMnXYYvH1lFV50L7ukeszlZ2KLKkQ/u5fN+
	XARSSmRifzJYfo6KQbM5/ovyAlsCmuJKvY+Iq3Okl8W7Wvrm51Fdp9bl6MS+3L7bfftGeRF2NCngZ
	Sg0B2rjajUT0aBSXol0dcBL0st2H5T6zsYoLvF9gSGqVxtW2DcYolVTVnRN8voh+1mrQe4F/vVjyT
	wvrmLKuEWrhrOvAHwhoUbZBUPUqAGvM33ylFxUH8gmhmEl4JjEx7qQWv6ltOwYTxzw2Svg/0YCgvT
	HADswqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQrh-004EUk-2E;
	Thu, 21 Dec 2023 21:46:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQrd-004EUC-2Q
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 21:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4EF42CE210E;
	Thu, 21 Dec 2023 21:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B07CC433C7;
	Thu, 21 Dec 2023 21:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703195154;
	bh=83bBQ6XdYV+b245TrPV5X70W705tvEUmPr+27VTkDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADBE342CEuehovJUfEtzqzj2OyhTetXi14tPpYxDO7AM4igyIOHb/nWI1Awj8kXnf
	 RbRsHBS0HBFrXWBG4KSmId++/nhUkEecE0B/2iGFVCvHr/bThsC0LVmX9F2Rq2Lo0A
	 R8qYWqdHH/a0raPrMw5Z/G4W2SS9zOGuYzbvbxpBa/wgLh9lyR6ZelCDgb5SAKnfNP
	 riEaGwoEoQbXleP/NdapGbXap4qjV0BV7UfDepGKXxsgKmRpYOesBTS43SF99Ll/JC
	 5wmoXCnfaTab4MPo44Gd3OJjvZv838G4WZE9/7c9GsNKoZjfIWtO3fZ22gPppV72z3
	 mQDuCUQqRlPTQ==
Date: Thu, 21 Dec 2023 21:45:49 +0000
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
Message-ID: <0c99b575-5cf2-4bd6-8cfd-af19f5fd58da@sirena.org.uk>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
X-Cookie: Results are not typical.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_134558_135558_568733C8 
X-CRM114-Status: GOOD (  27.98  )
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
Content-Type: multipart/mixed; boundary="===============2124878794087025869=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2124878794087025869==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vE+9f8hy4pxOJqe"
Content-Disposition: inline


--3vE+9f8hy4pxOJqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2023 at 10:12:22PM +0100, Martin Blumenstingl wrote:

> It turns out that at least some bootloader versions are keeping the PWM
> output disabled. This is not a problem due to the specific design of the
> regulator: when the PWM output is disabled the output pin is pulled LOW,
> effectively achieving a 0% duty cycle (which in return means that VDDEE
> voltage is at 1140mV).

Hrm.  Perhaps the regulator should figure out that it's on with a
minimum voltage of 1.14V in this case - AIUI that broadly corresponds to
your change except for the fact that it doesn't recognise that there's
actually an output in this case since it assumes that disabling the PWM
disables the output which isn't the case with this hardware.  We'd need
to know more about the PWM in that case though I think.

> The problem comes when the pwm-regulator driver tries to initialize the
> PWM output. To do so it reads the current state from the hardware, which
> is:
>   period: 3666ns
>   duty cycle: 3333ns (= ~91%)
>   enabled: false
> Then those values are translated using the continuous voltage range to
> 860mV.

> Later, when the regulator is being enabled (either by the regulator core
> due to the always-on flag or first consumer - in this case the lima
> driver for the Mali-450 GPU) the pwm-regulator driver tries to keep the
> voltage (at 860mV) and just enable the PWM output. This is when things
> start to go wrong as the typical voltage used for VDDEE is 1100mV.

So, the constraints say that the 860mV voltage is within range.  Where
does the requirement for 1.1V come from in this situation?  Is it just
that lima hasn't started yet and requires the 1.1V for hardware init
(and presumably power on) even if it can use a lower voltage at runtime?

> @@ -157,7 +157,12 @@ static int pwm_regulator_get_voltage(struct regulator_dev *rdev)

> -       voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
> +       if (pstate.enabled)
> +               voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
> +       else if (max_uV_duty < min_uV_duty)
> +               voltage = max_uV_duty;
> +       else
> +               voltage = min_uV_duty;

AFAICT this means that enabling the PWM changes the voltage read back
which isn't what we expect (other than a change from 0 to target) and is
likely to cause issues.  get_voltage() should not change after an
enable(), and indeed I'm unclear how this change works?  I'd expect a
change in the init_state() function, possibly one that programs the PWM
to reflect the actual hardware state but I'm not 100% confident on that
without digging into the PWM API more.

--3vE+9f8hy4pxOJqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWEsgwACgkQJNaLcl1U
h9Azcwf/YiAYc+dIL60gpDG2EdW6ZdJE1MooApraQXp3hekHxQgjfTpijmrwPwz0
u9iWtTxs3pyDB8AwLsQkblCCyGIc667VsSltlM1HJPyRqnWJpJU3ntfkyKrElHAO
zZwIFxr3etFy5hpwsgGr387RY5XivXOPI8bXE4WBboQYjHw76XOfGIwZdcQOtVil
+67CxcqImFxvbu8qwwJIHvwt+Dzgn0xdwg6Gl5hazuzO7ponnuQKXfTvfcSzpfLy
C1jIjwa1j1piPynPTyCAueOP+1zPe2+7UeV8y0m9mqc1y8mejMLFNbvU5+hLDj8V
axE2b+894gMAtr7oHYyIb6urVYKk3w==
=yfVG
-----END PGP SIGNATURE-----

--3vE+9f8hy4pxOJqe--


--===============2124878794087025869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2124878794087025869==--

