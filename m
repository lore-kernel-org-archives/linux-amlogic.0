Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1273C44501
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MienWaR725JIaSLKCh0KEuNE2jhCpneCB5H0NrmO6c4=; b=c1GIaWF0sPWf39tZBnBhruq3XP
	7KUC831qCWfxAqq1cW+7+cOubBIsO6Cz4lJ7Y3zb0GPfuOLzVmpwnXyL4wm23doDbIEjotynPiuav
	ETi0IYCGNABkl86XAbYFYOJKX+TcZkSRxxpoews1S8jSd4weweiwF56tTcPTAVo9Z9dddlo1DYgqo
	bnsA1i7P1hqr8sk/gthhUL8v3HDEGSv+yKkU0kal5nFlxkmvF4TEj2UQm2cuTtc3fcoFO5xQtVPGR
	y8Qp8Zi7BEC9aDub9VtvNwSwTQdumiRdRQY75CHysbAsYyyaUm0MYTwk3K0lJkxKl1eD4/b7vPtDf
	NCD6DFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Cg-00000004POF-1FMk;
	Fri, 10 Jul 2026 08:03:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Ce-00000004PNe-1abv
	for linux-amlogic@bombadil.infradead.org;
	Fri, 10 Jul 2026 08:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=; b=IoHMJ8M/1I9duG8FfJfP2ZrW+X
	7gOX8X42Ou/6DGpk6fsnzo6mCWCyso3alcwsV2zWUKojO2Rmg/2Map31jOIO7828Gj/UHpz19FXM9
	0uwz/knUdqk3SfWZUFHw5+/5XKQes559jk/4HQi6CVi22DZQ8VzZ7iXrnavXzTRzXGwwivlkJ4Pqs
	oCJQ7YG2G8uUvyayDinJ+NwvALPm5UqVpSC3GRLA4eJodQtjBFMyonHwnWOPQezrB/1PnwpWIjFD1
	xYCEwYq672qzHGZKuOQ+qwJtwIuBiTkq/StzcV2w1oEGAk5FN1Zi8yVC/UQn0laq7yw5O9z0TnjFk
	pPlNgzpw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wi6CX-00000009ojW-35Px
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 08:03:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so5191975e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670591; x=1784275391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=omskHjw2wLUUPPAr5VZ54tD9BM2BzNA9kXzBxJ9XXF2GKOO7S3qWwjKiKDHffK3qXx
         zw8I0bwumn/L8+ABBNRPQN92eiu41WvyWvQBg6fubQjc+v7G/iBrW1TvVAjqVf970arZ
         VQ6WagOJNWo1ZSSwjACKZKrPX8s5TG2X2yNTfZ9dsy4Nvio+wqnQviIbql/od6f9bGRc
         /jp9jYuUXWWhFoy8y73lPJUhmTwgGgRoc4lcNyw3lPg0q8o3razm0+sxcbL8/s1vHEL9
         Mqu9j4yXGDl5kOKoETcyPEzQnaM8R4bi0flb/qNEFajHFbhs7E13VfQJzqRNeTLY6u3Q
         xapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670591; x=1784275391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWdfXN3BNh6HNT+0goMzdBpTUvzgP37bXlBu5ybAYas=;
        b=MZRUsLy5l0+8nTsaBEL3aJv8xCVLeLhQpR8SGdHbcw2ska8mznfkc7z4L1Zkz82Ae8
         ToGUBvGcvquruhMe3+vhHDYIl1Efbd8xH9aEvTo4iTyNFoCMsFcAmycRpa3jIleZOK5Z
         2PVaMpLZrVW7Af1S6nR8bj05U3YVMpRARysMZ4+SBJN0jx9tsjGo/+UNLx6BtxP/1uzp
         QDSBsxF7hUB4qRSVu19Zc/uLM/zqNvlz5Qu66JcOhCqOmhXYdwyd9/O9CnpYI5w6hn/7
         pm5Lo1kh7A9IYUDN0PaxEpXHy+vvKWfRVj81rpkzvSh/4/HxvYYJJ7omWuhBkQBmBPiw
         +JBA==
