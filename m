Return-Path: <SRS0=TX8f=BU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4AC433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C65EB2073E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huDIrMWp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gpgI9nME"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C65EB2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PH/P4X9GbK4js4aQXPoJRK4sKIxDSPGyWmjG2oo6x8U=; b=huDIrMWpTYx07wT+Q1D1P//VS
	JZM2BKvQt8UoWkNTemJ3pTymeIHybNV/3oHf89QqRRNNepiqZVcfbjJeN4o1Sfway2Pg2OOV+ShNT
	nV3uwiVG81YC0yKeATMGO5eI6DEip2BBkcfqpNo5u5GWGJBB+DkpYOxznS6qOo/A2rNDlD3ANJFYU
	Vo6A1DqSjA2vTamlJJ4Yi9mgxeIYkNxrnVSDlatj9eOt5AEzZt15B1+h/vH0hgnurPimqIj2+PC2Q
	h1RC15d12s/uauq9POYx1MMjgsp27IAoMHf/jqFe1fWG7NcHkCgbw8L3cD1W0LB/MFvFeUp6TVSph
	vlJlwTJtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5G7O-0001L3-3Q; Mon, 10 Aug 2020 22:18:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5G7K-0001J4-CV
 for linux-amlogic@lists.infradead.org; Mon, 10 Aug 2020 22:18:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id d22so6508588pfn.5
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Aug 2020 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTpNTLZEF1YuYGMjvco22c5p9oj/9YQ3/7+kfvmutjo=;
 b=gpgI9nME6ebeu07iGuAbt98CnW9J3B4iRK7Mj6+5t3/n4TRwduP2BFOEfbdabewJrv
 vFBtqSEG773dbf0Im8KIRLjn6bFhIfdRl4kJ1bC9rY4hXRNtMZ8Qmg2/zDkoJ2RloT0q
 WnuqhWpQDC66pBsO/t9ub9tZKMDxZHCfepGlgybh7SePt1dPo/W5qGny9DAfblLjQF3N
 8htKX3/bP4ITeARNNi1SLNkujUvPMwVl631hDidyijKdWZ/INg/Ziks+zb+skyeZKRtT
 5U4FS0vb3o0T0ofCRgQABAxOPKXhLud3HhuBnyYVVFnkfqx+UJmX0Y+mk6cSbV22wcy6
 guGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTpNTLZEF1YuYGMjvco22c5p9oj/9YQ3/7+kfvmutjo=;
 b=DPlWnPClOJECFutW62dlsLWc6O6x+kyoYzINs4z/JHYX4N2QN8YNXUbuTg2wP2D6iS
 6HwNaCYvLrIv5ldS2G21at/JX5NLcgIF0PRiufjs4lwE/JLqvPtdB0zPUMDeg2ZoZKMw
 0MIOw7+jrp3IsxUqTZR8RcbVP8drfbjHK/YjgXGylbUOcNmOb9zDu6osot8v2SqzVKTE
 52HzdSaFFkEy25tgNRbeYTI7zmeyW6dGJ/8CbhJyH7Dma0t7+DTimGwAq5rNpPaQRWDf
 cGyvYKDcOu4a+aCHcTgzHsnwiFMfENR/OQP/pc/fMSD84WQwxf8mu9AdN0f9iKh9pAj1
 B+RQ==
X-Gm-Message-State: AOAM530++KZTVZY8Gf9wTrpcbZO3JTJOy/7p2UKheULMIHJtjzdw5IDI
 XwZWOKiJ/qHr8mCyXh0PUxBzTw==
X-Google-Smtp-Source: ABdhPJxBm7Zw256hy2vVGlHoSSzO0FkytWwFgr+sWfiGGyL+LjW9MEiZs0vZqABHDrIEDhVlZO9Jcg==
X-Received: by 2002:a63:485f:: with SMTP id x31mr23694566pgk.49.1597097882636; 
 Mon, 10 Aug 2020 15:18:02 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l63sm19147230pgl.24.2020.08.10.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 15:18:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: vim3: correct led polarity
Date: Mon, 10 Aug 2020 15:17:59 -0700
Message-Id: <159709786936.10576.18026946638295707275.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803141850.172704-1-jbrunet@baylibre.com>
References: <20200803141850.172704-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_181806_515954_BFE3433E 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 3 Aug 2020 16:18:50 +0200, Jerome Brunet wrote:
> The LEDs on the vim3 are active when the gpio is high, not low.

Applied, thanks!

[1/1] arm64: dts: meson: vim3: correct led polarity
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
