Return-Path: <SRS0=zJz3=CA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B00C433E1
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2020 10:41:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2782206BE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2020 10:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfHIoXt2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="epuCfRXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2782206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ci4dkmiSxCOLovnyB0GRdHqKEQEyKkx81suyNVbFLM=; b=UfHIoXt2M/Xu7mPQToiLko4w/
	RGdagsCY1Ceu6wDOrOhgkSJDBFg1CbtFkdnHtZ91SIhvMcOqAG21ewRHBWoHUUP5rQMsinKnnUTyx
	NrB/ruIdCokaLReEgA0JddnaUXLCYgok3CvnDYYPS8RhyhRr5LwZ38dyzxj7hRLlgz08YlF0L3UDZ
	/ND8bcl7a5KfVe4IyiEacavcnvv1o8FJD8J2MoL87P3zCN5YOX+dcOt7Qyr75MjYH6FH67wZSZZcn
	AvXUdeNoshbz5CDr2gOxb2dmOtgi7hSzWepZV4Qz+VLSq6QR55AcRFre6aGm7NI7CBO9LygHG7zwm
	PNIkJW0Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Qx8-0001JJ-6y; Sat, 22 Aug 2020 10:40:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Qx5-0001Iw-ME; Sat, 22 Aug 2020 10:40:48 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2408206BE;
 Sat, 22 Aug 2020 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598092846;
 bh=cEGdT8XAvc9Giu0jlhAu2qtpm1zG83Ohouivsv6T9bs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=epuCfRXIEATNcPOoOjtwWgFLWUB00N88Km1/PhnQpIKAjAsVqGOjb8SZXn6KvNsMb
 kLfxL5VxQYDwJRoeOVz1/g9vUzxC2k9IDgJHfNJ1ltZHzjBtkwFE5v4xxCY3nDhXRl
 rMjSqXVIF/FTAWHZBFwftKoYhOXfHJMEuoMDHIkc=
Date: Sat, 22 Aug 2020 11:40:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH for-5.9] iio: adc: meson-saradc: Use the parent device
 to look up the calib data
Message-ID: <20200822114036.49199bff@archlinux>
In-Reply-To: <20200815181355.407034-1-martin.blumenstingl@googlemail.com>
References: <20200815181355.407034-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_064047_799616_C61E1958 
X-CRM114-Status: GOOD (  22.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 knaack.h@gmx.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 15 Aug 2020 20:13:55 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On the older-gen 32-bit SoCs the meson-saradc driver is used to read the
> SoC temperature. This requires reading calibration data from the eFuse.
> 
> Looking up the calibration data nvmem-cell requires the OF device_node
> pointer to be available in the struct device which is passed to
> devm_nvmem_cell_get(). This however got lost with commit 8cb631ccbb1952
> ("iio: Remove superfluous of_node assignments") from indio_dev->dev. As
> devm_nvmem_cell_get() is called in the initialization phase the
> device_node is not yet available because the NVMEM cell is looked up
> before iio_device_register() is called (which would then set the
> device_node automatically).
> Use the parent device to look up the NVMEM cell instead to fix this
> issue.
> 
> Fixes: 8cb631ccbb1952 ("iio: Remove superfluous of_node assignments")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Gah.  I hope we don't have too many more non obvious cases like
this hiding.

Applied to the fixes-togreg branch of iio.git

Thanks,

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 93c2252c0b89..1a9189ba69ae 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -707,7 +707,7 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  	size_t read_len;
>  	int ret;
>  
> -	temperature_calib = devm_nvmem_cell_get(&indio_dev->dev,
> +	temperature_calib = devm_nvmem_cell_get(indio_dev->dev.parent,
>  						"temperature_calib");
>  	if (IS_ERR(temperature_calib)) {
>  		ret = PTR_ERR(temperature_calib);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
