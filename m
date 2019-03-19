Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920DEC10F0D
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 22:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0042183F
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 22:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdM5cj9j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ahMwP3k+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0042183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9S0by5ds2dDzErGl0c9KKkfOuNyNRFL8tcj//EnNrr8=; b=kdM5cj9jus9XEG
	ofhSHfZxkC+/neXkwjYsUx+tks0ZaVsrk1Ba9q+VxPMvmqYDr5kd8Y5DsOKlBcJSXamimNDUHnyG+
	whBDPkxSOgioLlwD02GwdRLjAuFwxqAKKfJmTM7UXQyrklqC9l7ZrMVUFTq1jo/70fG4mfeb7lSve
	wJpr8yFk9DMCaLnFal1XKhDFfaanHWSjKBs56o5G8BcXPRIgpcHwAZ/Zk/KTrBUdStJBFD2HHEF0C
	Yd1Ha5tD3Fi3hYorwu6iAEl6ZyFK4bQjQpi3i4b6HgVPZv/Pnexnatd3Twf2YSxAyXaUKORacyDWq
	Bi4p6Eh6z0fJn5bDJxFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6MmS-0004m2-US; Tue, 19 Mar 2019 22:00:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MmQ-0004lM-Eo; Tue, 19 Mar 2019 22:00:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so558987wrp.2;
 Tue, 19 Mar 2019 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EgE8EGo39YHuRe9fCXmuDvR01OQN1TKiCwmwvc0k/eI=;
 b=ahMwP3k+K8G9y3awxesEhP5VcmA0hogNr7vE75RgvMVKXoI8SRz2MGuKz4KA3vxlIv
 kSgZdzWrc0WvuiTs7AxEFXwXmI3vamSv8fhnjIgNArAUTjteLGBs2PhBbtxumiTOfXCk
 7sdQniqQeEjIKcj749MksMYkl2yLg71q6XNAxGw6xEmFhYWASV1oxokvfNnAJtXhML6e
 BFyIyWZaLvxQ5wCVIxtdc0hTKRiBOOrUXy+1pMUPAbhMzgLz1MpIog2kyUknkmK3esjD
 ILY9pB/f4Nv7QoHPRU/ELXeuVbjBmP4So1uM5GvTwX+kgvEyEwmc/srr4V2uQ0hgTQ0F
 d4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EgE8EGo39YHuRe9fCXmuDvR01OQN1TKiCwmwvc0k/eI=;
 b=r/tdYbwstu+XWniWrDjc6uWVIQs/HtK4MWIh44HzZsNzzJhIdx+gOiEBBD6qA1cdUj
 qj6n9f5a8Liom+q5lkXlS/i6iM0ozsjzUHHC38aw5acjBV6bIADe7zcvrJ/67VJMBidw
 K/S26Yyz0YymNoaTrtT6rliNP3KoeDqdpcS7gb6zXOHF76f/3lMdxDC7TenSIBXHY9zH
 VSx+SMMcSy4B1Ss6X/Sfh+g5GFJja4113st2j22b2HDNvSASt6kwz+pWU6wxnrl3q7/L
 Qte2olJV41FabxnLYWkGSZFgsJjuWwSg8o//ZWiUYyBT8sAvnYHIt+Zkb54d0OmmeG8/
 yhsA==
X-Gm-Message-State: APjAAAU0cIKhKzDCLqBopYhKL3T+T4vKmwGAY+Ctjn+FOq9sP5BheMJd
 LLqAtcDQ8YyzPhELFnM+1+M=
X-Google-Smtp-Source: APXvYqxJ2k1f8ZPHWdqERcu+DugnMULZ93b5sVLILHLUL1D4HZCFHtoqpWERrijelH29v4bWfHvrnw==
X-Received: by 2002:adf:e547:: with SMTP id z7mr900438wrm.295.1553032816906;
 Tue, 19 Mar 2019 15:00:16 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id t2sm188762wra.9.2019.03.19.15.00.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 15:00:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Subject: [PATCH 0/2] clk: meson8b: add the video decoder clocks
Date: Tue, 19 Mar 2019 23:00:10 +0100
Message-Id: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_150018_523259_B21CF177 
X-CRM114-Status: GOOD (  11.31  )
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

This adds the video decoder clocks for Meson8, Meson8b and Meson8m2.

The clock tree on Meson8 differs from the one one Meson8b and Meson8m2.
Details can be found in patch #2.

There are some checkpatch warnings in patch #2:
  WARNING: please, no space before tabs
I decided to still send the patch because we have the same inconsistency
with all other clk_hw_onecell_data table entries. Please let me know if
I should come up with a follow-up patch to clean them all up.

Testing:
I have not tested this with Maxime's video decoder driver yet.
However, I manually enabled and set various frequencies for the HCODEC
clock and verified that clkmsr reports the correct rate.

Dependencies:
This is meant to be applied on top of my other series from [0]:
  clk: meson8b: add the VPU clock tree


[0] https://patchwork.kernel.org/cover/10860401/


Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: export the video decoder clocks
  clk: meson: meson8b: add the video decoder clock trees

 drivers/clk/meson/meson8b.c              | 312 +++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  17 +-
 include/dt-bindings/clock/meson8b-clkc.h |   4 +
 3 files changed, 332 insertions(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
