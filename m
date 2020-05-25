Return-Path: <SRS0=ry3l=7H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D085BC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 09:07:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941F22073B
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 09:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MK1SUq1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941F22073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5u2QasvlUov5yNNMhrUTDNIyIjMxQ917xpSVEZLPYs=; b=MK1SUq1mUGKdB68erxK0nmShi
	vdBz69qOva9HpGa0tEXmK4e9JzfpPs/Hy6+UEn8XaRprtLVGjuwOsb3Ed3yKhIE4bfmxuNKeoFAVN
	Na0an3m2zDg9WABcOS20pTdQWn1Eua7BJ1ryxuJBpZhxpJ7E8zRbobaomRBrHt2Swv4S2N8aqwSUO
	rvoj3om5IPZIy7iZCRRr7u64e9aNT4+A9zLs5cZsuxG5YI7d8QPzA9xomdP1ltZbWR1wNOz8pYDxY
	qyTWZ4LRw2rR2twfprvJbfxzXAYlG0Y9J3Dw4TzqJyO3U+80gepk8GT0JG/adW6YsPA5Vgf5neH4V
	O6YUqXVCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd94v-0007S6-3T; Mon, 25 May 2020 09:07:25 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd94r-0007Qn-Ul; Mon, 25 May 2020 09:07:23 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 925E81C02B1; Mon, 25 May 2020 11:07:19 +0200 (CEST)
Date: Mon, 25 May 2020 11:07:18 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: meson-dwmac: Add the
 amlogic,rx-delay-ns property
Message-ID: <20200525090718.GB16796@amd>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
 <20200512211103.530674-2-martin.blumenstingl@googlemail.com>
 <20200524212843.GF1192@bug>
 <d3f596d7-fb7f-5da7-4406-b5c0e9e9dc3f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d3f596d7-fb7f-5da7-4406-b5c0e9e9dc3f@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_020722_137806_D2D60F5E 
X-CRM114-Status: GOOD (  17.91  )
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
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5655195165606451662=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5655195165606451662==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Tue 2020-05-12 23:10:56, Martin Blumenstingl wrote:
> >> The PRG_ETHERNET registers on Meson8b and newer SoCs can add an RX
> >> delay. Add a property with the known supported values so it can be
> >> configured according to the board layout.
> >>
> >> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> ---
> >>  .../bindings/net/amlogic,meson-dwmac.yaml           | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac=
=2Eyaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> index ae91aa9d8616..66074314e57a 100644
> >> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> @@ -67,6 +67,19 @@ allOf:
> >>              PHY and MAC are adding a delay).
> >>              Any configuration is ignored when the phy-mode is set to =
"rmii".
> >> =20
> >> +        amlogic,rx-delay-ns:
> >> +          enum:
> >=20
> > Is it likely other MACs will need rx-delay property, too? Should we get=
 rid of the amlogic,
> > prefix?
>=20
> Yes, there are several MAC bindings that already define a delay property:
>=20
> Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml:
>      allwinner,rx-delay-ps:
> Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml:
>      allwinner,rx-delay-ps:
> Documentation/devicetree/bindings/net/apm-xgene-enet.txt:- rx-delay:
> Delay value for RGMII bridge RX clock.
> Documentation/devicetree/bindings/net/apm-xgene-enet.txt:       rx-delay
> =3D <2>;
> Documentation/devicetree/bindings/net/cavium-pip.txt:- rx-delay: Delay
> value for RGMII receive clock. Optional. Disabled if 0.
> Documentation/devicetree/bindings/net/mediatek-dwmac.txt:-
> mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> Documentation/devicetree/bindings/net/mediatek-dwmac.txt:
> mediatek,rx-delay-ps =3D <1530>;
>=20
> standardizing on rx-delay-ps and tx-delay-ps would make sense since that
> is the lowest resolution and the property would be correctly named with
> an unit in the name.

Seems like similar patch is already being reviewed from Dan Murphy (?)
=66rom TI.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7LisYACgkQMOfwapXb+vJCzACfcW9RZlns94NhbAXsafn1CBvX
orcAoL3pNyoH5KhUL0FoV+EGTKQVEBDM
=yjue
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--


--===============5655195165606451662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5655195165606451662==--

