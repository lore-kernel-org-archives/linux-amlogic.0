Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4F3C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307F920835
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYyN0Mh4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rqy21PON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307F920835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7XNDYK9ttRZCRXp7BXuJEKts5ugIDdVtEA9SJ7mR/CQ=; b=LYyN0Mh4L7eg7IgfbG35B16W3q
	/e0YQUrviIikrdsGb9uE/f5ym3N1zqOgeCX6Lf2c4+lUvCLGAE3II0kuE2+AKc3wizx4g0yeU2dIh
	Qoyz3oP0N4MV+irml9PabljsCHS6UKRNfXZXEtY1jJVp9w3zL8jNM/4rJLTQc6VzcdxPJDP4xhMsx
	B00LYKq/IeOkyccrfMf4vgubEn3ll+yQ17bS/YIMFFLlYPxNfKvPrHuDMd6sUc5sv7txjkISGo8rv
	FjLhJtiy+OzjaV8IbwYJjIYr/uvbBh5AHMhs/m2ziE6Rq8zygAQy6KDryFRbZ6X0L1DCRHWNCwH8a
	FaPJ9PPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCOtH-0000Tm-Va; Mon, 23 Sep 2019 14:00:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCOre-00067U-Pi; Mon, 23 Sep 2019 13:58:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id p7so10104566wmp.4;
 Mon, 23 Sep 2019 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l8lFr4ZwIttjBYV2ogrlwO0w9q8AMXRri5mgGEzyZHU=;
 b=Rqy21PONemEQUYOliMIMP9uYFwq0imIihVq9/skI9LRVxxWKwvCJ43YdqRhXiERWWV
 9jI2aDo3bEZhIP+UhpkumhfZLsAj1oeW8fLRAPlAe5b8Oni5j9IQrCROoEtKw0+bekt0
 9MowP0kBmNB4n2FUBxIke2JdzLkiTWtM/zVnPb6lrDykCQEuAlRK9JwDCOYZeVAdzhMJ
 RRc/2Pce+SFtCOzKlEQd1WcAsJETaowxiAvI4/WFvVXhCaeKZc9yJjoklVAmEG2x4zew
 u8i41FzYeYbWUShUzqrRUgL8Y15OvgBwWL7UR6qO5FnQlrAkxyznYRKu6vLoFIBIbbfL
 ueaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l8lFr4ZwIttjBYV2ogrlwO0w9q8AMXRri5mgGEzyZHU=;
 b=ZtYX3bOcPrbnpERJ1oSmXOEDIMil8ZkdLctaqBfxABtjZ75/GC/wz7nqAeJnfDqbVc
 snyqNQCsPvMhhMcE+V/13WnlVjqBbLA8pgySdcxVmtj7P/2NnvNE/ZVGQw8aRLuX4U8M
 VTDATDIDmYcRHkrM9fj2EAo0EzVWL+nsfuGp+MGYA9n4wo1U6+5hwDrqFA60yshiRRrI
 H0X3AiXNejyLHrKOccE3YhJWL1KUPJ8NfNiBvPY7jqVwqn8/Ysmv1XGjUjh8ZGQK7aLl
 hOfPJJXERkUD5uKCdTCMvKD+Y1P6AeRgXwaPVW4OSS1KLruJftQIE3Vd1xMsMMS7tPcn
 CaPQ==
X-Gm-Message-State: APjAAAWL8mzA8QQ0pvvZHsu53HcxZ3coST2BLlltHpub//ixxKdthRa6
 2gAMtsm5JhHflFfZXQLrXKU=
X-Google-Smtp-Source: APXvYqyNZQ+NFxGJlIuTy9GGMXbzRUrp+BtFMLg/fjKVcqPQfcSleY5YFbiX1ptOjnoNXfne+DYefw==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr13937510wma.6.1569247133526;
 Mon, 23 Sep 2019 06:58:53 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm25266184wme.6.2019.09.23.06.58.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 06:58:53 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: Add support for the Ugoos
 AM6
Date: Mon, 23 Sep 2019 17:57:56 +0400
Message-Id: <1569247077-5212-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569247077-5212-1-git-send-email-christianshewitt@gmail.com>
References: <1569247077-5212-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_065854_867644_5AAC4839 
X-CRM114-Status: GOOD (  10.64  )
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
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
S922X chipset.

Acked-by: Rob Herring <robh@kernel.org>
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
