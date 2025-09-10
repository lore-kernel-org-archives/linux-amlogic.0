Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762DDCA0FED
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvaCcMR8mjOjRpoKKB6o/FiydtQQ+fNAqI0j4JbNmao=; b=kJULMjF4jwY9q8
	1ey+8RczJSYCWVqAQrqhGH+JuHnLXYr9F5HEcvBZWJF18R4EowWUEEwg6GTdjK3AJQxIBgUQS0/0Q
	7vxAX6Yv7BnFLnh4W8x6gpBohg38GzKBUXz5W9ZZVNvzkCXWgqCbDGvyuUq+OMsokW9VL+XwBgI/g
	G3S18+7VOfmUnrrkQFCeRUr84ynqn0vbiD7elfB12OHeF2zudx7eggIk4seWjXDp20Xv+YaRli0Ks
	EXs9xmGKM4q97nF9N2vWqNBi3OOHI8Mh1GdD37UwPAAHWY6Cr8ra6Y2zns1hn2nNbSq63rFgHUP6q
	I0qfVlLO6ZGZh8pK8E6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSQ-0000000CdIe-12XH;
	Wed, 10 Sep 2025 07:41:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSP-0000000CdH6-0dLE
	for linux-amlogic@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=; b=OnWLDd3036s/XIY6xs5AHVs1L1
	HQ6xJle2Mq5zd+3nba7rEaDFxO798mDcYgnn7xwQ0wN349VEe3ruo/PSa9rSm6PcJc6ziRH0OYy93
	U/kVomd4s9kVD+3udnz2plRhX/GDQP7eehI4nf0a52ZKvsZTLfcosOixd9vivUz8ExTnkmJ132tlI
	MjgLxNoYfeulwqq2g+4ole0nl0OEPVIg0Mpc/kw1q+K4s9IVZ6w5u2LLweF7TITX7WEdV+F0GfNLP
	LHEUaYk5imjIwOy6odrbI3NmNPuTSgauQmzkdBhTaNV/qiWnxlqd7voiDygNh0Vn41cm7rgycwGP1
	YQCJwE+g==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSL-00000005mGI-3YWp
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 07:41:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso3643795e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Sep 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757490088; x=1758094888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=;
        b=HfU6P+yJEQ2XTwgae/ZTtK01TGuIbZ7b+AMuNaph30KkonVeOCbE1X03K9tIw9Svr3
         1hDnVW8m98k9mJnsavD7kHVbtyX72rkgNvZimh+fmTWDFiIGZ9hqXAkSvzY+ER+zw1pk
         6cTMLJVfXLVe6S172EGXm3SllA1h5ICZnYN5Jf7mHNVIix8KBzSpGRzTBLVW+2NGEZFr
         vNxDJdW/uoHG8guDTx+ZuCCrmHXrqhf1bjJuEeZ3TSvQMu9UwTIy9+7iyGZPpyOCUVCk
         GN/wJY7I3o1lRpV6Mjfw+HlzB2UsHzZqiz3qxNPEiMD0PuRPleKZwet0CkC3LyMGitrN
         V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490088; x=1758094888;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=;
        b=bZMxN4M/tbaZJ8XwnRribLZlh13sFoKd2upeDsd82FCWP4KmjiN1ctfWoEFi1IUSmL
         SgCjzFz2v9bR5ZMRjTiUwzgiDYOUP6TZcV/4wvwWSJnSKzThpQ35DRxRr/nN2nAmpxvs
         rqYD4lkUkZTpn6LoXzGP/Lw9K3YpsQfZ6sr4MHLHMaQE/G1OvAxlH4Owq+uO0Lz0iQ5l
         26b2kFlXWeoyFlEYQy63jtNc2z7ETZ9KFTllK6nlTb8fgYmWqlZXj87LlL1lQQgE0qkd
         XeXJEdafzRcH1ndH9FQt5yiec8BdIs/NZEpsOAS9jjctDm1jPBcAw6I3AueWCneiXP3F
         ntvw==
X-Forwarded-Encrypted: i=1; AJvYcCUq8cLtCoFthGzEPfPrIKd2KDoHR3eyfPAew2nMWyueqzDsfd2+2iHl8F0Z9EoP9m/3x9xSJrtS/BIX1t7k@lists.infradead.org
X-Gm-Message-State: AOJu0YxVTk0fOMC/4/FQH44OJA3WCX6TTwFK+tbDsXgMGm4m3lvE7CD+
	QIgWAHKe/2r2rX6nmYCn3SX24GoD0bVADSfqM+de+EP1M0C+qHaWC4yWcSQfDy7/2RQ=
X-Gm-Gg: ASbGncvawact4nnqBPMjt2epNP6I43JJPuxRYG0IDWOUzbXA10Zydg4C3tFNNq6BWQS
	gUnCqrZC6bGttDvGd9dRJ23AcK3FQTUqvlzJrhTV8eBrg6AtJffvZxsdTlxdtae6v0PuNiZPNyL
	Rly6cRPLC1Ct2dpQm24xTuwHZ+yMpT+MOETY87Ga26CPSUCEveFU5UIavpe93pLYNwTkQnJcy7E
	DjqKkWoDHvZ3REc4hBtaJ5OqGYNuTwtGjJLsPJTAhur/BWW86zZnN7qbO5dkW623Wy9KaaVNcZu
	nHaopWbTm/DStZ3kJgQZraZYBBRZinheE7ByI9lzr9MqwTp6EdMbkW+m5C14zNVwP6bEhpZfBWx
	eNQXzmpcyBv4qjoy2NBCfRHuVgYKGPc1xhKJFnQlL7mSyI7/Wa07x9Q==
X-Google-Smtp-Source: AGHT+IFsU3yXlWlG1yOOb7EeI/0GYa1ze44ob0J5hkt+SyO3sFYx+UnxBi7g+7gTTu6mB+/M07fxiQ==
X-Received: by 2002:a05:600c:4b19:b0:45d:d88b:cc6 with SMTP id 5b1f17b1804b1-45dde66c652mr88230185e9.25.1757490088210;
        Wed, 10 Sep 2025 00:41:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259cb1sm17003035e9.24.2025.09.10.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250908-fix-reboot-v2-1-354d0e57c855@baylibre.com>
References: <20250908-fix-reboot-v2-1-354d0e57c855@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: gxbb-odroidc2: remove UHS
 capability for SD card
Message-Id: <175749008761.1189257.11203428787242176794.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 09:41:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084130_179525_22BC8B4A 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, 08 Sep 2025 21:50:03 +0200, Valerio Setti wrote:
> This is meant to resolve reboot not working on this board.
> 
> The problem is as follows. In order to be able to switch from HS to UHS
> mode the bus voltage needs to be reduced from 3.3V down to 1.8V and this
> is achieved by the "vqmmc-supply" regulator. The ROM bootloader is only
> able to manage the card in HS mode (3.3V) and the switch HS->UHS happen
> at boottime in the kernel. The problem appears when the reboot command
> is issued or watchdog expires because in this case the "vqmmc-supply"
> voltage is not returned back at 3.3V before rebooting the board so the
> ROM bootloader will be completely stuck.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card
      https://git.kernel.org/amlogic/c/663bfe77b6f70bcb33b2607e16c94fcb1029580e

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
