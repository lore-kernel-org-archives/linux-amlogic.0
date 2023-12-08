Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F2C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP4+EeEmZqJ1V4X3+DSlMCFS6O+2il54HDig+PgBauY=; b=HpgEyb9RgEWuQMS+WcCfyuYRXm
	YGwOl6oX7F1v4fn5yd6sMXo1GrDGc1TKGUvrall3gaDH7NAOr5/0SQ9L0dnrqzKdXHN6XprFYhdct
	HVkrLa1PhwEYiMxcC9ME+YGooFt+nyq+fzKAbjOTuybVQ+UWb6Bo6L5lrLnIvKtY9Rl8U+l8Ba1N/
	exA7N9NKdk/Y38x+hNBCBih5bOJE3Vyuc3TDTUpaGeYmHNJu9tgCihfVv6jUEPTq3caOqiug2n06g
	nGBnS5ab6buRgP2T+S9jIQDA50ecrijSZa21xX0gm4/9Vqp3DQU1cK/gT7jCDZTTSyBedxFpheGcw
	76xFSEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdA0-00FxFn-2J;
	Fri, 08 Dec 2023 15:53:04 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBd9x-00FxF5-2O;
	Fri, 08 Dec 2023 15:53:03 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so3168555a12.3;
        Fri, 08 Dec 2023 07:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702050779; x=1702655579; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK8omqPLoVqiOsm4awtdyTo/Ew6UFIDOki73tZQJSz8=;
        b=a33wdY/iX6ZLjUmdh7WDcXEtQVU/Dk2teu+4sPpB6PPUI7JKU6Q9zoSlv4J+SiZIE0
         HQ8lzNUxmohpZVZJ+pEu0wi4lF8Geel1nA8AllQENJgaP70z2/3WDD4Ph2LYa0cgOegW
         GHlwPfObLugBO2a4WSKTLIZ+XCb39LLbPCaBbyIu8UluDOMo2rHBFVc3Azpu1eE6kYfp
         LDekLlTMl4DEmlyYTu+WfBHXnk6epoX1DC8isY9zjI7i9oyhakg5esvfp00Sk0BGTeIJ
         AfeL1YpelqI4Q9kpZKTLm5dfYtCg/BjU05Tjfd971pK6qL3iWnRx3WsCBHk7ZEVBZQU6
         eGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702050779; x=1702655579;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK8omqPLoVqiOsm4awtdyTo/Ew6UFIDOki73tZQJSz8=;
        b=Ja91JwfUEUaGweNNtPMIwM28rDNbgKkFKec8TnLugg/q9przV4ZwJb5ZQ1E1cmarbt
         Oyn6YV9rVDsnEr5FnKHSRx7GcCThFS4vsyj3klHXtblES85un5o2etIUCYhHscDae6OO
         CfDVjadpOsPsEnhbZ2EV+kYAPvBtr3awUFs79MpNUvq65mBKUQ1PKSGta0OX64NnLJCM
         S5aWKAvcHhPbF6ZwoYevaV8faEJlFLZstuKXuVzAOKdvp3embBwIoxg1aKBKOIEmvKD7
         QMhkkNILAndfTCDg4zmCqkT84l9ijeHS5AuDP36rKrM5XWAF7h+jFpqZRfLhPtvH78kH
         43jg==
X-Gm-Message-State: AOJu0Yy1VnWIwuSBpP+YNnpJ6d/U73Qnt68Eu/5mcnSB+mCFNFy6Z6qv
	QUG+ySALt4yR2Ccwz+domrg=
X-Google-Smtp-Source: AGHT+IHpMrVO3d6Ofvo2ML3ArtLwJwriv8zExcKT1eKTy3Od/ySm4fjfkpJKt9IuN5T1oFol/XLNvw==
X-Received: by 2002:a50:a419:0:b0:54c:4837:7d28 with SMTP id u25-20020a50a419000000b0054c48377d28mr156936edb.103.1702050779370;
        Fri, 08 Dec 2023 07:52:59 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l28-20020a50d6dc000000b0054ca3df2257sm934412edj.36.2023.12.08.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:52:58 -0800 (PST)
Date: Fri, 8 Dec 2023 16:52:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <ZXM72QYBbb32Q_aL@orome.fritz.box>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_075301_797785_1BDDA48D 
X-CRM114-Status: GOOD (  24.11  )
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
Content-Type: multipart/mixed; boundary="===============2311680209304592211=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2311680209304592211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="immTF9VRZDK7uFRg"
Content-Disposition: inline


