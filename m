Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADB7C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 May 2022 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ko1V+TNqtx0hdX3KbYKpqvsz0d7RBx8XM7ADXmZQgoc=; b=rTavS0ATkmhKxw
	Gn58tdk/SMDko4X5s3ve878PJWdaDbnh2TLULLfME7tul4J1cwFP3YpOXXRCH5WkCj4aOQ7yE8h9b
	UKroOsHK+0hUaQMMkT8Yu+KGZ4BAUjdDNlv7I+pXPP2CCCQllw2uCJ1hnxgLst64NLnUlEowU5hYq
	elALWxak9N6kDGWwCn8Vv8di1w5g/2Vpldp3HkD50K8LbHrS8waKviMCeCzXFGoXBRYDQ79n0kHOO
	0ocpUCX79TnSa5kOZYR/zrIZ2lDLCjlCwXnqHyhpQEXfy0MsDiTIgj96Pt9wxGPWUFSYfICO0u4F7
	V+TbIHToB4UJ76pa+gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOUa-00701s-IA; Tue, 24 May 2022 06:58:08 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOUQ-00700k-6I; Tue, 24 May 2022 06:57:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id r71so15622141pgr.0;
 Mon, 23 May 2022 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XnhPJWRti5irdiFCJ82HXC9jEWYkqiMNZIjhk1PChYM=;
 b=Atux7LbREZXCCH4u0g+KBxF1ChuFjZ+2Dz+Rt3WWPxbwFE3pcgfIySu+/GuxEVjGLJ
 6+WOrnRsmElAXa+hGg9S4dmzG5JIb3PV3kzf/GxmIer3lr9F6yK0ME1VOBE49uSWv8hl
 S5R26XrucgnUIYmd6NnVyj44/5dXDteX7lM2LVBJg1quRDuffYNcImRSQdODkInSMaPk
 fKJn8aKkZCMV+P3GrvkbwbtB2X0Gj9MgR3TvkV7qD7dNOS426ZThdY6ht2VFJWyVva8a
 16Ct5cZtvDQYXxyX2PVSG+KAmxza+U6qfVXNoGnvM++VdU05NVsF8ETIAkB1l9DBY+IM
 XsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XnhPJWRti5irdiFCJ82HXC9jEWYkqiMNZIjhk1PChYM=;
 b=WA4VJQLMAHybMFKeuPWc5biDc9cxUq+cmKFuNE7C9ltxdBM+KaJQEreMF4f1XJ1bGZ
 f0Y0ptpxq9lJd0Qiq8qTwg7pTKvLS+JLfd38YA5Ei4X9OPVkAauWIPvJSsayog26M39F
 3R0nmmNILyEize+DBUEKFMlz7XUNogdPbZwbCFwaQU6JkmiFa+F8ZRvOE0mvCea7EccP
 Fe5PcMwTX7bCD8gTlW2WXZ9HODjAT//3CjYZBtFeUPb1f6y8Dxfi/m4wwMtYyZ6z/ROi
 GR+5d4LYC6uv7AIHF+yk4sYlzai4KPNQDnJgbvtxeeB2z8iG9G+IuYUBDyoLAtdIV1G2
 dZ8Q==
X-Gm-Message-State: AOAM531EmzFCKJW55MkeheMnaQYglyQVn1N9ryGJEKXyTfIxUL33+3ow
 k1uloBCP1CUhdAOULncOstw=
X-Google-Smtp-Source: ABdhPJxjCHLfeE5M+/EvxtMUDVpKvze/ODF+6ndhlHLMXll9vfEzQqL6ESlbbAmma2BfFYzfrI8N+A==
X-Received: by 2002:a63:5a13:0:b0:3c6:3d28:87e5 with SMTP id
 o19-20020a635a13000000b003c63d2887e5mr24008160pgb.452.1653375471366; 
 Mon, 23 May 2022 23:57:51 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a17090aae0100b001cd4989ff53sm882847pjq.26.2022.05.23.23.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 23:57:51 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
Date: Tue, 24 May 2022 10:57:29 +0400
Message-Id: <20220524065729.33689-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_235758_272344_3AF1B4A6 
X-CRM114-Status: UNSURE (   9.91  )
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

of_find_matching_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 5e68c0fc8df8 ("soc: amlogic: Add Meson6/Meson8/Meson8b/Meson8m2 SoC Information driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/soc/amlogic/meson-mx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-mx-socinfo.c b/drivers/soc/amlogic/meson-mx-socinfo.c
index 78f0f1aeca57..92125dd65f33 100644
--- a/drivers/soc/amlogic/meson-mx-socinfo.c
+++ b/drivers/soc/amlogic/meson-mx-socinfo.c
@@ -126,6 +126,7 @@ static int __init meson_mx_socinfo_init(void)
 	np = of_find_matching_node(NULL, meson_mx_socinfo_analog_top_ids);
 	if (np) {
 		analog_top_regmap = syscon_node_to_regmap(np);
+		of_node_put(np);
 		if (IS_ERR(analog_top_regmap))
 			return PTR_ERR(analog_top_regmap);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
