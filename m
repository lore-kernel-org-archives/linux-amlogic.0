Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723C7C77B72
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:From:Date:Message-ID:Reply-To
	:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4axfu3K8ZTxYVgpFxeYVox/wFtHsV105vnkOy+x52U=; b=I3B8L+6bvPdZbf
	4yqclgKHrtK8XNTTI1B2/SgnK2Q2iHMxkOxM31TrWzO9mcU+Q6YoqoQzOtcbtVUMLR9E5LkjPJLEA
	J3eGu1WD2AU1vzh/m0+bIxfR/dWLEogrwKIZP/lRacyzZiBesqgxP9C9lBtB2ppU5tw6K+/HlEJdg
	RTejiqcwI1OpGR9sIWd656Hjg85qqC4mJN/5EOys2plG2VtqXCQ4LpV1M7TO5espL04fSsJRaFFZ3
	jbvpCkJzZPGiUqWlMS+qvGrIvdYKVt1cYNRgy1AFpHkMdsaJRPVYAQ+CuBSfCi3vF/VzWsMpb0PMr
	JnQ8oGmQEt+FgMGpbA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJUD-00FEMh-1A;
	Mon, 17 Apr 2023 07:41:17 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4i6-00GKOB-1B;
	Tue, 11 Apr 2023 03:30:23 +0000
Received: from shark2.inbox.lv (shark2 [10.0.1.82])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 438E2480AB5;
	Tue, 11 Apr 2023 06:23:32 +0300 (EEST)
Received: from shark2.inbox.lv (localhost [127.0.0.1])
	by shark2-out.inbox.lv (Postfix) with ESMTP id 344D3C0058;
	Tue, 11 Apr 2023 06:23:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681183412; x=1681185212;
	bh=W3tRanFHINm18pybtDmwjdQ4Iu2c6+fwf0X84jhz/xk=;
	h=Message-ID:Date:From:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:
	 Reply-To;
	b=qRRYCYqrgzw+KpPeFhD7dtNIMt303zwWL2Musc+1VojZA3PBrmFF1WJBW4gKtcsQ2
	 4mY9c2qBs4tBQ/U1bGEk8Q6sTitpPNNkUIo4oyB+zuyv4QwbAGZIYuMxVn3m78bl3c
	 TtWXNxoNLnfGBAk4A7VfYuEMMf5LSiGTz9keVwRE=
Received: from localhost (localhost [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id 2868AC00D4;
	Tue, 11 Apr 2023 06:23:32 +0300 (EEST)
Received: from shark2.inbox.lv ([127.0.0.1])
	by localhost (shark2.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id bVRgT1qa2noD; Tue, 11 Apr 2023 06:23:32 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id 26A32C008E;
	Sun,  9 Apr 2023 20:40:38 +0300 (EEST)
Message-ID: <df9cdb26a0591289c268d79b07c3dc96.exkcmailist@inbox.lv>
Date: Sun,  9 Apr 2023 20:40:34 +0300 (EEST)
From: exkcmailist@inbox.lv
X-Virus-Scanned: OK
X-ESPOL: AJqEQ3kB4BlLucG3NYZv4P3txci7V0ZQziqCtaFSnX9YsLvButt3c2iUB/eRFELmMmLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_203022_572346_CC1EBD2C 
X-CRM114-Status: UNSURE (   4.62  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 17 Apr 2023 00:41:15 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From 9e8d170e5a13717aa8961ed98fad216ee9798977 Mon Sep 17 00:00:00 2001
From: "@exkc" <exkc@exkc.moe>
Date: Sun, 9 Apr 2023 15:12:23 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding

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
