Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1544DC4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Oct 2022 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgYlr8emUFQu0RkRmE8zc0HUxVtaDhF0cK0KYkU7sf0=; b=KgYX1erB4cfIA7
	GbDD94YqJSr9xO67LYmTmOA02n4AVD65PZmFJjQ5cr+OxcvVmNu6zxcdlIsKtKssq7BbMc9ZW7H0j
	EwxvlNs5FQ7Psk6abto5kgCxR/ttjbSfFTYADg5p1S3CcyHEdvo6VObD450pBQWoLqxQ/3BO37wUE
	2HIyQLJ3CoS5LOz34HcgjX29IXFOsOL3FJn/JvMndauY7VE5M3AIv6Itp6Zat+YUd8TdwsqPT8awI
	giKPkAa1hX+1tN0j011MJngr9aS7ffzkNyuvAWUikinjHOAWBtyx6u016l9f1esxJ5Z3j+2EBfpjN
	ZxLm5BWBQU/VHcYos6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okqXG-009TF6-2Q; Tue, 18 Oct 2022 17:37:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okQE8-00C7cP-Ff; Mon, 17 Oct 2022 13:32:22 +0000
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MrdB34gj5z686tl;
	Mon, 17 Oct 2022 21:28:59 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Mon, 17 Oct 2022 15:32:04 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 14:32:03 +0100
Date: Mon, 17 Oct 2022 14:32:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: <broonie@kernel.org>, <sanju.mehta@amd.com>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <kdasu.kdev@gmail.com>,
	<f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
	<eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
	<john.garry@huawei.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<narmstrong@baylibre.com>, <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
	<haibo.chen@nxp.com>, <linus.walleij@linaro.org>, <daniel@zonque.org>,
	<haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, <agross@kernel.org>,
	<bjorn.andersson@linaro.org>, <heiko@sntech.de>,
	<krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <git@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<radu_nicolae.pirea@upb.ro>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<yogeshgaur.83@gmail.com>, <konrad.dybcio@somainline.org>,
	<alim.akhtar@samsung.com>, <ldewangan@nvidia.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <michal.simek@amd.com>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-wpan@vger.kernel.org>, <libertas-dev@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<lars@metafoo.de>, <Michael.Hennerich@analog.com>,
	<linux-iio@vger.kernel.org>, <michael@walle.cc>, <akumarma@amd.com>,
	<amitrkcian2002@gmail.com>
Subject: Re: [PATCH 05/10] iio: imu: Replace spi->chip_select references to
 spi->chip_select[0]
Message-ID: <20221017143202.00003b1d@huawei.com>
In-Reply-To: <20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
	<20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_063220_856167_18727AD4 
X-CRM114-Status: GOOD (  12.29  )
X-Mailman-Approved-At: Tue, 18 Oct 2022 10:37:44 -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 17 Oct 2022 17:42:44 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> For adding multi CS support & to prevent any existing driver from
> breaking, replaced all spi->chip_select references to spi->chip_slect[0].
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Hmm. No particular reason why that print should exist at all.
The warning above it covers the case where there is a mismatch
in IDs so this adds nothing useful.

So patch is fine, but I'd be equally happy with just dropping the
print.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/imu/adis16400.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
> index 17bb0c40a149..aa7bfcee3510 100644
> --- a/drivers/iio/imu/adis16400.c
> +++ b/drivers/iio/imu/adis16400.c
> @@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
>  
>  		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
>  			indio_dev->name, prod_id,
> -			st->adis.spi->chip_select, st->adis.spi->irq);
> +			st->adis.spi->chip_select[0], st->adis.spi->irq);
>  	}
>  	/* use high spi speed if possible */
>  	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
