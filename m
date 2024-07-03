Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F54BC30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbjvxEMqCedb3xHbXXdx6aprcDk24jtk49YbOgm3O3I=; b=TPHNv7geYYIxKh
	NH4i+mh/XHSxFrMGQTlixMMr64ZhrqQ3YcqLhVVDxBlI9CN7jZhZviAE1LMDxBBpMvD1UD+82rr3r
	PN+uJqC1cDJ9TQpPTv0/3gMdR61o5mWj9fqqHEZWZL6dTXVFyUJbrZFX5L8sTZx8YRUOeNkJ2BIjw
	J1YsPntsO1VVu9dQZI2AqB7UAjRH5VADz6g0QhRiR4n7DPtu1tl2KB9AX2Lu32jlUzifpo3co46w3
	2eQ9HE9hzxivoGMT0MXYw8NrVhpx/rFwdbNJRu4Y9SsE2YUTwz5EUgH+NOwb5Uawo8T/4xNJMmmI4
	xc7KgeZJhs1PuMWof5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdR-00000009c1q-0GKr;
	Wed, 03 Jul 2024 09:50:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdC-00000009brB-09Y4;
	Wed, 03 Jul 2024 09:50:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso2226555a12.1;
        Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000228; x=1720605028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=GO05dRa+BVZNFq0ijHV38zkTFLLZJ7xBuYYDuWxMHASnKj4ijLIDKM6/nQA03rFrdS
         fSSsFkvxhAEJvEoiuYEM0Ff2LF+1CWmA8V/tjU5g4LMzbADwsDGiFkTS+DBskBLlM/qH
         8HMdvsiO+084ZGnEytBKcHrzEwZAhJj0gPtW92PmWkGrXeq6egZ1enF6tXxgUN97GzGr
         sWqA0FCQ+j43jm4mnA13X40c7y/jX8VoZfkJBFuuoSfRXkBXKiL40/znwonmaoh2tmA0
         ynpSk7eS3VvyFkKm8eC9ScRMoaBiogHh5tB9z8v/9kLFb1CKccXD0yfb+DMBfBK22PsZ
         mSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000228; x=1720605028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjxB4KcUaWQh3jg9jUAlCf5iQpZ5CojbNVfQpTYS6OI=;
        b=wnWlJ6QpCmZTPy5iDG1al/Y+7Y7QdewrCh80PSCrbKj8s67NCLg82Y58/hKHI23smF
         uSQwg/jpBRt1OtrRiOEnHeRoWE/jILhiF87o4ZqCcaYcMbxXgwh0uS9V5BYYLVLedEAp
         9SOLzDYsDSGbsaISCzo30SD1Mvv+2zUEMlMpAkXAaLL+a+E3bFUD80UnhMiK+4EeUljP
         MWHvRF5CI5kkXsQ+j8MizpEplp6owZ2+6VveFXYozgFCk+9kfiKeA8juPOF/nAgPDJFw
         Ya16YRkqBZS7mtdGpR4yx1VQJFAjquGOYpaYcXNGzU5DT40bTMIrdBQdkTDN6dgRXrYp
         japw==
X-Forwarded-Encrypted: i=1; AJvYcCWj5/Qsca5zCy7x6Pb29bTGQulP45oguc9FzAgZdhXlvWb624U7VE2gXiSqIy7bXzBfBQZVsV4cAQpz2PixduEvOe7YrfwpIHw6uBXIzG2mxB8+JTY=
X-Gm-Message-State: AOJu0YxAaMpotikabHyhFwo+BFZrW54fyxL1M2uwP3FY86UKUKL+Tw45
	mPA7TL2Fmwo4Rd3fGQsWJQ5EGYRG9kq4ghdCpKg2d0Eq06apvAtJ
X-Google-Smtp-Source: AGHT+IEu9wfxofZHAUHv13UpYXfpE/fqLZpj+TDjnY0WusdrAi5dE3xvADca15im/1AFnBZLLs17Ag==
X-Received: by 2002:a05:6402:84f:b0:57c:947c:52f6 with SMTP id 4fb4d7f45d1cf-587a0a0e63fmr8194901a12.26.1720000228030;
        Wed, 03 Jul 2024 02:50:28 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:14 +0200
Subject: [PATCH 01/10] clk: meson: a1: peripherals: Constify struct
 regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=786;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zUIhNaJB9vytQBaKjIhITCcZRZzf530pVUJ7sHGUvaM=;
 b=AiazcxboMt3P+LY+hRRrue83xM/NS7alWnXU3z+f1NiZvmZK4tScX4flzKSP5LfXviBEcnrjx
 ODWLulzhRzcCq5gs/K0LdUZbMa7Vo+Mvv37YJvGBTZSCyUOk8z6bFL1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025030_113166_76CFB528 
X-CRM114-Status: GOOD (  11.56  )
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

`a1_periphs_regmap_cfg` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/a1-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 99b5bc450446..728ad13924ad 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
 	&dmc_sel2,
 };
 
-static struct regmap_config a1_periphs_regmap_cfg = {
+static const struct regmap_config a1_periphs_regmap_cfg = {
 	.reg_bits   = 32,
 	.val_bits   = 32,
 	.reg_stride = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
