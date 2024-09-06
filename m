Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48629CE7AE3
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zrnJ+rDJmKIV8oPo+OjnthT5Em1MrvWaQYHsyV+qUj4=; b=LXDOmhKUzTAfAa
	hNr/Nbac7TdQG5dFGt+PS+rL7cGxS+4zB1GZKeBUhg7Rvs07/wvcrm088PpM/I3oPfazg9YbbUH8+
	E2e+jYGYzMJl3N5OvlJbK/RbfaviJtqGHb8JpY8rPmAOYeRLXmDziaSW+Czj+plf5frRq64+lFYyI
	fKzdgqgEHHPVrAbx/b8DqRcZ9R3gtEXVU6jaAqano1YdHVJoQSl0Ux55BvkuBzohgYwuz6SxduC/W
	kDBDtzN4h7jXqoqn2b0Lf5bevi9RfhVLsQv6tPdIStMSkQvyaHT6VpHfKliUc4z1/gKWfkyn0Alwj
	jWHcJwrap7wmnB23CZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ8E-0000000CMQC-1X5t;
	Fri, 06 Sep 2024 13:36:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7S-0000000CMAL-33Ii
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so1077290f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629720; x=1726234520; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqsINef6QfApstNyiYZ/qe6fj6A2ZIDvZyFkLMashjw=;
        b=ImA87DRdPkZ+tWmjIyQNoO7Wbr/tXH3v8jm7huXSHD6Bfj7zdBG6gjfn7dNuWXPCK+
         MWzkrA7qnDg7kAHuTIoJEOFSmu+CG0LypTQKZJj6Itv9F2ABvFy0r0TyTtsHHzxiwDP5
         Wm/WD7uaxusK3cJyoKJ37FLWUZXABVoxV0zIAvnBkrJSdpDG+4K82TR9PHW63x6ykkWp
         JzQNfDYpl3SOpprmZmTerUZ6YgqO03Gkvi23bwR/Qk/SUstBNe8NWZk1p9LVxVjtpJfs
         7y3GNKr+KNJO4IyDS8L5SuChcckSYyIizypMUhT99yDZQ3KJ7+ulYbdLlbPadd4JMQ49
         1hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629720; x=1726234520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqsINef6QfApstNyiYZ/qe6fj6A2ZIDvZyFkLMashjw=;
        b=K3m89DYfDvZwgUNjhgeROqsrNdeinfCA9wWtUj6G+mT3kdUmdvY83C+4onV6gAnBpf
         XfkPAhHvDHaKBnezJmtI4OrL3q41jjhMqMc64FyypQcRQjzxXa1xVr1ge8Owh1j+lPsN
         QwCidjTrqIAEFEHnnwXyEOrn8GDCOBI7r1j+iq20qVAwGW2g9WOOjLvS2Mdcp7gxVVce
         priFMfRFszlT1SIjYHV3Mwncr61wXQSG5ucloF+8r8lc+ZoU7EF5Gy3JmGxOLpW5sczw
         L1abXDrmJOnYvjT1KmbLz0O7CY0QxvDPPMkF0F+JwLJyMSViADfvu4efEJDVOffI0O+c
         uW1A==
X-Forwarded-Encrypted: i=1; AJvYcCVWRQBOB5DVrNM31DP+r2sSbcNbj9RahH4JQK1CtRwme1ukoR61T8xvjs26Zxj1sGrijn4eq5350v/bB+vx@lists.infradead.org
X-Gm-Message-State: AOJu0YyMym0ccB1s6HeAOKe1Y3zv8kLbWYqk/vtSkfYX/0Ruqpyxk5dI
	bUCoDMQVwy/U9VjPZ7XAr9z5dQ7fDa0WD/1CZAOHQPMlJ/9ilfNnCrAN2Z5EvBs=
X-Google-Smtp-Source: AGHT+IFehkkKna75GAh88+0SyunaTdQfdtNnUax09bgaJD7vSsHcPJcX0846piZ3PpY8OCSraqbCZQ==
X-Received: by 2002:a5d:62c3:0:b0:374:c407:4e07 with SMTP id ffacd0b85a97d-378896a5b83mr1942649f8f.46.1725629719363;
        Fri, 06 Sep 2024 06:35:19 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Fri, 06 Sep 2024 15:34:45 +0200
