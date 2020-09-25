Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EF7C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:29:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D603E208A9
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 14:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mh/I6Cbq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tKRJzo1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D603E208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBBbm5ZiaGr4AovX78QzAAlMXwKHZgrZDOoYNZfo9Oo=; b=mh/I6CbqG24lUrb5yYhQvxrsqB
	GBelIy/CIR8+Qn2ShmIxTE7/uQuy0mRWlTnZHyfsKfBYktAfLbpdjbgYLNvdjNaqYiPG3TaO1UNnT
	rSJIa9wKGdED0KBawFKalhiqdgDJ83kudMTr7PFEEFcAe1kB5ct/T3GX/lUeioxopUqigylZQ7S59
	L4Bl03+r7Q7HR7TB6T2FFUAe0rVO6dvfB8PAMriPxw0jKW4V7pkq4jvufLSav/i7Bb26Kz577BliZ
	HohUScsOBZKJ4EkiivCZKkMkoxxqQz27Hq/4IyCWbjlbMvoqL6tbXF0XcHI1XRpImu6am4XbVEE8d
	6Jz7wX1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLoj3-0004ho-QL; Fri, 25 Sep 2020 14:29:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLoj0-0004gw-PF
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 14:29:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id c18so3810377wrm.9
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AKLSvGlfQHuDFjha5/xWUU75A7IObeSEIgoQcsat7tQ=;
 b=tKRJzo1D2RqbJ+1RNAXlZqZ0uZwvxHE2I0a3XKx5/XFrZcIJ6pcYUVrZhR0oiaVfYf
 hxDPsfmY3RGZjcT56UHXlmjN65YFMfS5AW6lXsBw3dhofTUg+eqLSLjMzlpLtYz11rfv
 udHvbxw9J7/sQMt0dxptPPDGls4WBsH4INTAIgLiPryLTcR7PS37a+gcA4dI53l8/tqA
 rJezpZKfW8OX7TbszbWDE5L/CUY3WWjzRY48KWL0JXq68mg2SvyWLRNfo4OEDxIW1Dae
 78KmtAcpub4jYLbxQAgwn70Lq3BExuXH/xslCrYCUqPyUuXm97LtGOM231D3qJ3JW65j
 YK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=AKLSvGlfQHuDFjha5/xWUU75A7IObeSEIgoQcsat7tQ=;
 b=aX3kDMR5vW+NMN/LLA3m/K762fmBpRDuXH8UVzWlaGwNVESCeoJ9FALjVik7DDtT9J
 t4BXDkTPHx+kri6UeqVCIQXUlyAqCg7yqWtCmp2rXUeaCIhhndAwSSxce9S5Myra6JVa
 MHBmP0XbH337ZjtGZM9nlXXWVUpaxd6gyDuEOyNxIJYrm0Gc0lqOydMzZCJgozA+dMbZ
 2yYfjYe+pAqpi7mLiQGUXMWsrTb+A9xkaTiHzO7YTLzrN/Pz30W3zR5sG+MNbzXOFc7A
 3hd8GibV12LlaPP2Pbj0G8ZB60LoGjb1gXzo5bmaD3/uNpLvWol4p1OrGPNuZqREZO7c
 j02Q==
X-Gm-Message-State: AOAM533zu/vlFyLA609mAkmjNDxBFw1EwPHk5ZUKcZEgd+Yydb8Hp+pj
 nlnnHxvQXtlCjlib8n/YmtfGcQ==
X-Google-Smtp-Source: ABdhPJzSPTjCGIB0Kzxh/Uc9Tz3g9rvr0/gD0KGzc/AgmX4d2axvQr3PsvA3gAro2xfl5IfAJFvhjQ==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr4747720wrx.3.1601044165294; 
 Fri, 25 Sep 2020 07:29:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d18sm2990321wrm.10.2020.09.25.07.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:29:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] soc: amlogic: driver updates for v5.10
Date: Fri, 25 Sep 2020 07:29:22 -0700
Message-ID: <7hblhukjzx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_102926_820170_228848C3 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 5aabf1180fa9a8d876debd39a8cfb60b022019bc:

  soc: amlogic: pm-domains: use always-on flag (2020-09-24 09:50:01 -0700)

----------------------------------------------------------------
soc: amlogic: driver updates for v5.10
- misc. pm-domain updates

----------------------------------------------------------------
Kevin Hilman (1):
      soc: amlogic: pm-domains: use always-on flag

Neil Armstrong (2):
      dt-bindings: power: amlogic, meson-ee-pwrc: add Amlogic AXG power controller bindings
      soc: amlogic: meson-ee-pwrc: add support for the Meson AXG SoCs

 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml | 23 +++++++++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c                                | 30 ++++++++++++++++++++++++++++--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c                            |  4 ++--
 include/dt-bindings/power/meson-axg-power.h                        | 14 ++++++++++++++
 4 files changed, 65 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-axg-power.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
