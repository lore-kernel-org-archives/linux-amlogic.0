Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C6CEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoRxFkPquRZgB4N74N0S8AHoeUgVcgwbO4Vd2aJ9lMs=; b=mMumK1eAWsL51CeCWGbOPCAVPA
	e2JgXsN9zBb+FV9l+ZIh9nBgITS2Y5q3WSeCQh9ZnrZPkaqkvdqL+9M3MJGVXKwFoQB1c9PD05QCU
	RN+6Yv2cfLeiUO6z9Fcdg41pFG/OlGSQT4Qc0E4VPpQC/ywd8vdI7K2ea05wFp1V4rIcE2+jzTcZz
	ejFazK9k53nWnwqrfBZBCIxMRoUPci0zsSwd/fKAs4XZ572kWaLuUM8L9+fTWk1rxHtKA+kSCb9pN
	GdcH8Pfs51DHyd9ZANSYvYkQTxd6cIKEcN/CYJktLjkgd/kF8ss4dEJZc5iklcxhPLFwlSLIG71cv
	7p21yiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItuD-00CD4f-0j;
	Mon, 10 Jul 2023 16:38:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItuA-00CD3n-1R;
	Mon, 10 Jul 2023 16:38:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21B9F6111C;
	Mon, 10 Jul 2023 16:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B7FC433C8;
	Mon, 10 Jul 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689007108;
	bh=Fxz8+nz1c9dZXZma3dpEF6OCZwk8mfyDi3Fn7q3yb6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2rwe0dIJi6Odn6hhVbJn1ebHX7biXrlxpuc0rCtXdGislVv1WZL5Z0eaYB/1/VAO
	 jbEFVocdwTH5AbDrGDNU0yb8jnSHxLWaTtKIGwa4t+VOMvitXWNLvQY4ReGCAtrBBY
	 8zPb6834EEx4wm7vrDaggdezvdjB80uNotA/WUMyMz4MIbuW0ce5DlVn8wER3I+akK
	 XwQyl1JMUwZhp9WQLHX41GNosgYFyByvy/Zs2J7hhDOJNpoiNBPBgaSa9MG/i8pz6J
	 hlCietG1zatWWEDU+qLnfwvOHQ9ZBL1VI/fy1VVMKOD9e7L9R9ZqBM3XH2ebR/i1Tp
	 CqEC41blvM9SA==
Date: Mon, 10 Jul 2023 17:38:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	brgl@bgdev.pl, andy@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: gpio: Add a header file for Amlogic
 C3 SoCs
Message-ID: <20230710-maybe-mantis-e647d94fd13a@spud>
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
 <20230710042812.2007928-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230710042812.2007928-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_093830_591089_E3B9518E 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============1249418482491585196=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1249418482491585196==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j5AdCmeQS6DzLf1m"
Content-Disposition: inline


--j5AdCmeQS6DzLf1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 12:28:11PM +0800, Huqiang Qin wrote:
> Add dt-binding and related header file for Amlogic C3 GPIO.
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |  1 +
>  include/dt-bindings/gpio/amlogic-c3-gpio.h    | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinc=
trl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinct=
rl-a1.yaml
> index 99080c9eaac3..e019b6aa6ca3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.=
yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - amlogic,meson-a1-periphs-pinctrl
>        - amlogic,meson-s4-periphs-pinctrl
> +      - amlogic,c3-periphs-pinctrl

Alphanumerical order here perhaps?

>  required:
>    - compatible
> diff --git a/include/dt-bindings/gpio/amlogic-c3-gpio.h b/include/dt-bind=
ings/gpio/amlogic-c3-gpio.h
> new file mode 100644
> index 000000000000..75c8da6f505f
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic-c3-gpio.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */

Any reason to deviate from the usual license terms for bindings, which is
"GPL-2.0-only OR BSD-2-Clause"?

Cheers,
Conor.


> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_C3_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_C3_GPIO_H
> +
> +#define	GPIOE_0		0
> +#define	GPIOE_1		1
> +#define	GPIOE_2		2
> +#define	GPIOE_3		3
> +#define	GPIOE_4		4
> +
> +#define	GPIOB_0		5
> +#define	GPIOB_1		6
> +#define	GPIOB_2		7
> +#define	GPIOB_3		8
> +#define	GPIOB_4		9
> +#define	GPIOB_5		10
> +#define	GPIOB_6		11
> +#define	GPIOB_7		12
> +#define	GPIOB_8		13
> +#define	GPIOB_9		14
> +#define	GPIOB_10	15
> +#define	GPIOB_11	16
> +#define	GPIOB_12	17
> +#define	GPIOB_13	18
> +#define	GPIOB_14	19
> +
> +#define	GPIOC_0		20
> +#define	GPIOC_1		21
> +#define	GPIOC_2		22
> +#define	GPIOC_3		23
> +#define	GPIOC_4		24
> +#define	GPIOC_5		25
> +#define	GPIOC_6		26
> +
> +#define	GPIOX_0		27
> +#define	GPIOX_1		28
> +#define	GPIOX_2		29
> +#define	GPIOX_3		30
> +#define	GPIOX_4		31
> +#define	GPIOX_5		32
> +#define	GPIOX_6		33
> +#define	GPIOX_7		34
> +#define	GPIOX_8		35
> +#define	GPIOX_9		36
> +#define	GPIOX_10	37
> +#define	GPIOX_11	38
> +#define	GPIOX_12	39
> +#define	GPIOX_13	40
> +
> +#define	GPIOD_0		41
> +#define	GPIOD_1		42
> +#define	GPIOD_2		43
> +#define	GPIOD_3		44
> +#define	GPIOD_4		45
> +#define	GPIOD_5		46
> +#define	GPIOD_6		47
> +
> +#define	GPIOA_0		48
> +#define	GPIOA_1		49
> +#define	GPIOA_2		50
> +#define	GPIOA_3		51
> +#define	GPIOA_4		52
> +#define	GPIOA_5		53
> +
> +#define	GPIO_TEST_N	54
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_C3_GPIO_H */
> --=20
> 2.37.1
>=20

--j5AdCmeQS6DzLf1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKwz/wAKCRB4tDGHoIJi
0rEIAQCP3MeY9QpZ837QyziushD+wG7oQQH+/bUiJFdErQw1eQD/UHA++uo9GhtN
+J3t+px8WOPw2tOaHLK0z5Ew8Kf+wg0=
=vmZA
-----END PGP SIGNATURE-----

--j5AdCmeQS6DzLf1m--


--===============1249418482491585196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1249418482491585196==--

