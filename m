Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A1F588F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNaomNkPkxAS23LUWjUpzm/LDdjvLOB4vJatk8I+zmM=; b=URcfXNei1LKzm01MxwuXkawf1R
	YuTepos4D/gWDVbDhfPwXJgnkkQjE4/SUES1jNep4mfLvdwa2z6HKlM1tc67DHwjvNdFDOMACiW/X
	s9A65l8VBN0+D0xVHfrYwv3Fq7Drwye11kXcaZvAB0kALhK+YrsCFzcYCC1gFT1Riu5OYLzScWyA/
	WwvtE8achUoytLvGkNWq3d7DQCCg0sJsrZg4xMA5bF00qrzHhfAymdyS6D4K0BHvXYSqU85Y/v8xu
	fKpYSmoD1nbIwyeQepNMWQBiPY++BqxsbEKVs/3GoEAjmp4yqzQnUiFfdZ5IxGSCEpXnqywY2vARY
	c8cTarsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErOg-00000007Pzc-0Cqs;
	Mon, 20 Apr 2026 16:22:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErOe-00000007PzC-0Jku;
	Mon, 20 Apr 2026 16:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6298444400;
	Mon, 20 Apr 2026 16:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2870EC19425;
	Mon, 20 Apr 2026 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702171;
	bh=YEdo/V0QTAr+NW2dlqYidtGFQZDQxJkbLKbUxoyQ7yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxTKj7PlWluEqHuKTzEen462dAfrv0zZY9/iW/KTchxzdbie0xAcn49tOEIN3vpM5
	 aGzG0ZJn1mUsntJEkhTrtI3/I5Dz7AvBultI6l5O9IapBABCmY+15Cnw7cVQIQjn2B
	 uA9xZr93tge3LmcQ+Dz/swtlU+pjx44PshwqpOyyyHC8qWN1NSXlRQXv54p58pOwlZ
	 1hAXJgHCOBRBt921Q/hIosqWUL1VxjxxrAyohHXLmZ9/EP8WAd3oFDvfXgyWo/AgJ8
	 hhjg/J1tsBpcEJeSnJfk97FV7kmABYjkdDcVFhmJ1OEGlYpXuP2DYoKnfJkEnwiqjq
	 nSpyLSq0InXRw==
Date: Mon, 20 Apr 2026 17:22:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
Message-ID: <20260420-viable-plot-862e0c545837@spud>
References: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
 <20260417-add-mcu-fan-khadas-vim4-v3-1-a6a7f570b11b@aliel.fr>
MIME-Version: 1.0
In-Reply-To: <20260417-add-mcu-fan-khadas-vim4-v3-1-a6a7f570b11b@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_092252_204248_C55F9EF2 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: multipart/mixed; boundary="===============1809514889964111226=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1809514889964111226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EN5NAUw4RNBry5U5"
Content-Disposition: inline


--EN5NAUw4RNBry5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:27:17PM +0200, Ronald Claveau wrote:
> The Khadas VIM4 MCU register is slightly different
> from previous boards' MCU.
> This board also features a switchable power source for its fan.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Docu=
mentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5a1fd..a80718f7595ce 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - khadas,mcu # MCU revision is discoverable
> +      - khadas,vim4-mcu # Different MCU variant, not discoverable
> =20
>    "#cooling-cells": # Only needed for boards having FAN control feature
>      const: 2
> @@ -25,6 +26,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  fan-supply:
> +    description: Phandle to the regulator that powers the fan.
> +    $ref: /schemas/types.yaml#/definitions/phandle

Can you limit this by compatible please?
pw-bot: changes-requested

> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.49.0
>=20

--EN5NAUw4RNBry5U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZS1AAKCRB4tDGHoIJi
0rq6AQCyNe1h3KXPOtFS9t3ntlaZUO80Ck84GL+I6mmU6358DQEA0hx/x6pQ5aO7
RXk37eL/R10YB9DDqs+wJN/2TnZoxgw=
=ak6Z
-----END PGP SIGNATURE-----

--EN5NAUw4RNBry5U5--


--===============1809514889964111226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1809514889964111226==--

