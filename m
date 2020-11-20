Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E897BC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:46:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF43206B6
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9YQzhyt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BhkryZi3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF43206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FA/W6C7arpV6U/Pj4sk5VcKsOuBAq8SnjlXX0cM6Dok=; b=l9YQzhytuw8sBfB5uuiih1Ris
	Am+wtgW5BrPRgsPegUhdmN9q2DC6vUYRM/rm8Z43rez/wL2JF+1rbFul2IYSTH5zS104Y7Gmszjsi
	NjCKOFGVlZl158xMF3WGILKtMvq5g9+WAn07GN5b9LFHGHIEueUOQahnUUlTosnj61q3uU1xzulPI
	uVO1GrRgFgpE/pP5aD9JDzH4upct6tgWWbyVqaSlUG9xRkSWgzlmwGP8QGZfx135ehwQoDHlC85wq
	rnI+cTRGRqk1sSerSeYECZ0MssuTL3l9Adh0xDVmkUpdwyssiir0vkv2P+gEHeQ6KsPPN6Yt3RPrR
	MEI6aXhoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgCM0-00060T-W0; Fri, 20 Nov 2020 19:45:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgCLx-0005zp-J8
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:45:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id p1so11162019wrf.12
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=C8pk3+3XmA9EuaPzcL+Mq85e1ZBFbHpA0gmAlogKnMU=;
 b=BhkryZi3Y2xC3KUBGfOVMsXE+KYJELfJh8pm0FQZKxYSyH+dO8wGVehK8Q38axFABP
 Ez3z/2tBYX83YxolCFpvcUEdz7Dp79qW8a5tsS7jR12MAmEd61fzeADiiR8zmVUQ1jsE
 ipMzNAwbTqNdhx46m5ZsMDFWH9KI+mssqjIxMa/Z0aKalxwPPUNL9YGTuhdhC3uNnWZ3
 Obak5Ul2plu3/f1uIumAojQ1ome9VNko+bM1tVBU0CCc0qcaX21bZgTgcnkEIU8cM5sz
 hRMj0BBKAVgvWGOaPUeNj6hIMJaIItOhasw4yo7iJjTLrx3J5G0XSCtXpjd60sE4Tc1p
 3zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=C8pk3+3XmA9EuaPzcL+Mq85e1ZBFbHpA0gmAlogKnMU=;
 b=D5gHvmvdJCVk+OTRc5UDSvu8IrPLJVR4Sa66ywlMvKVPdSDcAOcUk9VdrNcWGmIWix
 eF3ebe0qtHyOvvkLvYDTQ/hVozkJD/Ryw/nyQ+N94H47Q8sBo53JYFsTmUQpUYAzekeW
 jHreM9mqeKAtRzh8fLUbq8zPDpY8OwfZ6LtAUlxxsd/LozWMpvzC6QHArXqE4m9MXVoF
 HY2sqsISWsnWd3Cb4It/iwN7seMwhxXnQJRPiIb3rdmk3bBXjENOiI4Q9WqwbNN+dTQT
 jzL7s4zAIsopkgvMAQoI4GBmzxCk3vhS11M+2R466ZlR1S1C4CjpbyJGYtiCYfyMX9mm
 24TA==
X-Gm-Message-State: AOAM5320ZZAyoKJfvXgV8N+qtRIFeFIm4Q8nQ7+ydRKuHNEwYDrdAXZN
 otM9+cvQpcbe8Dialx1rn6kARg==
X-Google-Smtp-Source: ABdhPJx1s2VWNHnr6Kwi0hRZESmXdVLf3f/zB4xBFNnc+j8qo3jEUK/vscFfbY69QgDyv+MnkTHktQ==
X-Received: by 2002:adf:8030:: with SMTP id 45mr17735717wrk.407.1605901552466; 
 Fri, 20 Nov 2020 11:45:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i10sm6628173wrs.22.2020.11.20.11.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:45:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] arm64: dts: meson-axg-s400: add support for USB and
 PCIe
In-Reply-To: <160589952950.11499.15261993036625823660.b4-ty@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
 <160589952950.11499.15261993036625823660.b4-ty@baylibre.com>
Date: Fri, 20 Nov 2020 11:45:48 -0800
Message-ID: <7hwnyfstg3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_144553_686062_45D51155 
X-CRM114-Status: GOOD (  10.40  )
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

Kevin Hilman <khilman@baylibre.com> writes:

> On Fri, 20 Nov 2020 16:32:25 +0100, Neil Armstrong wrote:
>> This adds the USB and PCIe to AXG, and enables USB & the two M.2 PCIe ports on the S400 board.
>> 
>> Dependencies:
>> - Patch 1, 2, 4: None
>> - Patch 3: [1] arm64: dts: meson-axg-s400: add support for Power Controller & MIPI-DSI PHY
>> 
>> [1] https://lore.kernel.org/r/20201120152131.3918814-1-narmstrong@baylibre.com
>> 
>> [...]
>
> Applied, thanks!
>
> [1/4] arm64: dts: meson-axg: add USB nodes
>       commit: ca91acde9a9858a20522abbb2c79c6883ef9bc73
> [2/4] arm64: dts: meson-axg-s400: enable USB OTG
>       commit: 160f1630878e11668336fded29eeb0fe82fb3faf
> [3/4] arm64: dts: meson-axg: add PCIe nodes
>       commit: 9bfc5abed67ae7dcc837dd8f6d61396d1cc9ac2b
> [4/4] arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
>       commit: eee685ef92d8cbabb2a61c45fe7d976c3ebc9b1e

FYI... these commit IDs are no longer accurate.  I relized that the USB
patches were already in my fixes branch, so needed a rebase.  I fixed
everything up locally, but the commit IDs are no longer the same as
above.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
