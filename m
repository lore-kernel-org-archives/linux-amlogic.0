Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA474C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBE32083B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RB/cEyr7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBE32083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CwdTItqtLWjKX37Zg7yMV0eJhy+c8fDaRRC2vldIOfc=; b=RB/cEyr7/pCzjSO45Oc4khW6B
	cV+5xSzMavmHvt6P52YUZ1wZnfkhq/1kLpfXskUABWmynsVESL77EkxuwwKGOOHZateLNwg3YiB84
	an/KNGI3xRWmhrknH7XHt1DOxqq9i3OMfXG/gn2g/7pH8TnQuaj2VgD3o2zWYpVKP2g/FYzhI9WxP
	z9YJgZuiQQThRAEg0sRMqMLBDt68GVtDjqPMQQHx5rxjS1fFiSoUt7tIitePAaQOVe1Eb3oxFcZWr
	fhMs7xOhoHDz+NhKwBbg+Ykaih5uUfahpz4lqLm6p0z07NIIiV2/8QprvK7t22VdP+fykwFlYj+D8
	GOmr1Nucg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrAZ-0006cS-87; Thu, 17 Sep 2020 10:29:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrA9-0006SY-6S; Thu, 17 Sep 2020 10:29:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A4F1424;
 Thu, 17 Sep 2020 03:29:12 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96423F68F;
 Thu, 17 Sep 2020 03:29:10 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] drm/panfrost: add Amlogic GPU integration quirks
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200916150147.25753-1-narmstrong@baylibre.com>
 <20200916150147.25753-4-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <132c32b9-b68a-8da9-310e-c85fe17be83e@arm.com>
Date: Thu, 17 Sep 2020 11:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-4-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_062913_360335_2CFBA6F0 
X-CRM114-Status: GOOD (  19.71  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/09/2020 16:01, Neil Armstrong wrote:
> This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
> reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7c8a87d164c3..6e5dedacb777 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -658,7 +658,18 @@ static const struct panfrost_compatible default_data = {
>   	.pm_domain_names = NULL,
>   };
>   
> +static const struct panfrost_compatible amlogic_data = {
> +	.num_supplies = ARRAY_SIZE(default_supplies),
> +	.supply_names = default_supplies,
> +	.vendor_quirk = panfrost_gpu_amlogic_quirk,
> +};
> +
>   static const struct of_device_id dt_match[] = {
> +	/* Set first to probe before the generic compatibles */
> +	{ .compatible = "amlogic,meson-gxm-mali",
> +	  .data = &amlogic_data, },
> +	{ .compatible = "amlogic,meson-g12a-mali",
> +	  .data = &amlogic_data, },
>   	{ .compatible = "arm,mali-t604", .data = &default_data, },
>   	{ .compatible = "arm,mali-t624", .data = &default_data, },
>   	{ .compatible = "arm,mali-t628", .data = &default_data, },
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
