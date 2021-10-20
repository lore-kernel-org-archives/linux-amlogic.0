Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0932DC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79DF61130
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A79DF61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Yl7S5U/T4mNiePIwqHCQDFscD3rSiv/hymWc59EqQc=; b=S41Q3VZd5tITgY
	qQpK7Si2Q3BIAn0mFyVBNw5Z8s+LR6Z6EHnzSCnfLAYo5kTzhUe8uFN3/sR+kpBA5i3DFghNYHtgV
	b6IDts8RqmHv1QBfnMF3/kmp2DmYDbLQLVDQk0PCPqZQxD1H2DoIecoeyBHIXlU8lGV19RqDn7EhI
	25a3LTOzxNBof8rbR6UJInlg5ObWFxAuZqa+/MuPVjhPBs1dQyl4ZLVag/Jzb6rpiLvM+jaxtJxsy
	HYWGai7X31RiMvG8PqFHk/FlO13VaxNMftjAMW17afZWFPImjRBCvioB+UHeIVpiwE8Plbd0i0ilk
	js+srIQ6qqkX8TRpq5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9zV-004M7S-6G; Wed, 20 Oct 2021 11:42:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9zP-004M51-Hx
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 11:42:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso9510338wmb.3
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1H7Jji7fIBx6bP4sgM7SKKuxwv994hR/z172a1Gf+IQ=;
 b=clVBu1hn1ydfk9h4lru/P+UxNhcv1Kv3w9oJAiA8PQbnMt0aRyKG3l3dAU4NBndB7q
 Pzg7rt2/mgBfXQ7zGU3HYXy+t9Jp/32h/JWn6Un/ciCyJ/mOLlWS+Lwa5QgWgvkPtF7A
 7KrzklV1v5pGzTatrZceRo1p5uMk6zz3xwww4iOoJrhg75Ky5i9NYkvbdqWIAYrpvpjg
 yHii6VOaUDAU6zrSGXgzb37ksn0HxQuG2k93RIFDiEXm/SdF/D4yH89hnLBtsWbf1L4Z
 3PZXRdYyqnKAi2u1hANQyRwqx/jcU+WtX/K7TMefqXHDOziedCeR/VO2wkuYnfEf1vS1
 zPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1H7Jji7fIBx6bP4sgM7SKKuxwv994hR/z172a1Gf+IQ=;
 b=BVw7EYx72me7haocNFIAd//Ltm86u8k2lcQBbKUYtvwG8cBUZGOy8CxtROZBYky3GN
 ijpoItNqHyFHotcwN9bbC6lJuw5OAvvSyB4gVxS+wJIoF49IRGdoZXR5SpCRVfp4dlM2
 EOhsGNyEcSJ/CpQKGVzXzfjY/tQzzK2nilk2C17bMseYKEC9nQBBf07s1j0wtEbHxx9h
 lalzeeFTVkjB3Ig0CD1fPPmlDC69FqaejkshljmvzjtCBiKw3Zw+waRF0u+nixW1YsVh
 tVg1lhJ7FqK0NLHJEKNPat5rgAQnPGiaY3En/MshKSJaW0sINHhkOVAYc1mCf0sVAnBd
 A1cg==
X-Gm-Message-State: AOAM531EDDS4Y3PTmT7SYCgjQUllw3lwAu2eFYBAs7poVYpfNTPJww65
 iHux3y67+fKVg5aF6KymUSG+dg==
X-Google-Smtp-Source: ABdhPJz8QPobdNYOL533FNTMX2BasL1v0I2f1T3Hos3cXMcZGEiO6xYWEl9dLTPZbfnGUl78FI7H8Q==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr13600190wmh.104.1634730152920; 
 Wed, 20 Oct 2021 04:42:32 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] ASoC: meson: axg: fix TDM channel order sync
Date: Wed, 20 Oct 2021 13:42:15 +0200
Message-Id: <20211020114217.133153-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_044235_677687_B35CAAAD 
X-CRM114-Status: UNSURE (   8.15  )
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

On the Amlogic AXG series, the TODDR FIFO may get out of sync with the TDM
decoder if the decoder is started before the FIFO. The channel appears
shifted in memory in an unpredictable way.

To fix this, the trick is to start the FIFO before the TDM decoder. This
way the FIFO is already waiting when the 1st channel is produced and it is
correctly placed in memory.

Jerome Brunet (2):
  ASoC: meson: axg-card: make links nonatomic
  ASoC: meson: axg-tdm-interface: manage formatters in trigger

 sound/soc/meson/axg-card.c          |  1 +
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
