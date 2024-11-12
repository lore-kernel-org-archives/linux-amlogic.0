Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2D6D41D46
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkmSC80HGTNoNzUuPpfWmBAZizUqOf5eqX3WrHWAKB8=; b=vf0GdNqi40Muho
	D2bSycAAeSHhvjg17FL63pSwfO5L3QR4OT+uB4RHYRA0+TnrQmznD2/jEllGWiX6Ox+FfYwlVbP42
	fD168U4sJcGv9i8j7v3jYDTPHvkh0Wve1CfYOyVUYNmyFHqEW0le9k1UypZHvKmq1GQ7v2qP8yf7H
	j9XkVdTgrOI9IEiqTAP8r2G4AM5OFDqN9vKnXTVEcDlCuVT08Eq0es8WsskpPQlmarJGmLi8SdNn5
	2vHqQ+M1tZDa28MpqXytayB7YJhrBglAryBk4PzEaXg2KHavbkgcQcOzIHDTRh3jqiNF/qV7zxdvG
	ySptkggZGJn53H5GAk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhIN-000000022bJ-1jJx;
	Tue, 12 Nov 2024 03:10:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAhIJ-000000022Yt-3jMC
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 03:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F0EFA402D2;
	Tue, 12 Nov 2024 03:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30992C4AF10;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731381018;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f/bIjYvF/nZ6o8Fps/kS0C6UFlZGwQfhJQJFusR+oPfENGgTR4OBf3xHRqR2/tl3g
	 8TdiuyACyJFkOGzPFS7kZuAnisEELWIVeh93VhQ2CWE+P5uMzCkwekrs3qOLPbDLv3
	 pWbA/mhzb47wehubpIGLLwhpXTwM5C3VQ/fLCUNC/nYwqfeh3UWRRyDaS6MWGaegaB
	 IKRESnm7mYDZ8kOTjZBo7r0MMPYX6zS+JjREpv2yjPj1WVyI1fwO2buFwArKPYRgT6
	 419mWbNNm5cCs5fq+JxlipvX5MSPlv6t6JpmflyFSDoOlJ4V7GvYuHKkVTujELmKl1
	 Jdl/+8uce7Brg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23621D41D4A;
	Tue, 12 Nov 2024 03:10:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 11:10:16 +0800
Subject: [PATCH v6 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
MIME-Version: 1.0
Message-Id: <20241112-rtc-v6-3-a71b60d2f354@amlogic.com>
References: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
In-Reply-To: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731381015; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Gn6Ya+wBxnc2VJ4I38RsdaXoWkK7Fe7p7YGOFyMiaMc=;
 b=+Dw8a0HzDmMQJH0sX/GRskjZ9a1Mnzshf4iUIbwZucRCh5cCAlPCMBtlUipbZEhPVHUJ3xxnW
 2H0vSdoXjj+CyrfUG7XGEHEV5JRpAo+xjxFQauP3Z7uASm7Pr1sUd+i
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_191020_063539_D82A841F 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..86675e03888c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1209,6 +1209,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
