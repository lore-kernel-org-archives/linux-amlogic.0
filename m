Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD218C001DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5yHu5zvQtWGdo9pdo6PK3a5uchCKe490TgK2LM7UOI=; b=D/zXzx8oKlHTO8VpTfcHrdOo+O
	YKJRr3guEbraUjUr17N2awiRwc2/7an5OIHVfV6ka0oEw5IewYc0pWVTxP8TsJr5i258A4ZOCLwkn
	OczBhaaPcf5uQtV8P2XRzDRfcnFnsgwqiTf5kOKTJpf6pUfTbj4Tpl00Qa3W2r1iTvK7HRF0mMirE
	M+LkOXzgnvExVlTK6yrBSn2J3Qug1SivJs0vSzQBYUoeDyHE7mWJC8FDL+nivIhKG1yQyf8Nr1XuR
	w2MfA/30knOe8CguKuWSNLrZko8qyyOConru9wKoMfkj/yNoAOPRgtmKIYOCuhPwILj629+8CrSaW
	+gsDFf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLX9-002XSu-0P;
	Tue, 08 Aug 2023 12:09:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLX6-002XSW-0k;
	Tue, 08 Aug 2023 12:09:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3D5962526;
	Tue,  8 Aug 2023 12:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B62AC433C8;
	Tue,  8 Aug 2023 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691496591;
	bh=FzbOxvvcT3an8By+bOHp6cyHrQ87WItM2HAHMx6IoRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehP1b2bkLNUXjEjaxc9cidCuqOTS3i+S6muIu9INtZkx1y6sVWTjl+QavfkjrEYVq
	 HA6is88xBCIS1czwcdQ+k7n+w+COyEE9KFtUe+p6tQ9OlbvvyOIrpKF1Npq1iUW1oJ
	 IHgeXhk2p9BCrmqZ3zE9bGlGaiZ+J03Fpuzg020HdHm5xiFJ+snsH1+9mibbag9LH/
	 CpHIP06gSzr4sQe0q+NcdTRHhnr7IImA0JB0r5B3Q+ZsrqRGpdaRVl9vek6EKhKqk5
	 VMEbDlcA+pd3x2ty5TfxfyTituVj7OChW4msMrBtf46iHAGvON4mgI96DdF9XWS2ed
	 eH8f0o+EU3Jzg==
Date: Tue, 8 Aug 2023 13:09:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, lists@kaiser.cx,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2 2/3] dt-bindings: rng: meson: add meson-rng-s4
 compatible
Message-ID: <20230808-calcium-smasher-5f6c410fb226@spud>
References: <20230807130611.63914-1-avromanov@sberdevices.ru>
 <20230807130611.63914-3-avromanov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230807130611.63914-3-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_050952_310106_5527F72C 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============6442597162437173299=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6442597162437173299==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1ZSDXZ0SsvgeKJ0O"
Content-Disposition: inline


--1ZSDXZ0SsvgeKJ0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 04:06:10PM +0300, Alexey Romanov wrote:
> Now the driver has a separate algo for S4 SoC.
>=20
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml=
 b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> index 457a6e43d810..afa52af442a7 100644
> --- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-rng
> +      - amlogic,meson-s4-rng
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.38.1
>=20

--1ZSDXZ0SsvgeKJ0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNIwiAAKCRB4tDGHoIJi
0pUgAP9HDWOZ1G7GCTkcQUybdiI2/jI/AvEAXJI563GCRiQ3ygEAooo5442ZSKKj
zRJUywsZ62WcXhxLA1v+F2JzZdeAtAM=
=yk/+
-----END PGP SIGNATURE-----

--1ZSDXZ0SsvgeKJ0O--


--===============6442597162437173299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6442597162437173299==--

