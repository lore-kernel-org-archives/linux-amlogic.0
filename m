Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA62C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:39:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AB465267
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 17:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56AB465267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=beNgPH+H/ipz7HNzh9m5FD7nbdAfyQvoL+P5CpswDWM=; b=L1YueOqnzBCMyHfyUh3SAUF0T
	k/TQ6Ln7kxvdgwnuoBmIhLSasoFOi75bs8mxYC4w/IdKHwnIJs1MsV24R/lPLBOanoo9hyELX/TU4
	3BKrKiLmn1bb9X9MNVJznKD3enWZswhiUm+EOHMEAzZPn9J2uuFJig+Ui0N385SUlsDrq13pT8LCR
	5yNjoVVragp85FSPT0v+y3zQYzAwz/xzyuXpUdH1870X6E4uHBB1+lOWKbFbw3/zY2STsDQwXeAzZ
	rChLXK5+qVKxXJvr/uLUHUe6mtJHhZItG4QYBuOs7ZXht3o6hUg41ne3NECKbyny4NEG8ms6j2cNl
	NAR1jrdcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJqX-001Su1-Ks; Mon, 08 Mar 2021 17:39:09 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJqU-001SrT-0T
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 17:39:08 +0000
Received: by mail-pg1-x532.google.com with SMTP id w34so5790332pga.8
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 09:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VhL8CwHew6ht4lQQGN+2YnQ680r63GWwQpYWdHTYd2c=;
 b=u92iHKJa65nDaVT+BIljBfu5cjEKF4fVI6awg03P/nB1+f4OLV+Yb9DpGlUilQnXuB
 YD55kOVk81Eqn0cHHypYAujwfj5Ig6HKnASMDUp1DiRGXimqGN1S/uEwORlyUHkeHRL6
 NMZpZromHwzSszWr4sHLB/h2Di/QVPKLZ+DH6+5Wg8NVTovkJvD3F/YruePD7T0ZtIwD
 h69wupT3i9suTfchMV5Lv6iYxC/DCVpW5ZCq6KsIEMZ7Uvok3qwEXXjAB5eF593aVoKS
 2mls0KmHuu01Fz/dQWEU0sRDv0cX7u+44d8Z7c8bdYYBOCE65IiFk0CRNsMcR4Cokif+
 ZOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VhL8CwHew6ht4lQQGN+2YnQ680r63GWwQpYWdHTYd2c=;
 b=BeR0pxziU/tnjtwRrchXiQ3/U4X+9lGQo2PNpSoQ6RwLC6aA7nsVEAPxlPxvnzIuem
 XefRFe5EU+tjOPNc2JFSOxtL3IjkyvU0BSI+hWTLsApjcPrOKL2/E50jTTF2Wsh6EGwA
 8CY+cHe99tv/unZntuEsm7YP99dQinbYzJM4ygt+qChaYMEAwPb3W50BcX5e4vb6tBES
 99wpz28TnV7SRGWm972Fbnk6RvXNrYnJ6e+aOq+I9ofIjl2eOWDE2aqOlj1HAYC/VwQY
 aBR1tU4zDwoL4t6qACdgoK2xzSyrisBUKQbBan6Q7344eoRGrrGZmpKYvl9pn2XDwe78
 6jcQ==
X-Gm-Message-State: AOAM530yROwjSNfwKUyuK2c+EuiSXIHYRAEhRwj/JyIsJfAtu+6Y9ayy
 6W7xly2pdelHs7ICBokaw/VC+w==
X-Google-Smtp-Source: ABdhPJxT6E1f5pLo03A35kx0a+5+z9qTd7Bljn2q+ElBTRr2tBVQ/12crRdOdo8HY3JjXKbCia6N2A==
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id
 h25-20020aa786d90000b02901ef4f404bbamr18884738pfo.54.1615225144333; 
 Mon, 08 Mar 2021 09:39:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k3sm10120911pgq.21.2021.03.08.09.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:39:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Alexander Stein <alexander.stein@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Mon,  8 Mar 2021 09:39:02 -0800
Message-Id: <161522513396.14471.9490936640361776258.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203192824.854491-1-alexander.stein@mailbox.org>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <20210203192824.854491-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_173906_210088_51009498 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, 3 Feb 2021 20:28:24 +0100, Alexander Stein wrote:
> Recently introduced async probe on mmc devices can shuffle block IDs.
> Pin them to fixed values to ease booting in environments where UUIDs
> are not practical. Use newly introduced aliases for mmcblk devices from [1].
> [1]
> https://patchwork.kernel.org/patch/11747669/
> 
> Commit message taken from commit 0011c6d18277 ("arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.")
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: amlogic: Assign a fixed index to mmc devices
      commit: 7827db7f6141fda9af4b07864cab0c10398affff

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
