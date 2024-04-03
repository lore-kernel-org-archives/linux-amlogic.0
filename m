Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B5BCD1288
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2F3Wb9tAwk+oxMWD4g+II9LUsqVocB6iZMniECGnNAE=; b=qq3mWTtiURf7vS
	LLDnkA58AdneIzhQKVGuqSP831265ucbnkAS3oO+ZmK/xbrxGhc8CDN3I1wjHrUKRvmSvdfDu/L5d
	XlcNRC8cI6VnoFOA4MHjG8dRlOLb9rmOoRfzofLE6/ozzCPrL2FIZmvTf90ZBtTofzZ6lPAjW/QGl
	lsNWAho3ZJb5wvv8fxCEiLmQaftd/ic7ERBk6IoQKbf7QqjzxqBAw2QLMneY6J4/zg4RTa2Feisl1
	Tw/n6pyTuTWmKyl9Sfj0JSxnm1PB7ejmsQ7MI3rGJhLX2O3GqcXhy/LRoVpTOEJtmFNQBGX+GkyJR
	o9kBHumiUPuhozowiF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7vN-00000000Crj-0UrH;
	Wed, 03 Apr 2024 21:13:37 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7vI-00000000Cp0-1Uyx
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Apr 2024 21:13:34 +0000
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 0290e41f-f1ff-11ee-a9de-005056bdf889;
	Thu, 04 Apr 2024 00:13:28 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Apr 2024 00:13:25 +0300
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Li Zetao <lizetao1@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 31/34] spi: remove incorrect of_match_ptr annotations
Message-ID: <Zg3GdUtBUKzB6NNZ@surfacebook.localdomain>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-32-arnd@kernel.org>
 <b4418ac1-10ba-4932-be6e-93282707024f@sirena.org.uk>
 <5f3qvhasho4mfnf6f7i6djak3ankje375mt4fzvv3gqrlj242o@zdk2ajvha6hx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f3qvhasho4mfnf6f7i6djak3ankje375mt4fzvv3gqrlj242o@zdk2ajvha6hx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_141332_675207_B230CFD8 
X-CRM114-Status: GOOD (  23.57  )
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

Wed, Apr 03, 2024 at 11:05:51PM +0200, Uwe Kleine-K=F6nig kirjoitti:
> On Wed, Apr 03, 2024 at 10:56:58AM +0100, Mark Brown wrote:
> > On Wed, Apr 03, 2024 at 10:06:49AM +0200, Arnd Bergmann wrote:
> > =

> > > These appear to all be copied from the same original driver, so fix t=
hem at the
> > > same time by removing the unnecessary of_match_ptr() annotation. As f=
ar as I
> > > can tell, all these drivers are only actually used on configurations =
that
> > > have CONFIG_OF enabled.
> > =

> > Why are we not fixing of_match_ptr() here, or at least adding the ifdefs
> > in case someone does end up wanting to run without OF?
> =

> Fixing of_match_ptr =3D
> =

> diff --git a/include/linux/of.h b/include/linux/of.h
> index a0bedd038a05..d980bccffda0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -890,7 +890,7 @@ static inline const void *of_device_get_match_data(co=
nst struct device *dev)
>  	return NULL;
>  }
>  =

> -#define of_match_ptr(_ptr)	NULL
> +#define of_match_ptr(_ptr)	(0 ? (_ptr) : NULL)

FWIW, we have PTR_IF() (with a side note to split it from kernel.h in a
separate header or less twisted one).

>  #define of_match_node(_matches, _node)	NULL
>  #endif /* CONFIG_OF */
>  =

> ?
> =

> Assuming this helps, I agree this would be the better fix.

Why? I mean why do we need to even have this API? It's always
good to know which devices are supported by the module even
if you have no need in such support or it's not compiled in.
One of the reasons why is to be able to google for compatible hardware,
for example.

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
