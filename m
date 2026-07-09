Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA72C43458
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2026 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxZb0V7seCrTmlP4GQSXp1Etvp3agfameMtvFUVhoSU=; b=If2SSfyXULLzPdx0Nu7wAFc6ko
	aAErpXJ5somfcAxdcumFkZ7kCzalrrZ6VWBfRv9AQgH8QX0bTsSFfKQGCVMimGMW2asJB0XAhbWNX
	OoBWDzWLWE5FbOy1lwJiwO+HqHyHk6zJTqeHZC/OwHEnfBYzvY1ahkS/aNjKGsOW982/+zVOLH7uV
	h/HHcHidY8zrNk0K/YaIdDnxryAIAOSOEtvmm5uu4M5OcfpgKBLTsqtQFuSNZUs6f1t80dyItXtpC
	qR88aJacGhZCvpNrDaY5Hp2OL2u/QQbF6JycHHlAXM3DJn9Oo2SqvuvPhIGCEiZIa/tRihVgwzVg6
	8+eptWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrIx-0000000305g-0noE;
	Thu, 09 Jul 2026 16:08:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrIu-0000000304J-0GLp
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Jul 2026 16:08:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47de008b020so4813f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783613326; x=1784218126; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gov176wXURlzSR3dUDxqqJ+JUc69jBkAANSG0MToDuM=;
        b=LtDXbeb4Pi7xAPhMjBCE8oULSk4TMOkKdF2XyRf945xrXh3EWchz4AkggSdH3BCQ84
         b5Nb25msKn6UDK8xxaAcFIh/+cIgjqpgBbncULlCPlOYozOkpts032Qm1L09FLIkICeJ
         A7IPQ0ppAlOvrVpSDzm1HYDlROQzIGQYPi3umisO2EkT8a0NWWS4eYXmiAarLmQEM49K
         /3cic83F6Ajs/shSeV+mmTnwUgCqx0BI8E+zdal2BQtTPhTsvsh4DFMZ/O6pZNU5Des4
         zfqFzJr5Cx9G7STqIKArUfDkkk13pvabYdAjwrEv+q77BPaPFA+CIW6+XmeWNMPphx8N
         tptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613326; x=1784218126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gov176wXURlzSR3dUDxqqJ+JUc69jBkAANSG0MToDuM=;
        b=Eox8jgJ5l4F8qeWg2XQ7nJ0W5FtsuphY5kZdONlzrablfCMADNLtLziv7u/8qRIlHf
         rbkvxkwX7bwcYId7RKd3rnx5wdj6j/N6uspn8XjeLzHCUCJ0/03dSEznA/0lBEL9V/ee
         DU5siBPEmcHqHUypN+P92vu3i9CGAswuAen03zJFJXKJTJdINBG0SMC6BMbXWbYO4n6J
         GJD7AeZrCM/PpVrQyhX/47I2W5tJPniokz6rbudRerka1qN7zETt9t95kMz7ZhnqWrp4
         OAqszEWtYSlpXxnAE9HP4aM7vXX7315Gd5a3j+Lw81T/U3whwafVwY7Y0mvTv3Sfa9hR
         BwIw==
X-Forwarded-Encrypted: i=1; AHgh+RqgbkC4JW57tZQf5iFNluMg8t92wunkMKD7+ryj7L0SkUIOf89cALsqhhg/2IDTn/EEz99TCpvHAaDtxTtx@lists.infradead.org
X-Gm-Message-State: AOJu0YyM0sVwy3WQyRLc99KIcuZOsiTChdMHq2xMZP5xdgRJI8Tmien5
	F0B+DLaqTQ2EtNmaogQ1XcsOjHDhiAY/jB7nxfVFUa+61PZF4KwWbzCHQPMNEspuRew=
X-Gm-Gg: AfdE7cnsBNdRgI0Wv4ZWmCFom6HP+INe/24OSlFAswMs756MDJG/YLMlozADte+9pei
	zoyHupy8kjObEjz8bmR9dD9qReAHSCTwvchKSk7RQO/rujVowqAGvfPBdtzfEYFmZZeann2UlcO
	rZoZAHcT43bKAUdEWhz+bK/QbnkgNExNveNThU7a0l4/uf7RC/2kNdJKIpLNIGF2ujc10hHLwbl
	JwM14ex3TyVq+KuaDhCsDnpthW+W8ikem54g53wHdO1TfTeBrf5vMjmv8Be0BQOc2CNG86EUCrp
	3IY7IMxve9EN8CTzYtIdQUcJus7sVG/S4H+EmyfvR6/mPOn2m+t3JsK5CVsL4XCZ48NPdml8kIn
	mTzfEgGA9PpPaCl3rK3n99LHddgWN5B2BKf9kEKDWw1vnIRXkqq/XeOuBmtxQ9gYQqymPmzRTUG
	wx+QAMtfolh2v3E9xjbrHOJF+rf8WPo8NgJJquY4JVeop59EO+UqpyuQovwwUoHPse9e5qhDyrZ
	MKP
