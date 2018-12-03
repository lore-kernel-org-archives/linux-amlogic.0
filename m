Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE26C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 14:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEDE52082F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 14:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u9z9ZkhW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvcu1RbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEDE52082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maZVXCL/+ZyxkFVnE45ZuDp1MKZKU5p0oS7W5MLEcsQ=; b=u9z9ZkhWiSyMNG
	VW39jZ9PyLvQ/6ydcScP9YAsf4u7ZQtt1LYBz5TWBPA+K6Ys3pPm5MrwbeEsQL8caFABfrjt2URCZ
	eVfySbP5jNTaXAnbD7a76Suyr7xaeS5x9KQ3qz7fdYLIS0sheqwshb9G0dLbxbRSGmxSIuE4J1yT0
	5MxA+9WAg9qDSRnOns51l0vuroGqFNmf1D6CAJsXtBBNmqj2iZQO2Rymd0xZ2oANaTalxsCiEjiaG
	hAJYzj3IlJF30EmOCMmJueTPJNbef2mPa+Yla70azzVWSCDYnLdiE39qzOPcO03NbSfXWlgxMT8lg
	wp1JXPiJwZ7FuoC8w2gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTpYc-0002vh-5a; Mon, 03 Dec 2018 14:50:46 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTpYZ-0002v2-7y
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 14:50:44 +0000
Received: by mail-pl1-x641.google.com with SMTP id p8so6603080plo.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 06:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LjiDNC3+i8Yto80bwvg30vwi7mkUXXXxWbLMnLl+3j8=;
 b=gvcu1RbVNcCrm3rCgtkExtdfspNNfjhHS//lVoJmnHW8n40FnLHVrORrHhRdyd4nTO
 DqVTkP+bUhXfy0yquh2mw0U98O+dwF+QuruKWaeQEyP3hIP7aDlUzDxEP8Pd2Z4rZTsf
 vGJXvYSZgWkpFWpTl2JNMXoQiCKQu5yJsH5JGSmcfHM1kruF1Eqdp3Su4dT8LE25MQy6
 NgBhdkM/IoZESahGJxXhFHPVoxbuQU3jjAjROb/eLYWbpDro94WZEbMzz2pkHlxTpHKR
 OikghHaqTLpv07nrSonKBL038nZbh2N0wj+Fk+yxzfTtr1kvHakIrI9oKEHhABQX1Gu2
 2W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=LjiDNC3+i8Yto80bwvg30vwi7mkUXXXxWbLMnLl+3j8=;
 b=AIbxQfFLB1pjSRu++9OULnsZ+qgXJBRCtJNyOgeh/dL61wdMRjqz+tkqADmtj9vzxk
 PNUzXaQ7JNMloo/TDeoW4vxgRTPTM6fCrEuMTmLRxmdrVf6ZG3nSrWfy4f0WzfCsyP6w
 5l1EDC3R3bULwr8PXWCQSdWiQL/LLdwKf6Sa/a+ZzCsWfcyvqxflObXq4udCBV15rhgY
 KVFD5h40dxukAKwgV8MYVed8KAnsv4HT+OwUNjo/H5B4FfM1jh5g2AwBEYlNHj6e36hf
 DXu872r85fR25+dF9IMf8k4o04e7t1QQKycXTKe8FN24DsvnzmAZ5LK1GFDcKY648r+9
 /WMw==
X-Gm-Message-State: AA+aEWYOFvxwmbxI2+4Zrma2vo+iynLNJ1ybYHbTrFd5K4NcxqmIjpeD
 0/2zLCgL7/De93b1QDmdVxQ8H1JGiPc=
X-Google-Smtp-Source: AFSGD/X5O1Arjg4tK+yw3k+qNqorjLluU9rJOWkUuWP2pyhMHTEksPEW5P53vTw1Yc2qCY715izD4g==
X-Received: by 2002:a17:902:2a0a:: with SMTP id
 i10mr15906554plb.323.1543848631778; 
 Mon, 03 Dec 2018 06:50:31 -0800 (PST)
Received: from raspberrypi ([45.76.192.69])
 by smtp.gmail.com with ESMTPSA id g185sm10916227pfc.174.2018.12.03.06.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 06:50:30 -0800 (PST)
