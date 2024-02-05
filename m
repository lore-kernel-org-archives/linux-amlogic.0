Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCE2C4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=patgfRIy/L2jzuBZsr2wz7rCPi/ERORmaj4zfOMrgeM=; b=T/EZumdP3F5h/3aX1aho8KEDhP
	8Py2x9ojvFiZS+i5dxRUoAHZUnLyQZi1INoPRQrY+d3zwnp3oIP+NLmHwu535HalFbo9/uxnN96k6
	6NmXLrmfnugO3isq7MbacR7avnuXIsiIpr/ZsOt8RR0mP8mORAOa3rdficF+fOTFYjhk6ebeiC1O6
	x31bB3dQMBwQql/UOAckiFczb5U1XcdLt5whtsqKfNca4HSZaglKqwjs8SowE6yvJ0YmotSmGWbrB
	7ecKp+TBM72UV2mAHIjBF6dFa8Or6t4vuQIJAlmxTM3fEVyb5gVjcnF2/JtYl9Wn3b6ScYQ8EvjDp
	CXkqE+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Ws-0000000469E-47v6;
	Mon, 05 Feb 2024 17:13:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Wq-0000000468M-07tu
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:13:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX2Wj-00075w-38; Mon, 05 Feb 2024 18:13:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX2Wi-004fmO-Ak; Mon, 05 Feb 2024 18:13:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rX2Wi-00Fix4-0l;
	Mon, 05 Feb 2024 18:13:00 +0100
Date: Mon, 5 Feb 2024 18:12:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 4/6] pwm: meson: use device data to carry information
 around
Message-ID: <pqnl66xnct5lqua36iasqws4kowhqtn6vkq7fml76pomcnatj4@q66n3siflgoc>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-5-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231222111658.832167-5-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_091308_250985_990EF4FB 
X-CRM114-Status: GOOD (  29.36  )
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
Content-Type: multipart/mixed; boundary="===============0498933376100117782=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0498933376100117782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="voyfq7wqr4wfqjna"
Content-Disposition: inline


