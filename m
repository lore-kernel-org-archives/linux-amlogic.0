Return-Path: <SRS0=7uPT=WF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC60C31E40
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 09:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E324C20C01
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 09:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a150OaJN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kUpq+QYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E324C20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5icNiM/kdpYaIBOlBSoo+kglA49uaiTVXzACjcH1loY=; b=a150OaJN/AMyy9
	SQQM29sorIhlNNKEKIaEs0Z3xPbMVpDlN+c9lSd6agwlwDwO9syYURSJ0vOcWbIgUtRndbOZX23WN
	otDIMvqsc1Qurstu8XtLLcQCe5mAUJhFYdl6EomQO+5D25nVVCjRmnW6j36FAUxXNuiGck/YtYg5s
	znlmh95QGo4/ezQ2Upn4dTErC6l4R2uwKUe+iE/GUbddyJcmOhJEEvrpeySSUeH6yniIAxxFy8spO
	o9UQbfoq9YbzRvoX4QCn1fDxJFShGhGvuGXLYQahzlF4gmcljhyKv0q6a4EkzWZbtuI5xltWgSyne
	558JzSzoAJRZDrbOTCeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw1DB-0001Zv-9j; Fri, 09 Aug 2019 09:29:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Cv-0001Ov-Q6
 for linux-amlogic@lists.infradead.org; Fri, 09 Aug 2019 09:29:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id s3so5012876wms.2
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Aug 2019 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6Q0Y3h7yEWrHoEt2RLSMUBQOjNzMUTe7TfQE3wYnlhs=;
 b=kUpq+QYUF2AP+g53o7VNnceJybDiC42Ab24kGXiJYFQhUTvY5Ii6uxfOdQ55sYIsbx
 s5pSIl2LzNHFi8hTZ7c3+E6zZ3+ZKJrxV3kAZuKZERubWhLcrhXjn0jO/Hkub4ofUb7O
 stLFVMUeb9vqKrqzQR+6h4I4Em2ADshXffM3SL1KUsw16u/i9m1XrtGw/O6FKfpVLPX3
 UqQZrpYIRjacTYdUnH730IejJeKI9AXQ5RyPpBsAZXtTJijRwdPQNmKNvAUn9WYG+d8t
 KLMw5i/BaEIkkG0usvpn2FWz3lTfdehAYUJTFe9mW41BZoPWShvPMVKpvmc2wMzteofz
 1VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6Q0Y3h7yEWrHoEt2RLSMUBQOjNzMUTe7TfQE3wYnlhs=;
 b=mgjPIoDCLjtdkISEpwayMGe087gcy2coKZ+3CYdmpe1y+we7264wChgyhjYdIV1rI8
 qT2XNrQ6guh3wys5PpLuwvJXhq3gpOxYSNc6umfot1bZtfLWcBnpdxPq9nqB7VWxUoet
 IblmvNfEsfE4j5hVCBdLixQ2kwQ+TpA7NfZMJzJqYklMQk9GW1IkhcWlDtEs1WNy77G3
 FxZMlAcRb+TgNCgnWuRFrwHsJV8XLxm7m+LS02UgR9xJdDLxaCeLJogM3/DxzNsCLIfT
 pNHykXbFRoKasS7SmojV74w46L+NQL03xKsq7GVf0+AkgpowmM6hacpA7qp9BDLzadpw
 OlUw==
X-Gm-Message-State: APjAAAXypBF5jJ1iN+Z9pjKp/iNWeG34CGzgu/ZUq1fYJYOhdKjNdUnT
 wuAEhfnDaw8Od0NWcltu7/nkjA==
X-Google-Smtp-Source: APXvYqyt6rtWp4t2KHhU5vpN9slMJax8fLtefttjl0W0/qzfs5/Md0ZfirCydIKVsbeBtGiVBRAaQQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr9569284wmc.13.1565342947567; 
 Fri, 09 Aug 2019 02:29:07 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s3sm5656853wmh.27.2019.08.09.02.29.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 02:29:07 -0700 (PDT)
Subject: Re: [PATCH 0/9] drm: meson: global clean-up (use proper macros,
 update comments ...)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Julien Masson <jmasson@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com> <7ho92mwor0.fsf@baylibre.com>
 <61b73415-73be-bb72-37f4-0a6060f85ffa@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9f566ec3-ed9a-e3f5-e77c-5ecd91658015@baylibre.com>
Date: Fri, 9 Aug 2019 11:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <61b73415-73be-bb72-37f4-0a6060f85ffa@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_022909_907071_C129B167 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Julien,

On 08/08/2019 16:12, Neil Armstrong wrote:
> On 25/06/2019 01:24, Kevin Hilman wrote:
>> Julien Masson <jmasson@baylibre.com> writes:
>>
>>> This patch series aims to clean-up differents parts of the drm meson
>>> code source.
>>>
>>> Couple macros have been defined and used to set several registers
>>> instead of using magic constants.
>>>
>>> I also took the opportunity to:
>>> - add/remove/update comments
>>> - remove useless code
>>> - minor fix/improvment
>>
>> Nice set of cleanups, thanks!  I especially like the extra in-code
>> comments.
>>
>> Could you also add to the cover-letter how this was tested, and on what
>> platforms so we know it's not going to introduce any regressions.
>>
>> Thanks,
>>
>> Kevin
>>
> 
> Apart the wrong magic value in patch 4 that I'll fix while applying,
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> I'll run a few tests on all the supported SoC versions:
> - GXBB
> - GXL
> - GXM
> - G12A/G12B

