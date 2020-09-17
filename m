Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020FEC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:37:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6600721974
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VKAyt8Uc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6600721974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3au1eIamnUai/gDmtCpBQyv1HYGnIewiR62akZjTtjs=; b=VKAyt8UckgfgfG3MFtA0JcYW4
	v7IAInGyFsJfMTCIZ+lRN7VxnweKFs3eWMhgHuoXRNzTWwmDYVX+eknmsDta6f4fhrX9AR1a9GAQu
	TjS5P61UnFBDSmzbClCSGr65hENHM/k3dhiEBTUiWa9XG2wc/GDK3hSW7Kk8ALvUtH4QCpcebMMWK
	dYx+ua6ZU/BFEXVBP+VlNWeRRt/WupUe/qjA6apwsORc4XK4+DmpJcxjRPs4E9u0h492XpCDHrTtV
	YAKZD9siW7WAC/PDYkk4gFLBh/vbqyv0ISGAMtxCtnKLnXM3FKfRWCA8nFCMrzOrC3I3UXzmpNEtt
	ufzxsPP9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrI8-0008IL-9f; Thu, 17 Sep 2020 10:37:28 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrI5-0008HE-Ca; Thu, 17 Sep 2020 10:37:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AF6930E;
 Thu, 17 Sep 2020 03:37:24 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EE013F68F;
 Thu, 17 Sep 2020 03:37:22 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/panfrost: Support cache-coherent integrations
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com
References: <cover.1600213517.git.robin.murphy@arm.com>
 <52dbcdfd15d804f35ba8c984c650144782f762da.1600213517.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <03eb19ef-4535-59c8-994c-15adfe3b75ca@arm.com>
Date: Thu, 17 Sep 2020 11:37:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <52dbcdfd15d804f35ba8c984c650144782f762da.1600213517.git.robin.murphy@arm.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_063725_522957_A9790A67 
X-CRM114-Status: GOOD (  22.41  )
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
Cc: linux-amlogic@lists.infradead.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/09/2020 00:51, Robin Murphy wrote:
> When the GPU's ACE-Lite interface is fully wired up and capable of
> snooping CPU caches, it may be described as "dma-coherent" in
> devicetree, which will already inform the DMA layer not to perform
> unnecessary cache maintenance. However, we still need to ensure that
> the GPU uses the appropriate cacheable outer-shareable attributes in
> order to generate the requisite snoop signals, and that CPU mappings
> don't create a mismatch by using a non-cacheable type either.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
>   drivers/gpu/drm/panfrost/panfrost_drv.c    | 2 ++
>   drivers/gpu/drm/panfrost/panfrost_gem.c    | 2 ++
>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 +
>   4 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index c30c719a8059..b31f45315e96 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -84,6 +84,7 @@ struct panfrost_device {
>   	/* pm_domains for devices with more than one. */
>   	struct device *pm_domain_devs[MAX_PM_DOMAINS];
>   	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
> +	bool coherent;
>   
>   	struct panfrost_features features;
>   	const struct panfrost_compatible *comp;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ada51df9a7a3..2a6f2f716b2f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -588,6 +588,8 @@ static int panfrost_probe(struct platform_device *pdev)
>   	if (!pfdev->comp)
>   		return -ENODEV;
>   
> +	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
> +
>   	/* Allocate and initialze the DRM device. */
>   	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
>   	if (IS_ERR(ddev))
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 33355dd302f1..cdf1a8754eba 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -220,6 +220,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>    */
>   struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size)
>   {
> +	struct panfrost_device *pfdev = dev->dev_private;
>   	struct panfrost_gem_object *obj;
>   
>   	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> @@ -229,6 +230,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>   	INIT_LIST_HEAD(&obj->mappings.list);
>   	mutex_init(&obj->mappings.lock);
>   	obj->base.base.funcs = &panfrost_gem_funcs;
> +	obj->base.map_cached = pfdev->coherent;
>   
>   	return &obj->base.base;
>   }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index e8f7b11352d2..8852fd378f7a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -371,6 +371,7 @@ int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
>   		.pgsize_bitmap	= SZ_4K | SZ_2M,
>   		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
>   		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
> +		.coherent_walk	= pfdev->coherent,
>   		.tlb		= &mmu_tlb_ops,
>   		.iommu_dev	= pfdev->dev,
>   	};
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
