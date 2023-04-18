Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12AEC77B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRpbizIiJE/KzEaoeVTrQ69zAkuDPb3auliqENrw4sE=; b=luJ0mprkrDzV7c
	+Is+OXutlf75P7helmgD5x3qpPICGo1JrP2rSYDq0GhR3VVRGeM28gvE66ppcMl8HHE6GSFys1kdp
	Qeeb+gw1xliRaEvkgXCVsjMVtso1sKpnL9M51UvWkGgJMDGQnwZ2AEfVVF+Mu9V4pWHR4K9+LPAeH
	z1gvs5g7cmUheXpnYinNnhFEAjQt03DHgcp7i5mDr9H/oL36sSx57xxd3rboEz2ry+jeDuSQFnu4V
	/cmUNxgkvp0Axk6MQKwAfEvTVQV+kAZX6+Sv0BVjjl9bQr4k6UT5rsORFz5yUQ4CB1TTxBhxnKC3U
	WJTIxbzabxakWWyRN9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomkJ-002Uq2-00;
	Tue, 18 Apr 2023 14:55:51 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomkG-002Up4-0h;
	Tue, 18 Apr 2023 14:55:49 +0000
Received: from shark2.inbox.lv (shark2 [10.0.1.82])
	by new-shark9.inbox.lv (Postfix) with ESMTP id CA283480B06;
	Tue, 18 Apr 2023 17:55:46 +0300 (EEST)
Received: from shark2.inbox.lv (localhost [127.0.0.1])
	by shark2-out.inbox.lv (Postfix) with ESMTP id B289FC0163;
	Tue, 18 Apr 2023 17:55:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681829746; x=1681831546;
	bh=H4pQJKYCOnpRLmsk5f6sq1pSgz19A7jPwuM6L4oJHNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=iJG2Q4SQntat0OXQuWdcyEB9Q8jNyXUmxCifE1sY+ftbskG+IGx91zSJgQb5DjAcs
	 1AVMK2eUy0jcQOHdzK5of4YZzCQjbuZtCgCZpAitLB6kymiLqefTg+0vb9tpTn0THj
	 7XO+ljKGlNJK7UArwHk9sHw0RQNh4LrVzLgQ8WcE=
Received: from localhost (localhost [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id A7776C0157;
	Tue, 18 Apr 2023 17:55:46 +0300 (EEST)
Received: from shark2.inbox.lv ([127.0.0.1])
	by localhost (shark2.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id KvW7JHCmu__P; Tue, 18 Apr 2023 17:55:46 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id 5A95EC00C2;
	Tue, 18 Apr 2023 17:55:46 +0300 (EEST)
From: Karl Chan <exkcmailist@inbox.lv>
To: linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Karl Chan" <exkcmailist@inbox.lv>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v4 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi box 3 binding
Date: Tue, 18 Apr 2023 22:55:14 +0800
Message-Id: <20230418145515.19547-2-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418145515.19547-1-exkcmailist@inbox.lv>
References: <20230418145515.19547-1-exkcmailist@inbox.lv>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGU1y83GUJgOk+7lwN6zX18hviD70sRQ5HNYv63DsNlreWyLE4Xze3G0c2HD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_075548_418223_B6222FB2 
X-CRM114-Status: UNSURE (   5.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: "Karl Chan"  <exkcmailist@inbox.lv>

Add the board binding for the Xiaomi Mi box 3 Android Set-Top Box device.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b634d5b04e15..bc4da146a5de 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -99,6 +99,7 @@ properties:
               - libretech,aml-s905x-cc
               - libretech,aml-s905x-cc-v2
               - nexbox,a95x
+              - xiaomi,mibox3
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
