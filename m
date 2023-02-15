Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE72C636D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4ipK5a9COSMWERzyX4tefBsTOgJBMrazy1W8DVRNiM=; b=MWD6R3VmoGcE3O
	QgdIoGGZAq+JukcmZA0qcBD8aOfB4AVNQYkNW0qMrq29fOymDXKdWuGonEyVWOKEoDNM/Kwe2PdMo
	cwngd392d6sytnvW1noz1OgbBiYWWzSGT1BdlWvPnClUzVKuqSVRlMOAUEe+ATmrHNxs/970PMm8X
	SEy/mV4NxMxUoym/bh0pBKsGelF9ktF4pbaPU31CGbEJOqczi/kkCgbrZCUnQ494HwHxGlYu+6iJg
	wV8NXozpJ0Ds+OTZ8GmIJCR6dgQqp7KTpTnbl/Vvet55uFk7w+yNX+yYrFnxQ2VDvyHXLx44HEmy9
	oNXpWQ/C/jGiWEpUAFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSO5I-0074h5-L8; Wed, 15 Feb 2023 20:08:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSO57-0074dy-Fi; Wed, 15 Feb 2023 20:08:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id he5so6393497wmb.3;
        Wed, 15 Feb 2023 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTcViWHxxxQk0Ikb/2jiLPf39pJe7Rrz+3yNL21eKyk=;
        b=WPADfSvT+az/YRrKSdAqlMDjZIbGLJRLRCTOlR5eMR5UiPOhaoArLS2nCL2Nqcv7nL
         DUkRqBbEQmsevCpMwHwZFhJRgIeQ0mr5qP3yaGLuu8Gl40oOaPndRYVfE5dhTT1JAQvV
         RKC39FDHEAXcQwNl0yobMv2+cFlF4zRfD5CyrLu29IrUQlyKdo4IeJI00pBQF2wtTzmn
         jZANz0ldVfapSeZnV/oZkOGVSocdJlKZ/xqBEkuY2d1LpMSWZGiYfzvVVdh2EN0w6Rt5
         mmpSqZuEzPQ3+/T4sLHrpFU6Yh141BpX8T3JlZwXUjItaPe4cQaCYkMDHhodVwNx+ruG
         HYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BTcViWHxxxQk0Ikb/2jiLPf39pJe7Rrz+3yNL21eKyk=;
        b=Vahb/ElcjlscVKRZDHgKKhb9EUmbjaqadbJS+kfRC1SiEva7RYIJhJ8YzRMQarA81c
         +ehv2moWH8Zvdw1JkTdU8ZjbUTUVp55Yw+jiDM0Aw80/BOPfCUwUEDHWGMV1veRTmGTC
         xcCCmsgb7nv36lBtYMXBgawJkOAOebaEit0FeTRSblCRQv9hRFvNq30D4ZGFCEm9qbnu
         S0Qo5eGdWYxQtCTyg9IZTM1c58wlxjZ9EouwfGF+zsT4FpbOnd4y/y18rw9gmy6oF4ib
         hBFsEr81z02l8Mp3qKIuxb7ADhUg/cG7RmPnSjkSF/N2eyy31oUNDm7/1TMKda7dmfZX
         mOIQ==
X-Gm-Message-State: AO0yUKX9aDe0v9yJntlRp6DQaTMRPEW75jajPh44U1JzXXia2E28a6jN
	gv3ytFT52hzgmZ3YmiuChqI=
X-Google-Smtp-Source: AK7set+uyTa0QX7BTiAZ+mo+ojgMBoXjYVRLYsF8uAgXuUr1HeM/o7rq6uNikq/UEFt9malAcOHLvw==
X-Received: by 2002:a05:600c:244e:b0:3df:57aa:db52 with SMTP id 14-20020a05600c244e00b003df57aadb52mr3105098wmr.4.1676491723495;
        Wed, 15 Feb 2023 12:08:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:ccee:9a0d:2992:c73? (dynamic-2a01-0c23-b9d5-9700-ccee-9a0d-2992-0c73.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:ccee:9a0d:2992:c73])
        by smtp.googlemail.com with ESMTPSA id m9-20020a7bca49000000b003c6bbe910fdsm3154779wml.9.2023.02.15.12.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:08:43 -0800 (PST)
Message-ID: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
Date: Wed, 15 Feb 2023 21:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] mmc: add helpers mmc_regulator_set_ocr_vmmc_up/off
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_120845_555389_B2A87F03 
X-CRM114-Status: UNSURE (   4.98  )
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

A lot of drivers use this code, therefore let's factor it out to
helpers.

Heiner Kallweit (2):
  mmc: core: add helpers mmc_regulator_set_ocr_vmmc_up/off
  mmc: meson-gx: use new helpers mmc_regulator_set_ocr_vmmc_off/up

 drivers/mmc/host/meson-gx-mmc.c |  6 ++----
 include/linux/mmc/host.h        | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
