Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BB9C04FFE
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZxBrkULQDwQnxkkf4rNYrXcBQVej0NuX2QuRM6nE8E=; b=K9rkPvnCBn19A7X0Oc5D4iigFm
	uWHvbToP3scT4WLetdGJRfP9IPfwNf4MNUJBUqKXjnwU0Dc2sKmCbeLSNj9PnNCqU+F+aFcLf14Y/
	S417arbV3O3utJNmf5/LKfkP0h4/5/G6v13D+LEhgXSmUpOMTWDFMKBL2IFpnDrg8kdkaXPF6D1ff
	PZ0WFAv2uBPfIK+wg0VF1D9e933O1VWgmAjwSTyECjm7eG9t0l31lb7OI1yDoeYbWZxlZAPl2+DOm
	6019gzCUsmSFjSJRsKDivpIwqzJRBw4Z9GKAC7DxEFxfMTxvoidKZGjUKYKp7rzrSrm3hoRnshK7B
	imwDK1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5mSU-00000007xr4-1aCn;
	Sat, 11 May 2024 13:08:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5mSR-00000007xqZ-1oAY;
	Sat, 11 May 2024 13:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BBBE611F2;
	Sat, 11 May 2024 13:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08707C2BBFC;
	Sat, 11 May 2024 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715432889;
	bh=nn5CCGqDXRDW0kal5/Z0nExGsCcCmd7RqOdWPQZZ+Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMBV/L0Rf02+pxMLC/ZTNs8StcL5fKgQTU5ppq5oaWJDipa8ukbCHuu/An38u5vZU
	 NnvuNdjhyXgdTFMGWo8KlgW8zLJmi3r7tGype6lRozJK8NjdT6VfopQtHp/fe1MEnX
	 SNlppIGviW72sy/N86tNc1o4u9AfAZcoo4x96htViPYEdUyh/egQzsQtT/0S6IIlND
	 TFqDsQ2KaXVatNx1bFwXu6QFyGvbnmYHwoV42p57DbnAQdI7Hri0K8vHJzciBLqfvz
	 +CRGOg8oJbrFXEHKBNvNDKDvLyF8imNkO+DwfSnPqPPxj4sWLcOAAAymdDRm15AbLo
	 LZgR1LdLH6XtQ==
Date: Sat, 11 May 2024 14:08:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240511-secret-barcode-e25c722ddf1d@spud>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240510090933.19464-3-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_060811_603857_8CEF4B0E 
X-CRM114-Status: GOOD (  20.31  )
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
Content-Type: multipart/mixed; boundary="===============5076111809140753672=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5076111809140753672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BapyMlBTqqZEbUPF"
Content-Disposition: inline


--BapyMlBTqqZEbUPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
> The 'syspll' PLL is a general-purpose PLL designed specifically for the
> CPU clock. It is capable of producing output frequencies within the
> range of 768MHz to 1536MHz.
>=20
> The clock source sys_pll_div16, being one of the GEN clock parents,
> plays a crucial role and cannot be tagged as "optional". Unfortunately,
> it was not implemented earlier due to the cpu clock ctrl driver's
> pending status on the TODO list.

It's fine to not mark it optional in the binding, but it should be
optional in the driver as otherwise backwards compatibility will be
broken. Given this is an integral clock driver, sounds like it would
quite likely break booting on these devices if the driver doesn't treat
syspll_in as optional.
A lesson perhaps in describing the hardware entirely, even if the
drivers don't make use of all the information yet?

Cheers,
Conor.

>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.=
yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> index a59b188a8bf5..fbba57031278 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -26,11 +26,13 @@ properties:
>      items:
>        - description: input fixpll_in
>        - description: input hifipll_in
> +      - description: input syspll_in
> =20
>    clock-names:
>      items:
>        - const: fixpll_in
>        - const: hifipll_in
> +      - const: syspll_in
> =20
>  required:
>    - compatible
> @@ -53,7 +55,8 @@ examples:
>              reg =3D <0 0x7c80 0 0x18c>;
>              #clock-cells =3D <1>;
>              clocks =3D <&clkc_periphs CLKID_FIXPLL_IN>,
> -                     <&clkc_periphs CLKID_HIFIPLL_IN>;
> -            clock-names =3D "fixpll_in", "hifipll_in";
> +                     <&clkc_periphs CLKID_HIFIPLL_IN>,
> +                     <&clkc_periphs CLKID_SYSPLL_IN>;
> +            clock-names =3D "fixpll_in", "hifipll_in", "syspll_in";
>          };
>      };
> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt=
-bindings/clock/amlogic,a1-pll-clkc.h
> index 2b660c0f2c9f..a702d610589c 100644
> --- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
> @@ -21,5 +21,7 @@
>  #define CLKID_FCLK_DIV5		8
>  #define CLKID_FCLK_DIV7		9
>  #define CLKID_HIFI_PLL		10
> +#define CLKID_SYS_PLL		11
> +#define CLKID_SYS_PLL_DIV16	12
> =20
>  #endif /* __A1_PLL_CLKC_H */
> --=20
> 2.43.0
>=20
>=20

--BapyMlBTqqZEbUPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9tswAKCRB4tDGHoIJi
0pj2AP9o4HZKD5fAbbwEJlMifsTMl/7hSOmkyRbcNK3IJjs/IwEAovKPd0n+svw5
TYMMJ7Bah8z91bGRNWgo/Zn/yyRxdw8=
=ohus
-----END PGP SIGNATURE-----

--BapyMlBTqqZEbUPF--


--===============5076111809140753672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5076111809140753672==--

