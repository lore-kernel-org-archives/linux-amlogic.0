Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00134CD8CB9
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 05:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YaXT1cJvfDjLjVOTT0qm5DuQs6yr9OUCw0/wwMzvCx0=; b=Re10EpdxBSNd0y
	bzfoooU09OqZGG7z4bO4gyspY9YLg7llrlSfpwlzKdGivO6X/5sV2svEcAjtTQvmE3n+5MGE3jzYV
	i1RXoQriy++ZZ2PWVpm9z1WItCobd6B8FVZDfob183GSMwksyUP/imWQthBFX6aC8ASlsW5IMdFkx
	NemieFX6lCSlYqz4dvgaa9agD/zzrA3erH7vHIxF/Y/lxR+GEyFliMbZuzN2k3KiX108dCTB/ncoP
	kHOimEzyMsSq+v0ag8HLosQMAFiFrpu32hA1i9mQzxHh9ZwGHm57nRAOINhQ34tL7vykYgJcUGjTt
	7ELuxLxRhr32sC1mTczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWozJ-00000004kkd-2pr9;
	Tue, 09 Jun 2026 05:26:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWozH-00000004kjw-2FTo
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 05:26:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84237c55ef9so2353163b3a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2026 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780982814; x=1781587614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT1Zt8eX96C5Vy0ysyPoJWLG8nBvHsoCwEXo1y0+xg=;
        b=aUX0ZLJ2CLr6wPGMRmMCQZVZm3U1bcouzA/ufn6DBWBlBOdPjeSAuk0mOOc0i6jTDE
         ULOn5dde5q+uoMAS4jtNktMtqjBKkanP8+wtA2zWAeHNPe1J2b9Mb6hQDIW7ZVU5ZYD5
         Qt8Z7Cs8UPfZJljb2AnUANIaHQQIReLTBaZ8e+U4qpPezYdwYF/ZNBmutpOwfA+DjLjs
         WFS4jYiaTd6YuwTuVgsb7/O/QZWWL9wt0E5mbMr1O9G9muBzPFjivg373CTafBrUjzN3
         KBcVfB2RHTNiLH7X39/jXmSByebUPjMDzL+5O+AMJv3qTB8oIV8vMI8BImrGUtN+aDOG
         Ig4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780982814; x=1781587614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsT1Zt8eX96C5Vy0ysyPoJWLG8nBvHsoCwEXo1y0+xg=;
        b=LHmvDQhOnWH+hGw30VdqBKHzuEfscjkRdbrdevrA7MutCCg1oTgKoCgXLkWkevBep+
         gVrTrmnnQ7k+sg4ipNrbJJqY+Y7xUoCuAsqoMgFDLlH7ly9yOy/qUXZdws06vWduTWhG
         tNXhVOeX1MNN+JTO9KyZxR0mpCx1nHJWHLcXHHJ7huKC2oAFZBFFnDZeW1f9gTeRp9wh
         4fFo9XSHcCr6pPWCNFo7cC076SsJLn7lKzFOGOrYSE9xMAfmXCkDfLpmFeixTpnGzxr3
         GgSWbFC5au8sTvNo/+qjl+yFfV2/LkzdcaDW6RaG+grtELYzSmdW6B7RTGqQdNUJ+G7y
         winQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IXVtXiDWqxFc6ia3ryb3Ojants19y260j2Dm0DlhEXI7S4p+nRtI7ahbqPDvl3sLy2DdmLDQyhB+/ojXD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyinpm7In+cBlw3Br083Lkdh0BeZpce64oPl5pFAzclYFcHK+bD
	cLnZ5kDR3ltZjkgSWL73WR7/fLcT+ikNNVuI/ulWFDpqyCWXpHrIZ/8j
X-Gm-Gg: Acq92OHseDjDa5xLZgf7xcWkL6aJ2Em8Uw58IAtwbU/Gx8I+opPShF/tO6S05faRnz1
	dFxXro9bOoOzqjpniLahOctWLTKJldw3tKr9yqdPRzyC7BxqknC9dlelqP8D1cICqQWtq0oJBqy
	HBBC+YkrY+KwdgJ4lr7TOq1AmDy9ESWA7hlCNxNxpGlobmL6gDvV+KtnvAHFkBuO/sUbQppMY9/
	9qa2qREFXAXuxLdxWNMw+EMq2jOI8T6a1SIHabJDggACBFX42QA9uwcYzUODhR5UuVl+zUIiXkT
	vRuIqTbu9G9ZgGQry9QqNwQrbK0bdVMzncJ+7RDVRzQYZXTxQEReHEA00B6vXkx7wNBCyiDNY4r
	ZKQKlK4XwmvhSFn4lyXMJIPMPjZWaun7bRSCPIjiNvKjI8aOP/vuDPAtIi0h7gk8mW32seMBxxA
	57CWm+StHdnSNzrVAuEg6o4VPDpyR5MXm7Dq8y/6sMTHWFV6bwbHaJWw==
X-Received: by 2002:a05:6a00:1d84:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-842b10b2f1dmr17770012b3a.40.1780982814465;
        Mon, 08 Jun 2026 22:26:54 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm23445657b3a.49.2026.06.08.22.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:26:54 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] spi: meson-spifc: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 13:26:47 +0800
Message-ID: <20260609052647.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_222655_624639_D6D675FC 
X-CRM114-Status: GOOD (  10.10  )
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

pm_runtime_get_sync() increments the runtime PM usage counter even when it
returns an error. meson_spifc_remove() uses it to resume the controller
before disabling runtime PM, but never drops the usage counter again.

Balance the get with pm_runtime_put_noidle() after disabling runtime PM,
matching the teardown pattern used by other SPI controller drivers.

Found by static analysis. I do not have hardware to test this.

Fixes: c3e4bc5434d2 ("spi: meson: Add support for Amlogic Meson SPIFC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/spi/spi-meson-spifc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index b818950a8cb7d..e2d19c3873f71 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -351,6 +351,7 @@ static void meson_spifc_remove(struct platform_device *pdev)
 {
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.51.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
