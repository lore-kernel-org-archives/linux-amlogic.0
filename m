Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A505CE77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9qT6nRkJFiefE3AqynJldEBoxkxwF3kCS+gmsXOmpPs=; b=hYB4l/c7PGa6je
	O5fqSh+3pBEUBrY98KAIakRU2tL2GB2Wlbi4TonocVi4w8c9qlAR0GgbNbcryWlQLAY65ic30eEFx
	+KWhn8lY0u+vXnepBnD+zqyL//6T9EPC+hG2ZlyKM7Fj+PZJsUmj4MKXBhbmdm2su0b8OBc8Fl+TP
	qNeP+Td/bgkfvT3J0/Nf+XggYgr4SH9AJwEgfuY3hbUwMPh5dgaLldHVO7CJrm2Br4k9rf+HfMGa/
	VK8wAQGmu8HTDO9J4PWjRNq8AnbEt71odV8aL62zUaba23myAQxwCXFVT6fj2lGhssMV4Pu3xWviW
	Yu1usAlSUWytbji3kttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgvX-00000005f5Z-1Auf;
	Fri, 20 Dec 2024 17:36:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgdM-00000005bVL-2goH
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 17:17:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361f796586so23315875e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715071; x=1735319871; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=lZdjOBFBc1e7ZXJQYEEaOI8bOM1yXT4xu9uDmelV19IBzkNTEkN0RaiXGBB+1wWeU3
         7JyRR0G+KkjS91lnA4sYc9Z4GVUOOh5eyfghJjGzUhZWI9rJNS99vQQBnSEu90AgGzDI
         nBU66SBggvu/Cp1ohpwSTGwBf+Al34rEC0nF14bYCDCBkLhpOD9oTDJYcSFp4pNwsHeM
         vKu6Jg+iSL/rHcikgVE/KFuwEJsnv35om2W3QFqidtFfzlzGuNfI77NvQ6DmNAPVusvl
         8+gbWBORbZ+aP5aJamcu8aws9wRIoYzCUC17aHujAuIQO1qOO3i/Ci3mY6b3qW2GfClh
         1FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715071; x=1735319871;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=h8M54/C9UiOuV9oxnpxOhDQjKRH03s1R1hfvPPpkvsjF7C9ZhMx85k5cTWIgCWlAPZ
         mdG1blw7n1c4ZFv7i8yp6F/W5WI5HumBypdWL2UIGwK+koK6WT9FU8AfCgG4zJ0ufV72
         +kLgib6W4+6vM6/UjmiJ1HE83efuUVprvKyJaupJK8nvLwwGM/Lod/aC18d+QGXC0sKm
         PmgJ+G7g929u845iD6ZclEtmvLNY8WkevdzlIjyXebu3WNauoM4doP76AcPM4yDvQMrM
         S+UqQVKKw6BJQVqnRD9n7S9KG+WaiRrWSLkk3rg7NEsCt63x6OXBtm94rcP/0UFSIP26
         XaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhkpHzzvXeMPWcVFdjf713l5VXvGoJMumJO5XAVuS2UFagUzPXCbD/bTHKf0fHAZSK7Hu1GjKZGJQNmFS/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyxhyp6HorcjjFqdISdDEtP1XKagLBOI72xbzD4biRDskjxQU2
	zR10yR2cAQtV4qCEZs+A24pWgNSJx/uTex+FzEIuf7efFQp/nI7dTpqV7gb/7iQ=
X-Gm-Gg: ASbGnctW0dYHnsskDHqqM5raohroMSvKYJk6oik/M2hTYTcGyaJirhJOagn1ciFoPd9
	Q2kvA82IdIsREje2pw4XkKsFPxtGOuTXMyX5SsaieAlhKZVK1+vInGawoWDyYDaObb70h7vyuQG
	09ZhihR8eLFUtliEhh9KI7F+PiOGIqZdjeOkYvckAeyF5KjE/5kgdTa7mztySHMWSn+lAbGMvI1
	6U1YHkjLrAYGcoq8/MYNTRXOvukTW3BeLNJUdsAEPXpJGC8mkaG1ExlDaekBoF9DLHnYBQ=
