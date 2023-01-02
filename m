Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADD2C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OQaQUkN5s8e+FEZpEbZwrch9tzFKt+28jZYMvZ4jvI=; b=b2Os+YIW+IXi30
	udxzeh7V+eLCPjljWmefEAUdOzA3jedDhSecvaHFnzWyJVDc6F9ruY+ausrK94LSelUidRPLC4uZH
	UOhNqJKTT2Xf4J0qfQt7X/CdqpFFG4O+0jBhpM4cHQGJyd9gU6BykYRVZTOG7IHSuncaiVhNfPz2Z
	KEC378Uz1/VhT4pK+4O27RSm+6Juycnk46kJX5jWvGPwBoFhFWkjsoCWtcElF9OOdC6EmfPZ64ig0
	HjdGYPCtJgQHlu6v79/7vmBk/L2wsVmTevmGRQBeCYiCj1/9oeV0L3stZRN94k56li01TUuWQ8SkI
	4n6X9F5DJiVW3wV5YqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHgJ-00ADHY-9H; Mon, 02 Jan 2023 10:04:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHfc-00ACkz-Lb
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 10:04:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so18102935wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 02:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A/c903RG4DRD/KA4H0kqMsL+9GohbLG+0ZnJrSJAlQ=;
        b=D+1k9L0qY0P1Ji/qNFpRhC5aixsA7eIu6QVRV9pnRf2ULMiRuUt+m8lZKp9TX8qR3g
         E1pklVDK9x3S+rMDlU4lfVWM7Yyj9Cz+R/r/8Tbn1MJ5cAHVkU2RIu9Gaau1OnaFifHX
         kFpJXKaGvnSY2xQwmwS0B7u1yOdSRk7dCwM7V9a2GEPsWkMAUWJQRR7KtleUM119053u
         DMYyMTz5Q4ZLYs7glMovTp5NAV1QL0J7seK3+rhzmDxX+L/XSwkMgPBZkKpa0Jz3JLiP
         AHXjoPl2MY1Qx05Rs34jAbqQhv3phgF7lSO7jSXb/Ghm/P/Qzaj23bzSMpIYIo2SsLpB
         nBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A/c903RG4DRD/KA4H0kqMsL+9GohbLG+0ZnJrSJAlQ=;
        b=R3lH6jbjv4Z1HJLvvNIazsibCf7/ZFsj3qn6ESIBcisL4l095U1V4eto0t4lDyBKXW
         gOOibc/IEIATeISlR3XlQixI8aPPv8zfJ4wmG2hLfwdxQlvJxofjk/1YDh9XwCkFvmGE
         d9hhWeizavv+6mdxOo/IebLYf6HP6oXcowq5gT21RwVqlNgwgidgL/B+8e4ON/VRAUPD
         iXxRj9NvfEZdFtdHTl+ZatmFL+dbdOpqoHG3lQuKrN4oSfSeOJzQBvkHxrV1xtC/zWvD
         Pyo80CuUhEEHvWuZhW57LEND9F6e7hoA+MkD20aIsqAMEXjdClE4sHdfj7F6hJ2H5yAQ
         dqsg==
X-Gm-Message-State: AFqh2kq1/TuY4HOJ69uxWcv2T8lqYnJhkFs/P0By5yRg/KyUdobmbuXU
	DcQYiuxqRypPc3x6kTxARihBUg==
X-Google-Smtp-Source: AMrXdXt0Bh9wmwk3RF4bAotZJsEsotBcms18Id+jqLzrnyIEkrT9a0ZIrdm1+6Wcvuc6QGNHjinrCg==
X-Received: by 2002:a7b:cbd4:0:b0:3d3:3d51:7d44 with SMTP id n20-20020a7bcbd4000000b003d33d517d44mr28810985wmi.33.1672653830942;
        Mon, 02 Jan 2023 02:03:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i25-20020a1c5419000000b003c6c182bef9sm50636137wmb.36.2023.01.02.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:03:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>, Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Carlo Caione <ccaione@baylibre.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 David Airlie <airlied@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
Subject: Re: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI controllers
Message-Id: <167265383013.332488.18055553575413500835.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:03:50 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_020357_810029_00914FB1 
X-CRM114-Status: UNSURE (   6.88  )
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

Hi,

On Mon, 19 Dec 2022 10:02:36 +0100, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/tiny: ili9486: Enable driver module autoloading
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e9c7cfe7b71d26ee4a9f17192632f3d0ff246001
[2/2] drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=77772e607522daa61f3af74df018559db75c43d6

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
