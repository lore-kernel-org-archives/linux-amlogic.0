Return-Path: <SRS0=HjQf=GF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE4AC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2142075F
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2142075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9n5UqQWyKG1EkfXZ+V1mnKqfwDR/CyxTWZcdqifrLA=; b=gIDnZ80Xg2EH2X0uuEwr9LeDm
	nAGS3DCJBaATlleZU9fVfdnn8uIK9Q+d0FUe/xtPxgBdM4vyiwdQZcMCWbGDsLJDnmclWQHlRlA1y
	C+Ce/rxhYwJBiz9w94bXYDylY0QyfUpUmBx0uokxjFz4AlmBuOFrIZil7kCFqMGpWe9IZ/+6zqyON
	3ue9VLPChGMEKPQarGWXnpD23+SvdUQ+Ahnw79UZXBJpDvXeCeyTvlTWML522ULFe3WX/WetL9DJL
	WXCo+mZpghXapl4a/7YbkCSpzV0ntpOLx+jr0RyRv4TzBczUMMkptGj26EPivUCFT+LP1EPTW0ULt
	6diAWBEwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvnzc-0002vm-CL; Sat, 02 Jan 2021 20:59:20 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvnza-0002uP-3e; Sat, 02 Jan 2021 20:59:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id y24so22944588edt.10;
 Sat, 02 Jan 2021 12:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
 b=nTzXSsLMgjBkPOAji4+eKD2k58N7k6whoOZN/Tj/TQWrTcRDD4obYaEI30ntGHCnNO
 0W1mCPQYL8N0tDfY0DwySC1trF4Sf+Q3kAa0C5rWnWOHs65XBuOjz94R7I0i9wOdNxHL
 9FbZAttDo2a9kydgIuTwxQn8IXb5Be2HkAqfeiB9sFYXw003GpRKmGJ5ZouXAFJ1VWDk
 LlMnw98aZ1AY/cLqbh15fYBYTPgVnmPL6VHuTRsjdvnRHaqW8YTkPdZ6p0pEZBusRKFV
 Zt5pbHgIMX7IkkDk6FAXBaqEdo5tGK0i+Gxfws85YUdlj9ueFF1WcXxfu2sFYQkZLqAv
 kRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
 b=tk7xb2EGeVQrPEKA7UOogdcMsJgEcthRSKupQqedb4HJ+Wz+ZMQz30Flzz4OuKolrv
 VW/r+DdRNoKzi3F/l0zFqmzBuDzWDzckftN0iuKIoNOEN3ca0On/NZCHiA412aa74BQr
 LrNroEE3EIzL0ABpV06Jo4VpCFV3S8mHPGhESzD2eIdhjDyCR5dHKmuWLMRCLGbaac47
 c7+mQJ+jXzTxwxG36j/LOUXpb3T3t9mKRU6Mwpf0QziFSmZ/OS0IGivN9VxX2/n2xMcz
 LDVBNDrlDlF0pOSV54EPhBcFTnG2uM4SZxKqmqPzfIjmJjSs2qwCwN6Ys6rJuro0AyNw
 4Rog==
X-Gm-Message-State: AOAM531FSufQLJZKK/gLHB9hRaPxFElOtbojRCUFZnEI5UWCtlmJNzbZ
 mtwvpOsm3yhKwXntGjKVCL4=
X-Google-Smtp-Source: ABdhPJw3+ko0VZX14qsFf/BNsYrFexeTS/1D1ZEDnK/05bBIvDZ7G0qwLteAixk33fJQF6HJwa/0Sg==
X-Received: by 2002:aa7:d494:: with SMTP id b20mr66478539edr.330.1609621155953; 
 Sat, 02 Jan 2021 12:59:15 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:59:15 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: sram: Add compatible strings for the
 Meson AO ARC SRAM
Date: Sat,  2 Jan 2021 21:59:00 +0100
Message-Id: <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_155918_189597_E4528552 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4 core
typically used for managing system suspend. A section of the SoCs SRAM
is mapped as memory for this ARC core. Add new compatible strings for
the SRAM section for the ARC core memory.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 19d116ff9ddc..6d65771e979c 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -72,6 +72,8 @@ patternProperties:
             - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
             - allwinner,sun50i-a64-sram-c
+            - amlogic,meson8-ao-arc-sram
+            - amlogic,meson8b-ao-arc-sram
             - amlogic,meson8-smp-sram
             - amlogic,meson8b-smp-sram
             - amlogic,meson-gxbb-scp-shmem
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
