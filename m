Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1437EC54E67
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNbu0AZX05g7a9jtFTdVLoyzsfNR3HaAjhwUw/sWqA8=; b=Wbkw2ROZZ33CmMuGSvJUli/X20
	h+WRgqWqjgVgw8PAWcKKpsOtLy2YVdiTIrSfUSwIC4dIHXPky43yu25BYgT7C3RMzLpmOA8J87KFi
	+pkmaNA5c4pl2paEEQNxYTOttxC7hxryx0+iP9hDhmlkPf4rxq92u+jQLP2Os5Ev3okEyIT1aq5tH
	fkHKkDRB2KCHfumuHHoZEtib+8dmAwiKWyvM3mz261TY4arQ+tTnLBEYUA2+YAopGS7ltGqVeWIJs
	IOfmB19mtNi8T47OzSx9sETZSq7dJ0RqU+2PQN2vCuK/SQQHgSu/bWm18+XSXqIejo62s4mLBYsxS
	8OT0Qr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBAT-00000005r43-2yo2;
	Tue, 26 Mar 2024 18:05:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBAQ-00000005r2m-2U5Y;
	Tue, 26 Mar 2024 18:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D98096130C;
	Tue, 26 Mar 2024 18:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14588C433F1;
	Tue, 26 Mar 2024 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711476292;
	bh=FpwR17g2PH56G0XDh6Pi3WB67cdLCnSyZjbxboXsr0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhqPwuZTdQ1s7BpgL1VIfuejwlhhnnaQebCxnJRAG0seH7mpEyQLj8LiyS6MhTs3D
	 lAsHUNE6c5YMjRyPqRfd1SioWqtf+T74GNlkByMBviw6YJiCSjPGxhY8iRV7s+qwcw
	 qvxfkjefy4d0o2sX9eBnM6zuVZg4clFyVlPCmIJyIxM8jje4z1vxa1H/D7ZoHNxCAe
	 guE2pbxtTTqlzpZDIeZhzbw08HFzcIv+Jo5mI8SXPjbXWVcQQZBNyz5cPX9gVYg6VV
	 t3oNj0XtFGgXIuFircYNgE4t+HXmIX9iZSHEVETnqq+FzRLbUdLtwNm0Oh2a/ILudH
	 H3VeWif2pNhEA==
Date: Tue, 26 Mar 2024 18:04:46 +0000
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
Subject: Re: [PATCH v6 19/23] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240326-boneless-patrol-b1156a4be70b@spud>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-20-avromanov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240326153219.2915080-20-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_110458_771506_B0B17252 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: multipart/mixed; boundary="===============5928766815439390234=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5928766815439390234==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TsFS7LpYqhJ6X8MW"
Content-Disposition: inline


--TsFS7LpYqhJ6X8MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 06:32:15PM +0300, Alexey Romanov wrote:
> Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
>=20
> 1. Add new compatibles:
>   - amlogic,g12a-crypto
>   - amlogic,axg-crypto
>   - amlogic,a1-crypto
>   - amlogic,s4-crypto (uses a1-crypto as fallback)
>=20
> 2. Add power-domains in schema.
>=20
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml       | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.=
yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> index d3af7b4d5f39..c92edde314aa 100644
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
> @@ -21,6 +29,9 @@ properties:
>      items:
>        - description: Interrupt for flow 0
> =20
> +  power-domains:
> +    maxItems: 1

Is power-domains valid for the devices that existed prior to your patch?

--TsFS7LpYqhJ6X8MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMOPgAKCRB4tDGHoIJi
0tshAQCtbEqOHiJFUm5lxRMtAn+5YxU2CDgCh0rFA4v9v07M5QEAtxnoZzj0b3c8
yH8w5AJrE8FRKbXSqTKMNF83M4Te2Qo=
=OFV3
-----END PGP SIGNATURE-----

--TsFS7LpYqhJ6X8MW--


--===============5928766815439390234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5928766815439390234==--

