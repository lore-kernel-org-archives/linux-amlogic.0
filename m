Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87493CD98C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnO1QeP/GQBP43UNHyjXvrv8ItbL11+pWLa4VCmryhM=; b=0DtXIEGFI0KhIX1n32bxVVBIND
	42dHSQXi4sbPSwRIIFuWY422gw0dseeH3opuZ6AhV3szO4nxYZhu0auvUyYB+JuCfv3XH8faFa8/d
	VHaPwZrSPKpxVsxo0G6RqYu3OusnzYLFVpso2kOUdnFJM69Ooy2Q5fSN1azRLOXBOTYkL5Gow3sw5
	wNFguiAFKDNqh9qvgbKQL11Jx5fj4KRLTMbiVHSI1zsGLqd51sA/+qllPj7PnjWdm6BsaaR1RC+HY
	Vk/3CdHem4nct/JSmG0HxrFpZ9iHUn65MueKhr6UoQq+C41mojqGxO5zhpTb4zA6F1uOnszAtowOS
	oci9PaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjNG-00000009q7D-2ACB;
	Thu, 11 Jun 2026 17:39:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjNF-00000009q71-0ian;
	Thu, 11 Jun 2026 17:39:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B1BD407C4;
	Thu, 11 Jun 2026 17:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB501F00898;
	Thu, 11 Jun 2026 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781199564;
	bh=zecCFZ8Srn7GiJ4aEDliOVYKyOCo+jfQkMceICQfEXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tgf95f7oTSS3MaNiLsaHbRgvzIf0S9ca7hX2UT6P0d9HTH1KyIQsLIUwZ0uB4A3dR
	 K3rAOgo8Omp6Mi8GyxItsEKwz7uQOgF2gODKWfHyKhTsgxjj5eNzj2WSI355eSWmuA
	 4wkoA90TjXf+w3IF6Lwn2bitk2TpIydg00SuG71SK6dkf6peyXQM32ZnYg2azcJQTA
	 uknqvGfXCPZZiEU3nJdGYf9tSEuJVLHXVEMmGEMe32+UrER386OdKZs69GtyH1c364
	 qAOIhSdrAsUsVvyRuBGM378Y5/NxdN1CztJ9G0P0axYmXOLyURJQzck/KrKXR0RT2d
	 WmZ8QInRUgAsw==
Date: Thu, 11 Jun 2026 18:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Message-ID: <20260611-ungloved-snowplow-522e7c0b7a51@spud>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============5441836012363042068=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5441836012363042068==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VEw7ILEoyX+SpPI8"
Content-Disposition: inline


--VEw7ILEoyX+SpPI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 07:54:33AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add the hw-irq property for each GPIO bank and enable interrupt-parent
> for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.

Uhhhhh, what? Why can't you just use the normal interrupts property?

>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 5 ++=
+++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index b69db1b95345..65ec9121300e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -37,6 +37,8 @@ properties:
> =20
>    ranges: true
> =20
> +  interrupt-parent: true
> +
>  patternProperties:
>    "^gpio@[0-9a-f]+$":
>      type: object
> @@ -65,6 +67,9 @@ patternProperties:
>        gpio-ranges:
>          maxItems: 1
> =20
> +      hw-irq:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
>      required:
>        - reg
>        - reg-names
>=20
> --=20
> 2.52.0
>=20
>=20

--VEw7ILEoyX+SpPI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairyxwAKCRB4tDGHoIJi
0m/hAQCp/1LdXn73XJ882JgpI44MDQ6+BcDG0bj2pr1l/UPp1gEAgr7myM1tdKUn
TGrp5V8PbizLw4otN8AaIarajA+ocwM=
=e3OE
-----END PGP SIGNATURE-----

--VEw7ILEoyX+SpPI8--


--===============5441836012363042068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5441836012363042068==--

