Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69BC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VfRH1NbxbA72aVDfw0v7PAX8R1O3zE+thyVKT3cTHAE=; b=0Nyma3279AzOQL
	uXklIrMpzSokR+B9mtxY7MSfptNngmPtKnp8KhK2tpWDefc+2LfqROaBNGmYTU00lv6HZEhS9sW0R
	1Yx0pD20g5l+fQKxnoT5fhMPZKkJOhRIs4BJuhiUviICpYCGrqherLw/eowrBQhSDxeR27ajdybfu
	DiXqkqfvswmqrBRJB/axAvsdks7sYEbaOxOC12/a5tPgX/P8lPaQEI4Li0QS9WnF6Z+QpU4RZ4c7t
	Jx6Tp1iGfD/ORHz4OWt0i7F66I4s9AOL0q+qxOx43aJ3uB4H03MjiuB+cZmSkiLW5nz9JntthIFdz
	vlPAjkhV/pCwJ3eGdA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOZy-004kNe-W2; Fri, 10 Feb 2023 08:16:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOZr-004kLI-45
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 08:16:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id u10so3206153wmj.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 00:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jXVLKKw274Y2VymGD4a2gDqwmxd0fauNox/dAl2RlT4=;
        b=uBXVJ+eAbro9Pg5IiV6PWcjseTmEXiJ11vLaY/V4hViugg5EoBABOqnkTaBWjSKP34
         8mlcokTBUVzexA0GtXq7nzZ+R/15vOaF4DRogA0VFqz5XY+wmjbKo48ljur7nJvL6QzP
         wwWXcPVJS24Jy8y/gjtipDPHai7/YqQ0CWt2a6REwEpVHVvtwoJ9QotCIu8rk5BfUFwx
         rrNNWRLTTfmyNH3OfF4kXYwcs2pN4crdEZf2b4o/GqG6efzgxEBRRlwZoLbkElYp6/gi
         jFrp1F1FYP3Z0zrunEpSEsZgN6Tde9VPsdy/zKK8A96ZIVNsnej7sNCo8tLtwy3yCGEu
         z99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXVLKKw274Y2VymGD4a2gDqwmxd0fauNox/dAl2RlT4=;
        b=a4y49L/Azvq1Iwmbfd3i2Y/9pRtiwlwf+483uQnDMBhewpdC+QzFJZuT9wyUshOYeo
         1QBqh5HTffSPK1h8itxKlzTmRkxdDnbWWyLnKcC4C/PXAOvfzdfPoykWtZM5SCllo3mp
         JJgzNXlDDcOEaX/QJHfyYJhG86EGkzgWc9sXg1iXxiGVDvZSPGdc0pvPODfH4dm5Yrnh
         5eQkqhIT0kw53BHMBjaGdj+QVbR0OLjoHj3J5e+82El8zierVrrVK1Tar+rLyujzBLvk
         AqF0cCeQOdNHsBoWskvOhrmULbNP9ou2EQeO8HX8x+WsdqZdKvK613mbymEReqKY+dPU
         PBYw==
X-Gm-Message-State: AO0yUKVVMu+divv9gVax4SPgbDcVVwff/RF/Neq6U7ov81zTdhHa+KNx
	MiakwkKuJkmdCcGFUG07L3DFug==
X-Google-Smtp-Source: AK7set9Z420tN+SeLyquqhUkMIfzLxEqhFzA7TLVEWqOomuzOD/Hg1210hLzD3036el2Gs0QGXvonQ==
X-Received: by 2002:a05:600c:4494:b0:3dc:5a13:c7d1 with SMTP id e20-20020a05600c449400b003dc5a13c7d1mr15201802wmo.16.1676016971467;
        Fri, 10 Feb 2023 00:16:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id h28-20020a05600c2cbc00b003dc3f3d77e3sm4606832wmc.7.2023.02.10.00.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:16:11 -0800 (PST)
Message-ID: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
Date: Fri, 10 Feb 2023 09:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.2-rc, take2
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_001615_170105_9A7A39A9 
X-CRM114-Status: UNSURE (   8.69  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's 3 DT fixes for v6.2-rc1 which fixes IRQ loss and performance issues with
system is loaded by switching the MMC controllers interrupt flags to LEVEL.
A similar change has fixed similar issues with the ethernet controller.

Thanks,
Neil

The following changes since commit c45219cba101f32853d011da2ba46a1b2338dc4c:

   Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" (2023-01-06 09:02:40 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.2-rc-take2

for you to fetch changes up to 66e45351f7d6798751f98001d1fcd572024d87f0:

   arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive (2023-02-10 09:02:09 +0100)

----------------------------------------------------------------
Amlogic fixes for v6.2-rc, take2:
- Change MMC controllers interrupts flag to level on all families, fixes irq loss & performance issues when cpu loaded

----------------------------------------------------------------
Heiner Kallweit (3):
       arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
       arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
       arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive

  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
  3 files changed, 8 insertions(+), 8 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
