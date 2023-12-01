Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00391C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Dec 2023 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srtW8ATJ8I1R2NGWsHiPpwOcznvhFEU1EcOIYrxklU8=; b=jo7dJmy+n5vbo8
	psaZtVr2M+tnZlzvdqe4oU47wfuLdasXnJl6JqIraN6rbKnWgoJoWx+zdB4vmLGLp88k78UnD7+ym
	NzOzj7AcdOCZBVmfuNiQb7N10ycLz6oW/B4Hj37wQkESfuM7jNLQShSia4DKoOJ5W6N+21WwgW95f
	r7i4PxbzGbtVl3gTMbDokGmXjm7OmHKBYTz2ujCjOk09gIsyiObT/ia32NqmBiCYrPGoYOKsc9pto
	AtbulD7CGV4RWuxG1/V1dAzzGDTD3C7scK0JK/ENiOqgpr0OCubZwyZPoQC9EdNagsSwQ/2tdc2vS
	LiXM0MbJOYgnr0MoqXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r97wE-00EOej-0V;
	Fri, 01 Dec 2023 18:08:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r97wA-00EOdZ-2F;
	Fri, 01 Dec 2023 18:08:29 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ShgyW1Yp3z6J9rV;
	Sat,  2 Dec 2023 02:07:47 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 168131401E0;
	Sat,  2 Dec 2023 02:08:13 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Dec
 2023 18:08:12 +0000
Date: Fri, 1 Dec 2023 18:08:11 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: George Stark <gnstark@salutedevices.com>
CC: Jonathan Cameron <jic23@kernel.org>, <lars@metafoo.de>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <u.kleine-koenig@pengutronix.de>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@salutedevices.com>
Subject: Re: [PATCH v2 1/1] iio: adc: meson: add separate config for axg SoC
 family
Message-ID: <20231201180811.00002783@Huawei.com>
In-Reply-To: <ca18c346-94f3-4c4c-a540-57509b879b04@salutedevices.com>
References: <20231122074741.154228-1-gnstark@salutedevices.com>
	<20231125172508.2a2242bf@jic23-huawei>
	<ca18c346-94f3-4c4c-a540-57509b879b04@salutedevices.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_100827_039846_BD851E4A 
X-CRM114-Status: GOOD (  22.30  )
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

On Mon, 27 Nov 2023 22:17:33 +0300
George Stark <gnstark@salutedevices.com> wrote:

> Hello Jonathan
> 
> Thanks for the review.
> 
> On 11/25/23 20:25, Jonathan Cameron wrote:
> > On Wed, 22 Nov 2023 10:47:41 +0300
> > George Stark <gnstark@salutedevices.com> wrote:
> >   
> >> According to Amlogic custom kernels ADC of axg SoC family has
> >> vref_select and requires this setting to work nominally and thus
> >> needs a separate config.
> >>
> >> Signed-off-by: George Stark <gnstark@salutedevices.com>
> >> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>  
> > 
> > Is this a fix?  If so, please provide a fixes tag.  
> Actually yes, these changes could be done in the patch that introduced
> new configuration parameters.
> 
> > Or is it aligning with the vendor kernels and we don't know if
> > it's strictly necessary or not?  
> I do know it's necessary if we want kernel driver to be independent from 
> ADC initialization in vendor u-boot code. I have Amlogic a113x device 
> (axg family) and can provide test results w and w/o this patch.

Definitely best to not rely on firmware. 

So send a Fixes tag for this and I'll apply it as a fix
(you get to figure out which patch it fixed :)

Jonathan

> 
> >   
> >> ---
> >>   drivers/iio/adc/meson_saradc.c | 16 +++++++++++++++-
> >>   1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> >> index db280da9edbf..34555a85f131 100644
> >> --- a/drivers/iio/adc/meson_saradc.c
> >> +++ b/drivers/iio/adc/meson_saradc.c
> >> @@ -1242,6 +1242,20 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
> >>   	.cmv_select = 1,
> >>   };
> >>   
> >> +static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
> >> +	.has_bl30_integration = true,
> >> +	.clock_rate = 1200000,
> >> +	.bandgap_reg = MESON_SAR_ADC_REG11,
> >> +	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
> >> +	.resolution = 12,
> >> +	.disable_ring_counter = 1,
> >> +	.has_reg11 = true,
> >> +	.vref_volatge = 1,
> >> +	.has_vref_select = true,
> >> +	.vref_select = VREF_VDDA,
> >> +	.cmv_select = 1,
> >> +};
> >> +
> >>   static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
> >>   	.has_bl30_integration = false,
> >>   	.clock_rate = 1200000,
> >> @@ -1286,7 +1300,7 @@ static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
> >>   };
> >>   
> >>   static const struct meson_sar_adc_data meson_sar_adc_axg_data = {
> >> -	.param = &meson_sar_adc_gxl_param,
> >> +	.param = &meson_sar_adc_axg_param,
> >>   	.name = "meson-axg-saradc",
> >>   };
> >>     
> >   
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
