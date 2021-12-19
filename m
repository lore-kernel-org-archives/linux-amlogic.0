Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4562C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Dec 2021 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FOmqX3TG/S/9/dQusZXCQ4AM24AUJEj0Vkx4C00x7jM=; b=AxVKSgXbD6m96n
	/nAbGwWEJwblS/sSVENgWQb6xJkjfBUjxl8xvB0nSgcdCsHrERzIqLYzf234xUc1LyuHp4W4XJFkd
	td4G76JtorpQTZeWQaoiZdoExVcvQ6V5gDYq9bFjFWx+YuFFtIHgEW3AVEtdEZLCZNiBZ9xVFkrpw
	SyvqZwOxm80uuyqMx4qz0gjXJlXxQXqzZ1wWltwzk+IAHGemMfMjgnRz3JxZ+pS+XceTIUiJhkC3C
	t9A/yHbggcfugxn+Xlz91WfYdZLhqws5K/axrcJXTA7pXnvA6u9+QvWGXgIZ6MNXfmFUtaL2m4TRv
	dhbCKTYGhju2cissorIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myshx-00FccC-Bu; Sun, 19 Dec 2021 09:42:21 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myshu-00FcbX-6Y
 for linux-amlogic@lists.infradead.org; Sun, 19 Dec 2021 09:42:19 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JGyRn0yDMzQkBg;
 Sun, 19 Dec 2021 10:42:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639906931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JYClmCPmgU22mez6OtiRbEzfn+G531E844dI/UyFy18=;
 b=H8l0gfPD8wmEAfiOoDld7ktbtJ+xKqz2lAyblKqsdG7bPR5ZmwaX8gc2wsAmyx04v8MaxK
 F5OG4xpWUrh3bkK36XxyXmbDCTX5kGbd3LR7pT+EDzzrVWxQnEy7ct2aeLXSzUYJTdUyev
 NPS/pkTEo188RVJLb/a1SVo4iI0MCm6U2dBGsQrGcJ1tDANNOExlU6RuGCYFI1JcJzHHsI
 XBlnuJ9OufK/HH9UC9QnF/faTxkh1B3m6VhgvnVoGk0Pgx1I0nnJGXdOY2uvFF/JzWScm6
 p19qQhxdwnrBcAwFhdYNu/yozF9qE2X7LeYXNDS7kK2GfKKCk9ey9pMfkCglpA==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] dt-bindings: display: meson-vpu: Add missing amlogic,
 canvas property
Date: Sun, 19 Dec 2021 10:41:55 +0100
Message-Id: <20211219094155.177206-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_014218_418279_230FCA92 
X-CRM114-Status: UNSURE (   7.77  )
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

This property was already mentioned in the old textual bindings
amlogic,meson-vpu.txt, but got dropped during conversion.
Adding it back similar to amlogic,gx-vdec.yaml.

Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Changes in v2:
* Do not linebreak Fixes tag
* Make amlogic,canvas mandatory as it was in textual binding already
* Add amlogic,canvas to example

 .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..047fd69e0377 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -78,6 +78,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   power-domains:
     maxItems: 1
     description: phandle to the associated power domain
@@ -106,6 +110,7 @@ required:
   - port@1
   - "#address-cells"
   - "#size-cells"
+  - amlogic,canvas
 
 additionalProperties: false
 
@@ -118,6 +123,7 @@ examples:
         interrupts = <3>;
         #address-cells = <1>;
         #size-cells = <0>;
+        amlogic,canvas = <&canvas>;
 
         /* CVBS VDAC output port */
         port@0 {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
