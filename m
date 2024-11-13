Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE3BD41C18
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wbt7HhWAoJHo2WsyHCy3TvpoP9JF4nimvJ9DVAbdWc=; b=ayh1JOPQkf+yNQ
	jzzBFKOfgxzbcLfNlas2MwW9Gb0B4JseDngW7ti2FqSu3egcYkpPGX58Pk2J8A6kvu7vwj8oqqIrN
	hRXGTgYWNepx7j9LO8H4NeGadJ6h8arQHGcU8uBUs86S7mx4UL4I1HZTmykQB/2sFv9uixVtNqr3j
	bX9vvn7KQtSH4GhCJM9HdpXeDV4k7jV3Gumqi4TOrojJEof0nfZX/OodprGwCyIq3v2o1Wquzh7p8
	xJsNoTTusuQMps2SGOu48E+ymH9ZkvbdLSv5wa9f6vPw3hx0lvrOkn0uZcvs9yFsem+t9gYFLoNNi
	gEXLcD4YsDix74ZPRdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9E8-00000006AhV-03We;
	Wed, 13 Nov 2024 08:59:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98w-000000069qW-1FYe
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c693b68f5so69216735ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Nov 2024 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488069; x=1732092869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNsK27Fa1Ex5W0VeJ3TA3Gtj8S2K08nVqm3agCQiDts=;
        b=i4Gm/KznE/KakFQGiHatrxvXOYwa8m9pBPqBHNZVpV8EGfJNVugRhIalZLwWySEId/
         Q9bMwcCwnc6rMozFL/690FCzPYBRseHkeMee/AouiZwG+3EbrdyJ+BBxEs7AxjrodKL9
         enlnPX++LkhB4cLAiX6WubNOkDZBBVeeLgsWhB8GkUNNQ0FZ3ZWrRwqnQLGFsn9CMaDM
         mLxLI2/SXf6+wuNOVgCq7alDK/4L77XSS9+5hL4uAsxMvqUckcfY6iUgVRZpJBlyH0cN
         Rs14E3ipt1g2mDUqqZP6Fg1xQu46tcjxOdIDjTVlWncX1z6yO343cToX+UAob+0lt5VP
         9eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488069; x=1732092869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNsK27Fa1Ex5W0VeJ3TA3Gtj8S2K08nVqm3agCQiDts=;
        b=ViXg9IbnQQQOD2ODgYWSafr1xdI2NIuZts1I9jsi9m66GCEac44DFcwlDChQ2NroUu
         MtktjL8ayiHW3dilkGThnbykff0ypFL8RwnXqYR3sk1Lhngw8QfwCDQV5QwKRKotaV1T
         nfMDlZ9xpZ7hvnUHQrBS6XeuZZ+1AO7IcWyOSdHTE3+XeLqT2TY2zRxiFpXTsH6MQ4fc
         FVxRm5YOeGZ9lqEQxVCCCXBceRlsQxxjcQAqS4FY//LJC2RHgbyndOKcNJQBw58voLS2
         RcBhsyNNZtpJ2MebW0ofF9/vbKqnzHfJSOEPdQtcUmC8RXPD59T4LMBSoQA/w/OCzzec
         YWhg==
X-Gm-Message-State: AOJu0YzTSSLRaHeoeSh5PPP2O3kP+KHboXPff34CZiIh7+EhTHwLRynZ
	KSsZ08LTlmithr+AtMP4+M7eUjwwyATmo4yLWXUkeRVFnglaXikv1ZvC4ost
X-Google-Smtp-Source: AGHT+IGvQQOK2pmty0Ab0hdZeyxnxRqA5cqd4YJeTPkl4mPTvKSC4kOdrnW1nTpFjXXf6p4vsYJGyQ==
X-Received: by 2002:a17:902:ccc9:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-211b5ccdc57mr31401705ad.32.1731488069238;
        Wed, 13 Nov 2024 00:54:29 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm106095085ad.11.2024.11.13.00.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:28 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 2/5] rtc: pcf8563: Add support Haoyu HYM8563
Date: Wed, 13 Nov 2024 17:53:52 +0900
Message-ID: <20241113085355.1972607-3-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005430_471271_D5DB85F7 
X-CRM114-Status: GOOD (  11.71  )
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

Haoyu HYM8563 has the same hardware structure as PCF8563, and operates
with the same device driver.
This adds Haoyu HYM8563 information to the device driver and document
to support it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 5a084d426e58d0..42382c8709b7af 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -555,6 +555,7 @@ static const struct i2c_device_id pcf8563_id[] = {
 	{ "pcf8563" },
 	{ "rtc8564" },
 	{ "pca8565" },
+	{ "hym8563" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8563_id);
@@ -565,6 +566,7 @@ static const struct of_device_id pcf8563_of_match[] = {
 	{ .compatible = "epson,rtc8564" },
 	{ .compatible = "microcrystal,rv8564" },
 	{ .compatible = "nxp,pca8565" },
+	{ .compatible = "haoyu,hym8563" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf8563_of_match);
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
