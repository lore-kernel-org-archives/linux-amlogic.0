Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5101FC10F13
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C102087F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EBKcYmZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VPT2JGmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C102087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beXhlpzTR2fWRR4UeUtTX01U+ndlSE9+LsTLQQP5/QI=; b=EBKcYmZ/cKgFCO
	/ExlvmatJXAt7spGLFjwsYORmz5wnDlf3DqRl8kpUCfTAcwqd8HsQ4pJda/KkpI43FqKFq71Fjw+S
	xL5oZDE9ThiVrLAIaho9VSQ94ARq1XZXZ0d2/BlzUyIZhBSDR7mz9mzqFYxnokTMjOHlJ0oaWM9rP
	4tp0CZTwg4fR1pzOEZzhw5/HbgtGjBzYMMuLzoL1cSJJWoOtg6+QPhfkVbSZByBgl9IFMu49GkzyQ
	HRw4KSGjS7h3CtaRu286flIv/g4NFAKHTQvMU+SqHM5YMDopgYJoKsPpsOW6KVdBYEL5cCRNHEhnv
	ssSc7aktQ40Qw40CBiqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDTEs-0000t7-0Z; Mon, 08 Apr 2019 12:19:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDTE4-0008JX-Qm
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 12:18:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so16160109wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=VPT2JGmAYDF+yKPBVoIfnd/yg4NoU7YOxGEtNRNMEJFQm5vmwcxcD8snhRCJFbidRY
 hNG1lDS1IuqXMGJjyeKTZx5+rI1ZszXaVAAcJOli39iy/jyx/CuUtITccCk8TxqgAoMm
 FXL2RV9cQMl/IWPE1Ni/7ops6y4N3zzr6QnD6ruvvpyqRTDQ86BRIxqbvlxJQ3ETYTem
 dHuLKzwmoHqmgp4lnsjHxvAFW+Y3HvWxQeGcc4oX39Pii/BT0xMCTkQgqT5SYP7EcrDa
 QOdGSV61WYncnZmhDh9RMHfIDiiI5RY+Q8Sst4JevH/13wrDfG6EedmJmwv/BcnrDfYe
 6l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=bqi3lHxAgqBPfbGGqkMGit0NotzSmVLRW2GX9J9Y+/2draSvMNr/LvoEUsN8Yz8ZXz
 fzzME8pp1YnaxRWrAyjgolx/3yXgR8AU2uF0wv0jb2kuZce2TSllwBuySj/0RQlsV2Li
 hC/Q0u7b46wz0zZQURKBQN+1O2jtVzo0DbBZqBoqKlzUTbK2UajDI/50JA1tqtz49bbu
 Wji/Z/YaLbSUJR37YDbtwwD+EEX10QqmGNfz7hl+tKCpcspNlJRWdOsskk6kIGIBpVT4
 w5TMBzCnZP+VYQ6ATjPQE6V56BPz5R9GrWHkQMJbCGIj5NgNy6Iz9ujF3FhhTBMdu97/
 /aSw==
X-Gm-Message-State: APjAAAV5I8f+fqjmjDGqpTGTTgozNtGHOKfJzc9XpZEu4k08UYYE6k3/
 FD61X3dScZYQm4V/IseY7OtHTA==
X-Google-Smtp-Source: APXvYqwyt7lc1mSGIiZXyDGsPcskW6ZeR7K7ew061RPI21s6se9xOTay+n2VdA9Vkz4v3sJgtq7RYw==
X-Received: by 2002:adf:b458:: with SMTP id v24mr18407625wrd.46.1554725890968; 
 Mon, 08 Apr 2019 05:18:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e1sm52865103wrw.66.2019.04.08.05.18.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 05:18:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: Update AO CEC with ao-cec-g12a driver
Date: Mon,  8 Apr 2019 14:18:05 +0200
Message-Id: <20190408121805.2870-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408121805.2870-1-narmstrong@baylibre.com>
References: <20190408121805.2870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_051812_985450_A435F097 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the MAINTAINERS entry with the new AO-CEC driver for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..bbad8f3ee3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10046,6 +10046,7 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/platform/meson/ao-cec-g12a.c
 F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
 T:	git git://linuxtv.org/media_tree.git
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
