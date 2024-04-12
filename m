Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C5C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZjDaoya+SjpLKxp587yRoOHfbhFlV5NEZjBBZfSJ8M=; b=QIW0wvBqjxQji3AjSUkdZRo91K
	ia2lkrbw0hzr0Gn1Q9bhOHAiVXLnmwv6diOl3AZGBHnV84QNwApU3OmiKdtqaZAsalbWeXn3Cj2h8
	ZhSwXYfMvLmYIfnPotKgeEZ5CAzGTEHSkXnSW1KYWEFzJ1ZlAAgJ3vSK1TGSg2SL9RcK14smnGt34
	j5FaWYI4RSw00XJWCbflk78BKKs6oko4a7xuU8vWQQUr5hcX24YBxcb8ippO8Csqqpq3OleZKZ/sO
	ZK86jwbMlalwrUmXCyCaqHnkKl9CSFhBjpycgAWaGdkc7ReS9mOcuHCpNCQyKovKq6wtqV/8bwtQf
	k7XjqIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF3x-0000000Guiu-0pIR;
	Fri, 12 Apr 2024 11:27:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF3s-0000000GudG-1evs
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 11:27:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvF3i-0007Gj-56; Fri, 12 Apr 2024 13:27:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvF3h-00Brjf-5R; Fri, 12 Apr 2024 13:27:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvF3h-0007nW-0F;
	Fri, 12 Apr 2024 13:27:05 +0200
Date: Fri, 12 Apr 2024 13:27:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, 
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 4/5] pwm: meson: don't carry internal clock elements
 around
Message-ID: <5j2n53asv5yw3apmwgcmopua55dqejqjmhdvfszss4r5xmc37f@uryn2fvwbkqy>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-5-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240221151154.26452-5-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_042716_783670_41477155 
X-CRM114-Status: GOOD (  27.75  )
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
Content-Type: multipart/mixed; boundary="===============7402659235411197099=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7402659235411197099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zt6g3v346aznprz2"
Content-Disposition: inline


--zt6g3v346aznprz2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jerome,

On Wed, Feb 21, 2024 at 04:11:50PM +0100, Jerome Brunet wrote:
> Pointers to the internal clock elements of the PWM are useless
> after probe. There is no need to carry this around in the device
> data.
>=20
> Rework the clock registration to let devres deal with it
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 73 ++++++++++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index a02fdbc61256..fe61335d87d0 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -85,14 +85,17 @@ static struct meson_pwm_channel_data {
>  	}
>  };
> =20
> +struct meson8b_pwm_clocks {
> +	struct clk_divider div;
> +	struct clk_gate gate;
> +	struct clk_mux mux;
> +};
> +
>  struct meson_pwm_channel {
>  	unsigned long rate;
>  	unsigned int hi;
>  	unsigned int lo;
> =20
> -	struct clk_mux mux;
> -	struct clk_divider div;
> -	struct clk_gate gate;
>  	struct clk *clk;
>  };

I don't think there is a valuable benefit here. Yes, the three
structures are not used explicitly in the driver afterwards, but the
memory has to stay around to call clk_hw_unregister() when the device is
unregistered. So to hide these from struct meson_pwm_channel, we're not
saving any memory, but add the overhead of one additional devm_kzalloc
per PWM channel. For me the cost-benefit calculation is bad here.

