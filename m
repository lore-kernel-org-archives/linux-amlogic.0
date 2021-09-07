Return-Path: <SRS0=Hahh=N5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCC5C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E6716108E
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Sep 2021 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E6716108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zeXDuPOiTWrGC6dbVEN4UP+uM80kaPoBSuMaDmfcQ4=; b=lBK43nHjFoDi0a
	AR0aovbr/xZlx+/KrGMKmyt4JuHxcxBtvobP8r5T3hrjBtIbyPQ9j63WoBd0BgjMsEKkcG9OnriVr
	DURQr+h2/ffbx19L5Haco+f2RG4Aht0PJ4+AoEWcKeuT8A9CxZni6VQwWbsQU1EiAsgTD2S+ASD/u
	4mQMRxEhPrSD5gKnpdRl+p8A/pMExJIYQ+apCD2+ENrU3d37wfMBZ7ZICwgq3DUZcIqphiInQ9Lx/
	AEBpq3kGoS/zB7EXdWvQTWf6GA6YFWXf6gI9y1SaaHLM9eKF6JUzNNWg9HH2OZTczpLAOSQU10a63
	M2pwNBVe15Ngi1sGtPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNY1A-003Ge8-GA; Tue, 07 Sep 2021 10:07:52 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNXqu-003DFN-5L; Tue, 07 Sep 2021 09:57:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14892DDAD2; Tue,  7 Sep 2021 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631008634; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=kWatsbnRYouuldwb6lqvB/sV7amJutWYUknSlMpmpCc=;
 b=RhCvPNC+cBq6teI/QjU4cnw+F0T9io+50UQTKIBWnDMWV51g2G/OOpj0canF3XdRYZmx+z
 nm/eHXf8y/0jSOVVCQ/Rh+D3Fm9A1jSOAXljh3uOOR7JQ1+UAqC/DA1d3C1hIZ9amDoqun
 XEsw8uViX2W1YaueC43yvwsSkWlYWx8rxPDF6POQMDr1AhSUaOgtSqeWcFSqJ+qd3i85My
 VqgZwAnusSL0AeIEwP/GrXBfmD3nFJresqI3paXR9PwMegbBi/mBWpNeBaJotRinriUGiS
 eVSisse+X0GO2rwzM96xmpcLRFb4cTYdwo/ge/CniVlNjcaN0r2dwTzjz4WEyg==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: amlogic: add bindings for Jethub
 D1/H1
Date: Tue,  7 Sep 2021 12:56:02 +0300
Message-Id: <20210907095603.1520109-2-adeep@lexina.in>
In-Reply-To: <20210907095603.1520109-1-adeep@lexina.in>
References: <20210907095603.1520109-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_025716_445270_5C18BEA8 
X-CRM114-Status: UNSURE (   7.63  )
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
Acked-by: Rob Herring <robh@kernel.org>
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
