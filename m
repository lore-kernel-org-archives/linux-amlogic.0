Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DDEC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E16761183
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E16761183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C4BugHZrmSzqnfqMuTUgGWrgitSLh2YXf3VIUeehpUY=; b=Hw7+YinMRKThHTtiQRn8YIYXw
	LlkwVX+AB4hAYb/l8wd/tbVz0vFIQEknhJFqQnHyVHUprJJ6jhlxWH/LUTjQPnN+W89gJkBBSAjCI
	Wv/LzZyCVKAK09aQzlUcXcUohajhksQnrPZv0LBeK5JAohxeBTy+prUC9zGOEYLB9j9S8D8513Syo
	JQ5dD15BxPDfcgaQUlHwe/QTHid8gSsjRvTI/LXumzZf8EZtDKEe1szRw1Lhm3z/tkbdf2PYzeIdk
	ncGCXcnQTG6j51jojGrrXLcPtiu1nIW/PaZBRpyq4s5FcU7Mojs3Pldl8YCgTVYu7qtuSBkn8o3/w
	FZuAKiIjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldiZw-00F5T2-Va; Tue, 04 May 2021 00:06:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZf-00F5QX-1u
 for linux-amlogic@desiato.infradead.org; Tue, 04 May 2021 00:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=vs/iwCoGgWSTxOU7UC82l4ENSMubLlaZ/ZNv0A3YsVE=; b=L3BA8QRDQxjsFo14eHOsXWBXUH
 JZrZBGwOco6l5xZMAqwGVer3lpk+TT9tHBqAI7dW+ye0B4H1PyyZ2KNens3Yjtpz9bRP/kUpTVsJK
 f3yrooF8SnxGYPWq+N2tYE0WECLslpuxVNnPj29kdNVhzClXAl7KMH0FqBh0o/MJoyQ6IRMFNywb2
 dW1AycUqnu/Q1E8VQTIKiFLRgOWAsSON14ZlGmBP0xgq5Br88KK7jhpzYATyaT++2KdjUQXvFaJAU
 COffJKdgJykGAM5ExCEpFF4M3PRfKkctYtDMGbzZ6iNUABqbhTd49w7d3uVSm7PGMB6M8ggpYcQZy
 2a4ubjAQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZb-003ZE1-Hu
 for linux-amlogic@lists.infradead.org; Tue, 04 May 2021 00:06:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t4so3034364plc.6
 for <linux-amlogic@lists.infradead.org>; Mon, 03 May 2021 17:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vs/iwCoGgWSTxOU7UC82l4ENSMubLlaZ/ZNv0A3YsVE=;
 b=vhNv5sA3oFi+S2+xJP4o3wjvcrSZJb9IY7Ln3ikdJKCfWLDzYddEksLCHlxOsqjZbt
 pmPYcIhtUoX+Mvo6DK8mdor+smmeGF/3oXUYfWjFwhm2vW4GeIHk0vArwbi0l5uXt3He
 jkux3mp5cOlLzG292/luw8TH0fE6sk1+1dTy6vnd8U89au0tQOGW00JwkpVO40PCSmud
 yG489mDmqOJrWimMlRrQPBCBjWDTiBWINJEPh+uaD9D2wm1HkLw91V8O2b3e8VrHKASR
 p1z4W82N99YSKl9YROX3Pcf9Fy9tmaax/f1Xir4fuN7a4io2P4nOlFXgRw8XLG3YQKG3
 OJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vs/iwCoGgWSTxOU7UC82l4ENSMubLlaZ/ZNv0A3YsVE=;
 b=kgxvvzIwjmGg5DJXSYneqHR2kOf7sRf20jDAsdCYyO1eQiKiQdo4JscXrblkBpp/Ng
 qTRq/CYFQ5eeoX5Z2wyDRg41bCcTxkDX/u2P5NWrwIq7Zgm8AmajJuI/Fz4ZxSKyUiSE
 +uJvbG0XE0ygD3Pl0ln15aOxumxUe6OwByCOLtx0D1M26vzasr+TN5o3DGS8jVqINqcg
 uWkViT5vWo5aZdPQPC112CG0tKwWW80/RqCLpgE8DK0/ZGnq6BTEiw29CdpP4MLsrOUj
 mKqAoThKGtAYht8hlVOX6LMyChe9a7l4U5Nvt0UEv9drworCo7UaVRm/mMZugfwDa/wn
 o3Pw==
X-Gm-Message-State: AOAM5336D77EWPMB/32R4kDQzTfXlTE++Ehk4vBr9/zcAErq1eopE9rX
 lXf6NdVAIUPMKvHnmxzgWieR9li2HFW5iw==
X-Google-Smtp-Source: ABdhPJxv+ZZthqzR+gyi3hdNJ+x+W/Jd7S4Zviivb1wcy5Wj3aMCX+EK5M23MjOT1tbM8rWZ3t8/rA==
X-Received: by 2002:a17:902:74c5:b029:ed:d41:1ca0 with SMTP id
 f5-20020a17090274c5b02900ed0d411ca0mr23224442plt.66.1620086757057; 
 Mon, 03 May 2021 17:05:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a18sm10034023pfo.64.2021.05.03.17.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 17:05:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: meson: select COMMON_CLK
Date: Mon,  3 May 2021 17:05:53 -0700
Message-Id: <162008674673.40672.14279142646066453043.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429083823.59546-1-jbrunet@baylibre.com>
References: <20210429083823.59546-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_170559_610594_1F800668 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

On Thu, 29 Apr 2021 10:38:23 +0200, Jerome Brunet wrote:
> This fix the recent removal of clock drivers selection.
> While it is not necessary to select the clock drivers themselves, we need
> to select a proper implementation of the clock API, which for the meson, is
> CCF

Applied, thanks!

[1/1] arm64: meson: select COMMON_CLK
      commit: aea7a80ad5effd48f44a7a08c3903168be038a43

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
