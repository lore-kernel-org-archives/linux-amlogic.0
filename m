Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE46AC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 06:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAD62173B
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 06:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmgF2xsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFAD62173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0zpVK+va/ChbPzwJ9ctYmxt6LyXmgoBs/lPsl76vtlQ=; b=YmgF2xsSl9HoWhg/3NDUmu1Eh
	BZffIexf1xAOWZ/EOG6mvUEpbVt3CKoaW3na2AWNKkKmo7nFB+A6KUIWzRmnK/5BQKVRBr/5Imo6K
	rNzEanjdfAOmMO9LTYt+keiL/K45xzkdqsjQpusWPZjcDjpbbUFVTOgLXJbnYfbo2CFKQkicsPK2m
	oJjBr+R9yL/TzB+pQBMrc7ZSisMXOTw5faSrdJxdjya9lQ6/GH2/ok9Hh8ojOy2iOzANcm7xd7hdk
	TM0DYMoh0f/1lVYVyzWJmrniDlI0ZI5gU4fIPxEBtojGLcS4mssldc4EsMvkXfmZVlJ4rl/bMbUdl
	PfmWJPdgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghUGV-0004p1-KR; Thu, 10 Jan 2019 06:56:31 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghUGR-0004oZ-J5; Thu, 10 Jan 2019 06:56:29 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 837A520734; Thu, 10 Jan 2019 07:56:24 +0100 (CET)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.bootlin.com (Postfix) with ESMTPSA id 30C472072D;
 Thu, 10 Jan 2019 07:56:24 +0100 (CET)
Date: Thu, 10 Jan 2019 07:56:24 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Message-ID: <20190110065624.4j4gkznsdvfz57d7@flea>
References: <20190109202934.29304-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_225627_902161_9A036E01 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, arm@kernel.org,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Content-Type: multipart/mixed; boundary="===============5080918608884443385=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5080918608884443385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fume3wgg3rjtcc4s"
Content-Disposition: inline


--fume3wgg3rjtcc4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2019 at 02:29:34PM -0600, Rob Herring wrote:
> The 'arm,armv8' compatible string is only for software models. It adds
> little value otherwise and is inconsistently used as a fallback on some
> platforms. Remove it from those platforms.
>=20
> This fixes warnings generated by the DT schema.
>=20
> Reported-by: Michal Simek <michal.simek@xilinx.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> armsoc folks, Please apply directly.
>=20
> Note that there's still a case left in msm8998 that needs a new=20
> compatible string.
>=20
> Rob
>=20
>  arch/arm64/boot/dts/actions/s700.dtsi         |   8 +-
>  arch/arm64/boot/dts/actions/s900.dtsi         |   8 +-
>  arch/arm64/boot/dts/al/alpine-v2.dtsi         |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  |   8 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   8 +-

For allwinner,

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--fume3wgg3rjtcc4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDbshgAKCRDj7w1vZxhR
xb2JAP9usSHLB3EKiuJeAJXfke9EJ8oJBC6mlPxRM8EYVO4W9gEAw86G0yzk2GPQ
LG3m1YjQ67W8bzxcxnP2/ecJ61R/DQk=
=4PLX
-----END PGP SIGNATURE-----

--fume3wgg3rjtcc4s--


--===============5080918608884443385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5080918608884443385==--

