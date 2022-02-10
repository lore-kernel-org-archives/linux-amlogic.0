Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122D9C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xuf90mUNApNHDinFs0rcFC/kK0rvbNjlucmxHycws8=; b=csKhtMrty3MUC4M9/IHqTMTlJ7
	dltrlRi0g9VSN2G1qNROok8L0adfxdA7LOspKiNctx8SDMlQD0k71w1xhoNorrDnzVrX8gyoTIpZR
	hlx+IxvynKf3IA/+PMc+TQ01TsnfUHjc0UT8fI7Tck7fND2C195TkIqaDXDBlagIzau/cGkhtysME
	LQc8HVbmhVWgVZCeaGHcJ6tc+ybcm+1kKF8MYiEQlEd62tIA8amj9tAL/JbJ7bkevGau7DBTlq/vH
	pSpZ/UQQft/oAh6rNBuWDOH8WrfPzRhWF8TV0EUItCrfyKq6vKICsdUX22dyB1RKg+ehziPIvv6ge
	niBf9Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI5qv-003Isb-2R; Thu, 10 Feb 2022 09:35:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI5qr-003Iql-8F
 for linux-amlogic@lists.infradead.org; Thu, 10 Feb 2022 09:34:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id e3so8517154wra.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Feb 2022 01:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=G+YDDnr2slUFHsUM/IlbFGkS85HzAaIxJtVEmZjhqMI=;
 b=fFvqalnJA8sWVtzDVywLCenoPVSbM4BhkZK9XFrkh6Uhpi+h4y/LKiKPi0+ZpMMW/Z
 8oUWKgTy+/vB6iqVkziuScLT+kEEaPx4cW97cxs178WEC9/LpV1PbchEV0yhArLeUKei
 Mlqk8nmMSwVxPZPMdo7PhJzx9J9flAKp6V/antjKCI6D9JvcSZIa993aC67gdMa40vNi
 iKaOYZWoizEF4zUNkT7BdkzPJ0w9QQSZNiE4Tkh/yi1bZG8tc6HGVwyxPS8oH35Nuysb
 fBd++IIZ5lX81lBwDZ4ywBPbYiCD3/fndjabl0NGgG41OW1NKXnrFD1wVZveXOfhwjmg
 bMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G+YDDnr2slUFHsUM/IlbFGkS85HzAaIxJtVEmZjhqMI=;
 b=2Xz2dgKWvpIpWLHgwvrER6qrc7zUEoXFmgG1l/089CxDcu0wNcGmmnkm0x4Bo/YPVm
 nVhDvthaDlOP3h9Aa3+gXCTOCfuksiJyBf8tU9LlgGrPmOCgM4hNh/5xuK3xlhT/iLf5
 k8oaxDlgwNRq2YLvu2BctXfRXjNlh1nmouJ3Pachdh85N1qQ67PO7zV8vRN6E96Aqmif
 jP6nTj3CfrNVfmwp1EIOz/DL5M3pSCsI0XpBDBISVn6gA1KQpHEg92LJdDHPVrpGff6m
 gXmL+3wThw/CfQ6nL2n/upzU95vDCqmHEzcnl7u6ht6CQAQQXAsA4XLGfDHU8Mv+dXIV
 X3xA==
X-Gm-Message-State: AOAM532rKhNojhSDa7U1Sg7jihLIYApGZSZdc9lJ/51/ApRjZK3FokTT
 RFrr0HstFolY49L8Vtt+gXSo6Q==
X-Google-Smtp-Source: ABdhPJxBmsNmtY10oYaIzh1QwOHqjXPf7ItHPImfVqE1FxspgN0H8jxhkM1pdM6mESt6dmgnlo306g==
X-Received: by 2002:a5d:4c85:: with SMTP id z5mr5695114wrs.225.1644485695484; 
 Thu, 10 Feb 2022 01:34:55 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:76d9:bf0e:e516:58a9?
 ([2001:861:44c0:66c0:76d9:bf0e:e516:58a9])
 by smtp.gmail.com with ESMTPSA id x5sm9483363wrv.63.2022.02.10.01.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 01:34:54 -0800 (PST)
Message-ID: <640ef0b2-fcba-50a6-71c2-8156181682b0@baylibre.com>
Date: Thu, 10 Feb 2022 10:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drivers: meson: vdec: add VP9 support to GXM
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220209153150.30688-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220209153150.30688-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_013457_341417_285E8442 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/02/2022 16:31, Christian Hewitt wrote:
> VP9 support for GXM appears to have been missed from the original
> codec submission [0] but it works well, so let's add support.
> 
> [0] https://github.com/torvalds/linux/commit/00c43088aa680989407b6afbda295f67b3f123f1
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Tested with LibreELEC 11 nightly 'AMLGX' dev images for Khadas VIM2
> and WeTek Core2 GXM devices which can be found here [1]. The images
> combine Linux 5.16.y [2] with Kodi v20 [3] and FFmpeg 4.4 [4] which
> notably includes many V4L2 refinements for stability and usability.
> 
> [1] https://test.libreelec.tv/
> [2] https://github.com/chewitt/linux/commits/amlogic-5.16.y
> [3] https://github.com/xbmc/xbmc/
> [4] https://github.com/jc-kynesim/rpi-ffmpeg/commits/dev/4.4/rpi_import_1
> 
>   drivers/staging/media/meson/vdec/vdec_platform.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
> index eabbebab2da2..88c9d72e1c83 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -103,6 +103,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
>   
>   static const struct amvdec_format vdec_formats_gxm[] = {
>   	{
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.min_buffers = 16,
> +		.max_buffers = 24,
> +		.max_width = 3840,
> +		.max_height = 2160,
> +		.vdec_ops = &vdec_hevc_ops,
> +		.codec_ops = &codec_vp9_ops,
> +		.firmware_path = "meson/vdec/gxl_vp9.bin",
> +		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
> +		.flags = V4L2_FMT_FLAG_COMPRESSED |
> +			 V4L2_FMT_FLAG_DYN_RESOLUTION,
> +	}, {
>   		.pixfmt = V4L2_PIX_FMT_H264,
>   		.min_buffers = 2,
>   		.max_buffers = 24,


Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
