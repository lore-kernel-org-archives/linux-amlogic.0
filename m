Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907C6C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Oct 2022 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5FCjuZU/WidxVSE9B4fxuDTxHTvgtBLq6qy1VcxiLo=; b=z8xuGuaS1F7wyH
	5EeuzeAvNg7eNT4F/g3UQchCkrcIw3me47BJsTXMxF7hNfNdoNG80HpTkWQZRYLRbsMH3/kVl9pgh
	EX7uH93vrAS/rY+dxgjhvlMkgq2btxbQ6btnSuCFMAOD26bOIzfsYB+dWCJ1E8Wb0DFRxvBUDgShF
	HQXurFNXEpbDa+TdwYMk8xwba0rt+KUF3C/MXBAj2gaCtIZvfaBsyWrH7k8sQIivcjnN3oSMaxtjn
	DnDpJ71XVGyPpysWUci5DfvIUWsevXL8dRYg2rb6nyJwd4pWk2/2wQOUuVgY9wvLkHIXIm2SBtgwe
	UPMNsio44BzY8p1EZ1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofz5L-00Ct6W-QF; Wed, 05 Oct 2022 07:44:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofz5I-00Ct52-Oq; Wed, 05 Oct 2022 07:44:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ofz55-0007td-Pd; Wed, 05 Oct 2022 09:44:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-amlogic@lists.infradead.org, linux-imx@nxp.com, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jyoti Bhayana <jbhayana@google.com>, Hans de Goede <hdegoede@redhat.com>, Andriy Tryshnivskyy <andriy.tryshnivskyy@opensynergy.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Cixi Geng <cixi.geng1@unisoc.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Ciprian Regus <ciprian.regus@analog.com>, Fabio Estevam <festevam@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alexandru Ardelean <aardelean@deviqon.com>, Florian Boor <florian.boor@kernelconcepts.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Orson Zhai <orsonzhai@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Haibo Chen <haibo.chen@nxp.com>, Kevin Hilman <khilman@baylibre.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 07/16] iio: adc: rockchip_saradc: do not use internal iio_dev lock
Date: Wed, 05 Oct 2022 09:44:37 +0200
Message-ID: <1803833.atdPhlSkOF@diego>
In-Reply-To: <20221004134909.1692021-8-nuno.sa@analog.com>
References: <20221004134909.1692021-1-nuno.sa@analog.com> <20221004134909.1692021-8-nuno.sa@analog.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_004452_822159_44F52371 
X-CRM114-Status: UNSURE (   6.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Dienstag, 4. Oktober 2022, 15:49:00 CEST schrieb Nuno S=E1:
> The iio_device lock is only meant for internal use. Hence define a
> device local lock to protect against concurrent accesses.
> =

> While at it, properly include "mutex.h" for mutex related APIs.
> =

> Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
