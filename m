Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB2EEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4x7yM+sdUeFhajWL/DF6n978K1s04jyB2QISLcuUug=; b=vb49GmwNqmwlajpjFJv51rQd7I
	34Ie9hsJSEqkXrOn1awBXQLep1gwZLdoqs3b0OEDQUNmXFsvcz7wGWTFMomyLHC4jrJaGUtay/HV/
	0YHnWwEzooJHs0/S5JfxBNSKxi75GkjmzJqdxzTbNDgQf7uK3sO18TOtHl4ywx2yhRGQvZWkhe7df
	8Aii+ufI9RWOjB4s+HISmv0KdUf6CStcdRC+l0Nv0V6vhH9W6WceFHR1HQm2hHcAtAFT1lhZD6WwT
	lh3E4vCFMT94P5lF7xpyjtWhaY8HsgR1jD+fqrC1nH3+Q5sjDNwnplGayJYgPkCPXv52W5gjfcIVU
	r2pckTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYx9-00GHk6-34;
	Wed, 28 Jun 2023 17:27:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYx7-00GHjR-1W;
	Wed, 28 Jun 2023 17:27:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E77DC61408;
	Wed, 28 Jun 2023 17:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4E5C433C8;
	Wed, 28 Jun 2023 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687973256;
	bh=F0PybSEQg3oGD0oV9xIryADKGMGVcc7224PKlDe1/K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsEgIy0JwjVpU/mf7fw0rJ7mr+bBZglsYTZdbf8Dn4JnhFnNOfIYLU+hA2LvICmyA
	 lbjO6oUAEmzFzxKcnasoNxL9iOPO8Rh8t+dRQCrDckMUzPjN8mr/1y3eEffWaX7kqZ
	 rLpVnZOl4+btvjWEsh1AyhVwI92R2NCuIeEsOEizLnzegfQNqOESqhsWn2E+q+AG6Y
	 uRVh0DGL/D7Qa6n9QZPt8ZX41A47uykMP6noohpzhbSR3CJ2ebJ/qLnqkYWTZFugZw
	 jfRmKQgENyts32K84EzGzLkPj1SKCzbYs9Ie75gtkpc3Tx9FwcKiBOZyEN2l/6N8/T
	 5mb2O2878JRww==
Date: Wed, 28 Jun 2023 18:27:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add support
 for Amlogic-C3 SoCs
Message-ID: <20230628-carat-dwarf-0b8e8c047c45@spud>
References: <20230628091533.3884385-1-huqiang.qin@amlogic.com>
 <20230628091533.3884385-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230628091533.3884385-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_102737_552278_B278A090 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: multipart/mixed; boundary="===============7368473588661351680=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7368473588661351680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XbbCx1QsHjc5jIJV"
Content-Disposition: inline


--XbbCx1QsHjc5jIJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 05:15:32PM +0800, Huqiang Qin wrote:
> Update dt-binding document for GPIO interrupt controller of Amlogic-C3 So=
Cs
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlog=
ic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/amlogic,meson-gpio-intc.yaml
> index e84e4f33b358..3d06db98e978 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> @@ -35,6 +35,7 @@ properties:
>                - amlogic,meson-sm1-gpio-intc
>                - amlogic,meson-a1-gpio-intc
>                - amlogic,meson-s4-gpio-intc
> +              - amlogic,c3-gpio-intc
>            - const: amlogic,meson-gpio-intc
> =20
>    reg:
> --=20
> 2.37.1
>=20

--XbbCx1QsHjc5jIJV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJxtggAKCRB4tDGHoIJi
0hj7AQDpVNTHoWvTaJwjH4OGLihfyqwOGbkOpryPiMX1htjj6gEAkF5EUPPKWA4c
QU+X8XLZU39rF0w7SHpuQNW2J1IAPgQ=
=wqpH
-----END PGP SIGNATURE-----

--XbbCx1QsHjc5jIJV--


--===============7368473588661351680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7368473588661351680==--

