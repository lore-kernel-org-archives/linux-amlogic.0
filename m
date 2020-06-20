Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E01C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2299C23E54
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVQKyhPE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dJqnEphI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2299C23E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wv85qNl93kKF6qX7uT9kMWU4h27OswfEH8qQCU/wudE=; b=HVQKyhPEj3FJ7c
	iV6dCzw+UxHhcd/6EveOX6/JQZqyUZH1fDCBDeBS09ENY6QSvt0qqrcsF8x6uWD0xhuqHzFZ+Vp45
	+zvy74t/6C+MsTH/5iXypFbIr/ZNkkbB+QOHA6AZzsQfXinict44nK6V235mKevnLAHspa0NfVGUm
	wb6ZrekO+/D2e6d7IhAbkuc/lxAf0AZV+E9hO6etqK6n8hdszRPg/KzGkIt/JFmU7jNsmbTfkyGKp
	wV/+gEGPzGPgsVn7SLePQGJNupKcMd8+mzdOzJ3GluS0T/vVqtiRPF5bW2+7j0E1/2bAv1JCJmFJx
	GOzMNAZeoummJ0DSZQxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmg8i-00018t-NV; Sat, 20 Jun 2020 16:14:44 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmg8b-0000zB-7r; Sat, 20 Jun 2020 16:14:38 +0000
Received: by mail-ej1-x642.google.com with SMTP id l12so13546768ejn.10;
 Sat, 20 Jun 2020 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5h5wp3ORTZGg5e5YMKB8xdQFo3Gs3K18kYJZ7b2m2TE=;
 b=dJqnEphIZ9aCR3dnamuWUmn7XcxtO80UGRVABq6YRlVHbfHbEQLES6ZGaZbUhUbUXR
 cSCkI3szBJfP7LuvU//wqOt9FGRK/TKnzMjKl5/Svu0J6XfThgHu1XVW0RrND3nrN3QI
 4hpRUScwefTOIALoskYBZt9XSVhM/uwRpmjFDaQLYALq2I5Sjj64KZq9c3HG7XbRmsmY
 RmB5X1XWpUk/HD/gYOMXukfkqx8x5b+3xCALiv0laXLVKmce1kQ06vYvyGV40kKviBqG
 yzP38MaT3Sob4sqJoyOZoPmEhE/BfzvsGM+qf0g+MQale2I1Z7KaQQyzMwZkzMNs5l3E
 p1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5h5wp3ORTZGg5e5YMKB8xdQFo3Gs3K18kYJZ7b2m2TE=;
 b=N6dggN1kJToTyr3FA4zLAVjmbLymMGhDcyA/JZWD76Yt4VtAvEp6F43sn5yvYBgXsu
 KQnYqL8rdAOtkFrejlnRXJdhxPl92jHCTZFbWwlkHAaO18WtUXdzcJbl1b+jKxrBCHKe
 eIhvoVSOJEhA5IRDKBtZYKC3v3d5ZCZLRRz4kK6Su0UDsSSjgrMXQKEVXbNv6b0MSt2S
 0EAjtCQSTDhnRkHly+8rF2F1Lr8KwnwAWOHfWoBKBErIJcnu+oL0MHu5lc411a3wek5S
 atu5YDvrAmMBOJmAZjAtz7i73W22dJPF+1nXxeyrrwIl8Gi1EUyzFsLKoD1o0/R7KYML
 dbnw==
X-Gm-Message-State: AOAM531Q85ee5M1Ib7UIlsgq7W4ulkxyHO58NkqBhSdR8hr9eYWlw7Tp
 xlEj0Rm+51d+LYJA3BkaIQBS4Uxr
X-Google-Smtp-Source: ABdhPJz6vp1hbLrRNQlUxG58MU8/EMo2gCfh7fH9Nj4MsFkWxILUFGJzWYl3rl3ptvKLdtrRaFlN4g==
X-Received: by 2002:a17:906:b207:: with SMTP id
 p7mr8271872ejz.23.1592669675716; 
 Sat, 20 Jun 2020 09:14:35 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v5sm7511031ejx.123.2020.06.20.09.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:14:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] clk: meson: meson8b: Drop CLK_IS_CRITICAL from fclk_div2
Date: Sat, 20 Jun 2020 18:14:22 +0200
Message-Id: <20200620161422.24114-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_091437_378815_464BD08A 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Drop CLK_IS_CRITICAL from fclk_div2. This was added because we didn't
know the relation between this clock and RGMII Ethernet. It turns out
that fclk_div2 is used as "timing adjustment clock" to generate the RX
delay on the MAC side - which was enabled by u-boot on Odriod-C1. When
using the RX delay on the PHY side or not using a RX delay at all then
this clock can be disabled.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index edc09d050ecf..3d826711c820 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -293,13 +293,6 @@ static struct clk_regmap meson8b_fclk_div2 = {
 			&meson8b_fclk_div2_div.hw
 		},
 		.num_parents = 1,
-		/*
-		 * FIXME: Ethernet with a RGMII PHYs is not working if
-		 * fclk_div2 is disabled. it is currently unclear why this
-		 * is. keep it enabled until the Ethernet driver knows how
-		 * to manage this clock.
-		 */
-		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
