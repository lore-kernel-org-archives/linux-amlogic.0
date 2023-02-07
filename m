Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B44FC636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKzsR4aaXbmMkVjyffLrdw6GVvHAoE5hOLudtyhCGW4=; b=LMQXKHsO780UjdEDWl94BVChvU
	JL8jq8Catz1BJtPJ11G9WxD/1usrkzJSzfqL8/5ORTtFFF92azQgbADN1B0aK/P/Z05WWP5L/zkSg
	COVW86aXiwBUaUN86ptbSKVSWyi4gFmavTUN42oe9MseJPJLgMtbGfykYNMgjex98VWBwFdsM4Z9y
	l5FNABPP2XkRW7Gczo9aFV2TRfbAy4m6rIj2XCKUEhWqNngxzLhpVWHlAucpKl1YKQWoOL/XyadcN
	ZfLe6zKJBLqB7V56dwVEcTLEmbpmJR6s8lrWKUQzNA1aVuF4ZXDuqk0aFskSZbH9a+ZL0D4U6VoNe
	trVz8CYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMJR-00C03g-EQ; Tue, 07 Feb 2023 11:39:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMJP-00C02Z-H3; Tue, 07 Feb 2023 11:39:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ml19so42576923ejb.0;
        Tue, 07 Feb 2023 03:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypYaAIHbgwskXP956yUIa5G6SVK0QZ0JGeu03YaQuLg=;
        b=j50wXizpSCgbltXPzxLm6o6EgUCwunOa3gUhOObCfsxS5zVmzaK1bbvvNUqvbd5N59
         s38vLv0Ysjzb1iVZ1HiJGnplkCzTNqrii67ZhGZXcM6Nm93vBAaQpk0h4FApJ7wqBa7u
         z1jm04ciGE4gBk8tYyYecFTbO6F4uEiBi5Tw5VGhyW22YPsF64IrPcOj1SWTrQ1HmnaR
         f1ZNfG5UyLxIsSMw97PSgxOcFcN3yaX6IUcuonLpJGDzhifWcbo3vsJl4sdNKHkP4cqW
         e+BPGiI5s6QzdCrSLCvvb05XtqKa5znj4Ell/XC4ul+ptUNQ8iQMRC0qxgFDioXRQMOq
         8B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypYaAIHbgwskXP956yUIa5G6SVK0QZ0JGeu03YaQuLg=;
        b=oE8Mkt1ijyP+XZm5Ga/yQXPqBadM0fTRdfPXZFDD2AAkI/gF6xCRUh8fJxYYLpKgkZ
         Tz/MIckvyYGbKYQJEz//ePqtpzn7yCDYnV+gfYwCi4B7ElSUYcnq/Dk+B0mdPG4Ypd6o
         klvuKKYxv6GsefHl4sj69FnHpn43X30bxs6p7TAbkqE3itlgvbto5fhfzp/Z+BvLhz5k
         6t8MI2ejGIUhG+hMW0cMfi4t7gBlCcRVHivckHbyAm+2vZemX/Gja1W68c8tOjFBn3ft
         +wUzpBy7GY8hVXTsE/27wqOAGMsW0RCYKLc2hkKCnldcJBERvj81sM9xSwwy4hV9wRpE
         R3aA==
X-Gm-Message-State: AO0yUKXX8si/4S3yTZeHp78UWohzn/UbNwhySLVF3rH7iAGiXmhxXtR8
	suuaiZUPbaSilArfAWFrVU0=
X-Google-Smtp-Source: AK7set9xPPTA4AVcwID7+M8jKZFboG1ezV/PnXsBHNVtCAEcRQMGr+q/tXVvH0nFPyJttT+0/8a26A==
X-Received: by 2002:a17:906:2556:b0:8aa:1eb2:a806 with SMTP id j22-20020a170906255600b008aa1eb2a806mr1043783ejb.74.1675769934798;
        Tue, 07 Feb 2023 03:38:54 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m18-20020a056402511200b004a22ed9030csm6293794edd.56.2023.02.07.03.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 03:38:54 -0800 (PST)
Date: Tue, 7 Feb 2023 12:38:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Haowen Bai <baihaowen@meizu.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Message-ID: <Y+I4S7Xt4gKDYLkw@orome>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_033859_603645_9D4CB8B8 
X-CRM114-Status: GOOD (  20.09  )
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
Content-Type: multipart/mixed; boundary="===============4399442834650059444=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4399442834650059444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6YmCx3uIqlMso1fF"
Content-Disposition: inline


--6YmCx3uIqlMso1fF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
>=20
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
>=20
> Remove this inclusion in every place where it is possible.
>=20
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
>=20
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
>=20
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
>=20
> No functional changes
>=20
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/amlogic_thermal.c           | 1 -
>  drivers/thermal/armada_thermal.c            | 2 --
>  drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -
>  drivers/thermal/hisi_thermal.c              | 3 +--
>  drivers/thermal/imx8mm_thermal.c            | 1 -
>  drivers/thermal/imx_sc_thermal.c            | 1 -
>  drivers/thermal/intel/intel_hfi.c           | 3 ++-
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
>  drivers/thermal/qoriq_thermal.c             | 1 -
>  drivers/thermal/rcar_gen3_thermal.c         | 1 -
>  drivers/thermal/samsung/exynos_tmu.c        | 3 +--
>  drivers/thermal/st/stm_thermal.c            | 1 -
>  drivers/thermal/tegra/tegra30-tsensor.c     | 1 -
>  drivers/thermal/uniphier_thermal.c          | 2 --
>  14 files changed, 4 insertions(+), 18 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--6YmCx3uIqlMso1fF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPiOEsACgkQ3SOs138+
s6GcZg//R3MQVqmdDfUAH1wSX/RKBdIAW3IEegenVrucDauuJHfqOD6w9PZ1mhvo
7sffnxqIcqDT4K1UrFfVoSEsDYYKTB/RbwaiHjr2bGR7DJbLe7diXmw2XZWJZ+gT
Oyw8I6tyWR9ixwcfP5d03Vgi5h4QHSNvlAagPwCIMoYXlC8yMeK5stM5DR2pZCRJ
ZtpT71OQa0iUf9/MP61cm1EZco7cUSbPP79b+0gkGCaEM+N9h5VRSK4wZWyDe2ED
lRwO36ATMnOzHN27cZvYLXEsGiWRLvtSwunIfOkBW2GFf3/t0KJfLNTIIzBYyYv5
7YWQWv2PWY7A2dx0DDskAmo3n+34qouc7lGd+pCJeoPASpEXbCRK5kXvVEVMcMW/
fuxqLlsBpZoNLlxmMCL7LaN0xTTK5aAI930kxr1vJXlYfwvHsXN5YUBi9f+nP3lv
k4LY4P/jgZGDJQMcjL6ysfHJ11S9yc+6mAv9D+Zd6X5sn+DitvYUbq7oH1Vid5oU
nvu13INcwRMa/Q++f6+DOv//64fPIeZctFcq1oQr8tevgECDeJ7qy4ZTPplIcLnU
cGEHqcomIPOkFfvAxYETborXcePZSFKpuYOzecg6YEhcZCtkYLcdiFuw9PoM8Kqn
CYbQQDs1EKfpKznrlpqOIiaZ1PknWjl2zK4ey9b+APu0KE5eghc=
=Zn7P
-----END PGP SIGNATURE-----

--6YmCx3uIqlMso1fF--


--===============4399442834650059444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4399442834650059444==--

