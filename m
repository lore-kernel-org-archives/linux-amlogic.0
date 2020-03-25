Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99532C2D0EB
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706E82073E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eU1Px/On"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706E82073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0KBHIK2NnFOuMN2FzwlT/XMZIwutPw67HQF9oG7gPw0=; b=eU1Px/OnUQeL9zKigPvSiwAVF
	Bugv69qVd/xyDmESEImAIfbHgIWBz0gkT0eTl1v4/eG4fq2rXw9lk7ZNbuF4raNxu+r6OC6KsehF1
	aIAFkd3B1eUDT0MOCFjP6JGBm+9bFwLg6Qcbu8lv62zYicpb9Zzr+uTj/x5Q5phKZ+nGG2GHrzoqg
	Sgw1BSnUcsQPYfOIb8bkIKBEzWM8n8KwW7l8Lw01IIFeNR0Q2g7vue3PWr/2mheGZree6Zp2cOYCs
	ua4ZbTgf8okzpiXjaT7OYF2G2uwuRBt8R13jq/1NSeJ9BK5GOOLTqBZ5hF/akyib37tkdeuI6ZblL
	Ea3hlp5vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHEBn-0003Hd-4f; Wed, 25 Mar 2020 22:07:55 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHEBk-0003GH-GB; Wed, 25 Mar 2020 22:07:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6641FB;
 Wed, 25 Mar 2020 15:07:51 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6623F71E;
 Wed, 25 Mar 2020 15:07:50 -0700 (PDT)
Date: Wed, 25 Mar 2020 22:07:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Add missing 'additionalProperties: false'
Message-ID: <20200325220749.GF12169@sirena.org.uk>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-5-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200325220542.19189-5-robh@kernel.org>
X-Cookie: Do not stamp.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_150752_615318_5230FD2A 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============2853629725884907986=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2853629725884907986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 04:05:41PM -0600, Rob Herring wrote:
> Setting 'additionalProperties: false' is frequently omitted, but is
> important in order to check that there aren't extra undocumented
> properties in a binding.
>=20
> Ideally, we'd just add this automatically and make this the default, but
> there's some cases where it doesn't work. For example, if a common
> schema is referenced, then properties in the common schema aren't part
> of what's considered for 'additionalProperties'. Also, sometimes there
> are bus specific properties such as 'spi-max-frequency' that go into
> bus child nodes, but aren't defined in the child node's schema.

Acked-by: Mark Brown <broonie@kernel.org>

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl571jQACgkQJNaLcl1U
h9Afjwf/TlVFnvMm+meLOwlfTMDT7xvKv6i3g4S/t/OkkG/qfuDfUpRz0LarRYTg
8163ZrHY0aAQmLzyxMQR2cBhzM1tfANuY93djQNhe1ac6MUdNxTGLm1n+m9xh/o8
IsSrgrnEqXCNCgqkAvPcDY7qkeLi68p5VqJIfdOjjeJkusQL3Q0kQUv7kpi6cgXn
5Y+PlKm4cxLmOxFeUmCLQKocDSMttTCjxA/jm7jX+CWzKJjObhgsoHP9rg+uIO+1
VHCHKXwxl1a8dhfG9ZnUxXY9UqGqGINojiPmRtTBX5oZqY95zShlcNiJ2HNaRRsT
oIsZgkZuypvPpKies+jaVF2IuoSbcA==
=EzfV
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--


--===============2853629725884907986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2853629725884907986==--

