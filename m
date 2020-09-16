Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCFAC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 18:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF3D21D43
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 18:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lg5pQ2Bl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="weYbHppD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF3D21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PeonMRD4Ys8LmaBdI+HvC/kOhnPrnTgpQCmcF1is9l0=; b=Lg5pQ2BlxJGmkInrDC3XXRbRv
	aG+SKFSN5J4nLH/fonCOJvivcb9xlAJuIBUV9Aq0rX3GVL/DcpncHAYvS+ibxdIxcEIU8O7qn6fSi
	TumIV0w4Y9AP/eEbLYNZPZbvft5Rdsv8+2Dq76HRwDybZuP6TTrsk8PR2gpIMlRjOpz+XsC2PM6Ww
	OgJk+qfU0QTEERTxneTzZh6g/DDWBEFu6P3Ig8fYNrIyfHC8iRy+lCDhrLZNUwNfyUlOjxm82Fqe4
	IoKI4Xm6Uh4fM4kNCSCtHPqm3suPeghIenXaooumqNa3I5QUqgji0Pwl1czTjRN00xtGsE0BVJVY5
	sI1y3K/NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIc0M-0007pv-5v; Wed, 16 Sep 2020 18:18:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIc0K-0007pU-2I; Wed, 16 Sep 2020 18:18:04 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E45821655;
 Wed, 16 Sep 2020 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600280282;
 bh=RYA2LrqTsqrb7hEDg4AHEnfPPnO9ZBUXZ0TGxhqVARc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=weYbHppDCrwYigvxNzFvcXpvJJT9ohm168FMXhRF34I2B0QXIuLTU78BOBxx0ctSz
 0XPZ17WLiS/WQeeIr/AtQoMWi/n66lqxwbUmRR/xpOsJtp3llOJEqb8t/ufX2G/WgK
 t2hIYQEN6FC8J4NJYlB5rFylTFXC4VhFPv02H0FA=
Date: Wed, 16 Sep 2020 19:17:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: Make the of_device_id array
 style consistent
Message-ID: <20200916191756.6f53853a@archlinux>
In-Reply-To: <20200915192621.13202-1-martin.blumenstingl@googlemail.com>
References: <20200915192621.13202-1-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_141804_247079_F3C0A12E 
X-CRM114-Status: GOOD (  19.78  )
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
 pmeerw@pmeerw.net, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 21:26:21 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Use only one line for the closing bracket of the last entry and the
> opening bracket for the next one to keep the style across the whole
> array consistent. Also add a "sentinel" comment to the last entry and
> remove the comma to ensure that there won't be any entry after it.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied,

Thanks,

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 95bd187de1cb..e03988698755 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1150,16 +1150,13 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
>  	{
>  		.compatible = "amlogic,meson8-saradc",
>  		.data = &meson_sar_adc_meson8_data,
> -	},
> -	{
> +	}, {
>  		.compatible = "amlogic,meson8b-saradc",
>  		.data = &meson_sar_adc_meson8b_data,
> -	},
> -	{
> +	}, {
>  		.compatible = "amlogic,meson8m2-saradc",
>  		.data = &meson_sar_adc_meson8m2_data,
> -	},
> -	{
> +	}, {
>  		.compatible = "amlogic,meson-gxbb-saradc",
>  		.data = &meson_sar_adc_gxbb_data,
>  	}, {
> @@ -1175,7 +1172,7 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
>  		.compatible = "amlogic,meson-g12a-saradc",
>  		.data = &meson_sar_adc_g12a_data,
>  	},
> -	{},
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, meson_sar_adc_of_match);
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
