Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1564BEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhXwG1lBOURcvDo7C2QR8aj+XU5MklmYApWEG6hF9Sw=; b=gZp1CmHVb4fIo8qP2aHAaC5RwD
	fORayt9MZN/XptvadPq4QNGil7ZygpD2Tk2Q7xH7//X0ib7H121kO1l/+TlpxdY3UX1EQRBUoWK8l
	CrQDGBc+08sjjAW/VViHqHydgzW6zJ2yxGGdgJO0O6mi999tHOTz3hAmBB6dGWhVy9rmVFWBQLkPC
	qDx1f0wpDOU+UoamLjFfOQyXbPD5OVvSIeTBX19gHib7sSKqe4ebnWiMw/LXsfhDIHdTqbitjwHmY
	EGs7Cus/aAQP87K4D2JjFTAyavFlqWQuHmvUAsY21BryV/Z4TCcwN8aFDN0BksjtFp0OPGrwpUl9U
	IN2rx6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCHBu-000652-2X;
	Thu, 22 Jun 2023 10:05:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCHBr-00063z-1s;
	Thu, 22 Jun 2023 10:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687428323; x=1718964323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cxl3Mx88pP5Y2quTc2VGzlQgURMYkhzFdmr6u9GzYN0=;
  b=QspdcrtpsPMUVWruOWoNh3cJlTqYStypaVZSfZTKSHcXtTEjqla5rRPe
   L5zFwhiYk7PlUh9KRoOQMdDoyi4R2Zq093ztWB6l7/mkISifS3b6usbV5
   c/pYaxBheC/UgN8K7TFFEc1riJbbVG9bjdiW1u0kAFgbErPMUIPH0grF+
   Rwy/wslB0s/kuLj4r8ZB8N/vpreZzkXkIzDx+nGbaVMIbFDYD4wW4iwAP
   tKy3q7QQ9/gdXQFh4KOpht257QBD7rTy+//5c+/PICk1fPMoZtYB7bPoX
   4scsLQaDbHld/JofGfEOgR6o4oiXgbL06eQwBeLy1NPKhMPn/Y6RvGhXt
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="asc'?scan'208";a="158097833"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2023 03:05:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 22 Jun 2023 03:05:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 22 Jun 2023 03:05:01 -0700
Date: Thu, 22 Jun 2023 11:04:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Message-ID: <20230622-bouncy-nebulizer-d4e487937c03@wendy>
References: <20230622084045.519203-1-tanure@linux.com>
 <20230622084045.519203-3-tanure@linux.com>
 <20230622-unsent-willing-574906af5e1a@wendy>
 <4a2a2f0c-f9dd-d5c4-1e7e-5852970f87a7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4a2a2f0c-f9dd-d5c4-1e7e-5852970f87a7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_030523_853594_EAFEDC86 
X-CRM114-Status: GOOD (  24.89  )
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
Content-Type: multipart/mixed; boundary="===============7275311033026873756=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7275311033026873756==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2DL/pp1ncOUXA4aY"
Content-Disposition: inline

--2DL/pp1ncOUXA4aY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 11:38:49AM +0200, Neil Armstrong wrote:
> On 22/06/2023 11:26, Conor Dooley wrote:
> > On Thu, Jun 22, 2023 at 09:40:44AM +0100, Lucas Tanure wrote:
> > > Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> > > There is no need for an extra compatible line in the driver, but
> > > add T7 compatible line for documentation.
> > >=20
> > > Co-developed-by: Conor Dooley <conor@kernel.org>
> >=20
> > You can delete this, I don't need a Co-developed-by tag for review
> > feedback.
> >=20
> > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > > ---
> > >   .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 +++=
+++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-u=
art.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > index 01ec45b3b406..4ca4673169aa 100644
> > > --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > @@ -46,6 +46,12 @@ properties:
> > >             - amlogic,meson8b-uart
> > >             - amlogic,meson-gx-uart
> > >             - amlogic,meson-s4-uart
> > > +      - description: Everything-Else power domain UART controller on=
 G12A compatible SoCs
> >=20
> > s/Everything-Else/Always-on/
>=20
>=20
> "Everything-Else" was the amlogic naming for the non-always-on power doma=
in, but it seems
> it's no more something used on new SoCs like the T7 family.
>=20
> Anyway, the description is wrong, and it's a mess because we used "amlogi=
c,meson-ao-uart"
> for uarts on the Always-On domain, but here it's described as Everything-=
Else...
>=20
> Lucas, is there AO_uarts on T7 ? if not drop this amlogic,meson-ao-uart f=
or the T7 UARTs.
>=20
> But if there's no more AO uart controller, you'll need to change drivers/=
tty/serial/meson_uart.c
> and add a OF_EARLYCON_DECLARE() for amlogic,meson-t7-uart.
>=20
> But still, why don't you use the amlogic,meson-s4-uart as fallback instea=
d ?

That's probably my fault, I suggested the g12a in my reply to v3,
because that is the one from which the match data is being copied, so it
seemed like it'd make the most sense to me as the fallback.

btw Neil, is the "meson-gx-uart" a wildcard? Dunno the hardware, so
wasn't sure.

> +      - description: UART controller on T7 compatible SoCs
> +        items:
> +          - const: amlogic,meson-t7-uart
> +          - const: amlogic,meson-s4-uart

As mentioned on v (N-1), I am fine with this either. You can keep the
Ack Lucas with this change.

> and update meson_uart.c if there's no AO uarts anymore....
>=20
> Neil
>=20
> > Otherwise,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>


--2DL/pp1ncOUXA4aY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJQcsgAKCRB4tDGHoIJi
0vZeAPsHIYCp0zmida6xe7aOwCiiCzCLyknJ6y/URqM/SYCm5gD/dSRBiHN42psT
HULI6939ud/hg6iv/iezBvJLBkDu8AA=
=ew60
-----END PGP SIGNATURE-----

--2DL/pp1ncOUXA4aY--


--===============7275311033026873756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7275311033026873756==--

