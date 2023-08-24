Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E6C71153
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GzM3gYAYl6wXXR4HV86z6mcpxTSa8qKc6M3GXGnqCs=; b=leXaWISABVcF7uVGNtburY/QeC
	aEZl/mAxJ5DlBB0dCsJxfrsfM1cWTrCaAT/TJtl/QHqRnEhPh9FBwBn0wsCyUTjUkL+ajIUtca1jj
	cIVpJS6nAOncaoTyZFnr6vhAwdovj7+ya3ASkzwhg81q0I3xKsYbgxYdLvjB/2G3U/wqg+/vbkMul
	0OZoGYbt8QfUKI/XgbReoo8+onWHrmrWoqOG5t0qxStdyGbcMIHd1/6snor1FCBtr9It1iusy8x7/
	HoJ9UNQCxRrQ5nqIIICYFcqh5vP9dwdeUwpitYDkaL1Ru2O/k+HxZHI8dds55EakD6Cw8ZRCA9hls
	JJjzmIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZBx7-003Kor-0c;
	Thu, 24 Aug 2023 15:08:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZBx5-003KoM-0w;
	Thu, 24 Aug 2023 15:08:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FC6467014;
	Thu, 24 Aug 2023 15:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B097C433C8;
	Thu, 24 Aug 2023 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692889730;
	bh=EGWLDuNzqq6PTrj2iWCVL1umx9FxMsqgeHIS5IJ9B64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+CXwreJozjcwmarpEJoD90bP+zN7XpuelIOwjuwvVsyNd0fu/Ld2aUvRtXyxHv5O
	 08UQmFj+VgHpOGvYMqFfEHB4UYKI4W0hJz4p0F4CtYPgxkTQAlnIjI2aIEXSafbVPu
	 W362gQ9pia3KeXy1YGo6eQ2B2cclvyytyufC6Q7flHCGevJ5CX3kg030xNNjUAGmOJ
	 hOqZF3+LWP1lYMe11CQ3C3PSr6Xz8j6MB3gOEQQhphVTSZmCOgVNEUVr8Rm8Gytkkc
	 tahrPf99RoIvIJ7I4pXSrR2e7QngDUZErsT+cBdIRfvusItRgh89Gd+L20vcp2eGj/
	 oUVQe+BLS1DTQ==
Date: Thu, 24 Aug 2023 16:08:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, conor+dt@kernel.org,
	kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
	rockosov@gmail.com, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/15] dt-bindings: arm: amlogic: add Amlogic AD402
 bindings
Message-ID: <20230824-postbox-refueling-3bccc959d82b@spud>
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
 <20230823213630.12936-16-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230823213630.12936-16-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_080851_373839_803338AF 
X-CRM114-Status: GOOD (  15.51  )
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
Content-Type: multipart/mixed; boundary="===============1203984746783749852=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1203984746783749852==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IeP/KGlIXWB7S8Lk"
Content-Disposition: inline


--IeP/KGlIXWB7S8Lk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 12:36:30AM +0300, Dmitry Rokosov wrote:
> Add the compatible for the Amlogic A1 Based AD402 board.
>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documen=
tation/devicetree/bindings/arm/amlogic.yaml
> index 08d59842655c..15880abb7261 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -203,6 +203,7 @@ properties:
>          items:
>            - enum:
>                - amlogic,ad401
> +              - amlogic,ad402
>            - const: amlogic,a1
> =20
>        - description: Boards with the Amlogic C3 C302X/C308L SoC
> --=20
> 2.36.0
>=20

--IeP/KGlIXWB7S8Lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOdyfAAKCRB4tDGHoIJi
0oIXAQCxCYiJcSXauX/bC1ncL/pW/vgEoxuRCEB1sACDgGlzXgEA5fo4ZywiPR9i
5bRB7njZo+PmtnYhAyMqk7b0KV7YJwQ=
=Twj5
-----END PGP SIGNATURE-----

--IeP/KGlIXWB7S8Lk--


--===============1203984746783749852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1203984746783749852==--

