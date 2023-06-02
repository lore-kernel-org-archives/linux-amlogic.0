Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CFC7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywKzU0qNERz2t2LjlbDdRk3xBOxjfZylJ8a6O225w5o=; b=ua12cs39BOSa+a
	zNNCQ53yiyS2UTnEkRfIOAMtxeoi4YsPAO89rI3CwrkJLWJ7OruxZ8lJS0932rF0P2ljy2XDv2bS5
	yOiXW9cTrcc4rO0R9g8JCB9/fOy6aUVu3kMJ+xhjvkumpycOPefRHJjqwoysoV8NdWFPYLA0KGrFi
	Q2sqi81JZbIJ6o9vQ9CmloFcBWdRRWIrF941YpCwbEGsBCIdV+G3GBqMJH5twUPPgmyXWHTTA1jUi
	OQduDckmYKa45gpWaC2jD/Uk7wuj0sMvO2sSTC+XJCwU6QNULw4rS1PrRC/yqiKk087Z6oNNZq2Dp
	yJFDvLNR0CX+uusTPD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q559f-0072vW-1Q;
	Fri, 02 Jun 2023 13:49:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q559c-0072tt-0E
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 13:49:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so20798365e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Jun 2023 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685713758; x=1688305758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8bnl8GQKoT6cwlD325NEGqoE59ixJfMqJHln/m0Cg4=;
        b=eyC+VMNvjOptGOgTy3U4OFJbTt6xWOHDjCabC5yB27fsk2QH50oXNro0SlTWPns0jT
         ZDx02HwzNB8dOK+3qicBybjCRdGSHIdOfxaAnZnYsUz7bFQlSOg86jtOIikz4ntYJG/B
         5qNOfCSsRMtrhBcQhGiTC99FKW0hDXMkZ+dR/y9zL4R5yRKNLdfbFqWUQlvmdJZjm+L3
         jKCEoyWxymKV3NewlctpoGnnAEElZ+MJUqVcE7QEGQbIyZTxVMQ72GhxN1IvwM8NuWXs
         skhEgm+AgONtaBqaA+XavrEF2zH8psnsBWXRtZeFNK1hLwW132sRjLhIDUJhRvDcNmtL
         dwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685713758; x=1688305758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8bnl8GQKoT6cwlD325NEGqoE59ixJfMqJHln/m0Cg4=;
        b=QSRb/k4oaK4CrVsom5JbYgfHZb4eR8uuV0W8zB/W/p40iNE4a4KpvGq0b1ezpzUPbn
         j1iazG3vWo4k5dyPpZQmkvDQEUXnqImGmSHaxB3g6iksd1whnniEtDES728ro/zdPtLs
         TrtZJhCZNlWIpOaQ2jI9Jyz+oqC5LRzxLj5sIeI/yfcsm1rU0E0qAbk4+63+kXCxcojO
         tJ7FQraaIWcloIIv9VVhg1o93YtDvl0iWUOGpg7m2fbh2p4lsUrv0v2Bnz3HwJ8O55xl
         OVOhAFlcob+oM3kQ13g9vpOARZO4Y+f5taneT3bNKaHU1YictfAIVKVvFeG1jJRGsFsp
         P8iQ==
X-Gm-Message-State: AC+VfDw/AolnLzmd2or64fTongys4o+DY6Q7HZgLtnLw44CCYcF6BpSI
	c55SaEQcRsIk4Qll069XAsI3DA==
X-Google-Smtp-Source: ACHHUZ5S/JA1hr5rSYxSnxg7uYsN2zZpSGqYIEPOQJaeEmxWuJhheGTMro5peQL6aYr6JcOsOeeO+w==
X-Received: by 2002:a05:600c:2903:b0:3f6:1bb:1dce with SMTP id i3-20020a05600c290300b003f601bb1dcemr2073697wmd.13.1685713757900;
        Fri, 02 Jun 2023 06:49:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6786000000b003078cd719ffsm1752941wru.95.2023.06.02.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:49:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
Cc: daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
References: <20230602091416.107850-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/meson: Remove unneeded semicolon
Message-Id: <168571375715.833434.17616843568511143973.b4-ty@linaro.org>
Date: Fri, 02 Jun 2023 15:49:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_064920_116102_13ED8A67 
X-CRM114-Status: UNSURE (   4.19  )
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

On Fri, 02 Jun 2023 17:14:16 +0800, Yang Li wrote:
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:117:2-3: Unneeded semicolon
> ./drivers/gpu/drm/meson/meson_dw_mipi_dsi.c:231:2-3: Unneeded semicolon
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: Remove unneeded semicolon
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e96f099c8544a542f7cd37d2e51ba52786adbbc7

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
