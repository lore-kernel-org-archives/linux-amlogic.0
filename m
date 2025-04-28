Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A440C369D5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NLcUYvzLghcD6rVEoTCIQDIMP3+obMFP5BTIzZM0uM=; b=ASMoJlefKxdrIiY83cy0lhwGeC
	ohwJFj2BWzHapBzWIlIzObRtYuvEQJGyRILCc56YmlYdo2HqmPj7NoTAdSi8Lo40h+47LtYS/WjRY
	tl5P0h+kTOldDd7rvYitvnOk9nPnGKQ3JLNwS9Ql8T6IIknkY7GTd9f3TdAEOv+1pxPTADrqRuXH1
	LtFGF6DKRJss+Q7g8ToErc11VKk9E5dpFxyD5er/jD5r3aHLuafqDtqz10B9zFS9lmU4o0AyM5KBu
	UjS2x9ywObg/9JrNBohMa+dRMX/Wbe1KA74J85WjjiXG66mk6FWZ2UPStLCRjHzIf7ArUcICQYLrF
	nQd6bDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NMs-0000000684P-36Ym;
	Mon, 28 Apr 2025 12:13:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mpb-00000005zqX-2XVV;
	Mon, 28 Apr 2025 11:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6268F5C6341;
	Mon, 28 Apr 2025 11:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08E5C4CEE4;
	Mon, 28 Apr 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745840366;
	bh=Ej44d3HYVlonJrSjsWIukJSaPhl3M6jkQ+SB3SSTJ0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kv5vEYW72D5xWIDAHxidcS9oCPJI44A8/ATQTf4ndN6qOsRqnp47tGXt9HvXJ/fQX
	 3iRGABjyVGdhzFevrJ/SKs1Tn/HzL+ntZXhZ5I1oZh84TTNujKuXIYiSDMBZKDmg+y
	 AZfXDlw/mqs0mSwnN/keOFUJawtzrADt0D2HQYrOGgjrUXRSD84c7R7w7ycC/jTcSm
	 x5DFNVaWHIOalypJx7V9K0lMtgehomF12uxSSBqBSLV7GPuCCodkBNURuekRYK6SrF
	 nsCQ8roU5zy+dQ7EL1D9afZHfQm0EFsh/r0zRlmzrK5FfE/2zo1iP9Ttr0hP07NjcV
	 75neqPgVXdgzA==
Date: Mon, 28 Apr 2025 13:39:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250428-wild-condor-of-defiance-cadf60@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_043927_722719_0941C156 
X-CRM114-Status: GOOD (  15.87  )
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
Content-Type: multipart/mixed; boundary="===============8300211915595251492=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8300211915595251492==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xfc7ogpscqj7tsh5"
Content-Disposition: inline


--xfc7ogpscqj7tsh5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> The devm lifetime management of this driver is peculiar. The underlying
> device for the panel_bridge is the panel, and the devm lifetime is tied t=
he
> panel device (panel->dev). However the panel_bridge allocation is not
> performed by the panel driver, but rather by a separate entity (typically
> the previous bridge in the encoder chain).
>=20
> Thus when that separate entoty is destroyed, the panel_bridge is not
> removed automatically by devm, so it is rather done explicitly by calling
> drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> panel_bridge in current code, so update it as well to put the bridge
> reference instead.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This looks fine, but we need a TODO entry to clean this up later on, and
a comment on devm_drm_put_bridge that this is inherently unsafe and
must not be used.

Maxime

--xfc7ogpscqj7tsh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaA9o4wAKCRAnX84Zoj2+
dte3AX9ZTgylvSMOA8QF8MhOvEEJnfPIVewZiCH2yJknukV+y7S53MU2E4s0YFaN
fsm4AaQBgIRYfqhWPjcnqXHC20V8llKYAK0QvK8ijj3k2G8LjbRoIfmGL11UOfGM
QmUfHGyQeA==
=AGTY
-----END PGP SIGNATURE-----

--xfc7ogpscqj7tsh5--


--===============8300211915595251492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8300211915595251492==--

