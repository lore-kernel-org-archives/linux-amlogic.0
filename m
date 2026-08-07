Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ADCC2A09B
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Aug 2026 17:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=thILHkyzDO0/aAkf4CxE4DDBtWWE8WokudOaR+utkfQ=; b=aWl
	3+2JsTV4eHznc8t09PDRTAvdMZRPAmaz0I/T0Ip3iLmtlLADkAQZHFtdWSNJ6SM4ZXu6X9g+KpRXW
	GWK7vWA2unWAsE9nmmKJQyOEACr+D0BCkK9LAhTjab5oygjJJU9ELhHinQStwQyIgy8FcRlSRcuP/
	1zaeIXPFjGHXWiJXcM60TLX4dIAVTNz9eaN7tYpBOIVY8tQWmoRberOMHcmxyFnBP9DFi31VkSeOX
	h81yrUZJpzqXnGrFGf6+nHYxwRnol/RL8hHz6ldSXZCRi4+ZqXi9n9JC9z5V2qE0McwBO9Ni4BzxN
	2VW5eeb3L+ZIEeRiXfzXHR/cHGMa05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOc6-00000008XPT-2Fag;
	Fri, 07 Aug 2026 17:44:10 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOc3-00000008XP7-3FAa
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Aug 2026 17:44:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso3909376e87.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Aug 2026 10:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786124646; cv=none;
        d=google.com; s=arc-20260327;
        b=aUhtf4yYoYek4TNXj/+DFRiKGpYpvHsvFF9/7aEk7o7lzM04YsvmND6OioWNJiSc3o
         8xz7iedSO9/MsJamxSmvrgCGEfuMUIm1Rh3pY7Cygj5iLOWFw55FA9q+VCy56e2iSVo2
         5XuS/Hvs5UrZ+jaT1hUJD7snc7njBidG6NoXpEsnqcl30ZmbtQK+rQ5o59XPzJ6XdFML
         6rdQEN8JGlTmuPnRxy+SQEg0XJ/9uE+R6+LJuWJdJRzuXs+TN1tN42ogtJcfdNrqT8go
         r0Xg3j6FSwbUwNsMFtcFT7QGA7FO0ZCzjSE3ihz0okpLlD2gc7xvHVBlVpYh29FtS1NE
         OlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5nb6cAK5SqnRsqXLmbsLHFNkajRAS7EWgfkW6yziQcE=;
        fh=dDleLVQa7Ya0cgEn9ny6XEKoFSSfmMEcmZRUap46KTA=;
        b=SAJ+566z7O2m/yOcqpW1VxFIioIYe1wxBZIq5/psFiHo1lLbimoL2cuVTR/LVA58l8
         tG2o4TW70BarOiW+C2LkeqQey/ogYwR0NLQVSombj6qE6RamqdZvx0JGWtc2LmLaAWNh
         mmJXMSULQRhdZB8zmx6pueBK1qsAPGeGWxSj7yE6T1Rgc4GA5h/xF3iyHrNeidnXI2PT
         rR/j1rB5AoztbE6xbUX3UJAl7KwikbWJU0iCLvRIQr8ZEnfJwu6xuSSDbYYEDo4krg+2
         93Gyn9DQy9NLsGJf4UGcB2SDDrJOOtaHlecdHw1TaCrY3AcJNHdB17hjeCbOsYfDAHMp
         TMUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786124646; x=1786729446; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5nb6cAK5SqnRsqXLmbsLHFNkajRAS7EWgfkW6yziQcE=;
        b=LhJN+iQDcD68UuoWzOGzavA/wElkBixPwMuQMKhhOkc4dHy0QrLvFESmAskPAd+2HC
         d4i1cv2jUOlhwovxaZN+KGeZ3nZgIQnrTIrk0U8Z1jhoSa7LTTlSoFtRuGVWVCDfTkDL
         9YY8eEAfqgn3uDFY9FKnHWmALgwaGNbrnaTrxXs1oLKuxREDgC63Y5L4SkCu6NFMaBY7
         lZbXQKmgCKAf3cBx14AUrloligsNQPlNdlERv1vt5Nc1b8cZinyXYnJ2JWNcA2FhX9Ar
         HDZY6GoeDoum2j7dMo4tyV+HkQVSRalnwZSn8Y62CxhRuf8f60XG7aBm2cX1tRXV/Aou
         A6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786124646; x=1786729446;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nb6cAK5SqnRsqXLmbsLHFNkajRAS7EWgfkW6yziQcE=;
        b=RRrb7KWk4tPKm6rUyqvlsXwBj4zK3L2spMfhVVQd/VjCj3zJsiGQPOoXSUeR76HYBS
         Mjmhm5+ayxkcB/PsGCvzUcu3Qcp5jEqyHrWxrP3b9+Swu0tWFnCSek5mKK7sN3Xp7dzz
         QgTx3Drd9rFITpenhV+tmR8ex1af+eHq3TgmOAWR5qRJZOqOZHwovWMduUq1C6sb/rxD
         b4HIu6RWZ28/WYZ3sMB5ToHLfSSpPN2hc7Ad+jbs/dOffaPeFkvkjyj07+3TPxqtdsrB
         +8zhClDDs0qt/fWDjno71t1jbDrEc5xn5gb1gNwWq1Ln67PaiOWxZIG+P1c1xMSLkNKo
         nhnQ==
