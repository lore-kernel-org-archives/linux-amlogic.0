Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00EDEB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 21:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drbT6s6gfbkxGRLgD1V2k21oF1OZVptGar5nOFx2Emg=; b=t622Qf4hV0Foh6o5qCwuzZcayi
	eq6I7n7MbSO9zQSt/uuiQ9dur2lmpI20uaPsXaDBZ8oOPivMiFvjIhS/PFcVdiPN0igArw+Q+qvQm
	1GnlHW7AttIb+Wn5r635VyunsChTsHoOlZLbH9BuDeNsVDxJ154oOIL2Luz+YbGkeES/+PTjCgfdV
	EqJffZfn4sdA/q+r43T3EWPTV/Df/OTXVHnZMWY4feUfsTyWA5Gv8VB0iC4ALYnY2Q0Xx/nmSTx68
	zTXLv1LmGN/ipv3dG9xOg7XC94PxgHg8IriwOhg9C5NoLdfL6Lfy/a8UssR1z+B1ml/fw080ZNt87
	bLRdbKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9lr-00H6Og-0E;
	Wed, 05 Jul 2023 21:10:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9li-00H6O6-0T;
	Wed, 05 Jul 2023 21:10:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 962B261750;
	Wed,  5 Jul 2023 21:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBA8C433C7;
	Wed,  5 Jul 2023 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688591433;
	bh=n2jgw51oOqSn4DZGTFd2enJxejq0SGh6zPoLj4QBa2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4YRd/P4b0xBGtl+HKyhU0UwFhwL1znKUu3F9E/nnPxXcYaDmYZo2z1Nee7kETmLx
	 lGb4g3mmhsHL5MqjFkUdAPbHJx3Vu1KEL7DPyec0LVnxz1zWd0gjZ5J1S8Q17n3r+C
	 zE9O2UqHY2qkWg1Tud8EzTY3sjFHZveAJE73dGQY7tug9JNpqnAeQ2bhK3ab7TZBKI
	 8+QgfmFjLOjzsbMdrPvxU0Xd5i0hVTch+cCiezXQz87sYjjxA9jurKoJiBpj+M/vmx
	 uAac8ugCdS/BiumCWdgDAvpq+AWbs+EmJMTUZXQQAvU5o8EDIaRETl9iMIuNLhm4wa
	 0opmVGwVy9bYw==
Date: Wed, 5 Jul 2023 22:10:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, jbrunet@baylibre.com,
	jirislaby@kernel.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kelvin.zhang@amlogic.com,
	xianwei.zhao@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/7] dt-bindings: serial: amlogic,meson-uart: support
 Amlogic A1
Message-ID: <20230705-broadly-hyphen-de6a1eb0058b@spud>
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
 <20230705181833.16137-7-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230705181833.16137-7-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_141034_306284_32B0792F 
X-CRM114-Status: GOOD (  14.52  )
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
Content-Type: multipart/mixed; boundary="===============8350861961415587044=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8350861961415587044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NUg9anPJgPseBrgZ"
Content-Disposition: inline


--NUg9anPJgPseBrgZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 09:18:32PM +0300, Dmitry Rokosov wrote:
> Introduce meson uart serial bindings for A1 SoC family.
>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Looks like there's a missing Ack here from Rob:
https://lore.kernel.org/all/168858360022.1592604.9922710628917242811.robh@k=
ernel.org/

Cheers,
Conor.

> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.=
yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 01ec45b3b406..f1ae8c4934d9 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -33,6 +33,7 @@ properties:
>                - amlogic,meson8b-uart
>                - amlogic,meson-gx-uart
>                - amlogic,meson-s4-uart
> +              - amlogic,meson-a1-uart
>            - const: amlogic,meson-ao-uart
>        - description: Always-on power domain UART controller on G12A SoCs
>          items:
> @@ -46,6 +47,7 @@ properties:
>            - amlogic,meson8b-uart
>            - amlogic,meson-gx-uart
>            - amlogic,meson-s4-uart
> +          - amlogic,meson-a1-uart
>        - description: Everything-Else power domain UART controller on G12=
A SoCs
>          items:
>            - const: amlogic,meson-g12a-uart
> --=20
> 2.36.0
>=20

--NUg9anPJgPseBrgZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXcQwAKCRB4tDGHoIJi
0kUgAQDA95EfCnFuUU2bDSw86Ab1mLQG0Nbq74Hh2Ss1+NO5ZgD/Uk4aj8bCi0rC
8PY85RrvoNH02RyBYPrxMpLdfi1bUgE=
=igVN
-----END PGP SIGNATURE-----

--NUg9anPJgPseBrgZ--


--===============8350861961415587044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8350861961415587044==--

