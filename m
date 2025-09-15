Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B54CAC58E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Sep 2025 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbWyXWHZ+q81IPXlWHgM31D2jvtxiCPr9ns9wbma0N0=; b=ezHjLWAIPAmRZq
	hlnfKGhO1O/xdqmAuiUiOxv89LHYZfczm0SMYojlpdDNefxcpEYHFFfqsSThTE2y93KceD7CVlA30
	gGaQUlFqSNf1J2urtTzWx7hIwThmfHDq+DXyBXddWQ1DvqGmISXgkrYW6wNJCZyrWEuoiS0pz6/la
	bKaQtevW2YJSuhwe/3tIJcFnIrW4Ssy9NwNKCfjliTDMsKoYhxP1M+HJLbsIyWzpqIIDqtaxtfLdQ
	d5JrvTv3SjzDZa77x47zJGxFDwurgMJrPdEgyVImsgBvK0Q8CvCbb0glP+q6CT+5RphxFmvFPU87R
	/3Hkfc8ImmvCdj/6BSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy26K-00000002rpv-2a0X;
	Mon, 15 Sep 2025 05:50:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy26H-00000002rpA-3ZoU
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Sep 2025 05:50:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso7139915e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 14 Sep 2025 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757915403; x=1758520203; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/wBl0xLLFWVBpKxMI9aJF68zcNMG/DejRgIpzGZk0I=;
        b=QNdJwNxJ0h6iFL5i1C9o0ujZVSYqt+l3xiY4ZTyUYZnqRdExlvWeSFNzE3Ql+zRtVq
         /dQQGlOkcL+h6oKOT9XUIdii+vGRf8ABZkJFfNdAla8OdOSCOaHgwnU00ChaLAxPUgIR
         5Bu5WFXzmOgIO1/YdUb+1tWlvrDiWNDoT08ac4izWCfJoRPJjVLV5AFeUaHnxlHdScjr
         G8NU+5qPatZp1jIEcqonZpeEB7CJOf7w+ZG0l0F6HXS/eIz7a23kQSUhqZyaccPcAZsy
         zRd0HGC4Azvag5ZURRga7yMOG0SX3JR44kH5iiZR0MiGGQEKoEA24Adcdoe2vtbQlb8g
         uuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757915403; x=1758520203;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/wBl0xLLFWVBpKxMI9aJF68zcNMG/DejRgIpzGZk0I=;
        b=cbuc7r5BjI+KOuqjLgRMKKd7SjkLLJGdvB8S8UAQAlrpP+HpQndphxmjh1IwfJHwYf
         wbEtznsmQvOj9+k26QDBt/dk89Djc/JfE21d4BOI2LIdaV3XsMmLFRSIQgiWsGyYSziY
         4M1iZ8AKpULR7qhiSSFVVSOWk2Krdinw5nzGIBzCR72n/7ZVlb00vdXYQBl6THOEpYjb
         /4Bmc9e6emyFI/4LuTAxUbpm7A+3YuRkd9Xhak56bPOYDLyLMw1KSg1fQubU6tYEUqDY
         SKfqmbriSh2pTT+OjN2y88ShiBU5gTnJTc1F2kDQpHJTlF074qNYgQNk/cGt38lG+zl0
         DoKA==
X-Forwarded-Encrypted: i=1; AJvYcCUW5T8AkIqyCVBWH3v/0fe+ujyweuqYEdh35Y1Ef0fpCdslkKbGBqMXrjcVsvlamTKw62ien3nAO9a+hPRO@lists.infradead.org
X-Gm-Message-State: AOJu0YwXgSYRyHnrOjG+hYGQ/jmE43+L+qzRE4007Q8ggJ4G7szTXhh1
	V9YvzqJFqS5GT27yZXBs3OhM5+ofvmfeJs4KY/y7ehhGViw5bM4Ced1EYlo3C8xGeqg=
X-Gm-Gg: ASbGncuj6Orn8F7n7AJCi878AuBdNJSK8rvZMJphpI4BAFt4wSCr4gxcMgBl6Ez7PlF
	kYAFzVzrJlQ/579j+TTNbxrqC0vibCJiFiSGMMNoIAhMIw29FqV3FvST2mLmrbZysnn1RYcPc0v
	l1wxebUnUO3pXy+8W2n5mvOY0ZVZNmCpG8boMSdVxiBUlCYorDoVgFoLbdTWUbfmhpPtmiLibsG
	SzZwBUJiIAN0N4BX19V3ASNR97vVrMbv5vLubcFetzIxAWEKH1H4S9qN/OCMy5st369GqtV3XFq
	33Mo+tb++aL6QGKw4aGPWZ6lu9c4FeKu0fZFnlf3CCvMYx2RjjM+xScIYssH6+k2mg2KUO1uP4F
	qUpEUH9Jo1cO9p5EBasqnDZ2m6f+NXiRt/nyhv3JnOKlisx9C
X-Google-Smtp-Source: AGHT+IFRoam51kLCQlognqaLnDSeb4W/WyS/huGGcdNg8zu0xDnWYvxEcLms+5oh6bPzNGICjmp+CQ==
X-Received: by 2002:a05:600c:58c8:b0:45d:d88b:cca with SMTP id 5b1f17b1804b1-45f211cb94dmr78596335e9.1.1757915403521;
        Sun, 14 Sep 2025 22:50:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9996f384bsm5624675f8f.56.2025.09.14.22.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 22:50:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:49:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Feng Chen <feng.chen@amlogic.com>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: amlogic: Fix some error checking in
 aml_sfc_dma_buffer_setup()
Message-ID: <aMepB7E95kwYvx0o@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_225005_905052_994E041C 
X-CRM114-Status: GOOD (  11.93  )
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

There was supposed to be a "ret = " assignment here but it was
accidentally left off so the error checking doesn't work.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
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
