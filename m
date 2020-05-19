Return-Path: <SRS0=cBSj=7B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D5C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:10:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D771D20578
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBvHhSaZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dr8ZTOpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D771D20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN7BKndFRvjcWhQ98gVhB1nYGWqm16sTqZRcKWhqeeU=; b=JBvHhSaZG7fKCK
	OX5zzm8Q9v0QSAEWsAlcEzbcKU29rvqf7UEFKkxrfGazjZgJ9yxxnM63ZbnyhU+ksm9UBh59kuGwT
	2vc2Hj+TnLbSpV+ImuqLZJyHAjJj1KkW9HSlrN7EsnohFef5UchHO5oleRfCzRpj87TmB1ucuSNAR
	V+PQFgooIxHeQdlmo83PuBAVY/zBqUkCrc1LDDRkb7lnGmEyvXaIMMPLKFfvSis9ylkHTvfpsQ/BP
	WseuyY/WsXeblgJ/vnmV6emT6XJ8Cxds5qoZOZDDsO9ouZDCmijIstyaJjGxAqKq3at1Oierajwqr
	ckaEd+WNTU7NPnAy4U8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBNd-00052u-HL; Tue, 19 May 2020 23:10:37 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBNU-0004ut-AM
 for linux-amlogic@lists.infradead.org; Tue, 19 May 2020 23:10:29 +0000
Received: by mail-pl1-x641.google.com with SMTP id m7so536224plt.5
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIhBgtFrqanZxaoDE99ayOKzut2GbNqr9j2tD0I6nAw=;
 b=Dr8ZTOprcAXuKEo3lno5QfSoo2JmOs9jR81zKjrpOBd/I/howaMAk9kD88lyo3RsFN
 GyXXxM8QdWWgKvp3tjNNhr3Ex3z1XDOCy8edrckMCu0yKDK7ZHP/qNSjoVg7f/hWm8Jo
 0CDbtZCE5WxNTMz50+iquyWVnM7OMwa1HkR+tKZol7nkDsNxubbJVt3EyCWinqPy5+rf
 40BVralUHrmDhSDDMFErcsxlHLFqsCsAYpJM8dQphqPaaZTXEU3W9+iNta7ATjjlWkYh
 iIVSUakYD+iG9nX4Ez1PA9K3XDCUAoEpO8Rs8LUWPrdNfXFqyo8IcSEE3C9qusTefyvT
 cJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIhBgtFrqanZxaoDE99ayOKzut2GbNqr9j2tD0I6nAw=;
 b=MkZL+FCJYvJf9oIYMtdHcGJCO2EsGVcIHUf9wtGleLP6f+PRSocx2P/vFRQOY4koSO
 GO8dTLXOAhA+qOiU8U5MV4XxvftbBK1DX8LOPT29L1z3WNo2f64VtEe3nuwmq+ZQ6KII
 UnetAnblVVRPcYw/Se61kXaXb3k2Rd9GBnxbHPaLY/pUTjc9n+qYG2UNvPHwQqSlNg3V
 wADaH5As4oza+XEzQF1aFsHw2jbxrEbDjxxdektE/o0TTnjwGz490IAeyR8nRVTbRxPj
 +zWN8CSLM91N58D9S4vlXAMmx4FHUT7tagyVERRZCwYIujsMjxjj2Brw1se5AkCbbVJP
 GwIg==
X-Gm-Message-State: AOAM5327KnwCu4IqA368v5M3i9YKvVz9JseEZI62VOm6P40zIsWFYZB1
 BN+LxaXpvGim9bWFawzZ5bbOmmQwq0SnQg==
X-Google-Smtp-Source: ABdhPJwBXr1mJnyNqJYn1wuy0/66dvQDSpj0yB5i/10Uf5tQtLlF1F1nIa3TamCG1/p9Wc7yiMkeEw==
X-Received: by 2002:a17:90a:a43:: with SMTP id
 o61mr1935891pjo.179.1589929827249; 
 Tue, 19 May 2020 16:10:27 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id kr1sm454125pjb.26.2020.05.19.16.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 16:10:26 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson-sm1: add thermal nodes
Date: Tue, 19 May 2020 16:10:25 -0700
Message-Id: <158992977729.3767.17121497893810166214.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512093916.19676-1-narmstrong@baylibre.com>
References: <20200512093916.19676-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_161028_362191_9872DE65 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

On Tue, 12 May 2020 11:39:14 +0200, Neil Armstrong wrote:
> SM1 Thermal is missing and broken since the G12A/G12B thermal enablement,
> fix this here by moving the g12b thermal nodes to meson-g12b.dtsi
> and adding the proper sm1 thermal nodes.
> 
> Neil Armstrong (2):
>   arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
>   arm64: dts: meson-sm1: add cpu thermal nodes
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
      commit: fef8ddfeaef8b7c91175e76bda7e4bd207b2d179
[2/2] arm64: dts: meson-sm1: add cpu thermal nodes
      commit: 410763ffbf629eee72f0257501dd448f861e3693

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
