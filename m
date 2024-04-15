Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19DBC4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2024 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh6QS2axXBkrXaXX/RSQrEx7Z/OY2oV9o9mEsSsdijo=; b=KmLRxrbLBPiBZALdkMCpkVrr7a
	EyOYlIDGNrm2J0Am1UABjD6fnDg6xtMOR4SEfqnuqasCss638U7hAMUDI1U8fFVb1lEtn2Fe+Okvm
	asi5YSVV77zEzPoOyJzR6e/xB7h/Bz/GqVpd4fg5QQ8KfBtJ51UUVrP+8Zkc7JUT5TI97O3yd1qrl
	3AxgW8/4VUyYLorWADDh52UhJjS5Grh1zPkB9tH6qIXBuuQqPDoqZOettZFiQEfOSLPVORpC52iZ1
	mO0jDZkgc8r95xQdNVTmncNRjj4IehMdS0818ROmWDmUdTaUXmInG4a/1ICIE//E+0gCn9xGk2gN9
	deyhCdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPRj-0000000986o-2SLg;
	Mon, 15 Apr 2024 16:44:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPRh-00000009869-0Z0n;
	Mon, 15 Apr 2024 16:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70C9FCE0E69;
	Mon, 15 Apr 2024 16:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421BDC113CC;
	Mon, 15 Apr 2024 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713199477;
	bh=/PeuD96WIZJSMjilmlalAw5Sh612uVNegKTxOfnIhCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiImsyMOvAhGFvPt+0Jnit7mkby93vTkBGiG2SQPOxSDq/k70rItcAceLzyahP2aU
	 3Ym5JdHSA1n8l0qmqKaMQtRLw4QMjXmtIZ8kOdNEYy/BVy+qjoztuXOSYRm7gIUrtG
	 dTo+UAlj4CXPF+Fn7I0C3v+ibIBax2NbysBOXbFObAqU6CAl38iC0k2amsjV8UDAf1
	 AtjsttY8BUTr1wqpcgC7JWHZcHsHkIjBYhd7N3OS3vMBKvXPRV2J93X88ELOAfaITJ
	 JNDe6d0CIwoeF0G6D1bDho5YGE3CkKXtvtEzz4m6pImy9C8WaAG8AESfT97Em4iCGD
	 XVdZ+wUwEds6A==
Date: Mon, 15 Apr 2024 17:44:32 +0100
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
Subject: Re: [PATCH v7 19/23] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240415-armrest-chokehold-e5027ecd4ef6@spud>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-20-avromanov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240411133832.2896463-20-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_094441_636343_CAAC053B 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Type: multipart/mixed; boundary="===============7461953112734026516=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7461953112734026516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AauLJy3HD9QY9WGP"
Content-Disposition: inline


--AauLJy3HD9QY9WGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 04:38:28PM +0300, Alexey Romanov wrote:
> Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
>=20
> 1. Add new compatibles:
>   - amlogic,g12a-crypto
>   - amlogic,axg-crypto
>   - amlogic,a1-crypto
>   - amlogic,s4-crypto (uses a1-crypto as fallback)

The commit message should mention why most of these devices are not
compatible with eachother (be that different algorithms available etc)

Thanks,
Conor.

>=20
> 2. Add power-domains in schema, which is required only for A1.
>=20
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.=
yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index d3af7b4d5f39..23743701952a 100644
> --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> @@ -11,8 +11,16 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: amlogic,gxl-crypto
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,s4-crypto
> +          - const: amlogic,a1-crypto
> +      - enum:
> +          - amlogic,gxl-crypto
> +          - amlogic,axg-crypto
> +          - amlogic,g12a-crypto
> +          - amlogic,a1-crypto
> =20
>    reg:
>      maxItems: 1
> @@ -21,11 +29,23 @@ properties:
>      items:
>        - description: Interrupt for flow 0
> =20
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: amlogic,a1-crypto
> +    then:
> +      required:
> +        - power-domains
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.34.1
>=20

--AauLJy3HD9QY9WGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1ZcAAKCRB4tDGHoIJi
0tO6AP9x7P3GKoxerzltNOawstZRE73mkiQXZ84qfhSGloZOggEA38mkqZEFSXOe
SDYdmAePKbFVRq3BsEG85zqyyN9JyAE=
=TCep
-----END PGP SIGNATURE-----

--AauLJy3HD9QY9WGP--


--===============7461953112734026516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7461953112734026516==--

