Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C689C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA4420780
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWa64/4E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dnyZODqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA4420780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ob+aEC1+uGA0RROdJuvja/qBZoXH916wpiMuJS7TGSQ=; b=RWa64/4Ec0Gw6k2KZVOwf9G8T
	XXVWAQiqpWZk4CjsHhdPPvbwppJNVLk0UxGSqsMv3tDOCbIlxFzT9t4VCJjg2we0ste7XfriqnLSN
	Ehp/id1+cZHI8I7wNSJyYs6jwuAofVrj/oozxeLhWmlGVlVENXove4K+VYj8vHyAJL8EHKAzV+7+u
	aDCsAjA6xMwxILSTrGEqD1kAA5bzoegioLtAD98WrrajVgViVvW4Qt/JsHJSA/eT2qeQLQv4NYRc/
	uMhisFcA8Q+5jJIoRBIXWhWtDIYGrZxye2HxeT+tZUHKakqHegQ4P2SCS3FJu7WAloSSchcTMP6yY
	7jn3u1/ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq346-0006Fs-4y; Mon, 29 Jun 2020 23:19:54 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq343-0006Ey-Oq
 for linux-amlogic@lists.infradead.org; Mon, 29 Jun 2020 23:19:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id d194so5646268pga.13
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2020 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DzWYtGd0GUCAUiTFuoYBXiTLrgADirz9J3COQ9mAmfQ=;
 b=dnyZODqa2RFPX9scaHO7AZPwV7FJNUC0SDuq354GBg9MqfTRu0zGRpxBGxs89JjSL2
 2o5BOJTwlmqmj52iJg5p6bC8XimTTgbqL8NZOXTCppKNq4hucwoej6UsvQgaANdWhdWr
 KsjZcK+gA4trK7iLq2WW9lT5iZ6sfnCwaHBi74Gf1gSVsAfijzvwsYB7PiCC4/RNF3ir
 5D+pIl/BYUPEvtrgPJVoY4pREyAQdZBjmjPfpSpBh4PtitTbpUFOCEgRKcBFjBbZsIyI
 hw4hyX0OVdlW5VaHmtUVs24UgoTwKDl1V7JwpP+iGBNYq0VBCUpV++vAOVCddrlrJXc5
 4Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DzWYtGd0GUCAUiTFuoYBXiTLrgADirz9J3COQ9mAmfQ=;
 b=Aj10CQYzkz7Gfp4xOiOyUuX95PGvBed4iX66XMzWZmUpcCtmJjbQmOMk5UKRgnTPN9
 9x2xkckyva1C4N+0zPEJJ1TX668zsKhaLXg+yMMH+lcXi+nspdJG9gdRJksX/5kOnkXj
 bqyva6vvDQPX1ZB1u/neA3MMv4n1xXbSRPaJQyY54YMhBLNGdGMI2ZY/IJv4ZxUsOu4e
 jqsixSz8PsDV25dSD6dWWp9N9sMTm0HalMPoCxdUBcoF855zWiulvindcIri/A2DcNdD
 AnDG1tdz/ZyE1+HOwshhH2aluDmfhC0c51/3swRiNrTNjHpLh9N7wjUrjfQPCldKCm1M
 XIvQ==
X-Gm-Message-State: AOAM5336c73imPFy/Rzb9F+N43IyD+rjq5SVTQixehR3X9SL1OUw8H/M
 ANRxDxzgTijbFGP14+TMsB8qMg==
X-Google-Smtp-Source: ABdhPJxzD8uqDWOR2wszcjzJ+LO3CWIp9Ucq0ms/H6Ci8WVC4UmVHQPBsSroA68D2YrGibKGncqHbg==
X-Received: by 2002:a63:1c23:: with SMTP id c35mr11992013pgc.91.1593472789646; 
 Mon, 29 Jun 2020 16:19:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v28sm739336pgc.44.2020.06.29.16.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:19:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-s805x: reduce initial Mali450 core
 frequency
Date: Mon, 29 Jun 2020 16:19:46 -0700
Message-Id: <159347276726.1911.1703935618732893408.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200618132737.14243-1-narmstrong@baylibre.com>
References: <20200618132737.14243-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 18 Jun 2020 15:27:37 +0200, Neil Armstrong wrote:
> When starting at 744MHz, the Mali 450 core crashes on S805X based boards:
>  lima d00c0000.gpu: IRQ ppmmu3 not found
>  lima d00c0000.gpu: IRQ ppmmu4 not found
>  lima d00c0000.gpu: IRQ ppmmu5 not found
>  lima d00c0000.gpu: IRQ ppmmu6 not found
>  lima d00c0000.gpu: IRQ ppmmu7 not found
>  Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
>  Modules linked in:
>  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.2+ #492
>  Hardware name: Libre Computer AML-S805X-AC (DT)
>  pstate: 40000005 (nZcv daif -PAN -UAO)
>  pc : lima_gp_init+0x28/0x188
>  ...
>  Call trace:
>   lima_gp_init+0x28/0x188
>   lima_device_init+0x334/0x534
>   lima_pdev_probe+0xa4/0xe4
>  ...
>  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson-gxl-s805x: reduce initial Mali450 core frequency
      commit: b2037dafcf082cd24b88ae9283af628235df36e1

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
