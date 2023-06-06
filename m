Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149FFC77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHFYSvfHMf8xjIqp1AXiVzdgaNBxZCc8GHqafnN1Ubw=; b=XiN3KCyZDApKaBQx1Nj2j1K6mv
	okWMmpNFu/fnPOQALViYV1OD8QDzHjbV+ik1rgE1NzETh5mQGaXG96jAqY6DyCbp8Qgec9d0O/OEf
	OvIBvECA1vYFDQwpwdDto74JwQjZMyZa+nMOtGME2k8TZjoJ8W/F0SqgrM26AmppC0MNbln2YhjG8
	mLrwCSg48PdP7KfdvzY22qvKqedTJulmnTRt/lltO2uA4qmUdvmjcTKfDAVdX0HDmgVFKltffp+BU
	3r5I6vSbMs+E/Z7bTvZ7b+pmnsM/iBSjUNnZIDql0CwLfI2a2/6l1gRbuzegdF+PS9uo4x6p3X1uU
	rfKt+1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RGl-000YM5-3A;
	Tue, 06 Jun 2023 07:38:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RGi-000YJv-1n
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jun 2023 07:38:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6RGY-000429-Kk; Tue, 06 Jun 2023 09:38:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6RGW-005SAa-EX; Tue, 06 Jun 2023 09:38:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6RGV-00BdDq-O8; Tue, 06 Jun 2023 09:38:03 +0200
Date: Tue, 6 Jun 2023 09:38:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Stark <gnstark@sberdevices.ru>
Cc: thierry.reding@gmail.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH] pwm: meson: compute cnt register value in proper way
Message-ID: <20230606073803.xdzc4b5ulisb4etq@pengutronix.de>
References: <20230602103211.2199283-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230602103211.2199283-1-gnstark@sberdevices.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_003816_596618_81FAD335 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: multipart/mixed; boundary="===============1761445127030441285=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1761445127030441285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pob5pwp43u57lf6p"
Content-Disposition: inline


--pob5pwp43u57lf6p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

just a small note: This patch wasn't sent to the pwm mailing list and so
is missing in our patchwork instance. I didn't follow the discussion,
but please (and in your own interest) make sure to Cc:
linux-pwm@vger.kernel.org for the next revision (or resend if the
conclusion of the discussion is that the patch is fine).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pob5pwp43u57lf6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR+4loACgkQj4D7WH0S
/k53xwf/ZsSFSwI9yH9jFUwkiPcV8xE6bq5/9cMSntTT1UN/NyLFXpeccJ2o/KBp
2AxzYRkKpFzCeq8RwkNsC8g/PBWDpdT61u7CdEp04kUJbqQDveK5Y56P0zOrquxJ
r2fsjHLxQLP6HuOt0qeTVnAeWPRttgh5NjsDRQ0uWFSa9ZDX5O1V8un4V1cj4Thg
lGaz2Vt+8VkSl9K9HViX8/E4OFhuf/Qkqy6kDUDllmq/NMYoBQZuSWl79VSKdbow
+hbPl1215X/C/hbyKDfFzdlFpPpm7KWsbwTO6OqCjCYtvYgnf2VbHpeUXCnV2Qqj
AhoY64uXfKzHqmMk/Nv1Fs5DSh0yQw==
=WjHa
-----END PGP SIGNATURE-----

--pob5pwp43u57lf6p--


--===============1761445127030441285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1761445127030441285==--

