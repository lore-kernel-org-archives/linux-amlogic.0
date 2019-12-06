Return-Path: <SRS0=jD7o=Z4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF46BC43603
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DD82245C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GqYTwcmY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MObQOadh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94DD82245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouCrIGMnVABntBDq+VHJx+2NCA3OJoDb2R9W9QU0F8E=; b=GqYTwcmYHeR6T6
	jnx9wBFkbYZYHSL1lfc8YgJf1fL7K5jl+khCacP5yPmpBvjnl9P9lJl7WX2Fziwizp2VOM17Ibhdh
	q/29lv5hIzV3ygwKev2Yk6OEYR6HINlnmPVKZ8BXb9FJMLelbd0eDuw5/SjowXQJ1ggYRcH/KGupc
	SCkD4Dh+KE6a3ZM6M8HDbVvE9/Agt2a0OkJBIcmmhttWiuU0OpJoFpfZ1OZsT8meAthrNz674LeBJ
	OYDlpgxUGF2w+QIjyk4YbnoIAaMxKY1bz1LbqHLTzrxCdvU1ANQNDbYvuOJspoWNmbqFQSgYUfxZE
	rEn9EkMEv8pce7sMha3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idARj-0003bg-8y; Fri, 06 Dec 2019 10:02:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idARR-0003HX-Gm
 for linux-amlogic@lists.infradead.org; Fri, 06 Dec 2019 10:02:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id g206so7169668wme.1
 for <linux-amlogic@lists.infradead.org>; Fri, 06 Dec 2019 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
 b=MObQOadhYDBbu2EhvJplj3lYX23ZswIvvTlFgDEbGop7S13xO0RHWB3A9+o+ulvTMI
 a08eVr1T8OxYHDi5IiHrdP47EFegmSYJwFjaCYNt7KDdFkWgKQ2WXcswoHYFYNRdbaRq
 Ctytm+wjPnbLnYhfm6U6JYbN2vR1EuAel6sKkVRO5S9t2uv2OQR8saPMdNvcP7xC4kNP
 SqDCvR6r4kwHkSdZsCvW1WpPzmJMp6KTmniuSrMNnN/kHQKcaqEU+EFcz7t6arJ4a+kP
 2e67P2Qm49H2vHiZoIbD8PJTmEYVE1JWbHeCO2qeWbmPUw90J2xtTIPa6ZrFjA2B4R9e
 SfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
 b=R+U5O51N58NG1Zre4HmXdfm1zSB6lQTZJMz60xf5w9d4MLqiYAj2DUEnGo1GiI+3Ui
 SoWTwJFA4/RY9ExdabFK4tuS9zXej1D/yKpxLrGjf0WOMW/+jtI1xKXSByp6hcdS5bo7
 smRusqjDOL+1BOOrs3riYMkVfrA/HiGObjpjFVKzOh4bWt5WU26mkEAbp0uUEY7OrV/Z
 flyuU5Qmob2a878LRizWCIuwxOci8YwhU6OQnQUlVUx/kn2KtaxUDyGQHmJj9KGBjWnf
 y/mhJw0A0gLn9F7b1X+dFRXh/f9TRpZOFLMB4IPwp1wYatRdCc8n7Ed+tHlzPxRIeQPb
 hfgQ==
X-Gm-Message-State: APjAAAVLVzIiw84OPfzlMZ2lZWC2hF7ueLzgGThq0YaPQ5ufKrXfvNdk
 W3g+YARy3DeHyf1nMua61H71Ag==
X-Google-Smtp-Source: APXvYqwWyugvW9+TBQfgxQt0TCNZmAm9UhZCkAv4q7Ivnw90ziAaZT6TtZbHNwqGrrWBE5d8nIgB4w==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr9437306wmk.37.1575626547640;
 Fri, 06 Dec 2019 02:02:27 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d14sm16372314wru.9.2019.12.06.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 02:02:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/4] dt-bindings: arm: amlogic: add libretech-pc bindings
Date: Fri,  6 Dec 2019 11:02:17 +0100
Message-Id: <20191206100218.480348-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206100218.480348-1-jbrunet@baylibre.com>
References: <20191206100218.480348-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_020229_568447_4E35DC49 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the libretech PC form factor

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index c6a443352ef8..2660ba3b129b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -104,6 +104,7 @@ properties:
           - enum:
               - amlogic,p230
               - amlogic,p231
+              - libretech,aml-s905d-pc
               - phicomm,n1
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
@@ -115,6 +116,7 @@ properties:
               - amlogic,q201
               - khadas,vim2
               - kingnovel,r-box-pro
+              - libretech,aml-s912-pc
               - nexbox,a1
               - tronsmart,vega-s96
           - const: amlogic,s912
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
