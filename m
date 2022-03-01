Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B897C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 07:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dy8Lpq2xWJyzCrTx7vDswBK/ynXTiGrnibXqYPByqcg=; b=TYltgmg5SZq6+z
	gKdpmYQKfoMBeQwSmJccVfmUfP02vGZlQKWrXhsut8BeLfkTP/IutZGl+cYYrZ3qxWWT4DbxKb1m5
	krdFxdwxjBtvd0cSAWJVZgIUQCRWQLZpME/FYhwQgo4/qYe0HVRBeEBmpWnYfKRG+Mq8wrxI/i8Nw
	NSLZy6KSexBV5zy2AXoqaNmBEH4hyjjBvJ7cfW+txZF/hTcANlf8SzQoDB7inezoxMU9Xhw420WEE
	/EHW6tyK7LMQTl1zpLgm3WewwBhSS9y98pyCKbDAbXm1Xf4Q1vcXHprEHUIie146dn0HVVn39gBdx
	7pnuwvXe0rR3fkrA9sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwuP-00FJCw-FJ; Tue, 01 Mar 2022 07:26:57 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwta-00FImi-IR; Tue, 01 Mar 2022 07:26:10 +0000
Received: by mail-wr1-f50.google.com with SMTP id m6so1720435wrr.10;
 Mon, 28 Feb 2022 23:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycVXdQLM7srrY8c6er1f1RFEBefwbs4q7mdQO3Fucms=;
 b=AcDkO8qRU1dUo0aMucaluwfKAsS09bhCFDieBDkpjtE8+71tgWWxnqOqO6UstL4rsn
 ooJDDAHgzDbjzvZi5QCWI67Sxi4T/lAMw8cJPX9xpw4Y8nZXy+KqfcotFlrBI5IVx1e7
 hPQIxxDlXMpVfHeVzeEyvJfGl5vQjCwJLxZjq+zy/JXvwaYKvd8vOahepKhkqA88oSOH
 tgf+3JQEuXD9Phr/Dh+ZSK4s7Eg8LGMonDnKXwWcB+Oofv6dJpWEUGLtYt/lyS3x76rl
 CNeU/hk6/LTQF5jSFfFO3myubppxzBqX+cilX+pDbUExDTM03W70hE1VYq/1Ht+TLZ9N
 jGQw==
X-Gm-Message-State: AOAM531tApwG6UHh+NuENRd11nvbYDGRSHTT0Artd1z56SxGwPXmVKTR
 v+dD/o63HgQMpj4liuUGMlI=
X-Google-Smtp-Source: ABdhPJxE3Km/V44Av4khjm6F1ArDMBaclXCOIRAfcaWBf51w/LDZFt9kUhQFP73MnyWw+1nYI56Bqg==
X-Received: by 2002:adf:910a:0:b0:1ed:c3fc:2dcf with SMTP id
 j10-20020adf910a000000b001edc3fc2dcfmr18652299wrj.430.1646119564477; 
 Mon, 28 Feb 2022 23:26:04 -0800 (PST)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 l26-20020a05600c1d1a00b00380def7d3desm1724761wms.17.2022.02.28.23.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 23:26:04 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH] i2c: meson: Fix wrong speed use from probe
Date: Tue,  1 Mar 2022 07:26:00 +0000
Message-Id: <20220301072600.12352-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_232606_644211_7788B3B3 
X-CRM114-Status: GOOD (  13.40  )
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

Having meson_i2c_set_clk_div after i2c_add_adapter
causes issues for client drivers that try to use
the bus before the requested speed is applied.

The bus can be used just after i2c_add_adapter, so
move i2c_add_adapter to the final step as
meson_i2c_set_clk_div needs to be called before
the bus is used.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index ef73a42577cc..07eb819072c4 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -465,18 +465,18 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	 */
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, 0);
 
-	ret = i2c_add_adapter(&i2c->adap);
-	if (ret < 0) {
-		clk_disable_unprepare(i2c->clk);
-		return ret;
-	}
-
 	/* Disable filtering */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
 			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
 
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
+	ret = i2c_add_adapter(&i2c->adap);
+	if (ret < 0) {
+		clk_disable_unprepare(i2c->clk);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
