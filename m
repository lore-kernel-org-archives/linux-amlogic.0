Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AACC4167D
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf/TwMB+Fw3wzBTqj8LGxJNW4ufXGEU6l+BWEVlIg4Q=; b=kYMARihKg5Qvdq
	3ixOpAlBimH2z0bzWCO5cM7QBeTvGavQ0eDj7S/tFe/jdTYrNr6uKVEGGdF+ouSL9qRBabNkXi3uG
	J2PPA1fnh2XnK7/utfMu75RBDKTL8I8/xMZ6SRvYjuR5kaDGjXEZ7OVW10WM0kv+4Z76HN1gRo2x9
	8Z0xKIBNsuA4qO6n+M4Ce97V5NgHZxAb7ozft0Sc+j/pOdTLyjxF2Q1DzqmtA78qUB3OeJk8FSUlc
	I8rAEH0ApT7B5/oxf/H3S/E+kh83IM1TcAFSkgxEA+kPQqCSSwVTWjiacYMyOo6HTTKr72nAuiiCQ
	uOipWOJ/MZ+4lAa0Wv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSM-008vFx-0Q;
	Thu, 02 Nov 2023 07:49:34 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSE-008vEH-2y;
	Thu, 02 Nov 2023 07:49:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25750147B80;
	Thu,  2 Nov 2023 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698911364; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cD6HIvwS1+eD7lmzk4U069SbWiB68SgbaID0yXccmhM=;
	b=XXDo3QUDQez6r8fp1+UL4OuCuhJxp2tWksc8eDpgFkHOaUPxZJmoa2+uMCxI5iTvhJknNt
	t1x3grkVoj+J7HAnFgMqjusL1kqqsSE+jw5avzCrhUfSgMcLwbbUpNod1Yx0ysl1s3sI5G
	WbWE6IDGiJuNqYaJSgsAN/38CTqhT6dwlqmEHzLb7EZzT3FKdYzCsILoDyT42qMeGxLRPt
	DWDGpmYr3M79+0X97AwRpev0DNOthfXdFNMtzclvZG9X2BWqJnjV4mdUxiJwv4pfMiU99r
	2crUzil/ADrHYLiCALecVnT5Kj5DsE0OnN/8toOwhpcVAoBCStukjn9c3wCYKg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] firmware: meson-sm: change sprintf to scnprintf
Date: Thu,  2 Nov 2023 10:49:13 +0300
Message-Id: <20231102074916.3280809-2-adeep@lexina.in>
In-Reply-To: <20231102074916.3280809-1-adeep@lexina.in>
References: <20231102074916.3280809-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_004927_532261_B6FE759A 
X-CRM114-Status: UNSURE (   9.14  )
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

Update sprintf in serial_show frunction to scnprintf command to
prevent sysfs buffer overflow (buffer always is PAGE_SIZE bytes).

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/firmware/meson/meson_sm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ed60f1103053..c1c694b485ee 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -265,7 +265,7 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 		return ret;
 	}
 
-	ret = sprintf(buf, "%12phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
+	ret = scnprintf(buf, PAGE_SIZE, "%12phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
 
 	kfree(id_buf);
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
