Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94207C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 06:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576B920748
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 06:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lrlq6Lxn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="wD+h8Nmw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576B920748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r2b5+RT5N1DxfnVV4jAqSrZaZgDAtwodaldWQjXD7yA=; b=Lrlq6LxnEbZLjeNrRc6HYy1jd
	2dX7Y2tzn2FAqjrfrWMyyUxYjCK/se9pLXYjxL9ng9ny0OxunrBK90d672891ekaPm9u79Gin3i8K
	yxRtRpkc2x+OH0NFACARNngL7MXQNAQXBxWJnwHrbdeZwgHSfqzMy9mAI1fobut80FMU17dQ9o/+L
	rtuz0AfEKrHBhYv8cRb6EN62iCixZ0q+abjAmnsEoTDW71czfriBN26Cp5JnMYd88fGad6tL368je
	vgMP9mOM4xUDrcq/oDmFkuxFahJGg+zfJFm5b3Y7O2p+bAjN2ureKMTRhdWXB/TBG3NPv33jCZRYT
	T3b4ubotg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5Jm-00022D-Uz; Fri, 04 Sep 2020 06:35:26 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5Jh-0001ys-W6
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 06:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=PEKAdGICSpG+StaimtD2YxLUKeqb
 Rz1HTpHr/NM8LWg=; b=wD+h8Nmwe2DlaHl4ZY9ljquKBmzVTAjJx9KGimQRYUxR
 wYZBPTs3mCywOYZzIcxu6hTN9Lz65eAP7L1ynZeG3nsJ7nM/j3TbMGTUGbgzPR+n
 2wb8m2rKBabCi1Qxnc6p5MtLaj3UqYvyp6tjbhy44mF6Kvu3DdbLAvZ6+lWvrL4=
Received: (qmail 3473265 invoked from network); 4 Sep 2020 08:35:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 4 Sep 2020 08:35:14 +0200
X-UD-Smtp-Session: l3s3148p1@KxpNEneuIKEgAwDPXwlxANIWpbLKE1Uh
Date: Fri, 4 Sep 2020 08:35:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.14
Message-ID: <20200904063514.GB1506@ninjato>
References: <20200903232441.2694866-1-dianders@chromium.org>
 <20200903162412.3.Id1ff21470f08f427aedd0a6535dcd83ccc56b278@changeid>
MIME-Version: 1.0
In-Reply-To: <20200903162412.3.Id1ff21470f08f427aedd0a6535dcd83ccc56b278@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_023522_274081_A5AE4E95 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Hu Ziji <huziji@marvell.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, swboyd@chromium.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Robert Richter <rrichter@marvell.com>, Stefan Wahren <wahrenst@gmx.net>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============9049679767257084478=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9049679767257084478==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 04:24:38PM -0700, Douglas Anderson wrote:
> This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe") but applied to a whole pile of drivers.  This batch converts
> the drivers that appeared to be around in the v4.14 timeframe.

The LTS granularity of patches is a nice idea! I will keep it in mind.

>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

In general, I like more coverage of async probing. It makes sense for
SD/MMC, I think.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +

For these two also:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # SDHI drivers

The speedups somewhat match the expected values and no regressions when
checksumming a large file.


--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9R4B4ACgkQFA3kzBSg
KbZ+dRAAtEZ/QivEThvaA26nN4oN+/Pl5wfutbbddoY6FBwhRfVLeGOUmIaQyCzO
WxUZXCY6DhTTk6fBdM4DBdt9gZESHaWmmfimgOYszW7pN+ZjdmC/74/yx9jQtDd9
zPGcMtbBdzc++3QBJhS+yrCmCVK8k/h9uk4IcBeXYCOxGkt2ZTIs+K+2U//wRTdn
GIJv7NBXmUVkzRE6eumCfgJNM9haAzmm/QGgshIXdupqQ6VCpAE6Me+nFNPk5yPB
HC9wwsinQjlx3ntGCrQm+Nj0eRYBjiBVLALKneCSr3r0+j2iEcBOED5O5Zayu6Fo
J6M4qEkn+snojb7MHNqyylcjKwqA2x1masuuOPe8P2LxXrVjQ5myPtcgYjr6YIK7
/MhB6xX7G0C0YXlbMOLrJkXpU9UMUkcm+6nMeaw1e7HOFnzrx6gpYuK7qn+rkeh+
rsN0TTY8jrb/Ad9+Kt1VDiAAUAH60NVqRhCq/z04/6vmpXzfJ3Pu6Tpl+eif7C6k
HRm/rG+Xh3uuwAN0FdsJwi3cwV/vgVd1Fl9XoFWvZZQJ7bZI9B+J6AF8wpOmqDjw
VIq0DacTmlEXJ8oOPr9UjHvHT8RTUGDSyrbI8F5K5+QY4qjnuruzT7tHkwmNxYgX
MXiTodCMQ/oRfdVt0jKHNWxh/oOyoUyeHlUS/IAbefp8BH6bBS0=
=RWIN
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--


--===============9049679767257084478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9049679767257084478==--

