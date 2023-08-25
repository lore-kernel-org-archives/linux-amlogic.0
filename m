Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D5C3DA6F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F3pA4Ewpfv2wEJaRUpmsikVWaJLMFrthuXHkBmhe84=; b=I6v8w6vmmGroWv
	FXJZGoBsC/w1D1fw9r6UHubGT6XuGoDdMOoN1dQgF42umTQbEdINpSnTQRZ6lHSM4x3nR/UU6nLz6
	V/uV89Bj/tB+VByllZbXcK9PK+YnM29ffGy8eD6PZI8SX4Jc4AYiWs8Ibdlnk//9n65fvR/8CxW2D
	Wm/xeX6V3FqZCIxIpE6otKTaLi3fNeAu0SYYDgYGX+lm7XzdgjM4sJ97Z0GuW2zS/UvlFrY4XO+p0
	7cPRiNgefGZxl0MFbl4vDem4KG6ugmV9QyXgGmmAejLZgKCIRKdIWbopOLx6WRi1P3gPYjUyP14CC
	gLHZZOL6y3+p7xBy/muQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNl-005Jh7-2q;
	Fri, 25 Aug 2023 11:53:41 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNe-005Jbx-02;
	Fri, 25 Aug 2023 11:53:35 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 25 Aug 2023
 19:53:18 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR Controller
Date: Fri, 25 Aug 2023 19:53:09 +0800
Message-ID: <20230825115310.39993-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230825115310.39993-1-zelong.dong@amlogic.com>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_045334_056744_0237ABED 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add new compatible for Amlogic's Meson-S4 IR Controller.
Meson IR Controller supports hardware decoder in Meson-S4 and later SoC.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 3f9fa92703bb..0f95fe8dd9ac 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson6-ir
           - amlogic,meson8b-ir
           - amlogic,meson-gxbb-ir
+          - amlogic,meson-s4-ir
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
