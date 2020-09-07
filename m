Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20061C2BB84
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5722168B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 11:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlCyDJT3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GxsVYEWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5722168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y/MyG6jPg5F3RG0bgIdp0dnWjpm1zI9P3Z0Xsf/5p9I=; b=ZlCyDJT3La8OGEROHIbMDocR4
	QKXJCZQKYI0CaQBkAAdxdDPIjXj6mfnXhbg7Dnq2rgOPO4m+tMNM4sYnMsS5KjmVliJdk7HDqcaCL
	N7jWbYCEl9xJ8/jn8bDi1ib7jJ6e48rL1raGL9Irh9VElkxnGbgtoYkZa9fvSqQqQA3xkNvqGf//m
	sliaXCWMc6ys+Ti8/OCE5npM89o8FD7B/cW7E/WSrlj179TrivHOy7PxCvn+b+a8jdr+kXhAi40hv
	nn7U9g1RwP04MURnpz2dSuJE1mOHJTsNZdE0Abcu2tv2WBsH+OoWnh13uv4eyfD/Cm1Pf4XOUlyeb
	bKtD1eCTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFF2i-0004Mc-62; Mon, 07 Sep 2020 11:10:36 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFF2e-0004La-TL
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 11:10:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id a9so13814850wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=GxsVYEWAqcHsbTP7ldWw3XMCSUXXkLDNAViB7TZMo3ZdMOGcqOqxNnbyfEhbNIoRUM
 46jE43/CA1WYcTx4AqrwiYOz/01itWTgB+EffYBiHX4xig9Tao2uLgSoQlTWbshlEH2j
 0FPQtFZmsYMXrHjWZYDF7JSkI/IY3sQoSn06lAxsA6tikxN+NkDDlOpLMHVtlLgOYAYV
 xgbWw8OmqH0UulxQdF141iVs1KUGrOXXXpCC5sd7enVwNSdfwFHhGpWtBP9A9yn3fHsC
 BfpBBqMkntjTpjaS26AU1P7IzvA6Yq1idSLklbk8e6YWdhVWF0Gjyo9IT4YixZjMlBYI
 jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=ftskqf4CBBP6oOohu/4PVgq90PlrTeGN+uWfZNW1VpYuKbkET+uNW34rgtLdQoOo0G
 F6EL/0dGNZpWdAOPEudObVM2e3SKaYfwE8DZoVVrCfu3q6GJ38rmF24+8LwdeA6srfGk
 PMbVMlxNMqXmKxqdUwupotGFy4OlHveUm06QSurXLnW7GqB8xyJ1K8VifrPGwYTH/0ep
 Y+ovz0kbq3p0Fbkq9s6z6rNKcRNvcjUsMO2Bs88hbaRQxwEu/Z9ZRhwQvv400c8yegHU
 Z3QWQ2nneHFk6KjrUd3KqXdPjHI8Wdgbpn+bzwaTawJcKOpFzzyAxnbm0zU/SghLr0KW
 KVaQ==
X-Gm-Message-State: AOAM532RDfpkLi+er2eBN8O3gFOTvZXeTgr5A6jKbOhl/qOv3QKMdqUm
 APT2P5btWEhIDPqg9vKGJhNGgw==
X-Google-Smtp-Source: ABdhPJxBVx0IfuJV1VVAaaxBYLauf53V/lzKaqIwtKzsD1pKBa6yHb2u7PSmJhqIF4DQRqGalb1VWA==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr21097200wmj.140.1599477031712; 
 Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Mon,  7 Sep 2020 13:10:25 +0200
Message-Id: <20200907111027.21933-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907111027.21933-1-narmstrong@baylibre.com>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_071032_963295_C404C2B9 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
from Shanghai.
Web site of the company: http://www.shtdo.com/

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1e4356cf522..4e9dfb352c68 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1078,6 +1078,8 @@ patternProperties:
     description: TPK U.S.A. LLC
   "^tplink,.*":
     description: TP-LINK Technologies Co., Ltd.
+  "^tdo,.*":
+    description: Shangai Top Display Optoelectronics Co., Ltd
   "^tpo,.*":
     description: TPO
   "^tq,.*":
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
