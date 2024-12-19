Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0801E77184
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2024 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+YBZLvbKAwkqfp8NPgSOX6zLNoq8s6d9DNuFQrt7hM=; b=fHCYnkbJT1F52mlCDkodtZjn8n
	d1nlXEU2m47k1IEosCmkvDWlrs0g8V0oWkR6soVvQhUpAcmj8I/BiJ0KC0Aa/8YGqp5lJLqwpLtmd
	0Gn7/6AyjKPJsYIWb5aXEzvb6RJclngqm/dGXidtsI0GeEJhoWxbNG1vD3jsyfAf3LkqRO/IdjH0m
	ZCqZVvPC4NH5qoVo/mwB54wlMKxxJFfVHKZIadXcj1dlMiYUuAsyMFpnSXxcshNohJTX/JXsICoxj
	R8XfaLf0EaixKoa2Tw/ibplqp6QU1xfWJlR6sXhOOzHGKxttV3mnEctbb71vwedaDHUhHp5BdaN+S
	DhlHLtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMz2-000000030kl-0krq;
	Thu, 19 Dec 2024 20:18:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMrW-00000002yzq-3a8Q;
	Thu, 19 Dec 2024 20:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CC505C6917;
	Thu, 19 Dec 2024 20:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F60C4CED4;
	Thu, 19 Dec 2024 20:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734639070;
	bh=Oxv7gQG1cNXbG0Fp3Bpc5LzhotYBPEpA0l2FLf6oEvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwZjYF+3NvizdHmvVN9RAsyQzBQkvEOjm5w/XOMpU39UcRQH0f1qop4Bax3JqGV7W
	 bplpnRxoDMZyeuZ8WxbCqUUfbXQGYFW3vpNqvSdsw5VTADUl0kYL4ZCgMA0tIWZbjf
	 /uDT4XaDk30CdDndhAgksSFqC969dtsuRNJQlV8ATaYZqf+H+Lq6rvI4OUAbR/mcsc
	 8whZew4hdzVtIO7ZPuCvMshqSsTG22DCod0pAX+YoXzPBCvryOPaQ4nIyeR3X8FANJ
	 oDgovQcR2EGA6aZ9T3gRRZFPnXjA8ccKV3Hl/r7NaE5d1OSW72M0ru/8lBiKukv6xS
	 /TTXhi+l2t4gA==
Date: Thu, 19 Dec 2024 20:11:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
Message-ID: <20241219-scenic-revision-17da9231d61a@spud>
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_121110_977169_C053470D 
X-CRM114-Status: GOOD (  18.32  )
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
Content-Type: multipart/mixed; boundary="===============5807352041547660636=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5807352041547660636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E6C8VplMw1mOJcDT"
Content-Disposition: inline


--E6C8VplMw1mOJcDT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 09:40:41AM +0530, Dharma Balasubiramani wrote:
> Move the `compatible` property into its specific binding to make the MMC
> slot more generic and modular.

This makes no sense, as presented. What's the real reason for this
change? You want to ref mmc-slot.yaml but the compatible is causing a
driver to probe?
Otherwise, if this is just to avoid having to fix up some devicetree
source files, I don't think we should do this.

Thanks,
Conor.

>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml | 4 ++++
>  Documentation/devicetree/bindings/mmc/mmc-slot.yaml              | 7 +--=
----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.=
yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> index 022682a977c6..7600a4988eca 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> @@ -54,6 +54,10 @@ patternProperties:
>        A node for each slot provided by the MMC controller
> =20
>      properties:
> +      compatible:
> +        items:
> +          - const: mmc-slot
> +
>        reg:
>          enum: [0, 1, 2]
> =20
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-slot.yaml
> index 1f0667828063..84c4605658e0 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
> @@ -20,19 +20,15 @@ properties:
>    $nodename:
>      pattern: "^slot(@.*)?$"
> =20
> -  compatible:
> -    const: mmc-slot
> -
>    reg:
>      description:
>        the slot (or "port") ID
>      maxItems: 1
> =20
>  required:
> -  - compatible
>    - reg
> =20
> -unevaluatedProperties: false
> +additionalProperties: true
> =20
>  examples:
>    - |
> @@ -40,7 +36,6 @@ examples:
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
>        slot@0 {
> -        compatible =3D "mmc-slot";
>          reg =3D <0>;
>          bus-width =3D <4>;
>        };
>=20
> ---
> base-commit: 7fa366f1b6e376c38966faa42da7f0f2e013fdab
> change-id: 20241219-mmc-slot-0574889daea3
>=20
> Best regards,
> --=20
> Dharma Balasubiramani <dharma.b@microchip.com>
>=20

--E6C8VplMw1mOJcDT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R92QAKCRB4tDGHoIJi
0uF0AQCCkZ/AGdPEHj/YRGeKMFGk8lttRZIYHRKX8V3//6ycbgD/T1LEsSfzTuzT
XIO5WbdO0FiyWZ0dsPH7aR+mC0O2Jgg=
=My4h
-----END PGP SIGNATURE-----

--E6C8VplMw1mOJcDT--


--===============5807352041547660636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5807352041547660636==--

