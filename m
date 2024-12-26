Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1AE77188
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2024 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75jEK/GonsmbvgkCWOzYgl72ggzhXbhfDuGAzK/bTNY=; b=pv2GpCkOI3mHC0
	JsJJA4P2S9+WBtub1IxmCXSfUWkHG7I4fVVzGpQWdtQ+G5z0LB/otw/Jhx0Wo9ITEwOWwikfTK5f0
	P7NunEG6CDgeYSU0tN/Hl+eI3zXN5mv9LQ8HgxhUlPQzv8+hFDSSKJXlUz05MxzKDbeJpCkuvm3Yf
	fvoqPzv8wG5sfM2fW0vfy/2tddpqZQIBktdUPpG0yZeS2h5y5fYxiZdvOTnNLeGvhZ67vqt5cpZT9
	4oazdLqKhdUB9Y9x8pZZBCf7YYqXTRdubE7D/8ta6l9g/uFiAUHo3fTnH89lRVsfD4KBMdoQlDx24
	PEwyAR3PaNX03P+qTazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQin2-0000000FRCQ-093p;
	Thu, 26 Dec 2024 08:00:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQikd-0000000FQk7-3DkN;
	Thu, 26 Dec 2024 07:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECA20A40D76;
	Thu, 26 Dec 2024 07:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C773C4CEE6;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199866;
	bh=BIBrJL109H6KPuc+9XD6oy5aeMe7UkZxy1rC+jwAgJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjYRt5S56KSW1Mch3gmqcdMIGSvNR9Z+FoDehJyiZIyf9pT5cGDdd4B5ku6oiMV/a
	 fVp8Q8ahJwlZ8Stk1uoIwMr3oCmlswwRX9FxGIUAZGIp32KWq9uWxnS11baCutYh8B
	 xArHxHAzqtIyXdm5dyKoz4Z5hCh34nsRX6jVQNWlfUiq/CWmx2d/SjN3C7Am+Iamrq
	 OHdVIYeEExXuT2QgA648x43oMuIL7jPMhXDtytOnOyNQFVFRiAocdRCzv0vwwTmIHM
	 ERu25pYGcDufPm6IT9n6ODonrA5086I2CoIo8ijgCsHB5TIAxsXi3fDTvLitWcRco8
	 /uHu7Z2rML1VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB0E77188;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Dec 2024 15:57:45 +0800
Subject: [PATCH v2 5/5] MAINTAINERS: Add an entry for Amlogic pinctrl
 driver
MIME-Version: 1.0
Message-Id: <20241226-amlogic-pinctrl-v2-5-cdae42a67b76@amlogic.com>
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g90Y7KQss/y457N73Cj7ZyZIWWG4o61VIHvixhZOt74=;
 b=g7cEZyocn4mqnd6iOldMmY1d8HKX061PkPn1cFi+PZoXA4CRexByOfogvAjfEpbFFGbKLGHSp
 mtAIA0XZoJkDe/v4ozAil03zcldXydKzNj5hfS/5UxSKud1yzxy2Fas
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_235747_884689_16A13F2B 
X-CRM114-Status: UNSURE (   8.85  )
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

Add Amlogic pinctrl entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..b8905e8aa802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1218,6 +1218,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC PINCTRL DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+F:	drivers/pinctrl/pinctrl-amlogic.c
+
 AMLOGIC RTC DRIVER
 M:	Yiting Deng <yiting.deng@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
