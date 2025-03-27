Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8605EC36010
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Mar 2025 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dr9MetqaRMkPbzSgTS37HnrGQ1oGmkRipogPwAZPfRg=; b=12w7EKs2J2uiDLqw71U8PCxJwY
	ci0ClGv+abhR3bq1dcE7Y0DgLgQkpmFj+EFrBIxRlrqBKqTLTVKLLJSqUHypjAYkXKhZpaGmK73MY
	fBFQQ5mYUxqZ+/XGZifHBBjPxQl6+Fq/sA0YQcwCL1GFjCxgly3O1qPO44955qteKbyTlX9Qqn2/8
	XFkqE2EPEe3YtY93qy9qUhv5De7IRyfRhLABmcJFiNGFl2AXoMGTVrC65BXfzANNYolU232eeIx9n
	HWn6tT1pl7JxwnAVgebKI+O1lse/gd0rpVFUBUQfBqzKHtLjBE+iBdf1IRcUjNJ2CviFkY+t+PlbK
	JNLs1L3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqGO-0000000BXcw-2Ti8;
	Thu, 27 Mar 2025 16:39:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqEA-0000000BXAC-3XEn;
	Thu, 27 Mar 2025 16:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D61C43D60;
	Thu, 27 Mar 2025 16:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60CAC4CEDD;
	Thu, 27 Mar 2025 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093430;
	bh=7ZK9arp7BfLf5qjglWhRdpg667PLJGkQX32ma3/m/Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Coy4zzx92cLI+R/jdLE8fnj0SVv07G2XFhp35wDT+wYpLKiLuB/Op9Jn9ZYHyPO
	 WEqoOA7lJI2qvfk/0k1UT6NmV1YP+BDOyau6AlfPnDZpZiiO8hG3D/Jrgva6Pl6kQc
	 Y8nOgmW7lsutCwkYmePzrUGBedMM0rs4HpKwCaUXs52znXzyFfg5E22vh6mimMKPvR
	 XfRRV7Qjedk2Y285OOn+xx7w/6o2lYy4pW86RrD8ObYeytJTgz3pX0KNUr9uM1swH7
	 cHeU3lC9jtCtuHritB7qEGjhYa/uDnUsdHNxIbh9IVpzn/uSPnK1aK3i08/iB/hTgD
	 7nweqKtiM5l1A==
Date: Thu, 27 Mar 2025 16:37:05 +0000
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
Message-ID: <20250327-juicy-relieve-a9c5f89cb4e0@spud>
References: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
 <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250327-a5-pinctrl-v1-1-49320349c463@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093710_899536_5141BE4D 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============7835242499593153798=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7835242499593153798==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fAwn1XnIQAAgXUg9"
Content-Disposition: inline


--fAwn1XnIQAAgXUg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 05:26:35PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 +++=
++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index 8eb50cad61d5..a94f4dfb9a7f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -14,8 +14,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: amlogic,pinctrl-a4
> -
> +    oneOf:

> +      - enum:
> +          - amlogic,pinctrl-a4

This one here only has a single entry, so could just be
- const: amlogic,pinctrl-a4.

With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +      - items:
> +          - enum:
> +              - amlogic,pinctrl-a5
> +          - const: amlogic,pinctrl-a4
>    "#address-cells":
>      const: 2
> =20
>=20
> --=20
> 2.37.1
>=20
>=20

--fAwn1XnIQAAgXUg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V+sQAKCRB4tDGHoIJi
0lebAP9IKStu0S+/c9r0UyNUXENvJGtGJQJUfYxnwEVlRQIKgwD/Zb+0TeVHBQ36
m/oSQf6LHtuk/wQRhnkpFZgEpYTnpAc=
=KQTF
-----END PGP SIGNATURE-----

--fAwn1XnIQAAgXUg9--


--===============7835242499593153798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7835242499593153798==--

