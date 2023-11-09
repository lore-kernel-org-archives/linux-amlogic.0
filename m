Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82700C4167D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzKwI+/5CZ8gmp+3xDbNX7JC/W0fPQAA/zIkIhaBEvU=; b=f6Sff5NPhocAknmTzmKqV2g/j1
	YAv5bUTa9/HxYgYIRbYCJBabJhxSrWlgY16vlQu+PiEfQCZb8Z4KCMRkPidC/co/LDEXsn2E2xG9A
	vXn1OVLePoCEK44/8je4uCDF1kpqy2uUMaMoovhdy8nxL16hWPbYj4rxLjavDqaiMoi9CBJwwuulY
	x+I/QaP8uVwBui43fYPjQa3648iZazV+4/PEY3oM+NbgOuVxqmFLTVPlCXXABrzxt440fM5kV2hNx
	LgnKSLIJYVYj3XnUJMDcFuohegO8pt8KuCn5lRJY9iippQv8f1X5y7naAnOqaoC5r0Q2mibrqEwM7
	w0sG9+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r18vm-006w7i-0o;
	Thu, 09 Nov 2023 17:35:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r18vj-006w68-0t;
	Thu, 09 Nov 2023 17:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 97066B81E6A;
	Thu,  9 Nov 2023 17:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446C9C433C8;
	Thu,  9 Nov 2023 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699551297;
	bh=veQWpyDM4onYmh1xiPJAD0ivfDvih3X2s70cbv5GcvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2MS1QwT+Zqp6WDAybXlZ7u9BeEQIBbtcbs+uG5F7GbZzNgzyp1cxENY4a0RMc2Ba
	 fDX8qxTGvQlIfsGKUPHTUJtT9aPtABpmcFhgCDWzbn6C5sL3phfs+4YMu0/yOrFP0y
	 QeL3+/YjuSrTDGgD/tqUQOk4JuxOvpJ5sT848d+a1mOsbCzrq3mrXCzI7qqm+jCbXc
	 8YibFddiyPWDzcM+Jb87cj8Pfeo6YfEDvtPGoiE1QLmgn2VaCIlIWuyvAk9AvsisKb
	 BK13LmhwP0amZ6L/zg/VSUp9SxuMYEJQV1R8pwwIgQYL5+2i1Ckv5vi4ipdjLrgM2U
	 x0sIK1xls0s0w==
Date: Thu, 9 Nov 2023 17:34:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231109-dictator-hedging-94b0dec505b5@spud>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_093459_599801_0EC593C1 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: multipart/mixed; boundary="===============3664297597542015289=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3664297597542015289==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sZblbYTITPv0dWts"
Content-Disposition: inline


--sZblbYTITPv0dWts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> Add a thirst example covering the meson-axg-hhi-sysctrl variant and more

What on earth is a thirst example? Some sort of "hysterical raisins"
type of thing?

My confusion about that word aside,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> importantly the phy subnode.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-=
gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic=
,meson-gx-hhi-sysctrl.yaml
> index 16977e4e4357..2edf4ccea845 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> @@ -158,3 +158,44 @@ examples:
>              };
>          };
>      };
> +
> +    bus@ff63c000 {
> +        compatible =3D "simple-bus";
> +        reg =3D <0xff63c000 0x1c00>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x0 0xff63c000 0x1c00>;
> +
> +        system-controller@0 {
> +            compatible =3D "amlogic,meson-axg-hhi-sysctrl", "simple-mfd"=
, "syscon";
> +            reg =3D <0 0x400>;
> +
> +            clock-controller {
> +                compatible =3D "amlogic,axg-clkc";
> +                #clock-cells =3D <1>;
> +                clocks =3D <&xtal>;
> +                clock-names =3D "xtal";
> +            };
> +
> +            power-controller {
> +                compatible =3D "amlogic,meson-axg-pwrc";
> +                #power-domain-cells =3D <1>;
> +                amlogic,ao-sysctrl =3D <&sysctrl_AO>;
> +
> +                resets =3D <&reset_viu>,
> +                         <&reset_venc>,
> +                         <&reset_vcbus>,
> +                         <&reset_vencl>,
> +                         <&reset_vid_lock>;
> +                reset-names =3D "viu", "venc", "vcbus", "vencl", "vid_lo=
ck";
> +                clocks =3D <&clk_vpu>, <&clk_vapb>;
> +                clock-names =3D "vpu", "vapb";
> +            };
> +
> +            phy {
> +                compatible =3D "amlogic,axg-mipi-pcie-analog-phy";
> +                #phy-cells =3D <0>;
> +                status =3D "disabled";
> +            };
> +        };
> +    };
>=20
> --=20
> 2.34.1
>=20

--sZblbYTITPv0dWts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0YOgAKCRB4tDGHoIJi
0uT6AP0d47elZ0SGrlap1u+Eghh/HJKast4ARo3Asny2i7xKDQEAuoscsk9XDXKL
6UJ5EqFhBaW1Jp3Azcaxaou/fLGf4AQ=
=dC1C
-----END PGP SIGNATURE-----

--sZblbYTITPv0dWts--


--===============3664297597542015289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3664297597542015289==--

