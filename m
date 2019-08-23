Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10030C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 13:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50DE21848
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 13:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tz8wdMMZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDjAJEJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50DE21848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c/q52I/zMRIcTtwaLAPvg/UV+y2DlKU8CKwhmI9vMh0=; b=Tz8wdMMZLkLRD0Cu+gUPQGLqOo
	VLYk2Dkvnq/5fX0NIOKG32FO8Jg7vle0WidC6IewP8YkF5pIIMZa0lLLvnVK6a7TyArUDhp69iru4
	EKPLAOC8C8mCn0Aod8j6P+LRDA0m5j4oMoWXx9jnr0cPG58mkgBe9ihamXQ0TZs79QAkat+sYHF3N
	WAsDMqRBMNBVkLrIqIiLB6aVFa/XIXWUCww/VWSdDvH+yPerif6H67p7vl4QsF2hjoVLwIbc8Kz7D
	b66y53kiwrcuP+93nMykFJ+WPaAPa4bVUMGFQVSRwsz6yVOVfK8wdCoxO8TD2mettphOHU0stTGEx
	eqR+lGgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i19KK-0005Yo-VN; Fri, 23 Aug 2019 13:10:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i19Js-00053P-Rn; Fri, 23 Aug 2019 13:09:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id u16so8613798wrr.0;
 Fri, 23 Aug 2019 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8VCD60Jb/+pjJ/5tE2H1gE1kn+YA9VqYcdsUMqOXSco=;
 b=QDjAJEJq6ZcVuSHwU+MBKVsJ+39TQfO5zpnFhyxxytBqnvyL4EtFjYELT9Xf7dCXK5
 5YDBt6H932I+KJgHm0IVNRDSmsC1CnhEt1bf7nJxDgz2DuYJK3EC5xTVUhgZEEmrSaSE
 lkjrPV8lAUp15Kx63HaUvBsveFSORtXGfqlyfxLsxQtpSvDPq5sV41wlKFDz573i6Ka4
 me3obmuVQ6ad/KqBaS/XfDgJ4m5iX/ar6XUszx5NQBeA8FtkODNYJodgCsqKQiv6VAmN
 ZtwFTeLHVRVLtuKlvzluRoLkI7pOPKbBwPvPF09w3fQVMGwGLMahnkYMOfIYYWgaAqUV
 i1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8VCD60Jb/+pjJ/5tE2H1gE1kn+YA9VqYcdsUMqOXSco=;
 b=eVNYowULBFYg0EuO5zUfcZzh2BWpr3Cp3Og5pC673H/RI7Mjo3zhuI5JIh+Mxi4fBP
 k/rSbnCIg9GFVwbhuowzNCMUi809MubWz+ajPBvScUWrI0HDcW/Z7zzm6t25cUa7wZq3
 Jf5fWFLfkNG9y1BoOZP8hXjGSdWak6f0qEBe4Ok+1YeWS2EAJ3TCVbjoUwGP0KmLhI6b
 v95ZFZR+XqAg9koUL5MagnASFzB5tKeUiqqWBO+0LQGp7a0rnbs/0zbYZr+4sQNiQgzt
 gDZLA2waXIrG0eEUYHk8rB6Doei+AS9kkQ2xf6eWFpxV5ULvOxqEHYpPZCHGD11DCxAa
 2HUQ==
X-Gm-Message-State: APjAAAXPbqkMkczmm8meVBb5f/PMohIIo2L2xWq0Ynpjfyn27drfRr0h
 X4BQ5DbWT1bttJq/n6glhSM=
X-Google-Smtp-Source: APXvYqxeasfLg6QmAfYNd5CxvNxF5CTrTfQn9CMhycqaL9NZ/B1NdtGXp9v0usy0mUSJePpK3pFTXA==
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr5151794wrq.208.1566565771240; 
 Fri, 23 Aug 2019 06:09:31 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id m7sm4359854wmi.18.2019.08.23.06.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 23 Aug 2019 06:09:30 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Fri, 23 Aug 2019 17:08:35 +0400
Message-Id: <1566565717-5182-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566565717-5182-1-git-send-email-christianshewitt@gmail.com>
References: <1566565717-5182-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_060932_897347_C41D5BD4 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ugoos Industrial Co., Ltd. are a manufacturer of ARM based TV Boxes,
Dongles, Digital Signage and Advertisement Solutions [0].

[0] (https://ugoos.com)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..d962be9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -965,6 +965,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ugoos,.*":
+    description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
