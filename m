Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D592EB28FA
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/6DcN+TccVjOnqV4nXed8ZejTA9WyfC9R4MVkY6KLI=; b=uulEvFw8G05gHx
	Ux2aSD1DZ4JBECu/MZRWCZOOmc08MZ6/XrzRZVfRJz0yXg0PNn9MKWJR5be7b9uG72Fa2PHFAkMuC
	3OpEvxXhL413UFK3rrFXAEZauYq84QlmeqqRLkXSyu93tQw3VoLWoM4d7YBn0eu67zVuCJL9XWVrj
	H9SSeSvnEmQJlp4X0YRozp5+xdmOnVGJmMcdCi8agPL+osov94wn/mcQy2vpKBE6Nsct93K8gwGNt
	7xLT6OA5I8IvuDDyVEWADO9qyFrN/7y5LoVYfHRPlqsfHbOd3r5yXnVZCrbSRwF713Rb3U101zhfA
	n3nC3yYRsvcPJYp11pZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHjp-0000000B4IU-3aLF;
	Fri, 06 Feb 2026 09:02:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHjj-0000000B4Fv-0Sl9
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 09:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FC9543B55;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52E1AC116C6;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770368565;
	bh=jrh61Q19wLzhUZ6sxEiPQLIX67ExYX9Ua4Vm7hOPgu0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uI91vMUb69MbqcTz7+5oZkTC7rQOa2uR5KQOL9AuNXREqmTROXZTHY63frc96PBRc
	 /spxiWbCyj9EwizMKBs2JHELrKyhfUyuvWkpo+8r2UKUV90THuDphsKe7Wm42oFzzD
	 0VW3AWSFn+l/TRLO5DNNtsSAD+lGtvZUp7jgSzR4iSaad4p5yQMJtkY5AGQBrbwXQb
	 6aKmNS5SEexsGWU7pItvVZYMIr1VfDjBxArDfzp5KOZGFIS+MW1eKcTUbJnz03DlKO
	 rd04gpzpTWcbT5OQAw8Bqk0eX4jb1vd8PudLxjb9W5Z1N7zxfLIQivPWxBOhRoMte4
	 xh9R40PgONd2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33129EB28FA;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] Add Amlogic general DMA
Date: Fri, 06 Feb 2026 09:02:31 +0000
Message-Id: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACeuhWkC/1WMwQ6DIBAFf8VwLo2swNae+h9NDwS2SlLFQEPaG
 P+9aOrB47yXmZklip4Su1Yzi5R98mEs0JwqZnszdsS9K8ygBiVAKG6GV+i85W4wHFuJ6JR1oCU
 rxhTp6T9b7f4o3Pv0DvG7xbNY172jD50seM0JLi0ppFYbvP3fsw0DW0sZdlvXAvBoQ7GlAuUaQ
 IfSHe1lWX68yXz15gAAAA==
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770368563; l=1514;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=jrh61Q19wLzhUZ6sxEiPQLIX67ExYX9Ua4Vm7hOPgu0=;
 b=DKJiuMJk8Bl6zffHlSwK/VcLZjWMje/yyrkDq1sbzyxzUlYkov/hf+Gdw7UD3973aKSy2/mWy
 B7/mudaXVmZB4UBcl5W6mlvyD2HFRIhUDzX8cum2x8GE50VK2ulqODL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_010247_207944_45E6755C 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

Add DMA driver and bindigns for the Amlogic SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Adjust the format of binding according to Frank's suggestion.
- Some code format modified according to Frank's suggestion.
- Support one prep_sg and one submit, drop multi prep_sg and one submit.
- Keep pre state when resume from pause status.
- Link to v2: https://lore.kernel.org/r/20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com

Changes in v2:
- Introduce what the DMA is used for in the A9 SoC.
- Some minor modifications were made according to Krzysztof's suggestions.
- Some modifications were made according to Neil's suggestions.
- Fix a build error.
- Link to v1: https://lore.kernel.org/r/20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: dma: Add Amlogic A9 SoC DMA
      dma: amlogic: Add general DMA driver for A9
      MAINTAINERS: Add an entry for Amlogic DMA driver

 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  66 +++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 561 +++++++++++++++++++++
 5 files changed, 644 insertions(+)
---
base-commit: 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
