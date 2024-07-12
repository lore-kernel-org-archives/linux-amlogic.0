Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD38C3DA45
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4sWoId4rZ/YgaeaP6QbX2GdgKvWyGI8YcYby537gjk=; b=P14LoYATqaF5Lg
	Jj/wbfBa3wMth77w1MLFc+PhSmFoIUzMvZecERWYqDqW2xq9kiwi5Ry51fsP+3iL9eAYZ6n6EjdYb
	k1c7mdM0VtcS+S0Nke9cKWg7C1DU50L9IxlXfRKP8GP8MU/vBFwQ15QVmax52ZuABlz/S2lruQEzd
	g/jGv0dmZy+qktwNogOp+c3xg/QjS5eXKM6SC+PRIbYu4UlAwW5NH2KwU4LYitzynwrgY7i9p97rk
	14UQgyJ2GzKREDL4hSTQBGK4EjESiJwFu+2w+EoTtoUVRe7r6yXXLNSHrRDAE+HexXnl9nikANBJg
	N5DrJdY7mF8rkQkZvRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSACL-0000000Ggkv-2Ptz;
	Fri, 12 Jul 2024 06:56:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABA-0000000GgE3-3Leu;
	Fri, 12 Jul 2024 06:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4EC0CE171E;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19AAAC4AF07;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=mQvjWlhdUJODo7htZQ1+hcdFam/twUz6WZBVeqfHTXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gNQNOJfdeRMDorQD77FQu6qn3j0KMvbEqq6iCAXtINIuQz0f4EJLIcXzFsnKJPeLh
	 KKR2tRFWfNHyRFLfvrFZlPSeS7LfF6AuuRlhtSYio7U1Yv9i/8b/IlyW0ZSnkARHgM
	 bPu5Km/JbVXVYiwPRABq1aIUJQ4lW1d1GcergPYfPZmpcq3GMDZOdFU77iomxpZxLI
	 qcB9s7NzGddeBJwKFsoLm0ZPmoC4Den8xvr+8Y8DegVNpPtyETNS0zJQBTjfFPJAM8
	 P0IE6pcUbotSCf4JRxnAGi2zlp9ZREg16MJdIHw549DmnE2zV4wQ4KrqIie1pZsxC5
	 2q3T/U3bfgl5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07781C3DA4D;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Jul 2024 14:54:46 +0800
Subject: [PATCH 1/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
MIME-Version: 1.0
Message-Id: <20240712-soc_info-v1-1-05ba95929d5a@amlogic.com>
References: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
In-Reply-To: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767287; l=1125;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nnMjotXuHyUIt8Kx/nCa5XJH4NAVjChyKcIYDRAZ0Ws=;
 b=K2wHE0oUM7+bxhhudhE+NS3cqsySKqwMYTRXO3u1/826jSaFfDzabCLBVDD2ggy/RhSsImpVP
 eUd8thcgohACM1bc6py1qK9wuxEz7fF/aezCnHlp9kaUm0E+YZsAAVQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235453_075398_6736FCC0 
X-CRM114-Status: UNSURE (   7.84  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new definition for Amlogi SoCs, include S4, C3, T7, A4, A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 8809a948201a..7549f1644e5e 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -41,6 +41,11 @@ static const struct meson_gx_soc_id {
 	{ "G12B", 0x29 },
 	{ "SM1", 0x2b },
 	{ "A1", 0x2c },
+	{ "T7", 0x36 },
+	{ "S4", 0x37 },
+	{ "A5", 0x3c },
+	{ "C3", 0x3d },
+	{ "A4", 0x40 },
 };
 
 static const struct meson_gx_package_id {
@@ -76,6 +81,11 @@ static const struct meson_gx_package_id {
 	{ "S905X3", 0x2b, 0x10, 0x3f },
 	{ "S905D3", 0x2b, 0x30, 0x3f },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
+	{ "S805X2", 0x37, 0x2, 0xf },
+	{ "C308L", 0x3d, 0x1, 0xf },
+	{ "A311D2", 0x36, 0x1, 0xf },
+	{ "A113X2", 0x3c, 0x1, 0xf },
+	{ "A113L2", 0x40, 0x1, 0xf },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
