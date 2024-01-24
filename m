Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E61C46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J0yK8n5KqQZ+02+g9peEA7+hQ59uDzaE0sGlLMOunw=; b=J03JowyvNIbTKUSVlIbLwPJkq1
	2pXZh0YkNhY19uqHlsk2YhPsZKeszO2bUAAtI6aNigblJDySNJa6/ZvcZHvriXNOPohmOGlO+nExV
	a12AhKLp0QdLLHWhBX7clJKlr8MVHp8E/uyDFip1DjOK2x84vbC664KRg4Zxo6he/O/v4Q6esDsG7
	i657Jb5jF5RBsTUyiuNJqFvX7T9G2ikZWnuxLtJbDAKwd6CMKEaEUwKKGBqhxpBh8ctYVhynMIw9v
	LJNcaENJiEsEzt4O8cYWcmPzfLe1usZF553BEJpISLaco45+mNDdZkWlLDkBMAlunA6digapoEy6o
	mCCAae9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZFO-0027dS-2O;
	Wed, 24 Jan 2024 09:08:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZFL-0027bh-1u
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:08:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZFF-0001ed-9Q; Wed, 24 Jan 2024 10:08:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZFE-0021Y0-I6; Wed, 24 Jan 2024 10:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZFE-0070pg-1U;
	Wed, 24 Jan 2024 10:08:28 +0100
Date: Wed, 24 Jan 2024 10:08:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 3/6] pwm: meson: generalize 4 inputs clock on meson8
 pwm type
Message-ID: <4kcbh4dezgpic2dpgdi2swtx2puqiq74w2tungmxipf4nznpn7@u4g4f3cimps4>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-4-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231222111658.832167-4-jbrunet@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_010835_627734_3F1B9AB8 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: multipart/mixed; boundary="===============1847407041774279227=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1847407041774279227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6rb4fnput74ewssa"
Content-Disposition: inline


--6rb4fnput74ewssa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jerome,

On Fri, Dec 22, 2023 at 12:16:51PM +0100, Jerome Brunet wrote:
> Meson8 pwm type always has 4 input clocks. Some inputs may be grounded,
> like in the AO domain of some SoCs.
>=20
> Drop the parent number parameter and make this is constant.
> This is also done to make addition of generic meson8 compatible easier.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 2971bbf3b5e7..ef50c337f444 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -60,7 +60,7 @@
>  #define MISC_A_EN		BIT(0)
> =20
>  #define MESON_NUM_PWMS		2
> -#define MESON_MAX_MUX_PARENTS	4
> +#define MESON_NUM_MUX_PARENTS	4
> =20
>  static struct meson_pwm_channel_data {
>  	u8		reg_offset;
> @@ -98,7 +98,6 @@ struct meson_pwm_channel {
> =20
>  struct meson_pwm_data {
>  	const char * const *parent_names;

I suggest to make this

	const char *parent_names[MESON_NUM_MUX_PARENTS];

to make it more explicit that really four entries are needed here. This
also makes is unnecessary to add the additional NULL entries to
pwm_gxbb_ao_parent_names and the other arrays.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6rb4fnput74ewssa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWw04sACgkQj4D7WH0S
/k4MBwf/RJ2RnPMTRGHy4+MlxDEmIhRVYEzgGL1RRFV939kzYtusENpZpGIQ2mXu
E60HnA+QkB/q4MoAFSLk81DulYhW3fIn7AURwQ19rdCtgn3d+7zGnA+G+JiPmCXx
I0jHMlpak+0iexEcTDeahUHixs0DrxD1/kG9eTtipV17OZuBlTGyw8QDqcHAKFow
0czC72kNUxlOp/W77jS0V367u/onArkMSIOh1N4JZ+yNX0ZuOugc18RD0wU5eCo3
FASi7J+U/zZaBAFXeS2BXMrq1bLMjBmrc6dDGoNusqCD/YGfTqxQKmptwFcHWvQy
huYzkvDx8jvj6TmgK+i+/+PjgTV9ow==
=0D4C
-----END PGP SIGNATURE-----

--6rb4fnput74ewssa--


--===============1847407041774279227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1847407041774279227==--

