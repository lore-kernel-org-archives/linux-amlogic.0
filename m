Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF334C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 11:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9034660FD8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9034660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogCaiuPM9EXcc7ubeCWDWfdLU3QE7p2/VzxTEvjZUfw=; b=uwlxqOYFIwpZKYyHM1dz57Dbeg
	UH7j2ty6yROwE3gC46r4jDX6lqFt7mc5vdO2FQG7TWhEWkUDnbSps9w1bfrpmtzAqDLvGqUBJ/LCU
	eVhyeRnX/1DEgWv4rBIkxQF7xmzqBsdXTv/BceU8jXVR3FBvG8gPniCwdj4QFLD4uuU/m/jmJ3HMr
	rhIhRBIxbafV1QGfiVpA0b7Tw5vsvrhQ1kzpb8tVwiy3PVLmjKewoZnu4tI6yv6faTlJxEjwEvnsO
	5+gbHV/BQYoiRmvu9fOYgA45G4xF3K/w1nL3nb+FW3rKzw3MoX7cUcZX/RUSKvfH/gXIAV12T6ygb
	8j0ewMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXLyw-0066ma-1x; Mon, 04 Oct 2021 11:18:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXLyt-0066lg-9F; Mon, 04 Oct 2021 11:18:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1879A60FD8;
 Mon,  4 Oct 2021 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633346282;
 bh=0wgu5iuPepCxFxpreyphFnKy/ixxODTBfmJn7/Iu3yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwCo+BFKqVLQ1SvbSEXurrDxAkESGjOPahwmc/v7dYUl0nSGUvMWYYAUlrHK6wA72
 Tl7bt+KLft1VY8XcW1uQjMzTu7Bxy59KjyIzKpvZYczVvEF/33IVmVS0K0d5ynNmEm
 hznHSZlQgPPfQ6JeEaOqcq6G4F3dLSk2yzo0FQDZhX/moMnybr32CuCZraBLrdCRkD
 y/e7EyNF1zIsI6wgWRosuIFHfsqMoaTezQj+yW5ZtKZ7QXVOkayKfxx7wdX5x7vKB/
 Km4QA+LvwmGmPj7/JZZau4x0NY/m9gsfr8qoRM1+pkwNxJilYnb8DW7rlc3YJD/uuu
 ELy4g7gdn652g==
Date: Mon, 4 Oct 2021 12:18:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, lgirdwood@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVri6Plus1oaX248@sirena.org.uk>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <YVk77/SIxr8Vt8TQ@geday>
 <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
MIME-Version: 1.0
In-Reply-To: <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
X-Cookie: If it heals good, say it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_041803_363328_9023ABD8 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Type: multipart/mixed; boundary="===============3381373581742333800=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3381373581742333800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5TFB1rwqMxtqYHgE"
Content-Disposition: inline


--5TFB1rwqMxtqYHgE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 11:00:15AM +0400, Christian Hewitt wrote:
> > On 3 Oct 2021, at 9:13 am, Geraldo Nascimento <geraldogabriel@gmail.com=
> wrote:

> > It doesn't sound like a machine gun noise to me :)

> > More like brown noise, but anyway what I'd like to note to
> > everyone involved is that this one is a major dealbreaker.

> I=E2=80=99m the origin of most reports that Google will eventually discov=
er. I
> was told elsewhere that this is known as MGN so I=E2=80=99ve described it=
 as
> such, but that could be wrong. For clarity this is the noise
> (triggered, and with AVR volume deliberately right down) followed by
> some navigation in the Kodi GUI to change output:

> https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov

Right, I would just call that static.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--5TFB1rwqMxtqYHgE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa4ucACgkQJNaLcl1U
h9AGmwf/fxBw23uJPAC92OR7QsFhST90SG2lccRXbEC0+OXrQX3FyehcnLk6aURp
2BV7EWeP8mpFG9VmfR0uQIKAClPMChSO+23XieDPF5Nmk4HQc7foEnu3OJIkDhvK
cmjlDh29FKmSfIR+Ky8BN5EUhVd+Wj1FzYjbyGgMhfm2d6kZq8OzpJHVG9Ddet8t
E/xCVh8IsaEp5aGSPdty096Q0xC1v5ApLnStlCjzFCcqGVRYVCwUrZm4MARyTWIC
b00uBIwlKMSkV9Qh/K3a0umgcl/zGNjIO8n2edAOXtrw5EJIdmCboupoKpNLjLDC
CxWhMmWFJlsXDz0qSGAiSJaI30OMMg==
=gPaQ
-----END PGP SIGNATURE-----

--5TFB1rwqMxtqYHgE--


--===============3381373581742333800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3381373581742333800==--