X-Google-Smtp-Source: AGHT+IF9f/T14X1AvJnEvREcpdS8/52lUJw/ZwFZojh7k/RDOYI+PqbwwQJ/BIYRcYtgDvOajktM8w==
X-Received: by 2002:a05:600c:3b13:b0:436:488f:4f5 with SMTP id 5b1f17b1804b1-4366864420bmr36545735e9.19.1734715070689;
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] clk: amlogic: drop clk_regmap tables
Date: Fri, 20 Dec 2024 18:17:41 +0100
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALWmZWcC/x2NQQqDMBAAvyJ77oLZNlb8SukhxjUujSZsShHEv
 zd4m7nMHFBYhQsMzQHKPymStirm1oBf3BYYZaoO1NLDELXo1piCePTxg5OmfIFyWF3GrxsjFzQ
 9Wz/bJ91tBzWUlWfZr8nrfZ5/bBey9XQAAAA=
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0/1MgQhSTo4SZ2txed9gv05z9rFjmcWl6hwe7WthPg8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa6K8PagUSRbBXNIVgWlwByGMO32kVHibKpo
 b8WCFcc5WuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmugAKCRDm/A8cN/La
 hRnnD/9f3l83yXUjaKaPT3xakf3kCxkgRh9K6gtDX+UCd3ss7AQ48yYzWirHLZeG5I72h1v7rg4
 +kscCCA+mueRs2+syySFdvGCU1P5EYPn16fO38x5L6n1X7DyDHJtKvpOrireORtgu/WzTETV4Vx
 2uVGKKW9kJNkVGci9iTGNDkEjfKnILkArM5Ogobc/IRnkMgj/ePaQtwzxhRD5SISWa+qChE+Z8u
 cfRfqluWWkN4DTFoG7plqgTBDWLxVIOAHFSxQbvh4pZwsfcqIp5W+LqYkHUzIyvfnQcHWacZOnL
 fVvkWLFh85YYdUKEqq2dhvjqybkiB95jK4wgtqjwnRRSoK/MfmvH6NhFYFPxMWpzke2B/kY0d62
 ai+kR6LbuavihtRF0beq1zJBQ61K0dwsze/Z+M7IDuZ3oCELF5dGgwJatOmqdrC8TJ3jYXO2Szm
 POUns4BVhVQrle6Knpfxz7fZ8eUsrGNdx1dUEkoff0M53YCWvWQ28Xledd8petrrUguM6qiRm+y
 m6/9d6A29thmvYHki1E7HVz4BKO+VDM5GXB3Ao1G/6z2AZZS9iM2YKQlbQuZOn/WTvCxDm0uPVA
 8o0n5uwNq1xGZvI8siNMytDCiq50lIIMkuJ7hls9TbtPhyQPu/awUrQclDEYo81D7w28OdxNyFC
 44cpl3+jhYGv6+w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091752_675548_F9EED581 
X-CRM114-Status: UNSURE (   8.21  )
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

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves a some memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: add a clk_hw helper to get the associate device structure
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/clk.c                  |   6 +
 drivers/clk/meson/a1-peripherals.c | 165 +-------------
 drivers/clk/meson/a1-pll.c         |  18 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 435 +------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 212 +-----------------
 drivers/clk/meson/c3-pll.c         |  34 +--
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  88 ++++++++
 drivers/clk/meson/clk-regmap.h     |   7 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   7 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   6 +-
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |  11 +-
 drivers/clk/meson/s4-peripherals.c | 343 +----------------------------
 drivers/clk/meson/s4-pll.c         |  33 +--
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 include/linux/clk-provider.h       |   1 +
 30 files changed, 172 insertions(+), 2093 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
