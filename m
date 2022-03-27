Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BECC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Mar 2022 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GnsyPb6aIDbhlk0biD0qY7ULXhqBVo2dLRwYTaERlWY=; b=CWu9w6MmSE+V6p
	vlnIO5lmqn+cJ+fXaFWJDV7IfEAJBP+MNOmDQzJYFsKb4ArUf/6Dj9w3I12QwzW1eM8ON4ljrUv0f
	RuBnqTXZmKbK+F+tlzTUuMKwqw1pHWYIx60TY9Rdmt0Atv39OKhcOUa89stX8USdo7RjkdzIRV7sf
	aUS7yqLYAT56aeTWWJkfyKdgAUCfaOwV1tvElhSYq1YsuT2oyoECMXDpGCYsiC+dHNys4S7YKaXKP
	Xq1laPdTCy8Id/LLsXlQy4GZ1A4MKZQ2L5dA43BqsdRigYDAl06MZUB7uVSx1nw0myTckPVX/JGs1
	5ABUOHHhwWyc4j059nRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYO7B-005KIf-J2; Sun, 27 Mar 2022 08:19:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYO6z-005KG2-Mn; Sun, 27 Mar 2022 08:18:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id s8so9943484pfk.12;
 Sun, 27 Mar 2022 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=FRlj4xMxhi5GXSX1Cps2ByHahJKaninAekH9Bevmx9w=;
 b=fbkCuL3X0EpNGQHTKPQN+J5o1tk1WD1ZvaSnCkLlNZpDKc4eMyPgKFGCQbXnWcFvwb
 33MLo/BbChs+qJaWwTnyYbj3zIPZGsB+hU9b1HftLEiRqDP+s/ukZiVzzB6oDjQX7cuC
 VPNty0xABL2HSE+QkHT1+VTL+RwqVUjtukyrmfy/+AEaz45KxkYx+adzwYkTmmeEURC5
 I40YEYLxdDmlXR7uuv6VK1SpwnAaQBuQkhrbokCGJiP5qzD4HAJgSqf+UDyDKLnfO/lC
 YcTVmUj5nvXw6l3PmuEOtQ9uvRmyTPUMo1wb0GJ/zbvt6mrZY+ekvi+hE3cGbKVxQDmi
 kEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FRlj4xMxhi5GXSX1Cps2ByHahJKaninAekH9Bevmx9w=;
 b=2L71S0/HkhwLSsnkChLVzRbNsNeGd1M5y2EjvYK0s/UFhdI3rnWmd1j+BlasAWlMQx
 ABRT6qQ39sQqIKiS8L8tr3ZVhw8JrKA3lxdRoT+hkKS6pn7CdNElj87vhb4Rg2NJUP6g
 BsDmivv7hCqA3Qp6fmheB9Zwl3CS3AwBTYIEI66a23QTMwJ6xNfb/4QJKejUOzmLCgMu
 gBjShDxGPqxAbeLxvtITZvb+Z0V0h0YKEW+rH2bIFHzQi5zYjCwmT+nvUBWxUEhlJBux
 zjCBAwHg988FhopNJD1HK7fkSgoJYFH9+zCpNWGMPjkpPRlyBZv0AgJ9DeoswB4kaMA1
 0MFw==
X-Gm-Message-State: AOAM533Q4zBK9i2MCPwmHgGwNjLov8qaP8UNHtN63/ReaejX1gQauOtI
 7DOdjY7pP2LZAsxjv3i3ZwI=
X-Google-Smtp-Source: ABdhPJz2wxWOOC7GRX1rgnX4yaY4pEyOhkAnmMPQd+DoD4Q6rJJmJhlYuKx6PRfaZyj47p55C72mMg==
X-Received: by 2002:a63:4721:0:b0:382:70fa:479d with SMTP id
 u33-20020a634721000000b0038270fa479dmr6059863pga.259.1648369136640; 
 Sun, 27 Mar 2022 01:18:56 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm11560749pfn.165.2022.03.27.01.18.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:18:56 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, narmstrong@baylibre.com,
 khilman@baylibre.com
Cc: martin.blumenstingl@googlemail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 16:18:50 +0800
Message-Id: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_011857_764951_8680F498 
X-CRM114-Status: GOOD (  12.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bug is here:
	*dai_name = dai->driver->name;

For for_each_component_dais(), just like list_for_each_entry,
the list iterator 'runtime' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix the bug, just move the assignment into loop and return
0 when element is found, otherwise return -EINVAL;

Cc: stable@vger.kernel.org
Fixes: 6ae9ca9ce986b ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/meson/aiu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db7e5..b52915c6f53b 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -61,14 +61,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 		return -EINVAL;
 
 	for_each_component_dais(component, dai) {
-		if (id == 0)
-			break;
+		if (id == 0) {
+			*dai_name = dai->driver->name;
+			return 0;
+		}
 		id--;
 	}
 
-	*dai_name = dai->driver->name;
-
-	return 0;
+	return -EINVAL;
 }
 
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
