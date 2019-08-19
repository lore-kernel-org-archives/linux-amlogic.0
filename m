Return-Path: <SRS0=FxKK=WP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D689EC3A59B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2019 07:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60CF2086C
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2019 07:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ptej4tko";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X41GCFmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60CF2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FS1AIZcm+vSjxjoqcfXFNW008sudUgBwmVX9bPwskT8=; b=ptej4tkoAljrAJ
	qitbo3EqG4BpJdjYGumSnwDw3JabcXfP4h2NcNzDjsqr2tszFCjlgJACV8xHkhEB7xl6mF+m+TCwD
	LirCbn2XyMclKiHREs+7VpVNAB2dqCesIt+VK5i/63+TU24BmUJkv5idb75/pYPINKK4ThJF/1qU4
	1vwFB1SHxmprv/vi4LJXwtAXX1e3J3snPUltXgvBJrfJ/BLeVMYMZJokW2ey7KOZqmDHuUoqjb5hy
	TfFsRqOh91z65TkD8vsP124BBv22kSYWf1ec7F6sUkIqrL3b6HL/MxOuSQRSlggKdsbH2cpB7ZeBy
	npE7CbWs25Oxfx5NJWwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzc4l-0006cz-GU; Mon, 19 Aug 2019 07:27:35 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzc4T-0006Mc-Vu; Mon, 19 Aug 2019 07:27:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id 129so657825pfa.4;
 Mon, 19 Aug 2019 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VQRIe3TChFRyXdxRGe3aSOX8NvTgeh2sO+MrQdRfJfQ=;
 b=X41GCFmjZE+53yWhhAhv+BG9ETVRpdLMB39GhtJePpASGXI66HFO3qalN7vAdwxzKo
 2qIDZUakhTxlNhyUSrZy4vY+ZERhEDtdlalGYfSgVdB0cQYxB4WZZVk85Vm6njBK8AR5
 HkD6qPu9LaZkVeFLX1sJyIEgU4BdywADTfKNfFLvYvIYtuuVLq+MrVj7zegdoO4t3ESX
 7kb5rJ0IiNbeQelLmXzpV31uhBCkkRixcU9zV2E+3bgY8piX9LKc8+bNc2H5ondH86+s
 O588PvL8t7wv4gAd3Z84plQCoW3/WEAAewpHGOFYMRmdmmUh9R239zobJGGU07jYi5Yb
 TwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VQRIe3TChFRyXdxRGe3aSOX8NvTgeh2sO+MrQdRfJfQ=;
 b=DlQHLgciV88AlAOw8hiBdOlkJ2QonK4QptFYSRWJZyxpB5ZBkT9/PqL6cdPXIDbK/J
 o/ihU8AR8TzLQGrep3VLC4uaDb/hugrKW+DDdPJmUVhzV8yhyDwdTsgcmVM0g3cdhAhs
 fcSLOLcwiH5MHW+c4h+lKAzcDCQ8joOjiaGZTkWlqjXUjTdjtI1UEofjsKtfvlA5sLaA
 dawrbQ8u2pstEyEA7vLddY795p17Wizgy2fprutYNKk0Z6uet2SvMyp6c/5hXMIoz3L1
 ddNFJetksImWajH8XtCCWImeOFfdBN5LhsoAgDQoOoepq8QcEvuiGHndMygLPmZrNHnx
 lZog==
X-Gm-Message-State: APjAAAVsODm1ELoZJ7toaFZYy36g+Tgi6kxEIbct33wSLWW9/FDww1f2
 EUmadVNPTjHxV98fggNlbIBvt2s4
X-Google-Smtp-Source: APXvYqzhl7TSi883y2yAyMZn4MZoHhDOoBmIbs55kK1oFVR+R13YRJoVT+8P0NhIlGTWusuc4QduiA==
X-Received: by 2002:a17:90a:17ab:: with SMTP id
 q40mr19679774pja.106.1566199637529; 
 Mon, 19 Aug 2019 00:27:17 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
 by smtp.gmail.com with ESMTPSA id p1sm14994814pfn.83.2019.08.19.00.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 00:27:17 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: Add of_node_put() before
 return
Date: Mon, 19 Aug 2019 12:57:06 +0530
Message-Id: <20190819072706.31732-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_002718_029708_D1D5ED8E 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The variable np in function meson_gx_socinfo_init takes the return value
of of_find_compatible_node, which gets a node but does not put it. If
this node is not put it may cause a memory leak. Hence put np after its
usefulness has been exhausted.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index bca34954518e..13695a72c695 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -138,8 +138,10 @@ static int __init meson_gx_socinfo_init(void)
 	}
 
 	/* check if chip-id is available */
-	if (!of_property_read_bool(np, "amlogic,has-chip-id"))
+	if (!of_property_read_bool(np, "amlogic,has-chip-id")) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	/* node should be a syscon */
 	regmap = syscon_node_to_regmap(np);
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
