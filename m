Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3419CCD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJamcGqy+q4KUxXDoDGzzyLnZzxkPwOa/mM18i/6dX8=; b=2HtnWc4gG1oIP9
	hjb52xzhfrgYyEeSLICTsrSwOeiTvFqxFjWbWb+QwOfqwrpLonR6TCfT5liVfMPVHXF+DW0kzrCUz
	lr3bDiC58sKS+nkGWbukh8x3VDik3JaydkrX/tNSTosLGsg3VS+VZ+CYHKKMit8cYQhAJcWKmTyxa
	DN5POKYhkRo9syUwFaSacBeNaRhkeluIRunRKxiomFQco2baxQDOQm1T7ubzbtYqApqno24V5qmpP
	oDMlp2P0pbMvnAWDIhV8bH95EUrvR34d1Tf2IpMOLUJDOHaqNB4T8tqprNBkCEAB2UJAUr9xdLFB5
	CuosXtfnk/tiTz9Hx7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlY0-0000000Gs6S-2Gzx;
	Wed, 17 Jun 2026 08:22:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlXw-0000000Gs4p-2X5S
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:22:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c6ab886da6so8160675ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684572; x=1782289372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbp+XGu08SphaD/VmIY79o/0rYxP0riQ62ZWUCZr/Gs=;
        b=ou2t9Rhr0DELLJ6i5QRMINXGBBdo7ZfrmwIHE6eRxeF0nqEv7f54YF5Pkh1/AEyRFJ
         k6G0J1Fwo6vUhzM5BwRbq/oH8094xi3paZdNdOfu+aAgGIGeM4vX5yFAiqNgduYojfAO
         RUTwJSV3q5ZGKkY1XBH+UMZrAEYMT5mTCzD5qvEni63rjT3noxdW2By6x6SXBS7dFhvF
         5wx/DOmvOgcSLk53PsmsZOmh/3Wf9EKESUynxrfxjwIYt0i6QqfE/zus2BVHuzmfUggt
         +TChz/ROhxp1OTPkwEHkZgGQZemxOfaWlVnkkcOpZemhUkUJbu0AmKbLc1UbX7HnwGMu
         WLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684572; x=1782289372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbp+XGu08SphaD/VmIY79o/0rYxP0riQ62ZWUCZr/Gs=;
        b=r1P0wvnR+RT8A3M/FnCgqb33VG1VntcgX5+qIMF+28F+vQEwZZYIafGPVU2owpxgTO
         KNxWYeAtY7z5T0nYCokcegW/TAALa7udsDv2sG2JLVVYtujodhr3CnPfFMNz8J5c4vD3
         wP4xhLVJNTthqfRZOtBULW5TWAbszeW++tXW/yZ7aP33AH+yJ6R+4JYQb+U5Oxnd6THG
         2HKgQnQYfPMSLZc4k/V6KqhXgF07gKSMLfLaAjtAeMv6/44zd8ugf0uiZ3geYb/QSORP
         E0rUdZlKVLEPmrF0Pw3WxXKbBvdeuh8goe/73o3b/ICe5fMa6r4T0CfoJTb10bd+EQiT
         O5OQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+yGZPobHWJOOAZWEsHwHTVEO/wxZmd8ob+vPXDWoP3aGPlkTd2Fivt1mhKpa30yJx0H/zw/f+wSQEGQNp@lists.infradead.org
X-Gm-Message-State: AOJu0YxUvX7qJ4J336CK2YAXD6N8VkPZ449l70LmiOsIZy9pAi+y40d3
	Fyc3Qyo2crTCZLYI8eobV5jIgil/rH+egyAPu5DiZPryOpJ5DQHDr1c0
X-Gm-Gg: AfdE7cleUE5lrsr6FcS8Q5+TS3OsRoEzKK7kDa/P9ZYxwcpd8A7kuwVwF8VU/m3OTJ5
	/DQnxQSzSZFi5Y6jUw2srRY0CtCACVbkxjjTTEI/qisoIonqq4DDRUTAfRfVuwzCh9RLEIKeF5q
	sbQKodEVauxcHct2htKFUknYCC0JiRSw8XcvUWG99NSN4VZvAKST+xG7iHogSpwjl+nqgcCpiMv
	7e+/zAoEyAjF2gwkroAOYT4XOUs2VKc3GWA0Auv1hiycJFyJbQyM5JsDKPVtiA2wlQKPqYvyJls
	DJ1rSfBgI+8txemK5hiFdzBudHBFMGD+6cz/+BdKfWU5LbbCre24KAztBexSndTakDa9LaqZKbp
	dID8qlHwA21u6z3H9/IP6EgvwV06d1clHoko/gdK8a4BGtlZ5GlrjwcqNNle5OdWyxtMX39uBfv
	JFPgs12M2k5w==
X-Received: by 2002:a17:903:887:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c6bbfa18e8mr18681895ad.6.1781684571658;
        Wed, 17 Jun 2026 01:22:51 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:22:51 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 17 Jun 2026 16:22:31 +0800
Message-ID: <20260617082239.645562-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012252_641132_CB88295F 
X-CRM114-Status: UNSURE (   8.23  )
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

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.

Changes in v3:
- squash "disable pcie_phy node by default" and "enable pcie_phy in 
  meson-axg-s400" patches
- Link to v2:
  https://lore.kernel.org/all/20260617071604.635627-1-jerrysteve1101@gmail.com/

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (3):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
