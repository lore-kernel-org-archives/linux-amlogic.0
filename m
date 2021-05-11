Return-Path: <SRS0=CWO1=KG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EE4C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276CE61007
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276CE61007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23JiomzR1Oro24R+CpM7NUynJznMTbFGt8V2sp/uzr8=; b=mHuACwqLEy5QV9UAqrlHQkzzSu
	drLh2QAld0yOI5E4BTQ55X+BX6PFVRTCFG6F9vDZM7qabvZ0nNBRFPI6BVUW1UYhRiDkY8BGiwFO1
	fm5veEMiXF39sr2+96Jj+yPo3cWLcfbdHwAzTlwHsnngqfWmM7V0X8FbwjkEha8H0lmEBneGFyRP0
	3CYAEnlW2jF7OX/+XTVbdnF305vk3i++pl3nbJqJJkWqYsm1fDuFzeAl+tq3vfCfDaL1BEaYCKyHk
	I7eYfLtwIRvxpak/EOHjGAzViAaaF3sfzwgW6CDcq3eec1Rz1Ff6I56IZ8NN8qQ+zg2Q7RKIuuun7
	RVrdXrmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQxS-00HEU7-Kh; Tue, 11 May 2021 11:53:50 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8E-00GXbc-29
 for linux-amlogic@desiato.infradead.org; Tue, 11 May 2021 07:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0aKhMFos6FwrsrnKu5YWX9McpIt7w3RKLcj0tedb3Yw=; b=rp0F9Zw5L8CYhytHG0eBgBXvH+
 8QOlFfnTq913bYpw9D+4wayU9SF29loysC+7ibbqcmY4LrHOVUVlb0AjKcYFX+ICde2A28gBRho7v
 l5TKCLIu0xXGINVH05/O2pRzo9yd+Vzww38/aCzf39XLTLwHpQE9jBSbflUaSAB+64ICdUQH61gBg
 Whi/WkD5dNVEQXgxwRn0N2IkxcybJ+TYs1f4VdBnQkjP5JPi0x45tQCOXuXG2xLZMS2kjSVWDtlLY
 qL07cy6VF5YkRDD3/RD0kW7UEmabCNl9vi2a5aXt+hoT1FSAYdpQky6aqBvWas5IPn40cNcHNiMDt
 iDNFh6sw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8A-009N82-2z
 for linux-amlogic@lists.infradead.org; Tue, 11 May 2021 07:48:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id m9so19100180wrx.3
 for <linux-amlogic@lists.infradead.org>; Tue, 11 May 2021 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aKhMFos6FwrsrnKu5YWX9McpIt7w3RKLcj0tedb3Yw=;
 b=ppcjXHmVF7ECDjdGn2+rwNT/xNSDY7W2WlUffWO3D1QhXtCgJfi8p6WCcmyp6wX+fZ
 x1eWBDHrPvKsmZHDZ3k2FYxwxS47MFsxecKlETjqEIYa9Xc6lcmvOC+hhrxxBP5rs9kk
 1/SXJmR8QSg61HmKzBkuy63yEV3qyTTi0O3Ky5qnUrMCIvA0ITOJ4BeMF8OxTNaf4R07
 Oe9kanSZhXh7akRYewxj+tg3ryw2p5AHx9A01WJKJP4wNB6QyyV2LwaXvIHrKYjUo499
 QBqQBjkytG+nx9Oqyx/EnkM5GtQJAx1hcwnoFUwZkRWFSsHugY5ojoG83/anneDJDHUE
 zL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aKhMFos6FwrsrnKu5YWX9McpIt7w3RKLcj0tedb3Yw=;
 b=gH03z++A94P8DBNoSIjyVb/uMzSeeOcVX0tNNygBWXU6d23/25QDwP06OzOAC/hEvG
 o3zNRLh/EKtPFEAOC5l3e5txERO0Lc99oOTFyXodvlWR6zX+QohOyjtLKPt5KACjtQCC
 B521Fkw6QU/4GyBNqWDTMhODNr+HpksSyAn08sy4+rx2QR6prBqO3yGz0TNhj3jxLP4m
 eqs0Y+tjG77Q6LWn691yYBkOnu9J5ZgLXPL7ILxnnrBbtK+Kxw6LrZbJS8dfnBbThQed
 q/9ttt0t0DD7NljCXJYsdJGOlpsnJs9Cush9Qee8HYD4gJJD/bJTUjB+ctcs48/5Xg5Y
 qyzA==
X-Gm-Message-State: AOAM532sZau1+ixIJ6p1wSA9cWaYDqwmRKZ9ukAxCJNnHlosxoI33aOs
 wEp10rAz8O1wgjnW3zOQMWmGhQ==
X-Google-Smtp-Source: ABdhPJxvk8PMcjaew5j2goslEy2L/b/57GiN7V5OJJTi5n7pDuKRnEMLGQs5PnLQ0zrfKH2aErdXPQ==
X-Received: by 2002:a5d:6e11:: with SMTP id h17mr35388990wrz.331.1620719315466; 
 Tue, 11 May 2021 00:48:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:ce08:6145:b4e3:5a23])
 by smtp.gmail.com with ESMTPSA id
 f6sm28371111wru.72.2021.05.11.00.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:48:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/2] ASoC: meson: g12a-toacodec: add support for SM1
Date: Tue, 11 May 2021 09:48:27 +0200
Message-Id: <20210511074829.4110036-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004838_136673_B5B67C1D 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004838_136673_B5B67C1D 
X-CRM114-Status: UNSURE (   5.14  )
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

This patchset adds Amlogic SM1 support on the TOACODEC driver, first by switching
to regmap fields for some bit fields to avoid code duplication, and then by adding
the corresponding bits & struct for the SM1 changed bits.

Changes since v2 at [2]:
- use raw values instead of defines in REG_FIELD() for g12a_toacodec_match_data

Changes since v1 at [1]:
- switch to regmap field

[1] https://lore.kernel.org/r/20210429170147.3615883-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210505072607.3815442-1-narmstrong@baylibre.com

Neil Armstrong (2):
  ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
  ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC

 sound/soc/meson/g12a-toacodec.c | 143 +++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 19 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
