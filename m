Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC670C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsKhDwfZ+PQNs6mN0So9Thq9bEWuoVBlJeN4M6szkdI=; b=2dBi3jGgvRPvUz
	+bwRX3vOXJkt0nXR7S7IULBISk2zgMAQQ1tY3YLmU0VGybSm9YSbWe8nSVqvXD3XvZEzyxXujPTw4
	dXHiKpYEjNVo8RltH7Bq/FeDWO/5k+EsIFPr+fjXkMDJ1hf6r1ZvNHF4l3Xd6Prz92VZTluZs1ecH
	bcK99qGBROd2ZeX7B/TSqlrKaV7/wYgLbHymw4tMXQ6p/qe4WGGed0w9K9HAhe8O9kRAo0cySrXU6
	ODXvw5mjPs/r2aNMdt7K2N2NsVXXLBzbR96eGE1qDXi/kyRKuA0aEigOXKKpivM6FDlaA4JZzrvwi
	EQA35/MiLuy9KHSTe8zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QQ1-009VLB-OV; Mon, 03 Jan 2022 16:42:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNd-009TtK-CH; Mon, 03 Jan 2022 16:40:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id j6so137890653edw.12;
 Mon, 03 Jan 2022 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q2pienCXnr3sbjoYsVwKnMqiOo690+Zk3T49WvUYDPc=;
 b=eJRD0DBisN7t3pAGm1lnNod3s+twq+23fhijVgFLtr6cJmBvEvdXpFInwQa3pzvhsW
 /vmeCfG1Hkep+8msZUrkh2Yv1HKE8fr2Tm1KeTMuf8hpK1pWJEAX5vK6ZNJXCwsUWIBc
 D2aCBak6QXFCzsINjwmpw5SMB0HPWJhfMFab28PTxV1xFl6kj7bvO2GNsQgqqmcOiv6L
 h/X3hVbCsY0rk/JYxyXXc+7Hbakxa/72tyL4bdmGIw+I7tWAxeYXXe5KGT0CM6r5td+B
 MMQtag/JQ1Un6JzTOF/K/PnZ3wBYD+MPQFytT1QhzwBwud2oRzNET8Sp/gDfB26LUF0a
 soew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q2pienCXnr3sbjoYsVwKnMqiOo690+Zk3T49WvUYDPc=;
 b=LAz36gQuKA/ou9HrtrwCHwhHDyhqLXFhq1qh0uI9M2saRFue6f47HvEj2O70vFVCs6
 HnXLcVMu+mirLWkugzkWWbzOnitDYA3taBvSFv7jP/tjds0f0yN73TLwVg3oAnue8qf0
 t3GAUf7QGVo/y4hcFYy6H48YA+h3WFYed8VQxCNPXKIjtywiN3Sqx4teJDp99kT4qDQd
 CuXF9HI1pUNAjjLg/EZujVq7BaygNt112zYMVz4QtqAMUVY77OsqqLwrO/M0AY2E26xc
 s2XCezgQ12W4KO19zeInRB9mrbFs0+mNMs0OQsjDESEkwU18aiPhZYe8CeTMgvRBlwWf
 jqvw==
X-Gm-Message-State: AOAM530b67+3CJIuon1InsceQCJMdVQG+8+S8Uuz5MEj1w0+o8XdU8BU
 82A45Y73WqqCklcEoH6iNHjaT80kaHpT3I0d
X-Google-Smtp-Source: ABdhPJzVOoXMXBvkqwiDrDSWsZKsxFjSa4a7Xmk9FjrF1EiMgHNhCKVMsNGs0VY4v3wi2hnM6ulxYQ==
X-Received: by 2002:a17:907:1614:: with SMTP id
 hb20mr39448769ejc.606.1641228016213; 
 Mon, 03 Jan 2022 08:40:16 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:16 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 7/9] dt-bindings: vendor-prefixes: add haochuangyi prefix
Date: Mon,  3 Jan 2022 16:39:54 +0000
Message-Id: <20220103163956.6581-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220103163956.6581-1-christianshewitt@gmail.com>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084017_457107_2A6351F8 
X-CRM114-Status: UNSURE (   9.16  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shenzhen Haochuangyi Technology Co.,Ltd are a manufacturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c9202a101d71..f4160ee3b5df 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -485,6 +485,8 @@ patternProperties:
     deprecated: true
   "^hannstar,.*":
     description: HannStar Display Corporation
+  "^haochuangyi,.*":
+    description: Shenzhen Haochuangyi Technology Co.,Ltd
   "^haoyu,.*":
     description: Haoyu Microelectronic Co. Ltd.
   "^hardkernel,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
