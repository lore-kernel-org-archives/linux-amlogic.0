Return-Path: <SRS0=KJO1=4O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6844C4BA12
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 13:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B3024684
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 13:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAWrCGON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B3024684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rmIWoEIhGDfiWJmEp3yRxM8OdOC9Eza0xMaZYNJjxFs=; b=nAWrCGONQB9gTpq4jneprGObi
	qJFXJJjlDaWMgAQY9fO1EsRBIQMb7FxjF++NWz7G52ZugGX0i6gQiaVynZbie3N1o4GtBtq9+xNlM
	tkOiPF6Q2MmVQ79PzJmf/ugSyyaqCiK7xzaEgwAxmxrG83Ze+iHzPkKm24RIvifd++l+DZNHTmqrv
	VX0GImZC7PwufesjxM3AgoHlKYw0H3dLAAhLcE0DevaG98x5o9FrrGcNXQhcHvSRvh7xXK+MiA7vZ
	0cnh/dXP+CF6in9A31xdOwWvJWGAbYXCeJB276x841SUkbVqzzRYYJH9oYjWn/GW9aMLHiUf84mBy
	EVZ0I+x9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6wLL-0001a4-UH; Wed, 26 Feb 2020 13:03:15 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6wLG-0001Yy-A5; Wed, 26 Feb 2020 13:03:13 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CAF6A1C0370; Wed, 26 Feb 2020 14:03:00 +0100 (CET)
Date: Wed, 26 Feb 2020 14:03:00 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Ezra Buehler <ezra@easyb.ch>
Subject: Re: [RFC 00/25] arm64: realtek: Add Xnano X5 and implement
 TM1628/FD628/AiP1618 LED controllers
Message-ID: <20200226130300.GB2800@duo.ucw.cz>
References: <20191212033952.5967-1-afaerber@suse.de>
 <7110806f-ddbd-f055-e107-7a1f7e223102@arm.com>
 <c86c6bc0-b0e5-c46e-da87-9d910b95f9f3@suse.de>
 <04e7d7cd-a8bc-621b-9205-1a058521cabe@arm.com>
 <E33E27B9-D33C-4182-A5B1-C72FA40470BC@easyb.ch>
MIME-Version: 1.0
In-Reply-To: <E33E27B9-D33C-4182-A5B1-C72FA40470BC@easyb.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_050310_498342_061AC754 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, csd@princeton.com.tw,
 linux-realtek-soc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 sales@fdhisi.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 zypeng@titanmec.com, linux-amlogic@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5824333646202986618=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5824333646202986618==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On 13 Dec 2019, at 15:07, Robin Murphy <robin.murphy@arm.com> wrote:
> >=20
> > I also have one of the H96 Max boxes (which I picked up out of curiosity
> > for the mysterious RK3318) with an FD6551, although I've not attacked
> > that one with the logic analyser yet to see how similar it is.
>=20
> I have a T9 (RK3328) TV box with the same chip in it. The FD6551 uses an
> I2C-like protocol. Every digit (and the symbols) have an I2C address,
> but, the display does not signal ACK. AFAIK the FD650 and FD655 which
> are used in other boxes (Amlogic) are very similar.
>=20
> So far, I have whipped up a proof-of-cocept driver that uses i2c-gpio.
> The digits seem to be rotated by 180 degrees. So, in order to use
> map_to_7segment.h I had to define the BIT_SEG7_* constants differently.
> My display also has multiple symbols (WIFI, network, pause, play, USB,
> alarm) that are controlled by writing to the same address as for the
> colon.
>=20
> I=E2=80=99d love to work on a driver (similar to Andreas=E2=80=99 SPI bas=
ed driver) for
> these I2C connected chips.

Create a driver in drivers/auxdisplay for alphanumeric parts. You can
then export any remaining symbols as LEDs if it will provide benefits.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZshAAKCRAw5/Bqldv6
8kZqAJ0eHpZJIq9KvRkuA970vGoHRW+FxwCfUVhxIMi58/nyPvs2Fhxkk2zlRec=
=UP4r
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--


--===============5824333646202986618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5824333646202986618==--

