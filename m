Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58077C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ3TXZRrvKGXEMlKm2a7LRV6uhQGjB4Ff3FhW++L4GY=; b=yh4KKofXwayZwYIWRUZStYv8b4
	P/7T2haucKz4TXhGmApXLUjLg0l/uuMve7RkAlESGExCnAB/CCmzgL+K2BggTKPZbxSptQ63e/rbB
	tjEZfhvnnR0EvBxrA9LiY/wsqmK/izRLZhi63xxxSuekyDQFakaFvvYf+mD9MifumWaiNR/8+x8lC
	BfJf+2WP+bKeTsAXK7p7aBLS4fpopH+DkCsnEuY/YmN8ceva/5sY6qrCwtp1pcnVHQJhTE4ITIxWG
	ZSpVcihfxjLFxeU5oqKM4zszJhWXoI6SfZH38OKNoFh4xNs+OGvs+T+o22C/sMMo8Hp/PKk6okS6g
	K1tWwYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqzO-00Bx6M-1O;
	Mon, 27 Mar 2023 17:50:38 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqzK-00Bx4F-1O
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 17:50:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgqzE-0004eo-Tc; Mon, 27 Mar 2023 19:50:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgqzE-00784z-6k; Mon, 27 Mar 2023 19:50:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgqzD-008U17-I6; Mon, 27 Mar 2023 19:50:27 +0200
Date: Mon, 27 Mar 2023 19:50:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: neil.armstrong@linaro.org,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] pwm: meson: add support for S4 chip family
Message-ID: <20230327175027.z7as4fybzgx7zhuq@pengutronix.de>
References: <fad131e9-265f-6c4d-3223-932f69c9a927@gmail.com>
 <3492657f-6cc2-5828-b153-30c609a92783@linaro.org>
 <45dbd1d4-a2b8-af33-beec-64906c0e98da@gmail.com>
MIME-Version: 1.0
In-Reply-To: <45dbd1d4-a2b8-af33-beec-64906c0e98da@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_105034_472430_3C55781C 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Type: multipart/mixed; boundary="===============6437770791387032230=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6437770791387032230==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huvgnjolgdavutr5"
Content-Disposition: inline


--huvgnjolgdavutr5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 07:00:35PM +0200, Heiner Kallweit wrote:
> The best (for achieving best precision) input frequency is 0xffff / perio=
d.
> So we should do our best to come as close as possible to this frequency.
> By using set_rate() CCF will choose the optimal mux input and divider val=
ue.

Just for the record: Here might be a misconception. There is (AFAIK) no
reason to believe that set_rate would pick an optimal configuration. And
if it's only because there is no objective definition of "optimal". For
example if a driver for an SD card requests 400MHz, it might not want
anything faster and so probably prefers 202 MHz over 404 MHz. However a
driver for a UART would prefer the 404 MHz in this case. IMHO we'd need
something like

	clk_rounddown_rate();
	clk_roundnear_rate(); and maybe
	clk_roundup_rate()

to please all drivers. But that sounds like a bigger quest.

If your clk can provide (say) 1000000 Hz and 2000000 Hz (and nothing in
between) there is no rule in the CCF that tells you which of the two to
pick if you request 1000001 Hz or 1999999 Hz. (The only thing I would
not expect is that you get 1000000 Hz when requesting 1999999 Hz *and*
2000000 Hz when requesting 1000001 Hz.)

> Not sure why we should restrict ourselves to one mux parent only.
> E.g. for a very low duty cycle a higher input frequency than the xtal 24M=
Hz may be preferable.
>=20
> Not only the mux is outside the PWM block now, also the divider (8 bit wi=
de instead of 7 bit
> as of today). So we need a set_rate() anyway to set the divider value.
> What I can't say is whether the internal divider still exists (then exter=
nal and internal
> divider would be cascaded) or is removed or bypassed.
> It seems like when adding the external PWM clock feature Amlogic forgot t=
o update
> the PWM block documentation, as there's no reference at all to the now ex=
ternal input clock
> (except in the clocks section).

It would be great to test (or ask?) if the internal divider still exists
and do the right thing then.

Having said that, I wonder if it would make sense to rework the driver
for the variants with the internal mux to also abstract the divider as a
proper clk.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--huvgnjolgdavutr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQh12IACgkQj4D7WH0S
/k7dfQgAlnaiAkNwkPxwgjl/k4+yZxnZmqiyapOuZKo+ZYdcnuQXQlB1ATM+alHH
o6ARlXoCoPV5bNp3WANuHMiEV4fr5UKo7llV+xMnpMyOjsh0/pbq7ksb9K7939tH
qzVYX56DiZkEPthhx87oyJw8Kup3if3iyIGEc9ljx7Zvip53ltW0m2U340VQm1Fy
QuQl1oa6nO8JZcWi1VMA5GS+3eEoQpNwaXXhDRoOToVsrZYaiId33wKtq0tS+vFx
gaG6B+Fs9SpFJ2GG+NaV5zyRkJSFzvg+WFukb3l620G2jecDk+CZKta6db4UA9dJ
0466t/bitcphfNS9YXfTG+bRArWVaA==
=+kg4
-----END PGP SIGNATURE-----

--huvgnjolgdavutr5--


--===============6437770791387032230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6437770791387032230==--

