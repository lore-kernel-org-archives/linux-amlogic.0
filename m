Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104CACCD18D
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Sep 2024 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvHn+OHcXLBHD8Ns1g+KM2zMhdQl6ek6sLX20/+AP1I=; b=urRuRP/uZ2W2LRch2j+hr5uf9G
	+u1pPKdgjVZ7yqxkNVYzQy1v/uYfboVPVjKyWs9tt5UUY+VPua8I+9wdnkkkEgOrBjyXM58GEMNTo
	kzdDTimCiHDmwMsGNXEk8l3R3yHOCrNb8ilLK/kz9nbtgxvPszEBcfihQMGiVilcVCRmt9+xW0Hyh
	zlaO9TdYnpcglG4TV/VjfncJ7zkPQ3KkP+4CVde2aUJ9Cf59a9xdnlbI3yNigzOmxwcV7YaVliDn6
	rNe/q2RwOWBOrXrVVG0Oz5Y/NyI6Lk3pzVo2JN2ZkEL4USI22m/5eSWmzt/sdvHKMMTFACJDtdxV2
	R1CELazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpdC-00000007jTm-0CNs;
	Wed, 18 Sep 2024 08:01:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqpd8-00000007jTK-32SE;
	Wed, 18 Sep 2024 08:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DA4CA40D2C;
	Wed, 18 Sep 2024 08:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA670C4CEC3;
	Wed, 18 Sep 2024 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726646501;
	bh=d/mNhRT2jbPpZjm3XFtiSJ/CpRq/tuV7or+IN8D2Kc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIdJRJWZIEe70hqBRVKP35K+nKGGEDiDalTfZlNCCJpmmTuE3p2sapOgATZqNDHA9
	 0z0SsozHzbAlenbZZabAQKjwpPDvoZW8xH2B1yRZtkNUIVXYYdjssmMgZYlWYqfXti
	 NwzV75IGdrY9YHGABj7fgg/iIbfQUp6nqrfjdh7ArZt2BID5Ye4LQvTcWCwW4E1Fid
	 xXzG+GJWX9rpV6AlXoShB9/mAIrteZKKrBHOSkfPMXuE9fB22hKiEzKnv6PKbVtiEz
	 nUH0rC2+MIKMGqRpyN5LjzxNMTA5ew+lFE5pMxFz2ZEwvv5ifWDgPS0Wz/I02koETb
	 4rJy0itsPLRQg==
Date: Wed, 18 Sep 2024 09:01:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: zelong dong <zelong.dong@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kelvin.zhang@amlogic.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
Message-ID: <20240918-delirious-skiing-224172be96d4@squawk>
References: <20240918074211.8067-1-zelong.dong@amlogic.com>
 <20240918074211.8067-2-zelong.dong@amlogic.com>
 <a5d9b775dd860d8f2bbf174300a2e3161b654035.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <a5d9b775dd860d8f2bbf174300a2e3161b654035.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_010142_909595_C97C60AB 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Type: multipart/mixed; boundary="===============6926996308343756213=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6926996308343756213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1OdrIj4eisHBYHwH"
Content-Disposition: inline


--1OdrIj4eisHBYHwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 09:51:28AM +0200, Philipp Zabel wrote:
> On Mi, 2024-09-18 at 15:42 +0800, zelong dong wrote:
> > From: Zelong Dong <zelong.dong@amlogic.com>
> >=20
> > Add new compatible for Amlogic A4/A5 Reset Controller
> >=20
> > Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/reset/amlogic,meson-reset.yaml   | 23 ++++++++++++-------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-rese=
t.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > index 695ef38a7bb3..0ad81fe7b629 100644
> > --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> > @@ -12,14 +12,21 @@ maintainers:
> > =20
> >  properties:
> >    compatible:
> > -    enum:
> > -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compat=
ible SoCs
> > -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compat=
ible SoCs
> > -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatib=
le SoCs
> > -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible=
 SoCs
> > -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible=
 SoCs
> > -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> > -      - amlogic,t7-reset
> > +    oneOf:
> > +      - items:
>=20
> I'm not well versed in preferred dt-bindings style, but this items
> looks superfluous to me. It only contains a single enum.

Oh, ye. Good spot.

--1OdrIj4eisHBYHwH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuqI5QAKCRB4tDGHoIJi
0oRfAQC14rdH8axKMoQQHMpS4dcHTaZa/tZa3EPK4RdqiD+vzQEAgz5WGX3k9kGY
EV3ERmLmeSSRCW0DYza8jgbDPMC5tgQ=
=IxkZ
-----END PGP SIGNATURE-----

--1OdrIj4eisHBYHwH--


--===============6926996308343756213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6926996308343756213==--

