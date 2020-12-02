Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B45C64E8A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 12:28:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4383B221FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 12:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4383B221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VgI9pzDz3mxXLRXbfkSD1JY3zkHOecwSDo7jGi7GeRw=; b=v/JlY+fCj/sXjGOI07yVRWG77
	Gr1P29qI2gCqkxe5FixM3yBJ69OiGwZcQazDi6lafeWODTQWtUwKOmgyC8/8F5DQMoFzo2A5HwBQk
	pkrjgsirOXo4rmANkjiltQpyHUWZpSu2/79CVaRxCxNc1eH0IqplhkTC1cxsRWYyl/xgD0s0UXg1R
	AGRMZLlvYBpwnSOoL7gxT+Qj0kigw+5mLv2DMv4J8JNQra1OdWU1jiw+tCUzm1FqMkBzlP/Ebdzzo
	bdnCaU0VNeLosKMoPv1kH7/1HKd+Aytlf/cLg+dt01vllD2V/Sp0fnA/3P9OdYG2Hdq4jKWdDbHj9
	kh4F0yCvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkREi-00076h-2h; Wed, 02 Dec 2020 12:27:56 +0000
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkREe-000759-I6; Wed, 02 Dec 2020 12:27:54 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id kREWkDrInN7XgkREZksxw7; Wed, 02 Dec 2020 13:27:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1606912070; bh=T7EXqnLofAd0RTyfu5YzT2ZBWCR/I7cpQumq03DSVa0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=u5zGy/k1luDMIMr9mbTsg0Ez/X0pRQ8X9TqRw6gmOZO0TjdpP6j0zdUc8Qb6AG3CY
 YEMD1AVvVbnHhKV+mA2m0EHPD123fuTBFwNXd//JDp3Tyr9Lc5/jJDUUTKD7GBh04/
 drCLYg0+8jCMUwMacuO0gjEbaw9Gp985S/CKmEbrJ+rkf3j3/Fjs54PtbCfPi6LJvr
 8gajzGnZcwkUl3v/F4y9VKLlitA7dErooq3d0jsFeXDlx/rPU1KFALJqMSFS/k+Pv9
 l21eetjikqxWKDOW6OYkvzv4lj8bD7NyFvMFo7lhyDHcnqNw4nARM2hnwosWjenyVE
 gV0KgIwMbvOng==
Subject: Re: [PATCH v3 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
To: Neil Armstrong <narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f0ab5ae9-db4d-4c9d-811d-26a6ce4c50f7@xs4all.nl>
Date: Wed, 2 Dec 2020 13:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfK15bOUrRB+c5q+WftggBLX5/wwzIv8ESjjweeLTV0+2f4IkRKQTMJKtQym/4mcdnj7lPV2sLY33le+W8YNhqzaY6Oo30BwvgDuaS+BOMTTlEHeai7gB
 v9qnua8McUODk10xPIVFx9niUxuLZaX9L8Ko6w4YPEwmevsz2+SGz7gTFewRqTL3tO0Cjxo26Eu6poc5LlSx5FNjl6BanPej/ywfMK/9QmAiyGh6V6IVEe1U
 1+xavyknW6pMrEUteKWMU/1xYvKyA9mxffLnVz01nz2DFM+uU68/aGHEF5IeNcRopjr9eqy+nvCD2QEwp1uy8tkKAcovLU6dEZcIb2PdqMJnLH2xF/847rGF
 jQSNWSFFXhC940bq1l4XnjB4W3P6ng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_072752_768063_67B99158 
X-CRM114-Status: GOOD (  20.54  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 17/11/2020 09:44, Neil Armstrong wrote:
> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
> 
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
> 
> This adds the support for the GE2D version found in the AXG SoCs Family.
> 
> The missing features are:
> - Source scaling
> - Colorspace conversion
> - Advanced alpha blending & blitting options
> 
> Dependencies:
> - Patches 1-3: None
> - Patch 4: https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com (applied for 5.11)
> 
> Changes since v2:
> - removed error check in and after get_frame()
> - moved the v4l2_file_operations lower in the code to avoid adding vidioc_setup_cap_fmt on top
> - removed all memcpy of pix_fmt
> - simplified & fixed ge2d_start_streaming
> - added local buffer type check in vidioc_g_selection instead of using get_frame error
> - removed impossible <0 rectangle check, fixed error string
> - added comment on condition after V4L2_CID_ROTATE
> 
> Changes since v1:
> - Rebased on v5.10-rc1
> 
> / # v4l2-compliance -s
> v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t

That's too old: additional checks for CSC handling have been added since
that time. It probably won't affect this driver, but still I prefer it if you
can update to the latest version and verify that it still passes all the tests.

Regards,

	Hans

> 
> Compliance test for meson-ge2d device /dev/video0:
> 
> Driver Info:
> 	Driver name      : meson-ge2d
> 	Card type        : meson-ge2d
> 	Bus info         : platform:meson-ge2d
> 	Driver version   : 5.9.0
> 	Capabilities     : 0x84208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture: Captured 58 buffers                
> 	test MMAP (no poll): OK
> 	Video Capture: Captured 58 buffers                
> 	test MMAP (select): OK
> 	Video Capture: Captured 58 buffers                
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for meson-ge2d device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0
> 
> Neil Armstrong (4):
>   dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
>   media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
>   MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
>   arm64: dts: meson-axg: add GE2D node
> 
>  .../bindings/media/amlogic,axg-ge2d.yaml      |   47 +
>  MAINTAINERS                                   |    9 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |    9 +
>  drivers/media/platform/Kconfig                |   13 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>  8 files changed, 1534 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
