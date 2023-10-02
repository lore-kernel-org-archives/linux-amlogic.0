Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C04E7490C
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVJeajhZ9AzgsOt0Pcde4yqORZJlVTeZeXnwar/TBbM=; b=lMbxLXVs+LYmc1lNbnHTbX/Nrl
	DwLm+zc17xgq0ro1ASNlgL0d6RINLvuq84Y6PIRiWCKkSw2bYXV5v0vt6k7IDBaKi+GZJfZmf5P0x
	E9cG578Y1hbP68oiyQ/r5RPkvgtvPlPzVerqAl7hdQXqFEMjCay0fDKJ+rR8HuNxYMP6kyFZTi5R4
	pOZ2vi3G9Ycr+RwvnAwA/XKUgXw7mmixhhkmHaCCSVWZWKo4+kZEPl9GpVz+0xNnHLQhUCXJSVsqz
	9Iffm0ZAXcdDk7xB27M7/hTmoDDmq1IbAheP1I5DAhYfz447iSyI8F7Ixi2BZRO5BYCCfxd0IrMC8
	y7ExdiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOar-00DI16-2n;
	Mon, 02 Oct 2023 19:28:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnOap-00DI0V-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 19:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 22F07B815E8;
	Mon,  2 Oct 2023 19:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE2C433C8;
	Mon,  2 Oct 2023 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696274913;
	bh=DTzvUs0KqeAyeGZdDVyKaq81DLkJ0Wi12W8H+fLzRaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTCg/LoAQIWzMEcNBiQE3bqpot0aKuijy6y3hhtsTP39ys8Rwn/9kCxVJ7ScY/s5q
	 p5nwVXzvEP8J87qlAfTWxSxn9hWzbmsbEbgkVhyDF+pI8AYHgN8aJYaZ9ZcgLVRq3G
	 HTU2NU//2/XcI2Jw8mGGYuCflfJXUZ6UgWWb2lt+ATGUpaHW/jz32NvV1wfbhPghSc
	 NdTE/nPXlof1lqKW0Sth9jGSwRC62NbZS9A3mKeIka6tgTTlrATQxwTg7HrsoKVkYR
	 ZX8SU8wd/Jx1g66GLLL8qz6ONEN0Viaxsk6NsHU/REuC7SKelc0tbh2/dWsVZJ/98e
	 TtMPrVbGEn6vg==
Date: Mon, 2 Oct 2023 20:28:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add libretech cottonwood
 support
Message-ID: <20231002-confront-footsore-f56df1d5781f@spud>
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231002141020.2403652-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_122835_572176_5668F077 
X-CRM114-Status: GOOD (  13.08  )
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
Content-Type: multipart/mixed; boundary="===============6809224117328990363=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6809224117328990363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SimhZxifrGJHd/f/"
Content-Disposition: inline


--SimhZxifrGJHd/f/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 04:10:19PM +0200, Jerome Brunet wrote:
> Add compatibles for the Libretech cottonwood board family
>=20
> Co-developed-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documen=
tation/devicetree/bindings/arm/amlogic.yaml
> index b7b0eda4164a..caab7ceeda45 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -155,6 +155,7 @@ properties:
>            - enum:
>                - bananapi,bpi-m2s
>                - khadas,vim3
> +              - libretech,aml-a311d-cc
>                - radxa,zero2
>            - const: amlogic,a311d
>            - const: amlogic,g12b
> @@ -196,6 +197,7 @@ properties:
>                - hardkernel,odroid-hc4
>                - haochuangyi,h96-max
>                - khadas,vim3l
> +              - libretech,aml-s905d3-cc
>                - seirobotics,sei610
>            - const: amlogic,sm1
> =20
> --=20
> 2.40.1
>=20

--SimhZxifrGJHd/f/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRsZ3QAKCRB4tDGHoIJi
0k1tAQCChJTIKr2OLLOiqbTzALOY6K7cO7F4Z1lKtxnGAyKePwD/U3Dkqeb0+IJA
R/7fMwjIzviUEVaOQCLLHG1V9kDEKg8=
=MQQl
-----END PGP SIGNATURE-----

--SimhZxifrGJHd/f/--


--===============6809224117328990363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6809224117328990363==--

