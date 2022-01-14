Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED0AC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ts4fKXlyg43zbOi+1/gbU8e5M3JeX9/cHZorWIa3vCQ=; b=vUi5Mjsb1uVUvH
	3isgiS5Rdu246e/bsVlne6kiSh1rN85uDMZ7+c9B5oIpcn62TRJ99V7RawCm5jbqe07RNLDCus6IG
	bz7q2Blw4O5RkbtSlnhs7dfu/EZG57VrEPCJtVVi74oW+Nvy3Ur6cKT/scqYc8mEBAReETCrLpcNN
	JSSvQlgsxK4r8UwYCS9iqi7OVPCWV4TD6P9KBsS2LJsSVzE4ma0B5HYIdvA6Vfp2kwimVAzOEJFfd
	+1kqXa53vg1/Mf4ihP+cTTCDYlMbLHhkBPqDgkY3nfrKHTMWl4CqXsmOY+bDlQhVyEy/fWrrWnOV/
	FU77KAMxm5QT3GBrqMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8I7z-008Iv8-Ao; Fri, 14 Jan 2022 08:40:07 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8I7X-008Ign-Qp; Fri, 14 Jan 2022 08:39:41 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 14 Jan 2022
 16:39:32 +0800
From: <jiayi.zhou@amlogic.com>
To: <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <thierry.reding@gmail.com>, <robh+dt@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jiayi.zhou <jiayi.zhou@amlogic.com>
Subject: [PATCH v2] dt-bindings: pwm: Update bindings for the Meson-S4
Date: Fri, 14 Jan 2022 16:39:29 +0800
Message-ID: <20220114083929.2910-1-jiayi.zhou@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_003939_905010_34D1782E 
X-CRM114-Status: UNSURE (   5.31  )
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

From: "Jiayi.zhou" <jiayi.zhou@amlogic.com>

Update the doc to explicitly support Meson-S4

Signed-off-by: Jiayi.zhou <jiayi.zhou@amlogic.com>
---
 Documentation/devicetree/bindings/pwm/pwm-meson.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
index bd02b0a1496f..0fbedf20074f 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
@@ -10,6 +10,7 @@ Required properties:
                          or "amlogic,meson-g12a-ee-pwm"
                          or "amlogic,meson-g12a-ao-pwm-ab"
                          or "amlogic,meson-g12a-ao-pwm-cd"
+                         or "amlogic,meson-s4-pwm"
 - #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
   the cells format.
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
