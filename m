Return-Path: <SRS0=B/3x=JU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43614C43460
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Apr 2021 03:43:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5C761417
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Apr 2021 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5C761417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XmBYE1P5bbhW2h3Pg5gJNZwBYELBmt9CaVEtyhtdy8s=; b=hhDLzVMRJrudStcBJ7Lfthx1EW
	Cbizs0GDi2iGia+6h0KFelpuln1dvcJvRhuy+atvm8JsY1xWtMWaBANSgldQAMcm6vHjqKKNAteC1
	yO6CforFUI8AdjKQWtp8YMPfrkEiphOYC3r2Ce0dkf9g2kLjwXOTJtKgohedIJVfkYqdNXaSkMMIN
	k3I85D1ywY25LnvvhtoRKRJXTBOIRlJDq5MHkfCQTqDlxFG8LrQVvUijRUPy0nub0MX533XtS/Qya
	11OXakI1cXOAeONzH9h7e2b9NbD/uO8l4QnzwTpEkejp/emHiCMVgfbenYAWb3STIGH8iVFdbEPgQ
	3p0LM48A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmj0-000Vr4-TS; Fri, 23 Apr 2021 03:43:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmib-000VoK-9N; Fri, 23 Apr 2021 03:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fgzCopNHGoCj4O3S/7aTjWQg4EKw2Q7WuBQ98y/Dhzk=; b=vo1Q+ztc3yE7zkwhiNslK7kVYi
 v3yR4xMhBZfrupUNLH2EP4ZdeVscs5VPB1zq7Ad1lIHKJCxVHqBdC4BwtXDoFtViaawQ0DYxcleLc
 uwhqNUoqASashwdOM28perBapmOuYIzHAK1mYioTUFTV+PMH8d6JYJWtCVYiCq0/5cFP+Aop79qa3
 TUW/ojVP+pP+U33x8dP6c9Ea5Ue+/ANdX+NxVdBFQRrGXBu/ZBWGX9Bu3Pk/M7KY+W5N9+GCpbNyJ
 /sIBfCp3TD/nvJPsurMdEPs1zghhX1mhgSzoKvALSa1codtFgdMogaWo+xcD7iK2/7qQh95BrIZjd
 K0RzPzQg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmiY-00E7ew-IE; Fri, 23 Apr 2021 03:42:59 +0000
Received: by mail-pl1-x635.google.com with SMTP id h20so24589535plr.4;
 Thu, 22 Apr 2021 20:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgzCopNHGoCj4O3S/7aTjWQg4EKw2Q7WuBQ98y/Dhzk=;
 b=asqmV/Ie4/YiUXsaMIXBsglbP+sd3m1BS0J6xISjim/mzxmroOGKGBIiFrzLiaC0/v
 RqPvY7oKTSwi1MD9lhkv9FDqHtbtXEV3iMonv315h8XBNuMau+FS9U0VPQiHmUkMUxWO
 6Y6sy8hFErBKzTR8auoIXJLbreupjKKHJcEKFMmzTCQcNKsozvXTAkZ2xELgoqNUkIX/
 DW4hBZ22PFqDzAk0Riu78fcotBOtZ0oH2HcpknhDaK4AJhyjEKeFI4XZ2WdUOAO9IPCv
 nwJXXmyl+ZhN76+Wya4WT7KroUuL6xu2YeIBliTsXLhRoMHl25j8TlQrJucrI2GkMgYA
 UG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgzCopNHGoCj4O3S/7aTjWQg4EKw2Q7WuBQ98y/Dhzk=;
 b=kYA45PVw7Sebb322KrRRtJNEd1Sc2URh7FG9jH7p7fZdCMr6AJjg1F6rAbw83h5iev
 r9Bs8WbZZCL1ax/tvJq5G7FaJ8y4bK3EJj8h8Eue7pDRZqJLm3YrbZX6JcYxAqwQM+KU
 yjlym0Eixuf88lXh8U5+4wDWb6GQjoyXEwY8SufD7ykuVeFpuCyQfluSMDSg7FZ86FR0
 FHOzdIqMSfWIACBllaiSsSpMQuvnsAApDA1q1fVQj2ugQ/XxJXxa1UbpTl1AkpoNNNQ2
 m03eJRzfDs8icGvgayl54iQFIw7KH+v9E1ye5ImJ4Gpt0ikMtu3bLrwHihbLtaJKFMsu
 iI9g==
X-Gm-Message-State: AOAM531saqIOi3t9Ddi5Zv4Vc7RATzfdWOlFedfQ2p4YOSVU+8OdvjZS
 +dT0u7Rl5XAnejGDrYvaBCU=
X-Google-Smtp-Source: ABdhPJwV3UCwfUsdE+Vjwv61FcGaA++89VvrXwdYocb2uJ71/siMK3uFbgucYqiVGf/PRk6pC1NIZQ==
X-Received: by 2002:a17:90a:150e:: with SMTP id
 l14mr3516106pja.208.1619149376869; 
 Thu, 22 Apr 2021 20:42:56 -0700 (PDT)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id l22sm6002505pjc.13.2021.04.22.20.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:42:56 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] SPI: meson-spifc add missed calls to remove function
Date: Fri, 23 Apr 2021 11:42:47 +0800
Message-Id: <20210423034247.992052-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_204258_634825_CE67C1F9 
X-CRM114-Status: UNSURE (   8.68  )
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

Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
and we can get stuck when try unload this module

rmmod meson_gx_mmc
...
[  421.108614] Deleting MTD partitions on "spi0.0":
[  424.219862] spi_master spi0: Failed to power device: -13
...
lsmod | grep spi
spi_meson_spifc        16384 -1

Solution: just add spi_master_suspend(master) call

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/spi/spi-meson-spifc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 8eca6f24c..8a97a6dbf 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device *pdev)
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct meson_spifc *spifc = spi_master_get_devdata(master);
 
+	spi_master_suspend(master);
 	pm_runtime_get_sync(&pdev->dev);
 	clk_disable_unprepare(spifc->clk);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
