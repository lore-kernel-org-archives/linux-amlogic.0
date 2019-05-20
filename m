Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABF5C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:35:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61970216FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 14:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i44jhhKN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ukY8+mEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61970216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ozP2JW0Hf40QkAUitQ3/TQnywGUMId9ccJobQp7vi3k=; b=i44jhhKN5vDuDx
	ChQpHnrmi5mpsFSCK1I5mmKtcrB4Er7MH+9VKeqXtztPvwWi34qfujGmxDAcrWhgqB/lYgd/4QL9q
	0vq+mWNV02i+MecHkOkl4NplgDISDY0YHttAhZ+I+qCrLFohx7iczzDzqCA1hFiyekM+AzGV+h54g
	SkhHonEJTXYOLS2oTjmYmVObWtDx+nfUCDscMxY2q+CvzjP8bxUK1YiNhVrk/JXtUdHV8XJ06j2Jw
	43wLdTV626laZMFQlemrGw9tXNUJhQKRQGq5Vi7kz0aEUlzMNa8QfwyO0yFo9FOY4PJv8DEpG5cKj
	lNzEZ6h5cpZIfUSsa2rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjNU-0001k6-V7; Mon, 20 May 2019 14:35:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjNS-0001iV-LQ
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 14:35:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id y3so13581486wmm.2
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T+BMa4gsX2SpWHDg4/WOwzhZkAoB1v5cWmwKV6NHcXY=;
 b=ukY8+mENM/jud63R4hHoyLnpb5YoLntE59nddqMWgAWBxvI8Ge+UqHnh2bsKJMcHrg
 z4bfVaI0pNwpaiTKqWx9fvMdMUE+3W1FE9QBzIUA9kpLOhx+VTOAniJ7Ys+sLj1VP8jO
 q5uurLzzFO6dmFja+ooLoRdGt9x6ZaUlsgBi31xyuSapXUPbNylOjSx3gBMPbOcPKU5C
 AK2lIN1NNbvyviI+UaDdFYkSKP/dtX468MCfLg/UCqGZQWza7rz74tCw/Gisx5P0N+/g
 UmU60+F+YHqLMfcdS1P+tY2ZDYVWXYicA6VdTFokP+cKB8ZC0ZmmLcb/txe/VdsBhJq2
 PhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T+BMa4gsX2SpWHDg4/WOwzhZkAoB1v5cWmwKV6NHcXY=;
 b=MESAshq7nizwSGAGNhjvYNSwNyppkGY3+BrwS51Ro0RirdcSTv5bGvxEfeJUNL2bTg
 80bqEgAHP9fdHg0bPXu92M88a+Cy7+wJIVBWGzIDcWi0kKT3Lt1JWEYCAjEUabVKse2h
 S6WAKnb1/BI9VKDHZVoeTUO2e3EfJMCIuIdRGMXnKl6SbXj2TcDSRRwZcIdbThIIGdcf
 ZMjSbiagZZcqG0gMpWu4Jx9TXcKUYtL4NjUAiluTw8CvuFx8krx+zaAjcMqjeoeN9zEr
 ewafLwMV1Apc9PeoYIPS6C0AG56bdIkHOXggmbY4MoXI8EHHnQ+DXNoCgrENF0Tn5B3K
 FUuA==
X-Gm-Message-State: APjAAAVgduIiVXa9c303K1lITy5a5RoqmnNSXpCyNMLj8KXyINJ1USxV
 B1Mfi1ahY5drGP7rJnBwzMk4mM885tP11Q==
X-Google-Smtp-Source: APXvYqzlWv9ZU+3BpEhFfR0ZEw53esmcczKsZgnkpqrvwm3DR8JioPy73X+ScQPOKEO+mUDg1IMuKw==
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr8758291wmh.148.1558362896292; 
 Mon, 20 May 2019 07:34:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c2sm12756186wrr.13.2019.05.20.07.34.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 07:34:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: davem@davemloft.net
Subject: [PATCH net-next 0/2] net: stmmac: dwmac-meson: update with SPDX
 Licence identifier
Date: Mon, 20 May 2019 16:34:48 +0200
Message-Id: <20190520143450.2143-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073458_713683_65C345F3 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: netdev@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the SPDX Licence identifier for the Amlogic Meson6 and Meson8 dwmac
glue drivers.

Neil Armstrong (2):
  net: stmmac: dwmac-meson: update with SPDX Licence identifier
  net: stmmac: dwmac-meson8b: update with SPDX Licence identifier

 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c   | 8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
