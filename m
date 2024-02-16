Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D1AC48BF5
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Feb 2024 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXLJbrIxE/5/07J4EooMHBQF4sRuWC+G1zItxMvjmds=; b=E6czBKBYWr1I3caJ2zJ0K2wX+z
	HUQ1WU7XB3ebto0rLpO3eS5ahfwGOaqJf4JwrFwGUSp8D1TZUB5yjAspG/AYPxlHfH/PRDYq79LbB
	fcfRkmztQKfK1536kEOIjpNl9Szn/5xR7TjyubIIZfhg8W0a5O9qRFqPRyFSqruboZZruOsU2GPJc
	/L8Hu5qWMvT0djWFSKMNGV3XLK8gEK+xNRavea7K9IG7u/Z9y3eWlE0z5FkPK2J/zdN2nZeK7I+8f
	ikC2m398xhj/85nnk3zSssrJUIC78UqMypcqgu2l72+xnIySKSwzOK+NrimQlcHBrjNG+O1Gi/mMq
	zdEQYwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawJj-000000028Nn-0xiZ;
	Fri, 16 Feb 2024 11:23:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawJg-000000028N1-1e8F;
	Fri, 16 Feb 2024 11:23:41 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-511a04c837bso2257568e87.0;
        Fri, 16 Feb 2024 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708082618; x=1708687418; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
        b=URxzrfgdFsFVPTc90qDPdd8vltCkUHKYii1N6UWJ05gnGEittSK5xiD4cWAXlOHoJv
         iiN/uXLS0j8tm936cghSG6Ty6yVU7DzKmpSwOF967OPcEwE8xSxQy4+URexwjbuY/Pl5
         jwdIYgbqzCdBz4NBGI9/kOD17943gV/ytDfLWxhMJB1Weh/kV4GxpKDDqtdf0b5lvCEd
         /TS6Dxls+tWIrjOcuElpNOXbFqjBXcMNt09hoDY86N4jXf8AAPsLUpXo2hmJT8HaiCaf
         LSdDPZRdcj2cosPdF/1Z6e1IB6Faf1UiHru0xgf1iEcJ4Vw1P2XlyYEY+TPmX+zrk5/s
         fuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082618; x=1708687418;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
        b=T5rBDjlhoq9BuywIhZd/yKvc7O0oJuX/fEJqTQvoruXTgjlMiUOBoYhQr4d86mmzjr
         E9CqIHe/z1vD5QSY0wz8xfQEi7SCAd948LAsZ8ylagxix8A+MZQbY74esmNC1USev0Pv
         ZvEhP0Ub1KmlMqcKzGJ1FW7U1mGpaKsuaQXQpVR9ZprdB7MipVffw9ILOaKLuxoENeSc
         5J9RFnx5rVb20yeUpPZUqxu4IIciIbTmuWk1sEbN6/kQW4G07PNqQu8xk3WFrZzHfA2u
         7HbtP2eMzQXDGAZ7q3RMuooOUMr5c09oHpijyjmFVFqIzVcrunOAeIT8sPKAX/32uWqz
         nPGA==
X-Forwarded-Encrypted: i=1; AJvYcCXYRj35TOG59o9xLxsi3B8OMhP3/vVZIu15KATAmuXMkOYiE0gSvYxPjma0pRhRwg/4P2i1COQCFSF2YSDpkDeTxVdkrUvcSR5pTThLdGSzvpQkQKqGjTT7vTBmozyYGn6ulWeXNKsg632Le5yhlEcGszD12Z/811O/XMDEwcAFeEyATOJ2HIh8BApDoJ5cY7HZGbf28U4=
X-Gm-Message-State: AOJu0YxPcwl8s4VGFukdX5sNTd06K2JFQiVqp56+bK2DNstYKzomI947
	B3C3MSjL746aA6dTJ9hFR5MvE5/Kn9UKpz0pfDwiTvO+ACCdHsBi
X-Google-Smtp-Source: AGHT+IFk4ZkCa0R/m44omA2Xi3MhoAzI8tKPY8V0cTU/2axm4inHWuZNW2UcVx0PzaNks2ZutoR+ew==
X-Received: by 2002:a05:6512:716:b0:511:8b40:ab6b with SMTP id b22-20020a056512071600b005118b40ab6bmr2834631lfs.50.1708082618024;
        Fri, 16 Feb 2024 03:23:38 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906561700b00a3d828c54f1sm1459386ejq.135.2024.02.16.03.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:23:37 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:23:36 +0100
Message-Id: <CZ6GR5BWC80N.36XRBM33WF8MW@gmail.com>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>, "Peng Fan" <peng.fan@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, "NXP Linux Team"
 <linux-imx@nxp.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_032340_451953_1D2D3FE7 
X-CRM114-Status: UNSURE (   5.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1327275599112518665=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============1327275599112518665==
Content-Type: multipart/signed;
 boundary=87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 8, 2024 at 5:37 PM CET, Krzysztof Kozlowski wrote:
[...]
>  drivers/clk/tegra/clk-bpmp.c                  |  2 +-
>  drivers/clk/tegra/clk-tegra124.c              |  2 +-
>  drivers/clk/tegra/clk-tegra20.c               |  2 +-
>  drivers/clk/tegra/clk-tegra30.c               |  2 +-
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPRbkACgkQ3SOs138+
s6FzcQ/9F5fJyakwkqSmFCFsFTUwQ0Vv6AmJP7kf0C2oOGiJISmgaFwRE7ikl73f
tfJ/jetoF3grVZE950B1ZtY1sAK6WLfAlRnkD52YE25Y+NcehSPfcE2403gBL/JZ
6Rtlw4U/jJhHC7k1NNSCV6W3YM9tFJZzPdOwWL1efc33DWZQkTgvIPKSfqGIHd0i
iclZTsusANQThdL9ASOlvq81RrglhXgo2PIt/oeGjEBtf+IoDVhHSWqJ65e/lmYV
cBw1uhHa5zHLiWoT4xTqJY8dPkSLfBSRM3uflLUkA5BRNllvVsHAPvIgR6aBpqi5
KeLdZEDFeIuIi8nqtYxhhnGa8nKz9t03MNj9GbFf9HYocIVDIV4SvKuKongDjcYZ
zr5jC3lMZnmuQIM5XOIFu8hQWG0zQ6H+Kuf6ifolHj13E5gplCo4BoZWNnE84OZ8
fMjNHraK6RNUUqJXW43OBEjejW+FvvZIpMvyyt8TcE/I7hieXCjib0Spu2n5SwvK
mQgKxPJpsOpCxIOID89cK2VwOX3uOZslT3M5sU9ZkoUcwRpQ/Ntfr7ZWW8Jy/L4Y
DWnk7IvOvI4fFlmRQONIeWpr8euHFmCL8L8dJ29AI9oB2lvs7ZovvWw9QTE8E6iU
EjVBwtdG6KqWJxP803h8DAvvD0Vsu0KzQFr+Pwre3NP2FHYDCR0=
=E0uq
-----END PGP SIGNATURE-----

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5--


--===============1327275599112518665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1327275599112518665==--

