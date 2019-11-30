Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0083C432C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CE42075A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QCzTwm8I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnZc9lD8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CE42075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDAebD89QpuhYTnUv6rqMrvB4VYg7DgFIbyPD6LvE4c=; b=QCzTwm8ISk+d5x
	395B+gzzi+qtWgfv1iuAOAQcHUW65Q6n/g2QC/AJ+Xc1+ohaZEnDGWQpA64pokfDzWboEI7mqdMdJ
	xrwwdhFZ8YjG/aXGZvFN//4/KnEndJegkcw3/M4GujDZrXvGQacpyGHEsnvwhk1WjjrhcZt4vuIUr
	zJDHc5y5Rt0zxABk4GzTUwLm/e+u2B4qTdzpQfwSfJ41lTUwpRxTiBoaOhkyqCZi0ixCfiGppv/4m
	tcBJStWj26ptixxL3eK28YTsXErWJVam5D4NmWmlZor6v8c3+1U0r26enEvqKnxt469/9Iv3Uvek+
	c0qPINeG9gYrPoV8bT/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib1Oa-0004oM-Eq; Sat, 30 Nov 2019 11:58:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib1OX-0004n6-F7
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 11:58:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id q10so1967078wrm.11
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ua3UF7OJvvMmYzZQhlb5rwLMVQGrclyM0ANoVUA74bc=;
 b=pnZc9lD8W4KAAKZBNOJY2IugbPFNKnDx2Lpbfg9vy3JN6+6xy0Q5+1K/eyzjycUhnY
 wKfFdstLYJSwLQdvz4FceqUJ5qgyWIkI7dmIkS8BsUxf3IvxA58uB1waH/HaCbB6MReh
 w8Et+bSqbHA4t4Bs9naDO4VM1ig5rNFMQ6o1fDrttxXt+wRLpQsPPgQkgxzeDmKB5sqr
 OiJS5VTaV3mkkHeFsh0taY7leLaTN9ghW+R7bs5GCpRHMjGuVEI/vIAkUWE6depAGon+
 NeF5FJv648GuR7EVxvC1NzbLvtx7hjhjr4jij0r40ZQZO4YcascwLgHoyckn6Y7YU3OP
 WHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ua3UF7OJvvMmYzZQhlb5rwLMVQGrclyM0ANoVUA74bc=;
 b=SK0ZR/G3ASzFG5+B2BkqVxghn9FYUGZqHhQpgOgOtGZh0VX0z7zGX1KVRkX/rbkl3v
 VCJlNtVMYfamb3ENg+jQSFcNWiX5WOyJqcb6PKfduFvQb0rjAb2gjxFo5b5VVzwmHAmZ
 1jGF2MkdPfz681OF6Ge3kdukLmQncHXzshUcuIK9QdndZVNlUZrR6cQVlgth6eKQ5Dgk
 gjznc8XMApbVFucRYefj5s+jaOkHPPEe+4bIAQWwENV5fVNTri21eYLbs3lmDhUudJ/8
 MHMy+L/8z6nHpNIPdxqYoV0/5+pq3G7Jgn2gpIsyD1bzPXoSji/Q7L0Cp7JXOF8D0oB7
 y1UQ==
X-Gm-Message-State: APjAAAUFiBtUK4IxZD37COk/R4fyiq/kxo6RhwOAD+WECKxuN6hr59SJ
 nwrrU7BoMWIsvKJrAZIrDEE=
X-Google-Smtp-Source: APXvYqzlKGqg/jIJyhOhJPSVxWuX3dyaXOX1s2Pmv92grnLa2ou3Ona7DHcgrXvlsFfHZQlOursNqA==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr35160039wrv.259.1575115116011; 
 Sat, 30 Nov 2019 03:58:36 -0800 (PST)
Received: from localhost ([37.238.189.59])
 by smtp.gmail.com with ESMTPSA id b17sm31742286wrp.49.2019.11.30.03.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:58:35 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
Date: Sat, 30 Nov 2019 14:58:23 +0300
Message-Id: <20191130115824.31778-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_035837_502383_93D0CAF2 
X-CRM114-Status: UNSURE (   7.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
(Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fd6fa07c45b8..a6c83d70aa74 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1008,6 +1008,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
--
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
