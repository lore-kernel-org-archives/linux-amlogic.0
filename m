Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8552CC32771
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:32:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544BF2067D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FB9/YLzY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 544BF2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVzomMPtJzR5yHzbz5VN+EWZQXc6nx24bSYHLFg2M2M=; b=FB9/YLzYbMtdlA
	lbYHnK598LaWmIimoJwBG9ga97Vt2J+YXoPDIhp9oIV7FCuxC8tdqsQYw31yUbUfuYS9tN8JbVpdp
	rFQ6YP6fsLBhSU14IUN6l6B292z1ICngrV1Gf2qMt9gutuhLIbQEaW2Q4hGV1oUR0xW1qiI+1TtkL
	sHafACjOiWZVwKcCiEvNeMlP9etdUrBJReihlxHkToy3oG6Rbmn7kbDRNf/FPSIlVbTwxkCCXSvFE
	pp5GwHcTRx2Q52PsLyfGCq7wNCDcl3xqBi6kThl1aBfKOUgn/nQur2JKq+1PDO+vPR+JiZ0W4sXKD
	+tZ9CM1Kl5RukbStUdxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipW2h-0007mS-Af; Thu, 09 Jan 2020 11:31:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipW2a-0007em-IQ; Thu, 09 Jan 2020 11:31:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE3CF31B;
 Thu,  9 Jan 2020 03:31:51 -0800 (PST)
Received: from [10.1.194.52] (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85AD23F703;
 Thu,  9 Jan 2020 03:31:50 -0800 (PST)
Subject: Re: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator
 for control again
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 tomeu.vizoso@collabora.com, robh@kernel.org
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
Date: Thu, 9 Jan 2020 11:31:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_033152_690502_9C9DD596 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: airlied@linux.ie, linux-rockchip@lists.infradead.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/01/2020 23:06, Martin Blumenstingl wrote:
> dev_pm_opp_set_rate() needs a reference to the regulator which should be
> updated when updating the GPU frequency. The name of the regulator has
> to be passed at initialization-time using dev_pm_opp_set_regulators().
> Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
> will update the GPU regulator when updating the frequency (just like
> we did this manually before when we open-coded dev_pm_opp_set_rate()).

This patch causes a warning from debugfs on my firefly (RK3288) board:

debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
present!

So it looks like the regulator is being added twice - but I haven't
investigated further.

> Fixes: 221bc77914cbcc ("drm/panfrost: Use generic code for devfreq")
> Reported-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 22 ++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 170f6c8c9651..4f7999c7b44c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -74,6 +74,7 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
>  int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  {
>  	int ret;
> +	struct opp_table *opp_table;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
>  	struct device *dev = &pfdev->pdev->dev;
> @@ -84,9 +85,24 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		/* Optional, continue without devfreq */
>  		return 0;
>  
> +	opp_table = dev_pm_opp_set_regulators(dev,
> +					      (const char *[]){ "mali" },
> +					      1);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +
> +		/* Continue if the optional regulator is missing */
> +		if (ret != -ENODEV)
> +			return ret;
> +	} else {
> +		pfdev->devfreq.regulators_opp_table = opp_table;
> +	}
> +
>  	ret = dev_pm_opp_of_add_table(dev);
> -	if (ret)
> +	if (ret) {
> +		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);

If we don't have a regulator then regulators_opp_table will be NULL and
sadly dev_pm_opp_put_regulators() doesn't handle a NULL argument. The
same applies to the two below calls obviously.

Steve

>  		return ret;
> +	}
>  
>  	panfrost_devfreq_reset(pfdev);
>  
> @@ -95,6 +111,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
>  	if (IS_ERR(opp)) {
>  		dev_pm_opp_of_remove_table(dev);
> +		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
>  		return PTR_ERR(opp);
>  	}
>  
> @@ -106,6 +123,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	if (IS_ERR(devfreq)) {
>  		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
>  		dev_pm_opp_of_remove_table(dev);
> +		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
>  		return PTR_ERR(devfreq);
>  	}
>  	pfdev->devfreq.devfreq = devfreq;
> @@ -124,6 +142,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>  	if (pfdev->devfreq.cooling)
>  		devfreq_cooling_unregister(pfdev->devfreq.cooling);
>  	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> +	if (pfdev->devfreq.regulators_opp_table)
> +		dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
>  }
>  
>  void panfrost_devfreq_resume(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 06713811b92c..4878b239e301 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -85,6 +85,7 @@ struct panfrost_device {
>  
>  	struct {
>  		struct devfreq *devfreq;
> +		struct opp_table *regulators_opp_table;
>  		struct thermal_cooling_device *cooling;
>  		ktime_t busy_time;
>  		ktime_t idle_time;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
