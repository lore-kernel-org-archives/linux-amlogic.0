Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C423C04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C0F208C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSHmXP+m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wd86UOuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C0F208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibgvLVEr8a9pGt4ULKQ02QJOVFmnYfsUNpAQ/47ahRk=; b=YSHmXP+mxCMch+
	AjmgHRSE/LkryDNoTIVTmLvyODP3OpPkv82xjheIXGAgE6Td8OviQzkEvzbhXPyqbgSSiDWvrQXB+
	OEjviqnjaLdKq9P07oWeiV3uKYnmByIDIfJWVXeNwEEaABO9/tqRb04mrL9SQgF+zbcggVKY7smF9
	8yDioqP7WmOueHd50egxcP7cNzDe5RF1bEtnhi/Dzr8C2ahC4ZhrsJ3JbExIUSLlZCAo7GuID9qjx
	Na7my/1MPm5n+fRzbEHY2liY9s4/NQmhefkofCckMGJt3tDtdOLS7Roq5S9bWwM0LqJS80f+NctIe
	fF8OqMe5gZ065cFBv6yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQAKu-0004nU-BJ; Mon, 13 May 2019 12:45:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQAKr-0004n5-PT
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:45:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id v11so15120566wru.5
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2pz0rN5YxgIZ9+xKpj04TZfJLwVeh5ljwZlweZ4hEU=;
 b=Wd86UOuDbF0LRCUA0cQW2+b/NtT84O02/WElU5v/n9SOjE7s3v5qeLFeA6JBNikdwO
 oVlq4JKQjsGC0mwAYDc5cx1C8ZGfJw4yCxWkuF92n95LjcSPnAiD5ftTx1dgnCKl4ZhO
 90EmirHh3vBH3gF23ScGRur/G9mC5IZ6Nx+iq5tuHlfMa8D66pYsYIKr2oIR1JXywamf
 AZXGEB960rbq+9+aozNWZ+Ob7yVb5WszjUWteEiX1r3LWOtd61vnB8vDTspL0eGoN8zG
 mHbF+suSjWN92YWGB8d6F6MP3zhD3HfE//bGQ0FFED8F6tW0B+w1X0PF62uwO+HrChtj
 vyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2pz0rN5YxgIZ9+xKpj04TZfJLwVeh5ljwZlweZ4hEU=;
 b=sZG4Qxa6WSsVUBakSbqqyYjBJsKzo1bLvGb68VAIC4wA2sXmhnO1Rwo3D0AnIgJW1r
 Qctv+xZCpmPelRRc+3E2vxSv2FMgIOhSVTq31tGxqegg5GhUtVD8Qgoj25lP04Iml8+q
 AOoCGHhEgxv+RP5o5iZWcuDTnt7ZcPQKnAjcZ3uty1tTsvbiU6Ts/xjMM/ptCBxWj2X2
 eKoglP6oF5YRDjse2hbB3hyLfzwFhHLzlgcd5Ok8YoKrJ3yWlff6+GxDkwjzgi05iK/u
 HscamfPfJTkVe9AfbYjcrLS7+2ur7doQPFnTlAP2XKOu3uzWo74TKn/8GwHxAhUUMDmT
 kQhQ==
X-Gm-Message-State: APjAAAXoDdENr8em3kGe9drXHZEtP/mv1tRG6/pr9hv1na7EMempCowN
 pycbGroZvTPkfYnTAqxvIUIErg==
X-Google-Smtp-Source: APXvYqzdX4sus63iRBi+SDvq625L49jIdL3h6QcF7yHl4UQ6kOi8/umoeVTXOejZ1WjKuIabxQdcYw==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr18189595wrq.158.1557751540348; 
 Mon, 13 May 2019 05:45:40 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m13sm11576677wrs.87.2019.05.13.05.45.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:45:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2] clk: meson: g12a: fix gp0 and hifi ranges
Date: Mon, 13 May 2019 14:45:31 +0200
Message-Id: <20190513124531.20334-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_054541_823975_CB6733F1 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried.

Even with 60, it sometimes takes a long time for the PLL to eventually
lock. The documentation says that the minimum rate of these PLLs DCO
should be 3GHz, a factor of 125. Let's use that to be on the safe side.

With factor range changed, the PLL seems to lock quickly (enough) so far.
It is still unclear if the range was the only reason for the delay.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 206fafd299ea..d11606d5ddbd 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -463,7 +463,7 @@ static struct clk_regmap g12a_cpu_clk_trace = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 125,
 	.max = 255,
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
