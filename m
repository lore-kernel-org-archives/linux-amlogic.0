Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BF3EB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGIR2RWwg88sd2xGc8WBv9m589dYV7c6NhUxIIO4j+g=; b=zADiUVBtq69G9lWi92n38ZBxI+
	2DZ24drSzHGkxSBGZkZ9aw8ACc0/yA2lEwS910u9l9Mx8SPQURrP9s4p7fyOy71oweE7LUTfV2F27
	To4oqnQAPuVUxm/zmtB5ieVfDUopCRlc/l1GjatO1nVgWzfoOb1Rg937Dqmp/WZywXWHWvRw6SlOY
	9EqSnHFhYvQ+BNfV82NBXFoPkGA+7Z0aBkNm9zOSXnVnVyV/BRR7/2wLNwEpW/GHEpTVVfRj6yIoh
	kLV5wP4gNzdOw8E9whrY3MbKE3zQAKwzi5rRjWpkNpM7GpNTs4Br8Nb65aDToNRtUdV/XxS3Xxs8h
	+aqcq4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjQi-00Dt5T-05;
	Tue, 04 Jul 2023 17:03:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjQf-00Dt4q-2h;
	Tue, 04 Jul 2023 17:03:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9545A61316;
	Tue,  4 Jul 2023 17:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C3C433C7;
	Tue,  4 Jul 2023 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688490184;
	bh=y9AqRwh1On0/kat6LbvFNyQPBwODOA6fSWAazX4k2/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PksoyIFvpPZRdzl45MPP+VGF5sO9LknMMYjedKXz+n0nj1gpF9Tj0G2vE9CmjZP+Y
	 U7vOaUpIxZ5vIvOyk0uB7U30iSXFx/wAFd8+S+ieMIPHZ36+gPVIuvk6A62o1juUP+
	 uqrEMxDtAI3GbEa1MQAs89z67oLkaclTZVxAgYACSDdjVqHT3HVmWT6zQfG1f4eHql
	 mijQ7OQ3soPWIYx4EeUTZ5KGQeKSNBFatIfevjlF090tbWxQkufUSOhdOQowIHLWHg
	 yTP88J1xHEPm3nLDTqo5ODVS+LQmlm5s4lrMtOfLt0M3DSOPtowB41ezU7yoai6P25
	 DhHx9XoYifFbA==
Date: Tue, 4 Jul 2023 18:02:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, jbrunet@baylibre.com,
	jirislaby@kernel.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kelvin.zhang@amlogic.com,
	xianwei.zhao@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 5/5] arm64: dts: meson: a1: change uart compatible
 string
Message-ID: <20230704-cannabis-cannon-19397cd806bc@spud>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-6-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230704135936.14697-6-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_100305_959278_E60AD55A 
X-CRM114-Status: GOOD (  19.29  )
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
Content-Type: multipart/mixed; boundary="===============4672421974056635401=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4672421974056635401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EumZIp4agBc2nn9+"
Content-Disposition: inline


--EumZIp4agBc2nn9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 04:59:36PM +0300, Dmitry Rokosov wrote:
> In the current implementation, the meson-a1 configuration incorporates a
> unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> driver due to its usage of the new console device name "ttyS".
> Consequently, the previous compatibility tag designated for the
> 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> longer relevant to the current setup.

I don't really see why you would remove the gx-uart to be honest, and
not use it as a fallback. Neil's platform though, so his call :)

>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-a1.dtsi
> index c5567031ba12..6273b9c862b3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -344,7 +344,7 @@ mux {
>  			};
> =20
>  			uart_AO: serial@1c00 {
> -				compatible =3D "amlogic,meson-gx-uart",
> +				compatible =3D "amlogic,meson-a1-uart",
>  					     "amlogic,meson-ao-uart";
>  				reg =3D <0x0 0x1c00 0x0 0x18>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> @@ -354,7 +354,7 @@ uart_AO: serial@1c00 {
>  			};
> =20
>  			uart_AO_B: serial@2000 {
> -				compatible =3D "amlogic,meson-gx-uart",
> +				compatible =3D "amlogic,meson-a1-uart",
>  					     "amlogic,meson-ao-uart";
>  				reg =3D <0x0 0x2000 0x0 0x18>;
>  				interrupts =3D <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> --=20
> 2.36.0
>=20

--EumZIp4agBc2nn9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRQwQAKCRB4tDGHoIJi
0ni8AP9/Huiz85MEd1lWfxM1nHhevdkGu63rvkUGrwObPKXQFQEA+lioxbMrhHvJ
V5pJjDNClLTeb0b2t8nCYmO1W1jkzgA=
=H4B/
-----END PGP SIGNATURE-----

--EumZIp4agBc2nn9+--


--===============4672421974056635401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4672421974056635401==--

