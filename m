Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABAFCFD317
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Nov 2025 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCNwWgDmO8i5XrjdpDnoms3G1dlAJkBhp9ivCK6fJOk=; b=LTT84Okhi8Bz21zkS/UVuCU9jx
	AKsfuwv4R5BOlhU1WjpxSosljfnwoLsEQOVyYcOpfyc3g0SgWONhDkcdGawrIvM2YT9KR42/0LOvn
	8vXVRYkcB4JG85aw5wX+RrVEwKtHvGAfrJpP9nHDg9gmLTz7jhaaqPFBP7vqe1CFUB9cs+r9W++f+
	nlFyjNF60fwzV0LFWrPkba1iegYwtSiX9RLjQ2jYFzvhdRk9rNvV48VwM+Gw48bC0+jJH2NKw1MF6
	qrqQIrY/tGpd/LVF8uGwomUYQprKf+Jar3aPai2hUPafuReSEYGPD32kXeAbQHuEVoqkuj8cryVAg
	psoCWPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTi9-0000000BPz2-2ika;
	Mon, 24 Nov 2025 10:22:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTi8-0000000BPyW-0DJ0;
	Mon, 24 Nov 2025 10:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 212044171B;
	Mon, 24 Nov 2025 10:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78505C4CEF1;
	Mon, 24 Nov 2025 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763979739;
	bh=vG8b+2CQzdRnuQXiRJDw26mPA9qaScPOG3Xzi0JGSIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMsA3xuF9whWsJmvFblKZ1a0SMk6HmlWL2PGt3P6I9UB9gKlBKJvxNQIqyImbB2+w
	 UHDqEe8FqstWPN+9wTomzyjfG/nJt4TJRiJoekst0kKECYRqRT7jtRIkk8hFzL5cpW
	 WjcNOLNfM+LqBrGYTCzeS06j67jahMW/oKuKHQQs2f8ax3g/uzePWvclNEv14OFg42
	 fuB/Gi6exKUefjU9AyuIIPG5FeqOkqe3c2NJJnqQ4vFoHWKQW7HTlitlhXDHtFvS14
	 zpA8tVRznNgsQhntyQDCPgEk4XiqTStdNb8uRAn/ORwmSfnDh7kQZOkLH5EmZgV0iM
	 Ia9THk/Lp5cuw==
Date: Mon, 24 Nov 2025 11:22:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper of
 drm_of_find_bridge()
Message-ID: <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_022220_131978_7D9D93C0 
X-CRM114-Status: GOOD (  23.50  )
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
Content-Type: multipart/mixed; boundary="===============4645826087884335479=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4645826087884335479==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dmizbp3zdogu4qw3"
Content-Disposition: inline


--dmizbp3zdogu4qw3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper of
 drm_of_find_bridge()
MIME-Version: 1.0

Hi,

On Wed, Nov 19, 2025 at 02:05:35PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to drm_of_find_bridge() except it does
> not increment the refcount. Rewrite it as a wrapper and put the bridge
> being returned so the behaviour is still the same.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Kind of the same comment than on the TODO. Is it worth doing that patch
when we could just remove it at the end of the series?

> ---
>  drivers/gpu/drm/drm_bridge.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6debbf20aaa8..09ad825f9cb8 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1460,19 +1460,11 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>   */
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
> -	struct drm_bridge *bridge;
> -
> -	mutex_lock(&bridge_lock);
> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
> =20
> -	list_for_each_entry(bridge, &bridge_list, list) {
> -		if (bridge->of_node =3D=3D np) {
> -			mutex_unlock(&bridge_lock);
> -			return bridge;
> -		}
> -	}
> +	drm_bridge_put(bridge);

And if it does make sense to keep that patch, we should add a comment
here to document why we are doing this.

Maxime

--dmizbp3zdogu4qw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQx1wAKCRAnX84Zoj2+
droMAX9AwjzNkiVVp54sB5cGjanhNIfAXN/GCN6vMwvaW4WE5QK8yK5sEqljCQtu
qmElUSYBfiVitl5ixznQWTkWrB9qwjh7e/qpBdL40CpZ/bCkdh6quqMRu/qv6niz
cBIXzVbHng==
=8fBn
-----END PGP SIGNATURE-----

--dmizbp3zdogu4qw3--


--===============4645826087884335479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4645826087884335479==--

