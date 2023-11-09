Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878E8C4167D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sf/TwMB+Fw3wzBTqj8LGxJNW4ufXGEU6l+BWEVlIg4Q=; b=Gmyjb1qdHq9fVR
	ww1Bby10F0AMuMIQtxQVbZWnRBseM0x1VaSRgEeehHGlTVgKcFs9aevlrME4OY5A5na27sJMuC+1d
	qiX7iJVo3ztjmVwOfu+we31MfqZYs7B5USGWAIVZtbLRSRE1tYsiq6yBXXefsCwovzajc7GAt8JBL
	E62M0vW5qczZ+AC+bdRyo5ouN3r4kLAcYL9wr8GQAN/H2tmzSLTxq7cx6y3ycE+GEXVpIaHzuKaxT
	pnvEGJMf4GP7VA+wgy/Oen0eXi+dvs5wrRV4WkkKJNFTWmmWVa16kqWUwAe6PEluaI2HLkXgI5tSc
	R6lxG+Y27FVeQg3wactw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10kI-005fFg-2F;
	Thu, 09 Nov 2023 08:50:38 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10kG-005fEm-12;
	Thu, 09 Nov 2023 08:50:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 517661506C8;
	Thu,  9 Nov 2023 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1699519834; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=cD6HIvwS1+eD7lmzk4U069SbWiB68SgbaID0yXccmhM=;
	b=aDZLp3j11jfHj1w+dkJjDQmX75SXmjAGrwYH6Y+rWWJgRthl68IQSJ3K8OSASbFeTYp66O
	/RK8a6rfbE0genlAmaLhir3mWSRvghogQ52JhRjFm30t3M296Z3zjqtd5pYUwVZzeP2EX7
	vpTxg+7Hg5iJ7xu1HKGBB65gZZ3kjtUSQ8mmumz+oYmT8d4BKPyf0ZhRzc9YGVIc4vqkhS
	PUylTPi1gEPSMk+Wzstc3R+giHWZgeWgAoemjqNTYq3/KRtgMUb3vuVzGnTVFt3xOtatL0
	S+1tLvIYO1HHk4sIHdadttgBE0YDcnnXLIj5VnFVnvBlsOgjXwXRB8n7OVv9eQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] firmware: meson-sm: change sprintf to scnprintf
Date: Thu,  9 Nov 2023 11:50:29 +0300
Message-Id: <20231109085029.2079176-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_005036_528285_4AB1067B 
X-CRM114-Status: UNSURE (   7.72  )
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
