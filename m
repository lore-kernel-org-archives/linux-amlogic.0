Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91BDC77B7E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwoZtV81d5oZtrb11g18NVaqQx8JCG5RAZ663peGx/Y=; b=l3ISa21N06KmOe
	+YS9UeKtawWCtY3DRAhRpseIHdx8vsiqyGUPRlBjHsR8EOA81gmoAJogadXc0DnrmmG8vZ7AmzBZv
	7R9YsdGXNV8gCo/2DCOMF7eZI5gHSwD+5sz0GyF6bm3c8vvwZf9n/r3eNEFzb+R7VlGlPyOrOEnZD
	7js+xVZaPGreJehPgwmZMjbcpJIjc+mYH3+3wwuUNwK9eKzSwuX18BjGa8+Y6Xr1XxZ8d5nh4g9nN
	vcQ5pdTQT1LzSh0mrYX855mObNtSTq95SqACYEpn+7Sc7d3+xDQxOlBkvT2iTMROO7t3Gf9Ct0EPu
	By5EcBiqh69/PN0MaZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3mMP-00BvQt-23;
	Mon, 29 May 2023 23:33:09 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3mMM-00BvP1-0k
	for linux-amlogic@lists.infradead.org;
	Mon, 29 May 2023 23:33:07 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 2552c16e-fe79-11ed-b972-005056bdfda7;
	Tue, 30 May 2023 02:33:00 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Tue, 30 May 2023 02:32:58 +0300
To: George Stark <gnstark@sberdevices.ru>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Message-ID: <ZHU2Khf84nbLW7Gg@surfacebook>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
 <9df82b13-7594-a8f0-f27e-87bce5a38b74@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9df82b13-7594-a8f0-f27e-87bce5a38b74@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_163306_436537_027F4CD7 
X-CRM114-Status: GOOD (  16.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Mon, May 29, 2023 at 01:31:40AM +0300, George Stark kirjoitti:
> On 5/28/23 13:46, Andy Shevchenko wrote:
> > On Sun, May 28, 2023 at 12:48:54AM +0300, George Stark wrote:

...

> > > +	if (index >=3D ARRAY_SIZE(chan7_vol))
> > > +		index =3D ARRAY_SIZE(chan7_vol) - 1;
> > I think this is incorrect and prone to error in the future in case this=
 array
> > will be extended. What I would expect is to return something like "unkn=
own".
> =

> I agree this part is unclean. Actually the register's last 3 (out of 8)
> possible values are stand for the same mux input "ch7_input". So
> theoretically we can read from register a value out of array bounds. There
> should be a comment at least.

You can add there in the array to extend it up to 8 entries, so it will be
clear. And for the rest you will return unknown / unsupported / etc.

...

> > > +static const char * const chan7_vol[] =3D {
> > > +	"gnd",
> > > +	"vdd/4",
> > > +	"vdd/2",
> > > +	"vdd*3/4",
> > > +	"vdd",
> > > +	"ch7_input",
> > > +};

> About the question of naming mux inputs from the other letter (vdd/2 vs
> 0.5Vdd etc).
> While I fully agree with you that point is better than slash but mixing
> letter cases... should we?

What's wrong with that?

> e.g. this is how iio_info output looks like now:
> ...
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 voltage7:=A0 (input)
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 3 channel-specific attributes found:
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 0: mean_raw value: 0
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 1: raw value: 1
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 2: scale value: 0.4394531=
25
> =A0=A0 =A0=A0=A0=A0 4 device-specific attributes found:
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 0: chan7_mux value: gnd
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 1: chan7_mux_available va=
lue: gnd vdd/4 vdd/2 vdd*3/4
> vdd ch7_input
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 2: current_timestamp_cloc=
k value: realtime
> =

> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 attr=A0 3: waiting_for_supplier v=
alue: 0
> =

> or naming with Jonathan's approach
> /sys/devices/platform/soc/fe000000.bus/fe002c00.adc/iio:device0/in_voltag=
e_0.5vdd_raw

See the alternative I proposed is to have _ delimiter. But that might make
parsing a bit harder in user space.

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
