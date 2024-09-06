Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB88CE7AE3
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDB+mJ8NnJVuw4S/+39ioKqtowivvXEs2McmPDbQ4TQ=; b=Dk+tbVcDNB0lmk
	EWJMvYhmwh0Jbix5c7BnKl0v1hR1KerrajGvfGD/1QPE07JPA1t5rmthPyZ75tqZFzyY12cm4FWBx
	0yNyD0XV0DKJ+2ENeZTRW8MGMBamHefiIPxSIu6yepLxZgjlWxFd2tArMBY0ApT0TOfbY2lNtliRJ
	JiXeuAtw9aIqYHaZbwwkCFYMeKAP+pp0Ttr7SKE5gwtc5G43WDlo0+Hp0juNezZ1dAGp6eS2q7rox
	BxWUdvYi/2b17U6u4kwRqBU+1DQsv/d/iqcTBKqV3QpW6sidQywDTZ1cY7rpdNud0NO6GSARGtrWt
	7TwMiXNrGmt0dAOzIsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZB7-0000000CN8S-1tgo;
	Fri, 06 Sep 2024 13:39:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7T-0000000CMAS-0JBj
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3770320574aso1123168f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629721; x=1726234521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0U3ETN12gpBLws4jxOpUFqH+6wugx8Wdm0xkOdNhP8=;
        b=NsQDNGaAH3TKgPOsWS9Rsz+v/UEDQB03FAm7SCefYhfRgtiIRQz+eqS9pLJmcqwoRw
         U0zPwkgb6SxWT3UAxkoMq3tePJqr7+MUmrPVCehsR6i6s9RELW5yO+7XAife6hRgXZ4x
         4b01UJHebLYoQlCB5ZGKL1AAHNIJ3toX1c8/7FqF5GymmZMUQ12aZEQ5RFebnD0baVWO
         8P56WD5lwouX+XDyRKR3hAlJXpa+q2Vj9K3s8BmakaNo+JAfg/CX54nzRb8czD1VLBrZ
         POBDjXiBTxdp3GVK/TO1YeMSMdW1wgmVDTAGhsqtj+NnyagRBvDIMz2VR5u422z4T5Bl
         yEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629721; x=1726234521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0U3ETN12gpBLws4jxOpUFqH+6wugx8Wdm0xkOdNhP8=;
        b=n+dxRneYZv0TO9FB+tU+xm28QjNC5sGq9ebIzTrubBYJsZcC1UwQcW3RKWbMnYUPAN
         UkD3C1bzrJGt15GtzWDiIEHMLtjRXoGLlpKdDvViUZ2ZJaCtn0IKk8mnFFELRZlg75Lw
         cjWjdyotrrrB1VqLsu3BCQINx9Xk8w6LokH9IywZ9lD3gxAGXS6zrV0uvF69yl1c2agX
         UDqHcGORD+O6EUpP9Kn/2ApdtZSqAY5ym76FH+EfUj41DBAndS0TXX/MMUPxf8oGMWfp
         OamE4G2akTNcqqNwa+QGyAsapXzK2I01E2+0JA+Y7eYeWwCvugDU+LP2sy9kDtuNjLM4
         kFGw==
X-Forwarded-Encrypted: i=1; AJvYcCV+W9nmtqFm7HMDTiU8aUksumwpVH6H28qPXMPY2yIJV+mGEJ8VmcTgXjZgdjsprwiy3F+25NWLzajGJ6td@lists.infradead.org
X-Gm-Message-State: AOJu0YyCMklX4D4VnfQrkWOoJYcyPFnJdj1W3jmP2ylspOBnLxEb2XHK
	v4bicNjsMQTzUrFsdXi0M7Kpj+Bb9Yknzk7jWkQnct1OzLaZZopFmhxRBojo774=
X-Google-Smtp-Source: AGHT+IEck+AkM1e/F0oOBSh0/l7dodO/LMFTYdYmPo9Gy7QWWQWyEDnvdz0QhdH2CJo/6tO+xwN3iQ==
X-Received: by 2002:adf:f582:0:b0:374:bb1b:d8a1 with SMTP id ffacd0b85a97d-378895c8952mr1681058f8f.13.1725629721019;
        Fri, 06 Sep 2024 06:35:21 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:47 +0200
Subject: [PATCH v4 2/9] reset: amlogic: use generic data matching function
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-2-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TBFxeGrFtyl6fNkBC1RzGGAepksDKxjvf8LT6xC71TA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUPlC/gkEKuYmmJSQFov72bIlxBAfcOhgW4+
 tmdinirt7SJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFDwAKCRDm/A8cN/La
 hQTKD/4pjOSZAMxRwxoSirqwtsKwMZIFFQfvnMpj+2MVvE21rHthawohviXi+usbOJmPUVQRXAJ
 HHFX1T+o1qac3mBV7OJnyYJUAa9oyOuAEtLVCacbf/7TWUqZMXkE94/X4wCXh4Yt1BXpb8Q6oSU
 fIO6fPEWnp9RMgV8/nxVDYsV90TieDzn4NSn83gi/HVVTNJ2yXNMy2DjFxnuX4z4SfDIx3z8vlq
 DItjRZA468lzaiwM296nMgxYQsaBbaZIYHJbNT9GR8RJZB5GHo/3mQc/+TJavvQ3SD5sfbtQ9PE
 HTz4fwQfparPEt/35j1yhRdt03MA3szrle8mRZOTGA65+ZqlnHRrS6wdMl9DYApZbWbZ7lllcKC
 df42W1hHxnAPHGO+gpFakwaSQ9eNrUgS3p5Z3fQ6pZ6FHhltqf6pSbKDUh7YwTMctpA0eFgoaBI
 pDTfOkbf+ssxJLITWhuK0vCpTSuxUP7HjaKS9ImfIN6RNskQnkW6uGtuk5/fcWR2bEgy9MTorKU
 piCPrf11mlVRG3eqdlUyn73x36SIg9qHAfpSe8mprHa/ns8KjOlQpdbeaPS1jlvr0OVz4ky8Xsw
 3xH6ZVD2EvQvgiXrz/y1T7v1MNRxSV187cbhXr6cfzb79j5HqCXVQZ83oi/hgop+0Z6dVJmkJ0l
 O8Q4U8PHuYbHXdA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063523_204545_B4B7E1B8 
X-CRM114-Status: GOOD (  11.49  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 9dd38cc209e2..848c2d88503e 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -134,7 +134,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
+	data->param = device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
