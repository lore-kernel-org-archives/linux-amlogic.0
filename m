Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D483C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHLJHxR1K4Uo4qtCuISRilOuMQj6hFyc53qOYt7WCOs=; b=MUYiffcm6r3dBH
	7kP/+y4Sp8PvOJYnpKI1fGFQv1cxjc3bF2D3bO41F8hn9agbSFdrIyXdBVPoadmPh+1bMIdCg414s
	0xGx9+AfFMDAGGxLRyRPJI6TBEnTQ/ZnqbGZoe7w7BpL4yqNs5959iFrX994tS5wUyLQ37Ut7+ThC
	mgCMjEdUB3DI+b9sh054i6XQUnzXWJuO0OTQdcdfKDjvQLA49eWwTJHnyj3QXHkh0jC8Ea9HTf+yE
	9T/Gt5fA1trzt9nZIyaNorZmvtoGrFlxF2IupeLyTO++DrY6ffzBl956U+FnSpP/jFn9nR066sAZY
	Bzu6gw8wcmXsd+9Rcm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jw-00Gt40-5J; Wed, 18 Jan 2023 04:45:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Ju-00Gt2Y-0S
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 04:45:07 +0000
Received: by mail-pg1-x536.google.com with SMTP id v3so23645871pgh.4
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 20:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfihuVFwjd5d3eUYDaVupZrTOejihs/ApCisILxFErw=;
        b=iIZ7zPl+O+toE3nPuz0aILU48jCG0tEOyL1xKTUO7wLHUYujqTmYAwqEqKKVHgKecJ
         LXU4VOntZP0lF9/kvYUdGa+JgcU6C4P9vvUjg1KcN6YSXHzE6gOUR6DdAGvax8go/t9a
         1gDk60IpS5taasM3iCzOMJNgu7OJpz8VQzIF3gwq04XLUnmgqMbF8P+b+se/HsXRZULS
         qJcElls5l4zMZa5YjwzfAZ+8+sMgI+Uf+1SkTBw3PdiCN6g3texCwlIneHxByniKWdxL
         SODuxoM4s/KYhZiaylSHIKbDkTwwMSFJoWwDrZbB1ddWubwiylfEhp1OR8aTUSFuBCph
         2EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfihuVFwjd5d3eUYDaVupZrTOejihs/ApCisILxFErw=;
        b=AIRpa7nAjkcERfiDm9u5LxcGxGBPT9PIZdzfKlW2vwJOiT7qukhbAK8gey80HhAoSZ
         1M85pITXWEXfdUxXjtwRljoB2UvEQ6IhYDXhiTaOVTY8ZmFx/kJrvzhOnfnL9HeSpNdM
         SYKq8bcGnK4mIu7gTZAVt5vtNN5X3mcWl6BsJN9jeJ2bIXcTCSOdQ0Yce+QGHp84njTQ
         eY7fSMDGz/kz9WNHMZ8TJfFN+k5aRw4JeuFcdzy7VXxPOqUChwhtBDPW4sX5yYsPE676
         n9/MUwE8q7DKTA7AK8aQgYxSghL+013YowaUDy6C8qbh1RwUgdmv+uPQOxzMliRnv8zV
         bzOA==
X-Gm-Message-State: AFqh2kqyewc9qGqvV3otNgoatfx7wXzzsijymRORaefAfew9sz/YkZdt
	EVYsyNN4RohflX5O6vBOA0g=
X-Google-Smtp-Source: AMrXdXuPHaZARMk1tFINkL/nlmxzUDML6XCzLORMAthj8F2FYePyX1hUTAWnb30yDp8P3ssUGUGgSQ==
X-Received: by 2002:a62:15d2:0:b0:58d:be61:8bc5 with SMTP id 201-20020a6215d2000000b0058dbe618bc5mr6584900pfv.13.1674017104956;
        Tue, 17 Jan 2023 20:45:04 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:45:04 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] vendor-prefixes: Add VIA Labs, Inc.
Date: Wed, 18 Jan 2023 04:44:13 +0000
Message-Id: <20230118044418.875-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204506_077237_EDE2757C 
X-CRM114-Status: UNSURE (   9.74  )
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

Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
of USB and USB Power Delivery controllers for multi-functional devices
and platforms.

Website: https://www.via-labs.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
V2: - drop Drop marketing, so without "leading".
    - add Ack of Krzysztof
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..d19b7f9cef4c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1398,6 +1398,8 @@ patternProperties:
     description: Vertexcom Technologies, Inc.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^vialab,.*":
+    description: VIA Labs, Inc.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
