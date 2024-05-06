Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA7C10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc9o+3hwsI4JT36AsrlFr1gyW58ZupQ1veo6PdKU8WY=; b=DL0dDsxGkY+8dKr3Ki1oosiCTx
	uQ7DAWqeu3gYb4aNLceznfUIh7kkqkGIyZvqpTH5t/9pdiHgWiyjggMrdm/4HBaVXxK77GHdIksmQ
	6efRETto3uwMqMkjLbqEbZ/5sYT9Pprq4nBRezkVozF35MbNVyjQiup8K1QUY3byiogM7g3VvQIgo
	hOdvelXrefJ5gfpmSlZ82xWdPUrDTIJnw3zr+5yM+g8F1EHk1lTGkE1Pv1HOSuj8lkUKvJ3s5FkZP
	ifl+1UTA2a+y7uQJLpbjPWf62fhza7LgN3d8gcDvMjAyxPvcLo4gNrS842ukEtFVA9+ylHY2tbSx/
	Mwfpa5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40Z2-00000007v0l-22az;
	Mon, 06 May 2024 15:47:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40Yz-00000007uz9-0wY6;
	Mon, 06 May 2024 15:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3471761336;
	Mon,  6 May 2024 15:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763DAC116B1;
	Mon,  6 May 2024 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715010454;
	bh=h5Zn71IG11xUlo/JirQepQ3NK+G0HDNvWXGwp8rEKRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrWbB8pLnQpbuok8zaRSW4weeZre/pSDnn9c2tYySH9JX9kJWrE37F6x7eT2huT80
	 Clrv1urIZSjstPQ8XCIxfUzJvo3I4G+YNz07kK2Q2LNZO+E4WUmEUTEVjrrlrabWGA
	 uJXyfwMLyE7RBgPfsxl6jnkvCsg5uo9vzWmnAoERrFehCcA8F+MJYPIcPN3QJ8BuMM
	 wZBcZpG7MUPRR+IeNpa/gzXd3wbQpMHB7W/q8Lrc/bMzsxJIz7NK/sipNbfBz3Re2Q
	 ZDX22+oOMwUrSP9ByqPsyJBNaU1SoROcrYHcxWU/wT8XC/5jFEhewp0wnBv9cTPPwW
	 q/jQ8zTQfv7EQ==
Date: Mon, 6 May 2024 16:47:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v7 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Message-ID: <20240506-distrust-famine-6848f75dd3fe@spud>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-18-avromanov@salutedevices.com>
 <20240415-schnapps-plating-eb0895459004@spud>
 <20240506134754.jl633ncne7ct6szo@cab-wsm-0029881>
MIME-Version: 1.0
In-Reply-To: <20240506134754.jl633ncne7ct6szo@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_084737_429579_BE5853A5 
X-CRM114-Status: GOOD (  23.72  )
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
Content-Type: multipart/mixed; boundary="===============3321216992334929082=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3321216992334929082==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GdrLK7VTJWvHWU47"
Content-Disposition: inline


--GdrLK7VTJWvHWU47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 01:48:01PM +0000, Alexey Romanov wrote:
> On Mon, Apr 15, 2024 at 05:43:15PM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 04:38:26PM +0300, Alexey Romanov wrote:
> > > GXL crypto IP isn't connected to clk and seconnd interrput line,
> > > so we must remove them from dt-bindings.
> >=20
> > How does the device work without a clock?
>=20
> It's clocked by a common clock, the vendor didn't provide more
> information. It doesn't have any special clock domains.

So the hardware block does have a clock, which, even if it is a clock
shared with other hardware blocks, makes your patch incorrect.

Is the "blkmv" clock the shared clock?

Cheers,
Conor.

> > > Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> > > documentation for amlogic-crypto")
> > >=20
> > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > ---
> > >  .../bindings/crypto/amlogic,gxl-crypto.yaml         | 13 +----------=
--
> > >  1 file changed, 1 insertion(+), 12 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > index 948e11ebe4ee..d3af7b4d5f39 100644
> > > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > @@ -20,20 +20,11 @@ properties:
> > >    interrupts:
> > >      items:
> > >        - description: Interrupt for flow 0
> > > -      - description: Interrupt for flow 1
> > > -
> > > -  clocks:
> > > -    maxItems: 1
> > > -
> > > -  clock-names:
> > > -    const: blkmv
> > > =20
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - interrupts
> > > -  - clocks
> > > -  - clock-names
> > > =20
> > >  additionalProperties: false
> > > =20
> > > @@ -46,7 +37,5 @@ examples:
> > >      crypto: crypto-engine@c883e000 {
> > >          compatible =3D "amlogic,gxl-crypto";
> > >          reg =3D <0xc883e000 0x36>;
> > > -        interrupts =3D <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI =
189 IRQ_TYPE_EDGE_RISING>;
> > > -        clocks =3D <&clkc CLKID_BLKMV>;
> > > -        clock-names =3D "blkmv";
> > > +        interrupts =3D <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
> > >      };
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20
>=20
>=20
> --=20
> Thank you,
> Alexey

--GdrLK7VTJWvHWU47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjj7kQAKCRB4tDGHoIJi
0l3kAQD5POkxdd7Ibsf2owlwltjfQ8u5NyntENYzmmppOVoEcQD+Jv1hTUFpdYX1
AIEdvzcVlt1l4S5vs5DnQz3ZOI72Uw4=
=nXAR
-----END PGP SIGNATURE-----

--GdrLK7VTJWvHWU47--


--===============3321216992334929082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3321216992334929082==--

