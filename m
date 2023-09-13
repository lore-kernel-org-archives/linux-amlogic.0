Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD01EDEC63
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Sep 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX4JU7ifJttRETDv7zGNbzqNueEnpm2LlZRpuUA+zY0=; b=NflQBmlmu/wp6F1py7olgEKqLh
	8Hm+vXrC+cUg482VzTZO30/bmwG+1gKK8sW1gcCw33k912Wz8I2MQlrhBcO1ToNfR/Uvj1+FAdO/R
	K6TxFJDCEAMNeH2HDSEKgfU9YaBLzhYGRdXeB6xbDiC/Zn3774GEG67SPgLVFXo8bYJJYiMv6x1Kd
	5aRJWfkDef/FNbVCMzyR8ePUGzY1qlM6DkJSqmkLpfDskVD0xs/fXyLmkA4y6dn52+YihcPtLKQ6P
	EANjwahnWMPFegJUosiHhhBgPJtU7FuIueo4QnJR7yiVc/xCqEsYTm/d3+tWXNkgSPXG9b7JXCSMR
	WAls8V6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQv0-0067ax-1L;
	Wed, 13 Sep 2023 14:32:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQux-0067aR-1F;
	Wed, 13 Sep 2023 14:32:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9B1861978;
	Wed, 13 Sep 2023 14:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B19FC433C7;
	Wed, 13 Sep 2023 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694615554;
	bh=Y53NxREibvYmBz2vfCqHcEx9GPOsX6DY5l6vzt940dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMeipzYu8L+1XIenZP7DKl+iDaWvafcSekoBCH5P+H5QJd9afsmD8q8yatAdVJN2d
	 j18CG1FMVr6PMqZW+XfV9vMtNu8agt223gcWaImixT9LPFZBqEe+syTUvbhxfun+Ym
	 RjA86tqGA8/NTLJ2DcCi08FcopZjHOximfIsYxEvPuJLbLUG6jyLBT2oGocwOW5+mG
	 n59S4HfUnPHXVhrhGjJOora8EF26lv5uZV4BFj3z2PfDYV4vAdftHx18F2s2InMTBN
	 BSa6dGIgHi6qKQxnU+mvJOzNWpbIAaSQZnONLqRzBFqPqlNvRTnN7/2S2NHfsxyPxr
	 y5bdWmiawABJQ==
Date: Wed, 13 Sep 2023 15:32:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add support for
 Amlogic-T7 SoCs
Message-ID: <20230913-sizing-attest-bc9bf7806306@spud>
References: <20230913080924.3336391-1-huqiang.qin@amlogic.com>
 <20230913080924.3336391-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230913080924.3336391-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_073235_489233_7736AA59 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: multipart/mixed; boundary="===============0898081528747420106=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0898081528747420106==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VOmdbYbGR3AGKron"
Content-Disposition: inline


--VOmdbYbGR3AGKron
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 04:09:22PM +0800, Huqiang Qin wrote:
> Update dt-binding document for GPIO interrupt controller
> of Amlogic-T7 SoCs.
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlog=
ic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/amlogic,meson-gpio-intc.yaml
> index 3d06db98e978..a93744763787 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meso=
n-gpio-intc.yaml
> @@ -36,6 +36,7 @@ properties:
>                - amlogic,meson-a1-gpio-intc
>                - amlogic,meson-s4-gpio-intc
>                - amlogic,c3-gpio-intc
> +              - amlogic,t7-gpio-intc
>            - const: amlogic,meson-gpio-intc
> =20
>    reg:
> --=20
> 2.37.1
>=20

--VOmdbYbGR3AGKron
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHH/AAKCRB4tDGHoIJi
0vdLAQDhN+3/ZepNIgLkq5NdctyuWtIFnzY2V898IUjqdLpOFgEA+b4BpWtwDoZl
ZiVZmBgQdzvDgKXokrZZbCfwUvd6Zg4=
=5xuz
-----END PGP SIGNATURE-----

--VOmdbYbGR3AGKron--


--===============0898081528747420106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0898081528747420106==--

