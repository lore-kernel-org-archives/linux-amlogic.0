Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0467EC61D97
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYtFg84TBhH5LTn4jCfwyCHHv1xtkwkNoQtEYBRjBOM=; b=HvcEciWhGG3+dMYSUSo5bz4G13
	sQbuTX4JXFi6VyDj2wL7iHC7ReU3mQbrS+orgWpoaAe5t/7OvTUZRj9sF9reRFFkegJ5gAUyyL2g0
	bW5/4UG0VfbJ2W8Or6i3K66NuE//k2PTVZw6E5zmOdCUjfQYt+FgJ6vUcrIbD+Mko74bTkKjRemVt
	uxtIRfbRbcsNFR/Q6A7LVK0AmjCVDlTPDZZQdAs5f14EXtsq8RFqA/fuHtdWFEXxt2u7szJh4f/A/
	md9C5YfUSintk3B1zpkVQ/SOgmhb0geR0VXDTdmg/y1m4rP5WgxjRrYclCw3ePk4LoaXHynHVxkx3
	GQFApb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DwN-005TKQ-2M;
	Thu, 23 Nov 2023 17:56:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6DwK-005TK2-1n
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 17:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAA2C62406;
	Thu, 23 Nov 2023 17:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18489C433C7;
	Thu, 23 Nov 2023 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700762195;
	bh=lC5W7+Qr59rnhc4Jd20Dtf/HPxOyflR9v5IaOt+MbeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/B7Gq1PllfFYKi98tzgiIqm+eO8BZesekeW8ePGYfCsbyloLFTgwLYSMxT0530wP
	 H+Ssfwp7bfx7zSXZXctFO9WA2fgL4RZtdO4hwFVdj1iS8t0ocJK8PDzdsrSGx/UgGg
	 +uYFgEbpmzyah8WMmmzafyGLP5qVL3SLqobMJT9e+1kRv6bo9A45xCVRvSEEiclAEu
	 rgTVTc4Gk3NQXt2cdrah+ibIjM9o1cXXnbOc6LDcLWz4fbWs8vbR/bdsCe2gUDlLkY
	 rIPZ5h3uIJyKH1ayQ8BjtoS0oOo4Oq1n8NhuKi8G2pctnkhgv86pASLLIBJc6sL1ds
	 iftxVyWj3Dl2Q==
Date: Thu, 23 Nov 2023 17:56:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
Message-ID: <20231123-skeletal-smirk-390543e2d6ab@spud>
References: <20231122182351.63214-1-linux.amoon@gmail.com>
 <20231122182351.63214-2-linux.amoon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231122182351.63214-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_095636_677605_D368CDA2 
X-CRM114-Status: GOOD (  24.00  )
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
Content-Type: multipart/mixed; boundary="===============5369422359423929265=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5369422359423929265==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V1sQe/A91J5XE2J3"
Content-Disposition: inline


--V1sQe/A91J5XE2J3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:53:46PM +0530, Anand Moon wrote:
> Add the binding example for the USB3.1 Genesys Logic GL3523
> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> hub.
>=20
> Onboard USB hub supports USB 3.x and USB 2.0 peer controllers.
> which has a common reset pin and power supply.
> peer-hub phandle each peer controller with proper gpio reset
> and help each peer power on during initialization
> and power off during suspend.
>=20
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v4: Fix the description of peer-hub and update the commit message.
> Schematics of the Odroid N2+
> https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121=
=2Epdf
> V3: fix the dt_binding_check error, added new example for Genesys GL3523
> v2: added Genesys GL3523 binding
> v1: none
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 67 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/=
Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index ee08b9c3721f..bc3b3f4c8473 100644
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
> @@ -27,12 +24,48 @@ properties:
> =20
>    vdd-supply:
>      description:
> -      the regulator that provides 3.3V core power to the hub.
> +      phandle to the regulator that provides power to the hub.
> +
> +  peer-hub:

Should the property not be "peer-controller"? Your description refers to
them as such.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      onboard USB hub supports USB 3.x and USB 2.0 peer controllers.


> +      which has a common reset pin and power supply.
> +      peer-hub phandle each peer controller with proper gpio reset
> +      and help each peer power on during initialization
> +      and power off during suspend.

I generally hate to talk about non-native speakers grammar etc, but what
you have here is in need of a lot of improvement. The below is my
attempt to understand what you are trying to say:

"For onboard hubs that support USB 3.x and USB 2.0 controllers with
shared resets and power supplies, this property is used to identify
the controllers with which these are shared."

Also - this is one particular system, what prevents there being a hub
that has more than 2 controllers? Also, as you insist that this is
generic, and not just for genesys, should this not be defined in a
common location?

Cheers,
Conor.

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
> @@ -49,3 +82,29 @@ examples:
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

--V1sQe/A91J5XE2J3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+STgAKCRB4tDGHoIJi
0mwwAP9s9qmiSd8TgU4ApJa6D+1a7mUjwbwVn5y9j9brD7RfmgD/bZI//2gN6ZT9
CAdWofSmLE0P+12w0jvV05yM8LwnvQE=
=yviR
-----END PGP SIGNATURE-----

--V1sQe/A91J5XE2J3--


--===============5369422359423929265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5369422359423929265==--

