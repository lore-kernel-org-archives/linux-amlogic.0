Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55447C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 19:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uZfqvQiZbMXej+o9CHjQiluzyYN20BwGmoooaTNwQQ=; b=JHjRE86eDcQOz1
	Q0XKU5dQubbT9XgArJizpSUTgz+ZfRmybspTxArPrnn8P2+EAq+BfakIAmL34QQMEsStzpcTF71Mb
	yZA7UnVKEQ+WleATFQ14I8Tf5LcmC0+t1HDqM1vgQQHpCGvHOdCeHGBA6ZP2MHwbQfQN4riSaCmrt
	avPwdbO6KCu1uKvZnt6TTFx0reJUrQP19Iu5DKxHJyDCSHmJye4OfNNGLFt71ywGknES0QowlF6wy
	OkN1Jg3aCPNH5hB+Vo/Bc2JQdIMJST82x7mYMVyAsd3wjHsg5xBBnqH7xXmFPi5JSkMhxzFEQ0bP0
	DZ8qJcBR1qjafKxh3Qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plxET-00Fq2V-0N;
	Mon, 10 Apr 2023 19:31:17 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plxER-00Fq1Q-06;
	Mon, 10 Apr 2023 19:31:16 +0000
Received: from shark3.inbox.lv (shark3 [10.0.1.83])
	by new-shark9.inbox.lv (Postfix) with ESMTP id AFBBC480813;
	Mon, 10 Apr 2023 22:31:10 +0300 (EEST)
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id A11CE28011D;
	Mon, 10 Apr 2023 22:31:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681155070; x=1681156870;
	bh=SGtFRlfF4YRNNAwJZKm0kdZRSUL9WWAjLwOeMWQbjiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=UKym7BzJMv0IqOeQba7Tl66krFgNiiWjUpuu26eqsy8dhNjUfO6cKD588Y14uo4Zm
	 VlSzkzFJ/U5xsgrmM0+mXwxibq8ZLoAKjI7RuEkQ642Lyk5imXjH+Z5ee4iM7NLg8d
	 YRjI6z1A/K2tgB1UOS3XC0WgWp8sFjW1LJWbAJDw=
Received: from localhost (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 9A9D7280111;
	Mon, 10 Apr 2023 22:31:10 +0300 (EEST)
Received: from shark3.inbox.lv ([127.0.0.1])
	by localhost (shark3.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id gLX5lS8QRGnE; Mon, 10 Apr 2023 22:31:10 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 54DB12800F5;
	Mon, 10 Apr 2023 22:31:10 +0300 (EEST)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding
Date: Tue, 11 Apr 2023 03:30:47 +0800
Message-Id: <20230410193048.31084-2-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410193048.31084-1-exkcmailist@inbox.lv>
References: <20230410193048.31084-1-exkcmailist@inbox.lv>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: G4mEQ3gUh3tFv963KJpk5v+XuNvzCRoioUWJw7wy9QEqu8u6r7wBfW6TE4TmHAC6dWLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_123115_229447_7C9670D5 
X-CRM114-Status: UNSURE (   5.82  )
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

Add the board binding for the Xiaomi Mibox 3 Android Set-Top Box device.

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
