Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464E8C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 14:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1668520835
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 14:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKioS9ll";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ingics-com.20150623.gappssmtp.com header.i=@ingics-com.20150623.gappssmtp.com header.b="tFMDgu+T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1668520835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+Ec97P6uVjwT+XMTXpLpd4CLoh5vbcuK0Wrkot2/NKU=; b=pKi
	oS9llQolhZHqgAGhu+eSjcfm5YpNwmRK/KoebTFrMBRckS0gD84XMdZCoJb8cx3170iT5Wzx/ayHf
	szAZxpw0zPbW4xJyoLESxINe7OeEC6s6RPWc4A9GcKox3Jxq4p5PCHCduBLWk/EZr2rdYGBIByiq/
	/nBIkNiF8xwbayr3RuxkrfEN1joxUX/uhnQ5QxGFiH/BuZKc/3t1VVkpeI8L3y5P5ji+4r/uuSnN1
	IOEYxfnaHezCt+AgQ0Q+Ey0fcgChBDEK82cCF2IyiLN4l+Hdkb0bdRr2kcpQq3C6WZhFdE4SzqRnk
	DD1mpVQ4s8e2oIokuKrp1wt/bGpCX6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ssP-0003E9-FE; Mon, 18 Mar 2019 14:04:29 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ssE-0002zm-61
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 14:04:19 +0000
Received: by mail-pf1-x444.google.com with SMTP id r15so8573677pfn.9
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=lLHW1ql+upsHrluKhKt1Ithq2tZ9RZtci7FqVFbcxZA=;
 b=tFMDgu+TlxcFaSxrDVLG3RoLKS6KyhiuOWOs0TQLOB9YfK2kWh/DUQlV6MzFabLMRX
 dfzNCb/aKdIjhN+yHu7o0I+Fq0sR3yIVKKj98slumvpQSoi2pGH+DS1p/E7lOHCR5/mY
 n95TzH06O8sWo06SGElS02E3NmY9mW43uBNd+Tp4AtBe4joaW8iGeOH9gzqIev1XU5zT
 d9YoL220Q8t/ZVxHs63alz6qsg6nH374n5Kpz3iEJ3cpwzUQOKmWxBFZgEdoOPvsCPuL
 KDHiosFwb4/jG/SDhfCVYMx4rxx17FzmGNCtC+ljDCURb5cpGyN5Xf5i4FAnq8M1ILDz
 48uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lLHW1ql+upsHrluKhKt1Ithq2tZ9RZtci7FqVFbcxZA=;
 b=TdIeOLK0clR1RPtZ5COvtIJ48wEx/4bTorXxE44fd31GMLnmHWZHWNB5Z3OJJoz9Cz
 G1syR+xgc62IVzZSlrgC1Vm/v0x+rD4B9XQ2+GDHzTsINGTl3Y2gHQFMFacKPFtO6sMc
 FO9O7kEbtW9y0BDuHnALczZC/u1Pk3P8Hk/j3o/KsoAaHqX5fBo8DXWVuOoWAoMaM41g
 qm6gWvtNduBeu0bnV+fyGHaufqzMk74Z6nMHT2a3oDmkVr4Oa86Mx1qb+kV4vSDUCqPD
 oe2jo0wDREhs2KeyYw8GXczbseww4MWoQ29lJPYaoxUd77hdE3RV9CXMVz1znltQcFum
 ktEA==
X-Gm-Message-State: APjAAAWWFoCdDkRATYwYPafu0vUkFXh8/JdXNFMvmqRAfaquQJrvukLl
 NBvY94hT4fEMb/wPG0VpcSu9PQ==
X-Google-Smtp-Source: APXvYqwaExEBlimaGbnNdo5fvahg/mVXE305R3A4faLhOK7o86TN5mOASCk1jCEo01zgX47kEBuZnQ==
X-Received: by 2002:a17:902:2e03:: with SMTP id
 q3mr19753659plb.166.1552917856540; 
 Mon, 18 Mar 2019 07:04:16 -0700 (PDT)
Received: from localhost.localdomain (118-171-142-96.dynamic-ip.hinet.net.
 [118.171.142.96])
 by smtp.gmail.com with ESMTPSA id b6sm12935765pgl.49.2019.03.18.07.04.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 07:04:15 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] reset: meson-audio-arb: Fix missing .owner setting of
 reset_controller_dev
Date: Mon, 18 Mar 2019 22:03:52 +0800
Message-Id: <20190318140352.31979-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_070418_304401_4138E85E 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Axel Lin <axel.lin@ingics.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Set .owner to prevent module unloading while being used.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/reset/reset-meson-audio-arb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index 91751617b37a..c53a2185a039 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -130,6 +130,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
 	arb->rstc.ops = &meson_audio_arb_rstc_ops;
 	arb->rstc.of_node = dev->of_node;
+	arb->rstc.owner = THIS_MODULE;
 
 	/*
 	 * Enable general :
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
