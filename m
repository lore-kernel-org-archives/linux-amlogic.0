Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F04C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z6GOytjhOhig9llTEfCTPXQOiFBIaQtQsTaSYozgjyM=; b=HxmQMtrs1EF9H8
	U+6so3qBM7897Ehzz3k2nYrDL9kwOjykjSkqsGPxh1lcUGcPG52kt647j0sOx3odz0cszVrTTxZYC
	wXPU0WCCb162iRXuvyJzMThyKtwC3gs8IK4zPZkV9woLFXgAIIbcPg/5TP6840cdtivjModxSYuhu
	LJNKxm10hUZ/RIK2x+PcZmBSz1KYgZrkv2JwqbvS901ZacXMf8RgnkgA0HUD9o83pkKqWor4iieu4
	1YtQo5JM0XY723xGkA6KlgQp1uW2Wq32tMuWcZ495BInyoGEaAyyOlbf34CXXYzDfuyHzUfeX9kmK
	5LXL/yijeVh8B91gZAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMOy-00000001Dh7-1CPF;
	Tue, 04 Jun 2024 05:08:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMOt-00000001DgL-3bVB;
	Tue, 04 Jun 2024 05:08:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57a68b0fbd0so1454416a12.1;
        Mon, 03 Jun 2024 22:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717477676; x=1718082476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/0KAwhBMFj0xeLutKDQ0UoKA+IxDQr3IVwvdATPXUI=;
        b=HYAPoB2zfao/UU8XtXE32G4fJB6ggGZwKIjQiJfxTImbXxPfZysODz4waI8V1seJ1M
         dkB2Tc9wRh0bUzzfbYn2y1Cs+nrqchIbJwyb+Y2AemYOajLEBLcpcz7S0yKK2GJ6EKLE
         FovtFJGQYpj3aRUsikLinvn68enaszlaitSDCi6Za50PuIDZ99GunB93B0/394e3WeV1
         wrhTCqo6Hu1Eib3ZtQg3bb5PdIfK9Fddun9G7RbCfL2BcZ8lj6JUFcgxJ6UimIn8Ozbu
         VdNz1Yt7Co/lyy5Qi7sDxYaDTaH5/erJ9VTmPvhr8StZq5acReFVxp1r671eGhlGTO9R
         Yq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717477676; x=1718082476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/0KAwhBMFj0xeLutKDQ0UoKA+IxDQr3IVwvdATPXUI=;
        b=w90dgOKcHolItLKiHXG125+Ejq54uyM97GHfTFBw8mGJ5UGsFMEB4gb4LdMY2cxHxi
         XfcavN0wlJyDKtAzjWM8CchXoF6yOeDggRbKkGodQv1CFlrj9RyrOVoRFQLtKjqU/+Xr
         E9BicwT+ek4KdjRSODBrLTD9bows1gsN2n4KqYEt6z3wFdVZZtODR+zD/jbC8sKFHc/R
         zTcmtfo4NvMEQf4YfI1M++B2ssddUJ3M43tEpdPi9S66krUeRFZE0v8NUcWN+D3rNAxF
         1cHJM2q/pNxUD+MAH+wEKp6QGCcE1PSqmATr6WySSYt+wacf4WkEOOKtY4PQ8FWlxaKf
         VGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNs5zef3dlprrPgHpSnJ5AIFMGFQ/iNgQYmBOY6j8Dj4TZYGq5tnYVgW7I8/pe8o03EvsI9VJ5z+YNP9wbdwgNasgzR03TLIc9nSBYFMTrGxMkr9nju6CCflzgZdDAa9CMeleHCQJQOremdvNOftGnwoe2h0Ocbg==
X-Gm-Message-State: AOJu0Yy4YBMcXZNFfvWew+h4cqCKZ6O6E+nWpbH0xKyO3vNhKazbtUpF
	+5v5X1cCIiIW7HgV0BY3bkok3vlMFHdHoYP93ZZ71piQX0mJGSaa
X-Google-Smtp-Source: AGHT+IFqaCg6GVKaRQTD4ZnkvFD4mcPd4vzIPMyF2qE+BIWUTXix4cOl9OG9VejbKdNnvWP/5W0W7w==
X-Received: by 2002:a50:a694:0:b0:579:c2fe:886 with SMTP id 4fb4d7f45d1cf-57a43c36782mr5518061a12.14.1717477676221;
        Mon, 03 Jun 2024 22:07:56 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d45esm6636673a12.62.2024.06.03.22.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:07:55 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905L ID
Date: Tue,  4 Jun 2024 05:07:52 +0000
Message-Id: <20240604050752.3312468-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_220759_921677_00D967FE 
X-CRM114-Status: UNSURE (   8.62  )
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

Add the S905L SoC ID observed in several P271 boards:

kernel: soc soc0: Amlogic Meson GXLX (S905L) Revision 26:a (c1:2) Detected

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 6abb730344ab..7e255acf5430 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -64,6 +64,7 @@ static const struct meson_gx_package_id {
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
+	{ "S905L", 0x26, 0, 0x0 },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
 	{ "S905Y2", 0x28, 0x30, 0xf0 },
 	{ "S905X2", 0x28, 0x40, 0xf0 },
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
