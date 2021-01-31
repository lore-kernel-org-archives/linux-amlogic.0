Return-Path: <SRS0=NBQ5=HC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7FFC433E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BA064DD6
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59BA064DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzYeQ7meK3Q5fzDHkQ1o4wPgVbHsO8kA9SmQFVA97Ac=; b=izDfAVMi4RnN8qaK28wpW/zTzk
	3a/S6QMJW53E53D8+DH9Bkf9NUMNkJaT1/rb861hcnv0rHpSqdqcqJVvyaAc6R6RbZtd4R73xNWmG
	JTAHF2e05gQJnChQiliHxsOo+cl46zltwinJk4yusDGBCkghkb18RE9UM75UuXy2DG+/mSUlESt8p
	L6MJtPzbGMujX0Erl9zmDrU9NvNxJpzwOWgeZPnIIb+ugt2g9efd9avLrCeu3z0zGXJI/KEGvK/y3
	9FH5yXu5Vmw739Y6pKVk3cZkJRikRLiSjGTTrKWHYWnDcqdxasxnFJ2W6xADx4GsSQuGNdghfrcXq
	NfmtxLQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l65gt-0006F9-VG; Sun, 31 Jan 2021 05:54:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l65gb-0006B4-Rz; Sun, 31 Jan 2021 05:54:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id m2so9892451wmm.1;
 Sat, 30 Jan 2021 21:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=ECjYqOsB+yrIwbGLgOp+Kcyz4GS7vXGyNHkTT0dl3f0kyBGEAVK3Z1bJ2ZGAXrIYm3
 fLcO7VP4mLQAzpBwOADr0LbD1XZwWgY1wdf0xHAp9xUR9WIiQtYRnyvarHWgPgYg2WRc
 8g7zxHJDP/ZN07rH3Pas+51uA5dEuFiPVISukJKzXFYj4Lo20mOW9OMDTvXLrmpZRzQ5
 QAE4TPOddEFyWJUYCuaQKcMMxpq3P4qjhWe+Wz+tMpl1jQjpqrESKtgRqBPAQLd29hun
 xlCCcj0L3nkySy0f+UzvW2z+M8R1bE+m1YRRwtOdmt36hCYOTL/qVa/i54qntWO2wI7F
 Kx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QAsVvG9i6Xg0y3Z1EJ3mhfNvPnvT0DDgRmi3UPHJgto=;
 b=BOPDYDKcL3N2B2sFkPapD5itb7UxB3kc9UtrRLwtPR6GCpiDChcRcAQd7wTkk+gR2w
 xkR+fdp2EQGQv5rNWQDva9rjvqy7cZy1eMkgaO8JktyVfhY/a5SPci0VozH4YbP+cON9
 PqlevA1acJH2BBSQURef7AZJwJzlcndLf1SmxEUzBGNibJNbIWQSl+TBI12jbSLVC5LE
 T8mVlrRDJQfZM6AoU8yh5WO7amxSCRMQ1lZEguJti363tpgLPlf8aOZHCC4ozO43hhy+
 s1h+Oyj2R6+YQsDuSqdHnqKWSwkYKguzBjomZ/XQ4eU+5LU1XLXjr/+PpWkNKSxQc7iQ
 HxQw==
X-Gm-Message-State: AOAM533JxilOJeZOGX7HmttTPHOs32K07iGu7x94CtoheAMRvR3KK4H1
 TQLJ/xHFs2S6KwQtnOzc9P0=
X-Google-Smtp-Source: ABdhPJwWXbPh9fkyuGb93DRW28LPJu935ZFMYZYyUs6colIcWMqtGClGI1egUBBOQ+8/GL2wV0Gn8Q==
X-Received: by 2002:a7b:c355:: with SMTP id l21mr10148876wmj.61.1612072452678; 
 Sat, 30 Jan 2021 21:54:12 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c9sm20056589wrw.76.2021.01.30.21.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:54:12 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: arm: amlogic: add ODROID-HC4 bindings
Date: Sun, 31 Jan 2021 05:53:57 +0000
Message-Id: <20210131055358.21293-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210131055358.21293-1-christianshewitt@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_005414_307686_4BED3ABC 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the ODROID-HC4 device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b21ba8ba23dd..5f6769bf45bd 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -165,6 +165,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-c4
+              - hardkernel,odroid-hc4
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
