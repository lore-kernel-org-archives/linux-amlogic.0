Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BCC44515
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T+/RteALltEUTuCQI638YfsM+GfNnU6g3+z5Frc+xx0=; b=Ea5z+BqSRcfu79
	rYlxivfT5D2MDp/+BKZvS8eDNGBZoyDYy1VCiatNEJ91n5PTMAYDu2GPRep3whHnUZq+hiM0Ekcqn
	K8y2QskeLWKJpuPGfp5EtLDK8OY02jF1Qc1VQ0pNW6t2HJjPq4316V4jNGEf7BtF/cp+I9DB84usa
	qhWDT5S84vIHcLpX1u58V+cTu8yHqBAVzeuy4CgsZaeT8wzorfPXYYFh/WXGRvSFtOFxlwPOihrFo
	NSdGesOCu1zXIfobV7Mwdx6VYZSpsbr9QUfsl5Xdg8LCpr1oBXodgD+FI+BtJflPsmklOIXL/YW/8
	f4VWlBmenRmM6sktSHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdKG-00000001VfC-2F5q;
	Fri, 17 Jul 2026 07:49:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdKE-00000001VeA-2kli
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jul 2026 07:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA39660204;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ADEFC2BCB9;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784274577;
	bh=hl4y02I9tA4u+DQHQqqO/xk7mXY4kQUgmqTa/x0JXaE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jv1GF3bJTnz8aME1PSNqcIK970ID3TJFdrzvXhGOsalzm9MHOCJ53R438Gd75gJyu
	 twxoUpX5J7jyJTcnMGi8dyAZPozZluUIhhackvOEyobUf7wsBM3UwFblxvnRJv1eIf
	 0z3txs323o8SBbyZB5QUHqSPYVuaCLi4siDiV0kIeAFhYzpgMB0UYBztrQzYaygQDR
	 xRtETdtn6PVKcam7LB8ljHWSFyzjR2Kb43YdGVVwFrDGtHEqptiB40lb//Uy8xOvkk
	 SFt8wSFwDc01E3K3l39aStwn+lKybXN02e97LyNvIGtV3va3h2pqVYl/CH3y8hemRm
	 jTpFVSGAeQMjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56196C44507;
	Fri, 17 Jul 2026 07:49:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] spi: add support for Amlogic A9
Date: Fri, 17 Jul 2026 07:49:32 +0000
Message-Id: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIzeWWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0NT3URL3eKCzOJ03TRDy+RUAxMD40RTAyWg8oKi1LTMCrBR0bG1tQA
 yW0scWgAAAA==
X-Change-ID: 20260715-a9-spisg-f19ce0403a50
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274574; l=813;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=hl4y02I9tA4u+DQHQqqO/xk7mXY4kQUgmqTa/x0JXaE=;
 b=ya0yNDSjGaGqYZuUAwyX5QW7AKAbiK0wPvRNHxKiKnT5Tfk7qIdIVPww5XU87USkzsRsxrvkx
 HEhWy/wo1iQAgAXRoUww+8OAHhTjukbMZm+eJ9Ia0HW6R74Ze6bU6uO
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

Add bindings for A9 with some features, and driver for A9 base on A4.

Fix the incorrect keep_ss of the last descriptor.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Sunny Luo (1):
      spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor

Xianwei Zhao (2):
      spi: dt-bindings: amlogic: spisg: Document A9-specific properties
      spi: amlogic: spisg: Add support for A9 controller features

 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 36 ++++++++--
 drivers/spi/spi-amlogic-spisg.c                    | 78 ++++++++++++++++++++--
 2 files changed, 103 insertions(+), 11 deletions(-)
---
base-commit: d0b5dd16226814e5c73ba8daf88d3d91c990a38f
change-id: 20260715-a9-spisg-f19ce0403a50

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
