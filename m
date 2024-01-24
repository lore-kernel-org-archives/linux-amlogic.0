Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9CCC46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=087RvVMy7A6ZroC34DWKKpZhdQvq7jBfJ77LquutuGY=; b=b4FpsWRbFgQVQ7QEq0dBkG7NvD
	yEC57Cj/tKON3bKSTMYB32u+yL2Qvdj64mljmVk9jIZ9opyYus5qjkcdPTnSF24Y3VybFanm3KRUU
	lb/CND1XnSp10J+rOd2k2UhvrkYNn2oNirpRzAYOVgl94dlCRbuHwsU788WVaNaR6li9q4EgZ1G2f
	b95D/dNV485coJBU30VOxgSouQwZ9R29HVPwpwr93mefRqyQSBzWl/Wd91idc4TgUJvEZDto5ZdIY
	II4/zwLBmprNs/klJcIXHsCrDDosAvdKl5boUyyC+GwsF149tNg1P5GJ+SozcLuqdRcHbRPIKTcTp
	TbQAR5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSazl-002e9Z-2A;
	Wed, 24 Jan 2024 11:00:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZrv-002Kfr-0F
	for linux-amlogic@bombadil.infradead.org;
	Wed, 24 Jan 2024 09:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xg1izc/lSfKSy66iJxzXjiZZ2OlhrUzg8hXvaqaB8n8=; b=IlnCvsCOtvVpFkQdn0LbPfGQA+
	sytDs7D97eBGpcOLvKJlhHOO7M5emux31c7ujv39PKgXPg9xHJLzI69Vnp/iGQZRw0sW0nFddtR+H
	OPutwuokG7m4E2yQ7WocHHhVgSJkn0Q9Z8A442WQSVaw2olAA7HKY9pZg6YeFfBLnEILF7E+1d37G
	ZeRawgVHLr5roLCmiq3y34ShA9DOL87QVbz1fyvC5oPyJ8eiHnHBIgTV4cPvzC3FgKqQO+dKIL8Uf
	Fl9tmMBZEZ9N9mxx0950kfAxU9UmQOQVTeQTMSbBs30WdLrWI1w1ERkmrtnpIbPnmTPztC3oPez5t
	FIsuTMPQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSZrr-00000004NiD-0fal
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:48:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZrk-0004BM-78; Wed, 24 Jan 2024 10:48:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZrj-0021hH-Cn; Wed, 24 Jan 2024 10:48:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZrj-0071yh-0x;
	Wed, 24 Jan 2024 10:48:15 +0100
Date: Wed, 24 Jan 2024 10:48:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 5/6] pwm: meson: don't carry internal clock elements
 around
Message-ID: <jlrptw2norojxgpfmsybv6b5aq3epkdkqvri2l2rkvtx5qofjd@q4ggezt47a42>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-6-jbrunet@baylibre.com>
 <gyhea42rtydw3g45lfkfbxfm6xcbwibz67vw7xke2sm7powz2a@i33g4pyanu4l>
 <1jttn3w0ja.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jttn3w0ja.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_094823_389229_EC5B7A21 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Type: multipart/mixed; boundary="===============7895263486955227729=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7895263486955227729==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bi3q4dz4cz4stt46"
Content-Disposition: inline


--bi3q4dz4cz4stt46
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jerome,

On Wed, Jan 24, 2024 at 10:16:17AM +0100, Jerome Brunet wrote:
> On Wed 24 Jan 2024 at 10:02, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de> wrote:
> > On Fri, Dec 22, 2023 at 12:16:53PM +0100, Jerome Brunet wrote:
> >> @@ -442,6 +439,13 @@ static int meson_pwm_init_channels(struct device =
*dev)
> >>  		struct meson_pwm_channel *channel =3D &meson->channels[i];
> >>  		struct clk_parent_data div_parent =3D {}, gate_parent =3D {};
> >>  		struct clk_init_data init =3D {};
> >> +		struct clk_divider *div;
> >> +		struct clk_gate *gate;
> >> +		struct clk_mux *mux;
> >> +
> >> +		mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> >> +		if (!mux)
> >> +			return -ENOMEM;
> >
> > I don't like this change. While it doesn't increase the memory used, it
> > fragments the used memory and increases the overhead of memory
> > management and the number of devm allocations.
> >
> > Are these members of meson_pwm_channel in the way for anything later?
>=20
> Not really. It is just not useful on the SoCs which do use it and not
> used at all starting from s4/a1.

This remembers me about the old pwm-imx driver. This was essentially a
single file containing two drivers just because both types appeared on
imx machines. Later it was split into imx1 and imx27.

I didn't look at the relevant differences between the existing driver
and the changes needed for s4, but please don't repeat this issue for
meson. Not sure this fear is justified, just saying ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bi3q4dz4cz4stt46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWw3N4ACgkQj4D7WH0S
/k4dMAgAozpZ4OhSVfUnrblhtpzwr4SXMznUu/lW+ZcUZ39z8nQi29MQxtKkYOnJ
UmUDaTwxqWcWOCGOuIL7XksK2uJOhIpH/kRatrulGYfDznloAAhSN/TSrpQ/BPuX
4P+kRVTDpJggZ6AjKnPZgRqxNOxIpdFhRcKbgpCMuA7FKRNZhB7FzB5qJPn1VM3D
ghXMcPWD8wH1gG4q/4bVk2vnpZFekLy14qP2MNYk+uEptXHM6bFtHhhxyWaCx/lQ
Jd6oR9jeQLudBE0oel+3dHv4rPLV4bc3XSKZBzK5xT5rv2ZXk8IgRoZpRopCkz4O
apNjdhV0xQJvpJ5gDWpPw1TLQVFVxA==
=SWXC
-----END PGP SIGNATURE-----

--bi3q4dz4cz4stt46--


--===============7895263486955227729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7895263486955227729==--

