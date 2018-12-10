Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FC4C04EB8
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6FAC2082F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hZYq3nUh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HhFJZxUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6FAC2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SvsQZfjRpmyeF5aFKuYlL7V/AcN19ygICXcucs+NCcg=; b=hZYq3nUhrVQ5IQ
	jI6u/TrYEgbif6DvDiI2bxqgSG770XgM8GWvUwyBEVkKLyivpeJoYpsTSlvA7KM/kC0FchZKRvPXC
	pGB7b6ISFh2bTRvu7UfDruIbawZ8T/oJyDsxjET/FN3LXuPcQSUTuNsKi/UJpX7P4t3f2cv0lRjxh
	xW4wgcPzOwjssaL1zULPJi4TShBup6yrat7cLrsS1e01goueqw8LocXc5mmLyyQkhrAQiouThoAQG
	LTX4GatToxuS93i/obZD2Es+ntLvBZZn5U/G8MEeBO5GQpIQ0vbt0iR34XjMlVxyw8Q2fsheX9cp2
	AgB3/ZrbljeaQf+NfaWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSYY-0003u1-Ln; Mon, 10 Dec 2018 20:53:34 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSYV-0003tg-Od
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 20:53:33 +0000
Received: by mail-pl1-x641.google.com with SMTP id p8so5813856plo.2
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 12:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=E2ptauhU/eVM5+PNZ53FHueVmGN3+LyZXA+MAlIf+TU=;
 b=HhFJZxUhr9/c5Ws6Ml1r/S+gEaXIc7sSrnWAZ/p5vg0saX0tvtEJth5fEp3BdYvlrr
 ytaFKFiHaeLHzTJhLDRlK28E9g8cSjUe/5AcR5yH2eKwAhN+tLGt2T2RZeXC0GEoU+K8
 GB1WyHgY2S5Jl+iUDPeX+NFMI7yptMMs6TRJVu1w7uB0YJXERyEyJLKDOasj6E00lIc5
 xnPjNtibC6LzHY4EIj/sHTa8FwJM4PPZib9rbEy75+UJU5DtFSkAgM7eGX0KPjmxgPJQ
 AKcYmUvlGbt1ftC787Km6DeNxJdtTfNwi2GB69ASe8NS2LzBRNBZlTlQiMmiKJYe3iat
 oc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=E2ptauhU/eVM5+PNZ53FHueVmGN3+LyZXA+MAlIf+TU=;
 b=GFQvRpy+Qb2G4Bq0Q9u1vM+vtOaLVokNkbXbuUaTrngkJKW35asS6Hh6g5+/ehZkV0
 MJTlmeTw4y28HZ/JENlF4V73amG06RcquzAfd90ASZj2XQEpzzwvBZ6O3d7Cn7fWfJgJ
 aLFcTsXXXbkHkN8PyEQSH51kMhTBccRQ4PZPHafQ0ZNnRm6C13Vz17SfkduUGxAs3ZrF
 CUAJEEjfCahojNWaQrrnnnbKkPsRyaMxljlQiS8HuZ+XnLY7WJbh8hFr1hYZFTXrUVrs
 1syn3fN9PcUgQq2OSC+/LluPLlbP4cldzubkfEunLQ7enHEtlFetCQOpyl7hfKVUd+E/
 O16Q==
X-Gm-Message-State: AA+aEWZvH+VO+a07rCgFI/wu6olNcuslIPb4M3iWHGUglEdsiYyGb8Tw
 dWs/kUEPcUGL09CNseFWPUUnVJEPl+s=
X-Google-Smtp-Source: AFSGD/V7hCyCWQh6Mt2jMKXDzeg7s2hEogYb6h9astnaN2M+pZRGYFep75CbtoC4DewctK27q457wA==
X-Received: by 2002:a17:902:5a86:: with SMTP id
 r6mr12873187pli.301.1544475201074; 
 Mon, 10 Dec 2018 12:53:21 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id j21sm9184140pfn.175.2018.12.10.12.53.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:53:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] drivers/soc: Amlogic: updates for v4.21, round 2
Date: Mon, 10 Dec 2018 12:53:20 -0800
Message-ID: <7h4lblw1bz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_125331_856405_AF7F3EDB 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

This is just a single build fix for the prevous drivers pull for
Amlogic.

Kevin


The following changes since commit 2b45ebef39a2caad409f70b22b4a2a41df9815b6:

  soc: amlogic: Add Meson Clock Measure driver (2018-11-28 16:55:35 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers-2

for you to fetch changes up to f56c06271c1c3caef9c7ef200e3d89967fd98a8e:

  soc: amlogic: meson-clk-measure: Add missing REGMAP_MMIO dependency (2018-12-10 12:16:22 -0800)

----------------------------------------------------------------
soc: amlogic: updates for v4.21, round 2
- meson-clk-measure: Add missing REGMAP_MMIO dependency

----------------------------------------------------------------
Corentin Labbe (1):
      soc: amlogic: meson-clk-measure: Add missing REGMAP_MMIO dependency

 drivers/soc/amlogic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
