Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E74FC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Dec 2023 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9FWilDvY6K0TCLB4MJLKpIXfvtARDhiYH8Cs0H85t0=; b=1y8gCCMPzqoTigcS1PQOgaY6M+
	e8Fsow5qL5FuJu1eVzNo90g5LS5FuMeL59nzAOmkqWDOGR90+GqusnZqNiskfEaM3261mIpI5iFhc
	mAiaf6DtnuGHgmg9BJs7YVIH+9tr4MK3SbTpI44hFybdgulcMmczhaluZAiaB+PeNcD12v8u38898
	VFTsw07TKVl9qHwTuZODO1ibgHzJUI++Tgd8D8DI1TKmVRROJhnzOzfFKajfBpZTYJKX8yfdJq5dX
	Yl4z+LW0OooXbRFHfjusAZLkZsF/G//dsCtGQVfiGUDQhJK2T53DrBGtzacJtmS1CALykvWDhy2ay
	yEMAr9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJTa-00DuC5-0S;
	Wed, 13 Dec 2023 07:16:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJTW-00DuBb-1W;
	Wed, 13 Dec 2023 07:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4248DCE0AD1;
	Wed, 13 Dec 2023 07:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022A2C433C8;
	Wed, 13 Dec 2023 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702451767;
	bh=rjW4FqNS7dqFf2D6s0wEqUZechtIxjdG/6g1Uueb+xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkJyYqUqmsv8rO254rdUW4eXIFC+gLoifUFXtE7qCu7DsCIBON/xSS0U0wc21QazB
	 rJK8Lq60VmOKEcAS3bIh5/xesPMvfpwujc4U7mejCJcNShGXQXY+2tvEMdgA2cSOzV
	 zMUrYTcAi4ytjc2q1YjCXcUYEjp5b4r4MbsUbSVpzz5/TRYnrhPrdHCwssy6siBKVA
	 4g3d+lWT/ZEApSO5LSYHOKo3uawaCfiDJtwvdfr33JCmtluqt6RM8Rdz6/tufvqvOr
	 tMV3BKbcKQwe5paAnsZTd+kTQI40qefYumD/PkP7gptEep5V/lYPBjk/RJk2g6gFGl
	 mQbcT5pj2oZFw==
Date: Wed, 13 Dec 2023 08:16:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Georgi Djakov <djakov@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_231610_885811_3AA3B361 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: multipart/mixed; boundary="===============5287682531688143345=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5287682531688143345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m7hyngpcks2t5pei"
Content-Disposition: inline


--m7hyngpcks2t5pei
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
> that and don't check the return value. This series fixes the four users
> that do error checking on the returned value and then makes function
> return void.
>=20
> Given that the changes to the drivers are simple and so merge conflicts
> (if any) should be easy to handle, I suggest to merge this complete
> series via the clk tree.

I don't think it's the right way to go about it.

clk_rate_exclusive_get() should be expected to fail. For example if
there's another user getting an exclusive rate on the same clock.

If we're not checking for it right now, then it should probably be
fixed, but the callers checking for the error are right to do so if they
rely on an exclusive rate. It's the ones that don't that should be
modified.

Maxime

--m7hyngpcks2t5pei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXlaNAAKCRDj7w1vZxhR
xdMoAP0SfIOFl6Fc7FcIbVyoWZh/iWhJLszL7a709z02B76E0QEApMmexIdN3NIS
P/kaPqH5SfyvBxS6tWkFW1spZ1vSVQE=
=f1uM
-----END PGP SIGNATURE-----

--m7hyngpcks2t5pei--


--===============5287682531688143345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5287682531688143345==--

