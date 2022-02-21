Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D290C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6z5vfLxOUxallLpyLX3BBE/RBQ7S6Ma7LU/vjRPDAM=; b=NkZhT7GHWNkLU8
	sQcQvCyiIgXI9q/nayPvzYRVarvMM9l1hpl9fCFZkoslNuufqpt3XQF6SDmWPa56y7Y9VS3bMVNWE
	tr19YBGzoOMaTYA8e69qs+BUhK2wfgwXhBI4IylFZhhxkJxkOBBSdoT6po3/Qnv83Hn0iOG102mUN
	NUgMisF92Fhi4O8rBoW8q66MosyCmm6a8s8xP9ezkpKMKQS8L8vZXlPE9Ti3dawEiRu7vCawJB5uY
	V05hhOMAvNmQG6mA7JL6zZP69AhMbiogR3ubOeH1z2FnW/E2X2BNI2smIgX/NkIVC0kZu1eZY37rR
	vw5r3GTvvSHDoMw9Uy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8Ls-005mpP-7D; Mon, 21 Feb 2022 13:03:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uj-005Y4S-CW
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id j17so5233wrc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV5c3iXN0ZDroe+O7EtfCuby385XVMnLRIPAVIqOzLQ=;
 b=VzDjcwpFw8Bt4+sKQemYRvJXOFpFzlJC4o7nPKh7gBfc/1uZq9iZRUm/gUl0kzALwR
 oxPa9aCTLOW9FaGrfH7w7pLx0iVwTt/GOXHE768JxURnxqtjvX7Niy6SMgOihwz31ziU
 yiXn6isvXh+AOxd1bBRHl+XyKf89NyMrYj/FJQQ3/QHE0Lh4zHDWNZfayfVIsXYuqIiP
 rFEyNLRJGwn/TkVQQNt2eayE/f5SPebnOsJSJuaBmkUDnwTfOvuxe2egfKg+x5OrqbLW
 gPtWHM3dfsl5OfEkaprLcnzVF2zOuCiq9nLyXw6oGM2riIaq7T2S8PLyEtFKNZuRPqDc
 uwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV5c3iXN0ZDroe+O7EtfCuby385XVMnLRIPAVIqOzLQ=;
 b=4INlMc2qkp61nqYKhyM5fqrK5cdzwj67SF7xpQpb/vszPT5nCYXRCyQvHsaxLbfZS9
 KzFjAprRP1Hp5PWMLs/n4461EKL8D1otUqQg32E+9O0rYvcijogY+Umx0TGfnwChogWb
 ZXYhRAvG9pGNVjOlucT2q6V+gR99EmFV7Xocbn3de0bzxjd9ONHavg6DXhUU9UoEVyUs
 aHxGVtGHHwyHiU75hUaXzy0Q0Md3vPrk3M15iFwcO25hGNJgfjZsGrqIz6E6HKRQFOjk
 XYyvZUPkPwpzbJDPNd7kRXPBDbDMCJpGlRvk93Ic9NqgBTmMq4zVqecdrdiXzkMmSpFN
 gD9w==
X-Gm-Message-State: AOAM531vidd3du8V/yHSngF+16QvNDmcRZ/MIkJfi9xSKkfmVzbVY5GC
 eBGoxbGR7tYmZOhoGPdhbmob9g==
X-Google-Smtp-Source: ABdhPJyecBtSfKLHEPz8mlqMUDjEEOgcR2GUvvzZ9e+5PQYFO/+gF3qRyJfmk0DgodzGmHicQFGuPw==
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id
 y13-20020adfee0d000000b001e30f28487fmr15441462wrn.620.1645445320385; 
 Mon, 21 Feb 2022 04:08:40 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:39 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/5] crypto: completion should be ran with BH disabled
Date: Mon, 21 Feb 2022 12:08:28 +0000
Message-Id: <20220221120833.2618733-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040845_498328_9EED823E 
X-CRM114-Status: UNSURE (   7.32  )
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

Hello

This is the follow up of https://lore.kernel.org/lkml/Yd1SIHUNdLIvKhzz@Red/
and https://patchwork.kernel.org/project/linux-crypto/patch/20220127133332.4011509-1-clabbe@baylibre.com/
This serie fix all drivers which do not call completion with BH disabled
and add the check in crypto/engine asked by Herbert.
I have verified that this check does not generate warnings on all other crypto
hardware I got (omap, ccree, rockchip)

Regards

Corentin Labbe (5):
  crypto: sun8i-ss: call finalize with bh disabled
  crypto: sun8i-ce: call finalize with bh disabled
  crypto: amlogic: call finalize with bh disabled
  crypto: gemini: call finalize with bh disabled
  crypto: engine: check if BH is disabled during completion

 crypto/crypto_engine.c                              | 1 +
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 2 ++
 drivers/crypto/gemini/sl3516-ce-cipher.c            | 2 ++
 7 files changed, 17 insertions(+)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
