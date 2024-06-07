Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C627C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhJT1pjXMohl2B6LnDj58w9cZXBRDvt5FJZvTOFSst4=; b=1Wg+9XP1XZbhP20YGBshKCXLgq
	5XGbBmVfXlA+LcXw/VNLMSS5mFoqSkCOeJuplggN97sxMx6/MbJ3Lh2c1NJ+NMwjt2evNmAkf12VV
	CYTPiFn8RpnmWyeAnYPVbLfQIeaCAznvZgOSOS5DFgfCrKGtOFkf7ou8c90Hq6+bqnfG/0FRE4Uje
	xhH79NOFCpo+Skze7crfnQv0njyUURi7tUFJRaD0Is3S4H7HUF3eZsVxOvJg1CBV6lZhqsfsUS1pU
	lWlzjh+bnlcYUv5k+myoEWiNSg6h6Dc7n3JkqU1bTsv+95cxRvFLUvdAgoGVRvKjxvzCz/iZaXqhx
	TlGwn7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc5P-0000000EqMO-0ce9;
	Fri, 07 Jun 2024 16:05:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc5K-0000000EqKc-2XbB
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 16:05:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-35dc7d0387cso2625162f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717776294; x=1718381094; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=g2IHMDcZqATCpUWlpOUTmI9TIBsxoeMIZmlQzTswZHkv7cTeo2+GhwkuoM8dXgCoUD
         8vcY+lljrjGD0IUsHGjDAEVGYCaeTavDh4nVVBPqIL/fvUWONLXH2Cvbih6J7m7m8lnZ
         uRuk2KtnVOUqhaF5n4CvB3mSKUlEctjCUvszc3irxwaTV5wi9BSlBrDwOqUlJOWb/c5z
         rYPU49zMNd8CZWeWwDz8pFbMeBz9Xhjg+zgYKrE5pMnsjX5U0z5AV06WpYMUVAyRgbC3
         xerGuBi4JZ7luWqKJEWgfk+/CJne9ojAPPRCnXxubBvKxy58XKK+SOOi3Q6cR8Dp+zKV
         nBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717776294; x=1718381094;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MijIgA09q0PdO32nGZaoZGyK+T1ltd9jm7YiJqErqN4=;
        b=Ur4Sq3Qw2rVZ6nPmUVvC78r/Ewpgzq0vMZ0xOOEiVBNNebezGv1OggclHXMM4hkmMr
         FZUROI9DiWC5stxDLKrh70lriTpjRdoOrmnOmREbwtHwug/VUO0oDz3Kmiu2z1/ZSAnT
         WdJeadjXtn9c1QPY3aDt/mTNJP6BG6oJ2d0kxeDjr/SQ48qcsefffIv1hZx7inJDU7Sl
         Tp13HqrLkvFSyCJyRPHy/1p7SPqvjVhnitthUNFKJNbCntymd7x7Q1bfCVifZIdCf3YM
         dp3/r2a772EOiK+yHTZp9bglzCniGx9bzypAW25HjWwhUPzmR3fee7njUi8F9IJX2RFm
         bwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwITKmS+6N1tknyCKeLJnb2qjRY37vytRaCrYDLMIcdubEHG1NRp/CfdpUJa+cmRSqA197EuExp333xwQCWGt7EMmO0GHtLCHcRUegDqLu54k=
X-Gm-Message-State: AOJu0YyEbTBA4p2Aa98I/+pisa/VAGKBc6+Y1fc/N8u6+ies2tbTbwdo
	HvmDgoVVaiciT28hQwS1G2B62mIUwd3uq1y4wbfcs2RtVrgWjOUrD1BU96vH2WQ=
X-Google-Smtp-Source: AGHT+IEU8HYa3hCTxSSYayUA1arnljkwYr7GSlFCw5TxepPqNeXLrtFb+yavJ0gq5yYhVjrRMVV3Lg==
X-Received: by 2002:a05:6000:50:b0:35f:d60:f183 with SMTP id ffacd0b85a97d-35f0d60f2c0mr1006174f8f.24.1717776293576;
        Fri, 07 Jun 2024 09:04:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404? ([2a01:e0a:982:cbb0:7e4b:b0d3:6a34:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f094fbf3esm1392894f8f.77.2024.06.07.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 09:04:52 -0700 (PDT)
Message-ID: <94773a91-a845-4821-a6ee-a0be93ea49d9@linaro.org>
Date: Fri, 7 Jun 2024 18:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
 <20240604051533.3312944-2-christianshewitt@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240604051533.3312944-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090458_801520_6C827AFC 
X-CRM114-Status: GOOD (  14.46  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/06/2024 07:15, Christian Hewitt wrote:
> Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/vdec.c       |  2 +
>   .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
>   .../staging/media/meson/vdec/vdec_platform.h  |  2 +
>   3 files changed, 48 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index de3e0345ab7c..5e5b296f93ba 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
>   	  .data = &vdec_platform_gxm },
>   	{ .compatible = "amlogic,gxl-vdec",
>   	  .data = &vdec_platform_gxl },
> +	{ .compatible = "amlogic,gxlx-vdec",
> +	  .data = &vdec_platform_gxlx },
>   	{ .compatible = "amlogic,g12a-vdec",
>   	  .data = &vdec_platform_g12a },
>   	{ .compatible = "amlogic,sm1-vdec",
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index 70c9fd7c8bc5..66bb307db85a 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>   	},
>   };
>   
> +static const struct amvdec_format vdec_formats_gxlx[] = {
> +	{
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.min_buffers = 2,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_h264_ops,
> +		.firmware_path = "meson/vdec/gxl_h264.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG1,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	}, {
> +		.pixfmt = V4L2_PIX_FMT_MPEG2,
> +		.min_buffers = 8,
> +		.max_buffers = 8,
> +		.max_width = 1920,
> +		.max_height = 1080,
> +		.vdec_ops = &vdec_1_ops,
> +		.codec_ops = &codec_mpeg12_ops,
> +		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED,
> +	},
> +};
> +
>   static const struct amvdec_format vdec_formats_gxm[] = {
>   	{
>   		.pixfmt = V4L2_PIX_FMT_VP9,
> @@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
>   	.revision = VDEC_REVISION_GXL,
>   };
>   
> +const struct vdec_platform vdec_platform_gxlx = {
> +	.formats = vdec_formats_gxlx,
> +	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
> +	.revision = VDEC_REVISION_GXLX,
> +};
> +
>   const struct vdec_platform vdec_platform_gxm = {
>   	.formats = vdec_formats_gxm,
>   	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
> index 731877a771f4..88ca4a9db8a8 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.h
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.h
> @@ -14,6 +14,7 @@ struct amvdec_format;
>   enum vdec_revision {
>   	VDEC_REVISION_GXBB,
>   	VDEC_REVISION_GXL,
> +	VDEC_REVISION_GXLX,
>   	VDEC_REVISION_GXM,
>   	VDEC_REVISION_G12A,
>   	VDEC_REVISION_SM1,
> @@ -28,6 +29,7 @@ struct vdec_platform {
>   extern const struct vdec_platform vdec_platform_gxbb;
>   extern const struct vdec_platform vdec_platform_gxm;
>   extern const struct vdec_platform vdec_platform_gxl;
> +extern const struct vdec_platform vdec_platform_gxlx;
>   extern const struct vdec_platform vdec_platform_g12a;
>   extern const struct vdec_platform vdec_platform_sm1;
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
