Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6614CC19F2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Aug 2022 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqZv6bHWORpBAfWuv+YyFB2nbmO3UMemst31UD4ImiQ=; b=eRAqCbIIaA5Jgb
	9wkrk0FHSbKxhbKDl+2HiCgPkFu+HCmv3IOvut4OhsZdqP7KT6vw4paWn39JMJNFUvdGNIFJTYH4y
	78qel0fdW5MAOiXW/zE8IMBI1iRRVVfyhmcw4yf9DWTVfBWdnKWzuivUt/i/zMGhEFTaTGdPugM42
	RuoBMM0GDQrIO79UlpIFvNopzJWqhcYsqfvKG4igFzIHIYapW2fjb3M9QP8LuSUDDPAPQK8I+YMeT
	6lb8rkeRqzq5gWPa+nUioPoI0+xPHRXsAPX7L//WgHc41hTYE6/dp97CRneBbOVBLxzbIZIktXgs0
	ulrjTya0PutLW+xzZSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5Th-00BE9V-Um; Thu, 11 Aug 2022 10:31:49 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5TV-00BE3u-S0; Thu, 11 Aug 2022 10:31:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FC46A538C;
	Thu, 11 Aug 2022 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1660213894; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O0SbgWpv9ADCfK8illr/JNc6pF355fL2wbYM6MC/UEs=;
	b=s8bc4b5FXWD8uwS1VSNcw5slDaINjAIcYtH5Ye0lRDdsJ9ezGQv/yNZ2/XtZ/Z7DU3BB29
	DmlhWweRU8UmIRRQHJihaKDXBetBM4giViO5hqpLg+MZGd+DImSWk6/FAMJ78wpQGO0kIl
	KMhbqrNiS1nn0mQdAzIFDno8xUJrIzhYN1TTDGrD3zHgIbtz/JOQ10YMwMuqZuyX/vzAQo
	sE+5D2PL6VMu+ysByVPIxaShLUOfki6m1JdfocLnVXjZd0rzaFkaBOKhHgDjm86AAa0UfW
	dl+b1X/WgJblCfYd/s19Ojifu1+Ti0Tmk68IrbnoGPdoRZwmwpklhKw/S49NbA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: arm: amlogic: add bindings for Jethub D1p (j110)
Date: Thu, 11 Aug 2022 13:31:13 +0300
Message-Id: <20220811103113.3097868-3-adeep@lexina.in>
In-Reply-To: <20220811103113.3097868-1-adeep@lexina.in>
References: <20220811103113.3097868-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_033138_102218_043A2AB8 
X-CRM114-Status: UNSURE (   6.89  )
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

JetHome JetHub D1p is a home automation controller, modification
 of JetHub D1 based on Amlogic A113X

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 61a6cabb375b..9ac73e961146 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -136,6 +136,7 @@ properties:
           - enum:
               - amlogic,s400
               - jethome,jethub-j100
+              - jethome,jethub-j110
           - const: amlogic,a113d
           - const: amlogic,meson-axg
 
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