> @@ -419,9 +422,14 @@ static int meson_pwm_init_channels(struct pwm_chip *=
chip)
> =20
>  	for (i =3D 0; i < chip->npwm; i++) {
>  		struct meson_pwm_channel *channel =3D &meson->channels[i];
> -		struct clk_parent_data div_parent =3D {}, gate_parent =3D {};
> +		struct clk_parent_data pdata =3D {};
> +		struct meson8b_pwm_clocks *clks;
>  		struct clk_init_data init =3D {};
> =20
> +		clks =3D devm_kzalloc(dev, sizeof(*clks), GFP_KERNEL);
> +		if (!clks)
> +			return -ENOMEM;
> +
>  		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
> =20
>  		init.name =3D name;
> @@ -430,16 +438,15 @@ static int meson_pwm_init_channels(struct pwm_chip =
*chip)
>  		init.parent_data =3D mux_parent_data;
>  		init.num_parents =3D MESON_NUM_MUX_PARENTS;
> =20
> -		channel->mux.reg =3D meson->base + REG_MISC_AB;
> -		channel->mux.shift =3D
> -				meson_pwm_per_channel_data[i].clk_sel_shift;
> -		channel->mux.mask =3D MISC_CLK_SEL_MASK;
> -		channel->mux.flags =3D 0;
> -		channel->mux.lock =3D &meson->lock;
> -		channel->mux.table =3D NULL;
> -		channel->mux.hw.init =3D &init;
> +		clks->mux.reg =3D meson->base + REG_MISC_AB;
> +		clks->mux.shift =3D meson_pwm_per_channel_data[i].clk_sel_shift;
> +		clks->mux.mask =3D MISC_CLK_SEL_MASK;
> +		clks->mux.flags =3D 0;
> +		clks->mux.lock =3D &meson->lock;
> +		clks->mux.table =3D NULL;
> +		clks->mux.hw.init =3D &init;
> =20
> -		err =3D devm_clk_hw_register(dev, &channel->mux.hw);
> +		err =3D devm_clk_hw_register(dev, &clks->mux.hw);
>  		if (err)
>  			return dev_err_probe(dev, err,
>  					     "failed to register %s\n", name);
> @@ -449,19 +456,19 @@ static int meson_pwm_init_channels(struct pwm_chip =
*chip)
>  		init.name =3D name;
>  		init.ops =3D &clk_divider_ops;
>  		init.flags =3D CLK_SET_RATE_PARENT;
> -		div_parent.index =3D -1;
> -		div_parent.hw =3D &channel->mux.hw;
> -		init.parent_data =3D &div_parent;
> +		pdata.index =3D -1;
> +		pdata.hw =3D &clks->mux.hw;
> +		init.parent_data =3D &pdata;

Is it safe to use a single pdata instead of separate div_parent +
gate_parent below as before? That should be a separate change then (or
at least motivated in the commit log.)

>  		init.num_parents =3D 1;
> =20
> -		channel->div.reg =3D meson->base + REG_MISC_AB;
> -		channel->div.shift =3D meson_pwm_per_channel_data[i].clk_div_shift;
> -		channel->div.width =3D MISC_CLK_DIV_WIDTH;
> -		channel->div.hw.init =3D &init;
> -		channel->div.flags =3D 0;
> -		channel->div.lock =3D &meson->lock;
> +		clks->div.reg =3D meson->base + REG_MISC_AB;
> +		clks->div.shift =3D meson_pwm_per_channel_data[i].clk_div_shift;
> +		clks->div.width =3D MISC_CLK_DIV_WIDTH;
> +		clks->div.hw.init =3D &init;
> +		clks->div.flags =3D 0;
> +		clks->div.lock =3D &meson->lock;
> =20
> -		err =3D devm_clk_hw_register(dev, &channel->div.hw);
> +		err =3D devm_clk_hw_register(dev, &clks->div.hw);
>  		if (err)
>  			return dev_err_probe(dev, err,
>  					     "failed to register %s\n", name);
> @@ -471,22 +478,22 @@ static int meson_pwm_init_channels(struct pwm_chip =
*chip)
>  		init.name =3D name;
>  		init.ops =3D &clk_gate_ops;
>  		init.flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
> -		gate_parent.index =3D -1;
> -		gate_parent.hw =3D &channel->div.hw;
> -		init.parent_data =3D &gate_parent;
> +		pdata.index =3D -1;
> +		pdata.hw =3D &clks->div.hw;
> +		init.parent_data =3D &pdata;
>  		init.num_parents =3D 1;
> =20
> [...]

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zt6g3v346aznprz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYZGogACgkQj4D7WH0S
/k7fEQf+NQGnK13u+LhUqW/7gz4svWQrnLUls2gZbxMsaAOp+aANWHeJHJOeA3xE
fvht30GOvICObIWWvMu1ZaRTSlj/qirKhSYckkZ/wuUpCC2J1Rov9Wsrg4N3Dhkz
KCqQc7B9LCrEqrzRbi52LO+t8OcplkY3C0m9qaw/ul4dKKeF87ip2dVxh4VCmO08
sYNxFarlAiGpU7Qgavk5gBYitR4JRVVcw//9uWpOx8AbeKZFwXlSNCLZnz67J73m
nzHpE9VYcvKMm8ZWE7TksbY88ZaLoehY3PyUx2Fxok00o27ubtMxXOt9m/v+yw3V
jLCR6LOd8c+LV6b4gGnHhwNKOXtm1w==
=gk25
-----END PGP SIGNATURE-----

--zt6g3v346aznprz2--


--===============7402659235411197099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7402659235411197099==--

