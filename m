Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBE1C4360F
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F094217F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLTrM3R3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CvQ+w7ba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F094217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gwfOdoUYamP5oYQ6CohQgA2MgfN2YFMFzYolfYCd5eo=; b=oLTrM3R3QdVF2v
	Sd+2xGOdChOoIOZZnbBU8XX0Tttoeo9FO3ieE+qlnzkE7/a0BNOC2VeTQnORVa8h/tXRcslYSAhA0
	M1/V7exQYWYLU8wbv2pbZBzNlBbaiab8EfDvGiypS1Rt9O/xr2CVi2ULxxgwpxQUIeqR/vh37G6QA
	Et5R0J+sP7aldPo5fax/ETPz6ncmq6hYzmnCFPakv2UI8v7JLKfU4sbLXIblmgxZozzdD6D51Atwh
	lwssCEzX6rdF2gFdMPmXS+KEumGclsq2BdAMl4Im6dHYOgImsMAHoENgVEsDIFv+BlS88c+YT2KFN
	eLxOU7T/H10b56aWhXYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6MeT-0000Dx-PJ; Tue, 19 Mar 2019 21:52:05 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MeQ-0000D3-9q; Tue, 19 Mar 2019 21:52:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id p10so547179wrq.1;
 Tue, 19 Mar 2019 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ceCKFAiifM4URXix3mWG4CFxvV6hD9gyANT0DrHC0ek=;
 b=CvQ+w7baEAeYUe8mvYxM4uTyTZK/DnDgQ7dHqe0HCRFZboDe1gySN4JjXObLPkJ8Sf
 cUCY4MwyC3cqhQuLgrfXZGZw2C1M69QREPksKvDemXxFPDdRJNZ8ASNhY/NV3sIDG6VY
 yxUzDCEqMoeQ5qPKN6p/7nUFETgE8G8EygM5THk3WOFr7p9Uyin7z0czcN1imUhQOW78
 SDOvvduzyjtlmiUBeLf9MbX4migdhwng777A/Zcv+905/5Goz3k2spIeev0ZHH8i5PvF
 btHrRH4IzyXgluFiAG0Cgd8lhsUKTGpe+6P8Ysiq5UKTp+wLAeh8k67cZVF/FAwuGqaT
 tDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ceCKFAiifM4URXix3mWG4CFxvV6hD9gyANT0DrHC0ek=;
 b=SucuEbMPc82V9Y3lkTbV/c83OylWc9yTk8BRK62jtGDBgFWxzJKaJlXxGyc+XCEfWW
 OhJa7r6HU0q7R3+inAUJN8Etp0NsTI+WE/eAgI4EAoejTLyri+poiah2mOz4UXZIPz07
 +XE5Sh/vHnCspSAwMZlmJVpx2IVrlO0HLcPBtH7tySwwUm77jtQXAEAnXn+nYjDwn3X8
 2BklOajxv1Fnll3ME50TbaigI0tNIRj5kWZODQwdhNmtMGkTn/2wEGZkrUBXimlnFOxg
 8X3MwQLkuS5/vKV5TxqbHLbzMVccV4IpBsbHvUEwCdJgfJMEDxyI9/x4GvK0Hdyz1ful
 26Iw==
X-Gm-Message-State: APjAAAUUisiIeHZJotKnR8y2/MwhHhnwb0uYB3KdGZv6AiPkUn39GQUQ
 BnpgnHEaSqwdG4FH1Tcg/9E=
X-Google-Smtp-Source: APXvYqzIVqXbjloTFfhiIXnXahqeCO+0TjGgv+9rsMdLbjXkhlmcvZzVriWM5csKorfWlOgnjwuEvQ==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr18393828wrn.288.1553032320612; 
 Tue, 19 Mar 2019 14:52:00 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id c8sm56050wrx.6.2019.03.19.14.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 14:51:59 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/4] clk: meson8b: add the VPU clock tree
Date: Tue, 19 Mar 2019 22:51:17 +0100
Message-Id: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_145202_374292_CEDA03E8 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
The VPU clock tree is slightly different on all three SoCs. The details
are explained in patch #4.

Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
exists on Meson8m2 - Meson8 and Meson8b don't have it.
A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
compatible string which is already available) to account for this SoC
specific clock setup.

dependencies:
This series is meant to be applied on top of my other patch from [0]:
  dt-bindings: clock: meson8b: drop the "ABP" clock definition


[0] https://patchwork.kernel.org/patch/10860387/


Martin Blumenstingl (4):
  dt-bindings: clock: meson8b: export the VPU clock
  clk: meson: meson8b: use a sparate clock table for Meson8m2
  clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
  clk: meson: meson8b: add the VPU clock trees

 drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h              |  12 +-
 include/dt-bindings/clock/meson8b-clkc.h |   1 +
 3 files changed, 433 insertions(+), 2 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
