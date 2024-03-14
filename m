Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD86C54E68
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLBZ3fbm1NgHcKY60APffVega/MYuoDB0Iyp6pS3d5s=; b=lxDPLCeSXYpWge
	PGjPOr1XqKISfdWlBDkjfmd2xtAQwcK7cJQSXWYAmer+JwVziqyQktnVQNLYzR306dvfbGSR5EdYM
	VovrzLjjS8v0byfTi+wV3ZT2boz7IMNYrphiRqHUutE6UzSd1PdtmcPKxPNFYMKA51xFT19K3HtB7
	D4+pYnU8D8FyUHqB4LY4B6l+x/qPMxCoTeJJtdgW00aawWxQrusTmEtq3HocFslOj0fGmRWT4VNPM
	Xqvt7tfasTAQ4dTex4NfW5bBK+srrZmWAE9VGIBdSCKse2KSr4MS/IxwO0mZ45dVJU7yK5m2bjqlC
	OGQB5jlb3sdy4BFCjCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf97-0000000DJ2y-0V8i;
	Thu, 14 Mar 2024 07:04:57 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkf92-0000000DIyA-0gdE;
	Thu, 14 Mar 2024 07:04:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BF1111E7BE;
	Thu, 14 Mar 2024 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1710399888; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hLJvt3Qp8v0w1uJwmrYsCccfbrCeUtcFvurCzwm/ryk=;
	b=TocRm+ykLpsCPYqYE3T8hXjKqsA0qwqUm+Ix5gLl6uNOAbZB72Po7n33jRx7zTiORf7ShR
	u3zi4USJSHrPz/Vsf+6hYo+g8TntR1ygN1Sj6KHURB9ecA5X+m73MQcz7RCi+SHIoS28Rr
	+alHsA339XTBGZL8LJ+d2RpMdgibR7WN7pojCMP/UZjOZdrdo87hHVtN/r7iRWQRyXoEHp
	s6K6YueDssjm+SktCobZ5m9J/gX1XyXpC6OVvv7JGWNpjA8GpgdKdlnJ6ihpaXjYTlBEfV
	ffPjWWPMdbND5UbsRSL4Fu7mseRwps4ftLw+3e3Z+5yrPMAGSQKjR+k/DRzHag==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/4] soc: amlogic: meson-gx-socinfo: add new definition for Amlogic A113X package
Date: Thu, 14 Mar 2024 09:59:53 +0300
Message-ID: <20240314070433.4151931-4-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314070433.4151931-1-adeep@lexina.in>
References: <20240314070433.4151931-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_000452_408476_D460484C 
X-CRM114-Status: UNSURE (   7.32  )
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
