Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162D4C35257
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73ABF2074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 06:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAi+6IFD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rhosCPsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73ABF2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6u2TA7+mio3FKWe893rAH9veHVYJqqtv09Ke85gv4fE=; b=uAi+6IFDdenOMbRi3g0bEo/3+p
	2L3GXrdbSJk+HMf/NHVH78yIbNP7OfB4zIqzJ3unGexOE6XS7KqR0au7ZPJemQP9WkJMzoFJcKA0L
	ZlE6shBduFSYjacCb5QiKQ730UM7VZX+qBL6MhzDHEZAK5djTP0yVhonYtCsBfqTWxVTQ2Vb/fPMU
	R19HFFfY+RkiipcPp7owWVguMss7N9cFa1aDm5GFS/vRSqtgAdvkZy1YvLGynmZiLOWYFLYMjiaUN
	FzsVzv5iT/qHfTf7NkQkz90Sum/H0JXPWlgK7fx2beTb+wg3wfTETMoHC6zuRMcb35EbnX4LBMJyX
	0hDmOHzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInhN-0006f4-E0; Thu, 17 Sep 2020 06:47:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kInhF-0006bW-87
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 06:47:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so765064wrm.2
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2020 23:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z7MJ+UVtQpiqh77LaOlNWIMQ2UBN3Iq/YPPC243q1uU=;
 b=rhosCPsIL+txjRR7CWwZAAHAQ9ZMpXPHQM3zYAhr+rS3UdzolUMM/jmzE3H71QiIkw
 j39Ixkq37vxxZUaiw2sc+h641ONHSBxTbp0AETXFyIdAKF0l1o8ktvMmWZ8+854rHCnx
 SxAc54kbsmeYay3PcxpMxWMk/IjizR+Y4KYpajCk0aBXzSA8SPvSIDd/kbNaVWq461W4
 mcIKblH6OThb2NlORpYHcggm8Ic6PG59b3ML38A7D5kcQJyBYu7fyVtqBTxszkA2TsOj
 rrevSQq4HPvCfS34QxdKnBo6bOyxZBFQH3Pd9XkRwiWV8GA90gXMjqG77Jjw83xyGpim
 MCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z7MJ+UVtQpiqh77LaOlNWIMQ2UBN3Iq/YPPC243q1uU=;
 b=ZhJ0S+8+gpP8BI1cIa5Uwg0Y9mqIiTTACRMJ9Kemc9mt6iAcavlC2sHXENcBXfJPKB
 B+x0X8CpxJ6RybgJxqdfQ+gzC8ALXdEI/nDoLDl71841/zXAVpn/w/t32xta84NuJD96
 4Jla0Hs9wCNKQfry5lxf2upi002Y77NzUAq3v4XUkHexTKChn5SuiycErNeevqDkzfLQ
 9kG+lO/ziwXuk2BttYY+S0b3HoBcBWFrfPhuSWDW7H9hhXV1z9zoV3qIw2WUz3YILFJ3
 7nieuPE+eaNULZY6GmHdhId54ABG7k7WbTzBdEINabyerCzMY6DjYsPc/xblRlibfUBv
 L6fg==
X-Gm-Message-State: AOAM533ck810io5GBCXAjr6/a4ODB/t3mEOuOM0vrm869LbiKepOjbY5
 PXEJF1UMpIUlFjLfAlNl2sQF7wmX67fkeUuz
X-Google-Smtp-Source: ABdhPJyuPXRW53dxkIFbsZRAjQoU3OFF79OiKWZIp7zOo6DgOkw6DMhuOPyAEsCdjV1Eg/lYSoP1FA==
X-Received: by 2002:adf:e312:: with SMTP id b18mr7633760wrj.372.1600325227740; 
 Wed, 16 Sep 2020 23:47:07 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q4sm38516552wru.65.2020.09.16.23.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 23:47:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/2] soc: amlogic: add support for the Meson AXG Power
 Controller
Date: Thu, 17 Sep 2020 08:47:00 +0200
Message-Id: <20200917064702.1459-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_024709_395826_64A3C7D7 
X-CRM114-Status: UNSURE (   9.45  )
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

This adds the bindings and support for the Power Controller found in the
Amlogic AXG SoCs.

The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
but with less VPU memory domains to enable and a supplementary Audio
memory power domain.

Changes since v1 at [1]:
- Collected review & ack tags
- Reordered structs as requested by martin in patch 2

[1] http://lore.kernel.org/r/20200904161654.24141-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: power: amlogic,meson-ee-pwrc: add Amlogic AXG power
    controller bindings
  soc: amlogic: meson-ee-pwrc: add support for the Meson AXG SoCs

 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 23 ++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c           | 26 +++++++++++++++++++
 include/dt-bindings/power/meson-axg-power.h   | 14 ++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-axg-power.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
