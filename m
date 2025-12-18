Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C13D6ACFB
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Dec 2025 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1rjg6Anl7bcxdW2pnIjFEKC7sDd4CLbUEj0++gfpqM=; b=mY8F1nHrKXv01pGP0L9oJEwopd
	OcNjIOSZ6qrbZb6KU60ZfXt0Jas083I7hKCerGxI3PWKv3r6PiOD8ZI2owlBlShGNdyB36RCiLN0G
	vazk5kEe3RW3fcu8Pkqcdk8+v1RrJLj9S9nBi7mI9flw2b8RNfPMwVuKjByW+qN2FE7r14WEn0vc0
	7atZEghWT4mIuLx2fsMm8vguxzJ8SL5X9Ot0MJcvMyzYscRnkQ7ObbLBM/pnXWywWylolkpel2aeP
	sfxTjzJ/9pfmC5p4g2SjrKDSJHtEED+6sckOzECg7UfO3RC84PzqtRDe4RDpVQrybLledpgvzqXwy
	/UNhNsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDSt-00000008R6Y-2RxZ;
	Thu, 18 Dec 2025 12:50:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDSr-00000008R69-2AzP;
	Thu, 18 Dec 2025 12:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62A2160123;
	Thu, 18 Dec 2025 12:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F473C116B1;
	Thu, 18 Dec 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766062240;
	bh=Zhj03AbbOmOd3fZIlx006hZCyE5QvjNNAfFodJdpKhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7EbKW1dGx7j7mWKhfmU60knOCzLOmUcabi+gxUzgLC+uEdwqWurPXJPZXuCCV0H/
	 H1slZ7+kvqFN8U0pnmWGBSaYi+x98e2WXTpJyqtIZuAc0Jq7UuuqPe8ogVNHIw+pr1
	 HfBwaGZD7uKTxNZKzXg/WAEN4h7f7okJ04vzQOLkAYaqjYQSOBkXi05ICZxcVd03vC
	 1NvhPTx6ft+8u/CYHxULLLWN9rNRm35YX+4KoPQlc3lzh21qEdCACl7S7KMGkA4/pU
	 EpEajcg2EuRSI3G2gFgRBhe3V4N0TGTcI8BrOn8DjU/ltSjj6888eDfGrpquQbkopI
	 W2k/RZ/dZUn+Q==
Date: Thu, 18 Dec 2025 13:50:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jonathan Corbet <corbet@lwn.net>, 
	Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Phong LE <ple@baylibre.com>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Message-ID: <20251218-shiny-rugged-bug-d1d3e8@houat>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
 <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
 <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6006226707125799778=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6006226707125799778==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vszq3vrbwpm6jkyb"
Content-Disposition: inline


--vszq3vrbwpm6jkyb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
MIME-Version: 1.0

Hi,

On Wed, Dec 17, 2025 at 03:31:01PM +0100, Luca Ceresoli wrote:
> On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> > On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
> >> of_drm_find_bridge() does not increment the refcount for the returned
> >> bridge, but that is required now. However converting it and all its us=
ers
> >> is not realistically doable at once given the large amount of (direct =
and
> >> indirect) callers and the complexity of some.
> >>
> >>
> >> [ ... ]
> >
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thank you for the prompt review!
>=20
> All patches are reviewed now except patch 18 which has no reply. I'm just
> pointing out in case it's something you missed.

Yes, I couldn't really understand the implications of that one, so I'll
leave the review to the maintainers.

Maxime

--vszq3vrbwpm6jkyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUP4nAAKCRAnX84Zoj2+
dkREAYDMzyGsQO2Sx3OBs9bux6ITkH/bFGwHZ4tpRgWit4a1jMHeNuozqpDBMT8K
WmLrt7EBgJR1HTyQ6KH6xqqoS2wwREqGdMPi/YcBXvOdlzPZCFsQrfYdAFhAw8ky
AW0aV5QIbg==
=GFoU
-----END PGP SIGNATURE-----

--vszq3vrbwpm6jkyb--


--===============6006226707125799778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6006226707125799778==--

