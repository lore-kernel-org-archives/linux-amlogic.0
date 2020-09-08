Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF1DC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:10:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89CB20708
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 19:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LytHVeqy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D89CB20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fJ5HuWgLY1C20UIm04714eyZO1wvYBE4OBzgpE8umtk=; b=LytHVeqyA1IbZrdqoXqc2zSi5
	v+iq01hz5Iq3xugFOzEEXvKsRoyL2AFafJ+hFa3FeoE3kidcHLGqE0IcJDSZsEJ8QgcW7L27Te6I1
	2nh491FEhvFDVt0M9A/t+5Y9zSbtZnfWKQKdqNTVZjVCkMAAIiXkHE6bQB8GrG8/vT6D5J1h/THHi
	GqqBz4HqE7Be0hCIs9PJ3oripw8Z+dp5jHcTDNs0wdIDs0142QPodN0a7e+I54LgIpsoAuD8vPPkj
	SV+NPgW481Zte0n0cU0FIWyuPvBRIGvk9/ImYnLxahojyyXTGO75B86pMVGhALiZjce2Bgfhl/x9b
	hJLzxTVaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFj0d-00026e-4P; Tue, 08 Sep 2020 19:10:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFj0a-00025s-LW; Tue, 08 Sep 2020 19:10:25 +0000
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 93A0B295E47;
 Tue,  8 Sep 2020 20:10:18 +0100 (BST)
Date: Tue, 8 Sep 2020 15:10:10 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/5] drm/panfrost: add amlogic reset quirk callback
Message-ID: <20200908191010.GB10568@kevin>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-5-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-5-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_151024_816269_4D201F70 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7769663367279834474=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7769663367279834474==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Since the documentation of the GPU cores are not public, we do not know what does these
> values, but they permit having a fully functional GPU running with Panfrost.

Since this is Amlogic magic, not specifically GPU, I'd rephrase this as
"Since the Amlogic's integration of the GPU cores with the SoC is not
publicly documented..."

> +	/*
> +	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
> +	 * these undocumented bits to be set in order to operate
> +	 * correctly.
> +	 * These GPU_PWR registers contains:
> +	 * "device-specific power control value"
> +	 */

PWR_OVERRIDE1 is the Amlogic specific value.

Per the name, for PWR_KEY, I'd do add "#define GPU_PWR_KEY_UNLOCK
0x2968A819" in panfrost-gpu.h so it's clear which value is which.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9X1woACgkQ/v5QWgr1
WA0XAg//c9nGGJntvueFe8c6qd2IaRIMN3EM6NDls15z8sc2USz064lxnb0x5o15
futnTLgG+9RPsMRDl3GmLwHyffyRWWIupoVPgMEu/RdWUai8d4yKyF76xVDpUOAD
RnPBzvstwXzN3Wggj47fB6ajEZFFOI2erWqEgAY8UZARPkw3jP+lUbHpagmKdMVF
SYrAuYXOZmOjdlHXeTM4jxAW1I76imu2iEnvm+/2bpgRUumypy3/K33/wICFL9W3
RVC1/2Gw6zRrhT9Je9eVBLID7xoeJk5jFHAFss9xd+OtshquOBlapVXwJVcfEm+p
gDFNrxG/pXgrJvkI6a8anp0cqyaixvIONfMt2fJwfTbqP5+K0QigQFVclGa6eXM3
iLkfjlbgrCn8iiywRBx7BunsMqMWgHEt5K78PGczw2JmU+Ahp1O1vq9Az0s2yYIt
X5nlp/iwUHRtPEnoNwqPFfasUnO3UAkObmax9oZVG3iBede/wMMWDOvm/J0Q8pEq
jI/liFrKDPa7Qnkwara3B1hxAeMedig7Qi+RAFuRTUFlNCoBuD4TfCcvBGqH1cDX
aupOBHrxmstHtZH5lnCcy7cXepJuCOmati2khQRvoOJolnRYI1HFyt2poZT3HQ+w
K8zkmWUzKZZk/QwJn31i7zX7emvAvma0aO3dGzdT4+F3OMeJRf0=
=eeWO
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--


--===============7769663367279834474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7769663367279834474==--

