Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD36C34054
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 902C624671
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kHj77qGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 902C624671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=511ulChYZsygpbbkqwq9098dXNCixVfCdFzRZ3t2qsU=; b=kHj77qGJZSDi+LD/e9dvUTa3m
	B5uzf0WdePbjVX+kZQ+1rEcOLf9BBE9l8qODiAdLg4y8y7lvP1syjj5Zmxla2h47hX49BzCksoQPJ
	l/sSXjQrGgSQ6iV0zaJI+R74HThTJWf2UuG9GVDaAjo5ZK4l1y1EuvNKxDAANckjzXpjnrZLVcEgK
	meSoUoZo+PkgdeOtHBWU+XjmqlwfblHKC481wQcfCt+s52XOc+Od3iyehiXP/FoV6W7L7KNG8DTN9
	p75pfzu71I0yaSEV6KzMTquSSWK44bgt/w1UTZILFb/yn6WHYqtgUEr09jU2bcLdCGgoN49SWIYGr
	xi1qDGYWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4S59-0008Kg-1W; Wed, 19 Feb 2020 16:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4S4w-00070r-Vb
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 16:20:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732EB1FB;
 Wed, 19 Feb 2020 08:20:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB43A3F703;
 Wed, 19 Feb 2020 08:20:01 -0800 (PST)
Date: Wed, 19 Feb 2020 16:20:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: add t9015 internal DAC driver
Message-ID: <20200219162000.GF4488@sirena.org.uk>
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
 <20200219161625.1078051-3-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200219161625.1078051-3-jbrunet@baylibre.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_082003_123729_5BB0CFBE 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1782220618780892338=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1782220618780892338==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Content-Disposition: inline


--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 05:16:25PM +0100, Jerome Brunet wrote:

> +	SOC_SINGLE("Playback Mute Switch", VOL_CTRL1, DAC_SOFT_MUTE, 1, 0),
> +	SOC_DOUBLE_TLV("Playback Volume", VOL_CTRL1, DACL_VC, DACR_VC,
> +		       0xff, 0, dac_vol_tlv),

Sorry, that should just be plain "Playback Switch" - this can be used by
applications to present a combined mute/volume control together with the
Volume control (though as in this case there's no per-channel control it
is possible some applications will struggle with that).

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NYC8ACgkQJNaLcl1U
h9CDuQf/fGT0VVRm9yQYse0qUFwaPpa/Nb3byf+rdC0Bisg4EtnyYM2uHFn0C1Mg
PEDPJX9wIjjelZpQn6pNnQjo5jcZvbnoUK4ok+t+L2+wn0qS1u9sdZHqDO0/85tB
vLFJutTkhsVu/0Ky+ejH12I+uJqIcSrWHxLdWfhOpXYoqFe+C3Jzr8WlhijxnlaR
GW5b0bdf3lS4LDOYTDCHKnPXX6PiTf80RHHqoF5ZS/JyH5E1zob3FGPSzoo/8RIN
PG/sz5w9+YJvlPHomclX1ZyMG+pnw3AdOrvtlvfkjiui7OPe8u/Z7BEoSVbKSxEF
T2IfZRw1euojF6XagOVhMMpiBoShKg==
=DBLh
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--


--===============1782220618780892338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1782220618780892338==--

