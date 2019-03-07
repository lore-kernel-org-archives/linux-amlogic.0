Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13580C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FBA21019
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dI5ObCoG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ivTODnx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5FBA21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T0hM8TNjXmWreg7gRPsxhDrytgA1E8lH032pmwRD8GU=; b=dI5ObCoGGyuify
	MXNoxzcUtdVUBatSyTKuQ0kWphww7v0HCMUdvSEz0W+SRQk2fpnQkuor9oDK3oYuMzWqSdN+8SOH9
	aRvgW4hmpspe9APyv6BxEpkRIHfphx8TLsJxKcgp6CMQg0m7n/uLab/S5v5TjvRmrFooWjCPXDYIJ
	tKHqXsfpOudgGTLOz78nBBM4aZhiFsOVDtyIEdCRajL46jBWd3ISvS6bZ00L8D9t2ndFADjfWyiYv
	Esx1N/NIAWIAv0DyDjOMkFZ7Ma6qU6/qgbpqghaXJCKmor9hwQdU0JaWvEe6PmpJusCaX1mvJLRxw
	ZXT+WteB4bwamB077vuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uib-0003eE-PQ; Thu, 07 Mar 2019 15:13:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiP-0003Po-Ru
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id i12so17846898wrw.0
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg+tmE0/Z75mCfveAvM/iSy2/1VA6GIsTsQb1/i8Fmc=;
 b=ivTODnx05Jwq8Tge97c136GqTjLUNY9NNosdIO4VBbrAUhD4I3kJMitN9FsyRMhRyq
 ih5MiYkHaD7pjepYkQmNUfThd6P7JiZYsqMRwx+HaI4NTzRw8k3tLFiQpL3RojE/D2F3
 tC10RKf6OTwf4ADyPgvt+OGHspx9HLKU74I/uMecBnUO/A6y4SJueyOMEkjF1Qy3gpSt
 j61iv0+TCg1xZLbDk2NhmDtfvjgc81F+UGXEZbB2I4K8XoN6ul2hpkW8ByH/v9MNKOVt
 vQTp/iVECSRuKugLyNo4t3IZz3x7nyK+er5g/eD1bN/KxIIYa5Gk1CRdGTupHB7z0cGt
 pg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg+tmE0/Z75mCfveAvM/iSy2/1VA6GIsTsQb1/i8Fmc=;
 b=BGVwIeLVIvf5BpeX0cv6Cz9ErpG41Oc5En9F1zC5N2tFXtnlpIYelub4IyErvKvWv/
 GsvJBANmmMaqqIc7qFSVPe63g5l9cky4eJy7IuLC0i6BUDCwyin9fW5aIFdkjUyn+ozl
 XO+l3+S8qRu6ffTQm1y2dHfeF5fOUeHfZg4OIteaj+dvdfN9lxjdVoQ6z4qUmVIo/OXX
 pXsB78RVQepdT7vjILl3WGVR2DCDEDUBK9AhHcpp79wtOtYPvA4l0CDvpPkKFi4/yH3J
 1PiOkDWC7vcUOh7IRl/cWqgervWeWEOCvEeVeGktwEDtQvjLXK03HDi30LCRvuaoRNX8
 0lZA==
X-Gm-Message-State: APjAAAWetj7rdzDvJtADm5w4J6Iw/Cg7A7jsTfaxGSBG8iE1Hh+XehBm
 WBXkc9BThqubJY6JtIx7Vxnq3A==
X-Google-Smtp-Source: APXvYqyWcBJe8v2hNPdJJElmsq7WkAq9Dlugx/fJY9OzeO2bPobuLGH/IgZdJ7s39zc6aW3dA+3QbA==
X-Received: by 2002:adf:f305:: with SMTP id i5mr7006705wro.161.1551971623984; 
 Thu, 07 Mar 2019 07:13:43 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/9] arm64: dts: g12a: Add peripherals
Date: Thu,  7 Mar 2019 16:13:32 +0100
Message-Id: <20190307151342.7381-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071345_953166_971E840C 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add following peripherals :
- AO Clock + Reset Controller
- AO Secure Node, used for chipid
- Pinctrl
- UARTs
- SAR-ADC
- USB
- Mali GPU

USB depends on the PCIE clock and missing Reset bindings.

SARADC, USB & Mali GPU bindings are yet to be merged but are
in review.

Jerome Brunet (3):
  arm64: dts: meson: g12a: add pinctrl support controllers
  arm64: dts: meson: g12a: add uart_ao_a pinctrl
  arm64: dts: meson: g12a: add reset controller

Neil Armstrong (6):
  arm64: dts: meson: g12a: Add AO Clock + Reset Controller support
  arm64: dts: meson: g12a: Add AO Secure node
  arm64: dts: meson: g12a: Add UART A, B & C nodes and pins
  arm64: dts: meson: g12a: Add SAR ADC node
  arm64: dts: meson: g12a: Add G12A USB nodes
  arm64: dts: meson: g12a: Add mali-g31 gpu node

 .../boot/dts/amlogic/meson-g12a-u200.dts      |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 290 ++++++++++++++++++
 2 files changed, 292 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
