Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57C8C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc1e6XOvqARSqcd13SywTIiEcoDiHCywm5NpqPhZLBY=; b=Wb0UH5DGnY+inL
	Htkk4TzIX2aDWFSha7871RrLuByG410ZTGj/awLZ4vBTZ7glh+LZ6SZKUu9+TDtOl3MvmbA4buyTp
	R5Dt4iBrm+zH0bM82/i7eikH5DVo/GC/fybkfEOnjQtkTWLJEzmKE9MIlUPqRzpNn/D9aD80qCX4q
	BJrD78q5avIl4IInRssY1fBinrQecvUCv0kkSWkR7O6Eq3ufDhXHrINGJig3Fbcy+THZy9huLSUSF
	FDeccaA3fvuluNnlNeQJrA2nleQ3pCwZDRiVXW9VXx9tLwAQlNbUM8rp/ilKX0BXEghA8G7ztFQt+
	GVWZcLtAIdkJ2YPQqGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI1MU-002Ylg-2r; Thu, 10 Feb 2022 04:47:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI1M8-002Ye4-It; Thu, 10 Feb 2022 04:46:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d27so3571588wrb.5;
 Wed, 09 Feb 2022 20:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BjDFuVI1diXeHGjfeYh1Ru7NnwWu54G5DixYVQkN3LQ=;
 b=Z039O/mT3T2FE/qU1t8Mwr/uL4bTki9Z2yPXpwt87ry32y7atrQ6705/ky6xG5tr3T
 AIHWO4lBhEEUNgg6Sav8x4kGpm2ZCARFvSpeFmUC42idac09HfzntAMKDX2krZcvMOO7
 U7MlgFMRNcknC8WoZl46amBd16Ge5+EX8N9qzPHobxVYe2dwikMlFjXq3kss8mJNC4xX
 8BbR+/xkzvxTkexQDc95DMDy7Bm/Qn0Lcf5z8TskpAPKk4i9GMWLYc6+ByyLw3g6SkfW
 Nx9pUNWXgohSfGTsfKwK52T8HpqEUY5NoXSsxELoblqX/+6cVRdYlTfF0J52jBy5jkg1
 gNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BjDFuVI1diXeHGjfeYh1Ru7NnwWu54G5DixYVQkN3LQ=;
 b=y9C3xy4TU2pWOi9mvlSWcRF5DKQd57HrQUGWlzBGgEyPvkB81VWellNIDL8GVg0TvV
 ytNXM/vN4blltodVJK0Iu+a764V4nPdG16dc6L0q3t5KPBuEcXz+5R3FkG4YhqTmAMru
 V9QvQ5hHzfhwE/j0e8RaLnb56BwpmCn5qo2oNQ1TnPqYm/JlprEsNoheQmj3cvjQUZgS
 24xzC2ouJ2VUvWLcVDFLBchuy9+2FsPz/Aqegk7655YNckVKY7SpN3ftV+DZwNY8U8zY
 Q3FU/XZiA0R2YJgBBw3AxWx3q8BYA0zKbdRFSh6klMR5Q4FcWA8owc42Ot9ow/5wX56C
 oW4Q==
X-Gm-Message-State: AOAM533ck1EJOZg3/rRV8IrtOdbXa9DUzvLpXIzYosu4cPsCTkyHCyiA
 YP3duTzF73G3WTvp8mdna/o=
X-Google-Smtp-Source: ABdhPJyfhwJP/OuAqaG/f8JeEci5j9lXhwga9tAVqWh3VfrctxGSoEkAZNw74a62QNHaDsxWat7WWg==
X-Received: by 2002:adf:eec2:: with SMTP id a2mr4583607wrp.557.1644468414830; 
 Wed, 09 Feb 2022 20:46:54 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h17sm323089wmm.15.2022.02.09.20.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:46:54 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add osmc prefix
Date: Thu, 10 Feb 2022 04:46:45 +0000
Message-Id: <20220210044647.14443-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210044647.14443-1-christianshewitt@gmail.com>
References: <20220210044647.14443-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_204656_642835_1FDE0330 
X-CRM114-Status: GOOD (  10.01  )
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

Open Source Media Centre (Sam Nazarko Trading Ltd.) are a manufacturer
of Linux Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 52ff63248892..b97fd8dfe601 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -882,6 +882,8 @@ patternProperties:
     description: Ortus Technology Co., Ltd.
   "^osddisplays,.*":
     description: OSD Displays
+  "^osmc,.*":
+    description: Sam Nazarko Trading Ltd. (Open Source Media Centre)
   "^ouya,.*":
     description: Ouya Inc.
   "^overkiz,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
