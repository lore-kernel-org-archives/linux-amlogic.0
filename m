Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0268C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXgqqA8562J7bAKV90Ob8GVyTlAZhKIXyiETHoFRs3E=; b=vugp4g12k4GQxl
	divtJpvRpNlP8+hHG8cmXBNHxUNPwzZ8HnpWtcoufwWjutMCZtV3XVmhKKiLwJgWRv7SdRuUTspsH
	IX9Ffaja3GuRAenZ9e4BUKEfd5zJak5nNiYx2+Sz+qBU7LrvQz+amJJNqBypy2iMibs66KNKXzhYr
	hCzL5gym7Nv44egkX/oOkvEuYlMJvNYlaI1xSmSQsz4UzxTk3IfkEh8j6ycBc9lSyC5XoIF8Ksmv0
	4IY3IdgikYqRPQI02ea30aDauYRFww3yaurJWeGBT7psAJhFq7DKs1iqTgOs+CpxTdZlVJODvHS9g
	LKjoVLqXyUc8Cj82hdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLyp-001jRi-27;
	Tue, 25 Apr 2023 16:57:27 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prLym-001jPW-1W;
	Tue, 25 Apr 2023 16:57:25 +0000
Received: from shark3.inbox.lv (shark3 [10.0.1.83])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 187FA48052F;
	Tue, 25 Apr 2023 19:57:23 +0300 (EEST)
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 081BD28018F;
	Tue, 25 Apr 2023 19:57:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1682441843; x=1682443643;
	bh=lBR6HTqHzgUoGzc6OeC2Zmr/AmFRAGLoGdUpO8fVKuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=kDxf8oLZ/uot97+ZDSyqMQpF9tzhBwVz6dXrdGjp/3PdpNpCCUwXvpDEO0EE6w4QY
	 F1AC6PENWOnHs8Q6UtEWxhgWP0aXNXhBpOQYzwqYJgTq07NSuy/KwgWjZYMd+lSI5y
	 sJ0Kz/4SNqMArdTeQaXEMoMFgIQyaWDo88hZ3znk=
Received: from localhost (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id F401328018D;
	Tue, 25 Apr 2023 19:57:22 +0300 (EEST)
Received: from shark3.inbox.lv ([127.0.0.1])
	by localhost (shark3.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id ujduB6TBSSOC; Tue, 25 Apr 2023 19:57:22 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id AF02728018A;
	Tue, 25 Apr 2023 19:57:22 +0300 (EEST)
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
	"Karl Chan" <exkcmailist@inbox.lv>
Subject: [PATCH v5 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi box 3 binding
Date: Wed, 26 Apr 2023 00:56:23 +0800
Message-Id: <20230425165624.11999-2-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425165624.11999-1-exkcmailist@inbox.lv>
References: <20230425165624.11999-1-exkcmailist@inbox.lv>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: EZqEOgIB4BlLvMKgKZpu5uH6z9GvNCkuvCbmvcM9qS0Zt6+jx9N0dmeVEoHtGgW4bg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_095724_663160_445CB774 
X-CRM114-Status: UNSURE (   5.83  )
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

Signed-off-by: Karl Chan <exkcmailist@inbox.lv>
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
