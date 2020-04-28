Return-Path: <SRS0=mJnT=6M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1B7C83006
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832EF206D6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2020 12:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBQn9a19";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Of8nBJdk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832EF206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lgsq5dK6LS8h/VVxd941J4jj6H6oYy/nVQT2WTz3gs4=; b=QBQn9a19+1Dbxt
	McnTkuxadlh8Ky7Lq8teIjMgDsp2r8/jWfAoJle4itl5cchiBwmaTFU2xD2LVXq569sGUgiIyfK4z
	a7lmpNBY1hjzNbFEcsi+fL6E3citBAvgNJX71TDIWlVdFPAXjFqeLbl+dg5HgdIK50Numokh3Wbdr
	6VkmtATZfaLb3zo1P1PijH9yBaqg4s4uF1J9u7b+rEQP26hkKQf8p49LBBklx1pXy2t8+Y4AVhLfo
	2LBx4e+b21G1cpASP32YgT13KwXseNFjPCJhKy3E663i5NAw+iUhjXcX68xjZ+7cXjHH35YKagZAF
	aLf6OPQBgVjPxdj7/KWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTPhb-0004Gp-Lo; Tue, 28 Apr 2020 12:51:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTPhF-0003xq-5u
 for linux-amlogic@lists.infradead.org; Tue, 28 Apr 2020 12:50:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id x25so2627837wmc.0
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2020 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ivk8pUd5yw65/sV/AvpRxYKjBbQZM0SLzoY/9d09xk4=;
 b=Of8nBJdkQzrZsQ93VmweFQ2f0VW0tkBt7Arl73GPj7BJQBd1pGk3DpmZi+VE6ZKCHX
 mlvXb5C9ntOqyF7vCz8Kc9H+FPam1W15Q+oJeHHfeWouz6oG5S6UayP8QY2GQdPUI0My
 hCPus1kjcwzWMS6LHSUO8Wog5xotwmZfF1Rk01Vh41vN9/i9ZUSamwG/DgN4RGiguFnJ
 CL8/TmhN+X02+qkqcOoIiXhiT7DosmretDlc6iCO+pUDDyq8V7kpnzS97PK51gjcfusD
 ErWaiqPmUu5q3PfIhGwF/jg7w8G5VKmMGWvjKaRiugDR4+f7SzGsiWgqBo6832Lb49Tz
 cGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ivk8pUd5yw65/sV/AvpRxYKjBbQZM0SLzoY/9d09xk4=;
 b=sBVMVuRs+U94kwH1QZR6JZB8M97MGsk18LbyDqRV/pwKTYR5XdGh7roGdhIqqNF/zm
 UI6hpdVF/GKJDSpqnMb+uqAuBPxR78DFN3o76OCgF2yyfj4gLjKWjhsJsAC5UFYZOWBP
 9/GP0PpH45U8CkQdUw4EZvi2QAV31Q1LOeF7gf7dRFOt7RtsaxODxkGB5eH82ipuMt4p
 7MrAHCD1Ogq2inQnD2aCWiyDoJBXRSiMXUR2Ug05knFJ9eI9trcSWoBsNheLk+h90TEm
 29dASemOcakT1Y6Lez2o67dtYXu3aDv1BLAxEA6UTRc2t20F6bhdHS+0QBQ1Of5n6cF/
 updQ==
X-Gm-Message-State: AGi0PuZwPoEeZrBdu/znUs82BfFzmkr0r8L1sFU7LY1+DtEIuhc/KzJ9
 +6dBN5Q26MBEGb8P502yaMRw/eCshIckeQ==
X-Google-Smtp-Source: APiQypJD/8l1OOW0+VgnggdRlxU6EJlqkaxBVKVmSTJRZwFIqdX2QpB1vmlCqT7Ad90mXIEuv/apuA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr4652138wme.126.1588078243182; 
 Tue, 28 Apr 2020 05:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 q184sm3246115wma.25.2020.04.28.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 05:50:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl
Subject: [PATCH 0/3] meson: vdec: vp9 & MAINTAINERS fixes
Date: Tue, 28 Apr 2020 14:50:33 +0200
Message-Id: <20200428125036.9401-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_055045_303741_A0868850 
X-CRM114-Status: UNSURE (   6.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This serie fixes VP9 decoding :
- enables the motion compensation reference cache controller
- fixes buffer shortage on VP9 decoding

And update the MAINTAINERS entry to add myself ad co-maintainer and
add the missing yaml DT bindings.

Maxime Jourdan (2):
  media: meson: vdec: enable mcrcc for VP9
  media: meson: vdec: fix another case of VP9 buffer shortage

Neil Armstrong (1):
  MAINTAINERS: update the Amlogic VDEC driver maintainer entry

 MAINTAINERS                                  |  2 +
 drivers/staging/media/meson/vdec/codec_vp9.c | 72 ++++++++++++++++----
 drivers/staging/media/meson/vdec/esparser.c  | 24 +++----
 3 files changed, 71 insertions(+), 27 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
