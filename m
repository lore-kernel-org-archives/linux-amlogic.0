Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B8AC9830E
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k84xkjS+xl8MDj1Sd7OFQwjbPb5XNCMsa4RttpWEgcY=; b=tXTCT8zeMawoXa
	XDl6DXEzvRC/I/ldFyKFFd1qU3q0msyzKCJHy1MyEsxBIi49MfKxfhABLh7fDTMrdi2F+njDUV7RB
	qs0Ft3Xo3ttuCacJz7cy4ONsH2zjvRJDXdFShAtklZ4wrmoxUNOHq89lfLz1c22FBSldGkcVWmBoU
	8VxRThn6vDIFF7mvl18+wyixOIiHo3WxRzdOVSKL3PeHOEKhnWxdVsoXXYTyYhHlfTtHk4Kvsg7Ox
	tfM7GdYVIC9++DneYHI29m6hJ2YzOPNjAMPq6jDQz5XjZqXTmdZRVu5gnet4oUGD9JQJZVCr0t0Z0
	dE49+lf3R7NcTFHyNIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7Q-00000008Ycn-0k5f;
	Wed, 23 Sep 2026 14:38:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7N-00000008Ybx-43sb
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 14:38:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 311536020A;
	Wed, 23 Sep 2026 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D32C2BCC7;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790174320;
	bh=Y3h9ArEWxXcDcNW3RYT0QJFPRTqLKdurS6G4EidafJU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=o2WgqJfqa407llRZ2YbXyervF75sAxZ0wwKbDrke6IdyoezjU+yhJkbGBlO524aEN
	 cdur5LQ+y+6+5bUjw+MX7LmHUUFmOv5YzieAs84yKgY5TtyrtX4p5XVOuDhCDJrKBe
	 e8TcCJWZ7Gur77ffTC74/WrKPZ+SBp8Bg8Lf2M9ZM8Qs2TWi20pNrHArJO1xdsqWFQ
	 gcik2y9lah/m/P4ri7AzLFCQSmJPSzUCX0jMIklrFUfCtiUi+2UU7UBN73I06gyZ8P
	 3C+ay+zVvgbC4LKj+0mBV0VKrO3bd/+LEl0hhNLPpH8LKaS4e29WVDpvUpu6XmXC0Z
	 q61v5fJxjFchQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3C4C9830B;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v2 0/2] Add bus clock for t7-thermal sensor
Date: Wed, 23 Sep 2026 16:37:49 +0200
Message-Id: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TXtWgE5+R+GQy1b2VjBtIRoC
 P9uJfHm8U1m3iyQOAonaIoFIs+SZBwy0K4A19vhxihdZiBFpToRoZcXThVOPceHDejC6O6oj9q
 qqzeVKRny9Bk59zbtpc3cS5rG+N5eZv1Nf8LDf+GsUWHVGWfKmryu6WyDcNj7CO26rh8EHeEqt
 wAAAA==
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
 linux-kernel@vger.kernel.org, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Y3h9ArEWxXcDcNW3RYT0QJFPRTqLKdurS6G4EidafJU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bmJyEctuu2dqfnFzqvZN2sWn44N1h4mSj/3ZNv9Dhfz
 dv0Uk2ro5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZjIrXyG/5XHvwmcyOXX4Gc5
 dOlmx//kLje14NkXpO7lZny0Vcldc5DhfzDr4xmlD82+6HTqvVhV7lTdsYjfaf/9NYvK18nuE2l
 w5gMA
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
Changes in v2:
- PATCH 1: Fix commit message. Thanks to Krzysztof review.
- PATCH 2: Return an error when no clock provided. Thanks to sashiko's review.
- Link to v1: https://lore.kernel.org/r/20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr

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
