Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C4EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhGvD2oUY5R3pbE4VOxZvHHIp3SXhLwPXEglLXbLRwY=; b=0MY/d0tcB8Zgbna7m117pMpk8L
	wGOGROqC6bui0uBg1o6fy60ftHMQUjw9njM3L8ezbLWgg2kpwef1f1fTKYD7+w37okkHQL4zPHJPq
	ppVlD48Fvp0ljOu/K6e9oEXFHu9/1s9r06nyj/uLTzCaCO0AN6U9tyeTVpVT9omwyhwE9CWYVkyjt
	jTAklRLhRlJLxEyf9HM76W3Q+J0CawmPILepXSFGaqMCB8y/oEH8Y03FbiprMG5ru1AxGYF31WwIm
	mAPccDEPpnNHI5BgWEgp1PnY1r3db58STopZIMDIhEqGxIwY5luB/6iMzjpzYPp5YCPfYq4oJEkqx
	mxLADm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsnD-00DcnL-0k;
	Wed, 21 Jun 2023 08:02:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsn9-00DcmN-1r;
	Wed, 21 Jun 2023 08:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687334535; x=1718870535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2TQu/oPINqyAhXMvFfjq4krM1J8lJ1HeueobGZSxnsg=;
  b=FhX3suz9bUq5bBwE/MKa8VdHP2yJylwzReGCNz8mskDvU0xAsF9wflcH
   J3/LX5dAenwqacB8yai7TsB0VT+8F2F7o75m4K+o9TZBXJQOWySPZVyoa
   RHtk/5zIrzbrjpdzcL5RQCfCfBXlE6iuvguBu2THAH3tnRMJUp6tCBnfJ
   Q1D72d8AeMii3ll3hOkQunWXq/mE4Di3hSSuZ771ixVs+942TL8ScJFkJ
   hshM+1R3hksb3UKqLH8PToRGae3n2JpGZMNEnf6fa/GnTmb0j3oGi049s
   f+RWzrvcbzNLRcrUMkj7IBir7b1nOPp512j00jsC4AH5pOadDH25jl3H+
   A==;
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="asc'?scan'208";a="219662347"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 01:02:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 01:02:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 01:02:06 -0700
Date: Wed, 21 Jun 2023 09:01:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Lucas Tanure <tanure@linux.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yixun Lan
	<dlan@gentoo.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem
	<art@khadas.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
Message-ID: <20230621-barber-enjoyably-04806271daea@wendy>
References: <20230620134857.238941-1-tanure@linux.com>
 <20230620134857.238941-3-tanure@linux.com>
 <ZJIjtphyKdC48JrN@ofant>
 <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
 <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_010215_618893_8923EBAD 
X-CRM114-Status: GOOD (  26.86  )
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
Content-Type: multipart/mixed; boundary="===============0448895019547460952=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============0448895019547460952==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5aSeY0QXlyq92qaE"
Content-Disposition: inline

--5aSeY0QXlyq92qaE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 08:37:02AM +0100, Lucas Tanure wrote:
> On Wed, Jun 21, 2023 at 7:02=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 21/06/2023 00:09, Yixun Lan wrote:
> > >> +            apb4: bus@fe000000 {
> > >> +                    compatible =3D "simple-bus";
> > >> +                    reg =3D <0x0 0xfe000000 0x0 0x480000>;
> > >> +                    #address-cells =3D <2>;
> > >> +                    #size-cells =3D <2>;
> > >> +                    ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000=
>;
> > >> +
> > >> +                    uart_A: serial@78000 {
> > >> +                            compatible =3D "amlogic,meson-t7-uart",
> > >                                               ~~~~~~~~~~~~~~~~~
> > > if you introduce new compatible string, then at least you need to doc=
ument it
> > > so Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml n=
eed to be updated
> > >
> > > but my qeustion here, why bother introducing new compatible string if=
 nothing
> > > changed with the compatible data? given the uart is same IP with g12a=
, can't we just
> > > use "amlogic,meson-g12-uart" for this? no only it will reduce the str=
ucture length of
> > > meson_uart_dt_match[], but also relieve maintainer's review burden?
> >
> > https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetr=
ee/bindings/writing-bindings.rst#L42
> >
> > Best regards,
> > Krzysztof
> >
> Hi, I did not understand the recommendation here.
> Can I add "amlogic,meson-t7-uart" without Documentation changes?

No, you can't.

> I think Yes, as I can see a few compatible strings in dts that don't
> exist anywhere else.

Aye, but we do not want to propagate that. New stuff should not be
adding undocumented compatibles, and those that are undocumented should
be documented.

> My idea here is to add "amlogic,meson-t7-uart" for future use if ever
> created, like if we find a bug in the future that is only relevant to
> T7 soc.
> But for now, fallback to s4 uart, as it seems to be the same controller.
>=20
> >From Krzysztof said in the writing-bindings.rst, I am following the rule=
s.
>=20
> So, what's the path forward here?

You are following the rules from the dts point of view, you just need a
3rd patch in which you document the pattern you have added here in
amlogic,meson-uart.yaml. It is probably something like:
+      - items:
+          - const: amlogic,meson-t7-uart
+          - const: amlogic,meson-s4-uart
But I have not tested that, I just wrote that in my mail client.

Cheers,
Conor.

--5aSeY0QXlyq92qaE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJKuWAAKCRB4tDGHoIJi
0sz1AQDTbSImMPfj3eXZkkbJgedEV9mFN5eDBAD9G8HavB9hSwEAiOLWCw7Qt7yU
nkxVT6Dtv3r2MiNA45lN8/HWxgTfZwk=
=Xw6R
-----END PGP SIGNATURE-----

--5aSeY0QXlyq92qaE--


--===============0448895019547460952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0448895019547460952==--

