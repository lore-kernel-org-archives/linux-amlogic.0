Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697CFC52D7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uadJB1H3+qFMw1lbl/w1+cgPHVjnZb61Hhx3UCPSExE=; b=WxRAAEnjQWdhXlgRm25FIGPbRP
	1ujGzfSmw1MImZmWls/SJULBPz80J0Gl56cZlU2ouBOsx6DIMXOwE+DT/DIo1/6lUYDGtgY5217B3
	b3Iobs1pVS81I1IWbjNdOfDhxOW1w2D4GeHbtjyMN/QJWoJNLM+Bytv4Y44BawBMgHJRY9aeuUZB3
	XOvhlEN7MW8rz29TowNZGBV29mArG0mR7m430pVOD4OAGetnGBr7A9FM40UrY9y8Lt/LTSqeX1rPZ
	rmNRy3OtGM9zpOstjW/6F1wDxERQzZgOW693y8f92SJ5Ac20tJKEb3n1puwTku1dTP6lJ20r5UQFV
	zFLczIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWZo-0000000HP45-1ls1;
	Fri, 23 Aug 2024 15:51:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWZH-0000000HOxg-2bEl
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Aug 2024 15:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA175CE10DC;
	Fri, 23 Aug 2024 15:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04A3C32786;
	Fri, 23 Aug 2024 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724428272;
	bh=UJ8y9SbdyQJ2cpOyfwD7iZtYNXEMcqBlR4gxzqHEGxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bP/gAoXfI7Pog1TUdgOKN8s4SexOQTEN3/DKLmgzdIN7SXK+xlz+Cthyv9su1mGGk
	 fMvwB1aVkboO3i9jKv4q2NL7YTh5eK+mlVgbJgFfmKJAJFkXMoR36JaAJ7kbwe6H/C
	 ovTT++QqSEY9UCr8rwN/AIWGL0X4uiWDGyQir2eqwnWUY2voEpnJ5tADF8YPdq+lWC
	 +W2ehjaR780BCokbQUzzqXlyMBjCY9EdItqnv6IdArAecyDWh+Y2D58x5m/94jPH8Q
	 U8jjy+ZeqMBnk/nvj2fLQyAx7wS3yUpvjez5KbQYigJ9n+Y6MlMvfUxBhyOqvrvx/7
	 pB6uqMUfCqB/w==
Date: Fri, 23 Aug 2024 16:51:08 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
Message-ID: <20240823-rotunda-machinist-4f8dabbff479@spud>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-1-6f70381da283@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240823-rtc-v1-1-6f70381da283@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085116_032079_455F1030 
X-CRM114-Status: GOOD (  18.62  )
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
Content-Type: multipart/mixed; boundary="===============7670884371736880046=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7670884371736880046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pFpN10RskjPDX7Mw"
Content-Disposition: inline


--pFpN10RskjPDX7Mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 05:19:44PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Yiting Deng <yiting.deng@amlogic.com>
>=20
> Add documentation describing the Amlogic A113L2 and A113X2 rtc controller.
>=20
> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
> new file mode 100644
> index 000000000000..fa3d7838022e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml

Filename matching a compatible please.

> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Real Time Clock controller include a4, a5
> +
> +maintainers:
> +  - Yiting Deng <yiting.deng@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +description:
> +  The Amlogic new chips used RTC module.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,a4-rtc
> +      - amlogic,a5-rtc

The names you have chosen here do not match the patch description. What
is going on there?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RTC clock source, available 24M or 32K crystal
> +          oscillator source. when using 24M, need to divide 24M into 32K.
> +      - description: RTC module accesses the clock of the apb bus.
> +
> +  clock-names:
> +    items:
> +      - const: rtc_osc
> +      - const: rtc_sys_clk

s/_clk//, they're all clocks.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    apb {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        rtc: rtc@8e600 {

And the label here can go, you've got no references to it :)

Thanks,
Conor.

> +            compatible =3D "amlogic,a4-rtc";
> +            interrupts =3D <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
> +            reg =3D <0x0 0x8e600 0x0 0x38>;
> +            clocks =3D <&xtal_32k>, <&clkc_periphs 1>;
> +            clock-names =3D "rtc_osc", "rtc_sys_clk";
> +        };
> +    };
>=20
> --=20
> 2.37.1
>=20
>=20

--pFpN10RskjPDX7Mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsiv7AAKCRB4tDGHoIJi
0pRTAQCos2kfCyu1HmMLs3vUDMHuAt4FObAjJDqXmI50lj4prAEAoCkTanOgaIFf
mgPp56m+d+FLEo2EuVyr4VMVi4sgkAo=
=N36O
-----END PGP SIGNATURE-----

--pFpN10RskjPDX7Mw--


--===============7670884371736880046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7670884371736880046==--

