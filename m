Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D1C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBuVG/vLrcjIluID27jFoNSuNjFnfVzZdM5R97Pe4Vo=; b=byUW2XBDGZ/a0gWcLcDhTUW7OR
	ZRG/3JLYXEDy/toYk06YLyoQyU+NlmiiFxImDITcBTTbfr24Al99kF7lYcoIdSfrGHU45K54vvB+y
	sePh8JqjUzWxOJeS73vCaNgp1q3/UlAbe6YzAvoHf9ZB1dJWL4jMeBC3R255K81/6lXznr8rqNStO
	3ZKoQeB9NTyPurJ5X41EWBywK2+ws8e0fHEL5xAwGJaCwdQGk+qmAINBlCy+w1fABi/ratZgX3whE
	WKqghXGrWr+T4zyqcxCVeEQVLC48bTLg09tyS5Lae6eukB/Ihczph9/4ceUZB3TDk7xue0M4lrSZT
	DRi7k/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vkT-00DBcU-20;
	Tue, 30 May 2023 09:34:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vkP-00DBbg-2u;
	Tue, 30 May 2023 09:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685439275; x=1716975275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wp2pAf3CqrBt5skpkT7zvWMDCqetgcUZchDB3RC0Ee0=;
  b=Yd7foSjkOptFSgLAR6tq1EbWKEpO4qoYB7VfhU8KiEJge8Mk1jvzxPzI
   epTa7i9ajSMBpQZ0K9m3XSarRTkOU2WeVbGWKcbdjM54RSBb0XlkhEDje
   inxRzCdqRB6aVvspmqJePsxt3GqNcpl/41KW3h+CHBlOrmE6W7Fo6IhK6
   HNnHJZpsofBTMIZhdlMutFa5S0MACDUBBi5EiHpw5Uw3yTVXgZFTjz26D
   Eany0aOmUgSgcGrnfk5NG5nC/JED4YoQoexEKqiHZfKyGHqRZAxrTKYh4
   2YY8YVtcH+UFflMq/KrabTVnWn1DrZSBJGCHbmKICOdIr+IJr51J+G4Y+
   A==;
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="asc'?scan'208";a="216005891"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 02:34:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 02:34:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 02:34:29 -0700
Date: Tue, 30 May 2023 10:34:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<jbrunet@baylibre.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <khilman@baylibre.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v15 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230530-illusive-pushpin-1e35d0a50e0d@wendy>
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
 <20230517133309.9874-6-ddrokosov@sberdevices.ru>
 <CAFBinCC3kQ9Nz3R2W-Qj9tbPJfS8JsB_4AkmPgS6xpQ96DBy2w@mail.gmail.com>
 <20230522130033.a47vlybocme66rev@CAB-WSD-L081021>
 <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCAk9+Km3BssA8d8nc_Z_GbhY87FD3qQRpZ2k7ChKt7TBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_023434_120162_7B319C32 
X-CRM114-Status: GOOD (  48.01  )
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
Content-Type: multipart/mixed; boundary="===============9004324191264021458=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============9004324191264021458==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="36vkeFCCRp4Cr9uu"
Content-Disposition: inline

--36vkeFCCRp4Cr9uu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Mon, May 29, 2023 at 10:38:33PM +0200, Martin Blumenstingl wrote:
> On Mon, May 22, 2023 at 3:00=E2=80=AFPM Dmitry Rokosov <ddrokosov@sberdev=
ices.ru> wrote:
> [...]
> > > This IP block has at least one additional input called "sys_pll_div16=
".
> > > My understanding is that the "sys_pll_div16" clock is generated by the
> > > CPU clock controller. Support for the CPU clock controller
> > > (dt-bindings and a driver) will be added at a later time by Dmitry.
> > > How can we manage incrementally implementing the clock controllers?
> > > From a hardware perspective the "sys_pll_div16" input is mandatory.
> > > How to manage this in the .dts patches then (for example: does this
> > > mean that Dmitry can only add the clock controller to the .dts when
> > > all clock controller bindings have been implemented - or is there
> > > another way)?
> >
> > You're absolutely right: currently, not all inputs are supported because
> > the CPU clock controller isn't ready yet =E2=80=93 I'm working on it at=
 the
