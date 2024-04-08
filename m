Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99980C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISYarChsL3clk7y2F5rP7JWxa29C5hGTHBRhX4p6gis=; b=YLfrQBjny6hrz5fYZlJt2QPB0R
	QCjhXM9Kw/Nxt8YHX8TNXkBPpJd4QD2j5iADZ5aEON3U3hfl5VMEWu5QlQ6BLtIoxwnbyVN5ywv3V
	Y8yGcHolezxt4Jud6GwApwvrM+7anFFCjPTMsdD4pofItW9H0+/GTnl885uAX4DtqKvTKwGZPNzpo
	rnnX6SFXtk7zUKmO1W6DEvegVf9cYWD+3pmXlFVnzBt+z+RkSzTWxceW5Jn0WP1Z0YszNCuGKcKJk
	FO9tCmtVk5XZqncQUSAmI5V+89Gq0phhTXBvTx+lZKBcIBvqdTPIdsZIKgcyzwssTta+vkwjZHflM
	A0cZzFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttzU-0000000GXG0-1XzL;
	Mon, 08 Apr 2024 18:45:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttzR-0000000GXF0-1EFc;
	Mon, 08 Apr 2024 18:45:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 617EF6137C;
	Mon,  8 Apr 2024 18:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C936FC433C7;
	Mon,  8 Apr 2024 18:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712601908;
	bh=35TiYD0o4V5XmB7Kubpn4Ak35k4hMXKysdwn6S4+n8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YruXFHCGCe2L9NFXzofTdJeeYgSkoxt+klwsjqc+56eAPpBAjWLxYY2u8YV3z/ayo
	 J4HtKbF0zpRwe100lWIEVQmyUOudQlRNn3iR1vA6JIRzaYUUUvSiGzX1zMZPJeJTYt
	 qp3obg1qWikrI+HA15p51x84U91OXz6iVTs7+kcELzN3+r18N7049kTcxhz9C0tWRP
	 tAvW2sVGBK0CwOQynH3Hug9bDmGH2w64gh72PuRyxBZC6MhWgHqx5yQbztQJ7WRSUV
	 bpJM2OYcfW0YXxs3u/di2LNbRpruZfYEpN6Dm3YeCL2oFAywgAQ9ppG/DTL72ujx6m
	 HRQJ6rP4yJPrA==
Date: Mon, 8 Apr 2024 19:45:00 +0100
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
Message-ID: <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
X-Cookie: Drive defensively.  Buy a tank.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114509_448669_1FD40B60 
X-CRM114-Status: GOOD (  25.77  )
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
Content-Type: multipart/mixed; boundary="===============3858716984156255085=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3858716984156255085==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HMiKwoGIkQvD3cpD"
Content-Disposition: inline


--HMiKwoGIkQvD3cpD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2024 at 09:40:41PM +0300, Dmitry Rokosov wrote:
> On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:

> > Userspace pcm, otherwise known as DPCM frontend, are merely that:
> > frontends. What they do is entirely defined by the routing defined by
> > the userspace (amixer and friends)

> > So naming the interface in DT (the FW describing the HW) after what the
> > the userspace SW could possibly set later on is wrong.

> > Bottom line: I have mixed feeling about this change. It could allow all
> > sort of bad names to be set.

> > The only way it could make sense HW wise is if the only allowed names
> > where (fr|to)ddr_[abcd], which could help maps the interface and the
> > kcontrol.

> The link-name is an optional parameter. Yes, you are right, it can be
> routed in a way that it no longer functions as a speaker in most cases.
> However, if you plan to use your board's dt for common purposes, you
> should not change the common names for DAI links. But if you know that
> you have a static setup for speakers, microphones, loopback, or other
> references (you 100% know it, because you are HW developer of this
> board), why not help the user understand the PCM device assignment in
> the easiest way?

I would expect that the place to fix names based on the userspace
configuration is in whatever userspace is using to define it's
configurations, like a UCM config.

> Ultimately, it is the responsibility of the DT board developer to define
> specific DAIs and name them based on their own knowledge about HW and
> understanding of the board's usage purposes.

DT seems like the wrong abstraction layer here.

--HMiKwoGIkQvD3cpD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUOywACgkQJNaLcl1U
h9CJAAf+NxTZb3cXYXbGTve/uEzcktraeaWPmfFUvb/1M7/+tCcBBz0yT9v7uXI4
C9xy3I9MIztGRHi9jO6p25fZLtP+ln+t7E0M5/ZZwq9Q05hriYlM6ymQPmaXkSB7
9T7DiddU6mESy1rS2BUxYYYJTBNEmDmFmjq2XA0bn3Mg/FfRVkfDdsZ3uXl5SHIi
UYkeAdeNkOtHqg64KTPIVZcfAYm12yUtZT4z86mWQ1CH+rb/EpuPTkzKwaq/QKhH
XAwPgTdo2kjLEj136u6vQ0blmTxYjaNsh8u+FbIKIc6AYtWAFfh+UXox9D36Tdlu
71tgaf6AzlkMjR4U+gGfe99OK8NETg==
=7H+m
-----END PGP SIGNATURE-----

--HMiKwoGIkQvD3cpD--


--===============3858716984156255085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3858716984156255085==--

