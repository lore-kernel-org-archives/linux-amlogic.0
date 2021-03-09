Return-Path: <SRS0=upr3=IH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF25C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Mar 2021 17:51:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D358464FBD
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Mar 2021 17:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D358464FBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7E7X+jbEPKeLfPT5SWfuu7EvG9pVhCNWLwbfT/U1TRg=; b=hsORqo3dNtz821xz/klVnQrGH
	l+trThB5O+8LfL/9afl2/iLzs5FdzNwGyW3/cfz03QIc4FAfOTUvh8q/DmiiOTTcQL3m3Ou7T/NTA
	iZqmwU6HkOG3mN0EYjrMOnHBaVh54Iqgq02hRxudwgbJArsQ46omq0hB69ybUBbuVHnjvliKwQFnJ
	/1ddkUzNgN8b7AZ/qDDTLS8f2DA1S60S3uB7RH9JqUqKq4Y9uAx4flYErd3ns1YTuZUt9VeHKcFAb
	lB3YM2SrHDRytxUZJ+wk6U2Ue3zHj2Y3obeo7RPD5ZcFuza+j4cPyaGLI15PaOEpq07ZJQt2hcDGA
	AS8zrjZMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJgVb-005Cpu-2r; Tue, 09 Mar 2021 17:51:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJgVX-005Cp7-CI
 for linux-amlogic@lists.infradead.org; Tue, 09 Mar 2021 17:51:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j2so17389132wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Mar 2021 09:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PSGONzx2Ya+di7nElWWfqOMSTg8+wvD3eIGbn+Kjutk=;
 b=xQYm8NA5H7xR0Mb/UnWTUAqPBBTN8AGqoPttojus/GNCJws2+bpQ9yNGNu/0AxSNO+
 0wui42n9GgfEW2bMQ4prZM6EsW6SXP7mibj9cP7VwgB4Jds2ts9cLMwU7R3cjLsUcEXv
 msZCftTl2tT4sLHrTfVYUbPfWTGrNfqzzrte2A9RpIuM1xJAiu2IDWLkL1fvIO+mlZ6f
 5ztWF0gqafsJpHa4+pN4cbYnKaEbh3rCzehR9f+8Iue4sA8+NKHwkYmchYy5ELF//4UR
 39mzQUbHx88gsoAdqKuQ3qPLus/cUYbLrksvGevzTafRuN3TxGqYjk/+tL6qrQKaRXTl
 ikrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PSGONzx2Ya+di7nElWWfqOMSTg8+wvD3eIGbn+Kjutk=;
 b=tuo7BUsMZLhUmBVEw/Z+nnjJV0cVgJVB5fVURjtYfQIMR4MtuBIxBjh4ezqHfHojfY
 H6fijBXbpSA2M7daHN5NqhrF6ZZx0lwe8CmYDhDUduALt+CX0pTFA3gq0Ifm5gZuJ97G
 hw87guubDqOqLr7WiQEmn4YipxEgMjkJmsnN3r6GtK9SDLyWqer0gGNhwgkUxmXOLEPq
 KESQQwMhnQePAwv7iGIG5IxZdo4uwX4YpCjHUQ8SernYCT4FMn2ZRJlbdrl9fl0FhXYG
 DaXLnsyl7oQp55c6rJo13FE7UX8cvpXE9PaWxIMykYs5KYWfF1Z2efwUpWq170xHwWyg
 2tVg==
X-Gm-Message-State: AOAM533Nhtn5SnGb983SFXaWlfsd/Hl6+8yCwEgIII6p/5aQvsUNLLBV
 bxea7jOMC01K4K3tpjt4Jik5fw==
X-Google-Smtp-Source: ABdhPJx6O1YNb6LTVAzGe9AUvxoHuTLhAIagg8uSiEpnK4QkbVPjoX9N4aSrcaXhp0uzi/qs8arR6g==
X-Received: by 2002:adf:de92:: with SMTP id w18mr29187690wrl.217.1615312258048; 
 Tue, 09 Mar 2021 09:50:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u23sm5155822wmn.26.2021.03.09.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:50:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Artem Lapkin
 <email2tema@gmail.com>
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <875c606f-baf9-f92a-4820-39d3d7312607@baylibre.com>
References: <20210302042202.3728113-1-art@khadas.com>
 <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
 <7h35x42qtt.fsf@baylibre.com>
 <875c606f-baf9-f92a-4820-39d3d7312607@baylibre.com>
Date: Tue, 09 Mar 2021 09:50:55 -0800
Message-ID: <7hsg541aio.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_175059_565772_F8A3D58D 
X-CRM114-Status: GOOD (  12.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 09/03/2021 18:13, Kevin Hilman wrote:
>> Hi Neil,
>> 
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> On 02/03/2021 05:22, Artem Lapkin wrote:
>>>> Problem: random stucks on reboot stage about 1/20 stuck/reboots
>>>> // debug kernel log
>>>> [    4.496660] reboot: kernel restart prepare CMD:(null)
>>>> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>>> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>>> ...STUCK...
>>>>
>>>> Solution: add shutdown function to meson_drm driver 
>>>> // debug kernel log
>>>> [    5.231896] reboot: kernel restart prepare CMD:(null)
>>>> [    5.246135] [drm:meson_drv_shutdown]
>>>> ...
>>>> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>>> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>>> [    5.338331] reboot: Restarting system
>>>> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
>>>> bl31 reboot reason: 0xd
>>>> bl31 reboot reason: 0x0
>>>> system cmd  1.
>>>> ...REBOOT...
>>>>
>>>> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
>>>> and Odroid boards, WeTek Play2 (GXBB)
>>>>
>>>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>>>
>>>> ---
>>>>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>>>> index 42c5d3246..693bb1293 100644
>>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>>> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>>>>  	return count;
>>>>  }
>>>>  
>>>> +static void meson_drv_shutdown(struct platform_device *pdev)
>>>> +{
>>>> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>>>> +	struct drm_device *drm = priv->drm;
>>>> +
>>>> +	DRM_DEBUG_DRIVER("\n");
>>>> +	drm_kms_helper_poll_fini(drm);
>>>> +	drm_atomic_helper_shutdown(drm);
>>>> +}
>>>> +
>>>>  static int meson_drv_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct component_match *match = NULL;
>>>> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>>>  
>>>>  static struct platform_driver meson_drm_platform_driver = {
>>>>  	.probe      = meson_drv_probe,
>>>> +	.shutdown   = meson_drv_shutdown,
>>>>  	.driver     = {
>>>>  		.name	= "meson-drm",
>>>>  		.of_match_table = dt_match,
>>>>
>>>
>>> Applied to drm-misc-fixes,
>> 
>> Could you submit this as a fix to stable (v5.10+) also?
>
> It should be done automagically since I added the Fixes tag

Oh, I didn't see the fixes tag, sorry.

Thanks!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
