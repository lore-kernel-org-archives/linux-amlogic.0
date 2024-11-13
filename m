Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA966D41C18
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+iNXwqFtLTiOr0FhVPVb2+1GqvVelOjZOwZDwDpXug=; b=JpqC99mu2mOOwR
	fXR/1m2ZKDTHjyAiglkWSrFxg+6DV1Dj3ujLDl6sPEr4peCJbtWmXBE3Oxfp60GxkaD9UQg1pIrxG
	8hvbtYwflnPjYSQtkxBe+++VLdp5eLtfd2CLzpq6gEd0S//Egqxh5pdAXGitAmPADFmC0PRLqNndV
	KwIYyel9IqG9KavCm2RzW7jxipjOnJGUe4gjz97VpBMAoA3RdzUiVHJVtoYibwBGDq2a6CWlr2KuL
	QTw3tKthHhoF1tsuBoFhAI/wZPei0vHttqoK8/tEZWtKxEyUpP6Z0Zb8QsIqZuUehDQ8fFDRGj3cx
	2Vm8ZzSkv4ftahpii69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Aa-00000006AFe-2X45;
	Wed, 13 Nov 2024 08:56:12 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98r-000000069oF-0SeR
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7eab7622b61so4482770a12.1
        for <linux-amlogic@lists.infradead.org>; Wed, 13 Nov 2024 00:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488063; x=1732092863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=Cpcb39sjgA1SEAsPQNdHBXBYgkbCfhGZypUTBgjOeEFQRAxKn7CtegSQoqPnbFue/e
         IglV1HgNAqv0b5WYNfLP71zpzJXWR0y30aduBZ9CosvwfwkkotdW9h4hFVDN4JJqT8NV
         a5m761Y9/TDCDqRec+UCrnkrlk2OwvtbxQYt3A8QeQlZAJtUGCoJeybV7u91DFwYHB8d
         sU6cUbcnnPRruszCmSVoxOiGGr/GYBQF3TmyLkSWMirQO1/qRNkYph3yt1azuuZne8q9
         sGNR+9Myx9tUkvIJo95iVYWFTBN04PjWWPrkh3SkMfsO+ud85sOE5CQ3Vy8PsdLU+Uz7
         04mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488063; x=1732092863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=Dr2evyv+zLCBLZqalV0HlJ2Um9B/298JT/9c8gw7c5Cc2K/knNQForBvtNbZjTQWMo
         rPHgjuYeJWYlfFhB1ORuuBmiHMY3cP5mysrmbqIJkH1psbmmlSUc6TLbdantYiUY6v5n
         WdlMsGk+a1l9kS7cx3AYQ55XRpEFLiM6OzNmRFir4glcplpY+cvogpdYlYn/Ht0dt58r
         bkyk9D1fIjaYgywuGzaRJ1QDDKXHl+yKMl3IjmiQpXij0XYIyEQRKBR50uVqUX+OYAs3
         59Ed5YDfzcFbq+pyksXCkhBbWpLFAdaFFuB4HptEB3t4xUkiicyF9/19C0+nW36Rbo2T
         QaAw==
X-Gm-Message-State: AOJu0YzoiODioCJfYmiYKjEYIamZouVDv9Ku7zbR52WTz6WopYcfgbpR
	N/HU9pGLeei3sYqA5g9m3PfFXVLq0c87MJ/jwZc6ZkL7HjqzZpk6J3JGYxAu
X-Google-Smtp-Source: AGHT+IE1mBLN35IJhMVQm6eou9wLzp1bNB4yK6xl5v6c0Y8AKWezVqTcxycvcqArYyozh6RgCMxn9g==
X-Received: by 2002:a17:90b:248e:b0:2e2:dd25:9b00 with SMTP id 98e67ed59e1d1-2e9b1741130mr28464867a91.22.1731488063521;
        Wed, 13 Nov 2024 00:54:23 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3e952e8sm953160a91.7.2024.11.13.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:22 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Date: Wed, 13 Nov 2024 17:53:50 +0900
Message-ID: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005425_364699_11A23394 
X-CRM114-Status: UNSURE (   9.85  )
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

RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
operates with the same device driver. Therefore, since we do not need
two drivers with the same function, this merges HYM8563 into PCF8563.

This series was tested with PCF8563 and HYM8563 on khadas vim3 board.

Nobuhiro Iwamatsu (5):
  ARM: multi_v7_defconfig: Add RTC PCF8563 support
  rtc: pcf8563: Add support Haoyu HYM8563
  dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
  rtc: Remove HYM8563 RTC driver
  dt-bindings: rtc: hym8563: Remove hym8563 binding

 .../bindings/rtc/haoyu,hym8563.yaml           |  56 --
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  18 +-
 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm64/configs/defconfig                  |   1 -
 drivers/rtc/Kconfig                           |  11 -
 drivers/rtc/Makefile                          |   1 -
 drivers/rtc/rtc-hym8563.c                     | 587 ------------------
 drivers/rtc/rtc-pcf8563.c                     |   2 +
 8 files changed, 17 insertions(+), 661 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
 delete mode 100644 drivers/rtc/rtc-hym8563.c

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
