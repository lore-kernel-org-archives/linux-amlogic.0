Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3954ACAC587
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Sep 2025 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Un3sLNEli54c6kblrBYKLpq5EkYlD+D+GuQUHDUK/Ko=; b=nIo/GyRlsh5Df2
	edQoLKr17DE9bY8eU0ENIIXl+yl2lUUeKgozclXKvuLi+uXFWNbcvjQCQ1OapXFYjoucZvQHJZlqA
	iLQWqdyFqqvq2e+yjMfLTYGF1cEd1GYf7SgzB3ew18P7ANjPMth1+KdU2OEg/7TI0c3AMUxV+QJl2
	hL9WPDLIEB6sP2+deyyLQnDNDlszoppyYfoWEjP7YFyxpjWqUtrSkPnq/bUMLr7Xk1k/iMTYOAHIW
	AurWzhuWMXY234mRYHuWcHTjRWPVeHy+gyuxgjfoS8t6CdVDEXYE340XJhN6nNm/4HBOMPHH/C2kk
	F3qRrkCU5vB6COdkasvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxWgH-0000000G7wd-1rlK;
	Sat, 13 Sep 2025 20:17:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxWgF-0000000G7ug-017D
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Sep 2025 20:17:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45de1084868so15593495e9.2
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Sep 2025 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757794625; x=1758399425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=QFcOAVl6A3b3JnSg+XJctm2Bo6q9rdchv6Lh2ZL0mzNqpIJ+M/4eupFXS/mvU5LuSX
         +SNYCHQd85lKO0BB19HqBqwkpi8yKzL9E63bVxcub/P4Fod3/8qS2RUAcX6uo6vEw9cb
         w2ZDZBTf418fKgTwb6X6kjPuGZIL00E2W4ydIySPA8ffypZXszvQ2jDYYsQSSthjgPzg
         cDj1ODcvOPr+X+yfKl7NKxWM6ZsltU8tJqcLj0b36lUX8ABZe78V61eynvfLzS7tHY2l
         2AjU+hxVEn/krzRKb8XJ6uRukuPkocmopCjvqsnuY56JlzoHGkUicdJlrLdzr+xuUr+I
         Lnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757794625; x=1758399425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=F93POUYfWlCbkY/JOMdikkiBsc+eEE9usfaymH5sfiodfkr491UG+IKuP5tZFGUX2+
         cw3RkkXHbZiRCz2iV1ztuNy9vdDV14EXeLk1urI3nhXsvPDBerH3oVQjobJTV9/KAQBh
         pt24ghASPpYqxWDohEDVEqyDQ5b9+hYII+doHka0cLprb1De79D5LwZzX6mpCyPXHm6l
         eVENOtABitv/mAaJuN+51lbFdjzDYHbMWHA8Sf0x2r+34k5m1rxVu1HH76ilJhLYXVnM
         yNVE1Rvc80UknLAvWjRx34Ut0cP54We0AQHOrM3BgLjYay9F2fk39NezEccZ73u3iQ4Y
         muag==
X-Forwarded-Encrypted: i=1; AJvYcCWAxvHcgMziu+xQhjUbRewxto/tCwKyrw9f1rCuDNrORxQ+LwMV8AiBYV+AZKAZQbDTJilESg+mQH6XKCSl@lists.infradead.org
X-Gm-Message-State: AOJu0YwzOaRR7+s9Qi96lR3IVFrKEOxH/cNGlnUs+93A48sevISexIRf
	NitKhkCU6A4ODs/rXn8lP4pImu6U3GWo6d4m6VPeCOlySustIabOo0sD
X-Gm-Gg: ASbGncuST3hY+BYqx7dzrTa8ONrhz8jF/Uo2/XGuG5W7t1nDK4sSuFHii1YNCvuDtXC
	5ZazIiS/YF6IWNCQ1Ws4LJFv6pDosjW5uCPX3Qd9Sv3T3+JwS57wKTS4VcT7Kq0Kgp0EYPMGATm
	qf+sCUeQIKtT82tev3RGn5A85C7m3Ku3ie4wzVrF4lkt7HDy8SKA40iPNk+3YFfD1stH2LeWnXW
	/jb+qvr4gqOk/6SbFGa9RB4f9YZW24AbbMxrd8CUJT9fItvvuX0rcvnlC2iS56qv8/NZLD6XbeQ
	lYklU91I2FM5wtLBGLKqQUcRH89FA77wzgf1eoLxQspJLln1CEWik10H3l5CffQKExAHW47zq50
	kF3htLnAOH0JWr3gqAJYmYQ==
X-Google-Smtp-Source: AGHT+IEXKa6xffHEzbijIqHJqGxOlxCQ+oBv/ZWdVFhhrgUOoImOvsVfpGK+TXJ+kkkvEkQl8EtTxA==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr6975696f8f.28.1757794625150;
        Sat, 13 Sep 2025 13:17:05 -0700 (PDT)
Received: from localhost ([185.63.82.103])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e760786ceasm11628425f8f.16.2025.09.13.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 13:17:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: amlogic: Fix error checking on regmap_write call
Date: Sat, 13 Sep 2025 21:16:11 +0100
Message-ID: <20250913201612.1338217-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_131707_061151_01B5D5C8 
X-CRM114-Status: GOOD (  12.46  )
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

Currently a call to regmap_write is not being error checked because the
return checke is being performed on the variable ret and this variable
is not assigned the return value from the regmap_write call. Fix this
by adding in the missing assignment.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 4ca8e82fdc67..4338d00e56a6 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -420,7 +420,7 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 		goto out_map_data;
 
 	cmd = CMD_DATA_ADDRH(sfc->daddr);
-	regmap_write(sfc->regmap_base, SFC_CMD, cmd);
+	ret = regmap_write(sfc->regmap_base, SFC_CMD, cmd);
 	if (ret)
 		goto out_map_data;
 
-- 
2.51.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
