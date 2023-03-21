Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5026CC74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6/NQQeufa7Fs63vSUnq8kRnCm5vKFAF+JA56czQe5U=; b=gclwW+BhNxop7G
	vLWGHuPVM2w4utQjkTARDCuyMoGpxxvWAumEQxnTNmTR6tp9Z/3R0gtEwAnh23/+eDjOpfe9m4MCQ
	4zT6uSGySwyfxrueTDBGJAZOo+FMNqHS5qpj1ax/6ZUY0VIaQqBG66luN8fap4iwHrUWAcZoZq0Y/
	j8ndY90OmlnG3OeIPClNGcTM5cJAIP6S7fzPoYE9dFBmOmXyM+UFqzbLuXPU23YbQUQRcWkXOdqbt
	czVUrFlFPb106VsskNbiqSlRqGDlf0dEwqOpQ2r6a8mqXzLGJoOBaeLGhAzZJIud+uFO7MQ3ilIN2
	NGLO+J7bbjuiCAkdo/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecvQ-00CiFe-34;
	Tue, 21 Mar 2023 14:25:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pecvM-00CiCm-2z;
	Tue, 21 Mar 2023 14:25:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4210BB8171B;
	Tue, 21 Mar 2023 14:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA81C433D2;
	Tue, 21 Mar 2023 14:25:11 +0000 (UTC)
Message-ID: <558a8afc-f62d-aec7-aca5-5d26471ba332@xs4all.nl>
Date: Tue, 21 Mar 2023 15:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] media: meson: vdec: add HEVC decode codec
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Benjamin Roszak <benjamin545@gmail.com>
References: <20230314114318.4057353-1-christianshewitt@gmail.com>
 <20230314114318.4057353-3-christianshewitt@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230314114318.4057353-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_072517_311524_4689AAD4 
X-CRM114-Status: GOOD (  19.61  )
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

On 14/03/2023 12:43, Christian Hewitt wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> Add initial HEVC codec for the Amlogic GXBB/GXL/GXM SoCs using
> the common "HEVC" decoder driver.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> [codec alignment to upstream changes and frame handling improvements]
> Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/Makefile     |    2 +-
>  drivers/staging/media/meson/vdec/codec_hevc.c | 1463 +++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_hevc.h |   13 +
>  drivers/staging/media/meson/vdec/esparser.c   |    3 +-
>  drivers/staging/media/meson/vdec/hevc_regs.h  |    1 +
>  .../staging/media/meson/vdec/vdec_platform.c  |   37 +
>  6 files changed, 1517 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.h
> 

<snip>

> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 88c9d72e1c83..ea2aa0e8cf0b 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -11,10 +11,23 @@
>  #include "vdec_hevc.h"
>  #include "codec_mpeg12.h"
>  #include "codec_h264.h"
> +#include "codec_hevc.h"
>  #include "codec_vp9.h"
>  
>  static const struct amvdec_format vdec_formats_gxbb[] = {
>  	{
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.min_buffers = 4,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_hevc_ops,
> +		.codec_ops = &codec_hevc_ops,
> +		.firmware_path = "meson/vdec/gxl_hevc.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
>  		.pixfmt = V4L2_PIX_FMT_H264,
>  		.min_buffers = 2,
>  		.max_buffers = 24,
> @@ -64,6 +77,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>  		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>  		.flags = V4L2_FMT_FLAG_COMPRESSED |
>  			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.min_buffers = 4,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_hevc_ops,
> +		.codec_ops = &codec_hevc_ops,
> +		.firmware_path = "meson/vdec/gxl_hevc.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_H264,
>  		.min_buffers = 2,
> @@ -114,6 +139,18 @@ static const struct amvdec_format vdec_formats_gxm[] = {
>  		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>  		.flags = V4L2_FMT_FLAG_COMPRESSED |
>  			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.min_buffers = 4,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_hevc_ops,
> +		.codec_ops = &codec_hevc_ops,
> +		.firmware_path = "meson/vdec/gxl_hevc.bin",

Hmm, I don't see this firmware in any debian package. Is it made available to
linux-firmware? This actually applies to *all* meson/vdec/ firmwares.

Regards,

	Hans

> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	}, {
>  		.pixfmt = V4L2_PIX_FMT_H264,
>  		.min_buffers = 2,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
