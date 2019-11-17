Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA462C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DB8206D9
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="neXQjjLK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND/M9msc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DB8206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OmsZm0o2Ota2tZK4ism545VAb21OyS7rV0GuXIdc+uA=; b=neXQjjLKuiK4um
	WWh5u74d5fSEIrfqwIZ5ENF7cYh8thpennYVGiF7LozWpdRa0tYuUsxBQ30j5NF/rdyEbNrhT9a7I
	efS/rhfttspTRlRUp75OowqTVTok8I8/kbbMIOy/Wa3BtA2RXIJyWHI7nb/L+IiCvySpGDzd1jOBA
	vtrInIblJaItK3/4D9Rf76HMuRmra/KiYVxpyjSc9mnytZZ9Y0rY2O0EAjhmXBjpat7yEr0hl6KMJ
	hgn7i38C4ENSv0NSuQ18I98sWn3DdV+/G05ORvgoPWQxxJ0PLa0AvcwDnNCTYDTl32X8+lXo9Fiuc
	2p1/rFdhziaK88he06uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWOIR-0001RY-4F; Sun, 17 Nov 2019 17:25:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWOIO-0000r9-KF
 for linux-amlogic@lists.infradead.org; Sun, 17 Nov 2019 17:25:09 +0000
Received: by mail-wm1-x343.google.com with SMTP id z26so14902348wmi.4
 for <linux-amlogic@lists.infradead.org>; Sun, 17 Nov 2019 09:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
 b=ND/M9mscgT+cliFMhwYfjCX+qBTbahBDoHQeILn1cjB0/pU78TBH5y6RZVYnQ2Xuiz
 WJzf19xR9AMpeWjTCa2e68F5epzypApCSPZmT99rz+UvtR66cNNssQg6GgZGvGa2ZWLR
 PWosJRqhGCYg8bFY/obsKXwlYTFfdQDp5GEvq3SXinkuLwjLHtNqnYUggvTGoEsYxK3d
 B3M9CllZuODcRy9v24jH/aCVDlYCDtpalpbjRk6pJkTEK+q95o0kZ1Npx7nsZuVQh2Rf
 NdOaEQbcGaoYPdYjId97ICUm9lqzIv3slYS/1vx4gyDkDSQ0u0ldmneym9yIn9E2eIsj
 PwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
 b=I+sMup4hM3GIiwaXjDXqFwJQGhSw3zo8Zf6U/xHyZG4RAAK1v1KZO0nL+ELRQKO7MJ
 T3A2++5Q7D5oO7qNvFWsaQBEKN8akH9Z4S6dLB8ppNC0AuxpcxF2lDM+FXAKtNoIRZrV
 Wft1LjzbmzixWi+4Csx3QVA7kvnoRESNuSk1xScPN7UUCe9wm/v9atCOWZeENdY/2a+s
 lj6+IKDxPv9VfudOeSHtVeTRrin4Izz4bdZz7LSumcn0ToFoBEUNh31tzyX6/Z5pVBHq
 VK5hSKn2l7mYJYB3/gHWLwqhIvJzTi9ePCpsDnD3tZdLSyA191Q+Iz1OybowBE7SD1gV
 SzNg==
X-Gm-Message-State: APjAAAWOBJnBfoRkjJMQJjAzZp4ghsjcdAbCcYaXZ06NS0B7R2X9Ha2P
 l3VqFyT7SedrhUPHI/bbkD9f9oTr2noeZA==
X-Google-Smtp-Source: APXvYqwYCkxH8WT5tnyVMQL8Y+OCQt9QGi+31SfNr+dAqz7TOYBP2GOBP00uQ6UxnDeC5KkdMUdbdg==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr26008436wmb.95.1574011505146; 
 Sun, 17 Nov 2019 09:25:05 -0800 (PST)
Received: from localhost ([37.238.189.25])
 by smtp.gmail.com with ESMTPSA id m9sm19379328wro.66.2019.11.17.09.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:25:04 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [RFC PATCH 1/4] dt-bindings: Add vendor prefix for Videostrong
 Technology Co., Ltd.
Date: Sun, 17 Nov 2019 20:24:59 +0300
Message-Id: <20191117172459.12688-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_092508_669176_99EE29B3 
X-CRM114-Status: UNSURE (   6.63  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB( Android with DVB Hybrid box &DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC,,)as well as HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..e4bd0a9fd4e5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1006,6 +1006,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
