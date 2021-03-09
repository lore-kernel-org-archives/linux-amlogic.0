Return-Path: <SRS0=upr3=IH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121CFC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Mar 2021 17:13:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653AA64FCF
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Mar 2021 17:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653AA64FCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EHIAJXeMKKWfIhRTitS7bC4EOyL5aif3b42hLZ8OpBs=; b=K0VndTJW5w5LBeVudzTJpHqQK
	YSjzPoemodUSf4hstVs/47/z3x86QMvDPHfE0G4WETqsRonCvSEWkgLnJ+/SN8ErKSX24pEvnG7Tt
	EYkphyyqf4P2pCPmGLdMS2QFSFHN8819Guz0aIxGGVH60r5RIE6m55/YMxmCt8nK5o9QjCGYe8pst
	ahDzq/xapvAeVBFSLhfnKrDaRQ+0buLTCRK4uEV0LDrh1/PdUjFWsz0W7gDB349LhdE5zXX/xe+p+
	QG2hDeqMOHXkeKI8zDGPGme6YfUIdO8B2EVoszgVTFyKk4B0t0RUmyA+Au70HdphhqZiQ0e8lpYS0
	fmLeDHI7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJfvC-005A4r-7L; Tue, 09 Mar 2021 17:13:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJfv8-005A46-SO
 for linux-amlogic@lists.infradead.org; Tue, 09 Mar 2021 17:13:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j2so17148497wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Mar 2021 09:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4E4B2xlaHTkAbKCLQY2tzB0M/UIewZVxgvZlKvBiH3c=;
 b=RVsnzzQTkYEgUiAsEVrcRaREJuZFvSe4TRwZIDnUXyIkpZK49/ZplAaPJC7OfFBVq2
 Z2IMQVsOZmxMf4GKRU0ZhAyP1m4Xw6WaNYixtf9mTvY5XNqsgc8Lyf2skbyUga2Tazxj
 5cbaY85hQ+NFkOLU9Cs8W0y0s5OWQnAQrGXWxk3gYfPV/4fUE55OFJ8LFWTDid1Zn2Cb
 aMr22NDluvqyYBd1hEjx6/o7l5yXk5pYNZhW2l/RXHx9iHo3Thpwt78EyVxuxkTRRtF6
 wgXEBShh1YZvfuzOgf7m22JRcpvybK7LcVtUYJ78S0Gki1CNNvnftxipXzzMg4na1rvK
 DQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4E4B2xlaHTkAbKCLQY2tzB0M/UIewZVxgvZlKvBiH3c=;
 b=NWRMxZK+l1C3XrWgq3lIX/CCYkBvLby7vqsi/MFLSSlNaztHPcVVw/dyg/G0PwXXji
 Xq8GSrCMiJRZFSwnoe2SqRQY3FkkhXJGGgt+FWkGPD5dTXJSl/UjCCEaT47yabtyGWwQ
 WU6oND3gfyux9bkLSPPT78gbhAiYbGdLSW7KqSto1n9RU5nfbsH06k3WGfYdPBFMZF0F
 V3bkJkEZAxwxtXTVj8T6jEQW+av9E1sh4EyC9FGlcWuB/t3ObnoivHZRe1RY9UKmDQc4
 ug0LhNVgPRYP2yxs3KrPo9mkYtk5Yq7QKzY3ciIvLPdRPWzPyQW4C2LAS+aGaNhRGoYW
 EF4w==
X-Gm-Message-State: AOAM530Wo7ETLnNV5SEUbtKh29sJvwonz9ubgXwmFSEPJ1lqUMUWKVHj
 LgCeF25ChZYarFqmqiRuj0CdvA==
X-Google-Smtp-Source: ABdhPJzCiTPqXsdBsijJuz9fKcjPAaAFMc1RGe6N/8X9SFcamHDYHh/oNSfb6gjkDrGMgryfSvxGJQ==
X-Received: by 2002:a5d:548c:: with SMTP id h12mr29519223wrv.46.1615310002233; 
 Tue, 09 Mar 2021 09:13:22 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f7sm4751268wmh.39.2021.03.09.09.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:13:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Artem Lapkin
 <email2tema@gmail.com>
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
References: <20210302042202.3728113-1-art@khadas.com>
 <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
Date: Tue, 09 Mar 2021 09:13:18 -0800
Message-ID: <7h35x42qtt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_171323_127517_4F9A313A 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Neil,

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 02/03/2021 05:22, Artem Lapkin wrote:
>> Problem: random stucks on reboot stage about 1/20 stuck/reboots
>> // debug kernel log
>> [    4.496660] reboot: kernel restart prepare CMD:(null)
>> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>> ...STUCK...
>> 
>> Solution: add shutdown function to meson_drm driver 
>> // debug kernel log
>> [    5.231896] reboot: kernel restart prepare CMD:(null)
>> [    5.246135] [drm:meson_drv_shutdown]
>> ...
>> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>> [    5.338331] reboot: Restarting system
>> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
>> bl31 reboot reason: 0xd
>> bl31 reboot reason: 0x0
>> system cmd  1.
>> ...REBOOT...
>> 
>> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
>> and Odroid boards, WeTek Play2 (GXBB)
>> 
>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> 
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 42c5d3246..693bb1293 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>>  	return count;
>>  }
>>  
>> +static void meson_drv_shutdown(struct platform_device *pdev)
>> +{
>> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>> +	struct drm_device *drm = priv->drm;
>> +
>> +	DRM_DEBUG_DRIVER("\n");
>> +	drm_kms_helper_poll_fini(drm);
>> +	drm_atomic_helper_shutdown(drm);
>> +}
>> +
>>  static int meson_drv_probe(struct platform_device *pdev)
>>  {
>>  	struct component_match *match = NULL;
>> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>  
>>  static struct platform_driver meson_drm_platform_driver = {
>>  	.probe      = meson_drv_probe,
>> +	.shutdown   = meson_drv_shutdown,
>>  	.driver     = {
>>  		.name	= "meson-drm",
>>  		.of_match_table = dt_match,
>> 
>
> Applied to drm-misc-fixes,

Could you submit this as a fix to stable (v5.10+) also?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
