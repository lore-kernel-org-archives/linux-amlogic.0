Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59469C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29894207FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHtRCQ13";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnqKrCN7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29894207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7XNDYK9ttRZCRXp7BXuJEKts5ugIDdVtEA9SJ7mR/CQ=; b=WHtRCQ13pBGYDMAh7o8HHl4x3l
	Nejgsm/0Cf66iCsBai91gAArKD3piNgEMP33QXX23aLIqINl4VKALrbTmujGBsak6ZiyQc2Dqzx3E
	BI/jC+6P6Uw3mBKxANBYAzsVr023S9jq7Pr99BfLSdId0t8yEqSO38LniQ83iwQJhfzFOwPIiIW1+
	+pVbvMy4DQ0pqG87lSb97yIMQTjeO6dzZnWZiRBZKNYm9gPBVCWp2jlHVlVP40lLRd1IXgTA6/SWm
	eNRSg9YB2nw9lej7V9wsVUAA4DanyX9Kpo9EeeaPZq14WBbb5oChFe8bHWHe4h/4LbS5Z+qQQy336
	gD9cZ+Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCP8g-0007nf-JQ; Mon, 23 Sep 2019 14:16:30 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCP76-0004z9-Bb; Mon, 23 Sep 2019 14:14:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id n14so14135076wrw.9;
 Mon, 23 Sep 2019 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l8lFr4ZwIttjBYV2ogrlwO0w9q8AMXRri5mgGEzyZHU=;
 b=hnqKrCN7lLeYsPQiig8wbtkvC3eseac9EPEnUHjq3dHHrYjA6VEsPHo16jRG9yP0W5
 9CIzqMdeKZXuk3XalqUTD8USFPKaxePq2lpYU99VC47YZjROqtz3e6Hrw2aIi96vwqgN
 ShNg51yP6x3AXadrCjQZGBGWjKGhEToZ5hn4VPIKnOXeeqBIbXQQ5+1W6MO9Gjrqch1z
 /fcs4UHaMCZKpDgndKm+JMnkyyOhy/a51+4evmftLHLwY0XimYqjFJH8vXvO3mdwnIri
 59qVfJYPoDsSbCtvmp1KS0f+zAGDXrHeq+Optp+3AjrO9EOcQeeZKmRl6WZAnvru+RhF
 BhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l8lFr4ZwIttjBYV2ogrlwO0w9q8AMXRri5mgGEzyZHU=;
 b=ZVuoLT42v8XxUks4TwT8gVXyUqgJ8bNt2vAyb5FEd1dWNMeXNQWunmNKADHZbccIB+
 HsNghiGIwWNW8lF7fK8SBpjdb9aSgqqmkGybcIY0/DVYsNGoy1MF/YeTBOn8h3PpG31B
 gdctsgRZtCxaGQ7V7UmIicT7/6e0knDjiA7l2gI+TNki1jCVsqkvE20UJz5t2A8FFUda
 E8Eo0AHSr1dpaQlUAjewcc9vcGxjYLNJeJFWHW+3GS96pAGFJ6AiTa0+eWAQMnxK/c0Y
 xuj53QV69dFclvkBYEcnySZcJ5x7qS/OCyQvRP6s1SMP/W/XNBYcXu1f6CeYpyz+JrZG
 w4cA==
X-Gm-Message-State: APjAAAVOMT6+viuXx965Pd1l+I6KaGBa6ez0qKUvSTC4BfIwIukaX2OJ
 ZuuJlTC/4i5fWe4NEoklrk8=
X-Google-Smtp-Source: APXvYqwaiZzlkw+r8pdoD05JXP8R8T9t0jmcqcK9qyqnQjd1fiZ/EgRLvOxtV+9EryA+EgMHDqLC2A==
X-Received: by 2002:adf:a50d:: with SMTP id i13mr15806940wrb.152.1569248091098; 
 Mon, 23 Sep 2019 07:14:51 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm7001700wmb.33.2019.09.23.07.14.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 07:14:50 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: arm: amlogic: Add support for the Ugoos
 AM6
Date: Mon, 23 Sep 2019 18:13:55 +0400
Message-Id: <1569248036-6729-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
References: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_071452_419440_FC25B50F 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
S922X chipset.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd..2ded61d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -139,6 +139,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-n2
+              - ugoos,am6
           - const: amlogic,g12b
 
 ...
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
