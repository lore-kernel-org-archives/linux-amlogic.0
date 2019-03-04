Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF69C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30EC20835
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDsttfEa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n6SgtuK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30EC20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZN94TFtdWuTWP7ItcPEIE007knybvs2ZLTuOukORMo=; b=vDsttfEaYOw0Vg
	yGu/UHop2mHy8sOigSP/y8m2AtsyIeiPy+aBSB7tMqGv07UZki7Dx2cwPc6iEU8y+s4cL+PrOvHPq
	cqXPuSIXoN4mIsMguoRu65jsHvmUcR4RBM8zKvgvZ5f4ChphvQfO0OrxY5NC7Ga3ZM4/Kq8TdlBzN
	Dai3EkPlLrZswd/e60kkLLe+FFQBo1+njZYlEyHXST4cGVAJLqp9nflc6RGGl5UROUKGmudCyjDoU
	jZUbGDuqNSDN910cOXKjskOZkQJoUmsDjp1gCUWIvqgyBjBYeWi375wZVQ22qcEFMz+CWiSvwNIKH
	A5HJ6VwpisIi2BUGFwrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0nNk-0008An-RZ; Mon, 04 Mar 2019 13:11:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0nNY-0007tq-5o
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 13:11:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id o17so5486060wrw.3
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OrFGKmvdQsI+KI1EYx/jy8kl6OFXOGcUtXpV5mGC+WU=;
 b=n6SgtuK6ZI1hPdYec7KSCcwF64+UTbuk67mL76ndzhPFFOwA1HgcE/czpDVWQnfUGM
 4SRroladBEgxFu6oUeBH1KbXZ3lVCDv8aa12uXOI0HXLonPQm7GYsCZ64UzMw54opGy5
 5e2xORvztAEBV4C/0/aH4voosfcdGDimouyqD0ejRZz9jG6lmrzNBCHvYFt18QfByQIQ
 BSgRjOy9aCA4VEkPGDR7gNlPsmIa3JwQc+1Khs6bpIANMIV73DIDwfzPJafnOuo21WgI
 VKXNNS7WxI066bSnLEhysM4+7UdtkgTYPOvi2aovWk8yMYvPMSm8N2EPLYt/ETGEJyRX
 2Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OrFGKmvdQsI+KI1EYx/jy8kl6OFXOGcUtXpV5mGC+WU=;
 b=Uo48DJ2HOS3JkYRZVl3y67zhrtTMIIvJjmiq2zkn4lfZFFeu5gHiqVL6J98HndlQuE
 Wqbj6ITrQUjiUn3DkXUQq4AJMDdvmg1GmUGyq0HzReFau+49rZK2T+/udVwycBU0OHdo
 SGS8e9EXRxbko/dcLmMVpa+8io+OXFPmGFQjrmM94n4scsfRFfkZcpj4vPKpd89rqr+v
 RzA8C/qT1xYwOL7lF7kt1GG2gUb1whFvMxfFkcvNGi4dANYsjWwjYvs82Jn5JSQ5VBx/
 mfUpG0MN1vo/CZp9LqulzCOuW1vrv+69r/M2wNMUjJAafPBcD/Dt2pvTh/3jqMygg8jK
 gNYA==
X-Gm-Message-State: APjAAAWvZRPvpqgvn1WmzOJxgJqfuwCkEZD7i7vfOvgrAVvl6Y19orhr
 E1D1FxJ1XezectlequiT4qN4Zg==
X-Google-Smtp-Source: APXvYqzvwVbi3zUS5C3lBD7Oxc/Sz1v2Z2fFgofmsF8Yxuxr7RU7gijJf0Q/lsiC4P+jiVF9YsHDjQ==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr13378495wrp.164.1551705093614; 
 Mon, 04 Mar 2019 05:11:33 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a8sm11695624wmh.26.2019.03.04.05.11.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 05:11:32 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] clk: meson-g12a: add cpu clock bindings
Date: Mon,  4 Mar 2019 14:11:28 +0100
Message-Id: <20190304131129.7762-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304131129.7762-1-narmstrong@baylibre.com>
References: <20190304131129.7762-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_051136_234295_CAE265FF 
X-CRM114-Status: UNSURE (   9.87  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
it should be the only ID used.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 83b657038d1e..d7bf0830c87d 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -131,5 +131,6 @@
 #define CLKID_MALI_1				174
 #define CLKID_MALI				175
 #define CLKID_MPLL_5OM				177
+#define CLKID_CPU_CLK				187
 
 #endif /* __G12A_CLKC_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
