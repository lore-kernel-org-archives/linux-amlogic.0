Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05183606A322
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JNyQ7vhp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP7TEwqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NUgFnFWng1ZpMc2q3cSqm49nmnIXt5Uapxy6wZU7KPA=; b=JNyQ7vhpoLcjxXM9fFDx810pTS
	w7caPggyVuHvxjw2Ejr4p9h7LMypaaN6RvV+5fC/BkuxMQlkxkIOnYczMX1XB8LJaplsfvMUSFX/r
	sCqso0fToMZsCBVKRymT7qQM6Hrm/W6cvdwEGNza8JR9Xx3Z+aXgBRSfygQ3d7AGJMsg/4MEIJtXy
	F3FxqqjCjrkF6XdwY7OcU85nWT8AHmej7oEZkV8/Jw02/c8ib4LClEwrxpOcAvrEfq8U25rQ/KFPX
	DdG3nV7ud5Ltv+H3cwXcxIPLPFLOv3ABinr2S6cmdlA+AjeztICu2jjxdJB6oU77Vpj8ztyycxvDM
	zE5xRQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp3w-0000000DpkP-2nD4;
	Thu, 22 Oct 2026 09:26:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp3v-0000000Dpk5-2eLj
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 09:26:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AB0341647;
	Thu, 22 Oct 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792661174;
	b=xDlhy6+JLSgYFxnmlZiV64OeY5TyWeRUwvp5mYfnNdYQtjStad/mu9XSavFS+CaXW8QK
	 RuOTw+tj5sGXbQB/mdvRmoXHnyeIVkhCuswbOa4RGaKO5YQeJb9Kxi3Z/cPIWxJ2GbfA2
	 p31x2T6l2o6zv6LJrXqxf8aEPcu7spog6Ueht2Pk0f6W8bazVwTKrJ/Dzwj3LRfmgTd3r
	 RfKt4xggmvelLv1FFMRSwLP4y1JRcp8ZzGGhX/Nvy05hoBQ25VV+pNSHz22HsZPRpgzcm
	 GCyYAr1ad132vesSv+QFMsUAzx8eh5QaFzTxzoux8zMd6nFO2JAbrUdb9PIfxMXuNQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661174;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aft0sw5cJyBwNmHMPgGVjZdw+TPdBNlCzonpVyWC7EA=;
	b=jcMBkSLYmCTgBjcLhuM63tPnfOq+Uwto6tJzqHm9eClX59m+U5uFb0JSkP6okIDnHicR
	 jyEjEBGoDaFZIZ5QJ26HPGrrnp+7dGANRaOxChjf8TiV3WiArg3syXDOLrVbi7nUpG7UH
	 ZTJWbw202mKngUnRoeyv/FVzbrXoW2ttg57wn55W5D2pApX5dFvXMpymZf4tjjd4RFLV7
	 +virNHqbNhq155rutOsIBeCJmduwoUfX2N6ejUWWpOMTkKnJnaT1zlhNv/Mmrrvti5A6B
	 xPcMlzvKrk0OOK0NF/ei790doW4AVbjFUhwFSG88X8RmCs745V9MvOcAwYkwAu0RfOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A64A1F000C4;
	Thu, 22 Oct 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661174;
	bh=aft0sw5cJyBwNmHMPgGVjZdw+TPdBNlCzonpVyWC7EA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jP7TEwqPO7q2J738B7WA6ly4029C3YYlr2SG2OrpsMh6jT/x1ZfflWryIv48AlMXg
	 iszx8CSbCDZS2asr0E3qpt/bywZd1talZLfPFZT1b3JyZXm7ZEcDmiXPEsyHOSKRtd
	 aR4Hg7j49nxElCTEZ3OwbM7CibrtASjlmzjxHLr6KWNOeINVUUkQTkeqpfzVHILd8z
	 ibOliIf2KZAIZd2Zjqdtd+IKegAGQbxvCIlKyIN8nlTya8BqQ2YB+vDSiDPSsmHyqL
	 ppMGaKgf3mM0wveUWhUBSkkMgKirfFCDE9JWxnB+OTZzi3WIvenpUyqxQ7rfa64zWN
	 QMys1FJrhQBjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD41743546;
	Thu, 22 Oct 2026 09:26:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Thu, 22 Oct 2026 09:26:08 +0000
Message-Id: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALHW2WoC/zWNwQ6DIBAFf8VwLq1sicWe+h+NB8BVN6nQgCE2x
 n8vmPY4700yG4sYCCO7VxsLmCiSdxngVDE7aTcipz4zgxqauhWC65YTWA5S3hQCYKOuLMtGR+Q
 maGenomflUjSH61Lud8CB1qPz7DJPFBcfPkc2ibL+CiD/hSR4zY3SfWtkM0itHnp++ZHs2fqZd
 fu+fwFJiKgLvQAAAA==
X-Change-ID: 20260911-a9-i2c-24478e22e683
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792661171; l=1291;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=lgCx6iIhgtG4pBSTGFRd3faIm5dYhSgEQN1+ngpmI9g=;
 b=GSVpFUVXSp4fB7ZRpJvmq8UQN8H4ZLd0NQMr4Gtr53ZbLXBuWhrmygvL7Wg5j3PTif2T8TnXC
 XMdXiZuDbBsDW5X+EoBOK0xq7EDf/VP1p+y4VOYWi6xipQ9vqUAXWX4
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Device Tree binding and driver for the I2C controller found on the
Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- dtbinding: make some minor modifications, suggestted by Conor and robot.
- driver: Make some adjustments, including macro definitions, format adjustments,
          adding quirks, process optimization, and so on. According to Andi and robot's suggestion
- Give up MAINTAINERS file the separate submission, make it together with the driver.
- Link to v1: https://lore.kernel.org/r/20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com

---
Junyi Zhao (1):
      i2c: amlogic: Add Amlogic A9 I2C controller driver

Xianwei Zhao (1):
      dt-bindings: i2c: add Amlogic A9 I2C controller

 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    |  56 +++
 MAINTAINERS                                        |   9 +
 drivers/i2c/busses/Kconfig                         |   8 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-amlogic-a9.c                | 469 +++++++++++++++++++++
 5 files changed, 543 insertions(+)
---
base-commit: 4ec2365c08de306f52650d8736aef5862baedb8d
change-id: 20260911-a9-i2c-24478e22e683

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
