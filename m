Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA35C44500
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAFmnXtSLDDlRssRWu9EyIaHJMwAeLiRAnUVI6lhtIo=; b=0i8NRxXYivUKG62GuGnSocQAhn
	IolxWHdwIsnWiZMDtrfWkipuSmATpaYjsI/vpoDFOelZmuZGquu5XrHzo6+t21WhJqoQywWney1hL
	kow+TBq945SEgAoIYueepdkiekpglul/ZgyNU5fZMPkXIVXKLAJehbx1aUsDh2uilj86dR6eDzKxb
	rEePr9eH5eju10cztrqHuNk2Xr+XzMxhRXKDKbOjS1IcOCkJMm4ShQdAbseU65eywUV6peoChpXNn
	B299l9Fd1PHt/lo4dfUmjYTv+qEZBi8SauBfaqI3n+CA7NhHLJA20XDtPJOS2yKDhlncLoDSc0hx6
	PAiLMKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdcS-0000000BiNu-2GuL;
	Mon, 06 Jul 2026 07:19:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdcO-0000000BiKz-1q1x
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 07:19:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4720d22c94aso2637504f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783322390; x=1783927190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=m9ANpRyHkZO0DNPZ5tpdKb0G3H+1KfZJD+iijO0+3zVOCMeat9lBhEHGTgN3E7M8XZ
         WXh7qCsaJBM+yO/5fkUF0Lu0pCcNCLbOWhCgrOszKtcULKYXcyc00lP3rZufIl7SwMrU
         ykyCW0/4gevAjru7WnD5k76uK5Wq2JAgykYL7h0CviZ7+wSV+8R6vL3bD8D10u5dTFJv
         173DwNZa8s64Wr116PGM3q+fo3wm8zefAgLyq0KnGcc2oRlTxgNbwFocN7ECat6AH0hH
         lxeyz0kz3lsUWkeEISCGaAA/xVzvhTEhHXC44s0E0d27RjGEp7dGrPwUdFruXU2pV86A
         SGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322390; x=1783927190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIt88eh6zWv+oEhKK/Aw514C6mk0Vd1i5LusZK/Ssuc=;
        b=degjqdVmwkqzrhSpmkKc33VllRDqGOlzFk6Sw8PNb9zrHg+lNa7aaAWIM+F7zp0rlV
         PpDTTjaVMmukUkkGC2QZ+i1zch+bnND4a6zrMs37vgLgUsnnsozna4Ph2FzFPVRhOYas
         O0skC2KCTSTJEWYv/X0B8s8Eu7PgfDVhJp8JPg0woTxB088y8ckLjGfCI004538vXM/Z
         i7RDWWhDGpM+tTDuWUlHi6Q2nQ0QoH6uOcFBSMDGlU7hshb5XyzzNf+Q0WoQgNfirtMd
         WL5YwX4QngRjpWsQ5N2u0CEnWkjw7ajbrDEqEDCorR+vK6IOqHLGDr8KGTcR6FONAizp
         pTMw==
X-Forwarded-Encrypted: i=1; AHgh+RrVHvvhMphk3DRzjmo1UpyDxf3M8I9Cu3DVXoTUgUzxW8lb+DvkeuNDihYBpAUAKO53FL2Nric9PVmvLFl+@lists.infradead.org
X-Gm-Message-State: AOJu0YxUWDM3ff4KqIYkFJpPZmB0C7qMj3ekLqueoatECIZaLAY3GDHK
	xT8+h8NibIFcqsi9sF8gOPPKcX00Xkf1NeRezMVBguWGOifMLILhCLW4LVwDpqm7m+w=
