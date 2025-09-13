Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E109CAC587
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Sep 2025 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Un3sLNEli54c6kblrBYKLpq5EkYlD+D+GuQUHDUK/Ko=; b=saJ8oVs25n4xbk
	2vWI4SZXgOa43Z4e0keDrd3/xeYY1ko18EtZIPJzw63oRkvT6pWfCcqJjVM81a13p/tq3notVvfkV
	1YFZcQvdjH3vB8Lu7DJUDQX1BrQb/yb8SIZpzIlZKLbUvkNkuYuKxts6IrC+LfnSJ45wtQmHDTOK1
	LvbfZR/CIR3WR1+yfITChKnl8PVnyjiTmHVIt+1aLGthtWFpPtghcEe2CRpbBO0v3uQJdZAoUW5Ro
	JHiDxCCVPaUPqo6ae2TcYioThJrFw36X3SNmrpv3kFcSXuSkdU2zZ36uPkcVRIxTvuEWOSdLghXo3
	9pZMSNWnUGI2TGYp2WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxWg4-0000000G7r7-0jg9;
	Sat, 13 Sep 2025 20:16:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxWg2-0000000G7q0-0BcW
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Sep 2025 20:16:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso2171525e9.2
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Sep 2025 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757794612; x=1758399412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=Cdc6gWTv3RLp63nUKocszImvkS/vndg3fkX7ytb5grzAPrxARPRzRvCW82V5pdmrKv
         n/rybJzjObMe9paHxqCWJSB0KXG34WCSHtwr2QqYXtFvQ5T6OACO0w1UwW2hXRdtoE/R
         HuMjCDixV5L9AOJIirpMRk2rzl2OV+GqiA6Phk9JPb0hv7Zo7WtAYNrDYZ4/0Z4vmVkv
         i9IiI7WykCvIglzzSEu97Qa0N+y93YWdnQf3Pykw61UZ14MC2c3KEbynJAK95Yx3AP+O
         /5TDDQpHlYrPjRSRNtODPtkoejDs1YBJ4G9iFNIzCRk1BrLFrv0hq9O8przRetTm79kz
         NPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757794612; x=1758399412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=nJiGSdIIGyVM+8jyIbVcyogCaQq8KMD6rSBCYGga8zR2wxbMcSjGUMSgxnh9Zno7Sb
         jFTHEwOYFX/pAAC4XtTHJHbBNkh5TosP6YYm4iaA95c8HUAthID2qurXfs2vzQktJxO+
         tpZz4UiB5z4eZxxXyGAaKCY1Z/+21t9TQZXl+FWVCbI04bpDlmhWL6lsgJHveKPPuRkh
         LryEyGGBHhe34HTeLNKHYDGDRc9yWaJb4BOATyAD8IzKo0IZM95f715B9tzjyeG3dOOv
         F0havSbW4bqLJaPx7A5xdwNqXyBaTPh0Ba/8WgR1RcnG78SbTYx4Iq5+sL66N4EFTUag
         dK4A==
X-Forwarded-Encrypted: i=1; AJvYcCVyfW2aVq+7tpl+cVA3IGMmcRazqhHliaTjSJeDg0iH8iv+e2Zzr6+LB+aIbmmzkiyC3dXh64v9bKEsn5K+@lists.infradead.org
X-Gm-Message-State: AOJu0YwzciaWyS6IX9XApJCBpDcuQwjnVr+4I1uD84Rn6GQ/ZIRGc8sg
	2BAMBH/r+X3aIkAX8eAhgl7Pd+SzUwtwNTS+XMYdtj2Fd6w+FtM5sxDz
X-Gm-Gg: ASbGnctzAlID5pcgtgF85R3UPvyI0kUsW8hJ4iZi+eqThLg227Bx6ZTeBXzLGPC4leL
	bILTIYtVjaqMohwp2kSeRl3x2bye94Bo9rpSuYY5JWcKD3Wc6fKDrpawC/Ra/QqgRWJsPfcRAKB
	DzxGw5M8O2nSAvXqo3Lx6rSYOgaatIl6dFlYQ2hNpf6gQHNr+slR36CzNvJwwJAp+ZG8MYwdCpa
	rnaO/azOC81iNNt7ccEyyRAip3FOuuHE7eR2mVwm+y4XkKACf6ydFyzYlodgv0J66H7VIZlif+Y
	/x3zq10O1qIWPJ05bt7oVVs3qyUE14BbW8kIuj9n2HcxwoNf8r3ewG93PCEZVqUDe3BClhK6081
	7EZeQkLFdYDdMCpGrKv03xFR1MMIhiWjn
X-Google-Smtp-Source: AGHT+IHM94ZQbz7LSAD6t0BWLw0dw4XltmvObHjg9ikAWt94vPnfOCsjro/zNpc96RTnU6ULUDYJDg==
X-Received: by 2002:a05:600c:1d29:b0:45f:2aa0:cc07 with SMTP id 5b1f17b1804b1-45f2af44393mr1464885e9.29.1757794611659;
        Sat, 13 Sep 2025 13:16:51 -0700 (PDT)
Received: from localhost ([185.63.82.103])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015bf73csm57532735e9.11.2025.09.13.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 13:16:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: amlogic: Fix error checking on regmap_write call
Date: Sat, 13 Sep 2025 21:15:58 +0100
Message-ID: <20250913201558.1338180-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_131654_090363_5D9E94F6 
X-CRM114-Status: GOOD (  12.66  )
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
