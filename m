Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F3C27C65
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJWlGRhFmbMnf06A+6JRlstV+go+ATwKoMndjagHE4E=; b=OPlIorIvvozPrqnrsovHOOzHl0
	d5XBxTE4uwANry00PIBB7vTicSYACc2zGyJIzkensmsIivsB7dgSJ+dmlo/LODTOydjKZzT0DHI9b
	U8VgzybZ1V9eIq64IwpjlwnPYOKUMEc8+Z8BevL+NKX3WkGlc2LlZOpoXSWpi1x6bfDzfdfhwKJ8l
	k39CP1Vy0Q/j+iujWOHItKl7UNKIDJPqCwJL+9vrM+21DWXVlZI0Bb3BVgvXQJprLiVCox9NeyL4V
	27jsXu/tMwbm+rvkbpAx3LSx95A2Mu6XEshQzV6ObBHIseML5JsWjRfo/L4clgBPnq7NOhnG3z7cA
	5WDk9C+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5uD-00000009n05-3The;
	Tue, 11 Jun 2024 18:07:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5uA-00000009mzT-3tZL;
	Tue, 11 Jun 2024 18:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C7EE610AA;
	Tue, 11 Jun 2024 18:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37D2C2BD10;
	Tue, 11 Jun 2024 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718129253;
	bh=q4ZS2OwCpxxeV67ovBwERfgyqxYXGvy54YBgY6MfW2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKozxI8GgPA73uR1P6gT1vsk/yJQHb2TFCDkYWU+nLY9ttHzEZHv+Gr4gFgbCh/UY
	 3Yu0KevNqdZ6b2xzAXLbiX8KB4OEJMqC0CLkIWlj0xGJYrL4sgu/JN4A8j2FqXyriG
	 AuvPQCRvyZbDri+T0EWxs3AcT8pAq/Z8Ym5Krv4myK6d5iuUkn5a4no4ZHSlxIwQjo
	 kmasB1D9gohJi4qBWI+bDyyKq++i7ga6f3AsDPSE4G0bRMDZAmlNLPgIZKO7dffKbO
	 Y5KzLxP0UVSwU482LCUpDIFgKYZrcdcE4lnRM4ESl+Ygy60w2sJNx+hcMhkPeCP65h
	 y3Mat9pprabgA==
Date: Tue, 11 Jun 2024 19:07:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Viacheslav <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: amlogic:
 amlogic,meson-gx-ao-secure: add secure-monitor property
Message-ID: <20240611-undying-earthy-00236ac251aa@spud>
References: <20240610084032.3096614-1-adeep@lexina.in>
 <20240610084032.3096614-4-adeep@lexina.in>
 <20240610-dropout-compress-6d6a9b749524@spud>
 <4866f6d4-2e3c-40c7-a8cb-ba4e422ffef6@lexina.in>
MIME-Version: 1.0
In-Reply-To: <4866f6d4-2e3c-40c7-a8cb-ba4e422ffef6@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_110735_095768_1C88A20D 
X-CRM114-Status: GOOD (  28.49  )
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
Content-Type: multipart/mixed; boundary="===============1323454823449651328=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1323454823449651328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sJ1nEYGXW16faEE9"
Content-Disposition: inline


--sJ1nEYGXW16faEE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 01:25:11PM +0300, Viacheslav wrote:
> Hi!
>=20
> 10/06/2024 19.08, Conor Dooley wrote:
> > On Mon, Jun 10, 2024 at 11:39:49AM +0300, Viacheslav Bocharov wrote:
> > > Add secure-monitor property to schema for meson-gx-socinfo-sm driver.
> >=20
> > "bindings are for hardware, not drivers". Why purpose does the "secure
> > monitor" serve that the secure firmware needs a reference to it?
>=20
> This driver is an extension to the meson-gx-socinfo driver: it supplements
> information obtained from the register with information from the
> SM_GET_CHIP_ID secure monitor call. Due to the specifics of the module
> loading order, we cannot do away with meson-gx-socinfo, as it is used for
> platform identification in some drivers. Therefore, the extended informat=
ion
> is formatted as a separate driver, which is loaded after the secure-monit=
or
> driver.

Please stop talking about drivers, this is a binding which is about
hardware. Please provide, in your next version, a commit message that
justifies adding this property without talking about driver probing
order etc, and instead focuses on what service the "secure monitor"
provides etc.

> The ability to obtain additional information depends on the support for t=
he
> call in the secure-monitor, which can be described by an additional link
> from the amlogic,meson-gx-ao-secure node to the secure-monitor node, simi=
lar
> to how it is done for amlogic,meson-gxbb-efuse.
>=20
> >=20
> > Thanks,
> > Conor.
> >=20
> > >=20
> > > Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> > > ---
> > >   .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml      | 4 +=
+++
> > >   1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,me=
son-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlog=
ic,meson-gx-ao-secure.yaml
> > > index 7dff32f373cb..1128a794ec89 100644
> > > --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-=
ao-secure.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-=
ao-secure.yaml
> > > @@ -32,6 +32,10 @@ properties:
> > >     reg:
> > >       maxItems: 1
> > > +  secure-monitor:
> >=20
> > Missing a vendor prefix.
> >=20
> > > +    description: phandle to the secure-monitor node
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > >     amlogic,has-chip-id:
> > >       description: |
> > >         A firmware register encodes the SoC type, package and revision
> > > --=20
> > > 2.45.2
> > >=20
> > >=20
> > > _______________________________________________
> > > linux-amlogic mailing list
> > > linux-amlogic@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>=20
> --
> with regards,
> Viacheslav

--sJ1nEYGXW16faEE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmiSYAAKCRB4tDGHoIJi
0jycAQCDqoXCDGSzgqjdRrhl84TptzMFUZFgRNdHcGZOOTvlbQEA8E53g1Xc26vR
Urb8lH1R3nEkVzk3384ZJv7yIgQXtw8=
=wUCV
-----END PGP SIGNATURE-----

--sJ1nEYGXW16faEE9--


--===============1323454823449651328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1323454823449651328==--