X-Gm-Gg: AfdE7cnGXyQ4T1XZApwGRCXmV2Ryqh7VyfEeePOzvWRQpwcmUnEqUfxM66ICZ+4Y72m
	nSqrRaxK8KFZM7WU9sWeP62VjfD1+gCODw5k+yiLxnVypUrHxaOeUw3hANhwgGPt/9uNpRrJUj9
	NmzbIPxof7UaDXLEaIEDkh8joefQxZ7uPCfuTjMQNZW8Q0OrgMrLZlN6N731CHo6J4/06zXEqHQ
	lpl2dczVwfymUTHykQfQJ5RbCe796SwJxae3BjBdUlIgpqTQMsaiPp2eAG6+Pj9zGSXOxnr7zLL
	6Zzi0hIQujbTMp6y8kecqSXc3V6rh6tkPdlepBMmh4PwtfhSOb4PW25sBhbqXfHnkesf9yFksnx
	6nUm9rOeh3E+Fw4q2NxFUnDj7AB/tamyz7VV0wOGEHzLLXRW6VIotBMC62H+cC7NA5Ndn0IIqNb
	2/012+R0qSMKS6zxw9rnZDKDY4TM6U2SVsHXcV2xXvmG6obNRAV0MMojNdOqEWxNzwfJMhml8t8
	RAy
X-Received: by 2002:a05:6000:d4f:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47aac7d018dmr7577860f8f.41.1783322390409;
        Mon, 06 Jul 2026 00:19:50 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm23183058f8f.21.2026.07.06.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:19:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:19:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Message-ID: <aktWoIfY_DdO6gb4@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
MIME-Version: 1.0
In-Reply-To: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_001952_541784_C7F11B4B 
X-CRM114-Status: GOOD (  19.45  )
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
Content-Type: multipart/mixed; boundary="===============3766825496652221150=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3766825496652221150==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="64vjgbl764osolti"
Content-Disposition: inline


--64vjgbl764osolti
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello Chen,

On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> On 7/5/2026 11:14 PM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> >   - Use a single space in a of_device_id array terminator; A single spa=
ce
> >     after the opening { and before the closing } in non-empty
> >     initializers;
> >   - No comma after an array terminator;
> >   - Also no trailing comma after a named initializer iff the
> iff -> if

This is actually intended. iff =3D "if and only if", see e.g.
https://en.wikipedia.org/wiki/If_and_only_if .

> >     closing } is on the same line;
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
>=20
> [......]
>=20
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index 7d07b0ca7d29..0b6461172e6a 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -225,11 +225,10 @@ static const struct sg2042_chip_data sg2044_chip_=
data =3D {
> >   static const struct of_device_id sg2042_pwm_ids[] =3D {
> >   	{
> >   		.compatible =3D "sophgo,sg2042-pwm",
> > -		.data =3D &sg2042_chip_data
> > -	},
> > -	{
> > +		.data =3D &sg2042_chip_data,
> > +	}, {
> >   		.compatible =3D "sophgo,sg2044-pwm",
> > -		.data =3D &sg2044_chip_data
> > +		.data =3D &sg2044_chip_data,
> >   	},
> >   	{ }
> >   };
>=20
> Changes to sophgo related files=EF=BC=9A
>=20
> Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks
Uwe

--64vjgbl764osolti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLVxEACgkQj4D7WH0S
/k6otAf+MDN98V1OLHB7JSvapxuE4DwDpddJFumdMe3z/vu/P/VdI1oEao4PKhGo
2fMsJUgJT4k/6wIfoB6C3asAQFoEg3UirigbTf0d26+LpcWXfr+MJ/e2tzlX/Yzn
2dH88yKAhOR4HFj73YAi1FscS6vtyPmk7w2A84lWRMvteeY+zJan75O9xwgRC7FX
gEMJExnAEBHY9tEW8dgB3EK07MFFQWLlVpGQll6BbLHxOcMIz17Pj/sI6+7Sv0xW
cahUhiwZ1m+Y0EElAHIwQFoWyyyg7KINbFYsCsnyL1ev/EbUFyGCMRuR270OEIJW
bKMoVE2keTYc8IQjmKqk7x/VPRLsTw==
=LX/u
-----END PGP SIGNATURE-----

--64vjgbl764osolti--


--===============3766825496652221150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3766825496652221150==--

