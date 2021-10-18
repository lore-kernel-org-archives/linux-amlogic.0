Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA11C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 11:46:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D76B560FD8
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 11:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D76B560FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ckcInUmOvz5wlClQrjc/KupBeb+xYS5cMwFh4AypCM=; b=3wT3Bji7yjTI41
	AVxe68sFUesd5Aa8Kka2l+NPmw/9KL/8Wu8djObEjf3njdDltbMlV9qCcJ5ayuHa8R00UxC51UVYU
	nzfEvGIYtu3MGF+u3PZKiI2MkbS3PdYzt9qpJHMhzfXhGZzgEzkIo6mw+Cn267kJhkc42PnlIejed
	k3xY9oegV4b5kpHGiKW+PYTKbAEqPwL6wsWJjUGNxCtQkofcnU6fzizRySlj9l5lvnMfuFZLwXaJm
	7tvTvuxz/4PdyIIUzbrL7F3F0P7uYNAL7ujyhc7L7YIbzTNmi6ayPECdghIcgMd8bA7z71Ugq2Vr6
	u7SEXAjKNQioloedhH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR64-00FQee-MI; Mon, 18 Oct 2021 11:46:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR61-00FQcr-L8
 for linux-amlogic@lists.infradead.org; Mon, 18 Oct 2021 11:46:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id g39so4340498wmp.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Oct 2021 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=user-agent:from:to:cc:cc:subject:date:message-id:mime-version;
 bh=C174KNLIkQcIpVKqoVKmO0XecOJBPPgsZBNsljzoVYI=;
 b=ZEE/wRzPZbn/EEEhxb+i2m0hwMQskOM5+yE7+3TAU9RVD/9Ga0Pps4hsWQI2UzNvkI
 6kh5H7dzZSdfRXA22f5aCDTL405uA6gdWQedBTOkooNICHPkDvnF/xzhhguG/Lcaxarv
 nmnxJGp61e8YSnd2qtOBM7240wVHKP/t7skuyxQV+kI94kotiKDSxTp5wTGf5eqsiooD
 Q5S0ff11x52nZu7nfLu7OZwK4XjZENY8Ipo6izjBZxvbcFYlKYzuz58A0CfLNdEZ+KMg
 ad3uopaXJ+DJpnJmuUYGUSuArLLrzk3PnCZl+0G/5clemyuW6R9xq0gKLOTO60VyIvlL
 1Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:cc:subject:date:message-id
 :mime-version;
 bh=C174KNLIkQcIpVKqoVKmO0XecOJBPPgsZBNsljzoVYI=;
 b=BUeeDJ85PNEIPyfkBMeZvTc55OtSncO4RFA9qfLJSA96EXsbDHPWlfQ9W/H8TkmSy9
 eMZm0iHnhFkL2Bi8vG+OTQ6j9kHC4T3ryqTMAa6CZMOrWO9y+zIZ0eEqMTWS0WY0PSeq
 PbQQBmiYk88iLNxVbzPNpTefagRMlIFQVcm9KgXRYpNx0WsbCcbFwJ4B1AS+hisvQGbp
 ylhoCPKQrJsdBAUKFtM7UwGOpnTcTJyWZdQjZXvozsIXwTu+OmqQDBe45MSx2WN6jXlm
 qbIm8EXl8wCtwFbXzf7rTTnOdqZ7cTGe5utrBgu6MPWpnJwIW1F8uNuYLNtZ8O3hn9Ld
 zavQ==
X-Gm-Message-State: AOAM5300hvUt6mp7qi2BlDWJxiiyVLYDVCs6RLgssCfJwY/y9qNDfNpw
 es1kSOx3LiiL0HQJPZv0h2nM7Q==
X-Google-Smtp-Source: ABdhPJyNZnEnLK0VWhZt5BvHvaJ2EgT5Ta5yrzcUBW3wU+Y6VN06mk5NyoAlWVIlfVGExCVEbVMRSw==
X-Received: by 2002:a1c:a783:: with SMTP id
 q125mr43825165wme.108.1634557584200; 
 Mon, 18 Oct 2021 04:46:24 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m4sm14382721wrz.45.2021.10.18.04.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:46:23 -0700 (PDT)
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic updates for v5.16
Date: Mon, 18 Oct 2021 13:44:22 +0200
Message-ID: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044625_809213_DA72117B 
X-CRM114-Status: UNSURE (   5.60  )
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


Hi Stephen,

Here are the updates of the amlogic clocks for v5.16. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.16-1

for you to fetch changes up to 7bcf9ef6b9c50e87bcb1dee5ced50ccfa2b21470:

  clk: meson: meson8b: Make the video clock trees mutable (2021-09-23 11:46:38 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.16

* Update video path realted clocks for meson8

----------------------------------------------------------------
Martin Blumenstingl (6):
      clk: meson: meson8b: Export the video clocks
      clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for vclk{,2}_in_sel
      clk: meson: meson8b: Add the vid_pll_lvds_en gate clock
      clk: meson: meson8b: Add the HDMI PLL M/N parameters
      clk: meson: meson8b: Initialize the HDMI PLL registers
      clk: meson: meson8b: Make the video clock trees mutable

 drivers/clk/meson/meson8b.c              | 163 ++++++++++++++++++++++---------
 drivers/clk/meson/meson8b.h              |  26 ++---
 include/dt-bindings/clock/meson8b-clkc.h |  10 ++
 3 files changed, 143 insertions(+), 56 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
