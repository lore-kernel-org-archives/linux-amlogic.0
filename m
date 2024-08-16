Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FA8C531DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixfP72uOR4TzUqtUitCI044SJB07A/8QCdjPErV97nY=; b=xjhsl7qYY0JIHl
	VhlQ5T1jFlXbcWfL93YY41rtGVN2wIS0+r3hOSIe8K4xzm7VH9SpTPVLY2SoKnyFr2PeoQXKub3cJ
	bf8A+wHpEpt83Ld03qksGMngHPLc9Dlpno3jVHwxEc6jTHqk9/IXEHBITVJsWf1CIc1So8dbHIyOb
	sEHrWerljvkivAuQ0WQL7mCxRn7t7BmJwPDKvFg70WkL38njp66lhVilzrNw0n7W/wgtFDprA+0AN
	78kGYDLQy5BhAnlYYIKrheEkCEX0IOXXGh65gAxtbY6S2D/uwp60XYg5sDeRg0TvQSbKH9FS/d33O
	NhX1i81Raiz5aiqrTduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewBX-0000000Ctb4-0Io2;
	Fri, 16 Aug 2024 12:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7q-0000000Csj0-1zvp
	for linux-amlogic@bombadil.infradead.org;
	Fri, 16 Aug 2024 12:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zTE0ZAwpLEek+mC97zOMxZoDXTrbmisRlZ9024oJ1x4=; b=AjzScYMMp/QcjauXyvjcCJ1hq1
	sAdWbN5D4UM+1PhvXN1JMoHZQjMpTtsHT5VsgUMh1kkbWCukg/VeUhKBptIIFZLSTYSQrj69YtJZx
	cV0EdVpMiT+5vXOEEjMeQKOpTOEliHfs/cGpPPfcFyye3yjxGeoF/AW9xPvOerf42x1O3p34zfwWD
	yPbaHy2lEW3Xc9kfbih5nxgr2NuKYEukFuye3drYdz3md3181flxAbNcMWmddmsojR1oJv6r9DptG
	D07caqvL4QwTafJPNp596+kY+uWGdovOtM2F3cfjBUCXIkcgNZqTaemxPX2eSBGbOVvJNIi7HnzjJ
	CXMuJ4vw==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7l-00000008eGm-1x2W
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:11 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-70968db52d0so2059124a34.3
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811525; x=1724416325; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTE0ZAwpLEek+mC97zOMxZoDXTrbmisRlZ9024oJ1x4=;
        b=Q+0G3KguCePek+UOGUII+wqaJRg5MAQ4uupAs+nhPvczvPcGYNK2UBY+q0vthSCYBw
         r469Z5NzAF19o1G3438arb9VXRfOLMk7anXCvd7yLXRSt9hbwqtLuhSOxh83QP1/C4fe
         RL4eURSWqv01ziuE5J4VDP9VYQIP8GzrD9TuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811525; x=1724416325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTE0ZAwpLEek+mC97zOMxZoDXTrbmisRlZ9024oJ1x4=;
        b=PKUcNn2fl/0AANRxC3lur505WwtFwW1u+mMv6x2EMUBwHhfhSrdsNu08U3nWzyoknC
         3e8DDXZOnkApX666n0wz8JdWsUxunMkCx8mSCC2/V/A0szBBl6lo27POpwJ8+cuonG0P
         jL/ULT7/lD4LLKEOAUROg8z0KvaNKhZ0gUvKopFA1fh1ycSE68nHq4cV7E/Pb0JcGiPr
         0m4DSNhBH2F8UwEp9oMK0s2t//eVQ+PIdQILItX1FVdRz8H5YC/EY3OZYtFEMrcgkTGm
         3lKQ+huv2+CvMueVAx3RbJlemG2Y7tu4jt1E0Q11Hi1EDDpWIMy5/7MAHdhtthcQZ8vw
         KSFA==
X-Forwarded-Encrypted: i=1; AJvYcCU7PpGajxVeFRQXdzf75aU4/sTWvtDGZ+qrOWI012dvjDspeumLa35fIx0RKmLqzH/k4Lev49LKf6tQXkej@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq1rzcwcREWMXGKIlSrgUvebxfbLTLsq7otJIU10jpS6lANGid
	301PJN8T/19fgzlOz115MVADhI5oaAaDx0U3A60x4AOf20lToFA1SG/6m0WwEw==
X-Google-Smtp-Source: AGHT+IF/lV0FO6kyi+dWBfhad0hlEJtndvHJ5Sx3xQGXBIEu/XLpM3FeOaUjff8fbn0cH1v4QPeYnA==
X-Received: by 2002:a05:6830:3109:b0:709:3462:a4b6 with SMTP id 46e09a7af769-70cac84216fmr2835025a34.9.1723811525644;
        Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:01 +0000
Subject: [PATCH v2 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-3-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_133209_934337_CD9F4938 
X-CRM114-Status: GOOD (  11.16  )
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

Smatch is very confused by a clk_prepare_enable() being called in an
error-path. Fix this warning by moving the clk_prepare_enable() to its
own function.

drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index e89e888f028e..7716dfe2b8c9 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1392,6 +1392,16 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 	return ret;
 }
 
+/*
+ * This function has been created just to avoid a smatch warning,
+ * please do not merge into __s5c73m3_power_off() until you have
+ * confirmed that it does not introduce a new warning.
+ */
+static void s5c73m3_enable_clk(struct s5c73m3 *state)
+{
+	clk_prepare_enable(state->clock);
+}
+
 static int __s5c73m3_power_off(struct s5c73m3 *state)
 {
 	int i, ret;
@@ -1421,7 +1431,8 @@ static int __s5c73m3_power_off(struct s5c73m3 *state)
 				 state->supplies[i].supply, r);
 	}
 
-	clk_prepare_enable(state->clock);
+	s5c73m3_enable_clk(state);
+
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
