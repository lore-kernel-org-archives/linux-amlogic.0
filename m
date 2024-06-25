Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726D0C3064D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7nLsa9oiOEfO3YZ6bL6s0U3lLYNCltGRz2ZmLubQ7M=; b=i8dls5Q0pP88rlIsA6bqg0O7Bt
	wjZR7WwxpDv2WpaBtlhWhzdQ50SsBwd47nR0qCEJJUBqwqj0gKsCyD9awrEkbt19FWzigUehHG5lB
	Lz7pqPWMwuAA5vCRz2xAL34ei3kpcE4RBaehN+uCj8jFydT5Y7f87EnYTNfog1/QhQmJPgXBxk79r
	s8ZF7Od2KKcIfF/xp+mfWm0xtKIdIAeA3wZQMGz6QZMLck8cX9ELdHZ2olQa8rW+rDebgopI09DkJ
	N0cmA7eATCrtFORTQIduXRP3oUOJQpL9R6lW9Y4hppNGrpcAZtnUXDBOdusZrkvYuiDZkUFXruQ4B
	BD88klwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8xN-00000003g9L-3w5h;
	Tue, 25 Jun 2024 16:23:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8xL-00000003g7i-19i7
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 16:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C134A614E8;
	Tue, 25 Jun 2024 16:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BE2C32781;
	Tue, 25 Jun 2024 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332620;
	bh=T6WcmYyrG4RDnVy0C9I1xyHe/lqPeAD4ypoU12fA2sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JCe+ijNMzfgTJ8otc6zD+pzRapbGk8sJQ8A41JfbOlO4wTgmQSH4RH3QrTP8eyzmo
	 M0KTLmYsBNKMlM8tNqcpHQJR7XmMgT7RM+CMlPWTuCgI4yB3hJzwPZGlsUVwcXMzlJ
	 +4GwL1Up06l+dkuzxzIW2wZ6GxHU1Evns7R5+bcZNaM4NZpPmXOn7SgwdfcVUBxkHZ
	 PaEeDjt3vxoNe8KGCyj7AS1PrxRkUobtWC/xfnQyljoK5Ds0iffqi+J0juuviWEZ4y
	 LJB3UegpXQESQu+qTblA0t/hv1+IMomRPs/evTRhpSOZPlTBqG0HYLpv5RCRc0U4hM
	 46HFiD2YDSQZA==
Date: Tue, 25 Jun 2024 17:23:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: display: meson-dw-hdmi: add missing
 power-domain
Message-ID: <20240625-growl-unseated-e612193d93bd@spud>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
 <20240625145017.1003346-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20240625145017.1003346-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_092343_400623_0A00CE07 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Type: multipart/mixed; boundary="===============0560499382289788565=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0560499382289788565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ryZ1T0F0MK8qog8O"
Content-Disposition: inline


--ryZ1T0F0MK8qog8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:50:14PM +0200, Jerome Brunet wrote:
> All Amlogic instances of the Synopsys HDMI controller need a power domain
> enabled. This is currently missing because the Amlogic HDMI driver direct=
ly
> pokes the power domain controller registers, which it should not do.
>=20
> Instead The HDMI controller should use the power controller.
> Fix the bindings accordingly.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ryZ1T0F0MK8qog8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvBQAKCRB4tDGHoIJi
0j6wAQCWm7LMe5lduj3W/J09vudOmNS2YYempj7Y7+BPJ0R2gQEA1WXqC9XZoQ97
I4MAXT7SsMcT9W2RDG9SUfFvkITeNwU=
=UL7b
-----END PGP SIGNATURE-----

--ryZ1T0F0MK8qog8O--


--===============0560499382289788565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0560499382289788565==--

