Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9CCC27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oP3DKZXg/+pnc+nQGgGF97QeSZpwZQwX8GwX6CdFQR8=; b=K74FQ2Y9Pnwe4E
	Gcoz1l5VQ38nl7D+FEtuJtBiBus9nQUGraBZAoP7mXfxPO5osufYcDMKXJedFpP3LS2GIW6gkavhc
	9Z79soVPHJv2KGdZQhLVJAFdFj0VXT1PCf5BiTXnDGx72iTkJQUq8Fz+WYwhQ6KPJ/31ifnFMlRmV
	Z2cZnus02rldMquFKHDQc+vWg/0wwFwRdSnO01NiSiI60R1DeWVVQXdi6kqlGL+ZFekNRBhBOMAT/
	WnpL1O7r905uBm2S5NbdaZAikfSuWH1ICX0coPE7AcvmA76ns7YWavtJ24sMm0PX9L01sIXD92BTJ
	Fpz80oqIwRnmK59qtgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaaj-00000004HiA-3l27;
	Mon, 10 Jun 2024 08:41:25 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaac-00000004Hbj-44t7;
	Mon, 10 Jun 2024 08:41:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 068A6FAF0A;
	Mon, 10 Jun 2024 11:41:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1718008876; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=laCP84RUPwmaIblaMPMK69tL2FcMDmuxzvJrD60X/k8=;
	b=bIchdf/q7BDMXH2idoY+0OAhDhWpSb3KcwwiRJ/mjZY+MDx5+DAa/Z26EK16PSO0yS5D5Y
	+jfymK7FpUJy8x3MoQJCnSnuQP8N6foh3vRGNlblNWflmXM6Bdc/YyIYF4DyDB6qkYKJTb
	/2DTLwl9758k08J71y69AEmqxwu3suSP99fLdcC/p5kShJmm6sATjeN/bUCdICXt8AzFjR
	b1phmcmrXw2775Z3WpUezPwTPG/cidIfUlutXKgQTF/A/EtQ3pu1035dmJz2msqkhoPVmv
	uOQn8k7e6nln5cZ6DvJ9wEayzzHvmqieoLt3actzUKgq5TEe6lMCPdKEVJxQWQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: arm: amlogic: amlogic,meson-gx-ao-secure: add secure-monitor property
Date: Mon, 10 Jun 2024 11:39:49 +0300
Message-ID: <20240610084032.3096614-4-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610084032.3096614-1-adeep@lexina.in>
References: <20240610084032.3096614-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_014119_275460_5172E305 
X-CRM114-Status: UNSURE (   7.36  )
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

Add secure-monitor property to schema for meson-gx-socinfo-sm driver.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index 7dff32f373cb..1128a794ec89 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -32,6 +32,10 @@ properties:
   reg:
     maxItems: 1
 
+  secure-monitor:
+    description: phandle to the secure-monitor node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   amlogic,has-chip-id:
     description: |
       A firmware register encodes the SoC type, package and revision
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
