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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB5BC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8292083B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ro4qWBk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8292083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qXtBAZ+1uROyioZuevs8ZU8mp0g9jVFYf6hRahNvMM=; b=2ro4qWBkh+3XGhGdRbDDmjR5R
	sOQxaum7mYYKR+FPeXf29fZrMUuRYscV6DZb7MZGtj+mkflTKhEdi0dNW/NhjpCmW2e1rAZ/3G+eX
	FvdgrMb4ILqdl6M00Qjs9WzekhjPO0NPBfkNG3UFULi360gJNruRisSCCFXwjIeyIbeuT30T63VFY
	6pZ6pZ/AFaEVkmAF3/ZJqqYbYMYElCnL7airKZOLVS5BNGTMJx9adPPjfpzBsCaVYmfTIOkTRtJZ+
	AVISYOsJTrqJ13Oe5lYdIClFuwX0QddtNlx3wOAdXmTSWy61SjjFoDpo+X9CWaeMzA4mQTeoeTgVU
	N39g8hF0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrAJ-0006XE-PV; Thu, 17 Sep 2020 10:29:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrA7-0006R4-Mg; Thu, 17 Sep 2020 10:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF6013D5;
 Thu, 17 Sep 2020 03:29:08 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 666F73F8C6;
 Thu, 17 Sep 2020 03:29:07 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] drm/panfrost: add amlogic reset quirk callback
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200916150147.25753-1-narmstrong@baylibre.com>
 <20200916150147.25753-3-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <65d87f20-6dce-adeb-4d32-7a73462dd575@arm.com>
Date: Thu, 17 Sep 2020 11:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-3-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_062911_873484_3947CB54 
X-CRM114-Status: GOOD (  21.98  )
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
> The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B

NIT: s/integratewd/integrated/

> SoCs needs a quirk in the PWR registers at the GPU reset time.
> 
> Since the Amlogic's integration of the GPU cores with the SoC is not
> publicly documented we do not know what does these
> values, but they permit having a fully functional GPU running with Panfrost.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c  | 11 +++++++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
>   drivers/gpu/drm/panfrost/panfrost_regs.h |  4 ++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index a6de78bc1fa8..e1b2a3376624 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -76,6 +76,17 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>   	return 0;
>   }
>   
> +void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev)
> +{
> +	/*
> +	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
> +	 * these undocumented bits in GPU_PWR_OVERRIDE1 to be set in order
> +	 * to operate correctly.
> +	 */
> +	gpu_write(pfdev, GPU_PWR_KEY, GPU_PWR_KEY_UNLOCK);
> +	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
> +}
> +
>   static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>   {
>   	u32 quirks = 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> index 4112412087b2..468c51e7e46d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
>   void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>   void panfrost_gpu_power_off(struct panfrost_device *pfdev);
>   
> +void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
> +
>   #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index ea38ac60581c..eddaa62ad8b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -51,6 +51,10 @@
>   #define GPU_STATUS			0x34
>   #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
>   #define GPU_LATEST_FLUSH_ID		0x38
> +#define GPU_PWR_KEY			0x50	/* (WO) Power manager key register */
> +#define  GPU_PWR_KEY_UNLOCK		0x2968A819
> +#define GPU_PWR_OVERRIDE0		0x54	/* (RW) Power manager override settings */
> +#define GPU_PWR_OVERRIDE1		0x58	/* (RW) Power manager override settings */
>   #define GPU_FAULT_STATUS		0x3C
>   #define GPU_FAULT_ADDRESS_LO		0x40
>   #define GPU_FAULT_ADDRESS_HI		0x44
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
