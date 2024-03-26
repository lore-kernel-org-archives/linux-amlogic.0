Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C7EC54E67
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1QLF3OBG3aLtxEjQcApxRnoqO+sGtcMX5Z+26cPpbU=; b=fZNJhrf1Zvnh+yXlVwAKRc+Xlu
	MgfJ2hBV7oihQOmAV1biwPoicmh6s2C6TOHEBC+yBljQ09CPtjt+kEUfM5u5cnjhKDfojkoOEIN9d
	HzWRfNkcvip1SOkKqRlFziOQ68Zt3+Sq9qJHZW78eGfoQRHetIpHgW7WZZcI4V9BJLynwaS/zcBfn
	tHqQryxs6vns0Zkvzs1yIGj5PFc+uwqhgax5APi2v2Dz0dW5GSqllc12Y7Vju2m/JtgHT28iCuMFh
	kebin3a/ynowU6upVnoNpZ0xZ5RhWxZlmFjoZt7uCwOUR6EguhMkkq+gROi3n1gi9c2a0Q0kLZRTB
	8kmJkbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBF8-00000005s9y-18iO;
	Tue, 26 Mar 2024 18:09:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBF4-00000005s9D-1Ouy;
	Tue, 26 Mar 2024 18:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61870CE208B;
	Tue, 26 Mar 2024 18:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDD0C433F1;
	Tue, 26 Mar 2024 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711476583;
	bh=BoZYsRYkImtz4DrtH6xel+18JVsPtJGNgh1WEY1wxXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AOHCFZ9bDZOrngpBwpMwYFCeEDFkL77M5GOcuPWQRkrWUjl+XdKuDZr8hcfK9o0vZ
	 HRhT0RkXWKow1fzxVkShJL1uD2BSPMXVokd4IRhLwwgbpsAjkDRlX3pLEjgxCh5emD
	 zLBOfhOuUIvlztzxtgeSCN7ua5iJpN5DsUUNVf0tL1AeyhDeoqvz0ZAmTQSFzcjAfk
	 FmMcFTwXzT9mwsqSbPXZp+PGkmo0O+HGdiNEdsvnehCAYPJpqvyAmMVo7oOuEWmo1B
	 WzBAKvhpSArGc60m/n5vwVxQf5GTmftn5jjhANsPazROoKgNW7V8nI8Dk0WQ751yBY
	 OkAkwhx1Oa0tQ==
Date: Tue, 26 Mar 2024 18:09:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
Subject: Re: [PATCH v6 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Message-ID: <20240326-obscurity-angriness-d7bb48bc9eaa@spud>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-18-avromanov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240326153219.2915080-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_110946_843113_DF321586 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============3282748420738529860=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3282748420738529860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+unRSAILer2Qnn5+"
Content-Disposition: inline


--+unRSAILer2Qnn5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 06:32:13PM +0300, Alexey Romanov wrote:
> GXL crypto IP uses DMA engine, which doesn't require clk input
> and second interrupt line.
>=20
> Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")

How does this fix a commit that only modifies a dts? The commit cited
here should be a dt-bindings commit.

However, your commit message says "require" but you do more than remove
these as required, you remove them entirely. What am I missing?

Thanks,
Conor.

> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml         | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.=
yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index 948e11ebe4ee..d3af7b4d5f39 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -20,20 +20,11 @@ properties:
>    interrupts:
>      items:
>        - description: Interrupt for flow 0
> -      - description: Interrupt for flow 1
> -
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    const: blkmv
> =20
>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names
> =20
>  additionalProperties: false
> =20
> @@ -46,7 +37,5 @@ examples:
>      crypto: crypto-engine@c883e000 {
>          compatible =3D "amlogic,gxl-crypto";
>          reg =3D <0xc883e000 0x36>;
> -        interrupts =3D <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 189 =
IRQ_TYPE_EDGE_RISING>;
> -        clocks =3D <&clkc CLKID_BLKMV>;
> -        clock-names =3D "blkmv";
> +        interrupts =3D <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
>      };
> --=20
> 2.34.1
>=20

--+unRSAILer2Qnn5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMPYQAKCRB4tDGHoIJi
0gUyAQDBzDH7NW6Up524dyfrQC8iScX/snnaCE/sN+SA8QNCzgD/RMPYlpchBH5p
HInA6ICfV7K+t9Br+NT/w6F9vNuzyQY=
=FyeI
-----END PGP SIGNATURE-----

--+unRSAILer2Qnn5+--


--===============3282748420738529860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3282748420738529860==--

