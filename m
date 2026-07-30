Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD18C55165
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2026 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oHUkkdEOTpZkgZ384XX6fCTv6bI1Hyu2n9Mo9p9pDb8=; b=NdTxqIc3LyOcLO
	wfRW4tr1TKOns9OqWPrC15lFGNtrx8D+TWBwD38yNSgSxK3lpmzCKOdFphkEpCWgpS8g6dAmm4oxY
	3b5ELyeSeTAv1arhpPOpPwoc6VpuRiL8z7rxtjtfPKxuHfVUUndPixOti34cJpLnGG5DBP3Q6Ncym
	9uGvNXPpaeB4UjKP3XAprUuQW/jF7OSd16S9SWtSEGu6Euv3SdDqYCJVho7YB+Ix+XqqEv3eA0l84
	TFV48NCYMq1sQXiMRUh/bX+9lwjxzifajNIVJUGaLCwc+4G9fAWuACVGGbnYBtuES0QWE23Hakt8C
	RNcCdj1K43FSZwcurDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMEJ-00000009t31-1dXh;
	Thu, 30 Jul 2026 08:35:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMEI-00000009t2Z-05UY
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Jul 2026 08:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05FD4600B1;
	Thu, 30 Jul 2026 08:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A00C19425;
	Thu, 30 Jul 2026 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785400500;
	bh=tqNNorQu+sVU/SRTxPnEuAnWC1OAYWnTv5IKxYETbdY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vLQqx7wyv3WkKDeVeNCadJvh4NijkhLwKfBego7cH9yjRcP12ixBZL5m8zaOXGZl8
	 S0cPT7nvRSxNdaHDodrhdiX5Z+l1a1YxBSyRlvmhf4jturcCDSIriCFZF3iSu0GUrc
	 IxsC1Pf10cwLcLJkMA7HqPRekEvY3Hi6I/6Til6/fPBdGcBNwIGFcbaWB4kNvBEw+k
	 +ZDh5AD/FDPo8c3mZwHQ+sk9JURd9iJ2yB4mjv0Fof5hF01akkSmfTxmtTHPDTRC7q
	 WoTcmS/LvXFqUvsQ9TJA0q5SP+IaLnPDChCXejExrAdUV1Zv/H4VFsuiEH11ASRMcH
	 eylUwjCWJcGHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B868C54FD2;
	Thu, 30 Jul 2026 08:35:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] thermal: Add support A9
Date: Thu, 30 Jul 2026 08:34:36 +0000
Message-Id: <20260730-a9-thermal-v1-0-d786d37cba58@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJwMa2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNj3URL3ZKM1KLcxBzdNDOj5NQ0s9RES8M0JaCGgqLUtMwKsGHRsbW
 1ANm31zhcAAAA
X-Change-ID: 20260703-a9-thermal-f62cef6ea91f
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785400497; l=708;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=tqNNorQu+sVU/SRTxPnEuAnWC1OAYWnTv5IKxYETbdY=;
 b=zfcjrasq1supGoSg8xxlaLxkPsPhAg/bR6pml9gzIrTqZuvFw1bGiE3hGpkiOHwRZuJEqkqFY
 UMM2Yhe1IteCihCIk7+PgVcD/7XLZzozJiCoS4DBbFXurW2AQk5ESr6
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the thermal controller compatibles for the Amlogic A9 SoC
And add driver support for the Amlogic A9 thermal controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: thermal: amlogic: Add A9 thermal bindings
      thermal: amlogic: Add support for A9 thermal controller

 .../bindings/thermal/amlogic,thermal.yaml          |  29 +++++-
 drivers/thermal/amlogic_thermal.c                  | 107 ++++++++++++++++++++-
 2 files changed, 132 insertions(+), 4 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260703-a9-thermal-f62cef6ea91f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
