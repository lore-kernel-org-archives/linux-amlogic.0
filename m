Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB6C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Peq98b7OiXjDzcTdyH6Uftiup5bjWJ/XA1U4Emqbk0=; b=3n1nyqC7FtRuHUo/+qAZmMhdmj
	yCqws0CUksh7DOCLGmu7r2FMnYvquBtZujpIW6djzxhD17qudksJjqWoiY0qLb81GE2uQl68NpzLd
	RwTew4z7lBtglui+PhZqtrtusmDVFYkv3wc1uivP11pNy9xVXQ+JKq+rS/W7RzvqtMDopLYy9PgP5
	eOeE18VK7rFPxfkDHIkAqxF0WAkCVGPIHlHRXd+EYdiWsz4XZa+aLbLnnVAakQBIQ1sVdPXk/eXVi
	oQAE4PsMk2CkPBpequ9gpgouILcHuy4IYpASCFNTYVo8ThAggDPbMbjfQplEeidPKk1tMloVQDuUc
	WVpdNrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWut-000000034Jo-1dvu;
	Wed, 24 Apr 2024 07:19:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWuo-000000034Hx-2jjs
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 07:19:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWul-0003XV-IH; Wed, 24 Apr 2024 09:19:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWuk-00E2OB-Mt; Wed, 24 Apr 2024 09:19:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzWuk-007gCX-20;
	Wed, 24 Apr 2024 09:19:34 +0200
Date: Wed, 24 Apr 2024 09:19:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, thierry.reding@gmail.com, hkallweit1@gmail.com, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 1/2] pwm: meson: drop unneeded check in get_state callback
Message-ID: <wkn6ybnnlco7vrqbpclfxaajt5cvywpr633au7qcr6vpjihabq@kb7q6y4khh2k>
References: <20240423161356.2522636-1-gnstark@salutedevices.com>
 <20240423161356.2522636-2-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240423161356.2522636-2-gnstark@salutedevices.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_001938_764773_4447953A 
X-CRM114-Status: GOOD (  11.69  )
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
Content-Type: multipart/mixed; boundary="===============3678213712953688212=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3678213712953688212==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xwbvuajde4meb2t"
Content-Disposition: inline


--3xwbvuajde4meb2t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello George,

On Tue, Apr 23, 2024 at 07:13:55PM +0300, George Stark wrote:
> Drop checking state argument for null pointer in meson_pwm_get_state()
> due to it is called only from pwm core with always valid arguments.
>=20
> Fixes: 211ed630753d ("pwm: Add support for Meson PWM Controller")
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

I'd apply this one with the following changes if you agree:

 - capitalize "drop" in the Subject line
 - s/get_state/.get_state()/
 - make "null" all caps (i.e. "NULL")
 - swap the order of Signed-off-by lines to have yours last.

Alternatively send it in a v2 together with addressing the comment in
the second patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3xwbvuajde4meb2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYosoUACgkQj4D7WH0S
/k7G1gf+PGBuQXOKBKGgHuOhdu/hGX+YqKlLX7bGKVF4a/6Hj5zjVxP2W2WeOd42
o5lwOx0Aby2qxA2/greyP1XODpf86xX9J5CPuk0h9haNt10XVsLP+tzX0bpgorYY
ltKCskC3VzFM4L+l7tiSF+8478kLzjpzwKR/lg1jr6ib5IH8g/riSNpJekMstrK6
FUnzSKBW1r01wv8T7OW+cy3f35ygttE//Bii1OSiEGqU/gtouoEtoy2AKZrIwCuP
C28ArBOOsUmbVTW/0U9g7wakmNlxaLVqC8kJPVrG4cz5ndaDczWjQV02MlbvrkO/
XaP6LMwi1REygGrxkME/m1VxDaxEVQ==
=gKa2
-----END PGP SIGNATURE-----

--3xwbvuajde4meb2t--


--===============3678213712953688212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3678213712953688212==--

