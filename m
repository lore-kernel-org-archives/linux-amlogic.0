Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471B7C54798
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Mar 2024 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NU3Mbx+3DMMjkDrYmFsk3/QOgIIHHIh/y0DEvH4nNo=; b=nloZANvSNVDDkNREVw7VGu8O8O
	UkX+PFMlSMAt3x8XA1Gjb4gTSPAjJUvlM9giQbqZKPgFzbvUmShKkpkkDNaLeb9HpC/xyr9PyDk9z
	VrLQ+ivzlOIEoMgobimoHknFauuhHD0j5KW9mRuYTf/+uMgqSLiYxes980eyfPmNhuUuL3Y1QMTqs
	sNhl6B6Wep0TBFGq1gCgkUy2lex6F+fJG0VoDgQFRySFKl5UHMohh74uwLbIe4Wv8nx+BKU42aljp
	g6cJHefgt+91ooiXzsnO+842sAR9SRJ9jw93gSJ3hwTYWKrorGYtetqZxQS8olxHEytgTDeQdHJQI
	itzTCYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMEr-00000003Hc7-3cqw;
	Sat, 02 Mar 2024 10:05:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgMEn-00000003HaP-4Ahv
	for linux-amlogic@lists.infradead.org;
	Sat, 02 Mar 2024 10:05:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rgMEc-0004Fj-0z; Sat, 02 Mar 2024 11:04:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rgMEb-003wqT-29; Sat, 02 Mar 2024 11:04:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rgMEa-00FL58-39;
	Sat, 02 Mar 2024 11:04:48 +0100
Date: Sat, 2 Mar 2024 11:04:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, 
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 0/5] pwm: meson: dt-bindings fixup
Message-ID: <b6jyherdfnehu3xrg6ulkxlcfknfej6ali2om27d7rjmwncwxz@3wrtx6sv4xm7>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_020502_073934_9D5A87AB 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============6995362368505275893=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6995362368505275893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3wvrlu5hxba7ods"
Content-Disposition: inline


--h3wvrlu5hxba7ods
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jerome,

On Wed, Feb 21, 2024 at 04:11:46PM +0100, Jerome Brunet wrote:
> Jerome Brunet (5):
>   dt-bindings: pwm: amlogic: fix s4 bindings
>   dt-bindings: pwm: amlogic: Add a new binding for meson8 pwm types
>   pwm: meson: generalize 4 inputs clock on meson8 pwm type
>   pwm: meson: don't carry internal clock elements around
>   pwm: meson: add generic compatible for meson8 to sm1

I applied patches #1 to #3. This doesn't mean #4 and #5 are bad, just
that I need some more time for review.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--h3wvrlu5hxba7ods
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXi+bwACgkQj4D7WH0S
/k5xXAf+ORcgnudezS1elCoc+vcwfRBfd+L8tYNpbx4BuKMVtVxaKQ/9sEV6m73x
SJoD5+nOJsFAI0gJFeW1z0Mo2W9/AJly67xPNuwxg3MSwq0aDL+birkC1rKJX2GK
eJ+6ax+MN8b1X85tHb9Z/Mzm1daUkiK5ReNRKKHXlm9yKsQHDMvDbqCS0K2DXATq
iTU86vIjL+EB2dQFsTN/zbwY7GQU01MIa3veJsulPgZb9OJzM8njirll/61q2r+x
Dx4pIsBpOpOEzAy1UytunBrntj6N2iUZz8tlX7nx+HEcfjii2ySHGKuY01tWJbIR
7ffCqSAtvn3ghzC+5yIFk4EYjX66MA==
=IVa9
-----END PGP SIGNATURE-----

--h3wvrlu5hxba7ods--


--===============6995362368505275893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6995362368505275893==--

