Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FB4C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC02760FE6
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC02760FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rCIBu0pcXpuvGQt7S+IS5b3V2r8szkATVSHdeEihmEA=; b=sB4ZInT/mV+O1j
	KYHO8N0JPUCFSNqiBg/qfRb22YxPOn+VvEb9iImFcgszsG9VZByidix7wXjHNSDuRp8ncOlExe4pL
	kF7TWRSa/d2sTC1ruYzcWQvX6IYGMSiaGkhegmzEpwHw2Tj2a0sks4zQV6ApLi1B9dY5bziABCvdC
	7+FoffphAE9zucMboVKYiT2VIOibkob0b21D3MZxwWG6nOPHNWjmdOwvU89nYJ/z/fiEL3C1gc8UE
	5ksGZIVIYKPAvpg9bcyQORme44p1H5IQclZqBMN4cEmIiPnIfpxMyJ3tOOvvFEO6ug1wsG+ZrXk1B
	XozVQdIFW7YeA90LuwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS3RY-000AIy-7F; Sun, 19 Sep 2021 20:29:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS3RL-000AGl-Ia; Sun, 19 Sep 2021 20:29:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so11213683pjn.0; 
 Sun, 19 Sep 2021 13:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBjSMPq/tc0MbMsuyhFQ5R0zfd/wCDAa5rcp0EQgEaE=;
 b=lYdbvL9opmTy4v90dyhALAdqgj2jW0gtT5y2fppjGanjkhqQSamb4ZVgE/rHd6DZLR
 qBESeBE8UgGzFjKp2XOGq/6hqha7HEWjt7wihYzM+8HB02ExZxGWuv34y7IrgVofHvev
 lbQJGbhiHrnwc0OTXZp+SyEtcFMv2Xoc5vNqmedcc1GfqVD2cBJ1s266BUj9vORr+CV7
 B1kzKNvuifwAxxXUgYsnmgCso8TOK0VXJmKuI/x1zbKIi7xYHohvW7+cN37Y0c3CZ4J5
 zy+epdlDWbMsyW+krMaQrF0dbWI2c4DcijM50ZSF7RlWa1QpaSf6F4EL231pKrYyrV8a
 Gc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBjSMPq/tc0MbMsuyhFQ5R0zfd/wCDAa5rcp0EQgEaE=;
 b=FD8IW45lM/yTlDNquFJavm9fO7mYesJtrFQoIFGOzi4onB/OqQbICIa+RaKOZy9zCj
 2hLisQetaUQcNAxXHMAmFndNEc9kfGK72Ei+T/Ly792S5mxfkIJFAvzQOblr8wM1hS1W
 +DhxVgW4zqDPc2XUUnu7rOgXebPtdkABZafArmtrq7Ljncsn7eY7qc+I0Zvk0AAt0G7k
 Sy9/0SENdv/tRi3vjUZpd224+ikzmbKq90Pr+7G8pKajnyI6+BhKXpxZ/lAcIVtaPRSR
 4lpMWCqPg+DyklAsIY7WAon2uPMgAtmlR991K4e4EjZ7Glz9F77AzUl+MXpp4p5WC7MK
 tr6A==
X-Gm-Message-State: AOAM532GtuhqlbkjkoGL28E23PGFIiDiYi2l1AcYhLP4/eawVhfLvjJ+
 OUoMTD02qLHSSygrSRH7+oA2DhYgyjG/LA==
X-Google-Smtp-Source: ABdhPJxoT9VPIS67Ft6batnOOnUBctnyPbP4zsaE4K0N3bJ3Ttj092+S5csLVDH6cJp1W6xUrz7//A==
X-Received: by 2002:a17:90b:3b4f:: with SMTP id
 ot15mr34599158pjb.243.1632083369891; 
 Sun, 19 Sep 2021 13:29:29 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id z11sm12663684pff.144.2021.09.19.13.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:29:28 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 0/3] Fix the pwm regulator supply properties
Date: Sun, 19 Sep 2021 20:29:08 +0000
Message-Id: <20210919202918.3556-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_132931_659924_08F946A3 
X-CRM114-Status: UNSURE (   8.46  )
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

Changes PWM supply properties help fix internal link of PWM to
main 12V supply as per the shematics.

V1: https://lkml.org/lkml/2021/6/29/288

Thanks
-Anand

Anand Moon (3):
  arm64: dts: meson-g12a: Fix the pwm regulator supply properties
  arm64: dts: meson-g12b: Fix the pwm regulator supply properties
  arm64: dts: meson-sm1: Fix the pwm regulator supply properties

 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi   | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts  | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts        | 2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

--
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
