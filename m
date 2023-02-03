Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83541C05027
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xmmMSXh3RLnVREZTUDzhCIr8Qpe/9RX9heViuo43ycU=; b=OZ5cxgSmimhcJ9
	nF33D0MREdFz+ZhS49F/w6v0dU2qcU7u+0cc25VIOkoXaQLFCIatP06X9kBqF45+9wxgutNtIzw84
	1lwAG3BEhZmbUJ7yfCJZRGFqMrwuGigXDkLSkc2EbNPhoViyDZkB5H1fZQ6zt98RjPFOWOS6pRQdB
	VUlKTblCIUwWgPPLXND7JJeQIM29f6BOuyc/UleDmIM0FzPCmyVCybc3ybPhLGYMuhDKm+u3ZqcnN
	akqaMttpJLWMxrQWa4FfTnNbx2XGKnfI4ijN8rFLZs5qkllzDVC9PjJ65VDWfp7Gc0fUr3/5n3toO
	bgJy7l/npp4SPaYu1lYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5pR-0043Qt-RH; Fri, 03 Feb 2023 23:50:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO5pP-0043Q3-7j; Fri, 03 Feb 2023 23:50:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v10so6626275edi.8;
        Fri, 03 Feb 2023 15:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hulx9pXue02GHwO2JZRcbOSksJK7xhjVlzgJbdprMo=;
        b=HtLWD2pGgETEXzzwA+UPcEI32tBTWDv3NuORBdQoVE7jeJ+7O6X73RzHTk1pVA4rTy
         Lm9P3/7CM6F1MXbsXaWpWN1+pNRMV3nUL1nOJRhE99NUq7cMwEyvqY7DusEdE/Gt9zfE
         Ol/9AD7Opcqu0WyICPgcPE1+bzIyuqKTkPjPdZDyFy90Ac6VUF2gKHxk/tpbpe/NXPLV
         5dugzD4guMz9eIHe1faSXkXc2VYj2z5fycmcf84dX4SeqFDMbjy7LKUyGjT4vkpZf7W2
         UhPBMocODOdEkzzXLoRi0o1sX+NOb34r+JifAj9JDcVyx00RAdP2vJ3UtawvLsnTp/uB
         3Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Hulx9pXue02GHwO2JZRcbOSksJK7xhjVlzgJbdprMo=;
        b=xEOOCOl26WHZ//zp1LLXFDyf4G/dSb8iVf+QlpgQTWqs8ML4+cD8qECth0g0Xw6b1q
         P8XU9q4q1lrbE2lupHci4ArCV2Mvxrgv7A+hiD4BSV9w76SZrfZfzQNYYG2D5ICOznqB
         40Cw2IInhStGvRnU4j/VfqAqwcJ/qmuAnnfvWP5WyZnBv6uRtHgVnBBEZm7GUw4d5ERj
         X3Mvo+R/Lc+s374VmgGbrehU3R3fj/rLMBxV1kKcVXpPvs6QIxbQyBomHbiSTym2CtbT
         GmpkD6NIC1DS/tv7ds6QTomXu2uCxDC+Qp6M7KR0lRzryor5xnBGx0sLk2JkgMnH7zkL
         mLkw==
X-Gm-Message-State: AO0yUKVeDOXwy5ZV4KxohrT0qLhVpGCoowlK0KNaCfW/lu4rjON8dURa
	kaAZyvBnX+UdCijvnMEbiyI=
X-Google-Smtp-Source: AK7set+EgMNZDU2u9B68XyLLnrn177SltCeKS5lWLaZK+Pt2BOaof72K67+fLYohCBVOXofWKgDNXA==
X-Received: by 2002:a05:6402:1cbc:b0:4a2:54ff:aa81 with SMTP id cz28-20020a0564021cbc00b004a254ffaa81mr11543566edb.34.1675468244515;
        Fri, 03 Feb 2023 15:50:44 -0800 (PST)
Received: from ?IPV6:2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7? (dynamic-2a01-0c23-b81c-5800-95fd-ccbf-6c44-23f7.c23.pool.telefonica.de. [2a01:c23:b81c:5800:95fd:ccbf:6c44:23f7])
        by smtp.googlemail.com with ESMTPSA id ee8-20020a056402290800b00482e0c55e2bsm1765949edb.93.2023.02.03.15.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 15:50:44 -0800 (PST)
Message-ID: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
Date: Sat, 4 Feb 2023 00:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] mmc: add and use devm_mmc_alloc_host
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_155047_323762_4DB8FA90 
X-CRM114-Status: UNSURE (   5.71  )
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

Add and use a device-managed version of mmc_alloc_host.

Heiner Kallweit (2):
  mmc: core: add devm_mmc_alloc_host
  mmc: meson-gx: use devm_mmc_alloc_host

 drivers/mmc/core/host.c         | 26 +++++++++++++++++
 drivers/mmc/host/meson-gx-mmc.c | 52 +++++++++++----------------------
 include/linux/mmc/host.h        |  1 +
 3 files changed, 44 insertions(+), 35 deletions(-)

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
