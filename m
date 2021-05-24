Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561ECC04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FD2613D2
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 17:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02FD2613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rrPxar5VxgO/qmyc2yB0Yq2I+9pt4FnFIuDvhD8mbXs=; b=uJ49pE/EQERpFs
	lGiPc04izjGKc0nMD2i+STpF4lyFQvXhH8nHb3F2zTBZdti8OIL5AgcGrwcNjc7vRlJg6mFSAkKYU
	AnQAJZFdGFFvjW5DUc8J5hMC0zk8uFlsgp/qe/DzlUmBzmXdYB3aj9fJQnavfRU69zvhGaAAputRo
	N1oICiwKvk1OPlyPJC9czVC8zWIuWMF7BJdaLll5dSWBb7MnofSKgVULVskqzy/59Q8Lh1Z8kty3v
	tm0+cz1LM3nBlnl3aAIf01Fc/3gAEbU1DMwDxuJlfE2zBd/wTAyTDlUEG+czimFYeAv7kLjRjtUgg
	HGM3Qb8oLRdzdBnK289Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llElc-001M3r-KJ; Mon, 24 May 2021 17:53:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll7y0-000pud-TU; Mon, 24 May 2021 10:37:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id j10so13789886edw.8;
 Mon, 24 May 2021 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yM3g27MTcN+1fkL6tqTGZDpmJiATWPK1JGlSl5Sc8kk=;
 b=G+f9++7xXxQcJLSEzdH6NpXF3TNWNQw6drAatX9YSB2jHZobP97kBKK0SfXVPDbwh2
 UzV6kbzxstJKg3AmS6NqQGhRch8Fab+7g/wPTeoNhlVB6IVAM35oeB2asr1zkGvrFMfn
 7MXkYhveIKVjWACHRl75N1YLbTUyFftlkxDcypFBmSmNVQ1SzfJy7UgS+YxVNJZ+6RhH
 r11Zo/nJH0ghm9bWip3K2HmFfTPKPKHBFlOrvHk0kCRpb43DwZQJfhz84zkgP9wKRaJR
 JHxAsbgrc1Fx/Il1sAJxuaNIIyvbkCMsqpw0Mf8MRhIagfnjPzt+LeafJ6WfvYu3LH4Y
 vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yM3g27MTcN+1fkL6tqTGZDpmJiATWPK1JGlSl5Sc8kk=;
 b=NM3v6YaEdUW4S35ArnJw2bFpj7yPxnH0nUl3Nt8cWwnx8ZXOp5QekbmUtGcUn1lLBJ
 u1/Hg2tpMzIirEI6m4177aa8fIMttge8AkLAVSjR8bVeC9TT3822XwqRX1EihON+4g5S
 0a4ONptb53y5XqJpujhZu2FcHfkoK9+4XjesAHHCcxMDcAxuL/ezB2p/XfxOyMnvNlh/
 ojoIgRX2dOTTxxzmpU21DfUxHkQdfGUdp4pet8mZY2WIRGzIgAkqPbdzVtZMhx71e8Ew
 KEznCnMnznTxfnL/TSoraaWYQ/ZlsjrQQkp3nzUVAo+MU8jOwFgGLlOuT8c75u6YQUHV
 6fyg==
X-Gm-Message-State: AOAM5302HSL+tHLmibwtnZtNUa55Y0v7xftK9xARFqyp1Trs1T47mb89
 dtkW1Ps/DkCn+3FubE2k31g=
X-Google-Smtp-Source: ABdhPJyyzLozFM4BKK5sAQA70oWdkP63q8tTbSOhZxfxvUduzsEJsTs/J8MBcLkMTJgjv/LEa88a3w==
X-Received: by 2002:aa7:d786:: with SMTP id s6mr24643204edq.239.1621852667363; 
 Mon, 24 May 2021 03:37:47 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id r15sm2616418edm.61.2021.05.24.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:37:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
Date: Mon, 24 May 2021 12:37:30 +0200
Message-Id: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_033748_987423_65BC6481 
X-CRM114-Status: GOOD (  14.45  )
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

On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
up to approx. 3GHz.
This however causes a problem, because these rates require BIT(31) to
be usable. Unfortunately this is not the case with clk_ops.round_rate
on 32-bit systems. BIT(31) is reserved for the sign (+ or -).

clk_ops.determine_rate does not suffer from this limitation. It uses
an int to signal any errors and can then take all availble 32 bits for
the clock rate.

Changes since v1 from [0]:
- reworked the first patch so the the existing
  divider_{ro_}round_rate_parent implementations are using the new
  divider_{ro_}determine_rate implementations to avoid code duplication
  (thanks Jerome for the suggestion)
- added a patch to switch the default clk_divider_{ro_}ops to use
  .determine_rate instead of .round_rate as suggested by Jerome
  (thanks)
- dropped a patch for the Meson PLL ops as these are independent from
  the divider patches and Jerome has applied that one directly (thanks)
- added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
- dropped the RFC prefix



[0] https://patchwork.kernel.org/project/linux-clk/cover/20210517203724.1006254-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  clk: divider: Add re-usable determine_rate implementations
  clk: divider: Switch from .round_rate to .determine_rate by default
  clk: meson: regmap: switch to determine_rate for the dividers

 drivers/clk/clk-divider.c      | 93 +++++++++++++++++++++++++---------
 drivers/clk/meson/clk-regmap.c | 19 ++++---
 include/linux/clk-provider.h   |  6 +++
 3 files changed, 85 insertions(+), 33 deletions(-)

-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
