Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458AAC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D881222C8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 21:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1wI3r/m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oSzxXNde"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D881222C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xozkLybX8CrOgvxjG4LLnki59UI1gdKHR1LXbKa299A=; b=t1wI3r/mrS+GE9kFdCB/VtzXO
	Y18+qCja2HNXAGKx7gu7NDkXXyPtoU5HlQ/Ex0Kt0zzJo6ZVVlsX/UQ0RDUHLw/0+B/wtC/JFtW97
	+e9wJQRRzvcBiVcTO04t0cDckXFMnfFBPQEsX/eLP9x/hzfa4D3wIdwiKiP07yn+m1zYG2CyK02yj
	6/JXS8vMaZHkqB5bYfFtemJzD3R0Iu8hHSGWs4DV5TGQ0LpIgb4fehHORlz8jP4Lx25s0jBXHbZpP
	jgu6I9q3YRQl5MIZuWHG2qmosyl5K0BxTS6lLpfj52YbIv1XoFM61jEVEDrF2sEkG8vVs6GdvvMsN
	RE4mcbPyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUywY-0001OC-J3; Tue, 20 Oct 2020 21:13:18 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUywU-0001N3-9U
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 21:13:15 +0000
Received: by mail-pj1-x1041.google.com with SMTP id lw2so1616257pjb.3
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gU3omxdyYeRZWjh0oiaj3k4tGehIx9iHpJbJ9IgLgNQ=;
 b=oSzxXNdegzdewADaZFt5i0rLYZJIt0AS7zy4KS424k4dRyNujNIbbzOQqhNraR9onY
 NAOiZS5R/5IFl9EBYFGbEcTo3TYIIsFyZwqgNfHCWb4easXMUEQwmpWDNWBdaKAoWSPW
 Pk90jUoFeqgqtKHjt8Chn7gTLNdq0yJLEb7h85XQ/5frBWxXuUVK42hZKSLSHI0knPvt
 T4sfYFJLT0lcC50s8V3ReUPsFvpERAaehHteetQ5FaGDfHNFJrLMCa0R0xCBA/F9IovM
 UZ0lEEBks7BogFK6cXykPV8JSmkW9gdEpxxs+0+lycVi9oRFAfugZHAe1aKoVI1Qie5P
 pKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gU3omxdyYeRZWjh0oiaj3k4tGehIx9iHpJbJ9IgLgNQ=;
 b=RY/+8YtlxXUlCABTRwJ6itURERNVEGSiqkNPNBEWgiamEUQCOnYzCaDc2Ls42CTuyx
 1kDWVHSqHJ3q3Qg+iWuGslIPV/i7vqFOeiBa8Q3Z1ixdfjRXbbbyc4Jjn36iIt3Duf2n
 le1i8jtnY+gx974Jxj8EXM7DoAR80mwbENBKHFtmgaFIfahVTJ/MGGZ7jgUHDPx0s+Cs
 L5J3GvV2ckcd46tTNsE5JXq5US0Kv4I9ZnO8Jezz4Ci2mH3cLyHOMnbvJfEKLBsEcm3A
 hjRmHQ6S0mmY4osNOjgq2ijHU8FdEsKliPnCz2X0+Q74PLVVo/SUFbjRVrtCZN1ShDZ8
 C9Kw==
X-Gm-Message-State: AOAM533LJvb1qXYc/fre91VPYp1YbZchOft0c75mTVYDayrlNpvoRznV
 ixmhc/+FORjU6AmPnkxU+NoNBw==
X-Google-Smtp-Source: ABdhPJxVs+dLMW35lkh5MHGvraLBoLQNmCyIsmbz1nTkRK9PAXAnaXF6HC3LD5Q6jq29gcpfqGJnMg==
X-Received: by 2002:a17:90a:ab92:: with SMTP id
 n18mr16492pjq.233.1603228392157; 
 Tue, 20 Oct 2020 14:13:12 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g12sm3219411pfb.170.2020.10.20.14.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 14:13:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] pinctrl/meson: enable building as modules
In-Reply-To: <CAFBinCAXVFjm-aDJ3KFvqcn2Hht2tGOy_O99wggo530xv6McpQ@mail.gmail.com>
References: <20201019230914.26300-1-khilman@baylibre.com>
 <CAFBinCAXVFjm-aDJ3KFvqcn2Hht2tGOy_O99wggo530xv6McpQ@mail.gmail.com>
Date: Tue, 20 Oct 2020 14:13:10 -0700
Message-ID: <7heelsk3dl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_171314_359048_AFED1816 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Tue, Oct 20, 2020 at 1:09 AM Kevin Hilman <khilman@baylibre.com> wrote:
> [...]
>> The default is still built-in, this only adds the option of building
>> as module.
>
> (as of today) the majority of the SoC specific pin controller drivers
> use bool instead of tristate
> my understanding is that tristate can be "dangerous" because if you
> compile a driver as module then your kernel may not boot (I haven't
> tried, but in that case the reset controller driver probably has to be
> added to the initramfs).
> is there something that we need to do about this?

Yes.  We need to test it.

> my thoughts: these
> options default to "y" so it shouldn't be a problem unless someone
> tinkers with their kernel configuration

Correct. I want to keep a working default upstream defconfig, but the
goal of this is to enable the tinkering. :)

I've been testing this, and meson pinctrl driver works fine as a module
(so far only tested in G12A and SM1).  Obviously, it depends on the
bootloader to have some sane default, and in general depending on the
bootloader for this is not a great idea.

In fact, I currently have a kernel booting on meson-sm1-khadas-vim3l
that has everything (including clocks, pinctrl, GPIO IRQs and PM
domains) built as modules.  The clock stuff requires a bit more work,
but there's a handful of patches to enable the rest of the drivers as
modules from Neil and myself over the last few days. 

Kevin

> [...]
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 20683cd072bb..b467ab49539a 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -152,6 +152,7 @@ int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
>>
>>         return pc->data->num_funcs;
>>  }
>> +EXPORT_SYMBOL_GPL(meson_pmx_get_funcs_count);
>>
>>  const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
>>                                     unsigned selector)
>> @@ -160,6 +161,7 @@ const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
>>
>>         return pc->data->funcs[selector].name;
>>  }
>> +EXPORT_SYMBOL_GPL(meson_pmx_get_func_name);
>>
>>  int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>>                          const char * const **groups,
>> @@ -172,6 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>>
>>         return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(meson_pmx_get_groups);
>>
>>  static int meson_pinconf_set_gpio_bit(struct meson_pinctrl *pc,
>>                                       unsigned int pin,
>> @@ -723,6 +726,7 @@ int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>>
>>         return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(meson8_aobus_parse_dt_extra);
>>
>>  int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
>>  {
>> @@ -732,6 +736,7 @@ int meson_a1_parse_dt_extra(struct meson_pinctrl *pc)
>>
>>         return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(meson_a1_parse_dt_extra);
>>
>>  int meson_pinctrl_probe(struct platform_device *pdev)
>>  {
>> @@ -766,3 +771,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>>
>>         return meson_gpiolib_register(pc);
>>  }
>> +EXPORT_SYMBOL_GPL(meson_pinctrl_probe);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +
> please remove this blank line at EOF because there is already one in
> the existing file (with this one there's now two of them)
>
>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
