Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F97C5CFEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+VRBQ/3yu5M6EBt9zdi2YXLKsDqxVPI0WcdB73OsXk=; b=z7Rqi2oFweq9IH
	ngdxY/aWHu74GnZX3+0eeZbNM1aHRVptU0fkk8nsYpPovCVmJc3+fsWKHxpUaKhBCAGLDa4JJk+O2
	6y3I7VQvukjc59wxP8GYgBPOWlFItUUPUBZRMvVUdaOVhrTg+Hmd2fB2O6VTZb4ObSOdp+kUxiw8I
	BA6x91xESQ3GVyeqpmA2DhiTWo6mrSxWzIqlzCedwE4iEO1i9VrJufwLGMI45cTctla+FofDx4iRP
	hGfiSKIX5HGlUTdplNp8rmiL5e/JobrqtnbjEACsTmmh9KSLLnxRs65G0VqBWXXYMI3jcNH4qDJhB
	AMpnfvMERq5DMxLeD4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70x-0000000G2GF-2nDA;
	Wed, 12 Aug 2026 11:20:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70s-0000000G2DH-1QH9
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cca0c5799eso11002215ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533649; x=1787138449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtuJK+NS7IlYpY3lUfxDpExS70jRA4KXDLtMxQhzExE=;
        b=Qcp0FEWJnIZRSOIS9+3vavnI3uiDII46c6SdKar0dOy9wcsD+nxlGjwzfLgeeV1Crd
         GNWvNhRlUVBFpNJQCbICH71rLHIXK2xCkXHAcWmBxmxgUj4jlLGzz+rx9PTuM6LAKVe3
         cCDUijZnqu80uYOfyAtS4OeSMGXlJqxCAoi6CKrESBUKr6FJQyzbUCCrDjJvpobViLJ0
         yXn+KoJ9jSexoxXTe+5tgjNmsRMIVKAlALb6AWsT8DwunYLyzijOd2BvFq2LysHUHA6r
         PHxxqXU2uafs02uOkw38cPrrKqyi/fCkZzXOCVivGD/6g01Rs7oX4q2e/OyP3n7sqGoo
         243A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533649; x=1787138449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtuJK+NS7IlYpY3lUfxDpExS70jRA4KXDLtMxQhzExE=;
        b=DcXoFt1b2VkgHSy+XXbKUQNRbImwh7/YRvU9JjfQRvZYrY/UMaQ8NiiBN3zy8/xrGW
         wOcRIvVDVePi9r6GBdy1ONG/2Zv9kB7Xu3uqdMfV1SM9U/8sbvXOzOykB4ye0hrdNI2x
         CqyLjp7E8M8SOvSyISHWAhqlboCRN5tdH30OKg+zQSJARhsFm3jrGTwPowUM9JVJajWz
         +zB7G2w/29wW2aBPKTGWkgPFXdx22JYfyCuLCu5cfL2b2EdKrLeiMo5F44G7zgIhoLKM
         jxQKWzRo2/wPlnF9/BeGcATxFxnHYuEg7heNE2ZjzFAyxE6O4BaPY7KRObm2h/+LXgsI
         AIBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5flJtgF4OlPqEwlalqGh0ztxSHqcJXFQMmdHOUZZk6RJFoM2h8sy9altcQn9GRqPUmRWhYFsvtVpyFURL@lists.infradead.org
X-Gm-Message-State: AOJu0YzuUQ8jVq/1/KRJTM28otKJ6Jjpyod+xUf4vbSSQ6KN0hDHV+hK
	T564Bdowau+1yWYXdMRHoVC7yJkgC+6jXWhZx+lkCbWz3DDBEc3AlJn3
X-Gm-Gg: AR+sD11WNt1Yn9SFgfLGHf5Nvumvxv+PIv/JoClJvp4Qee0GjuyYzj9Uf2z9823X7D6
	NNfvyF6G+1vtQ6zJcOSO863GGhTpXoWXVu0vH8ytVIxT9AGJiq6RkFhQDrPukBH2BIsO7Oi4Yil
	tfkLslkTINLoYCdPKSCZxAsMRhozSVgpe0qccB3VqhO+NkFunnl7XrDTRHj7/PX9/RUuMtRQLMk
	CnT+16+BaxKtiyvMl16CZ3vvruUIEzcur7EPvfOFP8DMwU5+24DrwOGqzHA1yX3zc1si58cb6wb
	WmMpP91t1/fK2oo8zfsdS17MMk8ZzAo4Rp4ezqMHiJU9Z65fdk2vGA3DcfWw7MYv6/KPfbgcXLa
	ItSaKafE6azRMNPkPAW3mNVr0BM1EAc7yfVh69CQ0E/acdstegxo7ODx6QVVI5yfCpJBoD97fUN
	Yz8npu44b1TU48gLfyroKB9gtAVpqz9+FvsRVzHFRXQYuVQg8wVbpU/gEp2c5pifajpZXujg+ky
	F/d/Ae4aKjybj5/3nmT4DmWBR7gcFyohL1W1vLzkCnYg5hCl960I8CA11RH/V/qsX93sgX2ebzx
	wqID
X-Received: by 2002:a17:90b:48c7:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39301490a70mr4771248a91.10.1786533649457;
        Wed, 12 Aug 2026 04:20:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:21 +0700
Message-ID: <20260812112023.42254-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812112023.42254-1-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042050_472417_5A411D1A 
X-CRM114-Status: GOOD (  13.80  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
cd_irq and continues probing.

Propagate negative errors other than -ENXIO, and only assign the IRQ to
cd_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..af94c8138fcf 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1185,7 +1185,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->irq < 0)
 		return host->irq;
 
-	cd_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		cd_irq = ret;
 	mmc_gpio_set_cd_irq(mmc, cd_irq);
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
