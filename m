Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5FFEB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbB4o8tfoiwFRZJubrvLxjcT4DiaR6w28HosIl8tEAk=; b=AaVOHfdljDtMPvgpV9lahCpJCK
	Go0JxgZncm30MVh7vYUBWvIf7rO2kHNAqb76S9Ix54A89RiesPV64Qhm66RMzfUgiIkD939LtmzSy
	tflRK6x1pYa+Je9NLM2KnZjXaevG3GcG3MRd/PonxElF+XOAZqZfgjPa4DdiPxeO2U9Jwwwh/AUsB
	Kh7cfOhd/L1Ff3fUoRiol1Q21sOU2Z4tVrrE6Tyg3imu9t+j1Z5kqDrzTArsGOltViziALMW5U/bL
	bpIi6CURfL/wI6ZIUIsZ5E7/qOWK/xc3hnqvQBXc1kjnLh2xWV2pRlamGJEoP/X7aXl+McUfLKQyZ
	l5VqQpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGlTj-00E55U-19;
	Tue, 04 Jul 2023 19:14:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGlTg-00E54v-0p;
	Tue, 04 Jul 2023 19:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 272C761329;
	Tue,  4 Jul 2023 19:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEA2C433C8;
	Tue,  4 Jul 2023 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688498057;
	bh=774aSqho5oCbt5eD+KXB3aukhvZSsdRso4l6bcpL69k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcoONUGGc2ahSTNq9xiKhhd8ppl7hhbCGCWSPF8Z8G2rZY/zePt28kCq42/Jonmto
	 qdigjrE3jEVWuHtHZ84YUpVx/tDbRSvseCVFe1MSBfHXRKe5B/d8OXLx+9Z4emvbYa
	 srhWBskW4AlkHH7hXb7qz02gHISop8/bZOrq+T6BXYApZkJmvUiakSRnctjPMiqXKo
	 PwkOXDorzAISgnf0C06+utAnzQeqIMXt7fjlDowk5+lKl5RskGdr++J3KLXtVftqgF
	 Wf4np0rT2pT+H13phzgUK4ByKb4WZhse8qT3uUI1kCFKvxjqKcPl7/YyUNdYH2CwD0
	 OnV4/Mg/qIkZQ==
Date: Tue, 4 Jul 2023 20:14:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, jbrunet@baylibre.com,
	jirislaby@kernel.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kelvin.zhang@amlogic.com,
	xianwei.zhao@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/5] tty: serial: meson: apply ttyS devname instead of
 ttyAML for new SoCs
Message-ID: <20230704-goofiness-maximum-a964d2fd0dcd@spud>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-4-ddrokosov@sberdevices.ru>
 <20230704-pogo-zeppelin-5fa281f5c9e6@spud>
 <20230704171326.tyforkt7z23zmgqa@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20230704171326.tyforkt7z23zmgqa@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_121420_376324_3B4AF9E6 
X-CRM114-Status: GOOD (  28.49  )
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
Content-Type: multipart/mixed; boundary="===============4032812024175693866=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4032812024175693866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tecr9VZAi6Q825ui"
Content-Disposition: inline


--Tecr9VZAi6Q825ui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 08:13:26PM +0300, Dmitry Rokosov wrote:
> On Tue, Jul 04, 2023 at 05:57:15PM +0100, Conor Dooley wrote:
> > On Tue, Jul 04, 2023 at 04:59:34PM +0300, Dmitry Rokosov wrote:
> > > It is worth noting that the devname ttyS is a widely recognized tty n=
ame
> > > and is commonly used by many uart device drivers. Given the establish=
ed
> > > usage and compatibility concerns, it may not be feasible to change the
> > > devname for older SoCs. However, for new definitions, it is acceptable
> > > and even recommended to use a new devname to help ensure clarity and
> > > avoid any potential conflicts on lower or upper software levels.
> >=20
> > > In
> > > addition, modify the meson_uart_dt match data for g12a, a1, and s4 to
> > > their appropriate values to ensure proper devname values and
> > > functionality.
> >=20
> > IMO, this is a separate change that should be in another patch, had to
> > go looking through a several of unrelated $subject patches to understand
> > how the binding patch was going to work.
>=20
> I apologize, but I'm having difficulty understanding your suggestion.
> Are you recommending that a distinct binding patch for meson-uart-a1 be
> sent as part of a separate patch series? From my perspective, isolating
> the binding patch may not provide all the necessary context as it is
> reliant on a separate 'compatible' declaration within the meson-uart
> driver. However, this declaration is interconnected with the devname
> support patchset. Therefore, it seems that all of these patches are
> linked together.

Maybe it is just a case of how the commit message was written, where the
SoCs responsible for the changes appear only "in addition". At the
moment, it seemed like an unrelated addition that was sneaking into the
commit to me, who was trying to find the code change that made the DT
side of things valid,

Re-phrasing the commit message to explain that the a1 is the reason for
this change, rather than mentioning the SoCs as an apparent afterthought
would make sense to me here. As would splitting reworking the code to
support devname stuff in one commit & adding the new match for the a1 in
another. Whatever works for you.

--Tecr9VZAi6Q825ui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKRvgwAKCRB4tDGHoIJi
0hkeAP9Lzm0lKzEJQ3nWw1mwEopF3oZdVmvGVOFiRIQgcx/mqAEAvkAFRCWE9JpX
UsLys1kHTzKs1mYt4FxBmbpH8kN20g4=
=7yrx
-----END PGP SIGNATURE-----

--Tecr9VZAi6Q825ui--


--===============4032812024175693866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4032812024175693866==--

