Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531DC54F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HvfmhcfNda+cINt+DtWF2WGNM36mh7l1nx/yK4ztbvw=; b=QjBmfFYW+t3xiw
	TLhd97R7ieF9WiViJ47ZbvP2HNcLiJZW3rut6DhpQYqBNqOzLL/lWiwG6duaYw7n8ZL44NlNWH3jb
	LrpogTaLlvyEV1OxkdpmoCst3loCMxudAtfA9R20GyaKU/+mdKNKLj5NIfjpCBDuF9+B4HT34c3v1
	PxaHLSKGnprqmbBoVxxs7F6nDeBcKFQ/wed3zMWM5wCc6LyPYgR+8JNZ2ytT1+91mAhauPpTMiqc+
	HITDN7INiWRut6ClVEkfSbTf9d/ONFWSfEVcW6KbhSWGqHQ1diS6hTrIt4HHcV9Hu+bQ4caY1K2zY
	f/7wmIl0L+yc3fV4eQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoOR-0000000Ckx3-266B;
	Fri, 31 Jul 2026 14:39:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoOO-0000000Ckwa-0LEL
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 14:39:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47fd4531020so458882f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2026 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785508758; x=1786113558; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCKevl6YxRFJFbxhCw3NWepdi2CAzAF5zYo3iucQI1o=;
        b=nd9nsEhRFp9soSJwbQgL9Y3dcALAkZFiK4vUu/ng/Tsz2zJZ1BFU3eu9VYfihwqQNx
         Q3+tNGr3zCpOq9zKKPVcXBdzWrTulc5UfveJNs0PuloeRcp6SuCxCx467Q53sjYK3cxj
         DUVqufdpUAe4LLp43g2EYPAlPyHMbgG71xWBGh8yuQYqI0NnG3J/tAO1RvDNvk25vxBc
         mqbuGg/pLkuT6Z1NfTILkOdaSZwQiCCUikcZa7MzkCXYDqe1AlacX+89IeHsT9wWaJtG
         O6FIF00yLp/EgTQu8VgIjx7axTczAgEAQd5ua+mjNrmKNj1Yh60Hw218+XzOpEAEcaGU
         ISgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508758; x=1786113558;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gCKevl6YxRFJFbxhCw3NWepdi2CAzAF5zYo3iucQI1o=;
        b=HJlrzlGSy8RiDG3J14pecu8H7Y+g2/X3phpL23XAmpWD5tNrVvdNzJrTn+ciGBwZEl
         0DWXW/qKj6c4PCyN6ZKAhlho4g01yvNvIyyG1k9/IqFYNmOcEEXmqg4rlBtz1KbNcRmL
         GaOeStvUYcMnzzIvbqJ4qrgAtAn6rNLg4oTz+Z7djEIg7rqley+9iw3s2fJYUzaxD376
         R6QGfdXNjx/YZ8s7jZ65xcHA/TL2XT2NDnAig1liUpKECnWNOV4LmtrIbhjpkUePSgMI
         HxEZ/LknAyDtE7oZFTfa8Dk2u/NMTYUBsFGbVCXEMXkgZWr4UK1gk8Km8e7diCLP0MVi
         MWnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxCl6apZkHRVLYW2vtn0gGsnkKL6/zRwXYdEm1QaGhPuU97zBhjbwrcNf5Ms4jazg5GZxlKTMFix+ahF6/@lists.infradead.org
X-Gm-Message-State: AOJu0YwDWZBOu4B+fIhEGuK7pCvUsG8rpkIES+q1b3TzpNB3q8uICHjr
	JsUi2PNLvrdzUPxW0mZRpUsp89HMmHF4KBfWsTgFOBeChEgvvE0whTRgAMfep9JCfYQ=
X-Gm-Gg: AR+sD11RC3wNPNud+JyOOEtNkDcZG3kBlPHk0dJxrDDkOANpaeDAV6roeULM2oWQdCa
	+M94pt+1IuF9MZ5FyqBpzjclyQ7Mj+sBeyTqSGu8vrUqM+aCWt5IkQEywMeQgIu53SFro7PEbUe
	Rk8y2HqydYqn+DKLH3SOkyJ43HX0w5+ZT8v1WyGTlE9nZvDV+KVpZTT5yD4i/QpkJAjSub4BaW6
	JNwDNU7dwSkbcOVI2a8cTJMRDGhN36go9jjbbFM9fpXpAxRng1+hnT2yjNyQckEaJifoA6Ury1C
	07nuRHSrgit86mBvNzXxoFbnTt4KzuzGvk3d44JORuVFUzbap8Gie7afiRhonwSKCxuIGIfDE6Q
	+ajB4bQhJ+APAh8dRVsI7EYvZM4DfzcLXSIBZv5uKUoVOv1dt1yOD/rKO0HJtqxiHtT4+r9LViv
	WzcW/1gmyS/UaLBhWzXqb1KuhLRCxYogp6ifduIkk40GYoyzx2084x3Ir5w4prv2yeK3u5
X-Received: by 2002:a05:6000:1843:b0:47f:cf99:b0bc with SMTP id ffacd0b85a97d-47fd2b32c4emr5244188f8f.38.1785508757730;
        Fri, 31 Jul 2026 07:39:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd45a1240sm5269996f8f.36.2026.07.31.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:39:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] clk: meson: Amlogic clock changes for v7.3
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 16:39:15 +0200
Message-ID: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073920_135412_3BC6DC7C 
X-CRM114-Status: GOOD (  10.05  )
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

Here are the Amlogic clock changes for v7.3
Nothing out of the ordinary, 1 fix for an old chip and 2 new controllers
for a new chip.

Please Pull.

Cheers
Jerome

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.3-1

for you to fetch changes up to 6f809ca8104b01dff31a20e91fa748b49fe2971f:

  clk: amlogic: Add A9 peripherals clock controller driver (2026-07-24 18:09:37 +0200)

----------------------------------------------------------------
Amlogic clock changes for v7.3

* Fix the incorrect parent number of the 32k clock on GXBB
* Add the AO and peripheral clock controllers for the new A9 chip

----------------------------------------------------------------
Jian Hu (4):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

Martin Blumenstingl (1):
      clk: meson: align gxbb_32k_clk_sel number of parents with actual count

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
 .../clock/amlogic,a9-peripherals-clkc.yaml         |  164 ++
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a9-aoclk.c                       |  489 +++++
 drivers/clk/meson/a9-peripherals.c                 | 2089 ++++++++++++++++++++
 drivers/clk/meson/gxbb.c                           |    2 +-
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
 .../clock/amlogic,a9-peripherals-clkc.h            |  351 ++++
 9 files changed, 3275 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
 create mode 100644 drivers/clk/meson/a9-aoclk.c
 create mode 100644 drivers/clk/meson/a9-peripherals.c
 create mode 100644 include/dt-bindings/clock/amlogic,a9-aoclkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,a9-peripherals-clkc.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
