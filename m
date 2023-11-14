Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA057C4167D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 17:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAfR8eFAKkNoApBornoRFNN7oN9GkdHfe/YJ5/uTa34=; b=FX/Mg5E0cVpHEenXnPtXRHKWpZ
	m0SfLsQvZ+qAd1tw2S6EVlApBrlmDi9+tOD9Si1TQEkE+fvgFSszy8mbQixEg5JD/jhWCl1bcJa5x
	iiE9REFs29JhkNGMdvPBAQqg+dvtQI97+zHpyye8fhLFR2YM2hD/mupuCeqid1w5XzPQ3Cvcn9SB1
	NHJXzHaCV66vkZ2x7km6Cgth4x6CtRNetj3Dd7B2HrHbrsVbyPVTBZ0KwHv+12RvCroMkFdSMZAPy
	OIchiHAIawa8iVg1CTZ2rXM4WO0r+ekIKPLmVOfYWS9+tqMpM2ESH62t2OeSLT6eqLQgfnsXx16Um
	QdMUhVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xVA-00GX0A-37;
	Tue, 14 Nov 2023 17:47:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xV8-00GWyh-0N;
	Tue, 14 Nov 2023 17:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E85C611CB;
	Tue, 14 Nov 2023 17:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906DDC433C8;
	Tue, 14 Nov 2023 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699984018;
	bh=eCMU4RF9OJ4X7mcA2D6kVETfj8p7WKrVJJV5XZuQ5Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M043fNWlZFaDO4W2DaRdnW/Zkgbizurx86jTKDsqEKY1+6ayXvXouPLX3RaMWw3aW
	 ea0bmPGghraL+VzuSZ8rwjzIU0IAbRV5+nHN75PxxDGubFW9peZ9/S4bmrMLcX+wtA
	 VeIndsF78jfozk3B4yRZ1I8gSwWZAJl2LA5sUH9GEhyNmvFefkDf056z99OgKvCth0
	 6O2uh5CtMEFGEUV3gLLMYvGMdTKi3lhSmz/UWywxVisV/VRLbIT0ATz6lBnVXQZnJw
	 29TPCQ8KzEwNcF/Gw35VQwjEistoju409/jXK0d8Vi70G9QsTVKC4PxjPKmMVRmqgQ
	 FS9AjhGBnaQLQ==
Date: Tue, 14 Nov 2023 17:46:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
Message-ID: <20231114-tremor-deftly-9e0df4aa6dc9@squawk>
References: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
 <20231114-topic-amlogic-upstream-isp-pmdomain-v1-1-f01e6fca67a0@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-1-f01e6fca67a0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_094702_194645_05306A51 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Type: multipart/mixed; boundary="===============1695416290439111250=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1695416290439111250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PwYF9EZeZpf3gj+q"
Content-Disposition: inline


--PwYF9EZeZpf3gj+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 11:19:50AM +0100, Neil Armstrong wrote:
> Add MIPI ISP power domain ID to the G12A Power domains bindings header
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor,

> ---
>  include/dt-bindings/power/meson-g12a-power.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bi=
ndings/power/meson-g12a-power.h
> index 44ec0c50e340..01fd0ac4dd08 100644
> --- a/include/dt-bindings/power/meson-g12a-power.h
> +++ b/include/dt-bindings/power/meson-g12a-power.h
> @@ -10,5 +10,6 @@
>  #define PWRC_G12A_VPU_ID		0
>  #define PWRC_G12A_ETH_ID		1
>  #define PWRC_G12A_NNA_ID		2
> +#define PWRC_G12A_ISP_ID		3
> =20
>  #endif
>=20
> --=20
> 2.34.1
>=20

--PwYF9EZeZpf3gj+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOyiwAKCRB4tDGHoIJi
0rmuAP962Bb9llHANd7qrsMYBmKgYiRTEy5nus69HQ/DSFFWngEA5WgpUUCCOIRm
vSTfY/PJbbSulsYVa7P1iCnUYaoERQI=
=gjcN
-----END PGP SIGNATURE-----

--PwYF9EZeZpf3gj+q--


--===============1695416290439111250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1695416290439111250==--

