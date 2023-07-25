Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C743C0015E
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jul 2023 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpb7g+JN6snIOQKJD2rOFKhiGgHxiP6SR2nDXU95dOM=; b=0i4z2nvmsewdUDjoKCx2ZhzAEM
	Al3ykyJ5VWNzM+p3Fvr4xnQo9pXWJbfj/g/RkxJOcr5kxOgb/2QDxGMFWiij5Ge/2Y7A7KFFNeYbr
	MtzgFPh3aTSqUxahxlHh/e00hx4XAEuxbmXELqsM+f1QZdETqXrHpPxC7XgeY7EUaLWxy4EUPsoaC
	ZTslPcp3GhlO6BHf9jb7F3Bl724QENUPm68YQAzzNqcwysIiVosaOG012O9RS+nR5Dtpl8M1DRvL6
	MfeCPJVQ+ofHtmYmUNzHvnObxGLZDUgqh0ZTaaq385hmhsM38KbO0Mz+Z8iBf7KPce8qxfdSjdK+a
	lE6gzB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOMXx-008EyH-09;
	Tue, 25 Jul 2023 18:14:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOMXu-008Exc-26;
	Tue, 25 Jul 2023 18:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E403961648;
	Tue, 25 Jul 2023 18:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83D9C433C8;
	Tue, 25 Jul 2023 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690308845;
	bh=WmpVtUDAaFLbImnOsO4tYnjeeSG53usXX5FWGAehNd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8ezkXSL801Ko1HRqyb2qFQK+UcKw2H641PFM/9vIeVLmyMou0D106OI4NFQEZ1p4
	 /DyaNKE7Pu9FX4QwH+vN2thu5DgN8Ve3dcfVdsTAbbAcF8cFvgNG7tcVZYGbcD1t9G
	 6Smtu8orEyPEEtHy2IvTwqzpX2nDqTPRbppjr56cFMvBvmC6cJvl95eXVzMmkijGJS
	 WBfCddw8V6I5gL/NKfbrUHm+EWR1cWx4UiKo3hzuTBTAsTxqIxIlzMRart3cB6u0qw
	 XGW6A39OoBneYneYBP2svNPamPUHWn2T3O5Mf58gx+eYVfHx5ZjnVUbNdVkwrWDLYd
	 lh/xvOv3VWQ3w==
Date: Tue, 25 Jul 2023 19:13:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 2/3] dt-bindings: rng: meson: add meson-rng-s4
 compatible
Message-ID: <20230725-transport-pension-533b598260d0@spud>
References: <20230725141252.98848-1-avromanov@sberdevices.ru>
 <20230725141252.98848-3-avromanov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230725141252.98848-3-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_111406_759494_3D58AA29 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============4779037652216220693=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4779037652216220693==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ns9HxazCpuYhnvR0"
Content-Disposition: inline


--ns9HxazCpuYhnvR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 05:12:51PM +0300, Alexey Romanov wrote:
> Now the driver has a separate algo for S4 SoC.
>=20
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml=
 b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> index 457a6e43d810..6f51506c0f65 100644
> --- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-rng
> +      - amlogic,meson-rng-s4

Usually, the "s4" would come before the peripheral's name, as s4 is the
name of the SoC.

> =20
>    reg:
>      maxItems: 1
> --=20
> 2.38.1
>=20

--ns9HxazCpuYhnvR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMAQ5wAKCRB4tDGHoIJi
0jQbAQD8az1AUWrNfWLQKH1A3YTesxjJXWzaUqgk5/77Cs01kAD/V9hsEIFEGFh3
KyJSju0f1Motr7Y45NVuek+l3js+DgI=
=LMAU
-----END PGP SIGNATURE-----

--ns9HxazCpuYhnvR0--


--===============4779037652216220693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4779037652216220693==--

