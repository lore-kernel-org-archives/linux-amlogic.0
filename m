Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28633C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E818B2075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 10:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YRtxTYQa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KhrBnRBg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E818B2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RluTCyvlj8alhQ91jutdy1whVHiXjSc+Xw2xsKy2AKI=; b=YRtxTYQa57Ehkg
	yFbkjOCE3pFQ1lf06sSINBGNx+u7L67exZOjReyPDsoPO3OdEv5aOg44e/yLdhKr8XVEt4alon2N3
	+iyu5H+Nlb39XHc60v4ANwMgs4/SOx88KDTmq5FcOUKkzKQW/dLYu6s0fCBN87U6LFgEdPo9+/DRY
	vc8hubIRJfUd+U83wnoqC4xu4FmBeQ5fuOmruCj5AM+EpPZc2f0xO7YkkHKnAxtpXspKx01CQwzMU
	4djspFBkse1pD+D3kzVIsVjT76giH2VQxILa6h7XXD5RvESlealT/jS+S6XU/ZKMMskHhL731N4JX
	Ef9hO61bmhzkpk0JoNiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h95t4-0000hj-1O; Wed, 27 Mar 2019 10:34:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h95ry-0007he-7N
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 10:33:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id k11so10486938wro.5
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKLO1xq8GhoCKIta95r/uYSgTA9Z6FYbrp7bg0UxXxk=;
 b=KhrBnRBgmJd76U2vV4Eff5pU94SEB34MwayBQhqEk66ntaYGIWkLBQU3BrvUcE0aki
 wO5y7jyg7ssSkSa9JSslRUgpAnOb1b7YdMBzIOa1fxjDXhCjitWqyLQraZFaLxGJLRSl
 nGWR8b1H7SdiT4j4pBnBhlfEZKKjKWeZSW4oC9WqBHV6Fra/sI6iTt9pYmXmDkSVfSjf
 ruyTMsWrUhsAQc88fWZA2bA8AEopRWqP7Twh43Wof7ceE92VAp4VZhPmLFUMTdgJjxnt
 gYUkJKnXxwAgsAAImT1KaX9lUo+0hfRVMVmpiYaJsVR6geP9BVHzLf6lQ1Go/OjATeN6
 p6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XKLO1xq8GhoCKIta95r/uYSgTA9Z6FYbrp7bg0UxXxk=;
 b=YuukT6RLHVs79DdWUFVlnTAXXXxNMka9GhgMwqZ3qaOQrn/Bz/N3qVkP5PFCt/XrEb
 T4axF8bGCDhFyZ9iyqguFM1lRRsikYwPWzgV3wErX3y5k/Bz4m2ZMp5vKiQGE+RGwY3O
 oomC+pZTw8M/BCzoyIHp6C4t02aYBBfA26QHnE2za+dCe7Xo/nnnE5W+iX0mdBHcvzTG
 U8H6w89iTApq2kqTcm+6i1gVCc+6eHErAGOt++zDMKtC+esTybDCiMnCC5KNOtbYr9Nw
 sxHgGIPJUyc3IJsNbh5Z/68O6E4CiMkQKoWKN9kQU2EXn4qGwvxtg4BIg1vNWZraeSnM
 vHFQ==
X-Gm-Message-State: APjAAAVZpFCvKvaEg3rXt9zzelgZnU5HvlAajFn4CH65VBel5Ku3ooV/
 c6uHy0woSiXwNtzy1IL5Sur1rg==
X-Google-Smtp-Source: APXvYqz6DfHxlTZonMpH8LVbU+iwOS6IKXyO8Sgapw96CLMkctoR80hr0zVTngzcA8rF3N4zp7wpqg==
X-Received: by 2002:adf:e692:: with SMTP id r18mr24460580wrm.231.1553682796331; 
 Wed, 27 Mar 2019 03:33:16 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 03:33:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH RFC 5/6] dt-bindings: arm: amlogic: add Odroid-N2 binding
Date: Wed, 27 Mar 2019 11:33:07 +0100
Message-Id: <20190327103308.25058-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_033318_461143_022B70D6 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
from HardKernel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 94bbcc646e10..eff41128268e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -116,6 +116,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amediatech,x96-max" (Meson g12a s905x2)
   - "seirobotics,sei510" (Meson g12a s905x2)
 
+  - "hardkernel,odroid-n2" (Meson g12b s922x)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
