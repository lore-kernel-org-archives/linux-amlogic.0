Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57268C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2024 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFmhodbt21G9htF9bp29Q9VzqwVPuXwRrvsvGy4pZ/Q=; b=RcIcSefFYZ9hxQtP7JVcwKHdjS
	OM8Oz7ej7Y5VLF4+XuhugIImLGb/ofFTutyesgwHKKuIEfxyZmbyby4NDhJGUC6WAH9UTfIuQr+JQ
	R3eTr7R122NoBfkVyLGxA2ge6u9cUT0NC/U051MzqoBzj6MqOrA0YrlwhPwhm2D9zbCUt1VdpJrUb
	xXKYYlpIY4eWmbwkaY/mMFQd4qA6sLgJcdZbLHv9MtTmM/Lx17A+krQX+HVm/MswuFAmVhRbbhfNU
	qvsOyBUrGDe0BQo30L5/NocSKmwdkNKYcCg3nEtTQq6qNx++71WDDftWJajJJwb7baCign0SjLM59
	KFWWMAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPQV-000000097rn-3SYU;
	Mon, 15 Apr 2024 16:43:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPQS-000000097rC-30ie;
	Mon, 15 Apr 2024 16:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25D86CE0E5D;
	Mon, 15 Apr 2024 16:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CC2C113CC;
	Mon, 15 Apr 2024 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713199401;
	bh=HqN7TdZSCNbgHFtvjYms+Ul+s+gTntsHUY9FnuUU/Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbbyECV5u1njLxj1sF0tKve7TJuwGRRhA6T/bdFIVrWQ0FzQ1wDl68Mp/rvHOgSjQ
	 +qHqwmjimQphMf8bZmdCJYVc5qEmtTwZvY8TYWGXaXX85L4Vb7TmDSzQOaGQwh75uv
	 b2aX5MEA5lkd83gT8/34X+NtSGD6zXt4YwbFsNGclyTkZURGIbnxJOuWEoNHkasJJ8
	 VQV2jzbCjgzb2eI+Xe/qLqDrtUDGnbRtHMq6Ggn7LB8Y2+p0x5A1jIlMPbcmZzhlAS
	 2Gp6+IL7vEULSAIM8kbjp255kUoSO+dV4G0PoLmwNvMAZofiMYCxb3WcRR/RGw/I9i
	 EYtzWb7DFVESA==
Date: Mon, 15 Apr 2024 17:43:15 +0100
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
Subject: Re: [PATCH v7 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Message-ID: <20240415-schnapps-plating-eb0895459004@spud>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-18-avromanov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240411133832.2896463-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_094325_249476_4735B9B4 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: multipart/mixed; boundary="===============5116675110824055382=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5116675110824055382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IiySJqPLPF6ewTlK"
Content-Disposition: inline


--IiySJqPLPF6ewTlK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 04:38:26PM +0300, Alexey Romanov wrote:
> GXL crypto IP isn't connected to clk and seconnd interrput line,
> so we must remove them from dt-bindings.

How does the device work without a clock?

Cheers,
Conor.

>=20
> Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings
> documentation for amlogic-crypto")
>=20
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

--IiySJqPLPF6ewTlK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1ZIwAKCRB4tDGHoIJi
0iLLAQDovtu6Lo9YH7fWCXHcFimMK0bA/cJ2pWBnM1sPsAdf2AD/abKRTjUdcDB5
z7YNr3N9wShAoF4Vf330Pxfn8jY+NAU=
=SyyT
-----END PGP SIGNATURE-----

--IiySJqPLPF6ewTlK--


--===============5116675110824055382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5116675110824055382==--

