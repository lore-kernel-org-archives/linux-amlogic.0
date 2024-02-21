Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE73C5478A
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLBZ3fbm1NgHcKY60APffVega/MYuoDB0Iyp6pS3d5s=; b=PNrxW7J2mpYc50
	lG6+WmBWp0GXhH7rgqK2zVLU78DwSKqb0NrpXfo4nNq38qDIaUtrxJOcnWn+/Y94MB6PjBGVR85s5
	ebfiksO7guK2HDgSg4B9p0lz6Suv9OhFWA5RpgoIOEa74Ra5iFwdscE5F73j18XYUytaZWgGVmvND
	ZhIO9IkCfMwOieODnbV/jShhByk4pUbzQM8uIU7XeKYICCDQuvwk2EdVcQriGvhVt0XT+xUjN6G1I
	xX+LRuIp0yrUWJi+Xu3rM4D5RvhCK8N8er4rb1/jZVrytPktpmBVGvIewFo42REYxtzjI4QFTBOGH
	Y9mSXxPadzYnpOKrG5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnim-00000001J34-1tzT;
	Wed, 21 Feb 2024 14:37:16 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcnii-00000001J0P-3Zlh;
	Wed, 21 Feb 2024 14:37:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE5910D835;
	Wed, 21 Feb 2024 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1708526229; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hLJvt3Qp8v0w1uJwmrYsCccfbrCeUtcFvurCzwm/ryk=;
	b=soKUNHFRozKgZhbs78Di9BwEv+DFo1m8s8wCoI0dKpxPLKZQbu0nA3Epg7DWutgUrOn/3T
	tYiKGxTa9ipWbCurbuOvTVnQtiK3Qe8A880bTN4ITxI7xZqz6DQIV5e0F6cQLk5+LvVLzm
	UeOSIfkba1zKKzyntwch2iiqNzVM3DoA4NHhEU/W6jCMfthwrlvfriJiBlwRTmh2XM+KNs
	X/I63zYloAio/4TGsDXBzO6mU5Z7Fmnef4URwMy9BwHaPS8Efm9ZzPkQsk2C8abv6JcTH6
	ztiT43pVmEAF95TVn5XzHes3DFqCLJmHXjxJnGjE6Blrl96ahitwrJVyyJghVw==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/3] soc: amlogic: meson-gx-socinfo: add new definition for Amlogic A113X package
Date: Wed, 21 Feb 2024 17:36:16 +0300
Message-ID: <20240221143654.544444-4-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221143654.544444-1-adeep@lexina.in>
References: <20240221143654.544444-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_063713_249348_586C3F08 
X-CRM114-Status: UNSURE (   8.19  )
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

Add new definition for Amlogix A113X soc found in JetHub D1/D1+ devices.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/soc/amlogic/meson-gx-socinfo-internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo-internal.h b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
index 3ebb80972fc7..2028101bb9b2 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo-internal.h
+++ b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
@@ -78,6 +78,7 @@ static const struct meson_gx_package_id {
 	{ "962X", 0x24, 0x10, 0xf0 },
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
+	{ "A113X", 0x25, 0x43, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
 	{ "S905Y2", 0x28, 0x30, 0xf0 },
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
