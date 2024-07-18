Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503A0C3DA61
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6zJKWZQBzHPDpz87MXC7rvDBwQMHZ4crfUyl6+Dmdo=; b=s17lmDR7H1DPhC
	FmzNMVctFOrc6/Mz6SIa4RXgEGDhuvgu+rabMvUkqrt/HKrFrMUZeCubdESwcajbQiPxKNM8wHYso
	+21rOeKWyPZz060W05WxFvpc/aPgcptcAVngG9fp8vAOj8lXWTLqPRDUhdxU4Tx2TN69lA/Y9gtqR
	+0qkuX+2r7kj/jMxx2V7Q8Z2By5jEA9e6NsblMduqSVfD3rE1daYP9l3lKveYV1LQLViilblTjzl2
	SGnn7CujdN223AUJX7t0wSTPbtBGqRRGTmevFwqtn9vtb+NT8iQABIMCoOVKDVKZf6hv4Q3hX/JDB
	BkLjffYtj6KHNfWVakew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtr-0000000Gd4i-0JyY;
	Thu, 18 Jul 2024 09:58:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtn-0000000Gd29-1rmd
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3685a564bafso239133f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296686; x=1721901486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOgT9D/DodptCqE2kKdT3PPWDoUGy8iZZzt0/7nqeFs=;
        b=P1iilZrM5xuXzZb7qAXPmKOOT8LEB7QHPIP+mknxvR4uyUXDqlGN7ZvwX1FSLTxYDs
         MWqw1xAUTkr0j/X2aFb2gkAMzHYHfk+ittC4qO2+pBVzibG+YVKePf4IOMndwxK98Cmu
         HooBsOV1sX0CRBTq7fj6/eAUb9Ezidke+3uELO6eYmCWyGw13xcdVtQrjUbXz9QQlCAQ
         TnB8XWSkOhrZDYd18VxhFAde6W+DUKmvoy3vfz4Mv2+v/y4bC0D9QAWh9eSY8Zc/WB24
         Jiyqz63tPAaMDsy4YHBTMxf+MMZw3B6CIUiPCtYrcduxDqkA3XopieLbgJkTtVu9T9cY
         8pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296686; x=1721901486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOgT9D/DodptCqE2kKdT3PPWDoUGy8iZZzt0/7nqeFs=;
        b=cwa/xIUnup3+DPqs0HbD2plICLPcO34NG0u30MLoUKAFlt+i5/z7XNrcIT3Qpw9EkF
         uJFBggpsFmSivmVQ1qLl5IMa0MtHLsB/lzAfqM0NrCuw4zalhvbALJHxZvja5D5pOO8y
         Bq7Y+1lqNjRPATgokznUhCGhpE4OiMXihLB14OkRQUcukUFw3ikToFQLhIaJipJ5YWn7
         RROIq/lSrJ78jRXmoVugmjJVqYoAm/CVPt2COh5JqaE2QBSxmTGJYu60wrho0jzuNKhp
         vORPEOS/fmhEJ4MmZQ7PJfYBj09cpWp6VYzd8QCkkNl4P447+u41SKEzmTsUTuCUtXRS
         qEsw==
X-Forwarded-Encrypted: i=1; AJvYcCXxMHPQxaopl/5L+/39pefYKfUn2Z3FVxonFxgHIGrYapYEY9dxDPMa0+qfK36ETXgKOrxo+H5SsJ1//XCblaSDPcpFYLy3EG46xi4EQp1aNlE=
X-Gm-Message-State: AOJu0Ywt+pI0wY6zsT34OrSZ5lGRLCYYpw//fQpQLL3rEBjqNhjUzwRk
	xdEMpEsqPmy/HGzp0PFDOkZSIoVvVfa/gmQZNgsd4vRzkILDmI/4P9FcL2UTjiU=
X-Google-Smtp-Source: AGHT+IGDhk3n3fMrhl+KxiP4qxoRTY3Xql+du2qHjuCX3AxvdTe+ANakilfvecMzJUQGpqBPrQYCqA==
X-Received: by 2002:a5d:4576:0:b0:368:657a:6347 with SMTP id ffacd0b85a97d-368657a647bmr411614f8f.34.1721296685836;
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/9] reset: amlogic: make parameters unsigned
Date: Thu, 18 Jul 2024 11:57:47 +0200
Message-ID: <20240718095755.3511992-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025807_803305_37507DC2 
X-CRM114-Status: GOOD (  10.03  )
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

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index cd7dff5bff61..a4705021b8f2 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
