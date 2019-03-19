Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885A5C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A6F20828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+Epn56g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f4W+7bdI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A6F20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zTuTrau7jBvhyFghWkxricPpWKpFeBEpNAMfLjfhHwQ=; b=c+Epn56g+jkPBI
	d7NZSkH3wtKfEfYb5P+A3leqkluvi0sWnUvQe0jOULn7xiEuUUFH7oefR/WBhCgMlKYz5YAQ+pCla
	xUKrui3Rwd6MCEfxUVrJ9iYljQ6D8rbP6slzC5d+IWewL4JoaJDc8XXep01s+7ixYNClE7VMmqlal
	lHmUKvNLfjt8AnGXMRC2i94thGOCqWVKrRP26ldqkPOaQjdOgm4+K+rNfmfNtiokyyJQ4oYZkjcos
	gBIm5J4J5I3aECRc2WhCEUacqqHaT0tkMZYxpyIL3fKnnDoV1mh9krP8aPlWp4TPAytgrhrMqIT5b
	G++0Gzw/KT8mZkRMfgGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Bj2-00085X-Hg; Tue, 19 Mar 2019 10:12:04 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Bio-0007vA-NB
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:11:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id w2so20287737wrt.11
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9yVsy2U2fQ4Cv8Ug3KJAXrZHWOeSYhR24THaUMb+SU=;
 b=f4W+7bdIgNoZq0rZHqyA/sC5BffDx76TnmSUfoDj7qkRuRN0K7RqRUaCWvCQNtBZ9y
 zx3LIprSg46eGLEdOcz1DvCoRPpoQtbB21YeAUBo8EugzK3ZNDcgiFGEBXbSPV1VJ/yx
 Xs8pSxV17+j8qCLuUuma2ytDBPxdpPEf7vuRZm2vCQVBQhvyIgw3qToihZDzMehgxaPo
 BX1JKcpJJDemAsqhBrwYvtrDh+uNUYYJvSV/Yb+mO/doinahf/dBPp7EZv69vcd24ZbP
 Oe43s63SbpWrB6kGpYdVqX6TAGFcNQQc9YogSb82RX+/MPE0kw3LSkCGG5RZwI76r9hn
 hkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g9yVsy2U2fQ4Cv8Ug3KJAXrZHWOeSYhR24THaUMb+SU=;
 b=cL8NhAR+ObwXUKWr0GpFNJA/1hWYRv3MJI1Hg6Sk1YgesfM8easQO4G7y7wnzRNOjc
 8H2iA2WaWY3k4203Q1kkUlnQNLVqGVj1lvDubvAicSg7lGBVyO0cO7DLOLeecrgAPPZE
 T90aXhi80Fdfm4MPf6BUHR9SdkQdrVCnf0S/Vfb9OZ3Pt9Ym4MLNn3Z5/T8bZlVwQ4Jj
 qXRNJesEVZXEMOXzmIENqL/EIOVdYVxe34eD+g+Tej4KLx/2uQeTZC20ubSYuWY9d5qj
 uQZmVaamf5hFf6mxT3yHfbOXtF/5HF9sj6+8q6JVuuY1tn8mNeClRtll+ae85zSXgGyy
 lZ7g==
X-Gm-Message-State: APjAAAUyIxOgd+Xs0Q8OdMaTG2TJG+u9WBdYZ/J3+2Z0ZSX+8enF3rTi
 +rrETKApWlPzFZBvJgPLDaQhTQ==
X-Google-Smtp-Source: APXvYqwUo0KR5WJ6K06wtK6h6lPQCRijNUkBdsnpPrGkb3yrcmLzg9qRjTKRdOGOzouxoqyfqL3hjA==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr7833647wrq.279.1552990309225; 
 Tue, 19 Mar 2019 03:11:49 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id h10sm3911245wmf.2.2019.03.19.03.11.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 03:11:48 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] clk: meson: add video decoder clocks for G12A
Date: Tue, 19 Mar 2019 11:11:36 +0100
Message-Id: <20190319101138.27520-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_031154_557905_0F336085 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series adds the clocks related to the video decoder on G12A:
VDEC_1, VDEC_HEVC and VDEC_HEVCF.

As to not conflict with the IDs, this patch series is based on Neil's
last unmerged patch series: "clk: meson: add support for PCIE PLL" [0]

Changes since v1 [1]:
 - Apply ROUND_CLOSEST to the dividers in addition to the muxes

[0] https://patchwork.kernel.org/cover/10842969/
[1] https://patchwork.kernel.org/cover/10859115/

Maxime Jourdan (2):
  dt-bindings: clk: g12a-clkc: add VDEC clock IDs
  clk: meson-g12a: add video decoder clocks

 drivers/clk/meson/g12a.c              | 163 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   8 +-
 include/dt-bindings/clock/g12a-clkc.h |   3 +
 3 files changed, 173 insertions(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
