Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57ADC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 08:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FAB217D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 08:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XW6hwz+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FAB217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7iX3Kb3cbVP3qIi1eHCx32ha8NepIawKk6czIiYw4q0=; b=XW6hwz+LAcWaV99Jfoyy1q57y
	u0y5IMqz3PpmKGrJB+4jlvGLNOVeVyY1R/CFe8j0JiGbIhaUCLqIDv5YBI60fn4gHT6175RNZONXt
	hp85QY22eaV1VCaiVfl5aWqvVfEfSC66Ojf8LjZRCc2GdpLAoZ7+2nGGt+r4S402T2gyjSA1gWQCY
	RsfkLQVikSfXjovf3yMpXc/XfPXWj+WrNWLsZhI1Zj4Xus8vUkRr5r3SvmGfSFCg1Xxt/0tU7m9DA
	sOApYMn3uM5IjDuJbYM8sZni5KsjWBn1a5uwHWLXmauHEShySBqZvUP6dEaaOyXlUuVRLWpRjzTzv
	/So1TTRqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCKS2-0005M3-4z; Fri, 05 Apr 2019 08:43:54 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCKRy-0005Lh-N4
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 08:43:52 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E64861BF215;
 Fri,  5 Apr 2019 08:43:37 +0000 (UTC)
Date: Fri, 5 Apr 2019 10:43:37 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] Revert "Documentation/gpu/meson: Remove link to
 meson_canvas.c"
Message-ID: <20190405084337.7v7v7h2g7qqxoo4n@flea>
References: <20190404144342.15238-1-narmstrong@baylibre.com>
 <20190404145202.GC17077@art_vandelay>
MIME-Version: 1.0
In-Reply-To: <20190404145202.GC17077@art_vandelay>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_014350_903856_9C183DE5 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: multipart/mixed; boundary="===============8975709624981699378=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8975709624981699378==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sbnzg6yrejf7zfmw"
Content-Disposition: inline


--sbnzg6yrejf7zfmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2019 at 10:52:02AM -0400, Sean Paul wrote:
> On Thu, Apr 04, 2019 at 04:43:42PM +0200, Neil Armstrong wrote:
> > This reverts commit a3f98bb22cbfaaf67717e156f79e2bfeb42d4cac.
> >
> > Patch "Documentation/gpu/meson: Remove link to meson_canvas.c" was
> > incorrectly applied on the wrong branch not containing the fixed
> > commit 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Acked-by: Sean Paul <sean@poorly.run>
>
> and I'll leave this for Maxime to apply if he so chooses.

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--sbnzg6yrejf7zfmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKcVOQAKCRDj7w1vZxhR
xfViAP0VV+50SZFxz5zGnyNmQRNY/RXj+w0HUU7HRcadcuJJIAEAoH4KjpVDoL5L
1eWdCzGH6R9XkPIOfeWmVp2us70LygE=
=Jo6u
-----END PGP SIGNATURE-----

--sbnzg6yrejf7zfmw--


--===============8975709624981699378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8975709624981699378==--

