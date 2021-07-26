Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BC9C432BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8493E60F37
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8493E60F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNehglvHV7p7m7uL1ijbx0tPROOxga3Ea4NB8aQ5ZkY=; b=pM2Hdm3aurXXVi
	iNwMFdU6djDW9UxyRCFeM3x5oRCSC2/caKwDSqHAhRyGUlBfgXjcFNuC/KsDurVxssKO83AxhQcz4
	mp5kVAe1GHouIIpG40ykwAlrUxmKkJjfQS8jqb0dqvWFUgl2lciFYNKO4PbxGBlLydcgym0dzopkN
	98pZWUE7D/EbD5isYFfnIJQIh8rlLnfpx8ccCUYrc2Zefgz37OZHxreqg5nKgnP5kdztAMVIhuPFu
	E2N25d8IHgu/9dYiV1l7239P/E+LqP7Oy/sjBd+ZRXaxLJqQlFAkUd+GfQvJScvl1Xu4aov+EebCj
	X7lhOPKlUGrUDG+ysdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vjI-00A79T-57; Mon, 26 Jul 2021 08:12:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjF-00A776-6I
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so5719586wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CoiKk7rjio2RKU+s3ML+lKUiUQc1wLkK/GH5VGg1QY=;
 b=c9CVGx9R/uCP+dtbA4o3A8K4gqhmdIWCcfv/W0+jiGY0wrz1i+wOhT2dVGYtitY1vN
 R+8yGxVHqMm1hp8RiRwvxXNbFKnhTgmIsynkLs+AiE81vP5jQ+R7zGp74Tb2CI4lU1DW
 HBFykmIGnqVq9XCGQockQWegrG+I5Srsg+3TQ2aDeLmKTsZk1bT1P6bL1KbP2Vq7IR70
 b7IdVAuLvRSvhzhu6Y0YjxNwAxL0/uLY45UlHDx11mAeXpCAxG0jPErfdLUMOlhuJmym
 2gDaGtgksrUV3ca5t2Pf5+AhtB1PrD12SEqOvP7wrY3iLru1t9WxTOfCAANmvp9Z9hDO
 wMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CoiKk7rjio2RKU+s3ML+lKUiUQc1wLkK/GH5VGg1QY=;
 b=rmxj4/oxZLslesXXUkrAzblpWlIfA1fWr0MFH1vqFid91m1fIdBJfj4xg+lYks51ol
 I8Oe9LHD23q3eXT7ta5RI6hT1diXwpH4Bm1U2E/8qu/RuFBME9KsT8Md1MleBgaREzrK
 jaZEsa66h2YufsudYiMnrAF7WusvAcAkB1uG8gtomusD96TAriziomh5xb03YM2iyi47
 rHrkrseiFbRv09PI6RCyKWkAiT4beRPQuhkM7N99PmaZtMIySe1cSOTbbAN9efah9Ryo
 YPaA8OsiWk1o4HNwa7SIifwTpsAITxsf8fb+VtPI02nDgOYNsO9+jS2fgS0ZBYBirydu
 RpSg==
X-Gm-Message-State: AOAM533IUSoKcLhH2CzU7qqavmN89/v+eE6CPrhc3nCNUEdXyB8jMMp2
 OGw59HATEBuQbkAQB2zHSxExmg==
X-Google-Smtp-Source: ABdhPJw1KBlFH9Kv9XOSPT+ukLibgvYWWjL0nL1sHy6Lkc8xHILZFAWqyqy8ybzbNqYxjrCCf+mnlw==
X-Received: by 2002:a05:600c:3391:: with SMTP id
 o17mr13962613wmp.187.1627287167675; 
 Mon, 26 Jul 2021 01:12:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, art@khadas.com, jbrunet@baylibre.com,
 devicetree@vger.kernel.org, khilman@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 nick@khadas.com, linux-kernel@vger.kernel.org, gouwa@khadas.com,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
Date: Mon, 26 Jul 2021 10:12:36 +0200
Message-Id: <162728713307.14205.16768883213869535162.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622044334.769791-1-art@khadas.com>
References: <20210622044334.769791-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011249_274409_12C414FE 
X-CRM114-Status: UNSURE (   7.56  )
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

Hi,

On Tue, 22 Jun 2021 12:43:33 +0800, Artem Lapkin wrote:
> Improve gxl-s905x-khadas-vim wifi performance
> * change freq from 60Mhz to 100Mhz
> 
> 100Mhz works well same as in meson-khadas-vim3.dtsi

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/2] arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
      https://git.kernel.org/amlogic/c/6b197abe56feeafe9c516dca1b3ca3742200adba
[2/2] arm64: dts: meson: improve gxm-khadas-vim2 wifi
      https://git.kernel.org/amlogic/c/4b5260032ec691b11a9185f7f38f5761e67fab48

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
