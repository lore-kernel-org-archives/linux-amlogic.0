Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1353FC52D7D
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHPFsAgQRRjNHHU8OkJZ+Yxw0MJtT9BANT6+tnZ1GFE=; b=1PArpEwKvDu9y3
	WiZxOT4uFHR2zxL0o28ZBQXVqzVo8lAc5pPZoyVEktR3uC/ygw/XukB+j24opiyotr6cSOaUyEbgK
	apFSjU94ZdReZXx1WKi/ZpAn6aMnA8WdsycdVpAuibgd0BsV27T0FQqW7hWI2LpJqFQnnDQV7irln
	DWbdaQl2f4PA6PWFwAzla7PxtYZ3o6eYXDJUbFeihzKIXGARcxg1bf8ikL9EpfPP5GZsfzft27U47
	Iqaz+nPaC1j2geJmYwgk9BEJwQQpe3fSYKTtOhUe6XTw9jVDq04JVHO/pJmqN5D4p/jqaoZxOqQ9i
	LPOcegxw4xsjLQ2psBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NN-00000007tMt-0NGV;
	Thu, 08 Aug 2024 10:28:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NI-00000007tJB-2lox
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42816ca782dso5756485e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112883; x=1723717683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLs1XU+vYdzxst2Jx1X+lCyMt00FFZC6iTK2ta7VGO4=;
        b=ZDVpxjkcnDU5wcsAbKr8F2VYhu6b5uMmyy9SB0Nlplq5aMA+jULlDByOdVABSQaHYh
         YJSCyqGJ2O4u0YWcS7jXGA+uY+y/tw6MyyJA1iwBgaqNucYkAQsVkaAZ5qKwssT/d2Ax
         y89e9xca4vjc/xDKT3gu/cBYs30QhMZ3/xuQXG/xyVCDgtM8oL47URv/pFzLmgAZgu5q
         xyYhEgqu45epaEywcmQ8sXT985Kv4AkCv4Bj8dqih24oLLIFZVKQ0MNwJ1kyxSf+eZRo
         3GbvYrmMdbDH6yehpFrayR7uLRG20e5c83BYyQI79MuNBckdpC7tSneFX0tJlK0+Lqwp
         UfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112883; x=1723717683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLs1XU+vYdzxst2Jx1X+lCyMt00FFZC6iTK2ta7VGO4=;
        b=nmrVqTk6JtCYCLhnksZqwt83c5oBolfm2ehFV5/UiLhh8Ju14IHzfgc5OcpVN1KLKv
         QnSPsFG4Tehza27z/WtNG7R+HnFEoM9UrS8ub2sBxPJOjuBX3Sec0pYmU34Ed2pPbtgT
         MGFiwBNoxQ7na+eHmi3Pp0G3XRCG230NkXVZMxCCcMUZgko5ogojEnpzVFR0q0bix2Pr
         Qfb21G/x613BmkS92dKI9k/nTg5XL16MLQMIZ2ax6XYTqRO4sWGwxCysyarF31PVjTzo
         geH2tjwWWc17KVZJKWB2cB9+cYMDar5TVTvEUMzV2NUBLM2n0XnLKU8/YmdBJgz8fXGs
         Z6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU9bSnI+4AU6uHb0Npxbe0P8gYJlNvBz7hadeJeoarhkP3vB3ceiSJ32rrd7eAnGNE93yTnu4aEJtr9rRChzQuhpZmQPUSBzCujT7RjitlUwnc=
X-Gm-Message-State: AOJu0YxLIwLQG8t+yIwjEsFcqBjcxx1ht7VPDhckltiK1SS00U+34bvx
	niOAHIe1o9txflxCHWiI1zVy44SdXqnWVO5NtBcLBhaAXAoG4tN3FV+gibE+aHY=
X-Google-Smtp-Source: AGHT+IH4wfvzwM4fkXArLZT1sNL9MljhNrH8VOMDF+lOosNHTQhMGAQbXMHkxibOYzjGWqC9kpdcsQ==
X-Received: by 2002:adf:e6c1:0:b0:368:72c6:99c3 with SMTP id ffacd0b85a97d-36d2754b2abmr858636f8f.14.1723112882782;
        Thu, 08 Aug 2024 03:28:02 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/9] reset: amlogic: use generic data matching function
Date: Thu,  8 Aug 2024 12:27:32 +0200
Message-ID: <20240808102742.4095904-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032804_717804_812F3B76 
X-CRM114-Status: GOOD (  11.86  )
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
index b47431a21b86..820905779acd 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -128,7 +128,7 @@ static int meson_reset_probe(struct platform_device *pdev)
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
