Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE03FC3F2C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 02:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCF02469B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 02:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtJYdChM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCF02469B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8+L2BN6yiPott4bX2y1YdBFkuq0QucaorPxnxt7NH8=; b=rtJYdChM72PQq8
	88ZBvS99qySxLvK61Gz4lHVayeNQwjQ3Dtpeb1CVCKN58JGMR0EryWVAADjgbu4pt8zMfxxkaqvuB
	2shUKHJws8l7hWcCzmcALc87tlJYGbbN4/MHMewF8XY6N14rzA3p6Q8WuiiS73MihGPNaAAdGeJU+
	0WN3lhCsw/0L2nxiagpUGVmVT3XtMTOU4Lfc3gQRhMilFlSwnEWJj5SbRybifI4JD14GKuJHXsVUT
	kIgLoEGI28TgZc3akTGM0Kg6jgofddhnVbamJlwPpUumik9uzpJpyApXWLnDG3obhY37tCp+e+6b/
	NTa0v9WC43lqH2FxDlPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7VBT-00005f-FT; Fri, 28 Feb 2020 02:15:23 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7VBR-0008W0-Ko; Fri, 28 Feb 2020 02:15:22 +0000
Received: from droid13.amlogic.com (38.121.23.132) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 28 Feb 2020
 10:15:33 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kevin Hilman
 <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH RESEND] dt-bindings: power: Fix dt_binding_check error
Date: Fri, 28 Feb 2020 10:14:59 +0800
Message-ID: <1582856099-105484-1-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [38.121.23.132]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_181521_684455_52A6BD72 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Missing ';' in the end of secure-monitor example node.

Fixes: f50b4108ede1 ("dt-bindings: power: add Amlogic secure power domains bindings")
Reported-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index af32209..bc4e037 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -36,5 +36,5 @@ examples:
             compatible = "amlogic,meson-a1-pwrc";
             #power-domain-cells = <1>;
         };
-    }
+    };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
