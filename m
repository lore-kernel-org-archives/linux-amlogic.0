Return-Path: <SRS0=mTG8=N2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7FDC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9617960F42
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Sep 2021 14:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9617960F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwoCqeJG3L2uhd0fwWymkYs8sqpOp/ku9OIDmz0b2UM=; b=zv1Kg3SWUYUS4a
	O12+TFyABhAnM9oCkH+Q7bgK24zRzNht1mFwgYUyKUWRgxb1bQyvUgbYdw6dfHeQyKqHsUqCamRbO
	pFKCjPa5i7DcgG8BV9nINitXQdrXw6NhjUBxfgjp7Py97OwhIPwlyHpucR/SxwiEjcqXd6sVaae2x
	mfoGTk/4OrGWDkTgeVpKd9/AIh8e8CZrpjOJqt2Yq/+Gbv+oSp5BQb3BIeQvAGnVYRn/sJsVq2+EM
	Q9s4O3mIBPuZV+b3VsBc2QlKs8wFuubmGSYbiUxHb4Pq+imWtgBBy+q90zfn9OUtJJzR5vkm8dSSj
	8eP927uxAFUsMm5FeE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMWek-00EFsT-9T; Sat, 04 Sep 2021 14:28:30 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMWeY-00EFp0-9e; Sat, 04 Sep 2021 14:28:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E981D848A; Sat,  4 Sep 2021 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630765695; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fPLTKd8LlOzoI4ZFKG/vdJe5fbB/TRLUEFV1mGcBBps=;
 b=CSkxB77gr/b/DJdC/YjIvGptG5KI1TX5ZBU/F/JgU+mQsnD4xjKEytk6AwtB0jvAkUMKIU
 Q4ufSqwuYNwOWW7BaBPTdc6s/2hpzCnMKtYen+zn1h4RZzKuGPAUkghEC8zjLCQBP15Otv
 ULt8tqivmtV5k6DKrNj8szQb6Ht5cgclT4L/2qbiejkxyT5x23o6w2dVEEgURCIdecN7Dr
 pPKZw0EN2wGnXiuY/Cc/TFGmJ7AK4EGZTKvunWNz07OWyKD19WtGoQE6j4abThoYanGH2A
 lI8xDPRpYfNdqDF1zKF91BuvmTFwB7BECKAm/PhfX/PwvSH0xgc5NdjoxBAEDQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org
Subject: [PATCH v3 1/4] dt-bindings: arm: amlogic: add bindings for Jethub
 D1/H1
Date: Sat,  4 Sep 2021 17:27:42 +0300
Message-Id: <20210904142745.183875-2-adeep@lexina.in>
In-Reply-To: <20210904142745.183875-1-adeep@lexina.in>
References: <20210904142745.183875-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_072818_539764_9BC11DC1 
X-CRM114-Status: UNSURE (   7.28  )
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

JetHome is a series of home automation controllers:
- Jethub D1 based on Amlogic A113X
- Jethub H1 based on AmLogic S905W

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6423377710ee..b223d7829c3d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -86,6 +86,7 @@ properties:
           - enum:
               - amlogic,p281
               - oranth,tx3-mini
+              - jethome,jethub-j80
           - const: amlogic,s905w
           - const: amlogic,meson-gxl
 
@@ -133,6 +134,7 @@ properties:
         items:
           - enum:
               - amlogic,s400
+              - jethome,jethub-j100
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
