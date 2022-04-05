Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4193C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Apr 2022 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEkPNx3Z2JRaKRzH7DQs/jf+yQbjHfSgRZmWnHDTVNo=; b=UtNreu2rl/Wv+Q6OmvfcYpTAvk
	3ilnUhWk5/tpDDL6GTiE0mJ3Rv4eUzNX17d+YQYAZMiRgwLqm4r4nZU/4mZZWEITuoN4Lkl8iYW0B
	7N8OzWhQ9t2k/OGiuo7xnqCNQ6kAE3S+nEE2lmtfvqjFe94WJJpeihKLHQN0NkR3/vGEwiEcdK80N
	lVXirrfhoBLce1qwt/x+FvgS4aT1dESnhb5D0dTfvTsKGPVhMkhkQMyXlQ96wZ32dsSkmTpBfN26W
	U9AH718u6kx8K9fxQ4G8jwWS7BrXg3gLi18FPBnxC0KLZyh6dAluSYTCqQCfn9fsmYCMBOYsS/KH9
	zWj8dUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbnbn-002AFC-Bo; Tue, 05 Apr 2022 18:08:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbnbk-002AEV-AZ; Tue, 05 Apr 2022 18:08:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E57CBB81F69;
 Tue,  5 Apr 2022 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C53C385A0;
 Tue,  5 Apr 2022 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649182123;
 bh=NtBhGURVESJUSY8I9nvNgpznPalXmXHV0lFgfPnMkxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qOy5MakrI0EOT7P8JeLQx2F/MwmflIt1w4Vijv94UiEFSKbI0/LjQDFLSMNOff2cD
 FEwTAHiEAXA1xFNXLe5dtSUvC2xMorJb8wWLmzfJLN/NSCIslF2HR0YF9GH/8kBEC+
 +dL/iulLAfgdv+OvrVx9xX3a7uRTYkkvTW7u/Sv5LZTyJ+X7nQe7vqyvAvacgbJgzN
 /qTUCoowkyDFTlCKQhcGP+Q5AOfSg7yrxgRd47XSJJ8GUSaDkaqTRiKrBcgDdhGSu2
 KrD6zTRA3rx8VGMYVHbzCPF4TfzNwjNq8fvY2l9KCvufMUmghSFck/axFGWBevTcZY
 toELS8zyDBPfA==
Date: Tue, 5 Apr 2022 19:08:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Message-ID: <YkyFpmHhZwg19EmL@sirena.org.uk>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
 <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8a63cf25-3662-032e-b088-6a343b86462f@gmail.com>
X-Cookie: diplomacy, n:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_110848_553804_CE3B5560 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: multipart/mixed; boundary="===============2600129343637704955=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2600129343637704955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T9mryndXkvnrkI3o"
Content-Disposition: inline


--T9mryndXkvnrkI3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 07:56:03AM +0200, Heiner Kallweit wrote:

> Any feedback here?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--T9mryndXkvnrkI3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJMhaUACgkQJNaLcl1U
h9ChEQf/fdrtl6/9MJ57RFUXrTsC2lG+dsXbtpQcaTa4gKgwY4vaKp1fejWu7nOv
WIolAlOmllu2hZGHWQqMfpoeWmAwNvTyk7Hbp2pjotT1IAK8GqqRzNXBd0C+q4tG
aj3cObZTK+03w5WNG7soIhQki0yscHapzYqx0zA2X4Io96OaAOZ+2ltF5ZIGUV4e
3GYwkO9c8mAD9Y+9iDf/LQV4pzN/IE5fnfQv59u8wc9UuJle+mr9HTcwNecmgCAo
jLhjCjskR20/m3Oj1Cj6tIaqeIjM1zzyw/Lvs9FlH2nC+OO6mJm2T57Mwvfmr0EW
ydpIMBaKkx8D4DjhbeVzJi4tou+KLg==
=5pXh
-----END PGP SIGNATURE-----

--T9mryndXkvnrkI3o--


--===============2600129343637704955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2600129343637704955==--

