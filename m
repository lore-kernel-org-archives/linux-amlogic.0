Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC6C47258
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jan 2024 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSfqosKlHxySGxbw4aHYVavBHYzZXFq7+iDIL1Ybtfg=; b=nQkp9/bu93mhewO80ZIjnwadCr
	/22PyDGQlvVOSKV75915YQtpVnVW9oWuRgvzmAKA8yQaHiqubeHkAjQ3dRPRFfE8k5w63fMcLevvV
	1hU1jhR0RLrMH5/jAa57UB3IZ+mxX7xFRHn7DPlUOBNdvpQ90pJ2x7KznlzCuB873+mfBKculv1Oq
	N2+yxCXvO6uuaAzbxfSXwd3a/AETJa96+nsC3jDbp7kk8ceb5hfi4yzUDQx0zfl6WQhdhBSf5BSDw
	OxoQPXcGbnYEFmOKkhMeVqC2IXfmo7VnXj96J8rxY/1HgFdHZqOlOoNyCMHRw1XDKvLHATgfLj/Xq
	dus5k/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3Wh-00FLYf-2n;
	Wed, 17 Jan 2024 10:52:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3Wd-00FLXd-2i
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jan 2024 10:52:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ3WT-0000Z4-Vr; Wed, 17 Jan 2024 11:51:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ3WS-000RZ9-OT; Wed, 17 Jan 2024 11:51:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ3WS-001dbj-28;
	Wed, 17 Jan 2024 11:51:52 +0100
Date: Wed, 17 Jan 2024 11:51:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Message-ID: <b3a5r4gti67zic6egpwnede7niakn54ewfpmxg4ojm6ye2qopx@rke57jcyuveg>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-3-jbrunet@baylibre.com>
 <4rdb2be2bfzak3s4uaizthcdcdwdrxnx4kr2sgn527hvsie3pb@gfqciim7yryz>
 <1jfrywxnu5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jfrywxnu5.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_025203_903117_0E49DD04 
X-CRM114-Status: GOOD (  27.81  )
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
Content-Type: multipart/mixed; boundary="===============7282119272400506241=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7282119272400506241==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bhlfpvugwaqjoz5"
Content-Disposition: inline


--3bhlfpvugwaqjoz5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jerome,

On Wed, Jan 17, 2024 at 11:16:31AM +0100, Jerome Brunet wrote:
> On Wed 17 Jan 2024 at 10:58, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de> wrote:
> > [[PGP Signed Part:Undecided]]
> > Hello,
> >
> > On Fri, Dec 22, 2023 at 12:16:50PM +0100, Jerome Brunet wrote:
> >> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/=
Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> index a1d382aacb82..eece390114a3 100644
> >> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> @@ -21,23 +21,35 @@ properties:
> >>            - amlogic,meson-g12a-ee-pwm
> >>            - amlogic,meson-g12a-ao-pwm-ab
> >>            - amlogic,meson-g12a-ao-pwm-cd
> >> -          - amlogic,meson-s4-pwm

Either I still didn't grasp all the details of this change, or removing
amlogic,meson-s4-pwm in this commit is wrong.

> >> +        deprecated: true
> >>        - items:
> >>            - const: amlogic,meson-gx-pwm
> >>            - const: amlogic,meson-gxbb-pwm
> >> +        deprecated: true
> >>        - items:
> >>            - const: amlogic,meson-gx-ao-pwm
> >>            - const: amlogic,meson-gxbb-ao-pwm
> >> +        deprecated: true
> >>        - items:
> >>            - const: amlogic,meson8-pwm
> >>            - const: amlogic,meson8b-pwm
> >> +        deprecated: true
> >
> > I think deprecating the old binding and adding a new compatible should
> > be done in two commits.
>=20
> Hi Uwe,
>=20
> There was the same comment on v3 and Krzysztof said it should be done
> like this:
>=20
> https://lore.kernel.org/linux-pwm/e127dcef-3149-443a-9a8c-d24ef4054f09@li=
naro.org
>=20
> I tend to agree with Krzysztof on this but, as I previously said,
> I don't really mind one way or the other. Just have to pick one.

Ah, so the machines that used amlogic,meson-g12a-ee-pwm before are
supposed to use amlogic,meson-g12-pwm-v2 now. With that understood I
agree to you and Krzysztof.

I wonder if me not understanding that is a sign that the commit log
isn't optimal (or if it's only that I didn't properly read it :-).
Now that I understood the change better, the commit log is
understandable, but maybe still make it a bit more explicit that it
introduces a new way to formalize already supported hardware. Something
like:

	dt-bindings: pwm: amlogic: Add a new binding for meson8 pwm types

	The binding that is used up to now describe which input the PWM
	channel multiplexer should pick among its possible parents,
	which are hardcoded in the driver. This isn't a good binding in
	the sense that it should describe hardware but not usage.

	Add a new binding deprecating the old one that uses clocks in a
	better way and how clocks are usually used today: The list of
	clocks describe the inputs of the PWM block as they are realised
	in hardware.

	So deprecate the old bindings and introduce a compatible per SoC
	family to replace these.

I think I'd understand that better, but that might be because I wrote
it and it's subjective?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3bhlfpvugwaqjoz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWnsUcACgkQj4D7WH0S
/k5jBgf+K4/2nlwNuhl98wP3lhKs9noKvnoecmlxEqzV+HowMVaRvasoTYxpWZst
F0kE3hWQF654JB/Whvdb9NVMJHUIfvuok6egBVBC7VKtGKR8sUUUD1vc0CnxV1OE
tosScnl0r/zPXyFWU6xYPzFHVrnndxBwjvneScCkA8W1hx8eLG3B8pFHFTjsxvOg
gQtlS46eDfnJ9llQDl1N2iZHdOdfAXqFegZB2RCHmIorS1z86x53Wci/tFvYLH6F
e6Jn0Nwrf6EPHzQK2FCQZOa9BwFJDZ6NiivNXMSzp4RgCSmNEySOlc4XVBoF4Sh7
hbnETJ5us1luELfbF4oSg2Y3H8c3Vw==
=iYzS
-----END PGP SIGNATURE-----

--3bhlfpvugwaqjoz5--


--===============7282119272400506241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7282119272400506241==--

