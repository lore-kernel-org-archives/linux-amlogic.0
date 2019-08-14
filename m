Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD58C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 502722083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrlvL7EM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJSPRRPs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 502722083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2S4bvJCrz4vr+NGZUiKdQ9uGlKveR7Py+RYBccP1vA=; b=lrlvL7EM2wWe22
	hEnXzCwm0VTp9mh0vLQx9wyNPbQ8ncMi6aCJGrc7a03Ckr7PE9qQyckwhhGl3MWczBut9uc7Kyxnf
	OfpkQW40Q7/FsnOBh2sAPIWgtcQAw9X1nbFfJBQmzc8Jd+zvvMDwRhYkW7io/Q8lHSr/J7wCyg56+
	0mi572uneQ7fk1qVrgZ6xwiN3w4toJbROjDyPF96Ev1p3lkBSEh1eT7HVYurGlX4pNmwwHXobjSAi
	kwbS4K7/nXIpDNhw2Q2HOB/Tr+aHFwgVNbKkNwNDagRFRi9ybDM6yS3+9/ptE3mxj4iM72X5/p5pr
	8xT/o4kdt3KUhD2H45Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuIy-0005Ld-Db; Wed, 14 Aug 2019 14:31:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHK-0002Yy-5N
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id p74so4782046wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUFWU8WRwKUHyk9ysO+UmRCQeGUsUo2OQ9jgnTI2jL4=;
 b=YJSPRRPsYt1E+0kskqo2KZ0KxRuwzI/W9tCkTvb3Fl4k3tVgHSeayxDVMwK2u217zw
 dKCEqtUh3BB6kSd2VdPtiMUQXJRMHSx6lEsLu6rUKW4UBOXYa3Hxdo2U74Gqi4pmQZ3O
 Xf9ttr2ab0I6QeusmmoGDOAjhi8NOrMLpRo0nR6NAgS4c9kMLHMEu2ShEEKuYTY05/Ok
 5ITY8pruPDLDS7L+oR0FPN3RuniTe3Oy8nFNtmzhcp/OS0HPbtIr4GXxN70EN/EBpg9H
 nDHytwOkIPtVQl6tpffjapKu5u5yYNHNw+yD/hP8oADDNc2H19dE/jJvqC+kORZu1q49
 E1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUFWU8WRwKUHyk9ysO+UmRCQeGUsUo2OQ9jgnTI2jL4=;
 b=ixmwzOFF7LNykqWHunM3usmWuiM/gLxHMyxyVrRoZMxoAfNNaV/kA1TP0DFkmlMxnD
 Cg7SDcHYvbgd72ggO/9ax+xymlIj4nHTfYv0v8gl3q2ds5+cX0Gn+XOLSj1xIxaL3Xuj
 24pZA688PwiUPrIDQtJxzEKEWaVT2W8C4w/JNeW7yzudEwHLm02sUBKGpyqp96bYgJvV
 5o3/7B8y1tq+izDIZzTbMGSJFPaw/jJRLPBtPJBq11TRZeXSc/4DfVzZc8KfZS6kZSwj
 s1PUda+Aqiy3ZhY8aLO9b/9DlHNecVUXD8SlX6PIdvMHguV/MHxztmfRwetAAu6UvjBl
 gkRA==
X-Gm-Message-State: APjAAAV4tZa6NFasil7k3sKqPZIYrMEnQiYql4pSw1miOh6333EFAgFQ
 EA8Jb3lkRyuVOYeSGcjtujo9kxsHihOcaQ==
X-Google-Smtp-Source: APXvYqxqvbPnJJU4Qrefo71FvnKlnfM7Pqexf4YSOuUSz/kpp13wICGyBK5R/P51oNug04Y1SiNdnw==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr8257964wmd.122.1565792964953; 
 Wed, 14 Aug 2019 07:29:24 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 02/14] arm64: dts: meson-gx: drop the vpu dmc memory cell
Date: Wed, 14 Aug 2019 16:29:06 +0200
Message-Id: <20190814142918.11636-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072930_275208_C0DC3A45 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: Additional items are not allowed ('dmc' was unexpected)
meson-gxl-s805x-libretech-ac.dt.yaml: vpu@d0100000: reg-names: ['vpu', 'hhi', 'dmc'] is too long

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index faff77175486..c2d3fffea8a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -528,9 +528,8 @@
 		vpu: vpu@d0100000 {
 			compatible = "amlogic,meson-gx-vpu";
 			reg = <0x0 0xd0100000 0x0 0x100000>,
-			      <0x0 0xc883c000 0x0 0x1000>,
-			      <0x0 0xc8838000 0x0 0x1000>;
-			reg-names = "vpu", "hhi", "dmc";
+			      <0x0 0xc883c000 0x0 0x1000>;
+			reg-names = "vpu", "hhi";
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
