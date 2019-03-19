Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502FDC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A854217F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAdSF5Al";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KHSBv5wh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A854217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvfayI77I+QqV1awxhkrwCSwsktCvoNUe8+L0qOFFaw=; b=eAdSF5AlHCXWom
	ngnh/w0HA1J0drRuM8nmomk5egrxTa0C+fjXgkmEQnbw4WJDGgsGfwVdmVcpMulMbfzBHhkoy4Oot
	A4JZL3LhrEljhULrMJhG8HqgMMkK3qkhn/sNaY6maaWLHfcowSODAlJY9A/Ejce420FSJOTlx7b2P
	XLlxRrDkX1MP+yPkgSqlYuY/717hDb9jfytdNR+Ka1Cwl4Fk1vf3C0tLlhjhQYmTQqHAfH+4ISKuU
	D4fihn9W7kG6Jtj4QOlGag8C71enml42BS3uWpvqn9z5aFKJA6RvrYVKQJBGX6U39/TlnWmzW3lFP
	ZFSchMmqA7gTmUtIJhXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Mec-0000R1-QH; Tue, 19 Mar 2019 21:52:14 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MeR-0000D6-7u; Tue, 19 Mar 2019 21:52:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so541362wrp.2;
 Tue, 19 Mar 2019 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aX+bb8PFceeKnvljRRNWRZVPF9zpndQkTw/LqXznMw=;
 b=KHSBv5whuIBpgvpLhjjokLmLSTEZ/uXVHXIO27/PtQA77s/WyBD/kG45tsgx8EsgeL
 XigvDO3WEE3UEf1vW2WrXCYBESSs0LrdKuJendT0zMebn5BnZvr9x5XTPB1au2iQQK3t
 tf6MtK352ymubqR23+0h/SZgspopnqR2TTdATpIwFz+/I3H/IrHM6jjHwHSLfUB29PH0
 iSROYilOPuerMwV0rRGIAo2wA4vtz4IOZyrVsviIF89gDFTBPgHXJDL09gCkO6dN5TMH
 jVzFecNgq+epxyowJIrO4tkX62zMfd+ZDTaeJvkHlEIZdwDH+LdfP5bbEgZTJgu2/JFr
 UFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/aX+bb8PFceeKnvljRRNWRZVPF9zpndQkTw/LqXznMw=;
 b=jtD7etg6E9ZkO1uXiZJsT7y2SHjMh2W4Hr0iZNIbvC4suumaNUG5Xl9hTTi6Y3gaCP
 Wd4o4MSoMLz5Xvjqqa5BVDVnS64a2ttxITSsEMDEjeZZxQ2QaGRAu5P4u4GQ84flwLxI
 SNYWtPremWpo3BcSSn41XFd/WnzfDbifxWywtIaJDqwwg4/wxoyw2Si7NyJcKe+paMGs
 X98no9WTUJnE5hy+ZrTbHlTkbY8dA9ut7qigzEgEsv1mG8TReCd2CXhqBrFfJ1aIUGff
 LxLS7qJDIXyrODgjDI8gNEpc4UsqM5ofLii7QJqJuE1j8oip1IEXV05O8B3A4mewprO2
 78dg==
X-Gm-Message-State: APjAAAWGdkt42EryDER69baCswC3IdQC1O19nntSc82A4WXU/NUZTU01
 ptPjHtdfhKF8VnLD5FYYeMk=
X-Google-Smtp-Source: APXvYqyQKqYVcz5jvdlqpOKm6it6HJfktMMvQuJooMU5aEuDoNCImynWbDshqwaRl65+djtMJlqqZA==
X-Received: by 2002:a05:6000:1110:: with SMTP id
 z16mr19302668wrw.28.1553032321847; 
 Tue, 19 Mar 2019 14:52:01 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id c8sm56050wrx.6.2019.03.19.14.52.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 14:52:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: clock: meson8b: export the VPU clock
Date: Tue, 19 Mar 2019 22:51:18 +0100
Message-Id: <20190319215121.29340-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_145203_279168_374037D9 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VPU clock is an input the the "VPU" (Video Processing Unit), which is
one of the components of the display controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index cd11628f50f8..2ac9469a1c27 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -107,5 +107,6 @@
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_VPU		190
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