--voyfq7wqr4wfqjna
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:16:52PM +0100, Jerome Brunet wrote:
> Use struct device data to carry the information data around, instead
> of embedded the pwm structure in it and using container_of()
>=20
> Doing so works just as well and makes it a little easier to add setup
> callback depending on the DT compatible.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index ef50c337f444..15c44185d784 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -101,7 +101,6 @@ struct meson_pwm_data {
>  };
> =20
>  struct meson_pwm {
> -	struct pwm_chip chip;
>  	const struct meson_pwm_data *data;
>  	struct meson_pwm_channel channels[MESON_NUM_PWMS];
>  	void __iomem *base;
> @@ -114,7 +113,7 @@ struct meson_pwm {
> =20
>  static inline struct meson_pwm *to_meson_pwm(struct pwm_chip *chip)
>  {
> -	return container_of(chip, struct meson_pwm, chip);
> +	return dev_get_drvdata(chip->dev);
>  }
> =20
>  static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> @@ -146,6 +145,7 @@ static int meson_pwm_calc(struct meson_pwm *meson, st=
ruct pwm_device *pwm,
>  			  const struct pwm_state *state)
>  {
>  	struct meson_pwm_channel *channel =3D &meson->channels[pwm->hwpwm];
> +	struct device *dev =3D pwm->chip->dev;
>  	unsigned int cnt, duty_cnt;
>  	unsigned long fin_freq;
>  	u64 duty, period, freq;
> @@ -168,19 +168,19 @@ static int meson_pwm_calc(struct meson_pwm *meson, =
struct pwm_device *pwm,
> =20
>  	fin_freq =3D clk_round_rate(channel->clk, freq);
>  	if (fin_freq =3D=3D 0) {
> -		dev_err(meson->chip.dev, "invalid source clock frequency\n");
> +		dev_err(dev, "invalid source clock frequency\n");
>  		return -EINVAL;
>  	}
> =20
> -	dev_dbg(meson->chip.dev, "fin_freq: %lu Hz\n", fin_freq);
> +	dev_dbg(dev, "fin_freq: %lu Hz\n", fin_freq);
> =20
>  	cnt =3D div_u64(fin_freq * period, NSEC_PER_SEC);
>  	if (cnt > 0xffff) {
> -		dev_err(meson->chip.dev, "unable to get period cnt\n");
> +		dev_err(dev, "unable to get period cnt\n");
>  		return -EINVAL;
>  	}
> =20
> -	dev_dbg(meson->chip.dev, "period=3D%llu cnt=3D%u\n", period, cnt);
> +	dev_dbg(dev, "period=3D%llu cnt=3D%u\n", period, cnt);
> =20
>  	if (duty =3D=3D period) {
>  		channel->hi =3D cnt;
> @@ -191,7 +191,7 @@ static int meson_pwm_calc(struct meson_pwm *meson, st=
ruct pwm_device *pwm,
>  	} else {
>  		duty_cnt =3D div_u64(fin_freq * duty, NSEC_PER_SEC);
> =20
> -		dev_dbg(meson->chip.dev, "duty=3D%llu duty_cnt=3D%u\n", duty, duty_cnt=
);
> +		dev_dbg(dev, "duty=3D%llu duty_cnt=3D%u\n", duty, duty_cnt);
> =20
>  		channel->hi =3D duty_cnt;
>  		channel->lo =3D cnt - duty_cnt;
> @@ -214,7 +214,7 @@ static void meson_pwm_enable(struct meson_pwm *meson,=
 struct pwm_device *pwm)
> =20
>  	err =3D clk_set_rate(channel->clk, channel->rate);
>  	if (err)
> -		dev_err(meson->chip.dev, "setting clock rate failed\n");
> +		dev_err(pwm->chip->dev, "setting clock rate failed\n");
> =20
>  	spin_lock_irqsave(&meson->lock, flags);
> =20
> @@ -425,10 +425,10 @@ static const struct of_device_id meson_pwm_matches[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, meson_pwm_matches);
> =20
> -static int meson_pwm_init_channels(struct meson_pwm *meson)
> +static int meson_pwm_init_channels(struct device *dev)
>  {
>  	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] =3D {};
> -	struct device *dev =3D meson->chip.dev;
> +	struct meson_pwm *meson =3D dev_get_drvdata(dev);
>  	unsigned int i;
>  	char name[255];
>  	int err;
> @@ -438,7 +438,7 @@ static int meson_pwm_init_channels(struct meson_pwm *=
meson)
>  		mux_parent_data[i].name =3D meson->data->parent_names[i];
>  	}
> =20
> -	for (i =3D 0; i < meson->chip.npwm; i++) {
> +	for (i =3D 0; i < MESON_NUM_PWMS; i++) {
>  		struct meson_pwm_channel *channel =3D &meson->channels[i];
>  		struct clk_parent_data div_parent =3D {}, gate_parent =3D {};
>  		struct clk_init_data init =3D {};
> @@ -519,28 +519,35 @@ static int meson_pwm_init_channels(struct meson_pwm=
 *meson)
>  static int meson_pwm_probe(struct platform_device *pdev)
>  {
>  	struct meson_pwm *meson;
> +	struct pwm_chip *chip;
>  	int err;
> =20
> +	chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
>  	meson =3D devm_kzalloc(&pdev->dev, sizeof(*meson), GFP_KERNEL);
>  	if (!meson)
>  		return -ENOMEM;
> =20
> +	platform_set_drvdata(pdev, meson);
> +
>  	meson->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(meson->base))
>  		return PTR_ERR(meson->base);
> =20
>  	spin_lock_init(&meson->lock);
> -	meson->chip.dev =3D &pdev->dev;
> -	meson->chip.ops =3D &meson_pwm_ops;
> -	meson->chip.npwm =3D MESON_NUM_PWMS;
> +	chip->dev =3D &pdev->dev;
> +	chip->ops =3D &meson_pwm_ops;
> +	chip->npwm =3D MESON_NUM_PWMS;
> =20
>  	meson->data =3D of_device_get_match_data(&pdev->dev);
> =20
> -	err =3D meson_pwm_init_channels(meson);
> +	err =3D meson_pwm_init_channels(&pdev->dev);
>  	if (err < 0)
>  		return err;
> =20
> -	err =3D devm_pwmchip_add(&pdev->dev, &meson->chip);
> +	err =3D devm_pwmchip_add(&pdev->dev, chip);
>  	if (err < 0)
>  		return dev_err_probe(&pdev->dev, err,
>  				     "failed to register PWM chip\n");

Parts of this change overlap with plans I have for this driver. I
reworked the series a bit now, also affecting the meson driver, the
previous submission is available at https://lore.kernel.org/linux-pwm/bf6f7=
c6253041f60ee8f35b5c9c9e8d595332fb0.1706182805.git.u.kleine-koenig@pengutro=
nix.de

I don't see the nice benefit of this patch yet, but I assume this will
become clearer when I check the next patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--voyfq7wqr4wfqjna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXBFxoACgkQj4D7WH0S
/k72nQf+IGMFjJhnAxpe5W/SenQ9OKMDvDdK3NQZJzAbpesp+8IZOGQZRm2A+Sfi
Gc6jnojrIEatsUjka7OYSAEeROGlXSGAyr8MPQrJ/I0F8S/vTVitzuEjWE3NfF0+
964qrl7BXu3pZGuDbYp8/9TtW4jAzwM7xvbEpXiNvQACJwuup1L2oFtUEywgi1Fp
bGcfi7aj8Uwwnyfn71liHDz4mAvBJU/Qeigy0V9tERQATdWeGfyq9Vy6NH9k82e8
ARl2sPj/XSAhN7pF8uVmGUPNfsSmsedgtFwQjGlRBE9aEn4skUO15n28/8upecgT
NMrB9pZckysIa5kQ5qMJxQXePtayJQ==
=2Fbw
-----END PGP SIGNATURE-----

--voyfq7wqr4wfqjna--


--===============0498933376100117782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0498933376100117782==--

