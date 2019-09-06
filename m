Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B8EC43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F8D20854
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyVGgu0n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAO4l+aN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F8D20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qAzCn82NzvPaFS1oMJ0ZRmJLCB7JLDzfXNycOWeNsGY=; b=CyVGgu0n0Ek/ypnUkfzZmy7coi
	Sx5zwaBV2Qm6OEHef3RSUB21hCxx8mH3mY50nQPw/Ug7WJuoJWJmWTZ71xel3zcqqzD2hsgl8Egm1
	kxXZa78GqXGaM9o9F8Eab2+8yOLD2aP6OsctczPmty7rYiy1in5gihOchRXfr+h4RrfAs5LoLZo59
	i6XQl3pqkNqHhQcAYLyRDk1T1cSGC/v+tPaRXVrpmamfoszdwmF497CuYJ6fvr5pOhgLBOZesMcnC
	9eQjKcBW5KFryAbupuEHqAKmQ94dqyLrvgDqjdTUbTb6it3CtmibvTFuWy4ZOWMsVL1e+BhuVR92M
	z7b9ndeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Ete-0004uV-Id; Fri, 06 Sep 2019 14:07:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6Es6-0004Pd-7S; Fri, 06 Sep 2019 14:05:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id y19so6751524wrd.3;
 Fri, 06 Sep 2019 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=JAO4l+aNXT+ppe4+G6QuuzDNKHoS0B8hYBszu4W2QrYj1ILHp/3I2LcXFmDlAE3p3Z
 WBYU1UvWb9k5N84Ij0wI5Ff9xbHVse9QnQIsK1Fpttz0ri5xjxqzgR8udpRWb0xLQvCc
 4l/X/Hyd0D/XRuHp/tLfols29gVe7i/c/0Cvk+GjJWTll5q4H/ITrDHVTr6EDWHuY6Jv
 mXOcXlIpVP+CfsoLCG09Q5HsKreeAxAEA2lVNVtUheEizmPtscmpHJcRKOxdEIKZCpbq
 JR96v+f8LIAY2uJ9O8OSEwlJEpPYCd3/7sxvhaJ56JAreGmxIdf53uBVM6KcuLFML6n+
 j8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=NUD3cnQUYEIeSeNNkNqL7NY98wmgz0aNa4Zr36yrnrCddiuzPuirnmz+MRC7EemSy9
 9RybYxqr+CWwmuGXy/u9rbOSco3CikiF+9NKVE02GLwd/5puf7HhAhCr2fk2aIpyIfQw
 BZ3tCLFo8vvTiofgi2WdfT2k9e8YpgwgKffzqFpfiINSofziyN/y7yrk0IV4g0Iqilji
 gHHNE7gRmQiQQzP8oN3exQiRpHT9uQTwjtFshX9N/TieCz9hb8optb6ediRfVuPCT9QX
 Da3Fj4EER7GqVQwsuKuiKppgqBrEhUMM7GPCTeXDPl//vlhsoNUcaLlSLE0pNoir02OV
 pkUQ==
X-Gm-Message-State: APjAAAW5yaI2CI4XkC92dWNGFEp+24PX0pGYX//AC0g3WKV3V123MvCA
 bBT6X07lARtmWbg3FCA16ks=
X-Google-Smtp-Source: APXvYqzYGaP/LIMML4wqp7oPFlAnOx7BAgRaP8hZH19dGjuCe6tr4IqS+370vWyzDV35l50+uStCMQ==
X-Received: by 2002:adf:9083:: with SMTP id i3mr7775711wri.310.1567778752389; 
 Fri, 06 Sep 2019 07:05:52 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id e20sm7480542wrc.34.2019.09.06.07.05.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 07:05:51 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Fri,  6 Sep 2019 18:04:57 +0400
Message-Id: <1567778699-59231-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567778699-59231-1-git-send-email-christianshewitt@gmail.com>
References: <1567778699-59231-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_070554_269753_44112680 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ugoos Industrial Co., Ltd. are a manufacturer of ARM based TV Boxes/Dongles,
Digital Signage and Advertisement Solutions [0].

[0] (https://ugoos.com)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..d962be9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -965,6 +965,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ugoos,.*":
+    description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
