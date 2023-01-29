Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB87C54EED
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2GaHBVFydGQtBI68+unLcpxqG1xYRUclO9n3Iljpvlg=; b=aghWU5iJfheti8
	yp/dJ4myLxBCZKaPlbinzpR8GYeljK2p0LGzEgAWi2e9vy+FceiMHs/YS42O7nWE0ISXm415KT/h6
	P1FochNdgPE8MRFqvLETWgqox+jjK/+5VD5L9crg1IHpcZjjOmbdCeW2eCh2enF6PjS1uXnLSSVKD
	YakFRMLOcgpBBtTOqPE/Qz3/6Duq5GzcIZdtcxPaA2wOD1rdmy6fHzINQ9WNG38ST0SU90UCq0e39
	pReXWow0+d+cAibngfi6kr3O0BRi5D3n5siZ+xY4skRDs0q/rz+dS2NFzuGyRKfQbjwyPLvEt0ueZ
	vgZlRz3F0DB30t5RnduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGha-001zgC-K8; Sun, 29 Jan 2023 23:03:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGhX-001zf4-IV; Sun, 29 Jan 2023 23:03:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id z11so9383251ede.1;
        Sun, 29 Jan 2023 15:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClbLR2ycXtZtBmoRza/OwnVXwTT5zlCJ+XLmEo5PtD8=;
        b=g8/RieEufLG4r+Dms99sKaHel4hmJOAS5i/h9jYuYePsOwnm5mxw5Z1Ex6JEPCsIix
         E1eJ9fRV+X/ax7K9giLWnGhy/1hywyomw+xb+oZ+yTaldIaGu2Cww/xnMj34lA4X+3gr
         SovwQylu7mNQu7qNVTgHF+5Yk7DvNJStscveKUbc18scrgOIoB1t2AX2lLtXlECCFwa9
         aszuIbuyIvB0evUJTyTiJ5jKbCnDI6JCSTP9j4yeeXhlW44xK0sOG/I3lLIYSS8g3NjX
         6WzuLyd39XAEDk3yO7TvAvRpT+5xd05ssUR8RXI6E00SJyGwYXNVT/SP59XQB/RBYlt0
         TaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ClbLR2ycXtZtBmoRza/OwnVXwTT5zlCJ+XLmEo5PtD8=;
        b=o2PRMztarfPe3Y+euSwX5+trxPlNQOQHIm0RsQ9AvS9tw1sugr3l2uMUrnjyR6ZeNV
         fkX4BR2M8CRug12UD/s2+JiPzosCQowK4UlloS8E1Ewz8pDLwEKValtzNWDuF5Oui8Ur
         FwDss3QI/B0VkS8cYwlK+Q79QJcoVktKFe9T+lGmuRD9paMB8Q/vamhLWpXrIKN6lzbv
         hq3t7XU+lZJtvLPuVkv5+yHhEFMUVM/am3SCmrl8cykORfoHhj2nMjCNWo4h1VAPht0M
         TTeyANdAhLpW5CxJUsgPzRE2NVITi53JhOE0WCCEgMnBgPfXbcx69PrmXFnI1TEz3iv0
         fClg==
X-Gm-Message-State: AO0yUKVKz6mTsP/JpctaOaV3ZIVmbsm3l8D274lnEtmheV1DZ0XTy4UV
	F+jZYcG7lMj0KyxpmIz1dzY=
X-Google-Smtp-Source: AK7set9ckDsq2gdZ9eivTBNoUFmQ9mkK7SgOCMcECtXrBTHIME4I0GU83O6qhDmQ0gD7N+U+2urCiA==
X-Received: by 2002:a05:6402:339:b0:4a2:2e8a:14cb with SMTP id q25-20020a056402033900b004a22e8a14cbmr5804897edw.2.1675033382832;
        Sun, 29 Jan 2023 15:03:02 -0800 (PST)
Received: from ?IPV6:2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4? (dynamic-2a01-0c23-c5b5-3100-78bb-34b6-bd6e-6fb4.c23.pool.telefonica.de. [2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4])
        by smtp.googlemail.com with ESMTPSA id cm17-20020a0564020c9100b004a21263bbaasm4047767edb.49.2023.01.29.15.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 15:03:02 -0800 (PST)
Message-ID: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
Date: Mon, 30 Jan 2023 00:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] mmc: meson-gx: support platform interrupt as card detect
 interrupt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_150307_681326_737AB79C 
X-CRM114-Status: UNSURE (   7.29  )
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

On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
due to the design of gpio / interrupt controller. Therefore provide an
option to specify the cd interrupt e.g. by device tree. The host
controller can store the interrupt in cd_irq for use by
mmc_gpiod_request_cd_irq().

Heiner Kallweit (2):
  mmc: core: support platform interrupt as card detect interrupt
  mmc: meson-gx: support platform interrupt as card detect interrupt

 drivers/mmc/core/slot-gpio.c    | 2 +-
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 include/linux/mmc/host.h        | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
