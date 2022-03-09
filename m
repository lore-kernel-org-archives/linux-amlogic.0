Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A9C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6X4PG4j3b3sWShVXL6DuwZjXbYOoAyhTxe+Vu2g16A=; b=kGBSTeH927lISe6hxHzi66SmIc
	XuyKza+lhVjO7bkW4K1qKSJk3DsctJ8RkpREZK+LqvdEGVjrOh7uoSpI+qOBkPDjTq0JLJeI0NdJK
	68TTgYn8k/wbgs2633HdneYKIItlQ5FCUIWA+laVtsw44mZLDWeIhPijfTFJW+mSBBW6QTFIDcTVI
	CKufNvPeVJ6eVeh3OtAq+/7hiFZRtZtPAH32uVyvbHoCjZEHgyuJSPGxSsrWaAWjgYRK4b81ZgOt1
	+7L90bEUh7k/klt2s7ORa93ysOg/PcbuTnpbmFTEk7RlUK1JoZJcoM27nGO0mPINdi9GjggzmnQxM
	0hoQzFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRwME-008lD2-O4; Wed, 09 Mar 2022 13:28:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRwMB-008lBh-H3; Wed, 09 Mar 2022 13:28:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1606261A3E;
 Wed,  9 Mar 2022 13:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31715C340E8;
 Wed,  9 Mar 2022 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646832478;
 bh=GgSio9V80nivu9meltbA/oj2M0Xxx98EfpL6FyjL1e4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqLPDT39jg1D7hrjKWwuN9VBULz+kWRqNXkgf325UHd8r2Ep/Em1L9n0DeqbzfAle
 CyBsMx078ZvO6Z6H8JSRTdlevSMgn/6JWHMG5vo1/8tou96gDu6kqoEr5dgM60Q/YK
 SURLN9ax36kml8uTB/eaBgfhh48kcDMnlUH1WV5qDKnlf7+OLZUuc1Z0CP2u2AA9fm
 dTpqoT4CfAEJgtD92EbpPukPBLL8NNGQDZYyGHHCZwVmpircsFB7HdxOVyKjlemkLr
 Yw7hFh613zSvB6L1uGiGCzvUXlMxad6XH2QncQjcuEup2i586vKCELnsGLoDFZiXhX
 JEkp+SqNjwW2Q==
Date: Wed, 9 Mar 2022 13:27:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Message-ID: <YiirWBvf1LonIkA6@sirena.org.uk>
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
 <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
X-Cookie: You will inherit millions of dollars.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_052759_624402_85DDB3F8 
X-CRM114-Status: GOOD (  11.14  )
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
Content-Type: multipart/mixed; boundary="===============8959807297931361363=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8959807297931361363==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CEoyfg+ALIwLqT5v"
Content-Disposition: inline


--CEoyfg+ALIwLqT5v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 12:42:04AM +0100, Jerome Brunet wrote:

> If this is really a problem and Mark is Ok with, what you want to do is
> revert commit 024714223323 ("ASoC: meson: aiu: simplify component addition")

I'm OK with that.

--CEoyfg+ALIwLqT5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIoq1gACgkQJNaLcl1U
h9DThAf/biv3bEd5MHh6krAL6OnRjegkqQA4maxZahCGsI2KTdipGSI+ENi1CB+K
h/pLgFM73oyq26ovwfooz5oWt6JOzboItIsXVnB7C8wb97Ps7pwwdWHMnuXCOvi8
6LKFUI9+XNWA+ZXy60AEtg30ijcjdJpe/DuPleNY6wlqnqL4FMNbeQ/xk+1gv/MS
1HOOeE1nC8j3nPuRrU3ST3vGdR8kwf+DQuV+7aEsepuGl1208wZRdgSwh/QKZX4S
MJRDcv4+WOoxIlRAj6puJe8NOzlNoBjrEtipNlRIIkWMnPbKir1jIblVbzLr5DLo
/suV0sxeZRxh/FnmqAakQQB27EhCAg==
=4dHR
-----END PGP SIGNATURE-----

--CEoyfg+ALIwLqT5v--


--===============8959807297931361363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8959807297931361363==--