X-Received: by 2002:a05:6000:230b:b0:46d:f979:1827 with SMTP id ffacd0b85a97d-47df757026bmr3824909f8f.23.1783613325532;
        Thu, 09 Jul 2026 09:08:45 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm50486350f8f.29.2026.07.09.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:08:43 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:08:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, mfd@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, linux-crypto@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	Colin Foster <colin.foster@in-advantage.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Zha Qipeng <qipeng.zha@intel.com>, Thomas Richard <thomas.richard@bootlin.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, Xu Yilun <yilun.xu@intel.com>, 
	Tom Rix <trix@redhat.com>, Michael Hennerich <michael.hennerich@analog.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, Support Opensource <support.opensource@diasemi.com>, 
	Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Samuel Kayode <samkay014@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	Linus Walleij <linusw@kernel.org>, linux@ew.tq-group.com, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH v2 00/23] mfd: Use named initializers for arrays of
 *_device_data
Message-ID: <ak_DIUQI9MX5aB8e@monoceros>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ak41yQp3x78s4Fmx@ashevche-desk.local>
MIME-Version: 1.0
In-Reply-To: <ak41yQp3x78s4Fmx@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_090848_132848_EBE07C6F 
X-CRM114-Status: GOOD (  27.38  )
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
Content-Type: multipart/mixed; boundary="===============7403189216802739563=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7403189216802739563==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ka4fpqo6ejmxfupn"
Content-Disposition: inline


--ka4fpqo6ejmxfupn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/23] mfd: Use named initializers for arrays of
 *_device_data
MIME-Version: 1.0

Hello,

On Wed, Jul 08, 2026 at 02:34:33PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 08, 2026 at 01:15:07PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Hello,
> >=20
> > this series superseeds my previous patch "[PATCH v1] mfd: Use named
> > initializers for arrays of i2c_device_data"
> > (https://lore.kernel.org/lkml/20260515095839.4005460-2-u.kleine-koenig@=
baylibre.com)
> > that Lee asked me to rebase and also the series "[PATCH v1 0/3] mfd:
> > Initialize spi_device_id arrays using member names"
> > (https://lore.kernel.org/lkml/cover.1783003256.git.u.kleine-koenig@bayl=
ibre.com).
> >=20
> > The objective for this series is to prepare mfd for changing
> > of_device_id etc to make driver_data a union, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for the idea behind it.
> >=20
> > This series is based on yesterday's next/master and it does the
> > restructuring not only for i2c and spi (as the two series mentioned
> > above), but for all *_device_id structures that I intend to modify with
> > a union that affect mfd. So (I hope) this is the only patch series
> > affecting mfd for this quest.
> >=20
> > I don't care much about the last few patches unifying the coding style.
> > I think it's a good opportunity to do that, but if you don't like them,
> > just don't apply these.
>=20
> The patches bring inconsistency (or still leave it) with the terminator s=
tyle
> in both I=B2C and ACPI ID tables. Can you revisit that?

I found a few inconstencies for of_device_id, but not for acpi and i2c.
I have a script for the acpi and i2c (and now also for the of) changes
and don't spot inconsistencys in the terminator style for acpi and i2c
devices apart from comments.

(I looked at the output of:

	git grep -lE '(i2c|acpi)_device_id [a-z0-9_]*\[\]' drivers/mfd | xargs -r =
sed -rn '/(i2c|acpi)_device_id [a-zA-Z0-9_]*\[/,/^};/p' | grep -B1 ^\} | so=
rt | uniq -c

)

Do you mean to unify the comments, too?

Best regards
Uwe

--ka4fpqo6ejmxfupn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpPx4cACgkQj4D7WH0S
/k624gf/dzy2q/+UDcko+3qRC/vjduntKV5JaImo1jv66pbGa0vVyVdYDHS/QwvV
X+Jr6jTMyEZcw6O1onRP1ZIcKU6MTkl/wvtqeLkFJ4PXv/hKftTSkP/IHkLuekNm
Cn37LNIalY7gpr1gfPvcL5Q/BN1qqXCUggmW0xXf+Gi9W5bwWuTaRsJ9ehVptA3+
rMp5HAYJ1isaiiqfMZJ/TqtNWHN6aVh8ZS6YU5b2iDitwtnRCQD1pOcYCYaXgfrt
fbXqb+xpQvMfRgK+MLErhmJUfHf2tKi1s5OKoG1T9fiLCmp0VzTkB4+o4AgpQgeE
pUTRSN5jhrCLDAt7v6B6b4XHPcYmTQ==
=tSBk
-----END PGP SIGNATURE-----

--ka4fpqo6ejmxfupn--


--===============7403189216802739563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7403189216802739563==--

