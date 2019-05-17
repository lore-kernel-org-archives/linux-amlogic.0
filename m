Return-Path: <SRS0=JomC=TR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8736C04AB4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 15:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C47521744
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 15:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiMEszuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C47521744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gqyHH0bblJkipZFolncTyrKcQWTxWvvJUP7RHjPMgj0=; b=kiMEszuDKTqjJJ
	jX0vZPZ+OVWdRxZEB2vlsI6RucFkE3lltAi3O3vgAfQacoa7p/52YiPahnKMKS2dEt2WfkUxWOVrN
	5WSZN/Lf6YcK6iUwsQ3Kn1LcTqnTHLNhtbSA6zv7ljJdVBC8DW7O8xLDS4YR2nKi6zJVl4ZxPsEIw
	Jr2WhdZ6F2jY+3d6HIt6BEXCID0PGBwyGq1m7lISAhXs/duo/Z36kWoeEum8DGNHxS3YaCNkpI2/5
	htyJVIuQ34f+WU4uAh51dcNrKDzZrFH8JxSd4SRa3QEev3ZvnAtr7HMQnUaG8ZjCGq1fzOly+5jdi
	XmKZ9xebySJXT5RM/KPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRelo-0003zN-PW; Fri, 17 May 2019 15:27:40 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hReld-0003qR-50; Fri, 17 May 2019 15:27:33 +0000
Received: by mail-ot1-f67.google.com with SMTP id r7so7088937otn.6;
 Fri, 17 May 2019 08:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXjo2WzK/l3uzu16XWx7AJkZlf1BIoz+FJUDL45vLwg=;
 b=ZRWBhFIaXh1B2OeA0b1/DD4aDEbisOOSwxVyppPxV32rjN/T82IME/93vCWAK0JgRz
 wz0o7xRWKvGmmmr4t/jOGQcHxEScXpmgezXcyp0k2f8o9RM/oLY5KIxDqrzkq93jdDgs
 siBEAp956rbHstlhjGuyDire86XYb/mhndwEdqa6XUGrxYoNiganxGgjxMwNgtn+0//1
 bxF5KCM+KNuDE8vuIJ/bm0FM0Rth247wntEE3vMOjbjcuUvsiog4hwn9LDonW4D12PvE
 ICs99mgGJbZZWLESWuWf58M48xWrO22iSE5JbepoPe/ryXlY6jBM9Foh4AT3rrbETi6n
 HKRQ==
X-Gm-Message-State: APjAAAW8vCkQaSoNhNh1UgCAkrlaGYpaOnnrj3kgcb8JjcjsUNLS8KdV
 KA+2mECE4wciQWDYoglTug==
X-Google-Smtp-Source: APXvYqzMjh1uN1x7bYZO0lOLW1zGnpUtEQcPyOFHVuAQp9QvmrFCWuPkkhC8UMdrSn6icT5FC87sEw==
X-Received: by 2002:a9d:6856:: with SMTP id c22mr11882936oto.24.1558106845465; 
 Fri, 17 May 2019 08:27:25 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id i13sm2186859otl.27.2019.05.17.08.27.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 17 May 2019 08:27:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: Move 'amlogic,
 meson-gx-ao-secure' binding to its own file
Date: Fri, 17 May 2019 10:27:22 -0500
Message-Id: <20190517152723.28518-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_082731_761164_2087FFB3 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It is best practice to have 1 binding per file, so board level bindings
should be separate for various misc SoC bindings.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
It seems this one fell thru the cracks and didn't get applied.

 .../devicetree/bindings/arm/amlogic.txt       | 29 -------------------
 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ++++++++++++++++++
 2 files changed, 28 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 061f7b98a07f..5f650248b18e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -111,32 +111,3 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,u200" (Meson g12a s905d2)
   - "amediatech,x96-max" (Meson g12a s905x2)
   - "seirobotics,sei510" (Meson g12a s905x2)
-
-Amlogic Meson Firmware registers Interface
-------------------------------------------
-
-The Meson SoCs have a register bank with status and data shared with the
-secure firmware.
-
-Required properties:
- - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
-
-Properties should indentify components of this register interface :
-
-Meson GX SoC Information
-------------------------
-A firmware register encodes the SoC type, package and revision information on
-the Meson GX SoCs.
-If present, the following property should be added :
-
-Optional properties:
-  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
-
-Example
--------
-
-ao-secure@140 {
-	compatible = "amlogic,meson-gx-ao-secure", "syscon";
-	reg = <0x0 0x140 0x0 0x140>;
-	amlogic,has-chip-id;
-};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
new file mode 100644
index 000000000000..c67d9f48fb91
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
@@ -0,0 +1,28 @@
+Amlogic Meson Firmware registers Interface
+------------------------------------------
+
+The Meson SoCs have a register bank with status and data shared with the
+secure firmware.
+
+Required properties:
+ - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
+
+Properties should indentify components of this register interface :
+
+Meson GX SoC Information
+------------------------
+A firmware register encodes the SoC type, package and revision information on
+the Meson GX SoCs.
+If present, the following property should be added :
+
+Optional properties:
+  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
+
+Example
+-------
+
+ao-secure@140 {
+	compatible = "amlogic,meson-gx-ao-secure", "syscon";
+	reg = <0x0 0x140 0x0 0x140>;
+	amlogic,has-chip-id;
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
