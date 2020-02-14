Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A91C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DD724649
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 15:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FnR+iCR0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="wbfGJUh9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28DD724649
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AjTmcDGrGAuw+crfkljNWFkXbSzmc0qeTgFHxBrHQY=; b=FnR+iCR0185wQQ
	4Uwuh6VBJNoqLALJFwxE7bFqXY0n6oFtIlesZRET4YichrfYUIKBvGFSvNLQtkUXMM3pGHLAZj/oy
	g5QDTG7nLYSTYORQ2Vy0NZ5I5krv2G/4lDmDbu6TbfLupI43rSMAq5DJJiben+bY0NgbtoVTu6Im/
	9pqLfqXA1rHjveZDYVimVxkmyovYDGr7GY4R0QyUBZdIXx1HEbke33cjf0bEXjKPX7vZJd3w2Tb61
	5LOOc0rd65MGLSsSKD9j2883S85Ny5oOMwV++WVttc1zHIXgiYWWm+s727TonXCZb23SgKsPp21rF
	pg9PBaPxBWaBUHhrZ0rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2cWe-0000Tz-Iw; Fri, 14 Feb 2020 15:05:04 +0000
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2cWb-0008V0-Np; Fri, 14 Feb 2020 15:05:03 +0000
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
 by smtp-cloud8.xs4all.net with ESMTPA
 id 2cWPjJP7i8i432cWQjQOFn; Fri, 14 Feb 2020 16:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1581692690; bh=jfgZCMwKGh7eRuI/zjy8W67xBkZ5fm6VCvCQhPom9X4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=wbfGJUh9UU39Uj6YRgoxg5RQTyWguqt2+A2Fuu61WLSHdYWA/AoFjJNUMP+uHXowF
 XCw+MtiINuakssbH+M1u/r/J/cbuEKiZQT9tiL+d0K9iaZmCwi33VYZ/p7354rYqCW
 lFhDsFcDEWahV3y/00I+mpA3uD3lqGTcLc9s4ST25erVSAOA7MNM0TKRBE/S54nuDD
 kvLWDc1/qTmkUQc3Gwg6pUjchSVz6+hiWcKjITVXTSdkCxdSbIm2izVFSPRuob3u/p
 VFFzFPafXu9c/Se3rfOeTuR6IdD7ELEO8LhoRiV1V7eGh9lVq61lThEoe+97r0fBEl
 Pg7doy7XeKfzA==
Subject: Re: [PATCH v4 5/5] media: meson: vdec: add VP9 decoder support
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
 hans.verkuil@cisco.com
References: <20200206084152.7070-1-narmstrong@baylibre.com>
 <20200206084152.7070-6-narmstrong@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <444673d2-f1f0-bfe8-1aa2-b37cbdec6231@xs4all.nl>
Date: Fri, 14 Feb 2020 16:04:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206084152.7070-6-narmstrong@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFNdI5qioRE4ZTzJD1OWEs/FwuSg+GRIzzIndRyH6rbfMxZ0OCM6RKuim/d0+6+RsdywWM4lMusKcJLMkdSpyxqjmP/giZIaZzX78/rJODFKCOSXKpJD
 qrfdJ3GISg2BE2sQWvgv9vYNHQgI+OA6g5m0FqGPYtyfd2HuxWwoG5Z0Y2m3ERDj7tERbXGDwjpxcJSyJAA97KTB3D+iwyiIT3CdHuZVp0Oh6tRQATMk8uqz
 JCKdmk3zFCXO1yEjzx85d7SdEXyiMAyxHk5oIhpG7CISThGw6qveYliBNeK8C6/wYljtOhpoSGIr5ZXytThNaDXLj1kBBX/XFtQ+97y87cXFgm86uYGGSnuO
 hdybGVGnSjnkm84SG9LMSOit2xz5IGQWSuKHwwfY3VOSHjUi1wy/ZLP/wTHQs4MZm83LcArheX77f4DO98pJSqftfCoiJ+MikHFQGGERcDj1nfyBaMJiQhEh
 0shWJ4XYVzpypV3APadCIlnMlL0R8DzU3WZPO5ro5T6be1JeY77fhVHUEKprZaM4FY5BAJPjdKVnFBrb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_070501_958155_ED739EB9 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2/6/20 9:41 AM, Neil Armstrong wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> This adds VP9 decoding for the Amlogic GXL, G12A & SM1 SoCs, using
> the commong "HEVC" HW decoder.
> 
> For G12A & SM1, it uses the IOMMU support from the firmware.
> 
> For 10bit decoding, the firmware can only decode in the proprietary
> Amlogic Framebuffer Compression format, but can output in 8bit NV12
> buffer while writing the decoded frame.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/staging/media/meson/vdec/Makefile     |    2 +-
>  drivers/staging/media/meson/vdec/codec_vp9.c  | 2138 +++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>  drivers/staging/media/meson/vdec/hevc_regs.h  |    7 +
>  drivers/staging/media/meson/vdec/vdec.c       |    5 +
>  .../staging/media/meson/vdec/vdec_helpers.c   |    4 +
>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>  7 files changed, 2206 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
> 
> diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/staging/media/meson/vdec/Makefile
> index f55b6e625034..6e726af84ac9 100644
> --- a/drivers/staging/media/meson/vdec/Makefile
> +++ b/drivers/staging/media/meson/vdec/Makefile
> @@ -3,6 +3,6 @@
>  
>  meson-vdec-objs = esparser.o vdec.o vdec_helpers.o vdec_platform.o
>  meson-vdec-objs += vdec_1.o vdec_hevc.o
> -meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o
> +meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o codec_vp9.o
>  
>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson-vdec.o
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
> new file mode 100644
> index 000000000000..e7ffbc6dd892
> --- /dev/null
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -0,0 +1,2138 @@

...

> +#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))

Checkpatch says:

CHECK: Macro argument reuse 'num' - possible side-effects?
#377: FILE: drivers/staging/media/meson/vdec/codec_vp9.c:330:
+#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))

While num is const in this source, I do prefer if this is turned into a static inline.

It's just safer.

Regards,

	Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
