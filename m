Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092FAC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0FD2087D
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCWCwm6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F0FD2087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWeGu6dOoLUPYHJJYqWVPSidzRnR1B2JJvS2rUrTfhY=; b=VCWCwm6u6od44ocjr4wjknLDF
	BoJdIECcwQYqRg0t/+BKaXKMwt3PNJxqKMus8jIX7kGa4e+Uzzg27OuIs40kfMkR1W+0eATHvJhU7
	N4mCpwqDy4/CzKkcDzb2fMRqRH7BouRew1Qdr/0KOWkAF+2o9eer4VFuc2ZIr2yfZP0VoGNem4XFk
	ydhc+F5+RhQmK+v40RLklFKiUGTJ/Kt3AQWE+mSojFNZzoSpHAI8wKfLJkMiVG2jsXZ4weMgHQx9/
	KRsHaBucosFw6JHZy2RoxhuCbf7jDbZGyaIDJL2eH2rcBzuuawdgQPv24bCflv2SjrLh09Z7drXJK
	VJdvKBSzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrA9-0006T5-Mj; Thu, 17 Sep 2020 10:29:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrA6-0006Qr-Ke; Thu, 17 Sep 2020 10:29:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2886012FC;
 Thu, 17 Sep 2020 03:29:08 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A97B13F68F;
 Thu, 17 Sep 2020 03:29:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] drm/panfrost: add support for vendor quirk
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200916150147.25753-1-narmstrong@baylibre.com>
 <20200916150147.25753-2-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <370802ea-5f21-7a62-cf84-0dc5f5020667@arm.com>
Date: Thu, 17 Sep 2020 11:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916150147.25753-2-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_062910_762474_016E1F80 
X-CRM114-Status: GOOD (  20.89  )
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

> SoCs needs a quirk in the PWR registers after each reset.
> 
> This adds a callback in the device compatible struct of permit this.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index abfc78db193a..140e004a3790 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -70,6 +70,9 @@ struct panfrost_compatible {
>   	int num_pm_domains;
>   	/* Only required if num_pm_domains > 1. */
>   	const char * const *pm_domain_names;
> +
> +	/* Vendor implementation quirks callback */
> +	void (*vendor_quirk)(struct panfrost_device *pfdev);
>   };
>   
>   struct panfrost_device {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index c7c5da5a31d4..a6de78bc1fa8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -136,6 +136,10 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>   
>   	if (quirks)
>   		gpu_write(pfdev, GPU_JM_CONFIG, quirks);
> +
> +	/* Here goes platform specific quirks */
> +	if (pfdev->comp->vendor_quirk)
> +		pfdev->comp->vendor_quirk(pfdev);
>   }
>   
>   #define MAX_HW_REVS 6
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
