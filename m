Return-Path: <SRS0=Qsxt=JM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED905C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Apr 2021 14:29:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D85761139
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Apr 2021 14:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D85761139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDPMs9bVsmzx2+Q+94NcP6Do+J6ZatbO2caN62zexD0=; b=Urq6au8zmQ5Xxh
	lbYS5HmfolCR6Gs1EvqKYiNr55dGvdwhyFtra4ObeJ4exlV+mpPTfrNw6r+7AXZi66oEQDvQwkFhW
	Hja7Ksoa3P98HmLZJN6ENMeDHmjyCsbtg0ul/J4jMdBewoOG+N/D7YyTd9omKXW3BtZb4D2OXi/lD
	xdf91AftS3M1ZUB0fe7ZTQC7r/ohanQPOrLUv9OotQLmQul33phXCEkmnvoH7HQLb6zK+4mHqfvpU
	dire+pydzRdXjoX8dK5T6sHb/7H5DtP1gA2Pz48g7HfVou2jOpBn1//WC3Xb645SYe50PWjczOuf9
	dw8irvbAtbz4ukvCQTGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2zP-00GRak-2e; Thu, 15 Apr 2021 14:29:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2zB-00GRXu-Rv
 for linux-amlogic@desiato.infradead.org; Thu, 15 Apr 2021 14:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=921/pZ67o3LSffBRrbdoDGQC3FQg/Vz1KfNpAAbMDsc=; b=A+TFlyTYeO+H7zuGQpFK8JwhK1
 glA8pis/gFVRUsAxJ5T9+lCE4AozpjY0YEUmBZPL11AX5nqvURd3LvINwOo4rJcBUgVYUgLic3Ym1
 B0Hi0jNx489EuJBGy6YYFFIzCjRNg3z/SZHtbLQsAFkRQdDr3Jpnz8ybZASvyvluilXph02yi+ueV
 BKPKjs8aTXi1e5OhRBu3rpNhamBnlSi9hN/9ZYVvK+5z7aZRpfsEiinbBU3atB6VWfzyC7RdxYGww
 UEuUYrXZqsojVSIgs6okhjBN+LOQsp0/GXEmcW6yEABGH8W12phgi69TUAnKvp9NmjFwhp9bV+OO9
 KOJf8HBQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2z7-008eQX-II
 for linux-amlogic@lists.infradead.org; Thu, 15 Apr 2021 14:28:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so2513703wmf.3
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Apr 2021 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=921/pZ67o3LSffBRrbdoDGQC3FQg/Vz1KfNpAAbMDsc=;
 b=EhqLYHbVp4oJ/VhjJRgpKQUWSfgvIEUfKrhMa4ouFtYROcQRexBfQRWezruJ159jNQ
 P2dChq1pY6pXH71rGVKgKlOnqlnlM4DwdikzfVw7igrZ/Pxf+NmvdTiUH9RiudwnSkOh
 jnCdgOJqqX/uudEEL9VNRjflY2OXMx8ZDo8vZdYfAjSWqlPBhKzU4KUDjpbm0kq+3Aj3
 frZY0iapFd31WELXHx01Xc1ygNVHKE058zgvFauXDKlHAVH7i5ZJr1QIzpi71fi8ubA0
 FZSdM21v1V26KDQyn0JwnJ+8kdbg7Eltq1ud1BoTqhmbrrSbHwQRIwD/Hc6jlFpiFSZF
 UzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=921/pZ67o3LSffBRrbdoDGQC3FQg/Vz1KfNpAAbMDsc=;
 b=iOhxg8gv8UIgEFPGCM88Nwey4r/dTrn+6M8r6U77WcCWyrICHt5qWm4opd++xfBknb
 yVfCyesbOOvZIAvJ9xc63mv3g9PNxk+GWTZZ6cKEwyqVYCZF1i4StC68eGh1xdNzJsZl
 /+f8VFDI3qXuCmbtZDWUXztlQCCchQX7lk/N2OHSDCGm5NW4J0BTR9IWVNRS0AOLg5sU
 fXx7QOCWW+EgcsWBKN5Bd2MaIdPkEYA2YqvBG4ESi0O6dNMF4bQLFxnllUbtWIpRBCQ/
 9B/fWloReB52mGYPkUWWQY+VhrH4qdKBiXeGRXbIOd4ovKhqrvXZzj2d9VExHdxgKwpM
 xqeQ==
X-Gm-Message-State: AOAM5335s6ZMzfFelP7Yx+7ZMdd9+EhEm1qjSgh36nDNGujeKuwTZBfJ
 twraLV9KBFyhwErUpPccHPvuBG1slCl9RZT5
X-Google-Smtp-Source: ABdhPJwemlR6DCOOMXxJ0y++9vCi0WcCzW0JciBwCPEr5TUQmYww+XTodhPiw98Cr6KemrEkY1i4hg==
X-Received: by 2002:a1c:a7d1:: with SMTP id q200mr3346481wme.13.1618496921022; 
 Thu, 15 Apr 2021 07:28:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:3548:892b:bb67:1e64?
 ([2a01:e0a:90c:e290:3548:892b:bb67:1e64])
 by smtp.gmail.com with ESMTPSA id d133sm2981115wmf.9.2021.04.15.07.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 07:28:40 -0700 (PDT)
To: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: 2021 Amlogic SoCs Features Status
Organization: Baylibre
Message-ID: <f13f7006-2d0c-40c7-cea6-03b5190fd106@baylibre.com>
Date: Thu, 15 Apr 2021 16:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_072846_242995_966DD95C 
X-CRM114-Status: GOOD (  16.38  )
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

