Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F7C98321
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laUu9KKP0KvQVEvQUavn3zxhuWNPBsEnXa0/l296K4g=; b=U/BQ+8Sx5vQ5M+M/NBAdvJNQlR
	3LdfWlzA+0w1tVjwPOEXczF3fgcDQWl1gWdpLGnZCG0vAAqBiAnEGvxELuYaZlNnAg+1EfH6OJWGV
	d9ZzNVBcSLt09DAZADOMl3ZsRT0mypQYLnztttz35D/vCIGpbDQYHole2qFboc7hWRoC3UBzmR19u
	R6sgXG25CAw7l+UUf4AqXGzaJsfcKEiX9OFZpyYB8Z3TSRdHPLN0AEKUqFyTGqzBokz2stKClRw96
	erU+WM6Ba6Bbejj6tUMQlliO/u+TPBNuxMC1vxHM7UiJ4oGhwQG9ifpLeynUTghieQLSHB61seiXo
	GyBIVBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n8u-0000000BiIM-3RDH;
	Thu, 24 Sep 2026 17:21:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n8t-0000000BiI2-0TLu;
	Thu, 24 Sep 2026 17:21:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55A1D601DE;
	Thu, 24 Sep 2026 17:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694AB1F00893;
	Thu, 24 Sep 2026 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270514;
	bh=+tdgUn4LCmpZMy1NvZZmFJ3S3QlMO+Bl0qktKJCidag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfLXy7gDws5V13oaRpXzFbpiwcTyxOwsZHw/BzOTUIb8sNMyscqhTtX6QZS3Ig9Hv
	 M/qjdCxFSMTZTXdSEwGGpAaUoWZvtpFNuD020pkaIusrxX7KhYRbmM5klkuDu1kMGj
	 Mc2KX0hk0WENTCPZgIQ6gz87qWFKSwGTaW+lxk1hFxvZf/Ab946PiE/P18FNJZKFmk
	 iPFiFc73GzOwjp+/awPO7jdeDVMT/VaxeEw8aD6fr8mEARgAUtXmIa13zxIqU/yJFI
	 qMCFjWfZiu2dgflIBMPfPiqgkx2/M5wdNmVRzZNf18MlAI1vCVo2I0keO4eO89eXV2
	 O4sUv/huJZNRg==
Date: Thu, 24 Sep 2026 18:21:48 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
Message-ID: <20260924-stinger-stoplight-7c327c3225fa@spud>
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============7148238430817054644=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7148238430817054644==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQQ+GaL+1qrjKfL/"
Content-Disposition: inline

--lQQ+GaL+1qrjKfL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add the T7 compatible to the Meson DWMAC binding.
>=20
> The T7 DWMAC controller requires the following compatible combination:
>=20
> amlogic,t7-dwmac
> amlogic,meson-axg-dwmac
> snps,dwmac-4.00
>=20
> Add a conditional schema check to enforce this compatible combination
> when amlogic,t7-dwmac is used.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 5c91716d1f21..b529ca5577a9 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,11 +23,24 @@ select:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>    required:
>      - compatible
> =20
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        compatible:
> +          items:
> +            - const: amlogic,t7-dwmac
> +            - const: amlogic,meson-axg-dwmac
> +            - const: snps,dwmac-4.00

This is not how fallback compatibles are described.

Instead of doing this, which affects all other compatibles in the file
by allowing dwmac-4.00 for all devices, please do this the normal way.
dwmac isn't special, it's just this binding that's weird!
Can whats currently in the binding (before this patch) be largely
replaced by just doing:
  compatible:
    oneOf:
      - items:
          - enum:
              - amlogic,meson8b-dwmac
              - amlogic,meson-gxbb-dwmac
              - amlogic,meson-axg-dwmac
              - amlogic,meson-g12a-dwmac
          - const: snps,dwmac-3.70a
          - const: snps,dwmac
      - items:
          - enum:
              - amlogic,meson6-dwmac
              - amlogic,meson8m2-dwmac
          - const: snps,dwmac

You'll have to check this yourself against the amlogic devicetrees and
see if this is correct, but with this you should be able to add your new
device without doing anything special.

pw-bot: changes-requested

Thanks,
Conor.

>    - if:
>        properties:
>          compatible:
> @@ -38,6 +51,7 @@ allOf:
>                - amlogic,meson-gxbb-dwmac
>                - amlogic,meson-axg-dwmac
>                - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
> =20
>      then:
>        properties:
> @@ -93,6 +107,7 @@ allOf:
>                - amlogic,meson8m2-dwmac
>                - amlogic,meson-gxbb-dwmac
>                - amlogic,meson-axg-dwmac
> +              - amlogic,t7-dwmac
>      then:
>        properties:
>          rx-internal-delay-ps:
> @@ -139,8 +154,10 @@ properties:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>      contains:
>        enum:
> +        - snps,dwmac-4.00
>          - snps,dwmac-3.70a
>          - snps,dwmac
> =20
>=20
> --=20
> 2.52.0
>=20
>=20

--lQQ+GaL+1qrjKfL/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVcLAAKCRB4tDGHoIJi
0uGLAP9vG/nnFjmSd9oHG4dx6aOQ6l08pSiuAib8S4dTKMhDiwD/RyvtCdjF7f8+
h9rqmIr5nqu+zvpDF0FqjtuCMmJ+fA4=
=Nzj1
-----END PGP SIGNATURE-----

--lQQ+GaL+1qrjKfL/--


--===============7148238430817054644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7148238430817054644==--

