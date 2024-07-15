Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3136DC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSi+A5/z4CoAUxGNYzbewjeovEXVDoHzJF/if7UryHg=; b=d8rzJuaMHw2F05eBjbehDWwXys
	v0f+TWgpY6Hia0CaIDEYQ8aYR7KK3wDmgo/2e0Abx6VfjVuIp3Dw2nBxVrtLDpourR3kwxWm3+539
	bP3i0TAh6XnJZCURD6FABsq3C80v1pZ3lXAL/UHjbOYjg6ALdre/OMyf3OSrx9iKb7EqEdjZ3hjkW
	VRoi/3iirxERoJiOmeN9OSVz7yvKzgvQt4MgVRSwj7K7c/+QtX6SUwxjc9OrZAurEZsLCHOKvh2e3
	Gs1UWtTrff8GXyq6N6MoFvlMqDTO4wKe4S4TePULjtJ79+rJXNmX2JZJHq33CXRihRcGpSLYeMYi+
	KSmG475A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOKR-00000007hFi-3l4b;
	Mon, 15 Jul 2024 16:13:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTOHt-00000007g7u-02qJ;
	Mon, 15 Jul 2024 16:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78DD4611A8;
	Mon, 15 Jul 2024 16:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7987C32782;
	Mon, 15 Jul 2024 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721059852;
	bh=PAt/9RGpGz5K/aBEqlPzaGzWnvBVjbcdM/9lPF7RxC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AExAI/PtfzbH4lbUzmoVjy0AU2GYM2r1404RPLKoEC5mPRh9jid8V7JQUUI2hoxkM
	 Ia6ddKvr0D/1cV10wLLRzctyqxaiiUIdoaNQP83NcphzbPklIBE90UmyrNNWltgzlN
	 nfB8+hdryeYovM8egb0Mcb+Hye0DK1KbFGd4uy4FugVEaAQ6RxEAmJP55nYgKTf+W9
	 9otnzy8AbpaScv6WUCnSEKANE4AbqeadWUVbjgpkFUnDeC1TunFmP1oZOnd7oCS+fS
	 ac/+LbBL3DWgVQ5x6tXBzyMG/ERm0CUjjdaHnnTOLulneGFvNzCWaMj8qErEIQoe0Z
	 jK75/9WsvmwGg==
Date: Mon, 15 Jul 2024 17:10:47 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs.
Message-ID: <20240715-override-blustery-e6763fddf3c4@spud>
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
 <20240715-soc_info-v2-1-3836c8cc27a5@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240715-soc_info-v2-1-3836c8cc27a5@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_091053_468502_D7919C66 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: multipart/mixed; boundary="===============1926737881618068697=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1926737881618068697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2RXs66YUzlqAnmaH"
Content-Disposition: inline


--2RXs66YUzlqAnmaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 04:59:19PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add dt-binding document for ao-secure of Amlogic SoCs(S4,C3,T7,A4).

That's not really accurate - no document is added here.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

cheers,
Conor.

>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++=
++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-=
gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,m=
eson-gx-ao-secure.yaml
> index 7dff32f373cb..b4f6695a6015 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> @@ -25,10 +25,18 @@ select:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: amlogic,meson-gx-ao-secure
> -      - const: syscon
> -
> +    oneOf:
> +      - items:
> +          - const: amlogic,meson-gx-ao-secure
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - amlogic,a4-ao-secure
> +              - amlogic,c3-ao-secure
> +              - amlogic,s4-ao-secure
> +              - amlogic,t7-ao-secure
> +          - const: amlogic,meson-gx-ao-secure
> +          - const: syscon
>    reg:
>      maxItems: 1
> =20
>=20
> --=20
> 2.37.1
>=20
>=20

--2RXs66YUzlqAnmaH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVKBwAKCRB4tDGHoIJi
0uO/AP962MqOigrXH0P1+IKy+IgUZlDyAU/Muhh+aiiFTfnLUAEApruA3hfW1ktM
vBVcabNKjmHd1AIJnBXisYtn45QqJQU=
=KCrM
-----END PGP SIGNATURE-----

--2RXs66YUzlqAnmaH--


--===============1926737881618068697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1926737881618068697==--

