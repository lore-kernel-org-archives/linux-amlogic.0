Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8259C35274
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kgsqbrXUeEGsk6da5HowFLSzBmml/ob/vUYL9orAX4=; b=2iXk5N3h7XH/MF0UmKY08nSpK5
	RiNHeYMW+zmTgi2qtWaOnC5m6Om3FRqc02sDn01z5XSOT/3LnBZEHEoLOWwp3BzDlq8Mfzko1QrGT
	HxBoLvC3H4HC4P0XxXmlX1z0IRGXItEDuyA6JP3b8dtjtpwi6PxKI4yPMi66X9j7nDgjwqOIBbC7M
	z89xls4msUJOthVsd8JNqEN7qwSNd0so3WYdoPeKAQRm60pSw6mBLxVOi+V950gas7opTm0xRwN38
	pKfyGmloyZGw82QMI0CiXyca4qul1ialDtrLmqOvlm2k8P9WnJPBp3N5hovsPRmggJEsTSDbLpif5
	YkVym9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGH3b-002Xoh-1u;
	Thu, 21 Dec 2023 11:17:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGH3X-002XnJ-36
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 11:17:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGH3U-00059L-Jp; Thu, 21 Dec 2023 12:17:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGH3S-000Vit-Sp; Thu, 21 Dec 2023 12:17:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGH3T-001POd-MZ; Thu, 21 Dec 2023 12:17:31 +0100
Date: Thu, 21 Dec 2023 12:17:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: pwm: Thierry steps down, Uwe takes over
Message-ID: <bgydjom2y32ahs7y5o5xel67ybpifydmeokc7ew7ocm66gway2@v76vqgxrw3ho>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
 <20231212203352.wl3rzob75fct4lov@pengutronix.de>
 <ZYMPc50eBi6oBClu@orome.fritz.box>
 <6nj7rmq36hj5m26b7yhlbmpfps5wuxkx4zwyvttg4cpgocimj7@xtqm4qleo3s6>
 <ZYQMA-tM-zl5IJyC@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZYQMA-tM-zl5IJyC@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_031736_019248_A91FC9ED 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8277995817497564797=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8277995817497564797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3hpii6aoqhh5mej"
Content-Disposition: inline


--i3hpii6aoqhh5mej
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Thu, Dec 21, 2023 at 10:57:23AM +0100, Thierry Reding wrote:
> Looks all good to me. I'll keep things going until the next merge window
> and will then send out my last PWM pull request and let Linus know to
> expect future requests to come from you.

Sounds good.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--i3hpii6aoqhh5mej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWEHsoACgkQj4D7WH0S
/k6XeggAolfcwyJ6/eHa78Mwclwm/k8z28O6swoIpBNWbgoSO0Zr97YOtHDzmRrn
DE2m1Wu4CbQDVE03wRkDcTP0zbgqzj8f9MzFoONQLczlFf/jIgsR7DhyIV8IyxuR
WJ0tvVWBsrWG2dYDEgyuD84d8xLcMWOIHRL3P5KDsuy5p0Oae0CER58u4wnlHP9P
iBk5Vp8tDsBZp2EL6TE2ggc7pQLwbusyvC/0bgd3mWmGslmpYjWl6GkW/PgxhQKi
4Zj2aW+eXeBen1ZvVBhr+k/+t+ZapWLcYiymaEKw2I0mD4OlKOkV6/BMz2PW7yCc
hU/SnqoH0eJ+V0+WBLG1bDx5Oyq8TA==
=0/BY
-----END PGP SIGNATURE-----

--i3hpii6aoqhh5mej--


--===============8277995817497564797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8277995817497564797==--

