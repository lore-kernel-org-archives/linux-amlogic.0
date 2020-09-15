Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E6FC2D0F6
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB0421655
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SP2WP0SU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V8FGR80t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB0421655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ujz1ZwARhASVnEkWPMgs74mOjkCOP3H+DXWtMaePNKg=; b=SP2WP0SU0lMUka7V2AMukrQCvo
	LqJr35Do1bXjHIYQMfcUS+TfgrgsyTYACIbfeYptanmE624fYUuqsu97vOm2DdPFQzbj6WiqCzSpK
	ff2+hKlH3jzo/L81+C+8OICvqljJ3LU3hnVTZKwUHSPkOkRM94qi/djQ/nZKJvFnmZQDnE/wE2tqU
	IQEEIRI5ATRdNBNizBQ3XLG2+1y73uwon0e3l5yIJNw7d9GvSCqwFTHP1qO6KNM8JTt+d22cZKrGp
	Gqz9DEQ8KhJ0ZuZAIw69grB9Sv+3UtrkwaTQOE0Jd3RNKmRiSRI/L3f+eglWc74JmZ4yixWybRijv
	9blfIbxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAcx-0006hG-Hh; Tue, 15 Sep 2020 13:04:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAcf-0006bv-8o
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 13:03:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id g4so3247421wrs.5
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y4CoH5TAZ8PWZGgkK37fQU1Rpb3QFqRwR18W1WLP6KQ=;
 b=V8FGR80todspLXHPA3rvQdUVZYGAcksQC64DzbVitjaaVSY9H923PWKTKpB9LEFYSn
 g7LrTNiowUuBWwWBIMTHNL/PS0H4QvIq15F17//dblz7MGWTLED0m/Cf6EQnnwkkefRE
 DA7Prc84Oam1fA+nfTHT6LD+o82/YAZvwELrrlKNBcqPTMmMduKKbN5aiMUzHPZFC6xO
 6DS27Gkt+to7g+sMg8TvVPlWqGgkWonatrYuPJL+X4G6NZp5pWdTAKTrFbQc+f8CG3mn
 FFEIz00GgmrSSPr5F4xyz1M5GZGxZzobQY1afkQS8tF7fXhuUQckqbh1vmxholiu2mty
 HE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y4CoH5TAZ8PWZGgkK37fQU1Rpb3QFqRwR18W1WLP6KQ=;
 b=Y32iB89Z3e6TyW657FIthRnSeFY1Ks6uWS2r27t61iewZJLU83WXeLrZv6p9RbpJOH
 womyMh53fVWWWmEx3Wi8lH0MCOHJcI19C4RJKaW0i6/6KIfijfDpJ0e9JMyVFDiK+MvR
 g1MR2XjHss9qyalbuCKE904TGzM/CK0Mr0ofi0jVaoRsKK1OAHPfCuPDaVHQnPk7N+oo
 +R4ihGXU1RNmIJD9O2ywtTOQ0w0ny40HTd5NaA696FCQjqV7X1P9p4GGVWvuHvvq7+qI
 TK9XZg9lafUiRng/cFTi6X2UOaAW03uaRyOdEGZ3wjUda8ohQS5OSP1I7V5bnQPZA/6L
 TvWg==
X-Gm-Message-State: AOAM533N1jhuIRCehzPdwtP9wfb1mScFcPn8NP5tCef1CzPD+KowwMWW
 LHVd8LaaHiYW8cRorg1le1yVtg==
X-Google-Smtp-Source: ABdhPJz0zBLG7y0swlr6YJYUhuyr4uO7r8ajbskB2On0o9CJid1FPjDmrmIcb6nizzlgHcZqHlOYAg==
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr13902369wrc.71.1600175022951; 
 Tue, 15 Sep 2020 06:03:42 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 t16sm27098671wrm.57.2020.09.15.06.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 06:03:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt
Subject: [PATCH v2 0/3] phy: amlogic: add MIPI DSI function to analog
 MIPI+PCIe PHY
Date: Tue, 15 Sep 2020 15:03:36 +0200
Message-Id: <20200915130339.11079-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_090352_039488_ECFFCA28 
X-CRM114-Status: UNSURE (   9.88  )
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

The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
thus we need to have inclusive support for both interfaces at runtime.

This fixes the regmap get from parent node, removes cell param
to select a mode and implement runtime configuration & power on/off
for both functions since they are not exclusive.

Changes since v1 at [1]:
- added description to binding as requested parent
- updated commit log of patch 1
- also update example of patch 1

[1] https://lkml.kernel.org/r/20200907073402.26674-1-narmstrong@baylibre.com

Neil Armstrong (3):
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove reg
    attribute
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove phy cell
    parameter
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI
    analog

 .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  21 +-
 drivers/phy/amlogic/Kconfig                   |   1 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
 3 files changed, 149 insertions(+), 77 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
