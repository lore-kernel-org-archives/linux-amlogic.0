Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7B2C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA9D20823
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbVP0OQi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x0+dQKv9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA9D20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EwkbcVSCg5zdeu0Q7qYPuJiqmyIeCL+TohOMBjUFBIE=; b=hbVP0OQi/MXqTy
	UwXpmqafFgPtdMNCqgvg+5jCzH+icwoxjoN/w1g87UuYz5kys3YxolcRftQtEIJXU5hdqTbs1umfc
	0UY8AeyMerzmzZgQjkm/Wa5GtpZ7ho2awpf1gICIwTWnU1ff7KaHZwvP9JPVPwrKshPSvNQqzQf/q
	vnnqbkaDOPr+RFgpUgXE2aiGx7WLR72xMK68tTpgnOv0j0O/Y7cvtoY1mNqWbSzc74Qpw7qF+bXJp
	UJYfSln5HY5CtqIh7hp0wkKwy5rl/CB3ugFZGMecHa5iWhNJcHD1C+ZEoTerMEe2Nzh8DdPjb39by
	jKVAp/GGIErDirtJEJrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0l9v-0001PF-0p; Mon, 04 Mar 2019 10:49:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0l9s-0001OY-4g
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:49:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id d17so4975358wre.10
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8HPvsAXCJNsQf+UHp2S6e/gJ74ZMMDr55DFvvFeYrc=;
 b=x0+dQKv9iSYij+TlYi4Xm84MJP9yRtYVoiAbTBnNST7MtNCxNJ0WWywAVT/zne2Q1K
 CBFSsb0Lcs1B6vfB7P2xSWRwyQQSnx0aBQm6NYs99AbutR3eYO57pK9ceEi29Ob8Z3lg
 ROAaodAhZh6B/yEQBIsC/bK18TjhLUTlWPYd99UauRJLQ8LSRiwWLkI59GbW0tyyWIGx
 vJtz0QjwNWrZGrmsq4DdMt2NJ7rq5SlK9Bd09txVwSto0SUjwaRCL/zWPE37qAMkm4/s
 0K/WrcV1koXCCURIFKfnhoFNFEz6/isnkFbPVyJ9bgJkfaWKeYyueVFAimxoSnTLt0Nz
 CAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8HPvsAXCJNsQf+UHp2S6e/gJ74ZMMDr55DFvvFeYrc=;
 b=GmyO0fk2YeJyxgQGZGnV3pBLchJ3kVpAUwVUZhRpeHt2uDcAap8AKpXD/6POt1EgQO
 oeD7cJKfgy3ZBRlSm2NVMchVLsuZFayljFx5P5Acdt+Jqxt6oSCyLNPOBLQFBsZpUtcO
 bZKCnKkRUhxIjbuKGwP88d71IAo2Io7JvKKm0PfiXmCOpD0lygmtJ6/cUeRc1hlbvYlx
 jYLGoWEwGDOaZ/WKsYOG6Rrd0FiPfofxpfnl+0P0sMzuvIP77Wmn6aplPueEL+uRbDiY
 otK/SwhLfl1al2KKf5Zk3QQsRNabWOb9f5afsXZ7IXFg3Ogo4+EgXRsExlP2PxOmAqqa
 +ORg==
X-Gm-Message-State: APjAAAVMK3F6RiNaSP/sNxZdqUd0/sRyNkr79m/J+IpNuABWoNhVlQkk
 o4eVcMewu2jz//0l3Dw0HP6+sP+tpGz9vw==
X-Google-Smtp-Source: APXvYqzvfjgtM7i0QLe/mmfTMiQLOPrziz7zgWS4BKlx0DReXb6R3H1+6a/616j5Wux9C4AnpyO0qg==
X-Received: by 2002:a5d:458b:: with SMTP id p11mr12510415wrq.22.1551696558203; 
 Mon, 04 Mar 2019 02:49:18 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f4sm5848804wrx.68.2019.03.04.02.49.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:49:17 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY resets
Date: Mon,  4 Mar 2019 11:49:16 +0100
Message-Id: <20190304104916.3937-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_024920_178721_57A2CED9 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A Documentation lacked these 2 reset lines, but they are present and
used for each USB 2 PHYs.

Add them to the dt-bindings for the upcoming USB support.

Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 8063e8314eef..6d487c5eba2c 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -51,7 +51,10 @@
 #define RESET_SD_EMMC_A			44
 #define RESET_SD_EMMC_B			45
 #define RESET_SD_EMMC_C			46
-/*					47-60 */
+/*					47	*/
+#define RESET_USB_PHY20			48
+#define RESET_USB_PHY21			49
+/*					50-60	*/
 #define RESET_AUDIO_CODEC		61
 /*					62-63	*/
 /*	RESET2					*/
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
