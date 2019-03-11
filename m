Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B93CC10F06
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 11:21:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69AB32075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 11:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uZKWF8+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69AB32075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nwOsWykO+u3X3C2eEzIXDyQ2IX6aWmFKvb4fxGC02fM=; b=uZKWF8+b55OppWEB3L7M0ZMLd
	w9Twx4A806vuqOyjJfJyUvHqEMRnM+dDiMPc52cIERwE8TZbE8t6vWNDhFSkuZGPW9CAfMNQcEmnZ
	vDL1KE1y3j7WzrONH7j1OmYdX+reQ1Lvc1LXR/QMsMvt3P48MVk3IRIeKhqVMgQy48VqSG2/1DsYn
	FQZk48MYbTR7Yg+iWrD/UHP52Un7SM1DXkoILn5rVeUoIZx8BoIGTorJH3+iarjuJK3jAcKjZP9Eb
	DJETo6eHrNNDoaG9q7REQGwoumKryppcbz3ryo+h6I7DwJuXvmloK81LPQCelTr4IOfZLWCrTqa6y
	w1dOlhGNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Izn-0005Q6-9V; Mon, 11 Mar 2019 11:21:27 +0000
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Izj-0005Ou-Cs; Mon, 11 Mar 2019 11:21:25 +0000
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 619318024A; Mon, 11 Mar 2019 12:21:08 +0100 (CET)
Date: Mon, 11 Mar 2019 12:21:14 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 4/4] gnss: add driver for mediatek receivers
Message-ID: <20190311112114.GD14118@amd>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-5-git-send-email-lollivier@baylibre.com>
 <20190214100019.GA4197@Red> <20190214101212.GJ28278@localhost>
MIME-Version: 1.0
In-Reply-To: <20190214101212.GJ28278@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_042123_585223_F5176F36 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1150286363915714463=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1150286363915714463==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-02-14 11:12:12, Johan Hovold wrote:
> On Thu, Feb 14, 2019 at 11:00:19AM +0100, Corentin Labbe wrote:
> > On Wed, Feb 13, 2019 at 04:09:29PM +0100, Loys Ollivier wrote:
> > > Add driver for serial-connected Mediatek-based GNSS receivers.
> > >=20
> > > These devices typically boot transmitting vendor specific NMEA output
> > > sequences. The serial port bit rate is read from the device tree
> > > "current-speed".
> > >=20
> > > Note that the driver uses the generic GNSS serial implementation and
> > > therefore essentially only manages power abstracted into three power
> > > states: ACTIVE, STANDBY, and OFF.
> > >=20
> > > For mediatek receivers with a main supply and no enable-gpios, this s=
imply
> > > means that the main supply is disabled in STANDBY and OFF (the option=
al
> > > backup supply is kept enabled while the driver is bound).
> > >=20
> > > Note that the timepulse-support is left unimplemented.
> > >=20
> > > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>=20
> > > +static int mtk_set_active(struct gnss_serial *gserial)
> > > +{
> > > +	struct mtk_data *data =3D gnss_serial_get_drvdata(gserial);
> > > +	int ret;
> > > +
> > > +	ret =3D regulator_enable(data->vcc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> >=20
> > Hello
> >=20
> > This could be simplified to return regulator_enable(data->vcc);
>=20
> Indeed, but I prefer this style which clearly separates the error path
> from the success path while making the success return value explicit.

What is clear about useless code? That function can be two lines, this
only leads people to wonder "what is going on here?".
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyGRKoACgkQMOfwapXb+vJqAwCfScGhWTgpO+dfu2CFL1ZJgSkD
N6AAoIRtpiQeraSW32y0NcjTq66hwSeP
=o1Tv
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--


--===============1150286363915714463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1150286363915714463==--

