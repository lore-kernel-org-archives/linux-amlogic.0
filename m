Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D808AC433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC2B2053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uE4KSZVZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R6e6hElL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC2B2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mAXM+pT7USZver2GGTNPt0FYJ5T8CjGf7RZKzLkZKe8=; b=uE4KSZVZuXNS026UyGpbYtSQM
	QW6PKIqfTZ5iCJxNmXzqfM2l7fQOteYXfximBALkHx/kKBPygdsAPM6VDhunQfzDOWwiWbUmT+57X
	QYDW0ZvJ2HvtvsNvsBKTbI1t+AShk88uzucjZc6w69hJO9pAEXMONNSWbHqiyO7+gi97t0j0xooyT
	Un9V5cuFvvvAn46MFlAOKYVHDRYzg2Y1IgET+W8oXvLH2WhxWHBu/1L4Lz40nybR2X0VTZtspUM15
	i7BnmCjXecWDR5IQfgtkozPowRNGSqedbCoG2+IlA4hJQ0091gcrNqOVM/gPJWkw/fPq1iXMWqrc4
	dEOLR1R7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oGg-000381-HY; Wed, 29 Jul 2020 15:45:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oGc-00035j-Th
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:45:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id k20so3420486wmi.5
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWqyEKTC/HJjMKifmyPTB4RZCmPL+DNrii7Si5MfMvM=;
 b=R6e6hElLlc+cKRmwfD9negfPjHCnH1BoA3KEGyKUVu+4cXtnt3BZD57hM2PlEEHmI/
 sqd2gXZg6qgdERDcATkW1xvA2BW9ApWfymSmV2YB6nEbHiIMBJJDmrsI+BaHWWeG/Us5
 U5Sm96lEvo7l/QRv4D6UEIgelIEez1Ks7QNRWZ1C/D8Cu5whCC7FoPyMb2z3BhRG2qgy
 FnBLSmNJOF1c50vViNF9o6VQ7a4k8Cx1fyQCIiNcYpM1c9YgLxXz7T+LYBgIxVV/A6Rw
 KkgIGG2I94TbAxr15mGQj9KGOCXZ8j9Xy0OLXIE2Z7A/ceEyEaCYB0q9i2y1J9ZGF17h
 1iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWqyEKTC/HJjMKifmyPTB4RZCmPL+DNrii7Si5MfMvM=;
 b=cBNt0Kgeaf8nUPFRdn0XHvizPY0+WpEOjCwBSTgW6puwx0Vy2u+St/JMS7/K99C+Oo
 QJ8q0ky2eNoNqLFkFhPdvakNuxjv2AXHAUK4+r0OXHHXJkMdLwhHU9Jm9H1NKaJawKMJ
 Nrrtx+1CegfWb3bcWLf3s9pKQHIAjVpBbFe/rCs+mDN8ReZFa4XCN7Mpg9oQgV/XBcGn
 FjAx3B6o61YbT36jjpkjQb1IKPRrTUA3ldyvQBx8w+QjPlU4n9g6SxwrPyGyMKvFtwvZ
 2AvUxE0nG1ag6rI8nu5wS15cqz4zpoVibnywtcvIrVHUAUUdkiN42XKRGE0u7j0brR9R
 uE1w==
X-Gm-Message-State: AOAM533jviGXpbx/jjtBeIOuVylNenN6Ubbh0l8RgqFpQM7TNJq+nRu9
 qi/D6m/vVt5blRfRJdoGhDHveg==
X-Google-Smtp-Source: ABdhPJxgGC9nboToZyRcUcXbiOSxER7K3hBnDiXzlzkgzlpkoRrJEvHRzVMhiuKp6ZHByGydbFxnFg==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr9082184wmh.174.1596037517108; 
 Wed, 29 Jul 2020 08:45:17 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: meson: cards: remove DT_PREFIX for standard daifmt
 properties
Date: Wed, 29 Jul 2020 17:44:56 +0200
Message-Id: <20200729154456.1983396-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114519_047801_87A9CB3C 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Standard dai format property don't need the "amlogic," prefix.
There nothing amlogic specific about them. Just remove it.

Fixes: 435857e015dc ("ASoC: meson: align axg card driver with DT bindings documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/meson-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 29b601a0e274..f9ce03f3921f 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -119,7 +119,7 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
 	struct device_node *framemaster = NULL;
 	unsigned int daifmt;
 
-	daifmt = snd_soc_of_parse_daifmt(node, DT_PREFIX,
+	daifmt = snd_soc_of_parse_daifmt(node, "",
 					 &bitclkmaster, &framemaster);
 	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
 
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
