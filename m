Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A6AEB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhrLdb+7+q4tvpxkofzx+4ap3GBaNFzmy3vdna3Rrmw=; b=GX1p+719z4So+STqqn2yzuYjc5
	xpQzpRHA/P1oDGWaOu5fYSeV7lvTcjG1cS0oPUat+RVX4dY80uhKi/ABvJWJKc3bxoaJLbJwdWud0
	kZ9D7d/P1Lw4Hj6eR7B57pmPALcZecwh6WGwATK6MU383adoo9ySw3q4zGgcALX2kMnXffkJ7wqE4
	LIdA93kCvvlXPw/QqDJzw9wsiWV/KKfo+zhZwacgKqYcSCYgCMoR4yVVGqZ0mWYehl2IsaHjDOp+n
	tKE7jATJjHYLPSzKQT8zOVen9OCZ5wk9qQlxSS5tXUJJEt4JzBfWYFHJEcFwZ7KpTx7cyB2JmLfQg
	IJ0obgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjLC-00DsXc-0D;
	Tue, 04 Jul 2023 16:57:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjL9-00DsX8-00;
	Tue, 04 Jul 2023 16:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8232F61316;
	Tue,  4 Jul 2023 16:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6F1C433C7;
	Tue,  4 Jul 2023 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688489841;
	bh=MVK2bS+f6XohwJ0w4CtQX6uyCqJA+y7IuaOf1eEVzMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbKVjQMOI7tOQZ0qiLl39Yj+RCq0pT415EnZJAX39Pns8On/Yo8yX2ouWsBdWza6D
	 WpRp6Yt/StzDscW5QhJbD+YnX8/m/NiWzf/Hj1mqYBozI2Luwyacdg2qo/Vh+7QJCA
	 5o4cwhVHaLh5jIhngMo8peEvsW2yIk6JEvpBMZKOm3Dx+OSpoQ+En7lzK0iGgkKY45
	 Uk3SiVvO+oLuOC1uSnO+f/nX6eLMRJ8nMZGfWcBzdcsWXcLmornN1VljMOyR4XRxGY
	 C8+fNAgSf3VRPEEf+Q2Xta8a2s2uzfPNpJmztkio125pZazEIDRNmsQef9tyoTZV4C
	 OnfqP7ysrKfuA==
Date: Tue, 4 Jul 2023 17:57:15 +0100
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
Subject: Re: [PATCH v1 3/5] tty: serial: meson: apply ttyS devname instead of
 ttyAML for new SoCs
Message-ID: <20230704-pogo-zeppelin-5fa281f5c9e6@spud>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-4-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <20230704135936.14697-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_095723_123336_05F4B15B 
X-CRM114-Status: GOOD (  29.97  )
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
Content-Type: multipart/mixed; boundary="===============5667808934635189447=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5667808934635189447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cFEFPb639xHq5Qr+"
Content-Disposition: inline


--cFEFPb639xHq5Qr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 04:59:34PM +0300, Dmitry Rokosov wrote:
> It is worth noting that the devname ttyS is a widely recognized tty name
> and is commonly used by many uart device drivers. Given the established
> usage and compatibility concerns, it may not be feasible to change the
> devname for older SoCs. However, for new definitions, it is acceptable
> and even recommended to use a new devname to help ensure clarity and
> avoid any potential conflicts on lower or upper software levels.

> In
> addition, modify the meson_uart_dt match data for g12a, a1, and s4 to
> their appropriate values to ensure proper devname values and
> functionality.

IMO, this is a separate change that should be in another patch, had to
go looking through a several of unrelated $subject patches to understand
how the binding patch was going to work.

Cheers,
Conor.

> For more information please refer to IRC discussion at [1].
>=20
> Links:
>     [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03
>=20
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  drivers/tty/serial/meson_uart.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_u=
art.c
> index 87c0eb5f2dba..361f9326b527 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -82,6 +82,7 @@ static struct uart_driver meson_uart_driver;
>  static struct uart_port *meson_ports[AML_UART_PORT_NUM];
> =20
>  struct meson_uart_data {
> +	const char *dev_name;
>  	bool has_xtal_div2;
>  };
> =20
> @@ -683,6 +684,7 @@ static int meson_uart_probe_clocks(struct platform_de=
vice *pdev,
> =20
>  static int meson_uart_probe(struct platform_device *pdev)
>  {
> +	const struct meson_uart_data *priv_data;
>  	struct resource *res_mem;
>  	struct uart_port *port;
>  	u32 fifosize =3D 64; /* Default is 64, 128 for EE UART_0 */
> @@ -729,6 +731,18 @@ static int meson_uart_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> +	priv_data =3D device_get_match_data(&pdev->dev);
> +
> +	if (priv_data) {
> +		struct console *cons =3D meson_uart_driver.cons;
> +
> +		meson_uart_driver.dev_name =3D priv_data->dev_name;
> +
> +		if (cons)
> +			strscpy(cons->name, priv_data->dev_name,
> +				sizeof(cons->name));
> +	}
> +
>  	if (!meson_uart_driver.state) {
>  		ret =3D uart_register_driver(&meson_uart_driver);
>  		if (ret)
> @@ -748,7 +762,7 @@ static int meson_uart_probe(struct platform_device *p=
dev)
>  	port->x_char =3D 0;
>  	port->ops =3D &meson_uart_ops;
>  	port->fifosize =3D fifosize;
> -	port->private_data =3D (void *)device_get_match_data(&pdev->dev);
> +	port->private_data =3D (void *)priv_data;
> =20
>  	meson_ports[pdev->id] =3D port;
>  	platform_set_drvdata(pdev, port);
> @@ -780,6 +794,17 @@ static int meson_uart_remove(struct platform_device =
*pdev)
>  }
> =20
>  static struct meson_uart_data meson_g12a_uart_data =3D {
> +	.dev_name =3D "ttyAML",
> +	.has_xtal_div2 =3D true,
> +};
> +
> +static struct meson_uart_data meson_a1_uart_data =3D {
> +	.dev_name =3D "ttyS",
> +	.has_xtal_div2 =3D false,
> +};
> +
> +static struct meson_uart_data meson_s4_uart_data =3D {
> +	.dev_name =3D "ttyS",
>  	.has_xtal_div2 =3D true,
>  };
> =20
> @@ -794,7 +819,11 @@ static const struct of_device_id meson_uart_dt_match=
[] =3D {
>  	},
>  	{
>  		.compatible =3D "amlogic,meson-s4-uart",
> -		.data =3D (void *)&meson_g12a_uart_data,
> +		.data =3D (void *)&meson_s4_uart_data,
> +	},
> +	{
> +		.compatible =3D "amlogic,meson-a1-uart",
> +		.data =3D (void *)&meson_a1_uart_data,
>  	},
>  	{ /* sentinel */ },
>  };
> --=20
> 2.36.0
>=20

--cFEFPb639xHq5Qr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRPawAKCRB4tDGHoIJi
0mZzAP47gQmIoHiEKtf6/SExpFCyadxEql+D7dStRjofvLIEgAD9F25QTpMwc7zH
/3Dk88CYjPnAzUZCHEyVxiL5r2QW9Ak=
=wvA0
-----END PGP SIGNATURE-----

--cFEFPb639xHq5Qr+--


--===============5667808934635189447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5667808934635189447==--

