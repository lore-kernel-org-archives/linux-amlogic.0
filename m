Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9700C98309
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8FQVu7uvxkCs4Vpta1jYTlaOmvfMeIiY+nwxEJUQKKM=; b=Xai3aKsR6P2UQP
	Q+lnNA3mWdsQIYSHvuEm+9IW6w3oBmmXIRugRd0JCP4gObW9c8h5Wzz7p1kLAU3FwDR8CddgdHxtV
	/pNZ8sFVg8QqSbzBoEIHue6ZTN9fsuV5qEgrphgJygo+BnQWV1IEHgJ/fXi6hbiZcbG57vU5/R1g0
	7EUeKz8TkHu6UORcatrrTN0NZmTFphn39xdsv1sCWQR/CGn3oso78vbL7Ozl09SD3lVoClueOjEuw
	gXO6dMl26PvkKon5YIwrd8Dxg89L8xgqzb4P1HCQYqjPfm7xIdoyXYn5SsONrUaJGQkpN6jWAb38I
	yJQuLHRyQ4zXIeSjqbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWp-000000088U3-2sOH;
	Wed, 23 Sep 2026 11:52:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWo-000000088Sk-0YcY
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 11:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1CD540833;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA7DAC2BCC7;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790164365;
	bh=mNVNZhOFGrZFEhWuUYugPaoxFl6qri6EXLAgumV6vFE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VSZIDe0HAE9QN8v+7cJQczstQQoQDrTsyLDhhvGoaK+1JEGl//aHAwdqTwmPI2Z0R
	 +hd46AuMa0PQLRW4v5u7e7B20hMeje8wyCN7OB6KQnMd6/mgYO4V9Hy378X1hARELU
	 cc8glrLb3lkDV0cwHMoTgEaspwCDYOzahad9axw74AlpIuDqx/wjqsFb5cVqHY5OyJ
	 JutYjihQ703/jPNkV3RuiYW9Pxaq0GKggGE1BVYvfbVI+fx/A+9lQPQBbBv91/4gzN
	 rU8DGaEa5wpf3kea3XNA0Cyz8+RztbeaRwO/FS3w0uEu+41scaEY1idnKXO6BXvgGG
	 SSdKWrJXqOkOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85733C98309;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 0/2] Add bus clock for t7-thermal sensor
Date: Wed, 23 Sep 2026 13:51:01 +0200
Message-Id: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkGlkvpKdDDbcsksNCKI/p50H
 JiZBxJFpgRd8UCkixPvIYMsC7DOhIWQp8yghGpEqxTOfOOp8XQUN+PR+t2uKGtpxDhXumoIcnp
 Eyt6/7Yf3/QBuLdd2ZgAAAA==
X-Change-ID: 20260922-fix-t7-thermal-clock-151a0bf4746e
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=mNVNZhOFGrZFEhWuUYugPaoxFl6qri6EXLAgumV6vFE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bmvWUcTfONOQ+JLFLVT/w7Z84cqUi9afNTTVhWX1p8s
 9flSqtDRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRtVkM/yu4g61POIqx7ja/
 4fWg3maegO/iK2s3VS2XWB1nPUdnaybDX4Euvuq/806cm/jlLltPcmHG1HZzu8JeQw63i2FdhbP
 m8gIA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The t7 thermal sensor requires a bus clock, gating register access to
the sensor, in addition to the functional clock that is already
described and shared between sensors on other Amlogic SoCs.

This series first extends the devicetree binding to describe this
second clock, making it mandatory only for the t7-thermal compatible
so other SoCs are unaffected, then updates the driver to use the
clk_bulk API instead of a single struct clk, so it can transparently
handle however many clocks a given compatible declares.

`dt_binding_check DT_SCHEMA_FILES=amlogic,thermal.yaml` is ok

  CHKDT   ./Documentation/devicetree/bindings
warning: python package 'yamllint' not installed, skipping
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts
  DTC [C] Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (2):
      dt-bindings: thermal: amlogic: describe bus clock for t7-thermal
      thermal/drivers/amlogic: switch to clk_bulk API to support multiple clocks

 .../bindings/thermal/amlogic,thermal.yaml          | 29 ++++++++++++++++++++--
 drivers/thermal/amlogic_thermal.c                  | 14 ++++++-----
 2 files changed, 35 insertions(+), 8 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260922-fix-t7-thermal-clock-151a0bf4746e

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
