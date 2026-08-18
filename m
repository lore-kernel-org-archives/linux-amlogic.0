Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D756CC5DF82
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbVRnug+Uf+2K10klb9sCFvMFprIRo/HaYPLckd6BlQ=; b=T7/0sxULkh00hP
	erW+Npbek5w588NMtvZLqLX8evqCQLz2nptgBAxlED5YnXbhI0LocD4vyPCjCJMm/+qI3z+X/1Xl5
	TkhfG06WBTruPT915HpCatVQU+dn+f1GiwyU4F8Lebva11bIJ8abL19gJp6FpGpnt95/yBL73rUNT
	Wg8sGfDpflBq2b9d9+hAElyID2T97WjvQWUI2ZCszxZpya8PKBclZA7FpeC8yMQYIevm913MiVKO6
	QQZJ+RU4AV511i40o6qEmv8nX0Vzla8Ig1lcU4PKQo5UHQax3QVrDTOdDFGXWJAQG1l9nTnMYnmSB
	X2OwpbWRvU7jEGC2wQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEI-00000008YyS-3SdI;
	Tue, 18 Aug 2026 19:12:10 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEE-00000008YwL-2Rs0
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:08 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f904e80eeso128750f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 12:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080324; x=1787685124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bax9W38/JMIaV0Z2sDQmJSHm0aG/QQBKaWLZNsB4ByY=;
        b=gXtiEje9kBAmEFNI/Jyuu0ugU9peWSPnQGQ9J8Pllzj0fIFKv5ycRBvPu5gLR3bhEA
         rinHvaNsC7jrgYfeivkIPvk8HiKrYcQUtJNiv3QxSKFF3TzSXdjEoHKUHp0bKU3OuDh3
         e8x231LQ3+f3VEEFEMoW3IByEuVomv0IIdGJ5Bmm180WVh4hyPLCa194OpjtzaHm4Kdh
         mJOh49dsJksvmpwY9zfue9w5ht6t9VKasOWpnDgriUWj61VEyIvbgRTrlmr+Gf72oZzk
         vekIvdcnrKipw1SoBEi9ZyrINa6cheuzUXqol8GCNWThyUUDytKsF+0wacfQaoCj2iF5
         n1fA==
X-Forwarded-Encrypted: i=1; AHgh+RrWfMklLUVImAWBB2L4aSAKolBGeCCibIkmxXMijr0i8akeQD+YyTREdzUngGAXdKTnUp2ZutQXXrHtH4AH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk8N+1fE4pz9nmnxEcwOFYxjkEtZNRjZeRSnJZzko8Vy+L1Gq2
	TE2e47zVH/0pHQ5JTrlMA5snr+Pwn4vDRMrVU4hawJHDmfyjiyb/3JCF
X-Gm-Gg: AR+sD12NxqHt82C9I3fxQgbojHdRA6EapA0n4LYT6o7Ux7TfHPa4Sf74koEO/v9K3ZT
	UGg0Yw+/2iUR9RzGFGhw/XQnGYKXp8CqgPmyMBu1dkJa3rl2j4ixVaKqDkk00dldoXUNCcfD8KJ
	H2nBOKYrqyf9+k6fIbTvH54XrHoiijwaFNFiqeQB/tt13n6Xz9EQGSlNhMsqkR7wiRwsk4LJhOh
	vxhLAuQBbF7pcFBrh7wAYBzBpep+J2UzSQHPp82G6HJRRGCAUxfudHrQsoEfKIjH3w7iSdSnW8G
	6LavMn8Y130CrUYyKHTEAT5VB/Vgh12lM47u+AjUBul2582TvY9eeSztWaBZGd1U+dkuHkRwDiq
	iFaKi1W2jl04BCH5nyIro3DwwfJt04Fxa8SuU8LMdvZeECqyO/GT7V6Dn7zGJYuLhSvMTgcqShU
	PKAWNOrqMKAk/EqBRXnvC/iMaJBm2xBvHOjWpvfxHZkWpxplLDZgqoLE1L5s6TPVfC2Im7IVBBP
	KvbcALmF0kWgMLvJuH3io/KcHY=
X-Received: by 2002:a05:6000:480f:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b07c826dmr482120f8f.1.1787080324198;
        Tue, 18 Aug 2026 12:12:04 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: amlogic: t7: fix UART clock and SD card recovery
Date: Tue, 18 Aug 2026 20:11:57 +0100
Message-ID: <20260818191159.11523-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121206_630418_8C8BAB33 
X-CRM114-Status: GOOD (  10.65  )
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

Two fixes found while booting mainline on a Khadas VIM4.

The first one wires uart_a to the real UART bus clock. It was pointed at
the 24MHz crystal as a placeholder, because the T7 clock controller
driver did not exist when these boards were added. That leaves the real
clock without a user, so the kernel turns it off when it disables unused
clocks at the end of boot, and the board hangs with the console gone.

The second one drops regulator-always-on from the SD card supply. A card
that refuses the 1.8V UHS switch can only be recovered by removing its
power, which that property prevents, so the card never initialises and
the MMC core retries forever.

Both were tested on a Khadas VIM4 booting v7.2 from the SD card.

Lucas Tanure (2):
  arm64: dts: amlogic: t7: use the real UART pclk
  arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power
    cycled

 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 3 ---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

--
2.55.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
