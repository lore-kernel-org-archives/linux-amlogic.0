Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE49C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq5wxuJRE82LYv7NTptjy8vhTps2us/5Ks1KExK/V+g=; b=AJv0XKemyIDBI+lHYe2BAdGq1f
	lCsRcbxUtR7UiNxykXYpo+qlZ0ciH10l9vzWQH1KiCch3JD/TRzvB6B1ZunWeiuVuG5EmlKl/iwRH
	1ydH5QTQplxg/620wyXUn1eO7YbVunGC3haeVI8oaXy9QRfzWp/A9QF1NjyqYjrhPeyhskJLJC33b
	+/JTMu6qZkCjJtGTa82W7UXt3dKjdAYr6N5Rpdv0dk9x4n6aQYBadgyuNMwRBV/ds93hB29wc8xr1
	+qt3cDPxgIXrqjIwiAxboE/sic7DACSJYundxz0u8Akmee4VTlVX1erJxrxhGqxZ6pCue+q0jdIQY
	Q/envAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFhp-0000000H48M-3urD;
	Fri, 12 Apr 2024 12:08:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFhm-0000000H472-2v1i
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 12:08:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvFhf-0007RX-Pr; Fri, 12 Apr 2024 14:08:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvFhe-00BsBA-On; Fri, 12 Apr 2024 14:08:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvFhe-0009i4-29;
	Fri, 12 Apr 2024 14:08:22 +0200
Date: Fri, 12 Apr 2024 14:08:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, 
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to
 sm1
Message-ID: <24ec3iiudmfapiosygpsvgu7kmdqe6csbkpuzx3p3sa4oyodqu@hshmbpvzhufb>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-6-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240221151154.26452-6-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_050830_758114_04B77F89 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Type: multipart/mixed; boundary="===============4232647580631572470=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4232647580631572470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o6zwfw2ds5fuh2ws"
Content-Disposition: inline


--o6zwfw2ds5fuh2ws
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 04:11:51PM +0100, Jerome Brunet wrote:
> Introduce a new compatible support in the Amlogic PWM driver.
>=20
> The PWM HW is actually the same for all SoCs supported so far. A specific
> compatible is needed only because the clock sources of the PWMs are
> hard-coded in the driver.
>=20
> It is better to have the clock source described in DT but this changes the
> bindings so a new compatible must be introduced.
>=20
> When all supported platform have migrated to the new compatible, support
> for the legacy ones may be removed from the driver.
>=20
> The addition of this new compatible makes the old ones obsolete, as
> described in the DT documentation.
>=20
> Adding a callback to setup the clock will also make it easier to add
> support for the new PWM HW found in a1, s4, c3 and t7 SoC families.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

After spending some brain cycles on this one I think I understood it.
Looks fine to me, I only considered questioning if the dev_warn_once is
too offensive.

b4 + git applied the patch just fine even without patch #4 of this
series. Would you be so kind to double check it works as intended?

BTW, b4 diagnosed:

Checking attestation on all messages, may take a moment...
---
  =E2=9C=97 [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to=
 sm1
    + Link: https://lore.kernel.org/r/20240221151154.26452-6-jbrunet@baylib=
re.com
    + Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
  ---
  =E2=9C=97 BADSIG: DKIM/baylibre-com.20230601.gappssmtp.com

Is this only because it took me so long to reply, or is there a
configuration issue with the baylibre MTA?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o6zwfw2ds5fuh2ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYZJDUACgkQj4D7WH0S
/k5YqAf9Gp+g65dKTx78fK8hzvxoD9Y3G0PBNvMZG0cgDhyEIvXcC0zVpdDqgL/L
UbcBW+DNc5Imw7H91xeUtyD4nDhybz1aG38vALuh8Ojuy+qqfxhZpaaDLl0344sB
QVRkyJQxgB2VYDslaNPD7caXYtuMTwdyrbXf1jE7dg5ui9zWpr7pR+1TFPEYGsRE
iRBqz3cZmq1MN0/1hhzw81jXz7rJVgv79bGBHr43wq2EwiAB/Rx1ztYFl9stz9PR
KLOWaASjPFjeHxdrv6gP/+TEJ2BweZe7wwkEHFe34KUysr2x+QUFK2+x727TD30j
gAmrGXJHW5AvlZZQMvhhKwxdFsxrpQ==
=JdWF
-----END PGP SIGNATURE-----

--o6zwfw2ds5fuh2ws--


--===============4232647580631572470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4232647580631572470==--

