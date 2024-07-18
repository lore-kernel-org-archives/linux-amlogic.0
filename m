Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D05BC3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5V9y0SGrntm/tmRpWcmdVposDOugjtTIgwCn0UDx4k=; b=iigqa1EWsv/tr+
	2WJ7klJMGOyyvRzQf6OJXnYgQjrDOe1Go3ZKg3gjNgjbUH0ppyYIaRhtcp1wy2R8T9wheJAbJhuqv
	JZKZOASvoOvWi/poYGpf6iG6IkqGEu4BJZPb9gkB0KclwT36V/8gqak+w43E5XQtJWKAzoH15tHtK
	u9Cbv2K44/P1I340zg4XwnN0NFadnTC/zASRBJKYqUHfmTFI/pVEO9rUZT87t/UvN0wVy5dDu7zJ0
	8wdKuxHWdBXEsK3im9gBvmROwzJR8cGQhFkTGN71oF/Idnck7MlYSNxHS9BRSDxeQVuJTHoUUEmD+
	Lp0kfuUYftH1Pjy8qf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtq-0000000Gd4M-2mpa;
	Thu, 18 Jul 2024 09:58:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtm-0000000Gd1s-2kPQ
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-368526b1333so228574f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296685; x=1721901485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHnjFErAgDASCliWVSwJYSmFcBoJAvgxBHMIXQRsSBo=;
        b=cCqqIGgfDeCSFWXmXYkZ+vuXUvnyx9j102BCiW2GFv9Ogkl5mflJzRcfiIkY5tAIjE
         hT30M7d7f0lP01X+G7exbdYW3g4ODxAqCk/+K+532b/vIKT2tFQL2gzhOE045TnyL8IA
         oCkPhP46aTcLj/FQ3r357UbkA+gDvabbOR1m+224s75QtbXVuPOc6lj8rWN9HDVPXmA2
         WtmEBvjkS11FWMQRCKpeb/q409R54Jz+Q7/p4sp+wa2PFYAj3c8Ev2szj4U/2biK7gUy
         YHD6y8Fxb7X8EAT3YbQK5e1D+QtkAHVXSHqrfuKDq807G9H1cimy3oJf57kEPPPz+Mm0
         +4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296685; x=1721901485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHnjFErAgDASCliWVSwJYSmFcBoJAvgxBHMIXQRsSBo=;
        b=GAsoIODjwgD9R1AXUICAETnZAyQt4mlXbtmisJgJ8Xwkmizna6iuI1u+0kYeseFFGT
         O0eJfDxDcWGQi/lkEvrGZrfqdJ1qh6jzbPUaF20elPdOTF678bhdiBSHEwWtOKFj8TG8
         CdOM08/bdSOSeG9sJ/SEZoWqwouY+XvqRMSZ0kblMez4OS8iYwqYIilS5N95zrF2G0zS
         kRpsR7o54QDnHnyYSalgnyt1onNSsaV9jh7BCevuzGaM2YOND1GvEpfc5g9TKGbT/dgM
         5Y7/NC8zu5Y0atqQWat1HoPGza7WAPvlUIa3+nsOpZpMRRNpx20jyUHkp7XqmNUSEO5J
         5AgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5wrhwEoF+EgpbscoHB7DSmz657ZC7e+o/Nh9N1g+0P/7zh6hXKM7rKHnfVTl4pkq6Ox1cH65x7WFMRbkCtT755gubIX8cGNjOCv/PkIS5SFk=
X-Gm-Message-State: AOJu0YyvUl1VC8lgFxGTRpZqyofRWJ+or74s/v0hToIUyARVFRXFpZ3t
	g0/NDFIYO2GYjLNqPEYNIAdnR/yegm2+wLh9XW9C25jorClRwnGUNLIp7Cr1ewk=
X-Google-Smtp-Source: AGHT+IG8+Imv2pZJ1VDWhnhTTaOQKKCKWkuYOQ3logSxOWNN3Qv8MGDFasB5Wj/12nLcm5NH0GyuVw==
X-Received: by 2002:adf:fe92:0:b0:367:940b:b662 with SMTP id ffacd0b85a97d-3684b3c82e8mr1763009f8f.31.1721296685057;
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/9] reset: amlogic: use generic data matching function
Date: Thu, 18 Jul 2024 11:57:46 +0200
Message-ID: <20240718095755.3511992-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025806_711019_894C3AC0 
X-CRM114-Status: GOOD (  11.53  )
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

There is no need to use the DT specific function to get
matching data, use the generic one instead

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 8f3d6e9df235..cd7dff5bff61 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -129,7 +129,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
+	data->param = device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
