Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB92606EEBE
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bSL6NLJH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYSaZkGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lSEL/sd5N94PHn71XkDzGfxnsby4PV7lVmOWovrZ/9w=; b=bSL6NLJHr0s1em3Gy92luvLHmD
	i0r/l73NNhfZpmOSoVVkFxPjlAbTVo9qnbiihSBvDPkco7BLd2fY7k6HjCNeF899uUBFA+nRo48gT
	zrv1nxXLJGsQkwVu/idZQ+s3S6y+Llx9J2xfRYnZCR+xSfTvn+3qmtAlOJdzbUUtMobmUhPI13GTy
	MdJdCr93nERff/ONEZPI1lyhB2rK1Gh8dLHadme/twonR7doVB/56uWMr1CVjylvbqNMPgTYMGMAR
	6dEOJdOQ3q1Tk/gd6tL4I5jivO5q3YIKEouTmrN4BX9cERBAxMuntjMGdTjHo5zh9qT0LEaV5ZjSX
	2r6MGtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNbV-0000000DCuB-2fMz;
	Fri, 06 Nov 2026 17:19:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNbT-0000000DCtn-3aaV;
	Fri, 06 Nov 2026 17:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 425A3601BF;
	Fri,  6 Nov 2026 17:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1E61F008A1;
	Fri,  6 Nov 2026 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985591;
	bh=0iFTCwthtb4KQWJ3KgZO/eQr21RNoCfrtaNGVHe64Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYSaZkGVHJuACXRFQhoLUAGx2gARxd2wREGPO2sCc1yXKN3RY46h7J5wDjOayccX6
	 ++s4RgmjOlutg0e/O7i8kshnMl7BZ33JA2VknynORN5vKm54dpmRMwM0ZSTE7eXKis
	 67cxNvgpIHRz0B4TKyHXXD/gjkI8DOldPxtIkBb2my9fuRqztQsV1wB7b0lGAdRwi0
	 UmwMjlwomVzIsrh5D0Mouj6FFvLZQds7vivxE1bQcaxUmrsTC8Y85uRHieWDzZIzgV
	 skz9Ek8c9DolL87XjnfHpm5A+8Cd1NfJSXWjiQiGrKsmnbP6c9jBXfnuT7Z171OmzB
	 pYgt0jfrbH14w==
Date: Fri, 6 Nov 2026 17:19:46 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
Message-ID: <20261106-walk-overload-3ffa489c0af1@spud>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7170887306480748657=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7170887306480748657==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pNM4qVg2gRPOW9R5"
Content-Disposition: inline

--pNM4qVg2gRPOW9R5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:46:58AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> Add the AO_CEC_A controller and its pin group.
>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 155997649dc3..dd51e786d29d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -747,6 +747,14 @@ mux {
>  					};
>  				};
> =20
> +				ao_cec_a_pins: ao-cec-a {
> +					mux {
> +						groups =3D "ao_cec_a";
> +						function =3D "ao_cec_a";
> +						bias-disable;
> +					};
> +				};
> +
>  			};
> =20
>  			gpio_intc: interrupt-controller@4080 {
> @@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
>  				amlogic,has-chip-id;
>  			};
> =20
> +			cec_a: cec@44000 {
> +				compatible =3D "amlogic,meson-gx-ao-cec";

This is an s4, not a gx, so you need a specific compatible.
pw-bot: changes-requested

Thanks,
Conor.

> +				reg =3D <0x0 0x44000 0x0 0x14>;
> +				interrupts =3D <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				clocks =3D <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
> +				clock-names =3D "core";
> +				assigned-clocks =3D <&clkc_periphs CLKID_CECA_32K_DIV>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL>;
> +				assigned-clock-parents =3D <0>,
> +							 <&clkc_periphs CLKID_CECA_32K_DIV>,
> +							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
> +				assigned-clock-rates =3D <32768>, <0>, <0>;
> +				status =3D "disabled";
> +			};
> +
>  			ir: ir@84040 {
>  				compatible =3D "amlogic,meson-s4-ir";
>  				reg =3D <0x0 0x84040 0x0 0x30>;
> --=20
> 2.56.0
>=20

--pNM4qVg2gRPOW9R5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4MMgAKCRB4tDGHoIJi
0ntYAQDW1EKWgmTLaW09unAisYzkptD8uRbVDs3X4Om7xA7jpwEAqLxY4Kmoizv1
p3w9XKAyw3cich6+tLlpCcPJ8D0vgAQ=
=1s4Y
-----END PGP SIGNATURE-----

--pNM4qVg2gRPOW9R5--


--===============7170887306480748657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7170887306480748657==--

