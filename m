Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EAEC25B74
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJBs5S8bI7zlW92C7OmjPN15EVm8cxf9zLsdkNvZ+qE=; b=HqbIk18YxqLizgtLAUrtcrPiLf
	gcnCo1QrEaeklximhnUinZgXD9OxxSYk9ACtX+syK7wPAxnDJj4yPN+YSCGvnNl/8ncv7KaKCBRwj
	j1JksKuqOaAzrwJjHvcS8W1LF+PAraG47OxHsJLQzs9F7lELfnsysRSKkgzJQlSWxptjYyhgxD13X
	8zkJTd1V3Ncuqhs4k412hGryalFfyLfXRp4EDCVCu6GobX7P0aP77l0r1HTISUGDjeESz5MkFs5UU
	JAIlSSyTBle2QU3kq225J+onhrTqSQiRca2or4gzMDPqh94UZXBZS3tmNe0kMoGINY/VBNxzyNs0m
	3kI2lgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Xut-0000000DPIY-33JY;
	Mon, 13 May 2024 15:48:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Xuq-0000000DPHa-2FT5;
	Mon, 13 May 2024 15:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E3E960EAB;
	Mon, 13 May 2024 15:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD10C113CC;
	Mon, 13 May 2024 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715615319;
	bh=cy/xHMkRc7jqrmPrSj9BRAllfeNdujydY/6qQIY7t2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIJo+wxDpj/KwHwzW0KlhbvGQOwnBWFNBlGH0EAR4HUb4LJQJCBOPR18slWzk4AHA
	 HxJcM6sBnSmyu6I+kwEwW1Ssd09PBbazILJvRDaPXAHqPH8YlQ043C4A6VVf0FZ0JO
	 Y5r4eHTCRxlfdBdVM90Vjz0qhZZHfo9CuopdzQbwtd+pgLbPSh9WsjfQm9LOrmjWs/
	 9b8NNpzdEhYXqL/jYUn++kEQtVieM/3ouYe5mrDx3eE2z9kcKsFckdbnvHVFUzRfn8
	 VXps67ZiPsxtjhDVzvCDyr93gEBRJRm0avxEk7QHG+MWs3fBr5Txi3ToRjso/4nkIj
	 tQsvxBl0EXx4w==
Date: Mon, 13 May 2024 16:48:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240513-epic-magnifier-8dd83db81c4c@spud>
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-3-ddrokosov@salutedevices.com>
 <20240511-secret-barcode-e25c722ddf1d@spud>
 <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20240513091735.l3uewwzfrdd6qwbl@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_084840_644077_E84CD968 
X-CRM114-Status: GOOD (  23.19  )
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
Content-Type: multipart/mixed; boundary="===============2542777953968184128=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2542777953968184128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lAeSj6B3cXSZn8Gg"
Content-Disposition: inline


--lAeSj6B3cXSZn8Gg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 12:18:02PM +0300, Dmitry Rokosov wrote:
> Hello Conor,
>=20
> Thank you for quick review!
>=20
> On Sat, May 11, 2024 at 02:08:03PM +0100, Conor Dooley wrote:
> > On Fri, May 10, 2024 at 12:08:54PM +0300, Dmitry Rokosov wrote:
> > > The 'syspll' PLL is a general-purpose PLL designed specifically for t=
he
> > > CPU clock. It is capable of producing output frequencies within the
> > > range of 768MHz to 1536MHz.
> > >=20
> > > The clock source sys_pll_div16, being one of the GEN clock parents,
> > > plays a crucial role and cannot be tagged as "optional". Unfortunatel=
y,
> > > it was not implemented earlier due to the cpu clock ctrl driver's
> > > pending status on the TODO list.
> >=20
> > It's fine to not mark it optional in the binding, but it should be
> > optional in the driver as otherwise backwards compatibility will be
> > broken. Given this is an integral clock driver, sounds like it would
> > quite likely break booting on these devices if the driver doesn't treat
> > syspll_in as optional.
> > A lesson perhaps in describing the hardware entirely, even if the
> > drivers don't make use of all the information yet?
>=20
> Yes, it's definitely the right lesson for me. However, without syspll or
> syspll_in, we cannot utilize CPU power management at all.

That's the status-quo, right? The incorrect dts would continue to not
support CPU power management and the new one with the correct description
would?

--lAeSj6B3cXSZn8Gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkI2UQAKCRB4tDGHoIJi
0tl8AP99J+IYSbMrqEfdb2ZfyxV07AxuPzRV6G7nL6Scs3gOZAD+NXFURLw56u7y
ypHqhNg+eH/FeNmtrCAHj0jZEzJfbgI=
=oOXC
-----END PGP SIGNATURE-----

--lAeSj6B3cXSZn8Gg--


--===============2542777953968184128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2542777953968184128==--

