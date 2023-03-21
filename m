Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D31C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zecy99hjHSswTNRsPrGYXeyk32bB3BTnJEFK42yzEE8=; b=NSlkwmv0zcFCo0
	vw6zecqDOo/vI7yVO0t6iu/ODDMHAZCsAe5EglpYKt90Y2oA2pvAvRwMMC68Hcs5MWXN/TYjqQggt
	YLZ+pqLfBvD7KjLWoZB97Ko0UrJZ0dPbnzEyfQgN7l8w9KhnWLMsBUVWBE0NTla6H1sLZtdtX5Pdg
	uR1T3FwwOaz/0eW5ba1F3jvABtwgnzSNrm8aMbfIFWyUlz9OrZIfs/BICSmO0ciZx4ZwzW3uKh9Rq
	ci/C1q9GoAzQhxR4+F29dGp8Fg+WSDIvIupU8esn6EV2mrU13iRUXOexNF4eMHtKFKHHj/HQNKLVs
	xO9jzoaul7PpCTWITLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pedwB-00CvXk-0i;
	Tue, 21 Mar 2023 15:30:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedw8-00CvWv-2I;
	Tue, 21 Mar 2023 15:30:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id d17so5684558wrb.11;
        Tue, 21 Mar 2023 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679412606;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ari/7JtTNW0WfcbZuhnrhR4cCTcsxRQZKwPb9wkPuo4=;
        b=VkupBurEgW0h/pfZf9DucwZbh1HfhAknnQz7ZcURPkf0CXFEgAp7Fq8lsz+kUYNje/
         OmtQ5d3Bc2mD5xZCm0/Y0kLikBj0OaS54XDLeJZ8Bb6dTLmYWDLcz0pi4HNl/y/VQbZt
         MQpft+arS+rJMWrO2xzZsX6VN38Hi9kZedAmjuGjE9ePK1Xrq8T5sQGSTl1RcYrpDFsW
         r+HQPEFQviWB6nqOYLl1eg2TW32E4XiRLSOicP+B2blonfEzJoV+P2lM5B6BzHXgnGCi
         DNDn33UiwqdPcVCtm3aSFCcjb4D6dT0L3KHsyOfSjEeaUDSjHr3Ms1Yu0ERtb9Ib78bh
         AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679412606;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ari/7JtTNW0WfcbZuhnrhR4cCTcsxRQZKwPb9wkPuo4=;
        b=IJ7fLiovmzQqaRxJ3eqphcrz40kKBnJNmaZ5WyVbwxJgb4R1hA7Ki+YjhWg0t7vdpq
         +8TupwVYX4vIldgkb7xocngY3kP+JFXrkBwx9zBtveM94LXKQTOVfWsn01dPLMxpE+8n
         UZ+UxOc79m8s+bXSc5bpNZAQc+m89NVU4mmk935lBHAijAwJdZ/tE5RK8xQsHx5uVPI4
         2d1RT6kX3W0yJyK3yvHKCqprzYlW8QkXOBOfRn28nG8VDD11VtXNWGhCY2gHW6l4xsrj
         f88do2F4NoULj/Sn0Tku9lLLd/9E6NP5xqa6lceuf6VAql14xh37PLmSE3urFZIGDb69
         4kZw==
X-Gm-Message-State: AO0yUKXiB5xefVPUMOAHbCEjm002dMJuNObOVoV6l5qb9BocUdd9DJFv
	GQe4y39QAI2/Bgddus8s7BcMiDmiWIoLuR5TS3Q=
X-Google-Smtp-Source: AK7set+oFplvc6wvPLsOfP4NJKKW5rdvK3dpDjNY4C7LLchtelC4UNA/jj1MeAvdcXyxeLnPmcL8YA==
X-Received: by 2002:a5d:6a8e:0:b0:2d1:f165:7041 with SMTP id s14-20020a5d6a8e000000b002d1f1657041mr3156639wru.11.1679412606112;
        Tue, 21 Mar 2023 08:30:06 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000181700b002c5694aef92sm11516642wrh.21.2023.03.21.08.30.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:30:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH v3 2/2] media: meson: vdec: add HEVC decode codec
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <558a8afc-f62d-aec7-aca5-5d26471ba332@xs4all.nl>
Date: Tue, 21 Mar 2023 19:30:01 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,
 AML <linux-amlogic@lists.infradead.org>,
 linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Maxime Jourdan <mjourdan@baylibre.com>,
 Benjamin Roszak <benjamin545@gmail.com>
