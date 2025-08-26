Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A26CA0FE7
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Aug 2025 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiCNNoAiYpyzpA9X4Sv5lfDRgpvUPenRahAkTJ9C+A8=; b=ACNFo6aYBNrZSGpmQJdZ8fQiw2
	fI+rF0MflvHQmKS4lh+4BNuZVagOggRduTHYy+MgRNMsy7E9Whah5sc2pYc3wrBCjTkrJ2VjXtptE
	9NTzQDtAk9wON4QViu32fpNB0f4AlbhD8qp4qS1Vqk5sZjd/ZdY8SsD8FSHRdEx5q8yqOXvTRkQKH
	dXwmn7KGY1BatOEIOpv+Lr/DCrMxHKs6t8pQR8SyxDf9Alt7VwWExZkEKSi9UBAMTkAznmt2TqYrw
	iLb+6TOX42EjVIEjxHFilHqfmod//l7RHFaXdI5QJPCnsAR4ZtJnB3GaavFRxFNc6MepyxSHEoS2v
	sKukoLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxpY-0000000CoMb-3SBF;
	Tue, 26 Aug 2025 17:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxpW-0000000CoLc-1ABq
	for linux-amlogic@lists.infradead.org;
	Tue, 26 Aug 2025 17:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0696943C99;
	Tue, 26 Aug 2025 17:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72F2C4CEF1;
	Tue, 26 Aug 2025 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756230693;
	bh=5OG0CFSumhwO6LPpaT7Nwl9tbfKtGy7nJSNDdcsM6Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBIWB8CfNuqO2Xt04dr1deTArEr1hsWTPwg3F+HkeDvfDwssE5q+kkFSD6kSTleEN
	 00d6M0WcGX5tfcuEb1jeRM4FhRpA1iVofSqHon/UJK8jDClHQAHt/XiSWvt6ofRRRV
	 P54jx5TwCo9IRGFD21Xt7eUWwpkaVRVhov8z8dWtJTjrbv8lQTJr7GxD0uxxNdrITF
	 Ewpw0B3LnGgv0+qIJeWk+4nwUn6zF7bU71y3GZHEnkWGofxwqw3bATe3mHa1LoUaD+
	 pBBYsBR2/A7eREM5xY6JjyJQP8jTH46SanN4fy90/GdhJPIgLp+DGPTga2bvrROvZL
	 +WxtkIB0brobg==
Date: Tue, 26 Aug 2025 18:51:29 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: add Amlogic A113L2 SFC
Message-ID: <20250826-scratch-cleft-a3f7b36a3cb5@spud>
References: <20250826-spifc-v3-0-7e926041d7f6@amlogic.com>
 <20250826-spifc-v3-1-7e926041d7f6@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250826-spifc-v3-1-7e926041d7f6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_105134_356995_C6E8D9A4 
X-CRM114-Status: GOOD (  20.40  )
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
Content-Type: multipart/mixed; boundary="===============3549248208329434463=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3549248208329434463==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nV4lczYBtuhRtLNv"
Content-Disposition: inline


--nV4lczYBtuhRtLNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 10:10:09AM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Feng Chen <feng.chen@amlogic.com>
>=20
> The Flash Controller is derived by adding an SPI path to the original
> raw NAND controller. This controller supports two modes: raw mode and
> SPI mode. The raw mode has already been implemented in the community,
> and the SPI mode is described here.
>=20
> Add bindings for Amlogic A113L2 SPI Flash Controller.
>=20
> Signed-off-by: Feng Chen <feng.chen@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  | 82 ++++++++++++++++=
++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml =
b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
> new file mode 100644
> index 000000000000..80a89408a832
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/amlogic,a4-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI flash controller for Amlogic ARM SoCs
> +
> +maintainers:
> +  - Liang Yang <liang.yang@amlogic.com>
> +  - Feng Chen <feng.chen@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +description:
> +  The Amlogic SPI flash controller is an extended version of the Amlogic=
 NAND
> +  flash controller. It supports SPI Nor Flash and SPI NAND Flash(where t=
he Host
> +  ECC HW engine could be enabled).
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,a4-spifc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock apb gate
> +      - description: clock used for the controller
> +
> +  clock-names:
> +    items:
> +      - const: gate
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  amlogic,rx-adj:
> +    description:
> +      Adjust sample timing for RX, Sampling time move later by 1 bus clo=
ck.

By 1 bus clock? Or by up to 3? I'd suggest rewording this to something
like "Number of clock cycles by which sampling is delayed" or along
those lines.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sfc0: spi@fe08d000 {
> +      compatible =3D "amlogic,a4-spifc";
> +      reg =3D <0xfe08d000 0x800>;
> +      clocks =3D <&clkc_periphs 31>,
> +               <&clkc_periphs 102>;
> +      clock-names =3D "gate", "core";
> +
> +      pinctrl-0 =3D <&spiflash_default>;
> +      pinctrl-names =3D "default";
> +
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      flash@0 {
> +          compatible =3D "spi-nand";
> +          reg =3D <0>;
> +          #address-cells =3D <1>;
> +          #size-cells =3D <1>;
> +          nand-ecc-engine =3D <&sfc0>;
> +          nand-ecc-strength =3D <8>;
> +          nand-ecc-step-size =3D <512>;
> +      };
> +    };
>=20
> --=20
> 2.37.1
>=20
>=20

--nV4lczYBtuhRtLNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK30IQAKCRB4tDGHoIJi
0mnBAP9q21gLzy77xyCZZSJg4XByZEMOe0XHyHUr6l/8gLQX/AEA5uxdEN8+9653
Kjgpi+dqVC4/8HIBfELwg25BaNiapwM=
=qzT9
-----END PGP SIGNATURE-----

--nV4lczYBtuhRtLNv--


--===============3549248208329434463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3549248208329434463==--

