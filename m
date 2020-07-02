Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C520AC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 18:57:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94255207CD
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 18:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ibeEPuPF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vIYTYR0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94255207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JrMfalH7gM1UFPG8MRRULGreztzPeBY51Yiuf1O5OTI=; b=ibeEPuPFHM1QrnfdwP95M2Hnj
	yyhxRpw6RGNxnbqtGn59o6/xGY2wZth66adfwyvCZEMQPSF7jEDVV7q/AVUe+j16Vk2GFYs/SVA0D
	fQc4oNnLUsGmO4Aa+sDNyD2/YoPLWS//pdtGpzga4CL2uH+LScQQee77PcH1UnQhHe6fhf80l3zdr
	j0w59xPeLSs0Z7eOuMw5XfKmDJ1oTEoM2+vzsJ6whLaCal9dXuL2KtDlylg1H3gVZH2HKXZjOjD3v
	/QVv5e3u/VxUWubtx9CQBXWFq7bP7QuYHv/1/Yd5x38RUzRha0znp8Zj6TMbRhGYsM4cVy00PKZaz
	RrDDABB/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr4P5-0005ir-0H; Thu, 02 Jul 2020 18:57:47 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr4P1-0005gn-Jl
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 18:57:45 +0000
Received: by mail-pj1-x1041.google.com with SMTP id l6so9730433pjq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hz4Mj/iQWQ1Gm0J6ofti89mpz3pTQ7LpeTX5svYgVDU=;
 b=vIYTYR0m8trV9lrGh8PSvAGnzTxA5G6rFm/vi7ItU7DM4fvPTm/3Rl6ME1n7it2B1M
 T30gPbuZtIE6zll34iGAqLPSdG6bmMkAT7qZrHG23Iy2IrCRlFaNzAsYQxUBUtDS7maR
 lsMpgjIPLbqvPDQlAxBB7JqNjvFBayTSyW6uH39IJTaZMduCtQ7pwgshj2ZogHfR0AYK
 rC+JXeUG8Ftfy0mqFWAjEeGKNCPSA+bU+DULdd9p41k1p8IbO6nixuAiWR3klbBC35vM
 ims47ez4t1jO7VNTh6Q4ji0M92+FQztMbbM3vX5S4RlQYC9J2EyktcqMDI2JKUeROJQS
 ApcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hz4Mj/iQWQ1Gm0J6ofti89mpz3pTQ7LpeTX5svYgVDU=;
 b=Ryq76EQDQC+ddsd9wPf8TW2LCFxIVZdcFsboF8LAuyawdTMzHeBerJsTQ+gW+ZHTX1
 VH2cvYB0XksJgoeTeu2f/4LAZS7RLTA6NefnHdZ7YeIDojWdawWt9HO2b35l6bxlqouI
 P1amaZLtwcuPbMP0I82pfprfRYzU4H5rMHkd+z7Gv/CdJlvOVDoOLZkG4c/4JKS5ju5I
 Wtg/TN/jw40L7wIiuYC65JvCtcO8Vejn5hNG4UwHFMTSptoMaA1YRIJNK4L5IM3vtNyt
 iS2NbB1GgmSh3zZpKupPZyySniFoC4gz/VQ8u1L3kKniZMKmzPZioDtHSnwoUsJNHKPB
 ByGw==
X-Gm-Message-State: AOAM532vL+cT05uaGkTcCWaz66yQ1TqwaA1Zgo2sSn7kD/1vfDhYJuPZ
 DlC4QCjGaXNI9hHOKsxPC7ddkw==
X-Google-Smtp-Source: ABdhPJy7+DRCrQWC1YEAlkN5Qs9h2rvj2F4QBQqw8k6R6J/7z34EhuVEi87Gs/fBbFtsm5CKS4/LNw==
X-Received: by 2002:a17:90a:f695:: with SMTP id
 cl21mr35145208pjb.86.1593716260173; 
 Thu, 02 Jul 2020 11:57:40 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c71sm7396890pje.32.2020.07.02.11.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:57:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 0/6] drm/meson: add support for Amlogic Video FBC
In-Reply-To: <20200702074759.32356-1-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
Date: Thu, 02 Jul 2020 11:57:38 -0700
Message-ID: <7himf5iw2l.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_145743_858437_4826BC5F 
X-CRM114-Status: GOOD (  13.50  )
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
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
>
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
>
> The underlying storage is considered to be 3 components, 8bit or 10-bit
> per component, YCbCr 420, single plane :
> - DRM_FORMAT_YUV420_8BIT
> - DRM_FORMAT_YUV420_10BIT
>
> This modifier will be notably added to DMA-BUF frames imported from the V4L2
> Amlogic VDEC decoder.
>
> At least two layout are supported :
> - Basic: composed of a body and a header
> - Scatter: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in terms
>   of memory allocation but frames are not dumpable and only valid during until
>   the buffer is freed and back in control of the encoder
>
> At least two options are supported :
> - Memory saving: when the pixel bpp is 8b, the size of the superblock can
>   be reduced, thus saving memory.
>
> This serie adds the missing register, updated the FBC decoder registers
> content to be committed by the crtc code.
>
> The Amlogic FBC has been tested with compressed content from the Amlogic
> HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
> (Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
> (Scatter on G12A/SM1, default on GXL).
>
> It's expected to work as-is on GXM and G12B SoCs.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
