Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769D7C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPZdetL8nkhoVA/YifbZSu9R6sazuJLamBAMp6pnfo0=; b=34tTgVgufQJ0Mt
	OOCZq0xdunDkgxZUaNhmrbXzk0RGLNmMSz3XnP1ATcgHGf9jK+1yVB1B/W5S09epsCgrd4p4xz/3u
	6vMZPqsAd9FYvURGfAKh+PYfOUucsHGWmx65kMp8qoHXcEkmOHC3UfWga18E7FiMxEfzATa96fB1N
	PNhFj/rrV8Ja7C9SgAe60oLKQdmc1GbP0fF5p2ZpYhuoZW9hUKBYbNan+Gc9+ZaqxEhJT0YlujRYF
	EtmeMie3VMh6moBZQjhTWIl5KTw/u/CNF8va1P0RzIH2JFON2G5BPB/45guV4asgDWAbTyvjnSIZM
	toJr4LwgqvKhppC8P+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70r-0000000G2Cx-06sF;
	Wed, 12 Aug 2026 11:20:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70m-0000000G2Aj-2LQW
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1079203a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533644; x=1787138444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+zrfepUvONfB4EyAxMBrInEBGNeqXHZ4lQ9CmctDXA=;
        b=llLHo+LtE3pXDQnQUhM51vnnI4P48UXRLumL6GOtO5UgTefh7ctmFbn4YUyQa0GcaU
         oZZokRQIvNMrTOaAD4+CYxBakSFGEcuyJ5Ssd//E9hj0wO8DCJLemfERd8nA9igtU7Ay
         JMo8IXhArKn4WmRVNPl2WZ9i1TEHWDxDhbhLyRJxq11U9OcA1e3EtZnso1ua5e3t1GkU
         7zp7RX29KTEPXNOlMyG2MvQqYSl8BQVXhCHigsxLlOsVTgMgea1GCsqAaNSa6xe1S8Jh
         U372AoU/PpafKT2zVg6b3GF6hBfw1GINa9jPtytGlM5u6dEyGrkd6+arkz0lYJoe/hNt
         jyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533644; x=1787138444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+zrfepUvONfB4EyAxMBrInEBGNeqXHZ4lQ9CmctDXA=;
        b=j9FL1sQElLbbKZaWPq8tRotpEYP1qoV51agJS/5QzlAtO7fQEBNIu554/yadpllr0T
         mLcS1Pt+EoSY2YkOl7+8v9xCih0ztmPqif7G2CnWsfZCsraYWmcXjth2jwIwjQofhy60
         eGyIKiQmGkg6C0VTK5f1Wn1TNibzeDzOmaPv0lPmx1D8hvLwEsSrx1vrEzFc8n3kgOJL
         QSsC5BrUDq12S+Odh347vBlPgrUTaazQa+L9lh/FpWD4lBXwG33IqzS05dwcf386ZpN5
         YqzxazRqr6hawHY9BiXX4ayA0WjyiMkNjwS0aV4HjFEkOfdjk0P4ok6pERvBFSXYiOO9
         yUFg==
X-Forwarded-Encrypted: i=1; AHgh+RrU1k6uRhpnp7xW8yvkZjdVfRWikPJzc8Ib/0zTsUMPMBDxdAH50/0RoYuE1MGllqfcxT5STwwyBoaVFILV@lists.infradead.org
X-Gm-Message-State: AOJu0YxDdTAskgJ24/FL1/45gqi4do7pZ7EmtIr7BVq+QHGjMZai/i16
	MEpA4EYj8f4rg4K9a0/K3Bb1s2yfb4n5uJvR8fM4x625IlyRKrYIMqxl
X-Gm-Gg: AR+sD10bKnlXVYoMZrLK1GcXWw0iKbGMSxEoqlYToiIxW/yQ3+QBNe1uXvJm+OcJKrm
	oqbjBR22GKJOr/0ZEsuD9CB3PYypqP3JRD9vXgHonrXa0f8rMgWaKfhkFgVZ0s4nAiwjdr56ZKw
	bV+OAAQdboe4BuFnh9R9TPdcAzS+sKTzeGcDvNOACoIe/x4NMTz2VfdTw2CM7wulcXJznzmjgEI
	3EScn5ua5oEJUIx/8bVIJnTIN1hMSciFESIl8mJa3UzvNvqTrMNV2Jks2eDu2m5OFdKuYMkDJQ4
	5fCrUzZHa7QTsGDPEb3g8vGEN+sZ1hFB2JAbaBAuwfHBoSs77l8huuVkB0oD9srzEtio3YwlBkh
	jsDTI/KevzR+2qr87SBv9z7iWujcdooJZzBcXKuCwwHll7Nn45soANH5ifGgiV9LKyT59gVDFfu
	OYDz7irReiwAuZkUPp3UnatM3OOU+/OQ2w3A1FGURkAH9oRfSRPfJPeH4uJXnUJvgZxFixyj/AO
	nlU74uFWoopHT8oHbg+3b2EM+0cWIYX24I11rPGmVHw9GhoP43Fi1nii6hGF5mc2xBo+qwHZpQP
	It9y
X-Received: by 2002:a17:90b:28cf:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-393012af827mr4741095a91.8.1786533643641;
        Wed, 12 Aug 2026 04:20:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] mmc: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:20 +0700
Message-ID: <20260812112023.42254-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042044_599370_A009F146 
X-CRM114-Status: UNSURE (   7.52  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling for optional IRQ lookups in several
MMC drivers.

I noticed that mmc: litex_mmc handles the return value from
platform_get_irq_optional() correctly, distinguishing the case where an
optional IRQ is not available from other errors. This series follows the
same approach in the affected drivers.

Best regards,
Phuc

bui duc phuc (3):
  mmc: meson-gx: Handle errors from optional IRQ lookup
  mmc: davinci: Handle errors from optional IRQ lookup
  mmc: davinci: Handle optional IRQ return value correctly

 drivers/mmc/host/davinci_mmc.c  | 8 ++++++--
 drivers/mmc/host/meson-gx-mmc.c | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