I'd like to summarize the actual missing & broken features on all Amlogic SoCs,
because (this month) is the 4th anniversary of the HDMI support on Amlogic SoC,
but not only.

A lot of people are asking about the status on multimedia & display features,
this would help understanding what's missing.

I would like to thanks all the contributors (code, test, bug reports, ...) for the last
4,5 years !

But first, I would like to list what's working and stable : (you can find more details on http://linux-meson.com/)

# Display
DRM/KMS Atomic Driver
CVBS i480/i576
HDMI 2.0a up to 4k60 with 444/420 support
OSD with multiple plane formats supported
Video with multiple plane formats supported + compressed video formats from the decoder
HDMI CEC
GPU (Lima for GXBB/GXL, Panfrost for GXM/G12A/G12B/SM1)

# Multimedia
GE2D Accelerator for plane rotation and format transform
MPEG-2, H264, VP9 decoder (up to 4k for vp9)

# Audio
I2S, SPDIF In/Out TDM interfaces support
I2S/SPDIF feeding to HDMI support
AXG/G12A/G12B/SM1 advanced audio routing features supported

# System
CCF Clock support
SCPI DVFS
Thermal
Power Domains
SoC identification
eMMC up to HS200/SDCard/SDIO support
NAND flash support
PCIe support
USB2/3.0 SuperSpeed + Gadget/OTG

# Misc
MIPI DSI PHY support
RTC on pre-GXBB
vRTC to support suspend wakeup
I2C up to 400KHz
SPI for SPI NOR Flash
SPI for general purpose SPI
User eFuses
ADCs
HW Crypto Engine
Internal Clock Measuring
PWM
Infrared Decoding

This makes it an usable system without advanced multimedia features.
You can find very recent Desktop Armbian images running on the Odroid-N2(+)
running very decently, and build Upstream AOSP on the now reference boards
Khadas VIM3/VIM3L.

And U-boot has almost the same support status, see:
https://u-boot.readthedocs.io/en/latest/board/amlogic/index.html

Now what/s missing/broken.

# Families

## All Families

### Display
Missing:
 - 10/12-bit HDMI Output
Plumbing is there, only needs clock generation setup and understand how to switch to 10/12bits...

 - HDMI 4:2:0 Output
Plumbing is there, only needs mode setup and testing

 - Cursor Plane support
More complex, would need refactor so support updating the cursor plane manually when in interlaced mode

 - Second Video plane support
 - HDR Transformations
Needs documentation

 - Parallel Video output
 - Picture post-processing
Needs documentation

### Multimedia
Missing:
 - MPEG-4/2/1/JPEG Decoder
 - H264 Encoder
 - JPEG Encoder
 - DVB TS Interface
 - HDMI Audio via S/PDIF

### Misc
Missing:
 - Smart Card reader
 - I2C Slave
 - HW IR decoder support
 - DMA support for SPICC
 - USB OTG

## Meson6 / Meson8 / Meson8b

I'll let martin elaborate on that, but it seems the biggest missing bits are Display, Video Decoder & Encoder support.

## GXBB

### Audio
Broken:
Multiple issues are reported with the Mainline AIU driver:
 - "Machine Gun Noise"
 - 5-8 second dropouts
 - unable to play 48KHz audio on GXBB
 - channels are messed up in both AIU/AXG when playing 5.1+

### Display
Missing:
 - Secure Video Path
 - HDCP2

### Multimedia
Missing:
 - HEVC Decoder
 - GE2D
Driver exists, but must be adapted

Broken:
 - H264 Decoder needs some fixup to be stable (Seeking, ...)

## GXL/GXM

### Audio
Broken:
Multiple issues are reported with the Mainline AIU driver:
 - "Machine Gun Noise"
 - 5-8 second dropouts
 - channels are messed up in both AIU/AXG when playing 5.1+

### Display
Missing:
 - Secure Video Path
 - HDCP2

### Multimedia
Missing:
 - HEVC Decoder
 - GE2D
Driver exists, but must be adapted

Broken:
 - VP9 Decoder needs some fixup to be stable (Seeking, ...)

## AXG
### Display
Missing:
 - MIPI DSI Controller
Code was submitted, but needs some refactor before re-submitted.

### Misc
Missing:
 - Crypto Accelerator

## G12A/G12B/SM1

### Audio
Broken:
Multiple issues are reported with the Mainline AIU driver:
 - 5-8 second dropouts
 - channels are messed up in both AIU/AXG when playing 5.1+

### Display
Missing:
 - Secure Video Path
 - HDCP2
 - Dual display support
Needs documentation to understand how the works

 - MIPI DSI Controller
Code was submitted, but needs some refactor before re-submitted.

 - MIPI DSI PHY
Code was submitted, but needs some refactor before re-submitted.

 - Support for complex planes blending
Needs documentation to understand how this works

 - Support for complex Picture post-processing
Needs documentation to understand how this works

 - Support for complex OSD and Video HDR transformations
Needs documentation to understand how this works

 - Dynamic HDR

This is not supported by any framework in the kernel

### Multimedia
Missing:
 - HEVC Decoder
 - MIPI CSI Input
 - MIPI CSI Phys
 - Camera Image Processor
Only for A311D/S922X, is an ARM ISP core.

 - GE2D
Driver exists, but must be adapted

### Misc
Missing:
 - Crypto Accelerator
 - NPU (Vivante Core)

Please follow-up if I missed something in my working or broken/missing list !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
