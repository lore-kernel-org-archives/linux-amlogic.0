Return-Path: <SRS0=MsbO=NA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FA0C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CEF60F93
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89CEF60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dMqj/ejUivP2u0AfyUZgECXuprRNEOSQp1U/H6yl6yI=; b=QCJykHjJC0gOEJ
	VKPyzinP+FoK6V6OD8SwQwPsFV2Q/VrB7yr9yTEe/eq12sJhgKH/uFBfPs0iEjzrqqmIvwXYMV++i
	QE2ca8zAfwXELNXKkAHMn6lGPJTolsb55PIhaNPOKRuh2ROkgwehOtBauq/Cty9XOPfd2NgVS/BIe
	tMjAuWd5boibPF07Adhj+RJeEdN+OWgLRIinYBdrCK9463LDyAr5DuD3GhN99Xs/y+OKoxsIo6V5s
	k74ZkftDCEBR6LC89+3f4sQ2BcXjIjQg/XrEIi7a4TPpNrxNasfq5gTuTsoIqOrqHurrnnh4808De
	3JVOWuXrAbuxnwSPkHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD53e-000heQ-QE; Mon, 09 Aug 2021 13:11:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD53O-000hXl-CV; Mon, 09 Aug 2021 13:10:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so11510421wmd.3; 
 Mon, 09 Aug 2021 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cZUrp6uTd/Kkvpidj7ZIMSC5Va2ewQdQe0yXXZ1QOd0=;
 b=ap5qig/sIIYaJ1dlO7lbcEgWnjV2iEucXRrV4Uw2weUtO/AXH+uP7qod/Yq+U7BQd6
 8JLxhlJPtAfkFcRTkUebCDHXls50GD6k5HPTfDDwfesCUGLbcR1qewIqnHnN1tYa9yP6
 nr1VxN/JVXi7E5IrIJzqNUqUpGXlyyKHlXRh3M8/JUvRxAn4X4n8DyYMIqevEca1jf19
 CAT9miq3nAfWICJz5kalqzD3IPQufkJLaCGZWBWZbNS+Xdh7dC9cAgWPBLI643xYoZKC
 GEpsH3V0OMghQNV1u4Px7BJ8Qqv0Sm9BiDRTHlhy4qf+3ijxsry4ucoe3lftbeAiIzHk
 BS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cZUrp6uTd/Kkvpidj7ZIMSC5Va2ewQdQe0yXXZ1QOd0=;
 b=ltgT48d4Zxrs4RSYUwgEwvrsM6Mb7LXRuQ+h82EeZ54MjBqiVDgpGAEdVqSMzWb8LK
 //nAiTfbILUbG03+EENP3GaK7syCCc1nsL1gOtl4UQkXMZpEjVreFr+fU8ioHvOLIP+k
 Kfk5RrGYMzwhEAIyGMrPqIGL7N0RgqLoecutd5a2C+hY6rjbcBNHktdocJxGUH29rQTn
 hKx7W6zFCKD0x/fFJcQl7ScJkafxf7Bee6N2HkSPgY+72beZ8u3QvSfki8vjZoPDbdTG
 kAingy+U0FH2vOn+YL/3fp3qPFA2sX6bbRsFVeufj/9tFetEDmWhu/3D2F6lwh+JAnlc
 8V4Q==
X-Gm-Message-State: AOAM532NYJIJEqSooYGlEaNI9oZPzqDHb95b8cpqbzgKg4Kgj3YIvPkz
 Hx04jCueGvxlfdGc4sIjMs8=
X-Google-Smtp-Source: ABdhPJyt+NJ6Xheq1q0KhtiDDQt78Ari3v1incgB6zl1F2i87d0VeAoheqDlPjsJP6wNALJ9zdFQ3g==
X-Received: by 2002:a05:600c:41d3:: with SMTP id
 t19mr33729061wmh.157.1628514651801; 
 Mon, 09 Aug 2021 06:10:51 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k12sm5276094wrd.75.2021.08.09.06.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:10:51 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/2] arm64: dts: amlogic: add support for Radxa Zero
Date: Mon,  9 Aug 2021 13:10:45 +0000
Message-Id: <20210809131047.28047-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_061054_457742_6EB33AE9 
X-CRM114-Status: GOOD (  10.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the Radxa Zero SBC. The device-tree is loosely
based upon existing support for SEI510 and U200 (also G12A boards)
and has been developed with the 4/32 board configuration.

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for Radxa Zero
  arm64: dts: amlogic: add support for Radxa Zero

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12a-radxa-zero.dts     | 418 ++++++++++++++++++
 3 files changed, 420 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