> > moment.
> >
> > I understand your concerns about bindings and schema description, but
> > there is an issue to be considered. I'm developing the entire clock
> > controller A1 subsystem incrementally in three stages: peripherals and
> > PLL, CPU, and Audio. This is because the CPU can operate at a static
> > frequency and voltage, and the board boots normally without the CPU
> > clock controller, thermal sensor, and OPP table. Audio is also
> > important, but it's optional. On the other hand, without setting up the
> > peripherals and PLL controllers, the board won't function because
> > they're fundamental.
> I understand your approach and I like it (without that incremental
> approach you would probably be looking at a series with 15-20
> patches).
>=20
> Maybe the dt-binding maintainers have a suggestion for us here?
> Let me try to summarize the issue in a few bullet points:
> - There's (at least) four clock controllers on the Amlogic A1 SoC
> - Some of these clock controllers take the outputs of another clock
> controller as inputs
> - In this series patch the peripheral clock controller has an input
> called "sys_pll_div16"
> - The clock controller which provides the "sys_pll_div16" clock is not
> implemented yet (my understanding is that implementing it and adding
> it to this series is not easy: it would add even more patches that
> need to be reviewed and in general it's a tricky clock controller to
> implement as it manages the CPU clocks)

If I am understanding correctly, this series implements the child
controller and a parent, which is unimplemented, provides the child with
sys_pll_div16.
The thing I am missing is whether the child controller has some outputs
that depend on this sys_pll_div16 input & whether those are documented
in this series. Regardless, you should be able to add more output clocks
without compatibility issues.

> > Right now, we're in the first stage of the plan. Unfortunately, I can't
> > disclose the exact names and number of clock bindings for the CPU and
> > Audio, as they're still in development and only exist in my head or
> > draft versions.
> >
> > If possible, I'd prefer to provide the new bindings and connections once
> > all the appropriate drivers are finalized.
> Question to Conor and Krzysztof (assuming you read my summary above):
> Is it fine that Dmitry adds additional inputs to the peripheral clock
> controller binding in later patches?

Perhaps Krzysztof will disagree with me, but my take on it would be that
the binding should describe the individual clock controller in its
totality, but the driver can choose to only implement a subset of it.

If you define the binding as only needing N inputs, but then later
expand it to having N+M inputs, the driver will have to support N & N+M
input clocks to preserve compatibility.
If you define it as needing N+M inputs from the beginning, but only use
N, there is no issue with backwards compatibility when you later use
them all.

> If not: how can we proceed in case we need to add them now (the
> dt-binding example is the easy part for me as we can just make up a
> phandle like &sys_pll_div16_clk and use that - but this can't work
> when Dmitry tries to add the clock controller to meson-a1.dtsi)

I would be inclined to do the same thing in the dts as the example,
and make up a fixed-frequency clock and use it to plug the hole.
When you have bindings etc written for the clock controller providing
that clock, the fixed-frequency clock could be swapped out for the real
one.

> PS: Dmitry is trying to get this series into Linux 6.5. As far as I
> remember the common clock maintainers don't take pull requests with
> new features after -rc6 (which is in less than two weeks).
> So time is getting a bit short and for me this is the very last
> outstanding question. If you say that it's fine to add clocks later on
> this will immediately get my Reviewed-by.

I *think* that what I've just said should not get in the way of such a
timeline, as it would only involve a "small" change to the dt-binding,
but not require additional bindings or driver.

Cheers,
Conor.


--36vkeFCCRp4Cr9uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHXDDgAKCRB4tDGHoIJi
0tPiAQDxJgM01v9LEi2iF1dr7RKotniwIpWYNsLXwvRueTh4JAEAz4CqON+2GW8z
dmSUkX/YHEFtQPiocrOvOz8I74RHVg0=
=ipL3
-----END PGP SIGNATURE-----

--36vkeFCCRp4Cr9uu--


--===============9004324191264021458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9004324191264021458==--

