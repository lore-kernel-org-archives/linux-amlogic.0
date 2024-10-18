Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32380D2A53A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2024 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvRfXzgHGJSbJhXmw5AaFR14+I3w0AoKvLG/J8W+vII=; b=bwJZBqliqjEFmj
	KQxryEOrzPXkck3XUEy+nozyKdnIROt2lCwQG4b+4w06LwzwMW4+MEQB4xnZbUWsRUm8gGD9Is/VQ
	ZlrAI4RATic7mtFztpPYU2XT+RooaKVj6uYUt65HUS6pg5Sm1kYqSaNTZGySRD1q9/JWhRoOhvsh8
	g20e4Xqbwz/pBBT3UgiZjMlF6qBb3uDtbKlk0V0hnpSVeCtmA1z+OfBonLArXbBjC91q28w+pcnYn
	7lvJXd3POwxisVVhRI5Xq0bkLYqbV46aRpywMlTVgAtEn5ZYcxxfEOLx0Env/EALycIP2iW6BR35q
	OvZA5pzbPmF37qD2cLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i9j-0000000HTXF-01kJ;
	Fri, 18 Oct 2024 08:16:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i4V-0000000HS9e-0yNm;
	Fri, 18 Oct 2024 08:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03BDBA4186F;
	Fri, 18 Oct 2024 08:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E7A3C4CECF;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=0jSZIq74UoBUGP7sVuPkM+U0ov+Rh81ZaHUpjUfRr1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NW43lSKEVVqmmj6zeh0xKJQv/zwcvhdRoZ0akAAS6LEV6hoSQ0WD3KffUj6ioOKFg
	 9kEvnHHYVJDT2rztqn1lwQrxNg1AGFFRz7bI0KdvUyJ9GpWXxp1WfHhP7UEgZzqNzb
	 F175ZEOVeYUPzygRGQ8pNCNpwmon0dVJ+62PU0Kjy85+sTdlx7FMgNn8uk/p33tyVK
	 9mOru02j20zhvHBOXoVP6VSYPTblXAmORzBQbS/WeQKEJkonqwiCSxznP+oIY6sB6K
	 V1IXdGqWGe/rpZyQeWh2Ob0KcV6098p0+WjDJtYhTUx8U6QMJeWhIWzcX5r0N9kg5v
	 rZPQVIOcWi1Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B95D2A53A;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Oct 2024 16:10:50 +0800
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
MIME-Version: 1.0
Message-Id: <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
In-Reply-To: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=946;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=erHuvYG/t/AVd4eUd14dcFM5SWvZGqssHP0bU7TcvIg=;
 b=QQK13099mw5FxDBedU9SIlHR292xdMjHxwMhyib4JdFOStJsapbeWZd8kEfxU2YcA5scA5VLp
 49+oeQuh/YxBxPGr3ZTa94juPul8ps9zbb4i1/314xKn9J5AbgAsoH9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011055_416397_3981D946 
X-CRM114-Status: UNSURE (   8.95  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the detail pin names.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
