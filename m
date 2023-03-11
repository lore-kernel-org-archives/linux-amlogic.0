Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47520C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uSYHPri6yxoXgeIQSI84+wHI0m6rpJ6aFc6gzXzIOoM=; b=r2kQDQSHVs6rDR
	mAzYykg+j/mn+yzy3Ruo5K/jNaxEEarO9fPbstGgxGBUr5Ti4ajfBhxbJJNLJL27zCNfBSxcbJk+N
	KMsVniWkFuMs8YoXHGKiC20RedLtIBqDiAesBZxtq4aEY/qIhVI/1SF+1qCVHND+zNSnqeZ7XDB1c
	fCuklPRCt2f4ppI90UUqzzqs/4+hT56OPvAYJpOeeHCkN4c8pa0iKQspiD26UicEDzlW8oXzTtAZ5
	KETx2zxsVrgrs+wVpww6y02TxzXY6vKqbk1PHbE5yp/4cdpbSHidWfS0pnNtmFoYgG3uNVes8A+Uj
	YUYLcB+m6FecgQiC/Jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7r2-001PM6-46; Sat, 11 Mar 2023 22:38:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb7qz-001PLj-Qc; Sat, 11 Mar 2023 22:38:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso5578262wms.5;
        Sat, 11 Mar 2023 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678574295;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PyX46c8+7Cr0fGEfOckr2DJoe9m6ovd2AZsHWGL+dA=;
        b=WWoNc9KSUi7qyAWhE72X2HRgpUI2VuCTj/ih4zBT/epabQWJV30QRCs0nHu4AZhtIS
         8YvwMF0L7P0qb+7bQwk+2gB61pgNoT5RMPDajBRXeIzsUZA4WngAzs+tm9g0tQ7RMHqi
         5E8VFig5ZfQ/2D61B5zha4sPyn7457JWUgxl6jLBdwCBnfrvUDv8NoQigfehK5KLl/K0
         cvFKY0tXlj9O8cAGArXsSL1Cbv3hPj1x5FgZQlObvFfUJN79cPsjmNy9/5RiDutQhKJn
         sfPEG5nP3Ep8E/h5fbPt+l3ewUU+z09A43D2MRZah3Uz6/5Qj5MoyTuPOwceEW/0Qx3k
         rZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574295;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PyX46c8+7Cr0fGEfOckr2DJoe9m6ovd2AZsHWGL+dA=;
        b=uhFU1oVuWPRpOr3zGV3R+FhBOWXtmtr/o6CshKjrQem/I2M4k35pyaGIuXaYuNy4E4
         od8xL2TfbV6qBD5AgBbcb44s9D7qpGGSOgMjobAUVd0PzpYTaFvo6+yslypz3U9a8Slr
         egRlmBg38gZdAW97wGoWv6lsDJicn3y/abGX59kfj/uT6+4//NTWEmgCJvnpqddd3LZL
         4T8o7OxlsXfU18Mn1Vduj2adoUdSZoaKOtHsYlCSan19rb7p/uFcQAuf5EMsO3qGk/Mm
         /eGaBjmaju+X5bAKpuSB94sueg/6VBasl7rx0lR617mDQNASuCENxBL1v/VUPtG0e/Ot
         OoJA==
X-Gm-Message-State: AO0yUKVyCOotQ9NQ5zE/DYw2X/r/YU2nGKqsIE1yyRZlwNAnK7Bb+DB4
	p67Gg4/4bqJnCykHxp6FtA8YH6DyK+o=
X-Google-Smtp-Source: AK7set8XvvE2tksbLnhLn+bbJxVX9sO0fGdELYMtRuB0j3MerVBdi6JLLSg2PyJFh6rp946rneWoOg==
X-Received: by 2002:a05:600c:3b87:b0:3e2:66b:e90e with SMTP id n7-20020a05600c3b8700b003e2066be90emr6799186wms.10.1678574295534;
        Sat, 11 Mar 2023 14:38:15 -0800 (PST)
Received: from ?IPV6:2a01:c22:7697:7600:79dc:4e28:a7d7:a00c? (dynamic-2a01-0c22-7697-7600-79dc-4e28-a7d7-a00c.c22.pool.telefonica.de. [2a01:c22:7697:7600:79dc:4e28:a7d7:a00c])
        by smtp.googlemail.com with ESMTPSA id l5-20020a5d4105000000b002ce92af57b2sm3450141wrp.42.2023.03.11.14.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 14:38:15 -0800 (PST)
Message-ID: <9ae6f90e-e1ea-d088-cdae-7dd8a541f00f@gmail.com>
Date: Sat, 11 Mar 2023 23:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] mmc: add and use helpers
 mmc_regulator_enable/disable_vqmmc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_143817_894582_4D4D9022 
X-CRM114-Status: UNSURE (   6.79  )
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

There's a number of drivers (e.g. dw_mmc, meson-gx, mmci, sunxi) using
the same mechanism and a private flag vqmmc_enabled to deal with
enabling/disabling the vqmmc regulator.

Move this to the core and create new helpers mmc_regulator_enable_vqmmc
and mmc_regulator_disable_vqmmc. Make meson-gx the first user of the
new helpers.

Heiner Kallweit (2):
  mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
  mmc: meson-gx: use new helpers mmc_regulator_enable/disable_vqmmc

 drivers/mmc/core/regulator.c    | 41 +++++++++++++++++++++++++++++++++
 drivers/mmc/host/meson-gx-mmc.c | 18 ++-------------
 include/linux/mmc/host.h        |  3 +++
 3 files changed, 46 insertions(+), 16 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
