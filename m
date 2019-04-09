Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49456C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1307720833
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 09:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGCn3phL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="koesSWO8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1307720833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPAGkn+nRl8kCILmcAvdi1XPmKtq0475QrrhvorCAfY=; b=iGCn3phLGMpgo+
	Udz+J2OvZ9sKajnDd/tpZjyuqItpq8BGjsMX5oECC6GuYDC/osfcHfgCoNhoPe9eENteoObBTcLLX
	/UBud5qv5GepDhLALGFcnxcoKx2eT00fXlj0Vz60yOnxZEJ/xFkpvwiZda3xd3rb2iOJbYVdL2YFz
	9e/KdUTbrJgGxgnSo8CkFloEVW/cU73iOxY6ifaipBphb6+3p2yHPAljEOWPsesUHkSBwZInD2r1k
	eyNH0fM5kn0X15h8nkqaYOOnCDrwoXl0nWDmhwOJ3DLaXQtafUz2U23CD+diWqAEj6SnFms9UiX+J
	rIamwQI5zfoKnq322IzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDmsq-0003q1-2G; Tue, 09 Apr 2019 09:17:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDmsm-0003pV-PG
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 09:17:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id j9so19883154wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nk4lkfV+eV2z0vqhxTxCiqrHKo2KahEMQj0fPhS3oRc=;
 b=koesSWO8Ik4dPdPsDue5pvhPvHDPzfWYyvkR8Xd69B7v7ggorx7MpYYIHbZmF+vxsD
 jjDzoCntnpNtFaqEAIcodebQIw9Wqs/juThJfP4mQqp6RuQjN80J2HxpnqaLz2aksfn8
 5qq4gJQv1z7oj0ZnIueuqGPFqwOH/gGhnTjldjL0SxB10KN3q0++bxYFkCdT2qCdGukF
 aU0LzcTjh609B2ZIfWtrO4mh0CgKEc3rVcykxxnxkY5gEcbWdyH1nRu3omtpgVX81zh1
 fQDdQBVSnH3mq6i6G92Vk/jTHzflVv5o7QAY0IH37QmXGJQhTr29Qpi9G9hL9mEHHcyP
 1eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nk4lkfV+eV2z0vqhxTxCiqrHKo2KahEMQj0fPhS3oRc=;
 b=mQBC1VAn/QKHWmuu7IT0/DHiIrzaa1yAed5ROkskDc+aWVLpuhHOhobg1GYRaj36gn
 DDfy8nXpeOsUcETLh2WDuJ5ti4llRNsxC+tbjSe7/De6hvIFQZhY1UzR0Sye7WrykQYn
 XB1Dk9ZdyX6o87qOTMAS95f4ED2JUbbd6ORbfTXAdj1l5CAhCbv4g0kKBKv1YuTOpaIk
 1ha0oK4bmgo1Oz3cUuIgqdWcOvuGfBY80CaeCcwnd8fpZPY+/PcoYe2EFyEWvKrrn7qv
 crOOA9JxnAc9sE2JV/mDZoOu3i+iWbFVNjokqeydYSpYZBS8TWWj/Q4TK7tNaH7jKPiF
 TrLA==
X-Gm-Message-State: APjAAAXQ+79+B6yUGRFc2N0wRG57SqLJ0CyPmFZPVSrgnUk+zPnKDM8g
 gB9w8tulrpU0ci4dKRqiaSr4QQ==
X-Google-Smtp-Source: APXvYqz5wph4bbPZVuDk+O3y/59BX6j0OkxXywKIbKYvSvDqNKcyG44AkpDsTaBoVujdLhkgJBrjdw==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr20729754wrn.44.1554801451122; 
 Tue, 09 Apr 2019 02:17:31 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b3sm34371604wrx.57.2019.04.09.02.17.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 02:17:30 -0700 (PDT)
Subject: Re: [PATCH 07/11] drm/meson: Add G12A support for plane handling in
 CRTC driver
