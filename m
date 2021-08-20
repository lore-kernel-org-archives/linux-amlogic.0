Return-Path: <SRS0=Ufe6=NL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1021CC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Aug 2021 02:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A535560FF2
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Aug 2021 02:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A535560FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=djy6moUqTHfBMNLwxG4Ohbw3LmtBSqGivnZKnS1aeF4=; b=oZ+kOoFr8BjGrS
	XKSf3tPU0qRSBtm6Kia5cYnC3KdYxfdCtvo/aphFvcud5mh6IgrcgTY+Re7XywiExnL287UvqJrXr
	Xnni6D0jMsGW4UrfvPOOPmqDh2ZUhSZIIbcwP3lYRaUJ+AMBrz0iZeBWBbO6MQSkv71tSYpy8Ik87
	ArWSzLvuC0lUzPp+VUdmtCqa74cJyDPgAcWJcRG7vP3x3dJrM/L6uiKqly8YUpPcmO3ssdlUFa6tf
	shc1SORet9zpPJaTSmMqmFksfU+2aWXtw+O2Bv42l775aFR2/PBw+loRhelxTisY6b0fuxmQ9UNgm
	VlfiZILafghQ2ghaARqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGu7H-009tzV-BB; Fri, 20 Aug 2021 02:18:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGu7F-009tzD-07
 for linux-amlogic@lists.infradead.org; Fri, 20 Aug 2021 02:18:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k29so11830378wrd.7
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Aug 2021 19:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dk1s23EK1RCBH+7+areW88M/uRoQk3BnGDbY+LNQdsA=;
 b=RNwji+Rx1oGwb0Bwuqtys+w0GgMB+xyJ4V2NhOAbS8IKkgC0v/vLAn/jf7u7lCNF8M
 12LhtlQy556yUfzXAxzuzRyCra7r6eeckSUpxIYOj9Y5nKmzUHzULWooWc/pIIDz9cm+
 1cP40HZIrxENrhnB7Zn9WzVx76PTyGI+UTvZyWTsTQVnGrrvtk9nArhKdJ2VhVipAiy+
 JQlD/TCsPcpKe7kr0Lh1iIYIfuKxlfSUxG1zBdn0ULtN9teYk5MePJVFRGprE5yJNsJn
 9zsc3DI/c8g2riT1kYZPzkLneka5i/L1cS2ufByV8cGPsAufEKwMOvhdHS4dA9K4xS50
 mMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dk1s23EK1RCBH+7+areW88M/uRoQk3BnGDbY+LNQdsA=;
 b=m3Y0S/qH5PSLYSfqhByc+giJCg9U1pIU0CJif4IpII6vuGQRYq3dc9B1dZKGBsymMJ
 GUyuoEg6PxbubzoOn7EM+CqCFv+qEw1mjnxwDM3sVPNhPyMPT/lPSS+gPAKC9clppNuW
 B+4klrH173/c5GsoEQN/DorLjxVcmgd6M8uiRCHeMpUAi9Xtlow66dyofqGfWcI0p46S
 o1KXNjSnXN/FqjHSwzDWiFmHvDLYt18DW86kUwYs0MKlqPnpIxKmJoKEZmtJe86K95TZ
 pkjpAMp9irO9Qk/RfHboYacGiLAmj9DE4JnLrn9v1WMTcc2Hk3QXMMJ6zFr8khgyzrzu
 aWkw==
X-Gm-Message-State: AOAM5321A2ukd3T9I2FmGc3EaHL/Waqp/97x2WU2fE35stqXXbU+Mnna
 w4pD435Xwa3Qlc7VzCBDA0s=
X-Google-Smtp-Source: ABdhPJy29A9tZ61+S/MOYh5iY+mn5Pq1KGupscPNZ144aFmlBe40/GQ+ttKyXru5s4le0p2hHchiJQ==
X-Received: by 2002:adf:f352:: with SMTP id e18mr6904465wrp.160.1629425919479; 
 Thu, 19 Aug 2021 19:18:39 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y10sm9738189wmo.18.2021.08.19.19.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:18:39 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] ARM: meson: Add S905Y2 SOC ID
Date: Fri, 20 Aug 2021 02:18:36 +0000
Message-Id: <20210820021836.1024-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_191841_077640_F6473A5D 
X-CRM114-Status: UNSURE (   9.30  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the SOC ID for the S905Y2 to board info, see below for before/after
tested with a Radxa Zero board:

SoC:   Amlogic Meson G12A (Unknown) Revision 28:b (30:2)
SoC:   Amlogic Meson G12A (S905Y2) Revision 28:b (30:2)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm/mach-meson/board-info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-meson/board-info.c b/arch/arm/mach-meson/board-info.c
index d16d3f194d..2421acd817 100644
--- a/arch/arm/mach-meson/board-info.c
+++ b/arch/arm/mach-meson/board-info.c
@@ -64,6 +64,7 @@ static const struct meson_gx_package_id {
 	{ "A113X",  0x25, 0x37, 0xff },
 	{ "A113D",  0x25, 0x22, 0xff },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
+	{ "S905Y2", 0x28, 0x30, 0xf0 },
 	{ "S905X2", 0x28, 0x40, 0xf0 },
 	{ "A311D",  0x29, 0x10, 0xf0 },
 	{ "S922X",  0x29, 0x40, 0xf0 },
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
