Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB08C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C3F61A1B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8C3F61A1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YFjNHvjkw0ljTP4ykX896pnKhkeYJojLnhUNiJtz4co=; b=GB4Et8klAvLTDzL1oS8Lll0hO
	NUwucwEpSG6RD0olNzkKilFc5u2HJjcA10xA8ojP96CwZIkIVDVB0dM5UhpXFvH/vJNaRDBjBC3Id
	OPOZTxIbHYrw9pMFmTQKFcgNnqgJQXGb7m6kQFw9hcwoz1vOYu6m3jLBOQSMFigFNac9YA7DnJLlI
	pZl1j0OkUd13mcCCZdv/aGaPzHCt8xmYmTuKCfGHhp7QPbLMvUbCmIqiBSRW2B2t2AAS9yctloX9J
	LakoVVN7GE/6oMOixrIAGUjYeIHkZeX9kvzCr61b2GXM6UQwU5+b+GILnlNponi5xJqsgGV9hlm2l
	Q9Lj6W2BA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPKJ-001PjN-5W; Thu, 25 Mar 2021 12:43:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPK1-001PeN-7a; Thu, 25 Mar 2021 12:42:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so2682433pjb.0; 
 Thu, 25 Mar 2021 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0bt+yFJbuDlDnqVqGjm/70yTbKSPm5K8BlbdmF89ZI=;
 b=StNfHAFGoHxehkGTqooGf8klr1qXp2gc8gFROjg0dDKsDwDXEq2ua5tmqrdNsZJALz
 TJc0kJNAEYMKA2+hZhwd2xF/GlF+1f7IjsnArRkS4x8Tf01vHDSoG/bMqGVnfoAFmHn8
 mYYADs0eDO6cW7iRblKj7G9UD4rQFG9G1HrVWD35njpigEEb3j7dL5E0d26OVoKJsL6j
 ElH6zAdaDF5eI9/Dh1616fXe0sJ7x9zNlwlLKDpMR2SKrCjoMXtJ5MF0q+nxoFfpVtjz
 yK8VB+NH1DApwOOpfAxzSBujmKSguVQP1BC3mVtJDxoPDOYe1CKBS6B/AMlnhVhBxuuh
 mIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0bt+yFJbuDlDnqVqGjm/70yTbKSPm5K8BlbdmF89ZI=;
 b=DvvCXrhL8Y8RmrZLTUniPjGdh1TeNRpL616Tp9xf5uJu4wHQ8cHPr1Z7/Gsyi+/PKb
 upILKjNjGXxoAbkj1NnrfyL8iyIu8RywboEO20EHiFxt/AwMx613L6b9Q1huC03JRkmn
 yf5f7h/fRksRSzi7o+RQqfy23G/82SzAX2O+naDvn6PLTTCUEKrF6j7KEC9KFfpHia5z
 J7RCjVZvASVD3fgaQQN8DOyS6sOzU1DbBUGhqXpw1P0Q3MgADYaGA6e3UXfyV1K9T4//
 MkT2W/EbMdgGgK/EoVmqsLioZvGppk2xmmHigKcvwNhTb+yIk4pB0B4Lpe+ovSfcdQsu
 JQxg==
X-Gm-Message-State: AOAM530oegfAKFU/D66y79E6RIFNqaN7XO20lcfUyltYKNS98mgbmEQS
 fzz39Zn/44OI2ygWbfvOVAM=
X-Google-Smtp-Source: ABdhPJxhXEzpQ0Nlk3nozlLLPS01ADiVLHi5cqf7bEE00gMKLwqesBcpjuXtE550YOp602+/E+RypA==
X-Received: by 2002:a17:90a:c096:: with SMTP id
 o22mr8729145pjs.119.1616676163922; 
 Thu, 25 Mar 2021 05:42:43 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:42:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
Date: Thu, 25 Mar 2021 12:42:20 +0000
Message-Id: <20210325124225.2760-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124246_059154_61352BE0 
X-CRM114-Status: GOOD (  13.99  )
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

Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
by the device tree to initialize the mdio phy.

As per the of_mdio below 2 are valid compatible string
	"ethernet-phy-ieee802.3-c22"
	"ethernet-phy-ieee802.3-c45"

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 2766fe45bb98..cfc7909d3e56 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -33,7 +33,7 @@ properties:
         description: PHYs that implement IEEE802.3 clause 22
       - const: ethernet-phy-ieee802.3-c45
         description: PHYs that implement IEEE802.3 clause 45
-      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
+      - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"
         description:
           If the PHY reports an incorrect ID (or none at all) then the
           compatible list may contain an entry with the correct PHY ID
@@ -44,10 +44,10 @@ properties:
           this is the chip vendor OUI bits 19:24, followed by 10
           bits of a vendor specific ID.
       - items:
-          - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
+          - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"
           - const: ethernet-phy-ieee802.3-c22
       - items:
-          - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
+          - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"
           - const: ethernet-phy-ieee802.3-c45
 
   reg:
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