To: Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190325141824.21259-1-narmstrong@baylibre.com>
 <20190325141824.21259-8-narmstrong@baylibre.com>
 <783a13d05378fb29738933572b80ca15b375c565.camel@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <791bfe0b-c4c9-d74e-2df4-f2c6bc3bda3f@baylibre.com>
Date: Tue, 9 Apr 2019 11:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <783a13d05378fb29738933572b80ca15b375c565.camel@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_021732_866071_52AA5F91 
X-CRM114-Status: GOOD (  22.83  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/04/2019 10:43, Jerome Brunet wrote:
> On Mon, 2019-03-25 at 15:18 +0100, Neil Armstrong wrote:
>> This patch adds support for the new OSD+VD Plane blending module
>> in the CRTC code by adding the G12A code to manage the blending
>> module and setting the right OSD1 & VD1 plane registers.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_crtc.c | 269 +++++++++++++++++++++++------
>>  drivers/gpu/drm/meson/meson_drv.h  |   4 +
>>  2 files changed, 221 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
>> index 6d9311e254ef..5579f8ac3e3f 100644
>> --- a/drivers/gpu/drm/meson/meson_crtc.c
>> +++ b/drivers/gpu/drm/meson/meson_crtc.c
>> @@ -39,12 +39,17 @@
>>  #include "meson_viu.h"
>>  #include "meson_registers.h"
>>  
>> +#define MESON_G12A_VIU_OFFSET	0x5ec0
>> +
>>  /* CRTC definition */
>>  
>>  struct meson_crtc {
>>  	struct drm_crtc base;
>>  	struct drm_pending_vblank_event *event;
>>  	struct meson_drm *priv;
>> +	void (*enable_osd1)(struct meson_drm *priv);
>> +	void (*enable_vd1)(struct meson_drm *priv);
>> +	unsigned int viu_offset;
>>  };
>>  #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
>>  
>> @@ -80,6 +85,44 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
>>  
>>  };
>>  
>> +static void meson_g12a_crtc_atomic_enable(struct drm_crtc *crtc,
>> +					  struct drm_crtc_state *old_state)
>> +{
>> +	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>> +	struct drm_crtc_state *crtc_state = crtc->state;
>> +	struct meson_drm *priv = meson_crtc->priv;
>> +
>> +	DRM_DEBUG_DRIVER("\n");
>> +
>> +	if (!crtc_state) {
>> +		DRM_ERROR("Invalid crtc_state\n");
>> +		return;
>> +	}
>> +
>> +	/* VD1 Preblend vertical start/end */
>> +	writel(FIELD_PREP(GENMASK(11, 0), 2303),
> 
> Could could define this mask somewhere
> I don't know if the 2303 can be explained. I'd nice if it could

It's a width, I'll add a comment.

> 
>> +	       priv->io_base + _REG(VPP_PREBLEND_VD1_V_START_END));
>> +
>> +	/* Setup Blender */
>> +	writel(crtc_state->mode.hdisplay |
>> +	       crtc_state->mode.vdisplay << 16,
>> +	       priv->io_base + _REG(VPP_POSTBLEND_H_SIZE));
>> +
>> +	writel_relaxed(0 << 16 |
> 
> this 16 shift seems to be used for hdisplay or something. Could
> define/document it a bit

Ack

> 
>> +			(crtc_state->mode.hdisplay - 1),
>> +			priv->io_base + _REG(VPP_OSD1_BLD_H_SCOPE));
>> +	writel_relaxed(0 << 16 |
>> +			(crtc_state->mode.vdisplay - 1),
>> +			priv->io_base + _REG(VPP_OSD1_BLD_V_SCOPE));
>> +	writel_relaxed(crtc_state->mode.hdisplay << 16 |
>> +			crtc_state->mode.vdisplay,
>> +			priv->io_base + _REG(VPP_OUT_H_V_SIZE));
>> +
>> +	drm_crtc_vblank_on(crtc);
>> +
>> +	priv->viu.osd1_enabled = true;
>> +}
>> +
>>  static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>>  				     struct drm_crtc_state *old_state)
>>  {
>> @@ -110,6 +153,31 @@ static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>>  	priv->viu.osd1_enabled = true;
>>  }
>>  
>> +static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
>> +					   struct drm_crtc_state *old_state)
>> +{
>> +	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>> +	struct meson_drm *priv = meson_crtc->priv;
>> +
>> +	DRM_DEBUG_DRIVER("\n");
>> +
>> +	drm_crtc_vblank_off(crtc);
>> +
>> +	priv->viu.osd1_enabled = false;
>> +	priv->viu.osd1_commit = false;
>> +
>> +	priv->viu.vd1_enabled = false;
>> +	priv->viu.vd1_commit = false;
>> +
>> +	if (crtc->state->event && !crtc->state->active) {
>> +		spin_lock_irq(&crtc->dev->event_lock);
>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>> +		spin_unlock_irq(&crtc->dev->event_lock);
>> +
>> +		crtc->state->event = NULL;
>> +	}
>> +}
>> +
>>  static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
>>  				      struct drm_crtc_state *old_state)
>>  {
>> @@ -173,6 +241,53 @@ static const struct drm_crtc_helper_funcs meson_crtc_helper_funcs = {
>>  	.atomic_disable	= meson_crtc_atomic_disable,
>>  };
>>  
>> +static const struct drm_crtc_helper_funcs meson_g12a_crtc_helper_funcs = {
>> +	.atomic_begin	= meson_crtc_atomic_begin,
>> +	.atomic_flush	= meson_crtc_atomic_flush,
>> +	.atomic_enable	= meson_g12a_crtc_atomic_enable,
>> +	.atomic_disable	= meson_g12a_crtc_atomic_disable,
>> +};
>> +
>> +static void meson_crtc_enable_osd1(struct meson_drm *priv)
>> +{
>> +	writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
>> +			    priv->io_base + _REG(VPP_MISC));
>> +}
>> +
>> +static void meson_g12a_crtc_enable_osd1(struct meson_drm *priv)
>> +{
>> +	writel_relaxed(priv->viu.osd_blend_din0_scope_h,
>> +		       priv->io_base +
>> +		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_H));
>> +	writel_relaxed(priv->viu.osd_blend_din0_scope_v,
>> +		       priv->io_base +
>> +		       _REG(VIU_OSD_BLEND_DIN0_SCOPE_V));
>> +	writel_relaxed(priv->viu.osb_blend0_size,
>> +		       priv->io_base +
>> +		       _REG(VIU_OSD_BLEND_BLEND0_SIZE));
>> +	writel_relaxed(priv->viu.osb_blend1_size,
>> +		       priv->io_base +
>> +		       _REG(VIU_OSD_BLEND_BLEND1_SIZE));
>> +}
>> +
>> +static void meson_crtc_enable_vd1(struct meson_drm *priv)
>> +{
>> +	writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
>> +			    VPP_COLOR_MNG_ENABLE,
>> +			    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
>> +			    VPP_COLOR_MNG_ENABLE,
>> +			    priv->io_base + _REG(VPP_MISC));
>> +}
>> +
>> +static void meson_g12a_crtc_enable_vd1(struct meson_drm *priv)
>> +{
>> +	writel_relaxed(((1 << 16) | /* post bld premult*/
>> +			(1 << 8) | /* post src */
>> +			(1 << 4) | /* pre bld premult*/
>> +			(1 << 0)),
> 
> Could you use the BIT() macro here and possibly some defines ?

Ack

> 
>> +			priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
>> +}
>> +
>>  void meson_crtc_irq(struct meson_drm *priv)
>>  {
>>  	struct meson_crtc *meson_crtc = to_meson_crtc(priv->crtc);
>> @@ -219,8 +334,8 @@ void meson_crtc_irq(struct meson_drm *priv)
>>  				MESON_CANVAS_BLKMODE_LINEAR, 0);
>>  
>>  		/* Enable OSD1 */
>> -		writel_bits_relaxed(VPP_OSD1_POSTBLEND, VPP_OSD1_POSTBLEND,
>> -				    priv->io_base + _REG(VPP_MISC));
>> +		if (meson_crtc->enable_osd1)
>> +			meson_crtc->enable_osd1(priv);
>>  
>>  		priv->viu.osd1_commit = false;
>>  	}
>> @@ -261,89 +376,133 @@ void meson_crtc_irq(struct meson_drm *priv)
>>  		};
>>  
>>  		writel_relaxed(priv->viu.vd1_if0_gen_reg,
>> -				priv->io_base + _REG(VD1_IF0_GEN_REG));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_GEN_REG));
> 
> Could you make a local variable for priv->io_base + meson_crtc->viu_offset ?
> It would be a little easier to read

