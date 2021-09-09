Return-Path: <SRS0=iK0Q=N7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEC9C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71C6610A3
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E71C6610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QBbj65XhibOz5CNRKf617FCjV3sIBM3xKk5DjpN2Ro=; b=PaTR+vPjESDPlA
	dVLPwDkKfTjrQwgEXKlZO5kFiksOyo9WFc945QQNZA1fbtlaBUmt+XPqy6+5dRNJ6gsV6s3XwfSHB
	ltYlBP9vZcw6p7xJcQFd4JjrJH8JAUJzW43heeOHhXvI5vjRjtmWiLYLxWOt0zxB9nZIJYd565IlX
	SwGv5ZM/OkMkE1pDuzboIx5JtXlWb3ni6cLAqeHtNWKxksAZH4D8i7asBGthPjL8STXquui/yRsJ4
	PUwewWqW+h/boVA6GrMDLSAv2G/KFCaFpqhzuPiS2+s8X/9mM24TZ3gBSIh7QLf/rCRxJ71L14iEe
	+IGIjNJpk8JCdZmrLXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOHCL-008skj-Fa; Thu, 09 Sep 2021 10:22:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOHBz-008sgc-2U; Thu, 09 Sep 2021 10:22:04 +0000
Received: by mail-ej1-x62c.google.com with SMTP id me10so2516099ejb.11;
 Thu, 09 Sep 2021 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0xyIdAQXpt15dqFf4oidmqP73PkrOKqqTxCZ753cua8=;
 b=HWWn7V+Ds7mTBd9Fuup9yn1K8icWORPtppmu+kTkuY3q5GYZogWPb8HXK6x/3nDVB8
 2qSSTgkZHd0bKxKUZ2wNJvZOmmEnnK6oyCyYO6+Lf3xE02WjyIsov0GQaxIwwALwAQwZ
 CofM2K9GQf2A65DIhrk6WHtIWNu6Y4PnT+0mWasJKz1VHAAQCuioehXtYIeAzweB/c84
 4GC3kjcZfOXhfgTwB7pRyHMob3jqu8mjgsPiiZZbiCCrG6Oqf0JDUb9u6fLEcnc5mG6E
 jR9MkmwCtLTYbJVCd0Gl5GeCMnP/yCCp5Ayj//497wloS2HUNVrzmoc7Bxoqpk9an0ii
 metg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0xyIdAQXpt15dqFf4oidmqP73PkrOKqqTxCZ753cua8=;
 b=oDIH64k8agmSx9oFukiDyrfrq8xJm1e1Yj1XbNys4hWZPBDOYqJO+PJVEIEnS+wJC7
 ZJVozEf3lUC3ZkMuz+hDD2WX4lt/UvN5AfI8i3WKXezav5oIh5L8slmvqB9fWEh9oy/W
 drgyhf3brwuIkYhyZolIllEdaPLN82xQOf/e4gMnVwug/D28Nroz9gcemnkojLOc5Fpk
 dK9HpWIIiv6J9KzOJVGW47FTPRwLc22b95OwnpBJd0WTw70ASUf9Av5KdkgoDMAQTjt8
 sR+6xVuKP0MsU8tVDBoTYyb7x7pGRugDFI/CgPnZv5MmMon68MMZ1jWfQuFfk+7eTz3+
 wZ1g==
X-Gm-Message-State: AOAM531SnD0J6EbHq/3x+6s+IFw8onUHR/BgYhOs998TcyGUt1S5/XGV
 DlQqQHLcVMhNH2uj0K3MIDY=
X-Google-Smtp-Source: ABdhPJwL1ZcoT7+mQ71+IJDlqha5cYDsHkN8c+wOVH6ni9Hx1rzRJd9D70BUMHjmaGHupd5tkkSy3g==
X-Received: by 2002:a17:906:1497:: with SMTP id
 x23mr2605234ejc.243.1631182921697; 
 Thu, 09 Sep 2021 03:22:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id cn16sm808571edb.87.2021.09.09.03.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:22:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for Radxa Zero
Date: Thu,  9 Sep 2021 10:21:53 +0000
Message-Id: <20210909102154.22710-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909102154.22710-1-christianshewitt@gmail.com>
References: <20210909102154.22710-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_032203_176145_9C3D7571 
X-CRM114-Status: GOOD (  10.90  )
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

Radxa Zero is a small form-factor SBC with an Amlogic S905Y2 chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..67dccdd9a5a4 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -141,6 +141,7 @@ properties:
           - enum:
               - amediatech,x96-max
               - amlogic,u200
+              - radxa,zero
               - seirobotics,sei510
           - const: amlogic,g12a
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
