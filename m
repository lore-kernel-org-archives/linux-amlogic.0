Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9033C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj9IxzgasAzjXujDBu1h6KPX3z2ABLHrFMEtedNYEm8=; b=Q7o7OPcJ/NLwhmoZqaaBbgeTUW
	QNLM3QcSb5sPIqtpY8fFwdzyr64qPG7UQ7Vj5ENJSL0xx6b0ukAi/DDY6UJwbe5LzlnFm502bt7aN
	5LJn8sY0aVT98nkUPfPa8GvDGC+e006QDkrI9j3ibrbzyRcvy0w6uAtYWW0UOAFxtbspHC42msW28
	ZHpH/ltTgqcUc8eZkfnnYIv5ZPHdsFV+h6l9WsOf0kSB1j6QAkA6u0AQLJvzyHajwhI4vE96FLfhO
	9dAUyX1DtXIBhHcY2C0PmQtIlXYZ8XfwyYWAIbb3/VcO9mIssI2szmQBU3gziyKdvXSWp32UnNrtK
	Qe/KmLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjE6-00BGzy-1f;
	Wed, 26 Jul 2023 18:27:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjE3-00BGzN-2z;
	Wed, 26 Jul 2023 18:27:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C35461C1A;
	Wed, 26 Jul 2023 18:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA6CC433C8;
	Wed, 26 Jul 2023 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690396026;
	bh=RcVBAAfHER54k81unBpKdeTFWDOVzzrxeLONyzkog9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDVhKP/+rOKPV6FWU0V2HVtCg3RJbPgMXWfCOORXqY6xhyTR7cgeIh3lvxz3ERODI
	 gtbMqCMR4SxaeWbb/YIaigOwzCWuVW3NbZXv15KYLqoU3nnDMoUBOCulhgIwdghYnC
	 4/7bgT3VfineLAJMu6zG1WuGRHRN6oo3VZEZMNhgrI24Jw57QxYgp0y71DMGzZgqi5
	 96aE/FWhDYes2iykdB944h7DLs5LYVbWVfDIs8fH/5M7yxnVOeBfGP/D74ESz+xlcP
	 p1y0nFN0laoLzOultlIaNTervCM4VnoUNe37t9Wicxa7u1GLiNyR/q9iGMgQtxrHks
	 JAPxoIkEx1OqA==
Date: Wed, 26 Jul 2023 19:27:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: Add support for Amlogic-T7
 SoCs
Message-ID: <20230726-populate-unseeing-0a68fca96e44@spud>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
 <20230726112146.1127145-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230726112146.1127145-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_112708_008981_B8CE53C4 
X-CRM114-Status: GOOD (  13.82  )
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
Content-Type: multipart/mixed; boundary="===============8086777707911676957=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8086777707911676957==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8r4SD1LFH2QP0ZPP"
Content-Disposition: inline


--8r4SD1LFH2QP0ZPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 07:21:43PM +0800, Huqiang Qin wrote:
> Update dt-binding document for watchdog of Amlogic-T7 SoCs.
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxb=
b-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-=
wdt.yaml
> index f5cc7aa1b93b..443e2e7ab467 100644
> --- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.y=
aml
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.y=
aml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-gxbb-wdt
> +      - amlogic,t7-wdt
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.37.1
>=20

--8r4SD1LFH2QP0ZPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMFldQAKCRB4tDGHoIJi
0o1LAP0a8J+dJl9opDCpcZ0beSBf4iEaQFs/LXYgBm7gxVHrtQD6A95c9IYcyNpT
GWMMw9jz4bGJ6bsOQ+T4Tg1Bv+wADwI=
=nTul
-----END PGP SIGNATURE-----

--8r4SD1LFH2QP0ZPP--


--===============8086777707911676957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8086777707911676957==--

