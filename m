Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F56C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC3C20651
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlVNDdyN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s5BBhBzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC3C20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+xjVafWNGKdaxNa+ntORlOnoipO7i5enNJ6ffH56V4w=; b=RlVNDdyNw9tM/095cmWdaknnK0
	k5wlPqyDCqrnuRZH0dd50Zr1r3eJv1enEmZM2tsion6nv9OdaN7K6k0AUU8+y5B53Qx4CRUHves/U
	XorXzAeFo/FXhw+BI64EDEGYc4unpmU7pWV8lTDQEgps8GG9tiYN/xUiD/RYkD7W4rbdUQ0PY40TZ
	HgzzhRuoQ8eMEKbkJGkOM0hvZdm8dZv2n21drVTLdWtGJTjnhkD1WDLISNu7HWazkpoVpSBeHBGSn
	w+K6slhQ0QorkJH0qj4+4U5EC0kzllLtdRky2jWnG8lhDiU/Gdoq7OkQKxdPaaEJWGvqBpd0v26ly
	KKmy3S8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNg3-0001Y7-RG; Tue, 15 Jan 2019 12:18:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNfz-0001Xj-Oa
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:18:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id q18so2686608wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0ERHMrm9mRGxL3idNSSzVfMYqNtnehzRLTFbP7Dzx+o=;
 b=s5BBhBzvNTvjwSHnK8Hd+edqxdFCagaRnceFh2DZcjWJn00aojbKgpg/sdOLnLN9zM
 9DAEM+/gyr3VLUJWQXtmXhsLIsFOlfGn17HmnG4HYs8bhYV0N73A1hG29RTe7Ydsv8Xv
 1K2RBUDThZFwf1mf9aIwjjBQQ2vjD18FN0OH8khP12sNzOLEjPB30COGAK2BU19PI10I
 8r6+deGIemuqONbmZk1H7TfMqhPgCm70VaZkPimREsSusEcMyfu0H4HniXUBDxC1v6sZ
 cZLT+1X2T+QQfoosuS4PyyvV/ziwRqAh6jeMTg0mCEoT3gG4QHlTnd0tgQUSld573HDo
 72AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0ERHMrm9mRGxL3idNSSzVfMYqNtnehzRLTFbP7Dzx+o=;
 b=PVQWaMs1K5CSJYNTkfPgSydNudnQbibxrQIZiX4M7oxPhRAJ3asAF3hJj7u3yi4V5X
 kUuNSLO2okjM15GjhOhrHZPxMEbympBDjW/qJmXajH1u7vSAc4CSWiMuAlUl3+yTgjQQ
 GJz/k22ypWSGeU/G0TpvDVtkvOPam5qfjahjPFMHAgfdcd4sG0GYr5/6H0uxNN1+SYsd
 NlgvPBdz391bWNKfxC2dIw4epaBrwkJTCnOEvi5OMXlshcTTVmPugiLf8FeSOtN1fZRp
 aMRnKV9g7CvDCIcLto0jwyW6GzeilI6CnTtF3UEYJvd+VikGZmuy+viiXpCKXpl4d5m2
 9Ccg==
X-Gm-Message-State: AJcUukf2V1yxobLrcLbw/4uSuBqMhBpgzCYZUgBRupcVBPffs1mGnVCU
 F4Q28oQJ2IPKfIuvtyAfc7+pTg==
X-Google-Smtp-Source: ALg8bN6kmymLKz2WGzj7OqkR/zuBgWlfKcOAJqjmEDUekMtO9MICnjGXRArcaSyuzDFtogCao7wSQg==
X-Received: by 2002:adf:f091:: with SMTP id n17mr2924764wro.292.1547554717884; 
 Tue, 15 Jan 2019 04:18:37 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c12sm72772123wrs.82.2019.01.15.04.18.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jan 2019 04:18:37 -0800 (PST)
Subject: Re: [PATCH v2] drm/meson: Fix atomic mode switching regression
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tony McKahan <tonymckahan@gmail.com>
References: <20190114153118.8024-1-narmstrong@baylibre.com>
 <20190115120618.GM10517@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b2b0c3f1-7284-88c9-9193-330861f1b5fa@baylibre.com>
