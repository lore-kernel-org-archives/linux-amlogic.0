Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7489C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqNfUpQu8TPnhVmhr6zFQbepeayw96HAy5qGzGrzh7M=; b=emWp9P3o4lVzA/SjGcTz2scGwA
	NzItt2Gz4sxrXHXnc2LUZg3PWbsq+jwSc138ds6dkuNRiNG1nSLwAWJZbqV09Txe79Uxr4BtxisXm
	BG+4UO+NhVCnKQApUq0mDeW2ZGTmPZGQ1L4Ny+DHtHCWEMtKJK/3VjTvAoLSiUnhBi5kR3ftzbHRz
	cuhZ+yx+yrdGYPplDD2k2fpyBp06XB7ObWFQilLV751FXuFaEEt94+K3c+lL19Pe5GQ7aS5Ulm3VY
	yqewtgp9j2jlbRTx8l4wL7wA7WLTpcwgwC/YBsfndEDi9RFFBsHmSzAiYIFA/fnvVVITlCbO7UBtJ
	O9iSKgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu7Y-0000000GYan-07nV;
	Mon, 08 Apr 2024 18:53:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu7P-0000000GYaP-3vgn;
	Mon, 08 Apr 2024 18:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14BCC613CA;
	Mon,  8 Apr 2024 18:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339BFC43390;
	Mon,  8 Apr 2024 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712602401;
	bh=yS6GxyZzqXB2+xOaIOWtiFJnwGVsW8GrqXSYsIS0f/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPXRMtNIsALYYJhM8h3E4vweAGjKe8MxQZ+iRE6ReyAF+BQ0nbYrjR6r32jDl9k+P
	 TZeuHRAjGFNXHgRa7hyfTtMW0Q0TZt7/uz9M3mC0juDNPxtHgeCCVnhgJAO7CAG0OA
	 z0K4I/vFqZlAwl4N0O489RTdK0H9KauoUJHU4CA2UcQyWd0qQJ29IwVG3cflU/A3n2
	 3N2bKKh1zSFGaXT2+nXt9NiE0KPuHLeG5zj2v2Si9Zn8sVVuaAlZeu6f37Mxean9xG
	 MFKQ9PJayxWDoqBhhpDR2Gr3TN86dK8wvJps/ASKAQo+lyDB73ZMd9Cd9IC5Uk+loy
	 NG0scg4BII4wQ==
Date: Mon, 8 Apr 2024 19:53:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
	lgirdwood@gmail.com, conor+dt@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	kernel@salutedevices.com, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <412306b3-e428-45ac-8bf5-6121f638272d@sirena.org.uk>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
 <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
 <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
X-Cookie: Drive defensively.  Buy a tank.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_115324_048584_1AD3AA40 
X-CRM114-Status: GOOD (  16.89  )
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
Content-Type: multipart/mixed; boundary="===============3442260546517558854=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3442260546517558854==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWk5+hm8t/wej2SK"
Content-Disposition: inline


--HWk5+hm8t/wej2SK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2024 at 09:47:44PM +0300, Dmitry Rokosov wrote:
> On Mon, Apr 08, 2024 at 07:45:00PM +0100, Mark Brown wrote:

> > I would expect that the place to fix names based on the userspace
> > configuration is in whatever userspace is using to define it's
> > configurations, like a UCM config.

> Honestly, I have tried to find a way to rename the PCM device name or
> mark it in some way (such as using a metainformation tag or any other
> method), but unfortunately, my search has been unsuccessful.

I'd not be at all surprised if there's no such facility yet in whatever
userspace you're using and that it would need implementing, I'm just
saying that that seems like a better place to solve the problem you're
seeing.

--HWk5+hm8t/wej2SK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUPRoACgkQJNaLcl1U
h9DJUgf+PtNQ01uTKkXCzFIX0QP1JVOK6eTnelaoRvequ7E9jlgWqkpwcmnmHGcG
7JaIcW2gK6BEj0kLODIrk5HrWWvPmPzVkTYOanJ7FWeTtCV8bXJSpU3Y79Ywy5VI
+Z3BPEH11EeIFF0PwWIH4p/oeUIJ4bgZ6p6IRujoBP1hY0bMlrkAlh6u4nOAM26O
6vdyVjM1Tt1JU8OSBBwu8Yi7LwrjWkLve4fY+kr0ZmNBCpDWNzNW8SYc9Ruusjae
rINMvZMEz886w85mpZ9km4tSVJmOUg1cEUBcQuhXufjdwHvk1L0QgcvbDG/5g0ai
0q5+Vy4UezOdjjATWlHxdZEIEOh1HQ==
=AHCz
-----END PGP SIGNATURE-----

--HWk5+hm8t/wej2SK--


--===============3442260546517558854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3442260546517558854==--

