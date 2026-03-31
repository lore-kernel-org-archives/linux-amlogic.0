Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B3109B479
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4KqwQCf3rADoIjyEYP2CzEOUu/NpOpi5OcuYmYtAhU=; b=xcoEJQ9uwmHzW1
	YTer4f1tpIUhWeqrhfL012XWzqZMmyLcrGapw3SGJ419tfSNo5H86RlCip7rz1A2XfPs093DP2Y3O
	gXizmFT1Yy8YoLyiHUPPlG0GCMoFYhl0Ry5nF+Y5Yl8odk0Z3sESIjDIDLdRalmK9pOdtYvWv4OK2
	zGfygRDgbmAJ1kBWwl51qY3kNIacXQ5mKvXOfvQhODedIjAPM2FFrf1sukFWx86FsobmZaDqkS1ho
	YJdhPwGEioUImZEpWd4SF0ffq9KiGb8z5nefDU8HzohsUxYns9sGWp6I7EAM166CS2QnKsk0xLohc
	L6vzzb3rmCrWqOJ8MoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1g-0000000D5Jg-2Nma;
	Tue, 31 Mar 2026 14:25:04 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1e-0000000D5Ia-01Zl;
	Tue, 31 Mar 2026 14:25:03 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774967094;
	bh=GOlKayIfpiCQcbj9a8oH1jhKbUMrxZqheip0PnNf7HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DjyaRurNKDYmZ4fe9ZPUwOVIe3Uj91gDLzPeptrW5WRl4NFUP48AW17h8BGjfCk44
	 8KgG+UCktBVpZSwYZvrd56LxcfgzxxEI6DVHgtZButLE0O1aOoJfuvTS2X2ryd6lbb
	 0oFv/1yy+gse+inDss/V/VOoS+XM/KzAzI8kes6w=
Date: Tue, 31 Mar 2026 16:24:04 +0200
Subject: [PATCH 1/2] reset: amlogic: t7: Fix null reset ops
MIME-Version: 1.0
Message-Id: <20260331-fix-aml-t7-null-reset-v1-1-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774967093; l=734;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=GOlKayIfpiCQcbj9a8oH1jhKbUMrxZqheip0PnNf7HQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP872jP+le9oZQM63fOc8yNc3HeX8VBIpWZXvK7i0uhJZYsCtqYHh2YKRmsDO/P+ussk4lRZSid
 T5aYFgmO2Wwo=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072502_490129_752621D5 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix missing reset ops causing kernel null pointer dereference.
This SOC's reset is currently not used yet.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/reset/amlogic/reset-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index 84610365a823c..c303e8590dd68 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -42,6 +42,7 @@ static const struct meson_reset_param meson_s4_param = {
 };
 
 static const struct meson_reset_param t7_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num      = 224,
 	.reset_offset	= 0x0,
 	.level_offset   = 0x40,

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
