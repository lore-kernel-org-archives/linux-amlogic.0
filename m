Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8757AC10F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 10:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581DF206BA
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 10:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYJliBJy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581DF206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=efEqNxLicQjMYk/P5Kra3ZglHg1ooOE5PjYb6xHFBrc=; b=rYJliBJymBPQrN
	dtN2BklWkc/+ilsfvGrn8UlNgm//1KSO3al160/cKHJVAvr7reb62yKBPHol5CKYdmwFjOKHuEOb5
	/OXKeDBGLLANiZ2Z4FzMeTZSIQfG+/VsFIt6KZf8+0yRMPbA36SRQ5soGWim+jcF/GjcuFCL+1kXr
	WuwXCpAg90VRQuMg88I2UkoXA8qr1/JsZwuKBwIkbz5prWw3mSSAF+x17o2LX7MQFmBuCxcYa7Ev8
	zMrr7YCj1cpqKmfAOW4bUprIkc65YGvZRanIVmsjb/tLXFVewd397/3HndOLfCNARfZV1J2X0mMDC
	W7EN+BmJo7Mm1RTzsL2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGLCM-0004hH-DV; Tue, 16 Apr 2019 10:20:18 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGLCI-0004gh-Qj
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 10:20:16 +0000
Received: from mail-sh.amlogic.com (10.18.11.5) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 16 Apr
 2019 18:20:05 +0800
Received: from mail-sh.amlogic.com ([::1]) by mail-sh.amlogic.com ([::1]) with
 mapi id 15.01.1591.012; Tue, 16 Apr 2019 18:20:05 +0800
From: Sky Zhou <Sky.Zhou@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/meson: add size and alignment requirements for dumb
 buffers
Thread-Topic: [PATCH] drm/meson: add size and alignment requirements for dumb
 buffers
Thread-Index: AQHU7emyYXrKpM5Hu0ukuwfto14jpw==
Date: Tue, 16 Apr 2019 10:20:05 +0000
Message-ID: <cd3674423da344e0a98ca58737efc1f5@amlogic.com>
References: <20190408090137.2402-1-narmstrong@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.18.29.243]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_032014_867302_E5B84F8E 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 2019/4/8 17:01, Neil Armstrong wrote:
> The Amlogic SoCs Canvas buffers stride must be aligned on 64bytes
> and overall size should be aligned on PAGE width.
> 
> Adds a custom dumb_create op to adds these requirements.
> 
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Suggested-by: Sky Zhou <sky.zhou@amlogic.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index faf1b1b0357c..72b01e6be0d9 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -90,6 +90,18 @@ static irqreturn_t meson_irq(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> +static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
> +			     struct drm_mode_create_dumb *args)
> +{
> +	/*
> +	 * We need 64bytes aligned stride, and PAGE aligned size
> +	 */
> +	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
> +	args->size = PAGE_ALIGN(args->pitch * args->height);
> +
> +	return drm_gem_cma_dumb_create_internal(file, dev, args);
> +}
> +
>   DEFINE_DRM_GEM_CMA_FOPS(fops);
>   
>   static struct drm_driver meson_driver = {
> @@ -112,7 +124,7 @@ static struct drm_driver meson_driver = {
>   	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
>   
>   	/* GEM Ops */
> -	.dumb_create		= drm_gem_cma_dumb_create,
> +	.dumb_create		= meson_dumb_create,
>   	.gem_free_object_unlocked = drm_gem_cma_free_object,
>   	.gem_vm_ops		= &drm_gem_cma_vm_ops,
>   
> 

Reviewed-by: Sky Zhou <sky.zhou@amlogic.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
