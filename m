Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12822C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:42:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF118213F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GG851Q39";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JKl9rSLE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF118213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bG79kVsNBaZy+7XT/hFQIH8agNpM40a/ivPow1sXqU=; b=GG851Q39tRke7u
	HbbneVn5TG4/ZqmYh2lJ4kCTQSr+jlqnLyJFu+R2HwGH1ypAJp+NKuX+ENXWoSFyYw5UBRMIXrCJC
	+rf8gaKKVzRkNattEMKbXmU4iPpqXfH0H6//sjLeeuw1nXt0umz7v+ck9usFug6SIySu3jRzuyiVM
	fR3HYPRAez7AHDamI9vitIqF80+nQEPaPfzAQU7iyAnbKaZ1c5KSEdp1aZ/LHo0AuAmA4E9+iA9Ip
	QhQsUp/eBcistD2sAkxvoTpKjXlQMrgwkrW9Kc7MF+VAZRi9QnTR/h82UkfAvVptXRC5Y7IUfFJfb
	00ogF054uB/DaBBiwl/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6MUi-0005NK-JF; Tue, 19 Mar 2019 21:42:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MUY-0005Br-UV; Tue, 19 Mar 2019 21:41:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id n19so18404528wmi.1;
 Tue, 19 Mar 2019 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NP0o+Dum7qIR8HK+czqLfsIjPpZypc6hUmbpXm6PNGs=;
 b=JKl9rSLEEpaTTjhsFU6kZmcJ7Ch6FBKrgo9rUwHRFds04Qsg8XTgiMbD85bRZRZcrx
 y4KXFDRPA5wgvfME+qL0/0TIjmZB4pSJwNQIcpjU7pUgGAiMM71+7foQonLZkMWtA6ce
 OKj28fAdBjxC4+FzEDqTlXYc7FSdROFkd3PaRaoDgcgWA0mAAwSUIV2L242Acac5lQuu
 eawkSonUnLp1L+2aOGOA1vHpos5wlEi7MhDCmhFkjP3WQ9m/Z8+X9kHCaRJG19wFlb5q
 XLYUYMDq6+6m8WmN1mdnPnRWwCdTFK3wEfREvDY47BPu2H0GKU4M5zmHNBSN2RbJsc4s
 jf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NP0o+Dum7qIR8HK+czqLfsIjPpZypc6hUmbpXm6PNGs=;
 b=KgpaotKUBhzeazxwvTdIG4ZeorGcvrb5cOqr4vO/pXW2Omxb1fzXBgiA4n50Hz4vhZ
 ttE0Nbh1JSB2kgzGj4vQ2IjMmogmDdD4Vkr4d3sRX1IC8s5b6LVDzBGn4/pyJixFhbdv
 Mqv7wOMef4rxl5ATQi04RKpQegO+6fp7tz8iSY65Da9wDwuWLhpzQas7Sh6WF2UxLJfp
 os+DHicn0tVj9u+nhvtnsNhgj07Y15jSpH1FRbtSSkuTvaEQ5JzZCUkms9HxPXIgPaGD
 LxQlB1RsJ/hA6KFI39C5sdLtflHMUQGJXCcKXa/lfLF93VRT/oP6aOPO4SQJcaCIppKC
 yd4A==
X-Gm-Message-State: APjAAAVGbY/B3V1k8AJXgU/rh0m1wI+qpuUmojld0y8Usn/WUAgookeo
 e+zVmV6ktpPJ3w6XuN9GFNc=
X-Google-Smtp-Source: APXvYqw7v8Q8khQjqT8vHFS7ndZ/FDmwtdtQOPCznB5+H6GlaDj4BsFkQxvOqwv9vFhtaVW3PJoJKA==
X-Received: by 2002:a1c:1c5:: with SMTP id 188mr1740165wmb.52.1553031709284;
 Tue, 19 Mar 2019 14:41:49 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id n19sm139675wmk.35.2019.03.19.14.41.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 14:41:48 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] dt-bindings: clock: meson8b: drop the "ABP" clock
 definition
Date: Tue, 19 Mar 2019 22:41:23 +0100
Message-Id: <20190319214123.27219-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_144150_979970_91BEC5F4 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post
dividers") added a new clock ID "CLKID_ABP" which contains a typo. This
was fixed by adding a new (typo-free) #define CLKID_APB in
commit 40d08f774c17ad ("dt-bindings: clock: meson8b: add APB clock
definition").
Now that the new #define is used by the driver we can remove the old
one (because the old one is not used anywhere).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 8067077a62ca..cd11628f50f8 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -103,7 +103,6 @@
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
-#define CLKID_ABP		124
 #define CLKID_APB		124
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
