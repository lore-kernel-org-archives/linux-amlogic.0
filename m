Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C030606A324
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z5dArPv/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKvRM1uo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U9YWUH2RjUUR0TGJKw7yQzZPwwsu5B6msJ3yF1na50M=; b=z5dArPv/5KX3sA/koheXmj5oPg
	0ChNcwBCQq2ZyuMt0KD5yepZJjrj1z5VPPTemO+r1Lz4dS5GUUCU5fWv84s9igqRsB8M0o5GyaHMB
	X4puH1I9CqlMj68yHdnQqf9tsW28utomHne6MMHcfTq0zWnvBhhpow+AeQ6W3QyytryCsSJx6qx6b
	UMxJB0GGoIMMpeRhBT1OZ7RNhDA2z56SncWDvL5z1WJ/27XfM8rG55TOk6eYpFPdDeDOLZe6Og3+M
	oTYexz1oP/w0JNARvzBadV6idu3BVDs2gSpuDO0g3QWeIlm8zuwfdRjyEn+e/pym6HS1vkzrTFy6T
	22ew4Iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K9-00000006JLv-0ddY;
	Wed, 11 Nov 2026 10:13:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K3-00000006JJM-3HEF
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 10:12:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20683815e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391974; x=1794996774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=pKvRM1uoWIQho8B46bR8vBKpSiVUZf6sdQMCw+qds/6bJxp/UUIQnLTYGaKJ3Rl5e5
         0ZduAKT7/OnR0JifupqkMErMM5vFESgKadbMHV75UFHsB88o1e2uEKf2zOsgxuz+UTjI
         SmVLei0eFQYZyChgmfAo5j7qwA0d9PAMtbBO5Yr/x7DrJ2EOBAuqaXQ2UEdcWLRkKH2F
         w9FFRJnlAxocSrPYnQ2wKdTyYfFLIh4G137AqLZlhEhY65hz7kDKOAj273ZxGM7lYPFw
         KOI0UhHdw3agyuX+swFA0wat9AYHYCH+HGzhRcMG/q0j03HmuBbheeRiQfB9j2AXxxRP
         K9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391974; x=1794996774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=Q8UAgdcgR/if2DikHUJ+MYO0dRN1ke8rC1KmDLmiImODgnfmEMnnvRPl0k0/9E3YxZ
         QB8N8qFjyF3K/lPDusxgns7h4VK0S3ObCMsdYdX0xSPsQ/k+9SasAXxXmdz/n11T4436
         5+NTKiIVeZgQ4HKOYE3KVCVFO8IBTWSq7z0R9rqzSAj3OHhDjNKDpo176U/AW95V1RSp
         DWUoA8zgRPRr0EjeprNrMczhOoZKak1vxGaQ3qs3iXsYiP0JtsFn3P3NNBytXTQkxTQ2
         WGanzyioCGb7sN3TeV1Py8pemcsqlXv/6suvi8809cX2F14NxuFdOjgDerAKXal5JmZk
         iu4w==
X-Forwarded-Encrypted: i=1; AL+hErHOW4Gzn9WkCyi3lS+vF3Hq5eubRM7CUuAI84uiCI6Sm9S+b08PIkC08O2vC1Rnh6D5bkAgxbktabqbKJiR@lists.infradead.org
X-Gm-Message-State: APuU4Z9K/Q07Vy77W/Gp8zXLtIAAKmqxX7Yyc3N5eLEXJurHuQQjxtFo
	A0kxls6ec/rE6jljjZ7q8CQkSVwqgSjCVGMW3WeiQxMxGL7DcOQUJeCIRer+QKfxW0ByW1/hVCc
	lQFrQ6Gw=
X-Gm-Gg: AYBFou2mtJRMx1hAvHIlr1j4s048k5Y1QeoznEhfSQXSvz1CqItLYoRVfzVWf4YuAib
	Gy3wLpQn2v4raMyX81yPuaYnHzKp4nyNGIMwlr4GouFbp/66kI4fLb1XCuHTfLUY8XJihLtiAZU
	tkq3Ne2mfzvdpvgFWcrvwp3MaP6UgIwIFq84G1g1TN5cTlaZvAefeNRdrEsjro0UOenQHyCKOqo
	Bx03fJQuzuw7lgqw56+BCwEtwDqAuSmtQN15BcnP0WLWjkCqHM2VUYi1rNQ+O2MJBYdZfX0/A/v
	SeyL7dbN8RGUnmRmkAK86Lg56ePKIF5FY2/MQuDHEVO64ZFVwfhJJ5RbQVHkgpulNqYrdBSs5R1
	LGKCwePPgUDknXHTijArTDtnPtjyMYj2/+hsjGkn4l53v+RrUYbyzgF94cK53TH3bstqohnYnIn
	NMBJ6Om/UF0pl8wnl6MLizdbeycnFDM4NsIJXADCwia9z8FEmwcUYowR6SdD3XdSsthLti+Lai/
	RAI8u9u229qC5e5rCnqvd5akTY8V8tp53YHfTwKaZ+8RhSVArq8tJ9+HTEyQiByAEfhcRkC7YaI
	14+qdEN+EIZju4PRQEk3W3uvjhI=
X-Received: by 2002:a05:600d:82e8:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ba093a902fmr32682805e9.29.1794391973923;
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
Date: Wed, 11 Nov 2026 11:12:47 +0100
Message-Id: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ8/9GoC/42NQQ6CMBBFr0K6dgwdCIor72FY0DLAKLSkLQRCu
 LuAF3D5kvffX4Unx+TFI1qFo4k9W7MDXiKh29I0BFztLDDGTMYooZmhtq4vQyAHoyfwA5vO6g/
 gPVcJIaVZVYt9PziqeT7br+LHflRv0uEIHkbLPli3nOeTPLx/fiYJEm6SlM4RUx0nT1UuHStHV
 217UWzb9gWq0QqX1wAAAA==
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Bisk8TI8S7BLxKLf6s4XhQgEn2v4oH3ufymXr3gbBhE=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jfcf+tnuI7rVZ/Sw+13DifL+z5rsbLxPXXKjsN8m
 3hF1MPFHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIjOuMDAe2+cgvmDBnRmvT
 rHvsrx2kbBy+zivWWerNzPPj1DSmZWGMDJear/7xEu2Qf2aa91j7s4Ud6xxpnwshdwsnyyku9ft
 9lhEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021255_845128_1F77FC1D 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
Sashiko [1] while reviewing the series adding I2S input support for
Amlogic GX SoCs [2].
[2] depends on patch 1 to address Sashiko's comment.

Patch 2 adds a hardening check suggested by Martin while reviewing v1.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
- Added a new commit to introduce the 'lockdep_assert_held' check before
  calling formatter's prepare/enable/disable callbacks. [Martin]
- Link to v1: https://patch.msgid.link/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Valerio Setti (2):
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

 sound/soc/meson/gx-formatter.c | 26 +++++++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 21 insertions(+), 12 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
