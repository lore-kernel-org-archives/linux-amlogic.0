Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C0BC4167D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUdNMAjxhad4IsOQdE8hfczFG6i0uSht29/rDyzQb/g=; b=I/+kQf+EV/Kmg9wM6hw2isPOom
	sB/tr15V/NaSil8CEEBomlR72l33CT4AwyaUimh1aePEUDKxjqSvNxOQVvcLRqFzx7JOmwT04irnB
	LDnp04soutD/7yfB/lcCsQ3xjXDcQSK7zX4F/g01hTcVI6+WDWy8KXr1y0qyMp2yunqbXqTgURIss
	B142jiqFXb1AYD7dJK3/ElcfnJQKBoCkOLVCHDZAcP9Yd+CRLzBze/sv3vBbX0hF29QS7XP4PTqGO
	2sPKg+yYZ/fXp2meRz6gYghpMS3WNZhuPWmj4emp4bULnzC5FxXUYZMsOTYhq7EcZfY4jvjzbKnzS
	eGUSZ1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r19BH-006yTF-1X;
	Thu, 09 Nov 2023 17:51:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r19BE-006yS6-0v;
	Thu, 09 Nov 2023 17:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8834AB82173;
	Thu,  9 Nov 2023 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0B4C433C7;
	Thu,  9 Nov 2023 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699552257;
	bh=GB1syrHkrGKsmiS0BjcotABnBGuB2ElN3V85GZw/kAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToCXT+f0/7z3BZkle4LwTFuKxK3lAXNYtMhvN8zhbG2gkF7h4SBB/igmwG0P+Zvo2
	 NmuS/Eg86zaZ6ucHSUi94mNjOVQMxv6vRV7mSbR5Nu2xBvVt+kOOadEY1MeJi2R5eX
	 gm/vUCHta0V+Aw72M3C1IBCFGONx0v4m5jQ9enBcpbJJu7jdsg0lKCj1pkr1bIN56H
	 XlOOpDuFV4fAm1/T95n+hJTQNX4BnHUyad1pDELC+KMD+BzhteYuURCIzoLPGIax5q
	 24ToC2MuXIi88cVPWmXu7EuLB2aftW1hVxXBE5zrsHGWQoYmx0ds30NK2pSkEsnp1Z
	 O5bKwljiIwPLw==
Date: Thu, 9 Nov 2023 17:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
Message-ID: <20231109-unsalted-daredevil-4052fa57fd2c@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-3-81e4aeeda193@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_095100_627879_2F8074A2 
X-CRM114-Status: GOOD (  15.64  )
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
Content-Type: multipart/mixed; boundary="===============2925832350509225026=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2925832350509225026==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E5Nn4IFoyvxjicc1"
Content-Disposition: inline


--E5Nn4IFoyvxjicc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:04AM +0100, Neil Armstrong wrote:
> Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, d=
rop the now
> useless description about the parent node and also drop the unnecessary e=
xample.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
COnor.

> ---
>  .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------=
------
>  1 file changed, 17 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi=
-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg=
-mipi-pcie-analog.yaml
> index 009a39808318..70def36e5688 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-a=
nalog.yaml
> @@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
>  maintainers:
>    - Remi Pommarel <repk@triplefau.lt>
> =20
> -description: |+
> -  The Everything-Else Power Domains node should be the child of a syscon
> -  node with the required property:
> -
> -  - compatible: Should be the following:
> -                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
> -
> -  Refer to the bindings described in
> -  Documentation/devicetree/bindings/mfd/syscon.yaml
> -
>  properties:
>    compatible:
>      const: amlogic,axg-mipi-pcie-analog-phy
> @@ -31,10 +21,3 @@ required:
>    - "#phy-cells"
> =20
>  additionalProperties: false
> -
> -examples:
> -  - |
> -    mpphy: phy {
> -          compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
> -          #phy-cells =3D <0>;
> -    };
>=20
> --=20
> 2.34.1
>=20

--E5Nn4IFoyvxjicc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0b+wAKCRB4tDGHoIJi
0llMAQDSiyi01Tk6EfsjuzI7TW2RZ9q3lS642vkuNdyv7Vl74QEAi50xLev+LeZV
0XXHkOzNdlCx7iH9hujdrheVevi6VwY=
=NFGG
-----END PGP SIGNATURE-----

--E5Nn4IFoyvxjicc1--


--===============2925832350509225026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2925832350509225026==--

