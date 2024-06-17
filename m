Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EAAC2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6Os9uhCNVroBrcFW0kwXxcflZn9jHGoHm/5HjU9kMw=; b=IPbpUqctciWP+M
	TfWMNHsY7WE7Aoy6qJmtRDJ3MrOMc+crTs7ALHrFkttxPbJHO+WdhMryIEseO05/WbOaX2I0jHJLT
	E9lXTHe9q83UKhIUzf9kATJmul7cWiFwYy2LHp0bOcjdjCxJfGWsrKpPXps8QpVVNA42Nxojtoo2u
	pVifMvS3pmQo5RjCIBGVlZJQyd++G9S10aeCTIsU9csJnC31769bWe3RyNG7jbyjfaqcEVsSW6AUk
	Q/bCnOwihgWywqLznO7pQNZ3MD2k1Os/DBlSkCnLWwSn3fs7Z+IcFeExSBqEJBq413+z4aLhEnGlu
	2U89W+eAPaKHC/Is3Utg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEzf-0000000BgBl-3zey;
	Mon, 17 Jun 2024 16:14:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEzc-0000000BgAA-2tCP;
	Mon, 17 Jun 2024 16:14:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W2vzZ4Ym4z67FbS;
	Tue, 18 Jun 2024 00:12:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id A93C6140A90;
	Tue, 18 Jun 2024 00:13:55 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 17 Jun
 2024 17:13:54 +0100
Date: Mon, 17 Jun 2024 17:13:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, "Michael Hennerich"
	<Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	"Jerome Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	<nuno.sa@analog.com>, Linus Walleij <linus.walleij@linaro.org>, Jean-Baptiste
 Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6n?=
 =?ISO-8859-1?Q?ig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 22/41] iio: gyro: mpu3050-core: make use of
 regmap_clear_bits(), regmap_set_bits()
Message-ID: <20240617171353.00006b1f@Huawei.com>
In-Reply-To: <20240617-review-v3-22-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	<20240617-review-v3-22-88d1338c4cca@baylibre.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_091405_092818_6A86CEC8 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, 17 Jun 2024 09:50:02 -0400
Trevor Gamblin <tgamblin@baylibre.com> wrote:

> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
> =

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
> =

> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  drivers/iio/gyro/mpu3050-core.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> =

> diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-c=
ore.c
> index a791ba3a693a..ff1c81553045 100644
> --- a/drivers/iio/gyro/mpu3050-core.c
> +++ b/drivers/iio/gyro/mpu3050-core.c
> @@ -197,8 +197,8 @@ static int mpu3050_start_sampling(struct mpu3050 *mpu=
3050)
>  	int i;
>  =

>  	/* Reset */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_RESET, MPU3050_PWR_MGM_RESET);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_RESET);
>  	if (ret)
>  		return ret;
>  =

> @@ -513,12 +513,8 @@ static irqreturn_t mpu3050_trigger_handler(int irq, =
void *p)
>  				 "FIFO overflow! Emptying and resetting FIFO\n");
>  			fifo_overflow =3D true;
>  			/* Reset and enable the FIFO */
> -			ret =3D regmap_update_bits(mpu3050->map,
> -						 MPU3050_USR_CTRL,
> -						 MPU3050_USR_CTRL_FIFO_EN |
> -						 MPU3050_USR_CTRL_FIFO_RST,
> -						 MPU3050_USR_CTRL_FIFO_EN |
> -						 MPU3050_USR_CTRL_FIFO_RST);
> +			ret =3D regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
> +					      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);

I'll probably break this line up whilst applying.

>  			if (ret) {
>  				dev_info(mpu3050->dev, "error resetting FIFO\n");
>  				goto out_trigger_unlock;
> @@ -799,10 +795,8 @@ static int mpu3050_hw_init(struct mpu3050 *mpu3050)
>  	u64 otp;
>  =

>  	/* Reset */
> -	ret =3D regmap_update_bits(mpu3050->map,
> -				 MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_RESET,
> -				 MPU3050_PWR_MGM_RESET);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_RESET);
>  	if (ret)
>  		return ret;
>  =

> @@ -872,8 +866,8 @@ static int mpu3050_power_up(struct mpu3050 *mpu3050)
>  	msleep(200);
>  =

>  	/* Take device out of sleep mode */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_SLEEP, 0);
> +	ret =3D regmap_clear_bits(mpu3050->map, MPU3050_PWR_MGM,
> +				MPU3050_PWR_MGM_SLEEP);
>  	if (ret) {
>  		regulator_bulk_disable(ARRAY_SIZE(mpu3050->regs), mpu3050->regs);
>  		dev_err(mpu3050->dev, "error setting power mode\n");
> @@ -895,8 +889,8 @@ static int mpu3050_power_down(struct mpu3050 *mpu3050)
>  	 * then we would be wasting power unless we go to sleep mode
>  	 * first.
>  	 */
> -	ret =3D regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
> -				 MPU3050_PWR_MGM_SLEEP, MPU3050_PWR_MGM_SLEEP);
> +	ret =3D regmap_set_bits(mpu3050->map, MPU3050_PWR_MGM,
> +			      MPU3050_PWR_MGM_SLEEP);
>  	if (ret)
>  		dev_err(mpu3050->dev, "error putting to sleep\n");
>  =

> @@ -997,11 +991,8 @@ static int mpu3050_drdy_trigger_set_state(struct iio=
_trigger *trig,
>  			return ret;
>  =

>  		/* Reset and enable the FIFO */
> -		ret =3D regmap_update_bits(mpu3050->map, MPU3050_USR_CTRL,
> -					 MPU3050_USR_CTRL_FIFO_EN |
> -					 MPU3050_USR_CTRL_FIFO_RST,
> -					 MPU3050_USR_CTRL_FIFO_EN |
> -					 MPU3050_USR_CTRL_FIFO_RST);
> +		ret =3D regmap_set_bits(mpu3050->map, MPU3050_USR_CTRL,
> +				      MPU3050_USR_CTRL_FIFO_EN | MPU3050_USR_CTRL_FIFO_RST);
and this one.

Assuming we don't need a v4 for some other reason,

Jonathan

>  		if (ret)
>  			return ret;
>  =

> =



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
