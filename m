Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF64C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK5M9OcarabJp3I3C5EgfrhZSahtBE4vfcEww0UZCw0=; b=A2XfKRyptyJ1F4c4wPEjTc/i9u
	ZDK603rBfDv30+kj6aCuOej/MpBGqcr6eogomKFx+ZzUXP4CzEKlpk2U0wdUjkYEpo0oz7uPM2rwb
	i5vp7+LRws+jxnGhwu5Wr/Q1rbvIIn0qwXHbr5qnS2/xLXTPjSiJNfFAiez2RGUDmtgRPL1QhZvbx
	gBbq7UYQuEBHhXVOc9eQ3VLxjS0EE5XCDNWCVmodEpbp2E+BbBrjdPpfFjKjxM9MxuMiXetxHjiD7
	dVAyVT2zgtBaTNhRudMbv10/5B4zvOjXb/iBA/9RpqFt0uLU7NeG/uH557jwG/T7gkNL0VA0CG847
	0zaBnA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8imQ-00BBHE-1U;
	Thu, 30 Nov 2023 15:16:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8imM-00BBGn-3A
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 15:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32C4461F39;
	Thu, 30 Nov 2023 15:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAAAC433C7;
	Thu, 30 Nov 2023 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701357397;
	bh=cg7d/rMg3I2RsFPBbUzQIS4hsFzEfYLgoptbAfC9TqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jC6E0aAcM/h8zOAIvwpIVcj1iDnJtDO73UOMNtVkX+lVIb5h3XHTDFoYsvhwIz7dF
	 eOjkHqXsNH19eIAuC22YjkHD7QZ9hgtXqA1MylD8Le9wvQ+t/8KRsPQ1ejoQaLe7Ag
	 CSfRst5jB3YOMrZvG9kslP6I+rob9EuVvXNJuhTAm3wWRYrhTXPfVowVyN6RCwfqSB
	 muHrWl3/RZUJU5L8BfnJXTIR6AvYRfu0QDrMC2eXK7VTMO++DpmrzPkxjs+dJipOwQ
	 ydM8mq4Zgaf2/I9JHwXB8BUvwH/Ezry8DGpScCQaXaOOfVKgSn6ZR5VT8L8T/6623M
	 zMYxiSr5rFqEA==
Date: Thu, 30 Nov 2023 15:16:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231130-twig-stoning-58235b3195c8@spud>
References: <20231130053130.21966-1-linux.amoon@gmail.com>
 <20231130053130.21966-2-linux.amoon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231130053130.21966-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_071639_105065_8F23E4DE 
X-CRM114-Status: GOOD (  22.38  )
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
Content-Type: multipart/mixed; boundary="===============7840085086725334561=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7840085086725334561==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lTL/T6EYqFtp7uZi"
Content-Disposition: inline


--lTL/T6EYqFtp7uZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:01:26AM +0530, Anand Moon wrote:
> Add the binding example for the USB3.1 Genesys Logic GL3523
> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> hub.
>=20
> For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> with shared resets and power supplies, this property is used to identify
> the hubs with which these are shared.
>=20

> [Conor Dooley: upgrade peer-hub description]

This should not be in the commit message. Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v5: upgrade peer-hub description : Conor Dooley
> [0] https://www.genesyslogic.com.tw/en/product_view.php?show=3D67 [Block =
Diagram]
> v4: Fix the description of peer-hub and update the commit message.
> Schematics of the Odroid N2+
> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121=
=2Epdf
> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> v2: added Genesys GL3523 binding
> v1: none
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
>  1 file changed, 61 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/=
Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index ee08b9c3721f..499192ea4074 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
>  maintainers:
>    - Icenowy Zheng <uwu@icenowy.me>
> =20
> -allOf:
> -  - $ref: usb-device.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -27,12 +24,46 @@ properties:
> =20
>    vdd-supply:
>      description:
> -      the regulator that provides 3.3V core power to the hub.
> +      phandle to the regulator that provides power to the hub.
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      For onboard hub controllers that support USB 3.x and USB 2.0 hubs
> +      with shared resets and power supplies, this property is used to id=
entify
> +      the hubs with which these are shared.
> =20
>  required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - $ref: usb-device.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,608
> +    then:
> +      properties:
> +        peer-hub: false
> +        vdd-supply: false
> +        reset-gpios: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,610
> +              - usb5e3,620
> +    then:
> +      properties:
> +        peer-hub: true
> +        vdd-supply: true
> +        reset-gpios: true
> +
>  additionalProperties: false
> =20
>  examples:
> @@ -49,3 +80,29 @@ examples:
>              reset-gpios =3D <&pio 7 2 GPIO_ACTIVE_LOW>;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        dr_mode =3D "host";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +            compatible =3D "usb5e3,610";
> +            reg =3D <1>;
> +            peer-hub =3D <&hub_3_0>;
> +            reset-gpios =3D <&gpio 20 GPIO_ACTIVE_LOW>;
> +            vdd-supply =3D <&vcc_5v>;
> +        };
> +
> +        /* 3.1 hub on port 4 */
> +        hub_3_0: hub@2 {
> +            compatible =3D "usb5e3,620";
> +            reg =3D <2>;
> +            peer-hub =3D <&hub_2_0>;
> +            reset-gpios =3D <&gpio 20 GPIO_ACTIVE_LOW>;
> +            vdd-supply =3D <&vcc_5v>;
> +        };
> +    };
> --=20
> 2.42.0
>=20

--lTL/T6EYqFtp7uZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWinUQAKCRB4tDGHoIJi
0oBYAP9EyD0nfaT0/sje8xRsy43bcV3tjUrZMC7tQBdSN1URWwEAj3HN3gY9KtkI
O/bdedDkZGY3dMMNQVG2guKxWaU4+wo=
=yrvD
-----END PGP SIGNATURE-----

--lTL/T6EYqFtp7uZi--


--===============7840085086725334561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7840085086725334561==--

