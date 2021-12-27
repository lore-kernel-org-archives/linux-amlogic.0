Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D338FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fN42j+QYd4W6Lb5sWKzvC2C+lnrnoJJ5FIV08+5vFJI=; b=IqaUXC1YnqEUIt
	15P0Zn77LdWusrhlQYRsmbjWEY9M3WQ5OZmhOp7f/ZWQVw2ShAuF0qHXFhCBec1bhL3N5rUulunOS
	6Z6lxwUPA6mBVSSOeMK+S7pLi1ymIljLgHO5hw/Q4WIrTej0236UO5zeUp8HrCCQko3lhj0igtkNx
	mMrVeQspIIgTACpVPrZA30hySKviK4r5t+PBxyMBP2+SMngqMaFvkxaNPUtT4Ben0qs2FfHNbVVo8
	UO+G6JNujifTmOCpZ8EW8xsyqzuHxAw1gTm/rtEM2b/SY75wGq013rLqga+e9b3J0sVq5d+LMLXP+
	7opu9EbsNbAxDN2dIioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1ipN-00GDNM-17; Mon, 27 Dec 2021 05:45:45 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1ipB-00GDKr-Uq; Mon, 27 Dec 2021 05:45:35 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 27 Dec 2021
 13:45:31 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <kelvin.zhang@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3] dt-bindings: serial: amlogic, meson-uart: support S4
Date: Mon, 27 Dec 2021 13:45:29 +0800
Message-ID: <20211227054529.30586-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_214534_019286_CD8F5E62 
X-CRM114-Status: UNSURE (   6.06  )
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

Add serial bindings support meson S4 SoC family.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V2 -> V3 : fix the type menson->meson
V1 -> V2 : update author name
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 7487aa6ef849..72e8868db3e0 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -29,6 +29,7 @@ properties:
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
+              - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
         enum:
@@ -36,6 +37,7 @@ properties:
           - amlogic,meson8-uart
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
+          - amlogic,meson-s4-uart
 
   reg:
     maxItems: 1

base-commit: 84184107c39ae65d08f6d449a57ec58734ff535a
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
