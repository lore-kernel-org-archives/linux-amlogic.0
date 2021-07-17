Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F44CC636C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBB961106
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBB961106
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JkHFoLfAdt3A05S3mloJ10Lfb8A9APTmZfP4+vAMYvw=; b=IZP1UYlLKcAgDx
	csxHdNi9XXU6KqhM1WIbGIuqmgYdmngs7TogogLSgn6sZ/M23wzGn4Q7yOysmC6kn1SzD8/VhyxAU
	BICa0etstQmUSkF8XKuZE0XpIsO5Apj93hk17DqFq9PBjWq2dap1TsNd8W9bmzas44yCfxn4It7Y0
	WRBcy77/AJZhV0IdrKmlvVMEhIRcX94KzKtPo02MJ0u6w8YC1Q0qv5uH5hqDXRdlu+Dpjqeb7YJn7
	oYcCiu+JuRaQxf9xd/4hbCB0Ai48to1LxE7uv0y7FJlpSW6PNfTlcOgAvuR/63wNMsg/ryXtpxELX
	97fJ+kOMeiHbcuVmqV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tsE-0079iG-LQ; Sat, 17 Jul 2021 23:37:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tsB-0079gc-EO; Sat, 17 Jul 2021 23:37:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id f17so16519679wrt.6;
 Sat, 17 Jul 2021 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8SRcWM58smf+vYhn8K7x+OEcA/vx7MoAU3pV30b6XE=;
 b=iT7eNzuLPQl8K6h6qY+QEObeT5rLsR5X26z1sUiqS15kH8QVZ6b5E895tf3I489vpI
 gmwrX5dDwaAf7UvT2OE0SL/y4Qai9kL3qiCUZPPOCI/SDL2JdKCsaAyjQZWEXwhLFcZF
 y3h5eDBMAs/VulbHzmaZgDSfP3Lm8nrqdNWYY0FVbdA2G7jS6FI6vjBigJYU6k28qKhj
 1+kP071UwEFMA92MX+O5cYfWpBHCDw9HdyTiB4wuZhG4SVEUdQKJAbF6Ae7DvCWrV3ob
 9lWlP7ZUyifIJtdIa5zxF6VQ4xahkSOuQrBgEDxPzrjgLmlNyV6F6EAqS6WwB/0Y8PfN
 2Vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8SRcWM58smf+vYhn8K7x+OEcA/vx7MoAU3pV30b6XE=;
 b=frbigck1R7KpddiTaZVc30a/e4Y5gI0V3enWukOeh8x2WtIxFbEzWtrTaXxAs3Cv63
 IJ4cTgieShbyekrPat4HXIeUhvGrFAfL/dWNfhzcP5GwamvRx7yNiyyMVp0hlx7jj49G
 jICTairB7X5qSONBuOcazE6OPtmdwyn7Nmyk3tLt+AsxQ1/x9GHOFeeo8cYbAoc5LXZc
 3SUmfX+TcXumUsGr1chkGKKkRzsZBBAY9rA9Q97bqrmKOtcu7wPlUZjDh7ZFommSdCaJ
 5b4Ayz6UX06sZyJVOqi0fc+MNE+zFGFKDvHbpCUmb1350sLhGCuQsgyB5a3r8LNNVzhd
 rlAQ==
X-Gm-Message-State: AOAM532Oijt59BVuffezQNoGWZDr9EFbqf1Xmq+jae/RZR5VhUwF54/1
 RKa1r/ZOoBqbaoPFukLwQHM=
X-Google-Smtp-Source: ABdhPJwD+rzxamNG/ejFbfNCgwhHng6HUyFGRe1HALoyZ1dFXnYHYJ8DMmNuNUEXIFBwTnDWWk3R2A==
X-Received: by 2002:adf:d236:: with SMTP id k22mr21385767wrh.392.1626565049555; 
 Sat, 17 Jul 2021 16:37:29 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q7sm12347527wmq.33.2021.07.17.16.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:37:29 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lars@metafoo.de, jic23@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] iio: adc: meson-saradc: Three small improvements
Date: Sun, 18 Jul 2021 01:37:15 +0200
Message-Id: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163731_523145_36150482 
X-CRM114-Status: UNSURE (   8.67  )
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

Hello,

the first patch from this series saves a few CPU cycles on G12A, G12B
and SM1 SoCs. The other two patches are small whitespace cleanups.

In my opinion none of these patches are any real bugfix, which is why
I omitted the "Fixes" tag.


Martin Blumenstingl (3):
  iio: adc: meson-saradc: Disable BL30 integration on G12A and newer
    SoCs
  iio: adc: meson-saradc: Add missing space between if and parenthesis
  iio: adc: meson-saradc: Fix indentation of arguments after a
    line-break

 drivers/iio/adc/meson_saradc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