--immTF9VRZDK7uFRg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 10:48:18PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Using dev_err_probe() emitting an error message mentioning a return
> value and returning that value can be done in a single statement. Make
> use of that to simplify the probe part of the driver. This has the
> additional advantage to emit the symbolic name for the error instead of
> the integer error value.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> while trying to understand Jerome's series[1] I noticed this patch
> opportunity.
>=20
> Best regards
> Uwe
>=20
> [1] https://lore.kernel.org/linux-pwm/20231129134004.3642121-1-jbrunet@ba=
ylibre.com
>=20
>  drivers/pwm/pwm-meson.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 5bea53243ed2..2971bbf3b5e7 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -468,10 +468,9 @@ static int meson_pwm_init_channels(struct meson_pwm =
*meson)
>  		channel->mux.hw.init =3D &init;
> =20
>  		err =3D devm_clk_hw_register(dev, &channel->mux.hw);
> -		if (err) {
> -			dev_err(dev, "failed to register %s: %d\n", name, err);
> -			return err;
> -		}
> +		if (err)
> +			return dev_err_probe(dev, err,
> +					     "failed to register %s\n", name);
> =20
>  		snprintf(name, sizeof(name), "%s#div%u", dev_name(dev), i);
> =20
> @@ -491,10 +490,9 @@ static int meson_pwm_init_channels(struct meson_pwm =
*meson)
>  		channel->div.lock =3D &meson->lock;
> =20
>  		err =3D devm_clk_hw_register(dev, &channel->div.hw);
> -		if (err) {
> -			dev_err(dev, "failed to register %s: %d\n", name, err);
> -			return err;
> -		}
> +		if (err)
> +			return dev_err_probe(dev, err,
> +					     "failed to register %s\n", name);
> =20
>  		snprintf(name, sizeof(name), "%s#gate%u", dev_name(dev), i);
> =20
> @@ -513,17 +511,13 @@ static int meson_pwm_init_channels(struct meson_pwm=
 *meson)
>  		channel->gate.lock =3D &meson->lock;
> =20
>  		err =3D devm_clk_hw_register(dev, &channel->gate.hw);
> -		if (err) {
> -			dev_err(dev, "failed to register %s: %d\n", name, err);
> -			return err;
> -		}
> +		if (err)
> +			return dev_err_probe(dev, err, "failed to register %s\n", name);
> =20
>  		channel->clk =3D devm_clk_hw_get_clk(dev, &channel->gate.hw, NULL);
> -		if (IS_ERR(channel->clk)) {
> -			err =3D PTR_ERR(channel->clk);
> -			dev_err(dev, "failed to register %s: %d\n", name, err);
> -			return err;
> -		}
> +		if (IS_ERR(channel->clk))
> +			return dev_err_probe(dev, PTR_ERR(channel->clk),
> +					     "failed to register %s\n", name);
>  	}
> =20
>  	return 0;
> @@ -554,10 +548,9 @@ static int meson_pwm_probe(struct platform_device *p=
dev)
>  		return err;
> =20
>  	err =3D devm_pwmchip_add(&pdev->dev, &meson->chip);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register PWM chip: %d\n", err);
> -		return err;
> -	}
> +	if (err < 0)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to register PWM chip\n");
> =20
>  	return 0;
>  }

This is a lot of churn for very little gain. None of these functions are
ever going to return -EPROBE_DEFER. And yes, I know that function's doc
says that it is "deemed acceptable to use" elsewhere. However, the
existing error messages are just fine, no need to churn just for the
sake of it.

Thierry

--immTF9VRZDK7uFRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVzO9kACgkQ3SOs138+
s6GRTw//SbehEz+5xIvNN1xg+VE3T4JUCI/u64M/sLYpNyYgX4u/WRwvrENS6Qn+
U21ZlVm7DvysGD18hbuvriT76y4hkvMwXHaGONCiMzuH+b8+fZLYoCAPUsX1oIfO
daWOooKW2BGoYXXk3vC/5apPh6y/Ea1lTtFli8lfmoMsIw3vI7tJoPF2iaLXActd
y4q9fujSNm2hL2HWHv0CkM/Sx9JJ2GwfXB6lqtguVDYTXDpECcUu/a7TqSUPK0hO
dIPYfXEQLQW3XWMMuL9LnHqsK+CnzBpMzvFtOwrA7a8Kocq/zWUmJGM5Afp5g9lD
FNInrmijDrZXgrr6CkygOYaxK3a/SzFNLI9RTlhMPGALf7VEUTi7PPL/WvvCRA9B
Qp19gBGkFhRf1d6exWFleBuXAgmXPb31+USb6hXooR0T4VvlhMKKzVBLjcS2vJQg
MqwQRLYYG4oDrKqCs7e3AFWBm0ZSjKz+kNhlqykUXIzB7Jsjeu5BTknn7xXMGqgT
fOeSsP1UF3C19jUpyLXgZnQc2frm2ZIorFSzWNC2kaqpq2r6QU7oxzE/M3fZjwNu
AMcELQlmkfb49YAi4cHqBn1e4YQGVokKu3XJ7oIhVu9fNcUOdeJkUN/OutBHxHO5
lm7KNpVG+L7U95f5VRrIk9nt2ul0sDUzTXvbWq1xmlZ//hODsL8=
=EgR/
-----END PGP SIGNATURE-----

--immTF9VRZDK7uFRg--


--===============2311680209304592211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2311680209304592211==--

