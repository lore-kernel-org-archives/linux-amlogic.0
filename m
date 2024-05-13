Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28220C25B74
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCKViVNdRzZoORtihZ1Mvl4WZqYvOcC4tayUj2H2u9k=; b=qTkkWaITjULfpBqm5mjfMFSP9+
	8PTiwd1mqynIW2FfacjBv90tjWkkv2Loi1t69kT8P6Y3JhQcQC8v38iw1AFK8cu1ibnOulDHPioDR
	SEdWUq8iAM0HhnL08wDUCWbFyGu0xFbndHALwbCnwOYYTM2IJE/wynAXqBwiu7V/7pxFXxm39Zuku
	6HyvcLWkywColrAQWjcXRV+GLa3+eO2noVF3sD3hlqgyXn0P9BhqTVzx0G1chdD6nUlJEQC9SafW4
	1tEoylg8oNnsIMrZHwfRIYQgshmGjhRXkrnfnkKXzwH+1yvB09kXfHe+/5kt4Cwg5vSBn02EiHH5d
	hCDaRJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6XpH-0000000DOXk-3rVq;
	Mon, 13 May 2024 15:42:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6XpF-0000000DOWW-12e7;
	Mon, 13 May 2024 15:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05939CE0F7F;
	Mon, 13 May 2024 15:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A22C32786;
	Mon, 13 May 2024 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715614966;
	bh=F3u3mKadL+3EZX5zWP3ezeTiqNbAGqyfcxAJ3U4RsoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQq0r5sPRu78vdVdG+L7slIqkDQjf6Glz1m5xloulimbwvyaf331+Ts9RCGWXWy52
	 V5vY3mLQKoDMBoynd61Q9m1bcEHA3vkD0gLfksydJ0E8t3+F1YYcYKXiAZuP5L7kVa
	 v/5vfwkbYqYujFK0vsdNj+99Rp8YfMc0G38VhSQJnDLeLrnwLQvT1r5r1kya6YbuN0
	 PhYnKGz+dJ1DeDeOj4mvpmJKE8YypTO1AL3rYJZZ6XJiYymY5qDge1FiOXpazziSgT
	 U+ezmPVVPiXunoqCLxG0MOEuPSUwmxAfrJidFr/5CZ+rdd+SPsDj4uIv0sGa5N0NRN
	 E4d0RuCySxi5w==
Date: Mon, 13 May 2024 16:42:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240513-capsule-sadness-4d387baf2bed@spud>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
 <1jjzjxzy4d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jjzjxzy4d.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_084253_655746_85B56E0C 
X-CRM114-Status: GOOD (  31.60  )
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
Content-Type: multipart/mixed; boundary="===============5071200582320108959=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5071200582320108959==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RbuUotNKYzyDBfFf"
Content-Disposition: inline


--RbuUotNKYzyDBfFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 02:04:41PM +0200, Jerome Brunet wrote:
>=20
> On Sat 11 May 2024 at 14:08, Conor Dooley <conor@kernel.org> wrote:
>=20
> > [[PGP Signed Part:Undecided]]
> > On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
> >> The 'syspll' PLL is a general-purpose PLL designed specifically for the
> >> CPU clock. It is capable of producing output frequencies within the
> >> range of 768MHz to 1536MHz.
> >>=20
> >> The clock source sys_pll_div16, being one of the GEN clock parents,
> >> plays a crucial role and cannot be tagged as "optional". Unfortunately,
> >> it was not implemented earlier due to the cpu clock ctrl driver's
> >> pending status on the TODO list.
> >
> > It's fine to not mark it optional in the binding, but it should be
> > optional in the driver as otherwise backwards compatibility will be
> > broken. Given this is an integral clock driver, sounds like it would
> > quite likely break booting on these devices if the driver doesn't treat
> > syspll_in as optional.
> > A lesson perhaps in describing the hardware entirely, even if the
> > drivers don't make use of all the information yet?
>=20
> That is nice but it is only possible if/when we have perfect knowledge
> of the HW being implemented. I don't know about you, but I rarely get
> perfect documentation for HW, let alone a public one.
>=20
> Those things are bound to happen as we implement support for the HW and
> discover how it works, not to mention the mistakes humans will
> inevitably do. If Linux was only supporting perfectly documented HW, it
> would not be supporting much of them I suspect.

I mean, you can say what you want chief about what you did or didn't
know, but there's a line in one of the drivers that was added back when
the original driver was that talks about the missing clock, so you can't
really act as if there was no knowledge about it. If it hadn't been
previously known about and TODO-listed, I would not have made these
comments.

> Stable API is already hard with ioctl but there, both sides are
> perfectly known. That is a fundamental difference with the 'DT ABI'
>=20
> Getting it right on day 1, every time

Wind your neck in, I don't expect you (or anyone else) to get it right
on "day 1, every time". I only expect it to be dealt with in a way that
is compatible with the existing devicetree.

Thanks,
Conor.

> - because things are set in stone
> afterwards - is unrealistic. As a maintainer, I do spend a
> disproportionate amount of time checking the bindings submission because
> I know how painful it gets to fix things up down the line.
>=20
> Unless I missed the simple solution to this problem, we can expect the
> problem keep happening again and again, no matter the number of lessons
> learned.


--RbuUotNKYzyDBfFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkI08QAKCRB4tDGHoIJi
0jSxAQC8QxVuGHYq7syN68cgLxp136YiQh2236yQnHQf+MYYrgEAzT7ENp3HENlz
kbYC+C95klbNPHlpS4gAQN2AoaUk4AM=
=84uz
-----END PGP SIGNATURE-----

--RbuUotNKYzyDBfFf--


--===============5071200582320108959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5071200582320108959==--