Message-Id: <AEAFD8D1-D7F4-470A-A84B-E18DD9FDA735@gmail.com>
References: <20230314114318.4057353-1-christianshewitt@gmail.com>
 <20230314114318.4057353-3-christianshewitt@gmail.com>
 <558a8afc-f62d-aec7-aca5-5d26471ba332@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_083008_776069_97C8B223 
X-CRM114-Status: GOOD (  16.29  )
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



> On 21 Mar 2023, at 6:25 pm, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
> On 14/03/2023 12:43, Christian Hewitt wrote:
>> From: Maxime Jourdan <mjourdan@baylibre.com>
>> 
>> Add initial HEVC codec for the Amlogic GXBB/GXL/GXM SoCs using
>> the common "HEVC" decoder driver.
>> 
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>> [codec alignment to upstream changes and frame handling improvements]
>> Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
>> ---
>> drivers/staging/media/meson/vdec/Makefile     |    2 +-
>> drivers/staging/media/meson/vdec/codec_hevc.c | 1463 +++++++++++++++++
>> drivers/staging/media/meson/vdec/codec_hevc.h |   13 +
>> drivers/staging/media/meson/vdec/esparser.c   |    3 +-
>> drivers/staging/media/meson/vdec/hevc_regs.h  |    1 +
>> .../staging/media/meson/vdec/vdec_platform.c  |   37 +
>> 6 files changed, 1517 insertions(+), 2 deletions(-)
>> create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.c
>> create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.h
>> 
> 
> <snip>
> 
>> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
>> index 88c9d72e1c83..ea2aa0e8cf0b 100644
>> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
>> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
>> @@ -11,10 +11,23 @@
>> #include "vdec_hevc.h"
>> #include "codec_mpeg12.h"
>> #include "codec_h264.h"
>> +#include "codec_hevc.h"
>> #include "codec_vp9.h"
>> 
>> static const struct amvdec_format vdec_formats_gxbb[] = {
>> 	{
>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>> +		.min_buffers = 4,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_hevc_ops,
>> +		.firmware_path = "meson/vdec/gxl_hevc.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>> 		.pixfmt = V4L2_PIX_FMT_H264,
>> 		.min_buffers = 2,
>> 		.max_buffers = 24,
>> @@ -64,6 +77,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>> 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> 		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> 			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>> +		.min_buffers = 4,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_hevc_ops,
>> +		.firmware_path = "meson/vdec/gxl_hevc.bin",
>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> 	}, {
>> 		.pixfmt = V4L2_PIX_FMT_H264,
>> 		.min_buffers = 2,
>> @@ -114,6 +139,18 @@ static const struct amvdec_format vdec_formats_gxm[] = {
>> 		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> 		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> 			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> +	}, {
>> +		.pixfmt = V4L2_PIX_FMT_HEVC,
>> +		.min_buffers = 4,
>> +		.max_buffers = 24,
>> +		.max_width = 3840,
>> +		.max_height = 2160,
>> +		.vdec_ops = &vdec_hevc_ops,
>> +		.codec_ops = &codec_hevc_ops,
>> +		.firmware_path = "meson/vdec/gxl_hevc.bin",
> 
> Hmm, I don't see this firmware in any debian package. Is it made available to
> linux-firmware? This actually applies to *all* meson/vdec/ firmwares.

Yes, was upstreamed by Maxime in 2019 and updated 2020:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/meson/vdec

Christian

>> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
>> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
>> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
>> 	}, {
>> 		.pixfmt = V4L2_PIX_FMT_H264,
>> 		.min_buffers = 2,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
