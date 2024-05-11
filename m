Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBC9C25B4F
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2024 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRYMmiA4eHv5JA+8MmgXNhQXnSkrmibl32FFemuPqlI=; b=QQ8LP4QeHZXgLSbCY6PR3LvSyM
	TUmKtn2+4td7x1fCqwETdJE7bqXYdlOPpFbNgonRFNmxMa+9LHwGG+/MgAK9AZh63Cuovlbx2IwVX
	+5jVJZhTGQzdjzeOA6+U/Q+x61N35RbGAC0RjEtqmNbxZoqTcubgYKt4fFj8dHqCL067VHr5+U8HL
	S+3frKWx0qdZE3V2i8ANQLUleWBWMUocXH11D5nkhShQOKAvejxcaLbm+5idzUcV432pwlTUruYi9
	XPs3DRoYXYBpGWT0hgQ7LiAZnj+Chfme89Z2lv54svW786XOONw09T4H4PPX41zzJfqrG55fffc+O
	O2jNYH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5mNu-00000007wy3-0N89;
	Sat, 11 May 2024 13:03:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5mNq-00000007wxP-3w4C;
	Sat, 11 May 2024 13:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B16061211;
	Sat, 11 May 2024 13:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD50C32781;
	Sat, 11 May 2024 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715432606;
	bh=nmhW8quEOj7e8lsF6Vgn3FxigiWdqJzbbfjcHiI4FF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8Z/hvEH0Tz1Wsjzc/s0tw6Uk0zCa+ZRb2ykAVHUAAiicT+RL/2IHtFXpl9nOYA8y
	 1nYGa04Pr6qqXAZOzxQC36PT0UNXhJLEb+CXlbAGAoCjnh0ksm1dsDjZnPZtkqVN8/
	 TaJ4mpR7fvKC0jJpcBNWzg6oZRZTlgxnKVL6hK3UTV2xjGDmcawxm2CYozyH254u7i
	 WJx3LP/8IWIrb5k1runTAru/m4IXfWTTxDmTGa7BiHyEDrjkLqS8ytPd19VNNaUDU3
	 JazlPNSUrmoJ34YYBloFSLuWxAOSeKJzDYTMHbEfvHqE1kvKCsn1BNTtj9HGTk8Q51
	 5jrBl4gUZoUUw==
Date: Sat, 11 May 2024 14:03:20 +0100
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
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll_div16 input
Message-ID: <20240511-courier-afflicted-e351af5cded2@spud>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-5-ddrokosov@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240510090933.19464-5-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_060327_107687_1D10B9A4 
X-CRM114-Status: GOOD (  15.48  )
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
Content-Type: multipart/mixed; boundary="===============0048782168736009247=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0048782168736009247==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TNx0su8gnKIgNzEa"
Content-Disposition: inline


--TNx0su8gnKIgNzEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 12:08:56PM +0300, Dmitry Rokosov wrote:
> The 'sys_pll_div16' input clock is used as one of the sources for the
> GEN clock.
>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Provided that this new clock is optional in the driver,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-periphera=
ls-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-periphera=
ls-clkc.yaml
> index 6d84cee1bd75..11862746ba44 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-peripherals-clkc=
=2Eyaml
> @@ -30,6 +30,7 @@ properties:
>        - description: input fixed pll div7
>        - description: input hifi pll
>        - description: input oscillator (usually at 24MHz)
> +      - description: input sys pll div16
> =20
>    clock-names:
>      items:
> @@ -39,6 +40,7 @@ properties:
>        - const: fclk_div7
>        - const: hifi_pll
>        - const: xtal
> +      - const: sys_pll_div16
> =20
>  required:
>    - compatible
> @@ -65,9 +67,10 @@ examples:
>                       <&clkc_pll CLKID_FCLK_DIV5>,
>                       <&clkc_pll CLKID_FCLK_DIV7>,
>                       <&clkc_pll CLKID_HIFI_PLL>,
> -                     <&xtal>;
> +                     <&xtal>,
> +                     <&clkc_pll CLKID_SYS_PLL_DIV16>;
>              clock-names =3D "fclk_div2", "fclk_div3",
>                            "fclk_div5", "fclk_div7",
> -                          "hifi_pll", "xtal";
> +                          "hifi_pll", "xtal", "sys_pll_div16";
>          };
>      };
> --=20
> 2.43.0
>=20
>=20

--TNx0su8gnKIgNzEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9smAAKCRB4tDGHoIJi
0sVPAP4qBtz3ATp9etCU/S5CukAKn4AJFaAGHLtaVCEhh9TnJwEApgjVh2zKcIAl
WlAU5kVo+VO3uM0AxaBrQrhxsiADUQA=
=31o0
-----END PGP SIGNATURE-----

--TNx0su8gnKIgNzEa--


--===============0048782168736009247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0048782168736009247==--

