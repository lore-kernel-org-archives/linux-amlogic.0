Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFC1C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 13:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F962339E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 13:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpQGQZ8e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V+GRa2Dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F962339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tr7tIk1sa9BRratLtVVuTpByFx2vTCHpYdLpjLnDKoA=; b=VpQGQZ8eVXpf6n
	gXr5IdvS+kMUCldkMaJ4m+xiSNhKK4lhz81r/D1ZpHsxjMclpe6ELkalceG1N+oGXFWSVnWDl2jX1
	B64bIAKENF1cv6avGSMZiCgPAwSey1HlrX5AZ6TEsiUFcPVtPuDvvTzYCTtXOQIIrObeROkb81zQH
	kHvCFm359pyqSg1e/KuLdMZvAUVBnbYCe/gZty2zUF98CZ8KM6F3EHFIfGJr9fkjyaA+6wYBFCJ9/
	d4PJLCXAFw09YKWKJkWWzt2IWXCrTfD6kTgFze7sGVuAGEp34dFDab3xRE+l1U0WVf6zFf1eQCpSO
	vyQno6glsgQdfi7Hn0IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3KSg-0000f7-U5; Thu, 29 Aug 2019 13:27:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3KSd-0000dx-SI
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 13:27:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id c3so3430754wrd.7
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 06:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ObZxzVUzRVJkzuGbqaSj0zLHjJYTKVhbZ4DRyEiw5iM=;
 b=V+GRa2DvQOlLn0X+4NST+cS1WZ4h3PtMrz76coZnLJl7sJ0s9T6gbOS9+Tbs3b9Ntk
 8ghDZm6ofJrbfDX+jkkWoqRsCsFjNWULiUOthNoB9SIWFeGduuPxoSqp90V8+hUWxKBu
 FdrwiKzfHq8mwi+ONQPyptIpRWkIAo6ji0DiGNoFxexuWDtCL9+0oD+X8fZTr0UQK8nR
 Ca7zaolB5j1QD7H8bNSZHjQfRVf6dgdYugvY8uL0YQWBtLLXpY8BwcwSgnfo1PKAn2Jo
 4t08AAgTQS17cFRVCDs1hgrJfq4OkNhcJG2zCPKUAFIvu3kJh4bw4mAxb+SbL8M0vHgG
 VMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ObZxzVUzRVJkzuGbqaSj0zLHjJYTKVhbZ4DRyEiw5iM=;
 b=O9Y+/tworEO2RRFT6egAuHx5jw3ul/DtI+eT7zMbI1Laurgk4YJRFY966nMQmSSEVR
 kN94dy8HlKEn+jYyiW5Vyjurrg5Yy8z+B0NFc7FZ3VHv2CrA+c7xqsf0pFp2YB9DMbfh
 R8mPoQ7jks1QG8jyKiFb1c6S7bng9eA3tC3oyHbvv207f+616MUMcIQga7g79slMeOld
 WP2keTpqRvFxBAXd+nHx6CDuGd12oHJDciZxB966acw3WcjDyP4i2M/yhw8WU37A93MA
 FH8ln1CVGqDAp1bndTUrfqeE9+Ds5eXiFwvM+GWLCPGKd+kGd4PhKs7qkKAxqBH21dQi
 OPbQ==
X-Gm-Message-State: APjAAAXJD6jKmJS2SaNuJ/3vOstloZwSmmb77DBcdKgBvn8nrIPJ1jbp
 BMenDz5Q2f85aEKLDj9nHQY7sw==
X-Google-Smtp-Source: APXvYqyOHXWpdSBnIHcSQVNTV28gpUMVgF6m5ArVN54Ou1BYOV7RZWWE14x6SLW7DnHo3o6yeQTnYA==
X-Received: by 2002:a5d:658d:: with SMTP id q13mr4108312wru.78.1567085250674; 
 Thu, 29 Aug 2019 06:27:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c62sm2420823wme.20.2019.08.29.06.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 06:27:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-sm1-sei610: add stdout-path property back
Date: Thu, 29 Aug 2019 15:27:28 +0200
Message-Id: <20190829132728.20042-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_062735_953061_3C778317 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The commit d4609acce187 ("arm64: dts: meson-sm1-sei610: enable DVFS")
incorrectly removed the chosen node and the stdout-path property.

Add these back.

Fixes: d4609acce187 ("arm64: dts: meson-sm1-sei610: enable DVFS")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index e1cac880b02c..3435aaa4e8db 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -19,6 +19,10 @@
 		ethernet0 = &ethmac;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
