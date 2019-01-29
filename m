Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFF1C169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 08:27:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7BD207E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 08:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXIuMgIR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="al4ePa5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7BD207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhiyOiNFnEM5euCDqS+3iyZ4b8ZlDjNYN/udCM9Gwu4=; b=TXIuMgIRnFSn2N
	0p+xVm0iCJ0xfmMKlTIQlkCqpVBaf+BH9ZZLFZ+HQnOfFKLeSMClI+SeGvNe5/Wa8ns72dtl2Irxs
	KHvCKe6hWoDARCFnUP32FXVp3frtpWnCW6otTkumc10t7zlYE0SiaZlCixsKtra5aRl7lJl1qrBdp
	rJvqXvXdc3CrQK1buE02UTrTG2Kw8RbOFPN98IyOVkuGeI3OJ2D0rrMT3JO7Z2Om8rhRoqX8flUsk
	6BBO0AY5sWyE2DaK3dblE56FTAfLeoJ1aA7KqR4CMdswpiOdsjqnm3P9h7gwtqXqLRNbe4nG4cBP/
	LpNl9t7jDeBzwzdf1eEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goOja-0001rD-2J; Tue, 29 Jan 2019 08:27:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goOjW-0001qX-DP
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 08:27:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id r10so20938596wrs.10
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jan 2019 00:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=frAkg3jt2INnm0RH2wHyRkToaqim1AVuiVj2AXKNaBw=;
 b=al4ePa5rNV2yOmHQfApZIyWB6eakIz5/V5xryEAA6rKUEk+yb7g+8su/zIfUPnJrcD
 J8y5zBHvDv6q8Co3yjFhE08JEoJ3Y5+lswqg8lTBXMBvtU6lKbh2pRpVaTsJQYeY2YqN
 PZ/ERopGOe7VsSnKpODF+lvl50brZ+7TbxxnmzG4ab0T9Pln8LvukMcjgaOSaJ+gDDNs
 tnkj2V7wlgN9l9d55B5PXWQzFbsUU1Hvk1kMhYrsG8P9kU4mhIT1zxT607jKwBNYXVyW
 kTNSAXS6lGZT5wmx5NHe6pKhpBaCH180kwyxQ/4+hWmso0Ud7tFFFpwrmYdguuw/c+qe
 kVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=frAkg3jt2INnm0RH2wHyRkToaqim1AVuiVj2AXKNaBw=;
 b=md5WZc0WF9hUUsG0WtIlvFhTpvYbeT6KADNj4hB1cuZNGJTuBW9IiYqoh/UieIXrM1
 O1xA++B6GirO1PwicQquQhVbmvjqjw8uDF9MKdzG9M5l7C2wXa/Xo4wSxQynLsT/oJAV
 qpiq0L1DH9QzLK5+WEDUSc258kRh7+FFJXHWVMlQBdGnrntLeNWDB4MqZVatyEk0knck
 +bayoQSHuQrc+HEtoGetDvhQUaQ0pXUY4awkwVcKSlfSucEyh7cPLJmZ5vqXnIyWadXb
 EYJxHcXY/L45MNzrfHaya3L2O8v74tBsIsJvnM/iqdCIMUq+Gek2VSLqTcGXS9w+P5bD
 t0Ig==
X-Gm-Message-State: AJcUukd6oXESqpaC1ii9dbkiKfZb97omebKXdxDvqqDBkhxz2f0mL0j+
 WGARkvSNc3Lg/X8cmJH5Z371Ag==
X-Google-Smtp-Source: ALg8bN5EPtWAaQbqg1e6c5KjmG4fwtp1tlplqAao2IzJLarUWv3WE+us6Vv8PhHYTWePYM2tDSfhUA==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr23778429wrr.280.1548750420273; 
 Tue, 29 Jan 2019 00:27:00 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r3sm92427355wrs.78.2019.01.29.00.26.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jan 2019 00:26:59 -0800 (PST)
Subject: Re: [PATCH u-boot 04/11] video: Add Meson Video Processing Unit Driver
To: Anatolij Gustschin <agust@denx.de>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-5-narmstrong@baylibre.com>
 <20190128205611.46598f8a@crub>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bcbb5e37-d57b-47b5-4f24-58dad577c919@baylibre.com>
Date: Tue, 29 Jan 2019 09:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190128205611.46598f8a@crub>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_002702_494982_73ABF9C4 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: mjourdan@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org, Jorge Ramire-Ortiz <jramirez@baylibre.com>,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anatolij,

On 28/01/2019 20:56, Anatolij Gustschin wrote:
> On Tue, 15 Jan 2019 17:17:52 +0100
> Neil Armstrong narmstrong@baylibre.com wrote:
> 
>> This adds video output support for Amlogic GXBB/GXL/GXM chips.
>> The supported ports are CVBS and HDMI (based on DW_HDMI).
>>
>> When using HDMI, only DMT modes are supported.
>>
>> There is support for simple-framebuffer (CONFIG_VIDEO_DT_SIMPLEFB)
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Jorge Ramire-Ortiz <jramirez@baylibre.com>
>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> 
> Reviewed-by: Anatolij Gustschin <agust@denx.de>
> 
> Please see minor comment below.
> 
>> diff --git a/drivers/video/meson/meson_canvas.c b/drivers/video/meson/meson_canvas.c
> ...
>> +/* DMC Registers */
>> +#define DMC_CAV_LUT_DATAL	0x48 /* 0x12 offset in data sheet */
>> +#define CANVAS_WIDTH_LBIT	29
>> +#define CANVAS_WIDTH_LWID       3
>> +#define DMC_CAV_LUT_DATAH	0x4c /* 0x13 offset in data sheet */
>> +#define CANVAS_WIDTH_HBIT       0
>> +#define CANVAS_HEIGHT_BIT       9
>> +#define CANVAS_BLKMODE_BIT      24
>> +#define DMC_CAV_LUT_ADDR	0x50 /* 0x14 offset in data sheet */
>> +#define CANVAS_LUT_WR_EN        (0x2 << 8)
>> +#define CANVAS_LUT_RD_EN        (0x1 << 8)
> 
> Some define values are not aligned by tab here.

Thanks for reviewing,

I'll fix it.

Do you mind if I push this serie via the amlogic custodian ?

Tom is it ok for you ?

Neil

> 
> --
> Anatolij
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
