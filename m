Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D21AC56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:13:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A4C20E65
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LCcRIlxW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HawV3L2n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A4C20E65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YrpjPo1wkqxQi28xBZABxkZZCPAwvdEs2Dqh+P1c3ZA=; b=LCcRIlxWCXsgJBzeG43cHcyJ0
	e2MifO9GCbj6N8PDrZ49iLD3S3zzO0zZ08VDOo1h8I30b/a0tPmTg87HZwGt5JiHRUrWr6649UJIW
	46G8uvtxq/ZqNCptTwh45MzBrvBcGGtXeoTQrnwNktFBQiGC+EXkrcwkmGFeVpY+q758CcKvLalBJ
	9OLNPSj9BqHlGyUTRaBMkygDGxfP9q0y0j9T/KY8mC/IMdj7ah19Y0pjgrFVE+tBmTb8ODMSZheAv
	x6dcCMRQFHVDCUEm3ZAU7enpvxdvsldsjrc0iHVv1DZVs3u30ISob2Z+6CsYCowo2kVVBjsU8ZXAm
	LudK/bQpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBq8-0001w9-5K; Fri, 20 Nov 2020 19:13:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBpZ-0001lD-AL
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:12:27 +0000
Received: by mail-pf1-x444.google.com with SMTP id g7so8793629pfc.2
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2m7bIELcNGPekiHEneDd09dToAdbtTiKOaPTqFMZpQ=;
 b=HawV3L2nlwG1HU4wifHcgIBi81iOCTitYif/qgaordtI7UCxZhauaWNPz+zy+s1Ndo
 Oy60xWl6cCDsFT6VcuszfyCdVd5A/yt0JOnksYPhQtT2wofOlf9NvL95plZWNVQOcZE2
 a0xFP8TXVyzFjpBjobIOHCJagWHd4ZPgkfjQpktSmkMJ0PIQq5HGuVI7dO8HBwYTIT2d
 9zXNlyRV7ou3DQlEEXBjbL+9rSeZJDl14YqCG7Z1aHP2XBxoVKrjwQ6VCLql8cr7YfAh
 NAENLVshaTwGkADeBYVc2MmcAo6Rr8TMxmKfhTV5kDq49GYrXbY4/iuGRrEqN0K9/C3Y
 L+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2m7bIELcNGPekiHEneDd09dToAdbtTiKOaPTqFMZpQ=;
 b=BYXtx7FYZv1HAy65fvBfsR0RD2m04QkcB7ZkVMKQZ/3r4kSkMaee06BGpo1dDOE1M5
 +a1b7L4ujGvqEA0M1cW5OLVDHD5vCN8aoU4Fcym2ASZ0grdViulGriOLAZJozRmdEX6s
 7/AxuhF2N6v74OFTPjPQTsOZMUfe1zUlg5LWQyfydowIIlCHuVm2bVbQnNBIk4HW3wcN
 02jhTU6kf4F3gsQA/rWUMcTxD6malLInPqoYD4RfbgKEzV/SZSe1nTn0rm9SSxjSwhDv
 jBGJBXrgnulwVo8sG80fN36tqeBHjLLyPZM0J3FiBaWrWpKupEz+6K9V91ddwdHzp+g6
 Jlyg==
X-Gm-Message-State: AOAM530zkWw07dhJ/IOQKkHyLPp+VjiugV/NnOfjsk+OiWwp9s7Qhclm
 AufUlJ6+TNw00cb7FtNwWiNPYw==
X-Google-Smtp-Source: ABdhPJxTFnQnv5jgPjmlpmapoQC4M//o1YNKSzEN5O84mmMLGO3uuhXTJn2gF6BQyW4b1IJ0Jd5R4w==
X-Received: by 2002:a17:90a:5304:: with SMTP id
 x4mr11537722pjh.153.1605899542357; 
 Fri, 20 Nov 2020 11:12:22 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id u85sm4783149pfc.124.2020.11.20.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:12:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/4] arm64: dts: meson-axg-s400: add support for USB and
 PCIe
Date: Fri, 20 Nov 2020 11:12:17 -0800
Message-Id: <160589952950.11499.15261993036625823660.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120153229.3920123-1-narmstrong@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_141225_629868_A3B1AE9C 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, 20 Nov 2020 16:32:25 +0100, Neil Armstrong wrote:
> This adds the USB and PCIe to AXG, and enables USB & the two M.2 PCIe ports on the S400 board.
> 
> Dependencies:
> - Patch 1, 2, 4: None
> - Patch 3: [1] arm64: dts: meson-axg-s400: add support for Power Controller & MIPI-DSI PHY
> 
> [1] https://lore.kernel.org/r/20201120152131.3918814-1-narmstrong@baylibre.com
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: meson-axg: add USB nodes
      commit: ca91acde9a9858a20522abbb2c79c6883ef9bc73
[2/4] arm64: dts: meson-axg-s400: enable USB OTG
      commit: 160f1630878e11668336fded29eeb0fe82fb3faf
[3/4] arm64: dts: meson-axg: add PCIe nodes
      commit: 9bfc5abed67ae7dcc837dd8f6d61396d1cc9ac2b
[4/4] arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
      commit: eee685ef92d8cbabb2a61c45fe7d976c3ebc9b1e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
