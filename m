Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD77C33CAE
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 22:15:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE34020CC7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 22:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kat+M1UY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE34020CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVaivyWEKlWTbUceRSmFgJWvWc3yGBdQjqtMCmAFQnc=; b=kat+M1UYicfc8fing/bIbjRRP
	/vv2g2bZv1pu7EM/XWVEKjIveMU5lByJQ9SqycFkSOvZQIjZLrkla6NN8AxbHuGG9gg3DXcuGb/i9
	uXgpOF6n4uVzj92IyzJKUrHyUnWMlA5cwqEqh6achPdeWs2QB0B9yEO0r6JEr7FpfxbyFZer9HTg5
	idL0lrXoDhFScrrkYyMEI7ZUCu5Gv2pTnN29ffDTvObkKlaCLrh2NJg/zA4wrISAK97/EvUK1aCKp
	tQce+UHfXeJWTnAw2dtDm4c2XLS+zZdu7t8AThD+s1Wp3688VJKWThkyS9vmhmFzuaeLzPT0Oyko3
	99zvrueFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir7zr-0001Yj-Iu; Mon, 13 Jan 2020 22:15:43 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir7zn-0001W3-MI; Mon, 13 Jan 2020 22:15:41 +0000
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
 by pokefinder.org (Postfix) with ESMTPSA id 2B8B32C06DA;
 Mon, 13 Jan 2020 23:15:33 +0100 (CET)
Date: Mon, 13 Jan 2020 23:15:32 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] i2c: meson: implement the master_xfer_atomic callback
Message-ID: <20200113221532.GC2689@ninjato>
References: <20200107232901.891177-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20200107232901.891177-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_141539_880243_91B8F0AD 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: narmstrong@baylibre.com, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 b.galvani@gmail.com, jian.hu@amlogic.com, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8189543735610893314=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8189543735610893314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 12:29:01AM +0100, Martin Blumenstingl wrote:
> Boards with some of the 32-bit SoCs (mostly Meson8 and Meson8m2) use a
> Ricoh RN5T618 PMU which acts as system power controller. The driver for
> the system power controller may need to the I2C bus just before shutting
> down or rebooting the system. At this stage the interrupts may be
> disabled already.
>=20
> Implement the master_xfer_atomic callback so the driver for the RN5T618
> PMU can communicate properly with the PMU when shutting down or
> rebooting the board. The CTRL register has a status bit which can be
> polled to determine when processing has completed. According to the
> public S805 datasheet the value 0 means "idle" and 1 means "running".
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to for-next, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4c7AQACgkQFA3kzBSg
KbbuRRAAnOvYecXtAAQlFI9kpCVUGmLW8USmChX+JFEbpguc3uyPI0jnz7hPjLsx
664PGVOPwfaMIfcClLCVM8abtgjyUpbX4AmLrM0mGq5xgYATUCnV85hjcqXIvEKM
ecfAR522mRm3ZVSUEJO5UPzwjDY1QxON7BEgY6iRa9F4wLEAXdV3MYXBLkMKK7YR
IvX92X/SX30jqLIYfihH1T/5Livk08f3M70GQH8Ngcr1HMK5clSyrVxp2mT4L4o+
Y9RoB7hdhEv96O+oaEfXmeGowe5co+d2JGTbCPT9/Fuo0Curv+ScNbKMrf8dMqW2
+/Qz1EQDsIGd4uh1w/DMmFHslQcVYX3lfKLZASk0rcPs1ofoja5uXEzKvTTCrsgI
GImOvyV9hxSFEbpL5ZUY8PHIplRsqpRnMOpeXiK6xmPTQPAE1Tk2eng2uCuvJk1V
0EhFNVHR3pNMw966d+kw+oFOC3hFSR+s4rw7CiOpOI/Cgl6AhLCvrqpqWRF4asfX
DvuqSGCH2Z5Li9xuFJHU5kLR8MLX5Y6yeVOPMFCgqhBr22cV5JInznSODpg56WjH
V7kmPJOm3HIwgk93ZySC7g5eCOX/h14xK7EWRM42cxv8otcmJfJ85YRxSKAfKjYV
ptAxuxClf+v9HsFRGD4ZSMb00igmwTiW9y/E0TiMw4Q01tUtYWY=
=pX3/
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--


--===============8189543735610893314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8189543735610893314==--

