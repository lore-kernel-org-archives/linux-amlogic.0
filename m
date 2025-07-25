Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EB3C87FCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jul 2025 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KaUidD5yNP9d7Z5++eCtJtqwXfR4S610HMt1f7tCJwI=; b=OwcvFJ8c8jSXb0
	bzdFipNso+/280qYPBPy9PU81vnlJ69cZuC8yLTkH62bM/tZqATBMnk2i91KGxShtVzl7Wo7Fz0I2
	b2YQ6SwDULhy567HANj+7kFboLIWkWoF8+g6LmGbKCwkwSxcugpweF0lbu8dxfwih1QqXzysy4/zI
	gDrnrXtnm9Ygs3t+jSQG52apsxyFxiggJ9Ucl0nB+of4hFiljw2KTEmQzNX1GURR4sgWiQPHe1Iif
	R+WVMO61oOWKg7w5E3YBppr8Lps28wwwEPtQhZnAEIWpWXYn0RePTixygzh6CXl+GNuyiqbY4QaXb
	mP1pW7YPkT5MYoBJKdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufNFl-0000000ASLv-1zwN;
	Fri, 25 Jul 2025 18:34:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM37-0000000AJZx-2fVC
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Jul 2025 17:17:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so19975205e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Jul 2025 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753463855; x=1754068655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYEfVFgUuHHAe4nANqQt6FiSWoxhhUOMDeuUi1wRFwk=;
        b=HBxOgxtFTZ2ZPsdWZJVln/yBFv9HzLHFZj2pTCEHZ7N47rIr+u5m9J/dMyXQBXFDu4
         HK8gCv++ayr4ikVmkPE3hkNXn6V5VWuJee8gx+n9vENbhUlVDaGSkSMKE+a0VVZw2eB4
         3uxHIVI4buthRxGfbZolWJlFxUQTbGE3rm2+pF5KOTzX9zfBdjqhtmmTsb6S1C2HuD08
         cADX1lT7BpeXICM4u9uB++QHEiZuMeY8T1ao3APkcoUksaWIqQTc4CykLkiZX6BlR/Vx
         H1dbIm4vn8nFdW+trGN9Q2yEQnLq7lfCI9FnYnsP3uRyPBOLVjqSACb/hPW3xsf7hhcW
         OiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753463855; x=1754068655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYEfVFgUuHHAe4nANqQt6FiSWoxhhUOMDeuUi1wRFwk=;
        b=gF32ImeJNw+OSM5iHC7x+3Mbt2uC6y7wL4LRKU5jo6l8eVzSHbYQ9Jz6nZWUTlEMIX
         zhEecA2wK8J9xHCuHkdUOCJI0uSVONT3mHL93vyjgXiOxLhKfynzicTfTrj38t5W4glZ
         Jun5iOla2FiJ5A2kzXaiXbvaScAGE9o1/jylMj7uNZknQeJ1q+P+KhYy6qZrtTTHx1Y4
         4/MNfLiOVYRIQSnzfLZhLAtdrCx7j9NjolhcXPquTuw0vAzdaCP1B6k6auJTgdQ6gQXt
         H97/+DphQcpMDpUET9OZu2RB/uULyL1a398dROony8evVb7Nj3xhX+kRc26QGBNc9UD7
         kn+A==
X-Forwarded-Encrypted: i=1; AJvYcCVC9d4Ete+vGFelzh8Ll4QwZfWfKClXOGKqCczcJaPLx/sb9qx3HrVM3QX+jQH5T0FFRa0xGMqmfGvf/2u1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu3BVozb5D+Pvvq+DyAzsoQD0WWT5a8CmlpTVAaG5aRwsRuNd6
	Tpmb1DXvCX1jX1U4WRLx37SaUcSRfMNVRVXQJ2YiD85M8XYqc96NoF+s
X-Gm-Gg: ASbGncvwdy+QlEIjD6SxF2YrMgN07VRHuHUbEkpvqtfGqlwvSa6E2JEiKTWuoQdpSuI
	L+my28bo77MXwIckSkUyFQmjUqMlcNuciMS+k04xVS974hcxUpvGmJDOq/2UiMF+HoK1JYQJvWh
	CbxDQMmCUmbTyAbIyQyrU49CGyfrRmItoDKbfJtih62u9EGY9w7IYg5Z0niiR/T68PgUX+eoPd5
	6ie2M//S1eyoiKqLEPexwZv1iduoz9jW8WSfAfuvIZ7AInbQe645+oxr4+eAQd4rHsyhNkgbr75
	p4i8nitUiuMRhOky4ErvktEk8gnLrkW4prX+IGI1FPGFb3GTukXPfHAKWRKR1dfa3+yrrFVSeFQ
	OLnvVhDNMpAnMlr5AXtco
X-Google-Smtp-Source: AGHT+IFb4M2x/WyWLKn9ceSAsdqfGQJveOFeSQN3mN6Pu9YA6R/D8wn9Bi/6mXDLoSYpOQ3z73ioiQ==
X-Received: by 2002:a05:600c:12d4:b0:456:23e7:2568 with SMTP id 5b1f17b1804b1-45870580784mr44472685e9.13.1753463855174;
        Fri, 25 Jul 2025 10:17:35 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f104ffsm393174f8f.66.2025.07.25.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:17:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: SPISG: Fix less than zero comparison on a u32 variable
Date: Fri, 25 Jul 2025 18:17:01 +0100
Message-ID: <20250725171701.839927-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_101737_673718_2C16F495 
X-CRM114-Status: GOOD (  12.14  )
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

The check for ns < 0 is always false because variable ns is a u32 which
is not a signed type. Fix this by making ns a s32 type.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-amlogic-spisg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 48a5325b4db7..2ab8bdf2a676 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -163,7 +163,7 @@ struct spisg_device {
 
 static int spi_delay_to_sclk(u32 slck_speed_hz, struct spi_delay *delay)
 {
-	u32 ns;
+	s32 ns;
 
 	if (!delay)
 		return 0;
-- 
2.50.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
