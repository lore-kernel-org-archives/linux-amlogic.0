Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EE3C98317
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BpsrUoIRNjUxwAuBieGAchPD1xQY9ffccooMp6SoyU=; b=g5c8lbz1049xs4
	+7fk2NZaQIi4YpII+uRL1IB65qWADm+6MSj+F1h63uIxDV4GAqayh9FNvE35o2OJHQK9oQ6nJ4P8t
	X3O7dHoEUyurmKc9qVNID7+rJ+9OGTQyr2pYLtoGvW5R18ru187s3eg8g+iWkCt42DHkqE99X5wVj
	/eWiJBPTJxA3mCNI0BHF0UMb2mxeRd87ZDDzh9YLTTI4EazBCjaITJkFxeivB7+J6Z2oMezh2Dit2
	vpuefFgP3VepgrdCd7jX+qgMIOLn3uHCjGuENSzoUIGGi9YBaIZfDDV5TI4neniM4AGGSCdhMeDRw
	aR3jpVWGZ6lvxhZOX4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezo-0000000ASk8-3xzn;
	Thu, 24 Sep 2026 08:40:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezf-0000000ASfU-24V0
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 08:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 995F660534;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F9D6C2BCFB;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790239190;
	bh=06FZnhXGZuZR4CkcXGwW8TQfbRJRFXYynt8Gr0hO7Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f8cGWr30DSG9SZtNzvp667ycxEY409ApragHa6j+pzrt0j64NNkDX2bFYijltU7hc
	 qdRB9vjJn/IKF2YxnlzOYsDJTMC9fZsoh8fBmoEuB+yxRxoE1UfQQQ2FaGskjP8yz2
	 lOPmTfWoLgU6hvpqp/mE5ziJCKRNoEVokbEJSH6Sn7PMc0hzmVh3GPZW+cHsatYFR5
	 3IPViR/vU8AQzG56Uo6orucSG8fXYgCP/dGD2O1Crz/qJ7KZ6QD44Vs+Qs0cqbvUZo
	 SAscG+d3RP33cLL6BfjQ0UgJ+Y9Div8ktbeX/Hiav6gk5AsVWEmI3muSVLQ9/7q/74
	 kRnw0i1Cx0Juw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E75C98319;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 08:39:36 +0000
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic I2C driver
MIME-Version: 1.0
Message-Id: <20260924-a9-i2c-v1-3-b8ad9b46f4a8@amlogic.com>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
In-Reply-To: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790239188; l=829;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=aYonPJ+1tSzZLPuDMhjuR3pNtXh8ncO4wuKdJvLpiZk=;
 b=W2fhuoKGAkSXG5MS0wF+fkCwKpIiTkXKALi46UKdci9Vw0mrWEaJm3i8Nc6u20K6rY8qICF9M
 ViMHi39DZ58AbpKcjkXoLGboKoo37YOI8rXrOi0ve2ziIU9SDiCzP0G
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic I2C controller entry to MAINTAINERS to clarify
the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..33c39ecf535f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1371,6 +1371,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC I2C DRIVER
+M:	Junyi Zhao <junyi.zhao@amlogic.com>
+L:	linux-i2c@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/amlogic,a9-i2c.yaml
+F:	drivers/i2c/busses/i2c-amlogic-a9.c
+
 AMLOGIC ISP DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