Date: Mon, 3 Dec 2018 22:50:17 +0800
From: He Yangxuan <yangxuan8282@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: Amlogic support on Alpine Linux
Message-ID: <20181203145017.24t25ifljc734pga@raspberrypi>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
References: <20181128152257.nhrirxtxlsll6735@raspberrypi>
 <b4fea03d-4446-6512-78f3-6fad6dfc3700@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4fea03d-4446-6512-78f3-6fad6dfc3700@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_065043_281320_D9FC9905 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

> On Wed, Nov 28, 2018 at 04:54:53PM +0100, Neil Armstrong wrote:
> Hi Yangxuan,
> 
> On 28/11/2018 16:22, He Yangxuan wrote:
> > Hi Neil,
> > 
> > The alpine kernel package `linux-amlogic` have been merged in alpine upstream:
> > https://github.com/alpinelinux/aports/commit/8dc0e43d5a410a6f173c14caaa625adaf45f11f4
> > The current kernel config only include arm64, maybe somebody can add armhf or armv7 
> > kernel config later.
> > And alpine u-boot package have add Odroid C2 support: 
> > https://github.com/alpinelinux/aports/commit/706b2721976b16d73274f23966f3f1a5735bf301#diff-bf45357b9515f24851da3b650e49829e 
> 
> Good news, thanks for pushing this !
> 
> > will add Khadas Vim and Nanopi K2 in alpine u-boot package later. 
> 
> Could you also add the libretech-cc ?

I have created git PR for libretech-cc: https://github.com/alpinelinux/aports/pull/5739
 
> > So after the alpine builder build the package, we will have basic support for amlogic
> > devices in alpine.
> > I'm thinking about package mali driver. Based on this mail: 
> > https://lists.infradead.org/pipermail/linux-amlogic/2017-June/004092.html
> > and Joseph's archlinuxarm package:
> > https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/dkms-mali-utgard-meson
> > https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/mali-utgard-meson-libgl
> > https://github.com/archlinuxarm/PKGBUILDs/tree/master/alarm/xf86-video-armsoc-meson
> > I have wrote the alpine APKBUILD for those three packages.
> > Most part is same as Joseph's work, but use your repositories as source. 
> > Actually I want to add wayland support and video acceleration.
> > In your this releases: https://github.com/superna9999/meson_gx_mali_450/releases/download/for-4.15/buildroot_openlinux_kernel_4.9_20180131_mali.tar.gz
> > there are several libMali.so (r7p0/m450/dummy,fbdev,wayland,r7p0/m450-X), I should use which one for wayland or video?
> 
> For wayland you should obviously use the wayland one, but this one is buggy, you should take the ARM HiKey binary instead at https://developer.arm.com/-/media/Files/downloads/mali-drivers/user-space/hikey/mali-450_r7p0-01rel0_linux_1arm64.tar.gz?revision=b8764bbe-c4d6-4825-a0d9-bceca4ee4b2d

I have tried the libMali.so, both of them work on debian stretch, but none of them work for alpine:

```
phicomm:~# LD_LIBRARY_PATH=/usr/lib/mali weston
Date: 2018-11-29 CST
[23:39:18.762] weston 5.0.0
               https://wayland.freedesktop.org
               Bug reports to: https://gitlab.freedesktop.org/wayland/weston/issues/
               Build: unknown (not built from git or tarball)
[23:39:18.763] Command line: weston
[23:39:18.763] OS: Linux, 4.18.18-0-amlogic, #1-Alpine SMP PREEMPT Tue Nov 27 13:19:48 UTC 2018, aarch64
[23:39:18.763] Starting with no config file.
[23:39:18.763] Output repaint window is 7 ms maximum.
[23:39:18.763] Loading module '/usr/lib/libweston-5/drm-backend.so'
[23:39:18.765] Failed to load module: Error relocating /usr/lib/libweston-5/drm-backend.so: gbm_bo_get_offset: symbol not found
[23:39:18.765] fatal: failed to create compositor backend
```

Maybe this related to alpine use musl instead of glibc(from readelf output, 
libMali.so need some glibc related shared library)? And if lima work for amlogic wayland now?

> For video acceleration, Mali is not involved her at all.

Still trying to get video acceleration work based on this posts:
https://forum.odroid.com/viewtopic.php?f=135&t=22717&start=900
Seems Maxime have got mpv with v4l2+drmprime in zerocopy use r7p0/m450/dummy/libMali.so .
 
> > And besides xf86-video-armsoc-meson do we still need xf86-video-fbdev or xf86-video-fbturbo?
> 
> 
> No, the armsoc driver doesn't need other x11 driver.


Yangxuan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
