Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F28CC3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F30C2133F
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y5SfT2/O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/jXSBzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F30C2133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rucMUw/s14codDw/JSe9gQAQlY3Rolxpr0lM0kUkqqs=; b=Y5SfT2/Ohtr7hEszZ6SMCzGdLu
	FSIZV96lLC6Sbx5gsbdaXCcwnYvXmSPkKONNna4GMJKfLt0OtUl4k3wYN4oHRztlH+LDk9P8HQI3d
	xHkrc32kfalGwTusU3eVrYh7q3nRNlKHBxWCiE8LKSaEyid4KnxDhfW0n3mFOh3ozxStobXrug56G
	j1ozmE95r17bnj9Yl+PV4xQRxC/CGmOLtlcrO1brt0G10m5QXk8lN48ybcFjkO4kUNMxhDIbkk+SP
	GGuCzdpUDaW1jpVDA2i3NEY1ZGdnpqnTngUcCllTHRV1rwfflww9FOX+XtawV1s05tYeJFVSsm+DT
	eSbjojyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1R3i-0002tW-UM; Sat, 24 Aug 2019 08:06:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1R2p-0001em-FN; Sat, 24 Aug 2019 08:05:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id d16so11154036wme.2;
 Sat, 24 Aug 2019 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K+60LdlbCqtJ4syN92vvJCUvdUjv+hUfRrAAbnZIgK8=;
 b=Z/jXSBzzIBPfUtpD4JBH8pFN8MtUbg/4iBP50Ys4wRovpm0EmEJs8CQX0rhqf3FvI0
 suE5+eOnJ/SEnzSAQNI0W5CEFY0mcsbt+0uVBgyKJiQTB0GnUDqiCFeqixeMJVdOwEhX
 GXv/HV7a0meXqKCUCy8KKoKtAQTo+nvZSCfRtX3ImVX+pWuNd69H1MXJ7n+AzUz/K5R6
 b9kQjTA+A+58A+MHLlt+QoDS8FWYfXl6cPY0lWHENJxPQYhT8uDu/2kT6AXq+1WI98L9
 SzrNeuXXy7Hgfi99DULmb6qxNGn1ruM9sVVtoV54kKwNYnb7UiUXEmVGOmZEN/v6YFOy
 CbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K+60LdlbCqtJ4syN92vvJCUvdUjv+hUfRrAAbnZIgK8=;
 b=klk9IyvuUXA6+ZbQtJiQFchxRwl8HZfY8V6Psw3h5LTKM6ySbvAhvmYv0aD5FBNode
 5r+Ya9igtoK97fDLL3Olgzi8bgNLXg1A7s5yl88al7cBgz40S2mXymQz/JJnSj9rDB+K
 a68hDflcgxXAiMu11B14WFh7viXTR4VHysJ0QB23aFE9hniiPvjAxnZozMGLwTtR6WtB
 qN8K7SInFzy2wsgBhXauhdapsr5InE5CROIsezS8daiJA648iicQxM+QO5gEp/mVrdOC
 ArQ5yv7LGrv4poWpVue5+zXfDM0SYQnnQNMMytiLsi1T/jKuGwMQc7rOL3gWTTeoGo4s
 /0Gg==
X-Gm-Message-State: APjAAAWr0bjqOiwMtdQeKpDWsG8XHJyJ/W6RobnANT/I7QXANydOSJvL
 a+L2XC5PMZtkIX/lrViPCr8=
X-Google-Smtp-Source: APXvYqwtfEgzay9VkCqtIBWQdafyJCktisSy5n/2gTrK3Jp2Nunb1lIPkWrquChZMkOnteVH4OLQKQ==
X-Received: by 2002:a05:600c:254e:: with SMTP id
 e14mr10259290wma.150.1566633905944; 
 Sat, 24 Aug 2019 01:05:05 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id w8sm16615656wmc.1.2019.08.24.01.05.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 01:05:05 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2,
 2/3] dt-bindings: arm: amlogic: Add support for the Ugoos AM6
Date: Sat, 24 Aug 2019 12:04:09 +0400
Message-Id: <1566633850-9421-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_010507_966843_BF7E9B46 
X-CRM114-Status: GOOD (  10.92  )
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

The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
S922X chipset.

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
