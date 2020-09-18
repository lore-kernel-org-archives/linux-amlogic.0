Return-Path: <SRS0=O93K=C3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D35FC43464
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:40:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0BA21D7F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2020 20:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="asQTSKV/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E4qKAGZa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0BA21D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCcVgXThzcTXQxdFDpA74YJ/74c4BRxE3Z+kAyyq/5Q=; b=asQTSKV/FNui7loWSQsbg/bLt
	nfKVDRKSGb5LwzVrl9dL+nxRu/W/RCqCVj+zGqD/BoAZkaZTrIKt4m/Of8uIj4SSb8fgY3lbTuZQP
	9An/z9nGtQuXQsMYoTKPFKH6snFL+kPasU8/BYOAmKeN6qoy+xKSKnDT6JBuEyLLCQ3VxeJEbl5bC
	IWVqcvRfpn1VNDfYoI3qKcOhT0sTOqlxrs3Lx8Z4Udulgop9E04sPtIpeYv/2NkE2PS9FwZv1ox6d
	K+paupNsc8zB8mAuM+0LDFoUnyujrNEWStpI5o0+Pktz4AjRFPHmtqEP2YHjcPbt22p/U1uRry+Sq
	WqII/R7qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJNAp-0000zW-GE; Fri, 18 Sep 2020 20:40:03 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJNAm-0000xX-01
 for linux-amlogic@lists.infradead.org; Fri, 18 Sep 2020 20:40:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id bg9so3599879plb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2020 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AneX3Q6t9WnVcMWg3z8DFQA8bgEvGwpeuWE77g6/FQ=;
 b=E4qKAGZaO0N1RaSvlxcy0M2gkjiUws0KeGww0wt94xT8okM+bO5at02o4hbHtGicp/
 1kghus1KDRJvmh7+OXI0eXr1mPlL3l19ovwWEEZsP4aL81XuS2SQIJrRJ5RmjOr4umwL
 Ixp0S0vYX0oMNfhY3hXjUDz+KGUr2R70Z8J/zhOFOF15+6z2Pjbn0Lwb8vizESYfRiYY
 yZyDJouBXPmDZ05u5LMb3C3vSEIhoJMdFK2ZtmIhWVjtV+qKcxU9cOhHQg8faCc0a/3D
 r2jvPXuQFMheuZ6qma+Vc7w4aJMt/ampCp6XINorY67gF8ajSADtN4ODVoe/lfHCFFC4
 9sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AneX3Q6t9WnVcMWg3z8DFQA8bgEvGwpeuWE77g6/FQ=;
 b=neWkErkMbePMh06OIdaNS3kKCFH7fVicb5HaQrJOi8hRUR3A8rQQS7+G6DW4egTKUT
 xPv6YpqMF1xcTW9zyeuZM1Rok2RyKek9TXTN1wXE3PcSV6ryZf1m/zPcsC8cXWVzzhh0
 RssoKuL8ZoYOJxDZVC1p0iZ8lfsyK699tEKwGEJgZRIogQOfLRxzmcf/WZfUbHdTvISf
 O7jjfq55BNPTAI3VlCXpqBkLDRD4aQR7x4dQnOVm08gp6uS9eYD96m6uOKeQfYXCd+mh
 58abRB15e137ujdcNxMBXlis/GFmuESfxFLVmlF/09PtJvbtIckpuGV/AlcBgKKGsMmM
 VWPA==
X-Gm-Message-State: AOAM53197VJBR8jwUepJvkkwHYa1iPoWQCVDKfTyH2DdRSfi9zWfbAEK
 +26g8leqaXU5fD6wloWPhrBD5saLojALRQ==
X-Google-Smtp-Source: ABdhPJz8hk0ivJdLpk6wnP0zzcjbIGe9NnuofGDnq+q1egBRoYW2uCgOtoPsSPkLfDc+AvYJ4ZVyQQ==
X-Received: by 2002:a17:90a:4802:: with SMTP id
 a2mr14094057pjh.5.1600461597809; 
 Fri, 18 Sep 2020 13:39:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k7sm3687272pjs.9.2020.09.18.13.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 13:39:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: add aml-s905x-cc v2 support
Date: Fri, 18 Sep 2020 13:39:55 -0700
Message-Id: <160046158476.39596.11410761986578760376.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915141921.57258-1-jbrunet@baylibre.com>
References: <20200915141921.57258-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_164000_066698_429E9A64 
X-CRM114-Status: GOOD (  11.36  )
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
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 16:19:19 +0200, Jerome Brunet wrote:
> This patchset adds initial support for the libretech aml-s905x-cc v2.
> 
> Jerome Brunet (2):
>   dt-bindings: arm: amlogic: add support for libretch s905x cc v2
>   arm64: dts: meson: initial support for aml-s905x-cc v2
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s905x-libretech-cc-v2.dts       | 318 ++++++++++++++++++
>  3 files changed, 320 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts

Applied, thanks!

[1/2] dt-bindings: arm: amlogic: add support for libretch s905x cc v2
      commit: 0748c77fc8dc6bb20f9af395872ea35d8ac85998
[2/2] arm64: dts: meson: initial support for aml-s905x-cc v2
      commit: 63fafc5a046b1e21756de691b48f0c70c25e1426

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
