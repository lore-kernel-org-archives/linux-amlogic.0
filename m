Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F69CC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+7Fi/5ifolmDBZlGqHkDfFosWb1jzYVMLuJux1+Ug0=; b=YZ+0zAvYxH89oQ
	WA3xvEM5+52JnKOAt+Mrn9GgKC/j6U3ql0u0JEVbqyUoXjLc8orubTAFNh1mAEyaYLMdQojY1/BRv
	kMo2KDxM3toUEij5GoQ2xJkEdFmT2GLHwE28Wq79oey+F8OoP2U2J5YKZciBgInGm+tcAPJE54I5a
	q3A4+jaG3c1CIww9poanQPLNGW2kyXKQBsbGxu6ZbcySwUPUUIgN2/4cgC5RC8C+gonSLy32T3biH
	yobj+sJCjjZT00m7aghLYsuO3RwA9WSBIC+lTExDnkWeYsSfNilH+EtznYavhwoBlVeL8WuaaDZ6U
	Ne3rSGM/HsehEl/BPP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxV9A-00AJyw-0i; Tue, 22 Nov 2022 15:25:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxV8y-00AJtw-21
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 15:25:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id v7so10988727wmn.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 07:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIshvcW+dmN6wr7Y/QgpYruJjGhmzM7qSnM+mWsPGXY=;
        b=EUzX1hweNmJjDIs4y3ET5oXPKpoVdXJC2g56T4XMcQGH3/+FNZk8ktxpn9W6fTilmw
         GV3D2G/9Qa9OvYHeryAXFpHuPMnnoN2QmBX7uITYBPu68zRcEHnD9dmKkW8y15nwTvzV
         WN3KAgQnDajLlOH3vjH+7hbDCXPL0dvSLyeLAgtl9otsY0KOshRoF/fhr3R0/+ZpF35t
         OS+aAs0AslKksBgLhoCFH9QsQecSK5yUXlCg3c4aVeLt6QoqtvXngdTw2TryJ0l/5L7C
         sw0z7RYAU4mvgwt61P/2yqDOfBcMnPJ2nXk5lwe5b/NjOxqMHWdA4mwVj1z75gmNJGzC
         3oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIshvcW+dmN6wr7Y/QgpYruJjGhmzM7qSnM+mWsPGXY=;
        b=HI/CNJC7Sjx8n3JX6IsiuFEaPikdvRcNDLDkHTaQXwwIFTVN91BXxfcHRnUZwScGWP
         /L0q7v5O6rqn2mbSyS8JkBsKP4gKgpGchWMOt0RH4rQ0rKk3YXj7wwC9yyvNac0UUuwX
         0BICA8rb1GGQVUKzR7a8Q/fstYYHu63/r+b8CkNiMhr3J3ZQwGmORJT3tateUMnfhUoh
         5amFiwIuC4CKSTlHBngHGfSNXCKTp+Ea8LzuqD6OQupRhj0u5Z7uvwYoORYC2QjA546p
         bef4BiooiZEOCLC+1nHvLkhzIz7r9kFCQMUGgBoSOv+Gw8iwbow4ZK6ZLR4VEtbJd22r
         +djQ==
X-Gm-Message-State: ANoB5plJflO23/t8lFmFDpYzWiZcOcgBuGjp09ZTYxWX6J8oTCzmaVb8
	a/pOkXQ6Ijym8Q6glPHgT4+2xA==
X-Google-Smtp-Source: AA0mqf5vn7HfJEjIkm7I/bW7zOpgzzDn48vVJxYmegrRLJ1yP+FH5ahqDN1yPvXihrYvaDUuarJFOg==
X-Received: by 2002:a05:600c:2e51:b0:3cf:6e9b:21f1 with SMTP id q17-20020a05600c2e5100b003cf6e9b21f1mr2893276wmf.90.1669130700262;
        Tue, 22 Nov 2022 07:25:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d5911000000b00241da0e018dsm4906199wrd.29.2022.11.22.07.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:24:59 -0800 (PST)
Message-ID: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
Date: Tue, 22 Nov 2022 16:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.2
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_072504_190417_02E0290E 
X-CRM114-Status: UNSURE (   6.81  )
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

Here's an Amlogic Drivers change for v6.3, fixes memcpy vs iomem type warnings in meson_sm driver.

Neil

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.2

for you to fetch changes up to 7dc69c7d073e6004a281db8f7f15cf6ebf702ea0:

   firmware: meson_sm: Fix memcpy vs iomem type warnings (2022-10-17 17:19:04 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.2:
- Fix memcpy vs iomem type warnings in meson_sm driver

----------------------------------------------------------------
Kees Cook (1):
       firmware: meson_sm: Fix memcpy vs iomem type warnings

  drivers/firmware/meson/meson_sm.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
