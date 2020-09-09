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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37278C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:24:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8DD21941
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fjx4cVmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8DD21941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Fy05b1vYSh2YV4JyVT7f8Ex2srEoALSaMgbvZ2v9Gw=; b=Fjx4cVmZJSSIpr2ea2aTTuk76
	F9AVEqAZu09+Vij2vcf3DDVLt92AxeY26is7gZGquRn5lMeosL7fTuPm670iPVXQ6N4dn152FWxtP
	K0JLI6J56eaeXlHgrMV0orzrQnnthVe6H/ug00Fz/+dpFIKTWTh+1Qz2S23epGxP0VB0Rumm161lg
	sJPzQIVWeLxXumKdg2N0B/vOUV8665ivqBYlyHtIINycuKFd3zN6GNn+lqz15mtv0mhcc26eqLQ8b
	5Cj3ytSulaMfjQ7Ff8WGAz62dyZa1iPTP0gG9rzulLPBShSJJDTirisDRocHcbJN8l/WYVE/Ej5yQ
	/jJPWGalw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFz8o-0002nt-SH; Wed, 09 Sep 2020 12:23:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFz8a-0002i7-Tk; Wed, 09 Sep 2020 12:23:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B875513D5;
 Wed,  9 Sep 2020 05:23:43 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99DC13F68F;
 Wed,  9 Sep 2020 05:23:42 -0700 (PDT)
Subject: Re: [PATCH 4/5] drm/panfrost: add amlogic reset quirk callback
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-5-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5efe218c-19d5-c25b-74cc-e5ae5da418a2@arm.com>
Date: Wed, 9 Sep 2020 13:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-5-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_082345_109782_CDCA2223 
X-CRM114-Status: GOOD (  24.46  )
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
> Since the documentation of the GPU cores are not public, we do not know what does these
> values, but they permit having a fully functional GPU running with Panfrost.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c  | 13 +++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
>   drivers/gpu/drm/panfrost/panfrost_regs.h |  3 +++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index c129aaf77790..018737bd4ac6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -80,6 +80,19 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>   	return 0;
>   }
>   
> +void panfrost_gpu_amlogic_quirks(struct panfrost_device *pfdev)
> +{
> +	/*
> +	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
> +	 * these undocumented bits to be set in order to operate
> +	 * correctly.
> +	 * These GPU_PWR registers contains:
> +	 * "device-specific power control value"
> +	 */
> +	gpu_write(pfdev, GPU_PWR_KEY, 0x2968A819);

As Alyssa has mentioned this magic value is not Amlogic specific, but is 
just the unlock key value, so please add the define in panfrost-gpu.h

> +	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));

But PWR_OVERRIDE1 is indeed device specific so I can't offer an insight 
here.

> +}
> +
>   static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>   {
>   	u32 quirks = 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> index 4112412087b2..a881d7dc812f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
> @@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
>   void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>   void panfrost_gpu_power_off(struct panfrost_device *pfdev);
>   
> +void panfrost_gpu_amlogic_reset_quirk(struct panfrost_device *pfdev);

You need to be consistent about the name - this has _reset_, the above 
function doesn't.

Steve

> +
>   #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index ea38ac60581c..fa0d02f3c830 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -51,6 +51,9 @@
>   #define GPU_STATUS			0x34
>   #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
>   #define GPU_LATEST_FLUSH_ID		0x38
> +#define GPU_PWR_KEY			0x050	/* (WO) Power manager key register */
> +#define GPU_PWR_OVERRIDE0		0x054	/* (RW) Power manager override settings */
> +#define GPU_PWR_OVERRIDE1		0x058	/* (RW) Power manager override settings */
>   #define GPU_FAULT_STATUS		0x3C
>   #define GPU_FAULT_ADDRESS_LO		0x40
>   #define GPU_FAULT_ADDRESS_HI		0x44
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