Indeed

> 
>>  		writel_relaxed(priv->viu.vd1_if0_gen_reg,
>> -				priv->io_base + _REG(VD2_IF0_GEN_REG));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_GEN_REG));
>>  		writel_relaxed(priv->viu.vd1_if0_gen_reg2,
>> -				priv->io_base + _REG(VD1_IF0_GEN_REG2));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_GEN_REG2));
>>  		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
>> -				priv->io_base + _REG(VIU_VD1_FMT_CTRL));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VIU_VD1_FMT_CTRL));
>>  		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
>> -				priv->io_base + _REG(VIU_VD2_FMT_CTRL));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VIU_VD2_FMT_CTRL));
>>  		writel_relaxed(priv->viu.viu_vd1_fmt_w,
>> -				priv->io_base + _REG(VIU_VD1_FMT_W));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VIU_VD1_FMT_W));
>>  		writel_relaxed(priv->viu.viu_vd1_fmt_w,
>> -				priv->io_base + _REG(VIU_VD2_FMT_W));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VIU_VD2_FMT_W));
>>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
>> -				priv->io_base + _REG(VD1_IF0_CANVAS0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CANVAS0));
>>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
>> -				priv->io_base + _REG(VD1_IF0_CANVAS1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CANVAS1));
>>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
>> -				priv->io_base + _REG(VD2_IF0_CANVAS0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CANVAS0));
>>  		writel_relaxed(priv->viu.vd1_if0_canvas0,
>> -				priv->io_base + _REG(VD2_IF0_CANVAS1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CANVAS1));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
>> -				priv->io_base + _REG(VD1_IF0_LUMA_X0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA_X0));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
>> -				priv->io_base + _REG(VD1_IF0_LUMA_X1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA_X1));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
>> -				priv->io_base + _REG(VD2_IF0_LUMA_X0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA_X0));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_x0,
>> -				priv->io_base + _REG(VD2_IF0_LUMA_X1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA_X1));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
>> -				priv->io_base + _REG(VD1_IF0_LUMA_Y0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA_Y0));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
>> -				priv->io_base + _REG(VD1_IF0_LUMA_Y1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA_Y1));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
>> -				priv->io_base + _REG(VD2_IF0_LUMA_Y0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA_Y0));
>>  		writel_relaxed(priv->viu.vd1_if0_luma_y0,
>> -				priv->io_base + _REG(VD2_IF0_LUMA_Y1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA_Y1));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA_X0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA_X0));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA_X1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA_X1));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA_X0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA_X0));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_x0,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA_X1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA_X1));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA_Y0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA_Y0));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA_Y1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA_Y1));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA_Y0));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA_Y0));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma_y0,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA_Y1));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA_Y1));
>>  		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
>> -				priv->io_base + _REG(VD1_IF0_RPT_LOOP));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_RPT_LOOP));
>>  		writel_relaxed(priv->viu.vd1_if0_repeat_loop,
>> -				priv->io_base + _REG(VD2_IF0_RPT_LOOP));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_RPT_LOOP));
>>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
>> -				priv->io_base + _REG(VD1_IF0_LUMA0_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA0_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
>> -				priv->io_base + _REG(VD2_IF0_LUMA0_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA0_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
>> -				priv->io_base + _REG(VD1_IF0_LUMA1_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA1_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_luma0_rpt_pat,
>> -				priv->io_base + _REG(VD2_IF0_LUMA1_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA1_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA0_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA0_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA0_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA0_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
>> -				priv->io_base + _REG(VD1_IF0_CHROMA1_RPT_PAT));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA1_RPT_PAT));
>>  		writel_relaxed(priv->viu.vd1_if0_chroma0_rpt_pat,
>> -				priv->io_base + _REG(VD2_IF0_CHROMA1_RPT_PAT));
>> -		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_LUMA_PSEL));
>> -		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_CHROMA_PSEL));
>> -		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_LUMA_PSEL));
>> -		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_CHROMA_PSEL));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA1_RPT_PAT));
>> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_LUMA_PSEL));
>> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_CHROMA_PSEL));
>> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_LUMA_PSEL));
>> +		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD2_IF0_CHROMA_PSEL));
>>  		writel_relaxed(priv->viu.vd1_range_map_y,
>> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_Y));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_RANGE_MAP_Y));
>>  		writel_relaxed(priv->viu.vd1_range_map_cb,
>> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CB));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_RANGE_MAP_CB));
>>  		writel_relaxed(priv->viu.vd1_range_map_cr,
>> -				priv->io_base + _REG(VD1_IF0_RANGE_MAP_CR));
>> +				priv->io_base + meson_crtc->viu_offset +
>> +				_REG(VD1_IF0_RANGE_MAP_CR));
>>  		writel_relaxed(0x78404,
>>  				priv->io_base + _REG(VPP_SC_MISC));
>>  		writel_relaxed(priv->viu.vpp_pic_in_height,
>> @@ -389,11 +548,8 @@ void meson_crtc_irq(struct meson_drm *priv)
>>  		writel_relaxed(0x42, priv->io_base + _REG(VPP_SCALE_COEF_IDX));
>>  
>>  		/* Enable VD1 */
>> -		writel_bits_relaxed(VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
>> -				    VPP_COLOR_MNG_ENABLE,
>> -				    VPP_VD1_PREBLEND | VPP_VD1_POSTBLEND |
>> -				    VPP_COLOR_MNG_ENABLE,
>> -				    priv->io_base + _REG(VPP_MISC));
>> +		if (meson_crtc->enable_vd1)
>> +			meson_crtc->enable_vd1(priv);
>>  
>>  		priv->viu.vd1_commit = false;
>>  	}
>> @@ -430,7 +586,16 @@ int meson_crtc_create(struct meson_drm *priv)
>>  		return ret;
>>  	}
>>  
>> -	drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
>> +	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
>> +		meson_crtc->enable_osd1 = meson_g12a_crtc_enable_osd1;
>> +		meson_crtc->enable_vd1 = meson_g12a_crtc_enable_vd1;
>> +		meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
>> +		drm_crtc_helper_add(crtc, &meson_g12a_crtc_helper_funcs);
>> +	} else {
>> +		meson_crtc->enable_osd1 = meson_crtc_enable_osd1;
>> +		meson_crtc->enable_vd1 = meson_crtc_enable_vd1;
>> +		drm_crtc_helper_add(crtc, &meson_crtc_helper_funcs);
>> +	}
>>  
>>  	priv->crtc = crtc;
>>  
>> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
>> index 214a7cb18ce2..9614baa836b9 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.h
>> +++ b/drivers/gpu/drm/meson/meson_drv.h
>> @@ -62,6 +62,10 @@ struct meson_drm {
>>  		uint32_t osd_sc_h_phase_step;
>>  		uint32_t osd_sc_h_ctrl0;
>>  		uint32_t osd_sc_v_ctrl0;
>> +		uint32_t osd_blend_din0_scope_h;
>> +		uint32_t osd_blend_din0_scope_v;
>> +		uint32_t osb_blend0_size;
>> +		uint32_t osb_blend1_size;
>>  
>>  		bool vd1_enabled;
>>  		bool vd1_commit;
> 
> 


Will fix in a follow-up patch.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
