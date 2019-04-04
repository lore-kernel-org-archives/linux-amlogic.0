Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B99FC4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0552064A
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcr86g+v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="neSqcjcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0552064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNK66OeBMCMCydNd3jke8UFuhJCKyXS+UBldqllaKiY=; b=pcr86g+vvSAmvD
	aVuzsD/JjaSfbUgSRDmEiZZ5y6VmX5Nk5xdtWRmXy3shO9sTrnXJCOMHpaGHziVcAElgQl2EUdLS2
	NZEQdBqrq36Xyr4bLmpx/qzLxCM2DIdNmcppwakvEHMDzpCTgIln7zGeWXUQNPzpqRLELNeQY05b/
	obR55zR+ebjcYNqDGxauj+A4OuQyI9KHoZ79zQOCym/dRgwTfkL4iaAJXgdWK4cKCAUhZU7Sm7dTp
	eDs7fBeeIJxW0wn6/ePXmkFCJDqhZGc7xLbuJVlDTVYSmOrpXHDKGJsaPpYh1chawyt5ANnOdaE0+
	VVo46FKR2N93Zo0C7YDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3wp-0001pg-S3; Thu, 04 Apr 2019 15:06:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3w6-0000iC-Hp
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 15:06:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id c1so3453612wml.4
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EC6v0kUAyj/2brMf9x5R3hSBJyp+HfoUAkCNqMMNaGo=;
 b=neSqcjcWcOTg4CxJjx0bPJ+Z0UrOrGMM8WWcp7SMFfogJ2HZ9h+k5PzEH+Gd96Lspe
 qoey72dClXI7dDEVrMCopSgyexgFvwhBhNdJSxEPrIZwy1R18yzsizrd22MNiWkYaCUi
 Y73zwPgsx0X5qxN1YsoJO672Nj3IY9e/rOWACP9BMFnKNV5nVMZo9plt2He4WkQYU6aa
 9Rc8w9JybwViBKGGLTxZdHV0W/0BizVg5zXDDKITJyyXHu8nlC3Jasv2VWmUvE6gRE9z
 rC9HKFQSzrJQWLrQB+6QQDzqfvzpaVIBOjC7EpBWWB87EjNOvejUQbDMup3xPrB3JsPc
 NR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EC6v0kUAyj/2brMf9x5R3hSBJyp+HfoUAkCNqMMNaGo=;
 b=Cz1vlthqBX9jz6DUTb6GBzeaYlHUb/elD8kIWN+JvQea4F6yFksyYrkKG7qSKPUK91
 Ro/D6KVe9K0aGa//tHKQ4GX5cqoaWgEd7cHVbYN9B4B9pz4nzs6QkRrN3duLDB8ciG/7
 hwao+UMowdRUZGnI6zA475kSDlXC5ST/v2GhTdu0hyJgRnnMUKlVPFmhLNBpoZ+8gv6u
 tpYbL47CgGE/Hbn3u3T69+YlRSkcSCkTH//p4MkfU3DUrd2fC++FUzCl4HmTL4ZzfNed
 9l9+dBxLe0I6j71kL3gjmozPK0DAwFzpmG+cAM8ZXIgoONTR+AUoWOH4Afk8k+KZ2Jnh
 3WNw==
X-Gm-Message-State: APjAAAVH0dZbMOHLoAhwuTu+ONA2rXyrXMCR62f6zN+pDpoeH+N3vILC
 W2apByfVSQArKljqBbyFuZVATg==
X-Google-Smtp-Source: APXvYqwNrtT4Iy+KiT7gIRwgMQEWnjGx8a4S9AWXpbrQ/tSPSTGTpO4w8Mmvm92gOzMt28npD0aIyQ==
X-Received: by 2002:a05:600c:2309:: with SMTP id
 9mr4636858wmo.52.1554390348857; 
 Thu, 04 Apr 2019 08:05:48 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 08:05:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH 4/6] dt-bindings: arm: amlogic: add G12B bindings
Date: Thu,  4 Apr 2019 17:05:16 +0200
Message-Id: <20190404150518.30337-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_080551_122166_32257AD2 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 061f7b98a07f..94bbcc646e10 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -61,6 +61,10 @@ Boards with the Amlogic Meson G12A S905D2 SoC shall have the following propertie
   Required root node property:
     compatible: "amlogic,g12a";
 
+Boards with the Amlogic Meson G12B S922X SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,g12b";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
