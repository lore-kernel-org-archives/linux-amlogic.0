Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEACC10F14
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499C72084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zy1JK4CQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ODm9DX0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499C72084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgA9/D3UoaVHIo1HxeSY9DI3fJLHMhzoC+SmDlChXyg=; b=Zy1JK4CQjeMcq5
	FtMiFeXMKFHcGaAs6jifQ6Rr8G8ovYsXO4uQ2Mkdm19+/YZmSYIOXWGOW5mbYf3OKCIUPOTmxAifX
	0IctEn6hp26d8c0dCy+QHyzrCTk+X7SWgB3VdKUer0tb3mFKlsgGlht/bltJk2m7Mr2dfkGuoISev
	xkGAvPX1hMIltYshz2ktCTJ8HLCeBDicDZr6tKIMBUcO4sJwhzLG8fbUAb/2JOAr1wTfxb6Iys6+a
	5H3aSOw0Jk0EwAbYyBOwDkzhG4ieGMNJX4LuyqvalBsEfo1aEZsbBWo7ZjJD1roc8VYa1sJZQOaRN
	l7KqelfmzEynKOe0SmhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsPk-0003cg-6u; Fri, 12 Apr 2019 09:24:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsPN-00039q-S4
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 09:23:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id t17so10958244wrw.13
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFZmJxKfIVRPvgSc5v5AF5OOxltARLfujv2opyzbGXM=;
 b=ODm9DX0j3BpCarhysWf0bYuSdprUQoduPvSTgZvYb5MFKhZN0rgalp2MN//aGz4esS
 zzdYpqzWtMAPyv3xKFQIfCqgm9OfP1u6hm67hMkY6BCXWqRLyN1rHPHgWJUdeqtWzYpQ
 F6t4DOaZREFNO/xfBJe+V6URgDrDicdKrrGazB6F5uMnAfd4NichYB09ExM+FCv0pQ4m
 mAPh2KgD84Y37eRqHII6rPXhC9+XnC9sz+YmrHIiiHOJRGJZRD9SG2AK/3Zz8cqPYUGa
 uMTfG1j31QwZrC6OhtaUlfOvMB3mHzX81hUi8YW3gs5j1beN0QQJ2V1ACA8wjb1fIJ0s
 0GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFZmJxKfIVRPvgSc5v5AF5OOxltARLfujv2opyzbGXM=;
 b=nWAl2WHyE87E+SG2BMB3yHP4iGylsAHnE3U/7WcQbX8nZ86YjodWnuVCuRXyHEAxaT
 e74uynOOCV95TMiCguENlvcBAVaLVEvzm3xT2F9fnhwYl9YiaOe7mCv9IDrDyq1wJEOq
 12uA0C5cVOPYcthm/U/oUiyvYgSlYel9+8RGo4os9rGoBz4BA5Z0wvi5ogILHt6WUioP
 d97q5nxoY8zk2Aq+kimW4T6dlw6YiXggD5xxLYrjIPWpRUGqy5PhpGUQ7A8+6A3/ANt9
 3IQxnVqtPjD8z1WalEGStAa1U2mFid/uId9nnu33BC46owIhGVPlA3xpLZQfeJ+WS8Vt
 am1w==
X-Gm-Message-State: APjAAAVPukI1sD6HYR5Imx0L3NJZ9z8QOgIb8lQcL04+muZnE50Lqat0
 8wvIskCNNNgCT+tZ0v36G7kQeg==
X-Google-Smtp-Source: APXvYqwn8inanJ8QzEt82E4Yv6STjtm6hgUsZrShhHs8lqcvjvP9wFG8dO+2qksyPwKYqG3K4enMLw==
X-Received: by 2002:a5d:6150:: with SMTP id y16mr12992801wrt.13.1555061020295; 
 Fri, 12 Apr 2019 02:23:40 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s21sm6630224wmh.22.2019.04.12.02.23.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 02:23:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pwm: Update bindings for the Meson G12A
 Family
Date: Fri, 12 Apr 2019 11:23:35 +0200
Message-Id: <20190412092337.6941-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412092337.6941-1-narmstrong@baylibre.com>
References: <20190412092337.6941-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022341_901004_205361B4 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the doc to explicitly support Meson G12A Family

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-meson.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
index 1fa3f7182133..e2bcd8e92ad0 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
@@ -7,6 +7,8 @@ Required properties:
                          or "amlogic,meson-gxbb-ao-pwm"
                          or "amlogic,meson-axg-ee-pwm"
                          or "amlogic,meson-axg-ao-pwm"
+                         or "amlogic,meson-g12a-ee-pwm"
+                         or "amlogic,meson-g12a-ao-pwm"
 - #pwm-cells: Should be 3. See pwm.txt in this directory for a description of
   the cells format.
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