Tested on :
- 1024x768x60 DVI Dell monitor
- 3840x2160x60 HDMI2.0 Samsung TV

Tested :
- Simple DMT mode
- Advanced HDMI2.0 4k60 mode with SCDC negotiation and scrambling
- OSD layer and scaling
- Video layer and scaling

SoCs:
- GXBB: meson-gxbb-odroidc2
modetest -M meson -s 32:1024x768-60 -P 33@37:1024x768@AR24 -P 35@37:1024x768@NV12
modetest -M meson -s 32:1024x768-60 -P 33@37:1024x768@AR24 -P 35@37:1024x768*2@NV12
modetest -M meson -s 32:1024x768-60 -P 33@37:512x384*2@AR24 -P 35@37:2048x1536*0.5@NV12

modetest -M meson -s 32:3840x2160-60 -P 33@37:3840x2160@AR24 -P 35@37:3840x2160@NV12
modetest -M meson -s 32:3840x2160-60 -P 33@37:1920x1080*2@AR24 -P 35@37:3840x2160*0.8@NV12

No visual issues

- GXL: meson-gxl-s905x-libretech-cc
modetest -M meson -s 34:1024x768-60 -P 35@39:1024x768@AR24 -P 37@39:1024x768@NV12
modetest -M meson -s 34:1024x768-60 -P 35@39:1024x768@AR24 -P 37@39:1024x768*2@NV12
modetest -M meson -s 34:1024x768-60 -P 35@39:512x384*2@AR24 -P 37@39:2048x1536*0.5@NV12
modetest -M meson -s 34:3840x2160-60 -P 35@39:3840x2160@AR24 -P 37@39:3840x2160@NV12
modetest -M meson -s 34:3840x2160-60 -P 35@39:1920x1080*2@AR24 -P 37@39:3840x2160*0.8@NV12

No visual issues

- GXM: meson-gxm-khadas-vim2
modetest -M meson -s 32:1024x768-60 -P 33@37:1024x768@AR24 -P 35@37:1024x768@NV12
modetest -M meson -s 32:1024x768-60 -P 33@37:1024x768@AR24 -P 35@37:1024x768*2@NV12
modetest -M meson -s 32:1024x768-60 -P 33@37:512x384*2@AR24 -P 35@37:2048x1536*0.5@NV12

modetest -M meson -s 32:3840x2160-60 -P 33@37:3840x2160@AR24 -P 35@37:3840x2160@NV12
modetest -M meson -s 32:3840x2160-60 -P 33@37:1920x1080*2@AR24 -P 35@37:3840x2160*0.8@NV12

With the following fix on patch 4:
========><====================================
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -98,7 +98,7 @@ void meson_vpp_init(struct meson_drm *priv)
                                    priv->io_base + _REG(VIU_MISC_CTRL1));
                writel_relaxed(VPP_PPS_DUMMY_DATA_MODE,
                               priv->io_base + _REG(VPP_DOLBY_CTRL));
-               writel_relaxed(0x108080,
+               writel_relaxed(0x1020080,
                                priv->io_base + _REG(VPP_DUMMY_DATA1));
        } else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
                writel_relaxed(0xf, priv->io_base + _REG(DOLBY_PATH_CTRL));
========><====================================

No visual issues

- G12A/G12B: meson-g12a-sei510

Issue found in patch 5, the following fix will be applied while applying onto drm-misc-next :
========><====================================
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -407,7 +407,7 @@ void meson_viu_init(struct meson_drm *priv)
                               VIU_OSD_BLEND_HOLD_LINES(4),
                               priv->io_base + _REG(VIU_OSD_BLEND_CTRL));

-               writel_relaxed(VIU_OSD1_POSTBLD_SRC_OSD1,
+               writel_relaxed(OSD_BLEND_PATH_SEL_ENABLE,
                               priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
                writel_relaxed(OSD_BLEND_PATH_SEL_ENABLE,
                               priv->io_base + _REG(OSD2_BLEND_SRC_CTRL));
========><====================================

modetest -M meson -s 34:800x600 -P 35@39:800x600@AR24 -P 37@39:800x600@NV12
modetest -M meson -s 34:800x600 -P 35@39:800x600@AR24 -P 37@39:800x600*2@NV12
modetest -M meson -s 34:800x600 -P 35@39:400x300*2@AR24 -P 37@39:1600x600*0.5@NV12
modetest -M meson -s 34:3840x2160-60 -P 35@39:3840x2160@AR24 -P 37@39:3840x2160@NV12
modetest -M meson -s 34:3840x2160-60 -P 35@39:1920x1080*2@AR24 -P 37@39:3840x2160*0.8@NV12

No visual issues

> 
> and push to drm-misc-next.
> 
> Neil
> 

Applying to drm-misc-next with the fixes

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
