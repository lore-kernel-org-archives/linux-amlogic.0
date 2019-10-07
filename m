Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8C0C47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 05:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593E82133F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 05:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YyhGCsQ9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iion2YvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593E82133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1LPBig2HQfVzhB50Rv4MR3WXSUBsuUbULhQLuR7FUQc=; b=Yyh
	GCsQ9x8tG4rdza5D4MVlxzaHHFkNJ5vV1yuDHGIPHXkZq6SNxz407L3O/s3dRviVHjT5IN91i3ncH
	TOrGt7/nCH0QChc46QFa+XEEhZlLDoC2k40rK2xfu7wnesm59KlMEj7wT6qDHJjO3KrMbOZ9wLX+j
	8iao4Vx8g84udqLDEcfMjdmz9nIne5K90qSzq3FcpNkMyIfKakicSFd/krrQZCLH/H8Du7MN+Dzyx
	1S9kjbrjJlMutNaT61zzFNez7HryyjTtBaJzWkcrFMwJOpey91axjIdNNeBghoZXfBgVGx5td/Bik
	O3P0B1P8xHyrYq0ltwDPUW2iEVNK8zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHLVx-0007EW-Fu; Mon, 07 Oct 2019 05:24:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHLVq-00077r-Ep; Mon, 07 Oct 2019 05:24:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id w12so13542666wro.5;
 Sun, 06 Oct 2019 22:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Xg+QfBCXfzEbEahIMN/FjbGzkhLOtal9LzLwBW93FJw=;
 b=Iion2YvWLpU/q5nDVqVb5iNOn7KdQ/s4pyBAF9rWw5vHusRa0h+GUvX3iQKYIX15qL
 7ZukTRgfLDfTEsgZj1V5dSNHCcG5E0bUtz5C23zNj5mYl1XIZQNhYulE0OM2K1CDyG1q
 ANj2jOdjGWfjYfvlJLsMm4Bt4ZYcnoo7lsPWuEzzd3blVd/ijOLHk3y/IpJxOjHOJ7Qv
 ANppPm1EMZKjD9IBGIa3Vc7uPQqtdUFJytcOKnUN45MR+rI3gGhkJKryfw07XdDAJ6Ys
 sNIiOr55KWuGdYpQ2QoQBVWf9IQrubBiLGYCAGrK0JqyMMyfHDFT2kaWZKXn81iqLJ1R
 Z0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xg+QfBCXfzEbEahIMN/FjbGzkhLOtal9LzLwBW93FJw=;
 b=Rnzre1u4n5UqZsa4W9l7S8TfVhrOXfW7Oj3tne+ZvAw10s9xC3lCgfaQdsrsh8d26m
 yplgNHeehBpNirzVAo9aXLcTwePP1GT27I9Q28MectqPs0hTiZ8YSHXr9T5QXrJiW/gM
 5OqH2DOLsJtZ4mUAxYzDXA+FuxfrR8te/M9LzuYWLpYxBY6vY3dLHF6WFZEhsK9Qrg8a
 yIjHQa1unP3DobqZvLIyvlSAEgRXiJlrr5oQcBxpBPQ+uKUzpT3e+bRnI8IhQXOIz+s+
 u/L36/x3wbF9fhxMtvlWo5KQ+qTm6qsOWDuqIYJ3TU0aITQ2q+ZUO8eID9NGu8dWmsUf
 6alA==
X-Gm-Message-State: APjAAAXsrBhNzautoCu3Ep8/Il8JZ4UJjAveDeNNp/RF2W7nk4puYLsw
 5nPCym7oZOEVCUTcSHDZI9M=
X-Google-Smtp-Source: APXvYqztcPrY6UMHsP2lKj3STJyIPCr46O+RJaA9aAj1aMsHmHOAC66sIuMrLQWnXQfl1iNQFhLn8w==
X-Received: by 2002:a5d:4bc7:: with SMTP id l7mr14290627wrt.188.1570425889025; 
 Sun, 06 Oct 2019 22:24:49 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id t13sm37298074wra.70.2019.10.06.22.24.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 06 Oct 2019 22:24:48 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: amlogic: meson-gx-socinfo: Add S905X3 ID for VIM3L
Date: Mon,  7 Oct 2019 09:23:59 +0400
Message-Id: <1570425839-4183-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191006_222450_519270_FB98307D 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VIM3L appears to use a different ID:

[    0.086470] soc soc0: Amlogic Meson SM1 (S905X3) Revision 2b:c (b0:2) Detected

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 3c86d8d..87ed558 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -69,6 +69,7 @@ static const struct meson_gx_package_id {
 	{ "S922X", 0x29, 0x40, 0xf0 },
 	{ "A311D", 0x29, 0x10, 0xf0 },
 	{ "S905X3", 0x2b, 0x5, 0xf },
+	{ "S905X3", 0x2b, 0xb0, 0xf2 },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