Message-Id: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPUE22YC/0XMQQ6CMBBA0auQWTtk2lQBV97DuGjLIDXSmikYD
 OHuNm5cvsX/G2SWwBnO1QbC75BDigXmUIEfbbwzhr4YNGlDHZ1w4pwiSp7RLivaRrvek3K9Yij
 NS3gI6+93vRUPkiacR2H7v7TUKtKN0XU5HjsyqPDhZIk8X5z9PIMTrn2aYN+/b3cqhp8AAAA=
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Zy8XGx7Pz9xI8ihyiXuhQRn7J6bXXBkEnZLes9E9AaI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUNU+ER2XIrHr1uWuBlyVb11DIqM0PpyYs/n
 0w+pNJrhAqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFDQAKCRDm/A8cN/La
 hXgcD/4vY+/TwpUv2d9iGss5Ei5ETLzTZzezXR9fchb5UUOFfAkie9ZJ1MQ/49sa0M39yQnRIYm
 D8yRpxeCpQoTxo1xcsOkwZ2s4PNflZoNQ1YvaBi+lqtrfmWuHpZ4jwa/5SsbSaGkxX0fzJspCbX
 1Zfry90XLPq1iNQnq4HIPyACarXbeb9uGhKWHSVPjHI9hnWVre1CLr3fyVEnWmwB2GfCqjAJ0bH
 5BKimN+rh9AuSU9M0MnmhSp676j5yYNzi7KoPTGb+vpjXIOSIKtv9MZVoMrISkJ0/9M6OHHUge7
 nbd1QPEqOu007ywWJSwy5+e77z2EBNexJPaWBj2ldAuuHUfIuCl85XpSGB6ju1Vyq+FDPo4Bukk
 jTcN0nvIshXFFlBOKjwJPWwvdGcHbaYfww2Y7xJjN0XQCEhUE9jb6dE6dFxYPOOewKBBmXRUQaR
 aKs+xm/F10oxmakiYSz8lTwHcmpXmPSDy1Tl8tIWmpeQerkhQ2lAVmttNp/50M3o3VGe3/3paCy
 FVq4JwmsmmVKgVtTBbDu4UdYbBJGb3YhHzz5Cwxhev93e6Luu2HpF9AuOikX0E9wiFyq0m0BcXs
 6lHvjmwSXEFYnaI9iej1Yblnikoi/F+bqGVhK+56DLny3X9gA952P3six43XzxEa20RKyqj4QEn
 mKFNt5M+Wv3mt2A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063523_134534_263D764E 
X-CRM114-Status: GOOD (  15.26  )
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

This patchset follows the discussion about having reset driver in the
clock tree [1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2
trees and could use the same driver code.

This patcheset alignes the reset drivers present in the reset and clock
then adds support for the reset driver of audio clock controller found in
the g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

This was tested on sm1 vim3l and gxl aml-s905x-cc.

Changes since v3 [5]:
 * Drop pltf/platform as suggested

Changes since v2 [4]:
 * Fix undefined read access of the reset register
 * Fix Kconfig symbol description

Changes since v1 [3]:
 * Fixes formatting errors reported by Stephen.
 * Changed parameters type to unsigned
 * Fix usage of ops passed as parameters, previously ignored.
 * Return 0 instead of an error if reset support is absent
   to properly decouple from the clock and have a weak
   dependency
 * Split the platform and auxiliary modules in 2 distinct modules
   to fix the COMPILE_TEST error reported by ktest robot.

Change since RFC [2]:
 * Move the aux registration helper out of clock too.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
[2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
[3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
[4] https://lore.kernel.org/linux-clk/20240718095755.3511992-1-jbrunet@baylibre.com
[5] https://lore.kernel.org/linux-clk/20240808102742.4095904-1-jbrunet@baylibre.com

---
Jerome Brunet (9):
      reset: amlogic: convert driver to regmap
      reset: amlogic: use generic data matching function
      reset: amlogic: make parameters unsigned
      reset: amlogic: add driver parameters
      reset: amlogic: use reset number instead of register count
      reset: amlogic: add reset status support
      reset: amlogic: move drivers to a dedicated directory
      reset: amlogic: split the device core and platform probe
      reset: amlogic: add auxiliary reset driver support

 drivers/reset/Kconfig                              |  15 +-
 drivers/reset/Makefile                             |   3 +-
 drivers/reset/amlogic/Kconfig                      |  27 ++++
 drivers/reset/amlogic/Makefile                     |   4 +
 .../reset/{ => amlogic}/reset-meson-audio-arb.c    |   0
 drivers/reset/amlogic/reset-meson-aux.c            | 136 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson-common.c         | 142 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c                | 105 ++++++++++++++
 drivers/reset/amlogic/reset-meson.h                |  28 ++++
 drivers/reset/reset-meson.c                        | 159 ---------------------
 include/soc/amlogic/reset-meson-aux.h              |  23 +++
 11 files changed, 467 insertions(+), 175 deletions(-)
---
base-commit: 487b1b32e317b85c2948eb4013f3e089a0433d49
change-id: 20240906-meson-rst-aux-a72bdc01bd1e

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