Date: Tue, 15 Jan 2019 13:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115120618.GM10517@phenom.ffwll.local>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_041839_863381_ED1EE7D4 
X-CRM114-Status: GOOD (  17.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/01/2019 13:06, Daniel Vetter wrote:
> On Mon, Jan 14, 2019 at 04:31:18PM +0100, Neil Armstrong wrote:
>> Since commit 2bcd3ecab773 when switching mode from X11 (ubuntu mate for
>> example) the display gets blurry, looking like an invalid framebuffer width.
>>
>> This commit fixed atomic crtc modesetting in a totally wrong way and
>> introduced a local unnecessary ->enabled crtc state.
>>
>> This commit reverts the crctc _begin() and _enable() changes and simply
>> adds drm_atomic_helper_commit_tail_rpm as helper.
>>
>> Reported-by: Tony McKahan <tonymckahan@gmail.com>
>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>> Fixes: 2bcd3ecab773 ("drm/meson: Fixes for drm_crtc_vblank_on/off support")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> For the record (I already acked this on irc):

Thanks, I got it, I was checking against the known regression to see if it doesn't
add a new one !

> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied to drm-misc-fixes

Neil

>> ---
>>  drivers/gpu/drm/meson/meson_crtc.c | 23 ++---------------------
>>  drivers/gpu/drm/meson/meson_drv.c  |  6 ++++++
>>  2 files changed, 8 insertions(+), 21 deletions(-)
>>
>> Changes since v1:
>> - drop the unecessary local ->enabled logic
>> - use drm_atomic_helper_commit_tail_rpm as atomic_commit_tail helper
>>
>> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
>> index 75d97f1b2e8f..4f5c67f70c4d 100644
>> --- a/drivers/gpu/drm/meson/meson_crtc.c
>> +++ b/drivers/gpu/drm/meson/meson_crtc.c
>> @@ -46,7 +46,6 @@ struct meson_crtc {
>>  	struct drm_crtc base;
>>  	struct drm_pending_vblank_event *event;
>>  	struct meson_drm *priv;
>> -	bool enabled;
>>  };
>>  #define to_meson_crtc(x) container_of(x, struct meson_crtc, base)
>>  
>> @@ -82,7 +81,8 @@ static const struct drm_crtc_funcs meson_crtc_funcs = {
>>  
>>  };
>>  
>> -static void meson_crtc_enable(struct drm_crtc *crtc)
>> +static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>> +				     struct drm_crtc_state *old_state)
>>  {
>>  	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>>  	struct drm_crtc_state *crtc_state = crtc->state;
>> @@ -108,20 +108,6 @@ static void meson_crtc_enable(struct drm_crtc *crtc)
>>  
>>  	drm_crtc_vblank_on(crtc);
>>  
>> -	meson_crtc->enabled = true;
>> -}
>> -
>> -static void meson_crtc_atomic_enable(struct drm_crtc *crtc,
>> -				     struct drm_crtc_state *old_state)
>> -{
>> -	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>> -	struct meson_drm *priv = meson_crtc->priv;
>> -
>> -	DRM_DEBUG_DRIVER("\n");
>> -
>> -	if (!meson_crtc->enabled)
>> -		meson_crtc_enable(crtc);
>> -
>>  	priv->viu.osd1_enabled = true;
>>  }
>>  
>> @@ -153,8 +139,6 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
>>  
>>  		crtc->state->event = NULL;
>>  	}
>> -
>> -	meson_crtc->enabled = false;
>>  }
>>  
>>  static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
>> @@ -163,9 +147,6 @@ static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
>>  	struct meson_crtc *meson_crtc = to_meson_crtc(crtc);
>>  	unsigned long flags;
>>  
>> -	if (crtc->state->enable && !meson_crtc->enabled)
>> -		meson_crtc_enable(crtc);
>> -
>>  	if (crtc->state->event) {
>>  		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
>>  
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 3ee4d4a4ecba..a74d861ddceb 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -75,6 +75,11 @@ static const struct drm_mode_config_funcs meson_mode_config_funcs = {
>>  	.fb_create           = drm_gem_fb_create,
>>  };
>>  
>> +
>> +static const struct drm_mode_config_helper_funcs meson_mode_config_helpers = {
>> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>> +};
>> +
>>  static irqreturn_t meson_irq(int irq, void *arg)
>>  {
>>  	struct drm_device *dev = arg;
>> @@ -266,6 +271,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>  	drm->mode_config.max_width = 3840;
>>  	drm->mode_config.max_height = 2160;
>>  	drm->mode_config.funcs = &meson_mode_config_funcs;
>> +	drm->mode_config.helper_private	= &meson_mode_config_helpers;
>>  
>>  	/* Hardware Initialization */
>>  
>> -- 
>> 2.20.1
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
