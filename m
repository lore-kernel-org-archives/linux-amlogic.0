Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B755C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 May 2022 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBdA3ELHkaPWxW9jDfGjjI8LzBaNFOWozXZ2fucRFSw=; b=DV2qCoKCFgUn+E8xpM7anU0Vv3
	t2+CfraH8Hr3Fbv+1X2aFfWRgZ8YSZTl7GnzYdcvHmy6z8TH+DEzGmi0WESn4DhJkhNrEzih88tvw
	FPu7e4BQYPpsFL/XBMob7Ts1PBt3BUDth/2XI5XjpB5VoOkilwUYcYaT+94Lh8AuSFxe1WbKHR/98
	qv92XmWDIzgSXcLIy4HhHk03grjnnB2hxMKJ5GAl+13/OCTkEnWAXm9tXvKbbBohlSVQVgl4v7x7z
	km1F2n1xu90ajRAGZ0MNlT/Bfp0LkXsFwDS8md/+PwZTIYmLdPQYVH7gWVE3x3hMZ4EmjcLdzNaoc
	+yBbNsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLlp-00Cc6V-To; Wed, 04 May 2022 20:38:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLlh-00Cc4k-M6; Wed, 04 May 2022 20:38:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51071B82936;
 Wed,  4 May 2022 20:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C861C385A5;
 Wed,  4 May 2022 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696719;
 bh=bAFjKvIBpiguiHw0d8TsEXxAy/N7r3y3izCenwfFfsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HQcIy0Cpc0WIWw79MFGyRtF2UFkbh6oPmE77mgArpyx9hDC+t3r7H1i9fK6FyVpZj
 jp3l7DzRcUnAc4pGRJiQxGKY/cc99nO4pW/I4lYmJ9C9ZR7RNzuabNQt5TX2f/BFYZ
 0Mz/GurO2PecTtBVP9resMh11+pws7dsA52nym3h0frQzDiFFABOqgNL+wYn1hXR/H
 IUWLzs3WMQLonKw/AuomuGs/zCuOf9Tv12STZNCOfL0VUvY/O6r2x55OacmNWwgIYP
 4PMuMUPCZmlJP/nMzeRbJ73+aPy8dhC6WV8Z3i+VnVZINEofDj6WoRiYzAAMs4pufj
 LG2DBehl+3iGQ==
Date: Wed, 4 May 2022 22:38:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 narmstrong@baylibre.com, tanure@linux.com
Subject: Re: [PATCH -next] i2c: meson: fix missing clk_disable_unprepare() on
 error in meson_i2c_probe()
Message-ID: <YnLkS+/oT8qeL75s@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 narmstrong@baylibre.com, tanure@linux.com
References: <20220421090042.2278081-1-yangyingliang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220421090042.2278081-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133841_909730_6AA439FE 
X-CRM114-Status: GOOD (  10.80  )
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
Content-Type: multipart/mixed; boundary="===============0474465374345968655=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0474465374345968655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8ScGLI3M/D7Ttui"
Content-Disposition: inline


--+8ScGLI3M/D7Ttui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 05:00:42PM +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from meson_i2c_probe() in the error handling case.
>=20
> Fixes: a57f9b4dd6f5 ("i2c: meson: Use 50% duty cycle for I2C clock")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-next, thanks!


--+8ScGLI3M/D7Ttui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy5EsACgkQFA3kzBSg
Kbb9JA/9Fff1+jTo+deKplfTktFDn0s8+w4imP4ghlpLhCfwpa0P0R4GQzJD7Nch
Z66l9/oYE3Xx5OLU3NeRPg6SEoLPvlxuCHj9EoUX2Pu8v9e26TTUir8+dDOrfBuR
Q3Rs9jzVyKs/MXV85o6lS0n2oDd6AZZPWpOFR1Zh6HYMZT/T3+l2Xs6bwS0G9oQn
ONS8rABeZeUV4cziYCo0mDaFdafJTGBq2SAH7m8OVuPqBbSNM2oDZ3yZCRL2Hd/x
/t7YYW6KHh3oW5UHS8WyJEAzsdh11YSVl3VORTYOLG1Efd+AWZwigiCHI3zmrQV2
irm0mFxkimkPcKlTjiZD471ATBHhv1FQgPKXMHomMWA/ui1bhO4BuAk0bPf5n5u+
m6QDvip+SR1v1bDnRWC8yWzDhORKhveCVAU3WOUhM67ycIzbeX6yaIgfvDneupTc
cR2PCChAlmnVvBev13FAHpwTah3+yTTzx4pbNJJBloOCPoQC8FFbcOfRKckSKJZx
zmfJeo9f4Mm12mMbcaUK3WmTg9Lt4AfNnA0uluOt2bl0T7SHh+DTqp/J+20Kb91Z
supznEKa92FFzmL2sHu8ETGHLaSgMHk30Ua+dIVkkqOgVAKS5jMQNIbAnIDQk7QF
lkdW6ggvS0Rn9t1TPmaWhN2VjnD//M2ZPaSrWFMYOvRR8HUvQAA=
=WE8/
-----END PGP SIGNATURE-----

--+8ScGLI3M/D7Ttui--


--===============0474465374345968655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0474465374345968655==--

