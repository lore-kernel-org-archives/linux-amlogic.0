Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9DEC98318
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAMoulR1kEXulUzYVDkFlue7eg8JqXS1ZusKN5Q3qns=; b=0vQmatA3VcFl49QHfbBv2St9TE
	WZXMbHKUFWSuQYqgQz5NWQej9AkqifjgwR3drdbFo+/fO1yjZQ+8HK/elu21zv4rgCRX44hkokHHZ
	a23J02NqhOgi9Um8g/sAvGEmGmu9Oiso08ctByaiH44GfhzcVM+hZ08J0+HHd1FGPFLgWMxE/Dcb2
	JDDJEq8VM/QVp3BYSNfebPFTMl3WnmvWRDVZIl0yWLyjgi2l8XscNnrEDmmipSergrvlrLFGaOLm7
	UoZPqKs0OkLoUYuT/7bYlTV2nue7MgSMta/Om+mFi9f7LjiDpW5fTkQ9Cbas2i06t5WnW5PKRgrTM
	A4A605Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mp3-0000000Bg9O-1t83;
	Thu, 24 Sep 2026 17:01:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mp2-0000000Bg93-32vG
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 17:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BEFC1601DE;
	Thu, 24 Sep 2026 17:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3044D1F00893;
	Thu, 24 Sep 2026 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269283;
	bh=nQm2TSsOFmCL75Ew2X2Ml8+Y1hxvqV0VYttpBX+ucy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+cHBIAz4in40QufQgPnl6guc10fk/nKNFwovmn27Hn+FaoIpEPFdc5yE3AwgTwN9
	 8L00pVPfG69smeuGgutlyNuAk3wfOPA3BwzoH+EU/jrEASrrdmn6oD+BwGzBh4a1mn
	 OYxgH1XzECdZ5VQ82B2/g/rUZpYQ8FDlSRjBuBUaY4HjIBIMS8XzF4Cwcw0//xclVE
	 S2nhuYKt9zeI6zhzemyAQ63SI0PfJ/9YrrJGAkGnsD8RgYvZPE2Jpd+y0Zh4jqxSMc
	 C85+HE/uXDHOjjNizh40QzNePtLV4AvsyOcvvE+is9T1gSFRBd0rZqFfeffSUwHWHX
	 SAx7zSgXrZIhA==
Date: Thu, 24 Sep 2026 18:01:19 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhaol@amlogic.com>,
	Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
Message-ID: <20260924-primarily-harmonica-fe3455834a4d@spud>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============3041663065197043173=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============3041663065197043173==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bItvP1XPExBUqZoU"
Content-Disposition: inline

--bItvP1XPExBUqZoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 08:39:34AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add a Device Tree binding for the I2C controller found on the
> Amlogic A9 SoC.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Since this is not in the existing meson file, does that mean that
there's a substantial change in the IP design, other than the addition
of dma support?

> ---
>  .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    | 61 ++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
> new file mode 100644
> index 000000000000..681241a52680
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/amlogic,a9-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 I2C Controller
> +
> +maintainers:
> +  - Xianwei Zhao <xianwei.zhaol@amlogic.com>
> +  - Junyi Zhao <junyi.zhaol@amlogic.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,a9-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: DMA controller phandle and request line for RX
> +      - description: DMA controller phandle and request line for TX
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@3a4400 {
> +        compatible =3D "amlogic,a9-i2c";
> +        reg =3D <0x3a4400 0x3c>;
> +        interrupts =3D <1 164 1>;
> +        clocks =3D <&clkc_periphs 11>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +

> +        eeprom@52 {
> +            compatible =3D "atmel,24c32";
> +            reg =3D <0x52>;
> +        };

Remove this from your example please.
pw-bot: changes-requested

Thanks,
Conor.

> +    };
>=20
> --=20
> 2.52.0
>=20
>=20

--bItvP1XPExBUqZoU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVXXwAKCRB4tDGHoIJi
0jmbAQD1+PWjoCf58ZsShK3wOnr3jQBCWLxJWedfv/9RCZ8hLgEAvsMsA+s7U7IE
/rNJ549B02Ub9QvF/P2SlcaHzmzGRgk=
=qjV7
-----END PGP SIGNATURE-----

--bItvP1XPExBUqZoU--


--===============3041663065197043173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3041663065197043173==--

