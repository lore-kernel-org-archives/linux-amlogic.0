Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A60BC5475B
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Feb 2024 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zF1uKfcyxMCN2yHrk/zJsWNYAsk1u5WUDepW77SqT84=; b=4Vkjv2cOEPdhpt
	zOFc858AN35qExd3tgCbIf8YvABrdXs1yiuj4o7ooxMf0AlMiR74/wVrgIafdPA4Hxw32MrlJP+bp
	+dGGk7lSrdk69J3T/7mkorwGoLgKzzZIE8N9MTdrgw91Qy8M5Bvt0C3fOTYq/gbUKk6XC++KAhL04
	9NA5ZqRzHd1Bjzsc3I68sV8CdDOXlmXX0n/KmZXC3gF0ZsFFfNkZxLayS0XwtibKUg6Lw6uEUZKyS
	71E7vQVb7AjyFpzC/XeCZSQasyQ1OEvznOmssENBGRoLPDJ9ickfO9Z4VVX507AxHR5dOH6jnps72
	wFKAn5l914QzlYvkOgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWV-00000005Gzw-0DLQ;
	Sat, 17 Feb 2024 10:02:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWR-00000005GxY-3c3x;
	Sat, 17 Feb 2024 10:02:17 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3e21f579a0so37936766b.2;
        Sat, 17 Feb 2024 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708164133; x=1708768933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWhILoutvxlGO3LjyfOJc3gSpbG+WRABt+VCrcq4VDw=;
        b=jJwbGwSvsQ85BdggrI1S1Poa0RNgqxuDoTnspuUNg1DhUUIRsUPLio9elyI2Q6663Q
         ExSst+NmMp737CQJb+liFO0SeMuFiH8bqvbnXqSFjYlCCqyMhPuQ0AV7kGOHtH0+Ds0+
         +VghJMFabVj4KWcrczegpKQq1UD9I27MaBqfSd1AWlwE81rynUMXzL0t23g6y0dSwS8G
         XAVmPx9ss0ONyZ0IdpYLjKVq+n4tXhrkXsh0Wz5Au4oWCxnZ0cjgtXiDfOScIwOrm1Zu
         aCGXgLcp3raqxo4iG/mSPc43QdDg1yNZv6r6Wjpu6nfrCm8u+Ex55dnntwrGIuX3LKaV
         7KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708164133; x=1708768933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWhILoutvxlGO3LjyfOJc3gSpbG+WRABt+VCrcq4VDw=;
        b=QAOgJVGc8sXjK/ZX8gnIpsmcxlvzGYwkQqBnJK6DAP1Mez7DGa+5fK62Tze/RWVkZ1
         7geCJ+RD4vpDKqYUzKJZVdt8Y9LmDNBnXv+IQVLXgz0+2p1xA8cp0Y3wRFUNTbZdNa6i
         P02jvbMT/ZWzP1R8+pvfiV7YXCjx0GXIiXESSBTafFTb0MJOxhNLuSd0lL87Ecs/1AxL
         pY6ac5ZReNOFys2D5TXDEtYUcvDtOS1Q1Hhg4uHNpUNnddGiCg0cK/Qb90Wd6mnn1pzE
         LeGyvZhq2JQmb+XO3eUqIZTpjdDjgUszslMf4Hsx67tHgeey1OpnsWYmO5fWK9xNDjG4
         vC4Q==
X-Gm-Message-State: AOJu0YylKSbWnD8vEJME8wGy3FFe3aIXqrLotGxMmUilWExWIY4bWdno
	RN+Yim/Zt0VJsbSwzGljCkhPZxdl8hhNcCXtBkyxis0qKYUKJTf/pVEvuPjW
X-Google-Smtp-Source: AGHT+IFuYu924WylpLiYh6yX/5RoYWsiWz6/8ykDj34FpmqRbFWVMcDvgeqHxLpBjFAD1OYBPATGXg==
X-Received: by 2002:a17:906:79a:b0:a3e:39a6:d39a with SMTP id l26-20020a170906079a00b00a3e39a6d39amr329817ejc.39.1708164132597;
        Sat, 17 Feb 2024 02:02:12 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c18b-3d00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c18b:3d00::e63])
        by smtp.googlemail.com with ESMTPSA id vu2-20020a170907a64200b00a3d2e690abfsm832444ejc.122.2024.02.17.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 02:02:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	ulf.hansson@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/2] mmc: meson-mx-sdhc: two small cleanups
Date: Sat, 17 Feb 2024 11:01:58 +0100
Message-ID: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_020215_950508_4FCD160A 
X-CRM114-Status: GOOD (  10.14  )
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

Hello Ulf,

here are two small cleanups for the meson-mx-sdhc driver.

The first one is resolves a TODO comment from when the driver was
originally introduced where devm_clk_hw_get_clk() was not available
yet. Nowadays it is and we can and should use it.

The second one removes an incorrect .card_hw_reset callback from the
driver's mmc_host_ops. This part has never been correct as we're
resetting the host controller, not the card. It didn't seem to cause
any issues so far, which is why I don't think that it's -stable
material.



Martin Blumenstingl (2):
  mmc: meson-mx-sdhc: Use devm_clk_hw_get_clk() for clock retrieval
  mmc: meson-mx-sdhc: Remove .card_hw_reset callback

 drivers/mmc/host/meson-mx-sdhc-clkc.c | 43 ++++++++++++++-------------
 drivers/mmc/host/meson-mx-sdhc-mmc.c  | 13 ++++----
 2 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
