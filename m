Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC10C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:23:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F04421941
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqnmCqIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F04421941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E9hsRoQtvNjWROZYlaoFYZPyCU+uZWAUs09pPhjFcwc=; b=eqnmCqIG9jIwGrPQR3IZARQvo
	FjZaw8UQ2wjIny17oQ+ByG+ulocolXVE/3iXPpjF/RM6ZrsGae0DagDX+Im3HRMIRCVpwzzZ9Bu8Y
	DEGbU4RYilCnCr95o/e+kofAxJVYSjEwCBlBi8SVZ8q46nbYoouCcs1CrFOyE6RdyreXJeBwBsmUL
	PYf1IJHCIGacaSRYVNbCWbru9zA8kxGNgSgxvAMKal7H3OyF4sl7xZAzKHtctwciUsrCbnbpbm/XF
	7TKCpr4N9iWTW51+6/0niyWlgF1j5VKTPoeXJf18/yknOCJduk/q+KvAhJPbDN8i2yuXleoqqJQea
	t5ha64ftA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFz8a-0002i6-RJ; Wed, 09 Sep 2020 12:23:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFz8Y-0002gZ-AY; Wed, 09 Sep 2020 12:23:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3B5113E;
 Wed,  9 Sep 2020 05:23:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8081D3F68F;
 Wed,  9 Sep 2020 05:23:40 -0700 (PDT)
Subject: Re: [PATCH 3/5] drm/panfrost: add support for reset quirk
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-4-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ff982600-d705-1dc8-44c8-b69015791997@arm.com>
Date: Wed, 9 Sep 2020 13:23:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-4-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_082342_414362_8C3D9E1A 
X-CRM114-Status: GOOD (  25.75  )
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

On 08/09/2020 16:18, Neil Armstrong wrote:
> The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
> SoCs needs a quirk in the PWR registers at the GPU reset time.
> 
> This adds a callback in the device compatible struct of permit this.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 2cf1a6a13af8..4c9cd5452ba5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -73,6 +73,9 @@ struct panfrost_compatible {
>   
>   	/* IOMMU quirks flags */
>   	unsigned long pgtbl_quirks;
> +
> +	/* Vendor implementation quirks at reset time callback */
> +	void (*vendor_reset_quirk)(struct panfrost_device *pfdev);
>   };
>   
>   struct panfrost_device {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index e0f190e43813..c129aaf77790 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -62,6 +62,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>   	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
>   	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
>   
> +	/* The Amlogic GPU integration needs quirks at this stage */
> +	if (pfdev->comp->vendor_reset_quirk)
> +		pfdev->comp->vendor_reset_quirk(pfdev);
> +
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
>   		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);

Placing the quirk before the reset has completed is dodgy. Can this be 
ordered after the GPU_IRQ_RESET_COMPLETED signal has been seen? The 
problem is the reset could (in theory) cause a power transition (e.g. if 
the GPU is reset while a core is powered) and changing the PWR_OVERRIDEx 
registers during a transition is undefined. But I don't know the details 
of how the hardware is broken so it is possible the override is needed 
for the reset to complete so this would need testing.

I also wonder if this could live in panfrost_gpu_init_quirks() instead? 
Although that is mostly about quirks common to all Mali GPU 
implementations rather than a specific implementation. Although now I've 
looked I've noticed we have a bug as we don't appear to reapply those 
quirks after a reset - I'll send a patch!

Steve

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
