Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB651C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7888A21479
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iZwmJoIP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HWrLNOSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7888A21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VKCxEcqFoquJk7uLi/DnR0ACuPDYEl4Hn9OFK6Ff2vg=; b=iZwmJoIP6o75aX
	29nf898aspFP0VY1SVbIADncXajIbPcOMAEjibCepBmh4ug1VVclPm4I+ORIBZGJkvr4xU/bldyrc
	K2Wf35Oegwk1rulBimyxiwkfD5QdwysM6UiTAMYKFhvR0s6KMDM1ZM+Du5FC70opal4pgKzvOHa8z
	edoYFtoCWL1yCzQWygF0LRSg2qYCCzSW9yi2Wb8rkg8CIcqvTE1akf8Y6aKTXDFZlyF6DYxIf9q1x
	fVHUG3VFgc14zvNbuF7zXakfIq+LwkSI1MShDk8wnyGviLBejWwMw4+5bzKuiuGrD2xW2vFYq79OU
	8RDFcznXvQLRkQTgLMJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP8iU-0002To-Bv; Fri, 10 May 2019 16:49:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP8iR-0002Sj-4k
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 16:49:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id f204so2794346wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QD9hBkezx95+dQeemkScJZveM5ylPZcSzzLZ+VBuxxE=;
 b=HWrLNOSW7RlVAi8RnLDx9KvIJJknkMjmnYmZy9vW+1r2Ma2dQZiiDk7bY9t/f18XlA
 ruQW4Pgi+nn4UplAbSckCQl+rTWnKc/XFo3SAExVvYIUksfeRGB9IXrglJt27LbXWzDx
 UfYVUOBbUBaPkIMh/fXiKGzHRlaGldrihSDv5LwkaeLgbDZtfimsklmxo6juBNUUGQsb
 rLEXRDRLc6qvjpYDGaFJPEOOKRW9wZKGuGJaYhFFKNywyeiZsTT4ui4rH63GDiNoe1lI
 ADhN+LhC0aOhapH30Ta4zLY13kfu50mhOI5VagYLrUorRUs3lGZQYRcDuA6WPmn6G6vt
 M9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QD9hBkezx95+dQeemkScJZveM5ylPZcSzzLZ+VBuxxE=;
 b=f0FryJX41YV24CereiagoWyl4X9tT+hGonaEWuBlE/XAu3pLySC7j4cR7NrRCsJ0mZ
 38cQX3xRGOZo5GMWJqqGtDesG+ZmR7DdiIeNYXbq3MUJs+v+Ynx9gjURSQXn2Bumwcex
 xcUX50B/HeFxxIJHbV8xYtcfaLxDnF26caLNUfVHVk20vSS2hF4ZMQyxSSsyCyQZd0z/
 uTgGfB++qSWVhxlZNu6Lq/h/WEt6LaQ0ZS/fb0exhnIamftySAFkMO1Oih2TFBz6BJ9w
 PMK6Im6A4mJVj1h/L0MpRfVGB3mrvLf5yk0xeGL2klksy1JrDDzRhFPIphjmyjv2zDgl
 PUIg==
X-Gm-Message-State: APjAAAW95b1Vk6hefVEbC65cnhtxgitLeimHTMLD9dgHVR+/5kI/ETnk
 IX5dR8Og2ty9bem/THmkzhld2w==
X-Google-Smtp-Source: APXvYqwUEF4XTc72WlhD1gJI2eKGwCeixpKjDSaEsM4YUTrNZXm/BcVU7KxsNOWWwpGU80rHKeaNLg==
X-Received: by 2002:a1c:730c:: with SMTP id d12mr7423745wmb.47.1557506985321; 
 Fri, 10 May 2019 09:49:45 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q26sm5114308wmq.25.2019.05.10.09.49.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 09:49:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/5] arm64: dts: meson: g12a: add network support
Date: Fri, 10 May 2019 18:49:35 +0200
Message-Id: <20190510164940.13496-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_094947_187264_A7B2231B 
X-CRM114-Status: UNSURE (   6.40  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add network support for the g12a

Jerome Brunet (5):
  arm64: dts: meson: g12a: add ethernet mac controller
  arm64: dts: meson: g12a: add ethernet pinctrl definitions
  arm64: dts: meson: g12a: add mdio multiplexer
  arm64: dts: meson: u200: add internal network
  arm64: dts: meson: sei510: add network support

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
 3 files changed, 104 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
