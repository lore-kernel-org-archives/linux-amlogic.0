Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B34DC04AB2
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BB0217D6
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kY/WoVeg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AceFazVn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BB0217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QKa2sO9N60Ts/jD2dDwh+YXLNzM9aGfIow2suuHoFlU=; b=kY/WoVegJeFWNcnzE8XF9HWet3
	XNv5RznYgHf3sWinl87l2CCctXhxeu2gE3tuYPgfaLOJVeYfOYj880C2iPGXzAhb4FWbBFQFbgLpy
	bZhawMG06Nh2RaJ+AY/b9GGGEydiSeJTKjduKEfM4SVZKqdSOq1h0BqIRx3R9aS7PKa2GE4k6R0kE
	VVFAz0SYiwcODEes3bFwwSAq9TATYigwb/UcSu1b7hnnM+8ht3DH3Mw7zr2p3hRW7tSwnIndWtRWi
	rNrPJOhPJg8DqJn6n2TXnCrNTfgHrFvhzkn7lg4NjZiP0XIm12qlIBfc4WUtI7h0BBVsIhNgRnRcf
	4ZlSdhow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOluu-0005o9-Dq; Thu, 09 May 2019 16:29:08 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOlup-0005km-TB
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id h4so3916762wre.7
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
 b=AceFazVnmeo70zmUKXtxzROx9A0pF/jf2NP4g67cih0dsIVE8raO2aXjWOpQftWJ16
 K05BKCVSCYOrleouRkKx/3/7zaQ1HY+3/DFwOl9dHfS14JkoW/nI+LwXqANF00YebUuU
 Whw5FvGLzg2U9KHcsoGyT5KzdkwITja11hmwLkgYW0/T4rFrQIoThcUpBa1b/4DfG/zr
 cLsdBVldWwciEpp3dLmJ8dR6d87uilDLaPksoOKNF+/GfrBuXOBmQt67ON4kaQ0OkM26
 qI+idgB9mHmRSHFk6vHJOfM+vqyO+10wKLG3PbPCqPe670JH0hFfrAReSNWAvlndLddi
 2Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
 b=laPQxoTj1DRatUn1Z6zmO5b50sqVh1JZDg26c5okkl6fMv18sfnHP5NKzfZmcLiRT3
 qZhov4tbFtJRP6uU0bR4UraLz060TZsCJx1hFAmDz9Syy+AOo8b8/4aaOgVUZkgwhAuo
 wWDh7SxL0+jf76IQkSC8G73uCiRjY1Hf0yB/tFFNVuGENlawoe9x682VuYg4IboreWD3
 h+EMlLJOA9Di4Ppg8Opb+KbjPnFTtUbuVtuyXknjiYmMJ54ov+aAYGyhVh1NMZ2VOnpL
 dibscpGiwAn7y2HnWCOHMPf2urkr72zqW1bj7oVq3tPSWBI6KJN9+UYwf6bOcacqa7rR
 MMAQ==
X-Gm-Message-State: APjAAAVkHYUTLlLWfjvCZUKkb3m7rOzaI5WwllO6K4r+5RVEBJcdkNrq
 AK+sv8UoA9IrBI0sNFqq9GbKsQ==
X-Google-Smtp-Source: APXvYqyp+4swpGavdNb86NApkf1sjatdLA1EpEUZb9DAAQXR/gTO708mEf2oPQL5TovnEcFr/6JQ2g==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr3932396wrq.119.1557419342344; 
 Thu, 09 May 2019 09:29:02 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id z7sm3649796wme.26.2019.05.09.09.29.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:01 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp'
 property
Date: Thu,  9 May 2019 18:28:54 +0200
Message-Id: <20190509162859.7001-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162859.7001-1-glaroque@baylibre.com>
References: <20190509162859.7001-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092903_966968_C8A687B7 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This property allow drive-strength parameter in uA instead of mA.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index cef2b5855d60..84adce9f2a75 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
 drive-open-drain	- drive with open drain
 drive-open-source	- drive with open source
 drive-strength		- sink or source at most X mA
+drive-strength-microamp	- sink or source at most X uA
 input-enable		- enable input on pin (no effect on output, such as
 			  enabling an input buffer)
 input-disable		- disable input on pin (no effect on output, such as
@@ -326,6 +327,8 @@ arguments are described below.
 
 - drive-strength takes as argument the target strength in mA.
 
+- drive-strength-uA takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