X-Gm-Message-State: AOJu0Yxd1Ztx2yDrS3Mys2raTleIPLdXG16SrL7lc6eAaMAsI6Kk44lM
	IXob4TCiNLZerfzIYnHVUMjSSJX1TdijxNiE9VyJFjPWM3XfRDitPJxsExscsXXwCD558d7iGvW
	AXbEpT8Ya6QOGsbpTBd9evj/9yr7SIAB9tKrs/oI=
X-Gm-Gg: AR+sD13jH6A5ZIfhYD3BV3xnuUfUlORfRHaSar2FuQM35zkGBPsvxEHJ2nfpZ8QngXM
	y+koDTIpGA02dMbcNvS00auKh23LeTDhk9xkzq7StUAUu0XsdrTQmYBSwq890ncgnoXXnzyjxWQ
	M16iWyzi/9aG4cxgkSr6RQLdHXuexz5Xzt+ewms8VVdlhKcMRDvFvzo5O+RciYhuUltHNshHCkY
	ttQD6Q9Uy+XbZjcSyJcqgCKDwq6BLbtXIooVgbkd6o6maWZTeRsBapjxZBTSkhAQbFOGMmXzhUm
	1d2u26ARj1aZTkErq2FcUapjyLNUb6v+E+o1KVHdh22p4I6imGK9w/iJF2xzFhkum5zJEFTs6rp
	wXw==
X-Received: by 2002:a05:6512:ad0:b0:5b1:5f8f:bc1e with SMTP id
 2adb3069b0e04-5b2f4b886bdmr3773788e87.3.1786124645476; Fri, 07 Aug 2026
 10:44:05 -0700 (PDT)
MIME-Version: 1.0
From: Steve_vr <sstevevr@gmail.com>
Date: Fri, 7 Aug 2026 20:43:54 +0300
X-Gm-Features: AUfX_mxbEXxhITWnT6WT0MR1ugniCfbAEond0TDwKasMi9YRRrBAHX5jx4PZU60
Message-ID: <CAK3gv+eeCs+9ipTkoGzd0eopEax6pvM02wvgCwyr-LRjNSL14w@mail.gmail.com>
Subject: GXL/S905X HDMI: 1440x900 DMT mode fails to display despite clean
 modeset (meson_drm)
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_104407_856511_7FA7DCFD 
X-CRM114-Status: GOOD (  11.36  )
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

Hi all,

I'm debugging an HDMI output issue on a Meson GXL S905X box (board
gxl_p212_v1, Megafon M8S Pro+ Android TV box, now running mainline-based
Armbian/meson_drm from unifreq/linux-6.12.y). I'd like to check whether
this is a known limitation or something worth digging into further.

Setup:
- SoC: Amlogic S905X (GXL), compatible "amlogic,meson-gxl-dw-hdmi"
- Monitor: Acer V193W, 19" LCD, native 1440x900, VESA DMT, vsync range
  55-75 Hz per datasheet
- Kernel: linux-6.12.y (unifreq tree), meson_drm builtin

Problem:
Setting the HDMI mode to 1440x900 (either the EDID-probed native timing
via `video=HDMI-A-1:1440x900MR@60e`, or an attempted CVT-RB timing at
~88.4 MHz) results in a completely black screen, but the kernel log
shows a clean, successful modeset with no errors at any layer:

- meson_hdmi_pll_find_params() computes valid PLL parameters for both
  the ~88.41 MHz (CVT-RB) and ~106.5 MHz (EDID native) pixel clocks
- meson_venc_hdmi_get_dmt_vmode() builds encoder timings generically
  from the DRM mode's own htotal/vtotal/hsync/vsync fields, same code
  path as working modes
- meson_hdmi_phy_setup_mode() in meson_dw_hdmi.c places both 88.41 MHz
  and 106.5 MHz in the same "<148500 kHz" PHY tuning bucket as our
  known-working 1024x768@60 (65 MHz) mode, so PHY register values
  (HHI_HDMI_PHY_CNTL0/CNTL3) are byte-identical to the working case
- meson_vclk_set() and the atomic commit both report success, fbcon
  switches over correctly (confirmed via console over the framebuffer)
- No DRM/HDMI errors, warnings, or link-training failures anywhere in
  dmesg with drm.debug=0x1f

By contrast, 1024x768@60 (65 MHz) on the exact same monitor/cable works
correctly and displays immediately.

I found the original DMT-support patch ("drm/meson: Add support for
DMT modes on HDMI", 2018, Neil Armstrong) only vendor-tested 7 specific
resolutions: 640x480@60, 800x600@60, 1024x768@60, 1152x864@75,
1280x1024@60, 1600x1200@60, 1920x1080@60 -- with timings sourced from
Amlogic's internal vendor tree. 1440x900 was never in that list. A
later patch made the DMT timing/PLL calculation generic, but I haven't
found evidence the generic path was validated on real GXL silicon for
resolutions outside the original 7.

My question: is there a known PLL lock-range or signal-integrity
limitation on GXL's HDMI PHY around the 85-110 MHz pixel clock range
that would explain a clean software modeset producing no picture? Or
is this more likely a monitor-side CVT-RB/timing-tolerance issue
rather than an SoC limitation? Is there a recommended way to debug
this further (e.g. is HPD/link status actually verifiable beyond what
drm.debug shows, is there a known-good register dump to compare
against for a successful vs failed link), short of using a scope on
the TMDS lines?

Happy to test patches or provide more dmesg/edid-decode output if
useful. Full technical writeup (mode strings tried, dmesg excerpts,
PHY register values) available on request.

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
