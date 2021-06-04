Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A0BC4743E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 19:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED9D6140F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 19:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED9D6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aPBYA9hrrINAYAVFlHKv/MN/INgAMdIt+APJTXubxE4=; b=xBbzdkS2IJhoGP
	u+U9LNSc9ylUgtpEhgnSVYYKY2Sk8UV9ah3nosX+TISAAaJpNRFll8WHHmKhPCy5vJDFGuS7pe+aG
	SYDjBBrzuD7t1IFw7PwIOkTSNz4Uz1DJzyly1FEFAxjEGm5G+ml5N9HJ62DvoREQrO5mFDM4ZRUpf
	j9fOVlHmEtZ7asLDZhTJDmiWYZq2/iay331l8F7q/izSEso9YcHR9KUqlMnUh2U2X/8n3i9uuXuUw
	kQNAj2sNUnuDdvCw/BqTRKqTLo7uqrsbf3Ejo0yFb/hIUiAgnLpHg8mmhQXwhIfFobF9e72n+G9cL
	rkjDP/JCXbzgIVn71bMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpF6y-00EvYx-JC; Fri, 04 Jun 2021 19:04:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpF6s-00EvWk-Px; Fri, 04 Jun 2021 19:04:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so8495742wmd.5; 
 Fri, 04 Jun 2021 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHU9r9qJ7f3y57BwW4Qkv4q6Btiso2T9prw5IOLS5+0=;
 b=awJgxzWxRYr+LdcAZSkviGJAdgq/iNEGo2VfwjyUqX4jhUfsImih8lTVTe4yKgS2ff
 tb/qWbJFaRY+V36MbIXsqH6zrD/pcFFtdpaamZG9hejKjWnfyKLAaTO2uI51fINYqduQ
 hRQFfBdMsTVijvJ3BrTanhfu9oK5CRvflEdcZn5BDHykVzIQ11m6CEzX7sNoDttwjBgv
 FzZQJhprNVpCShzBbM+sbc7xK49S/AGUDCFLwNbCQt0Z1l+XrKUzoUjCWQO7S+xjNeuI
 e6AYXboNnN9ZiH5Yn5ZpVHkInkmx8VKcKboNZAcWJt5mPnxW7HSQPcSXhFvQSCGKOXRO
 EVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHU9r9qJ7f3y57BwW4Qkv4q6Btiso2T9prw5IOLS5+0=;
 b=JdPQPy5mXtbx1a1kIpPn5TP74e9mqL3GLaK/I6whLImVNdXfjv0iJIXuqAxW2CDwff
 TIEfyga1tJ1A3Z5R7z6WXyVpxJhZPrqz70fUeXMGxTOl7vvzmZtkZ4bH7/atruF2sOu9
 wI+Iy/IMk0HeC2e6q7FiyZ6QfaDdXlv061xCC4vlvPaEGeyb4pSQbCnHZ1aZ9tqzhkrh
 P3jphMXyeewYmrcL//KVf4r7IR2xoTLhRdx59h9yYlZiyb9CUJlCAMtxYBFrU95+qIxf
 qmpMNmVexftQchanDTyFvKk2YOo5spjNW1QYUAAf2mlnFi4Mdogc28KSfRsbXl9o5SkA
 pinQ==
X-Gm-Message-State: AOAM530dbbqtjyP3MC3OTVcb10pdWKXaEFezyIIkVjatk2BXGZagipb+
 BrDhLZXrr/f3jWY/5hPs1M8=
X-Google-Smtp-Source: ABdhPJykGZ2XaAh+6nd5AWh78goWmo9NEO2GwWjbKCccA/e4aZpvDtr7jUVgMKUMCOXcYM5PtPeIbA==
X-Received: by 2002:a1c:6209:: with SMTP id w9mr4977091wmb.27.1622833435509;
 Fri, 04 Jun 2021 12:03:55 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137127c00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:3712:7c00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x10sm7576200wrt.65.2021.06.04.12.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 12:03:55 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: kishon@ti.com, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] phy: Add support for the HDMI TX PHY on Meson8/8b/8m2
Date: Fri,  4 Jun 2021 21:03:36 +0200
Message-Id: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_120358_859162_B1E3697C 
X-CRM114-Status: GOOD (  11.66  )
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

Amlogic Meson8/8b/8m2 SoCs embed a HDMI TX PHY. Unfortunately there is
no (public) documentation for this hardware. The best thing we have is
the 3.10 vendor kernel, which unfortunately doesn't document most
register bits (only a few are named there, the rest is all magic
numbers).
It is possible that this is a TranSwitch HDMI TX PHY based core, but
this is pure speculation.

Adding a driver for the HDMI TX PHY gets us one step closer to video
output on these older SoCs.


Martin Blumenstingl (2):
  dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY bindings
  phy: amlogic: Add a new driver for the HDMI TX PHY on Meson8/8b/8m2

 .../phy/amlogic,meson8-hdmi-tx-phy.yaml       |  51 ++++++
 drivers/phy/amlogic/Kconfig                   |  11 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c      | 150 ++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c

-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
