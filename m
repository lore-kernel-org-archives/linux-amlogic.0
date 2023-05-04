Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D58BC77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnMKZIpF6gj31wyjVgeEOzHBSPhhnPU3dtE0wQXih5k=; b=T25dCRIGnb/14TERl1ZQhM5uEn
	9Y1zJeZOo6qppdkuf50KnKgrsxp9jMSF8IGFn0eaTntRo8ZvL3jCEpESbN2+ibWmoVWYluo4mXEuk
	rYxUlLUPhdWFTMXfz+CQhKKPnzbY6kqVBKhqggUsbuOYl+6AdO22137MvEZEX2acCpO8TJUVyF55S
	tn8K8SqKETZpn8aNU0Fcdj7C2cX/N0nL6ptkt3YokxdCYyNg+WBoG/8DCGfVWMnncj7SFZ7aBAvTy
	dE9CJFG9Zsr/mxpi1lKvnvIbgeNbBVT2VVWz8qcMtdsT6RAgNc/mC0W+j+byWhZsvlXEso/zJu4FW
	qBo6bJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puSkh-006o2i-1B;
	Thu, 04 May 2023 06:47:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puSke-006o1r-0g
	for linux-amlogic@lists.infradead.org;
	Thu, 04 May 2023 06:47:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puSkW-0004GN-Oj; Thu, 04 May 2023 08:47:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puSkV-00107Q-Pp; Thu, 04 May 2023 08:47:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puSkU-0019d4-Dc; Thu, 04 May 2023 08:47:30 +0200
Date: Thu, 4 May 2023 08:47:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: pwm-meson: remove not needed check in meson_pwm_calc
Message-ID: <20230504064730.gaguyecx4q7duatk@pengutronix.de>
References: <d2aa9fa6-4513-c3e8-493a-3a34d5a1143b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2aa9fa6-4513-c3e8-493a-3a34d5a1143b@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_234740_255742_1B12E758 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: multipart/mixed; boundary="===============5499500156370384202=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5499500156370384202==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l27iljz5ce5hmtes"
Content-Disposition: inline


--l27iljz5ce5hmtes
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Heiner,

On Thu, May 04, 2023 at 07:35:55AM +0200, Heiner Kallweit wrote:
> duty <=3D period implies that duty_cnt <=3D cnt. We verified before
> that cnt <=3D 0xffff, therefore we can omit the check here.
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Note: Applies only after "pwm: pwm-meson: fix handling of period/duty if =
greater than UINT_MAX"

Do you know there is git magic to express this that (at least some of)
the build bots understand? Look at git format-patch's --base option.

Otherwise:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--l27iljz5ce5hmtes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRTVQEACgkQj4D7WH0S
/k7Itwf/UZ6xOm61HvMKYT2c1czPL/YVbje2gB9Puc7t7yZ0YQN9h9ASOBj0/aY9
gskUx0GfnV5QhN3ndbSF1HqArPXArPrnzscmdmgrxSPNOk6xy7ArGd91UyXDLJ9o
Bh08dPiuPYKqdMMyCCFRfF14DLLti+MY/nLCmQdX250pgNnzXqM79oZ+1IQA+69U
nrX/wH1qsXBsA+gnI3GLJsf7hMDaKxRrgcyghlN5kpewEdpQ/HUzTcrsyxG9e8fn
ovuN/WBjN63WMpi2J+qImticMa3iwqBvGTOSlg6YbG5wdxeIHa1PbY08xUP52/Mj
VdNyxG0WVz6/gFAdqxBYjQUey/Z8Zg==
=4XkC
-----END PGP SIGNATURE-----

--l27iljz5ce5hmtes--


--===============5499500156370384202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5499500156370384202==--

