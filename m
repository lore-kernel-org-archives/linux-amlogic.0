Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825ADC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 10:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4709960EFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 10:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4709960EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wgSebaY0zel70J6FNR025/DsCnxl0W4kY4MG6O8/0zg=; b=Gpjny0i+MHzmIWKMHA9wkDYcdf
	cDrgdUe0ZaQ8YoFzvJKui6Eu8J1vl8BRJm1ZAgxE6wWwi4oaAAPFg66TUyrqQ2aS9lR+1UZYyGxCT
	Ug/ONh6RHN+hdoRsBaomK7iQaDv1ASBlHQ+3uPfKuV2qIzaYd5vzlNyY6dzj0PTN7k2v8nPLdGzab
	AdjHddaDUBBBiNMqaRBi2BbxPlJIRxn+Ze5cCHR1OozCUbtDSFmyqQkkGcSkb7XNAPxYznIL5NHI8
	jUZ/VB8Y9xLLIMr1Ojqn7q62MOXQGQrBg+qKu3ZXIuW5MAI3RGYdUUOaIYj4OMfTBRC+iJphdM1Sh
	CL6fcfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Q6Q-008Bv0-SX; Fri, 30 Jul 2021 10:50:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Q6M-008Btm-QJ
 for linux-amlogic@lists.infradead.org; Fri, 30 Jul 2021 10:50:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id u15so5697429wmj.1
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Jul 2021 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9m/EKCN/FomdF8fORY1RUYBXPIVRzqaRTRpfCcIDSAQ=;
 b=djNGTQcKjfbqXno2TU4kzE8+bWPIkBcMS9BIhXTf9TNoDidYc9kqclfq8RmLqIk/lx
 2yfO3g/PgyOgDTNqcoH/4Kok8qtZbJ4zIiXXdk1VSZX8H1FNgWTdPa/UNwCmtkn4I7fX
 ksmlLD9CSZ387SMVfUWH9vit4yd1tAQGOMIbvLlXNcsxka/03bLKyKfni2CBiBmJOLX4
 V8PN6qDLQiP4QbQmCmqzpL2Jhc6a0IkTBj+gr6y54H84l2NNVEE74M6gpWORda3Emm7o
 WrtZFfwzLRNAFh7bN3ImcJwXB6qjkcKD0BHJQjg4L2VaCSavItXUvnXeJkL7vbeIQoBN
 hyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9m/EKCN/FomdF8fORY1RUYBXPIVRzqaRTRpfCcIDSAQ=;
 b=bQFAj07U0Ys3rbW6nskmi2yaLyx+Djzx7hDtAxlZ9TJAv35MzjRanu1euZOCdoXsjd
 9rydSStOP7cMNzX9mswRjV+sypYZlsH9ALvHgRM0Hp6s/t2kg2pbiyfGxFhSS9F911N6
 8ZHhQepbm/hOT/ONX6t7bbEkVfQ5JWomBrYCC5vLd14BXmz8cJ4kmG00EzFEMmZT7fLK
 aaArVpcNBcuT09JdYBEwBWhaKKRJ9mt7T5aOGtZk9lmfqPxQ1Oj+Xtwa8o6PjDcSmujj
 q8w2J+IuUzeYVhV2Yf7FbXGAbdBMeh+8/b/znRfoVkP0RmTdmoDBl84GpCpqfAC+CTFa
 Pb2A==
X-Gm-Message-State: AOAM531X17fC/e6EPSdig5VRtj4aY+1i3jpawZaDx1bbD4JNDigH1o3d
 FX5ILKrap4hXQwIo4+cgUe6YhQ==
X-Google-Smtp-Source: ABdhPJyX2LPYtmDUIpLqk9QfpHzwX2Hi9pA9KWy971nLG+S5hAFH4mLa1h+i1LAHXYSq0S9IbQRwfw==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr2128944wme.131.1627642248857; 
 Fri, 30 Jul 2021 03:50:48 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0?
 ([2001:861:44c0:66c0:2c71:4cb8:38f7:a2a0])
 by smtp.gmail.com with ESMTPSA id w13sm1265284wrq.91.2021.07.30.03.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 03:50:48 -0700 (PDT)
Subject: Re: [PATCH] media: meson-ge2d: Fix rotation parameter changes
 detection in 'ge2d_s_ctrl()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0fdd2990-7a4f-07cb-384e-e5c5a11452a8@baylibre.com>
Date: Fri, 30 Jul 2021 12:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_035050_969840_D57B9D55 
X-CRM114-Status: GOOD (  19.33  )
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

Hi,

On 29/07/2021 21:49, Christophe JAILLET wrote:
> There is likely a typo here. To be consistent, we should compare
> 'fmt.height' with 'ctx->out.pix_fmt.height', not 'ctx->out.pix_fmt.width'.

You're right, it's typo.

> 
> Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I've not looked deeply in the code, but why is this test needed in the
> first place?
> Couldn't we assigned 'ctx->out.pix_fmt = fmt' un-conditionally?

We could indeed, and with the typo you discovered it's already the case so the test could go away.

> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index a1393fefa8ae..be22bb60e7cf 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -780,7 +780,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  		 * parameters, take them in account
>  		 */
>  		if (fmt.width != ctx->out.pix_fmt.width ||
> -		    fmt.height != ctx->out.pix_fmt.width ||
> +		    fmt.height != ctx->out.pix_fmt.height ||
>  		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
>  		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
>  			ctx->out.pix_fmt = fmt;
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

(please keep it if you re-spin by removing the test entirely)

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
