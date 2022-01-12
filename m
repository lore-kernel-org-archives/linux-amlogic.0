Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB6CC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/sMYyD3oRpB0eRbAIOwr1+uP6/5gBPSjQJw84otMQ4=; b=ynb+HOkaEPKmbC
	1TtQvFNuklarJhT4EoAeubrKv0rPAfaSG4YnIG53VfMmyfHAYXaXUP8JUUYX8WTuE2KadSKcA2DDF
	R74/x2fCt2G17QbtM2lahKm2+zT99inJ/Tdfec/ClhDUrIlccd5i7qDL8FmcbkLxdmNI431oL1ymq
	VE/YzjKCfqDHELFFfrli6cb1tmT5CGjMrxP/d272++/LWtO80Y8nwyoBekrYWK4oh8fYXr2tid7Z0
	h6pXIvapFdaHMzBVxffrwMp9JM7oL2CiM2Mrtvhxee2iyc1lDNiJi91y7CbKC3WMY6H/Rq6/e44Hd
	qh6HTntrl+1QvUcf+uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TNv-000rYt-JQ; Wed, 12 Jan 2022 02:29:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMH-000qU9-B2; Wed, 12 Jan 2022 02:27:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id m4so3851540edb.10;
 Tue, 11 Jan 2022 18:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p4Yz6c1pIbz2ITxrOQWOyCbFEZFiExtqlrCSzsvDykI=;
 b=jFGkkGvU3vMoX2ia3rMRTS4doL0Qt0ToHGmDo2JwlRE76ziKyo39vJOg7EuagAZCoe
 tj/UQaBfnS6nmKeCqDExxEeCyppUihNZIZhp0tyo9NEBE74RAgqxe0zWdGZvUsFUM4ij
 RZ8phFAmbGKMo+Fl9S5ofe6QdZ5RHBv3HwDLz6Dfk8nho2ysFdeP1d+9RNo9aOZRbp0I
 oMBF9aM6yOIcofychgEerXj1xpojuYovo2mwyhe1CxVNGQ3VMkbGqdkmW3U5JkzxD4Db
 ogvr42XUOeBeOjVO4Bi4WRkz3nPzqOyxI8bAjTlKSp1O+3Y72zjH6CW/L3ybucgH4R7T
 HNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p4Yz6c1pIbz2ITxrOQWOyCbFEZFiExtqlrCSzsvDykI=;
 b=eJ7hq+nacUtXEMB5b75K4rxtq8x8fnEnBLxnfGuzQqx0enn2J0ScT8gcvD6UR+nlzU
 B1hPTke0vb3YTUI18DpaudxQBHegZfVTWgdFCN0L0DjbkT9nq3c1JNFRQGTZOvu6/Gpo
 JSAnMMRp7IHXmp5m5bBdQHydZJu54R05nI+JSgazBm7iUwAuRuJA5iFitb6GIEJRq3zx
 kgMw35h0/TxgDpMWCmrhgLMAJTo4n4G+vkp17pJzaS4X7GGWQI1lkPUbvTjLhari6GsF
 7lgJKSE1BopgddqJiBoXmgl8qiOIZo7D912iQx89mIKfFhqpGxVW3kZGy5KPqtYnOxoA
 V0Tg==
X-Gm-Message-State: AOAM5338mON2Rnn3kWxpxpOysDcV9EVFx8Gmgdwg9CojkGIsqIJkNsrx
 kF4DSjy+XTcwvHvept9Q634=
X-Google-Smtp-Source: ABdhPJxdAUzgdsO6UE239RlE2EgbxKkod+kdCZ38wpzRWkng0GrWEM2NOlvoYT8/keZAJQPqU5Cl4Q==
X-Received: by 2002:a05:6402:14f:: with SMTP id
 s15mr6940230edu.118.1641954447532; 
 Tue, 11 Jan 2022 18:27:27 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:27 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 4/9] dt-bindings: vendor-prefixes: add cyx prefix
Date: Wed, 12 Jan 2022 02:27:08 +0000
Message-Id: <20220112022713.25962-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182729_418270_A09EB025 
X-CRM114-Status: GOOD (  10.04  )
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

Shenzhen CYX Industrial Co., Ltd are a manufacturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eb8ab0d82198..c9202a101d71 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -281,6 +281,8 @@ patternProperties:
     description: CUI Devices
   "^cypress,.*":
     description: Cypress Semiconductor Corporation
+  "^cyx,.*":
+    description: Shenzhen CYX Industrial Co., Ltd
   "^cznic,.*":
     description: CZ.NIC, z.s.p.o.
   "^dallas,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