X-Forwarded-Encrypted: i=1; AHgh+RoK/DtzIKCWoT2MD/zfCmP4NWDCu+w8GbBqfFvloEER6pvmQgY5TCHtZyefB3J/mIGJXg4XnvHlzWDGQcy2@lists.infradead.org
X-Gm-Message-State: AOJu0YxBI4iA7xy1XIEDeENN8IwacbsTwxTk2o/qX8lKvpd1mlqQ35+Z
	gI/uQ4d6XwzEpCIDd5jAE8yA+746WTH4N2OngJvBUYHSJ7CI1VMfqJmbemNkBmbHLl0=
X-Gm-Gg: AfdE7clVllyYbXchQERS466yIXi9KuZVXB2t6FHIo/Yn4mfTgIOPXZhB8ZzTrUat5l9
	FqrB1L9+fApp9N/urWdgqKrn/3NF4XaUbnP0Ei03ZQFrV6YuxLERl1ikfn5RLTxgx6PbCAK0s7p
	WKfLejf4TYiisMwUXrGPrYAwrdrLnbJHN5FCkdJAYEZxJYdG8CvWHgReNXXlBYihnuteQSGll4c
	A764ZGKs73FhIGooBBvbHlboiQKC96QWR7S4gqdoTnLFgfIBYQVTBXXHYZQIO8XGft3+Vzu3hYq
	wp7sEIOFbwcAo0PCR9UKTs0hwoGti81lrpM4dDqQ6h5+AB5eqap6qLbWuENznkl3nXn3n/htbSM
	ZTEGyW8PIor+1h52I66oWfdTQHDHX7Btvg+qVo6OoazXb/LPvQRakMZDT1z4Zi3H8MmFLdfkUer
	QsX9L9ScVWCgVBdsQ6V1UhTLStphfEicd3jyIskbj4cEzMj5sWGU6KGVuUdCfr08CU+HL31OmD0
	TBh
X-Received: by 2002:a05:600c:e557:20b0:493:c0ec:9a5f with SMTP id 5b1f17b1804b1-493e68ddd9bmr75755495e9.19.1783670590951;
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6e4csm55102028f8f.10.2026.07.10.01.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:03:10 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:03:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
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
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Alexey Charkov <alchark@gmail.com>, Sean Anderson <sean.anderson@linux.dev>, 
	Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
Message-ID: <alCm-J1wRBnhoH0C@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1783263835.git.ukleinek@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090313_861311_B2C590B5 
X-CRM114-Status: GOOD (  13.20  )
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
Content-Type: multipart/mixed; boundary="===============7351284992165805480=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7351284992165805480==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuf5svn2mmf3pdwc"
Content-Disposition: inline


--iuf5svn2mmf3pdwc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 05:14:12PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> this series is part of a preparation for changing .driver_data (and
> similarily named members) of *_device_id to an anonymous union.
> See e.g.
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre=
=2Ecom/
> for the idea behind it. I also grabbed the opportunity to unify the
> coding style for all these arrays while going through these.
>=20
> The patch series is based on pwm/for-next + "pwm: pxa: Depend on OF and
> simplify accordingly" [1].

Applied the series with s/iff/if (and only if)/ in the of_device_id
style patch.

Best regards
Uwe

--iuf5svn2mmf3pdwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQpzoACgkQj4D7WH0S
/k4qdwgAk8w911oLsA5aqycP2AV5trJAC5zx53mJ8LxbKoImqWjYyvmd9Kb5YCt2
LPeZPEPqg6LIhPMbDp91hBWArDL5UUUJ5OfgC8/i0zK1+zWS0B+UPtXUGxzQOkwk
stkrTAN5eVW7rhVy1AtT4N+EJVm4Y8958RVsmNi75/idP+gmhs7RdJg8zMdhrVVy
M7XB5Q1zxVcmhsx5TDStZ8tzeFMsDbMqz0s0xVECWSq50U70IwD0Scn0a1BN68kQ
+fZQMwGT3KhdqqmLJV44puWQoDqj8OwGeAuWJQykzluefOFNtRHtRhurlZQAUOrv
W4X++IXkqXbyyTO72ousttS/RpH5ig==
=4YUW
-----END PGP SIGNATURE-----

--iuf5svn2mmf3pdwc--


--===============7351284992165805480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7351284992165805480==--

