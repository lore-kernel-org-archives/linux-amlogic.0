Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8564DC47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 491C261246
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 491C261246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SDsRnwRg/hj3hSUWQ/zLtUxj+MZ/T6Oxqvx49GMXpHw=; b=ncJ5jPwB11Zi8a
	N+gSXgt3XVkpv7YYyjQwVsGrlW+379YqenNSM31s4lOYDCFA3qcuDhiXxWi9BleNPgpx98Ck9Wn+n
	7edKu8Mt74lvzQgH4/K/Kc7rxzcQvrb6bbZzN6ER6n6G/2rxTRa8RJVrYF9tUn38cEEjvj5lYyU0g
	9x/d/03bjHIB0LkyQ+I1Hl+OEpKymuL6ggD57crdtWHwMOLYH8kfP5Xuo2T9nbORGMEN5X4pfh/27
	MfBlxG4WxQEyMmJ/kWZcisHfMvXKH3LNoSe90Cod5K5+n8usEA+d0YOue3ro/kOU/eQyq139NsUZa
	UCOp2uLixyQIOEpPBL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPj1-00G6lY-QX; Sat, 05 Jun 2021 06:24:03 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPip-00G6kP-DA; Sat, 05 Jun 2021 06:23:52 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso6206051pjx.1; 
 Fri, 04 Jun 2021 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBcNqXrLG82ETe+gtsLBiERjJoskwcerbb67uZK7IJg=;
 b=DO/wE/9aBH6zl70XS5bNB2tYgJDrPp6L2kIZJ/Ym7FlTj/s2wwW6zzUJP28HKRZLpS
 pm71TYfWs5RONuRETyM0b4/CnRnxmcDl7IzVEvvmuK2nLFAniJg4trCNjbvmP0mIxJ58
 tFJTOFbno7l48bxbMJ3FwsU2FovzFu+7xPOPEK38DcyS/SbhUQ6nlG9Bkr+XgJPPkWWQ
 VwxGzv/1ehCicTGc2zEQfKBnS43hE1QQnd+feayf9gUjSeZ9+wyp9bHWuy4FlhPZuh8H
 55sXNui6JWAvfoAb58vDqa+5qYygYVzQ4gat6sMLQhPjxKFthgw/yDO1XTcKSN9enBOr
 ltyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBcNqXrLG82ETe+gtsLBiERjJoskwcerbb67uZK7IJg=;
 b=TLUADXIwKrHBu/kUVydPEMu48pmGXbxGj/vZ1pYNpqHDM10SZqfbKeOyr69MOUSlh5
 Wp/1AzrMUJ8yyOvqVqANz6wCDAwUCIvzs7GXYNMuRyrgNobCY6YUW0u8EmRGEKjkRojI
 Z0V5tE/faStyMTdMenErt0UWlsqYb/18dtdzds/+NID/Uu7t6xVCwmsiRLYlt0hdmkMD
 n9a9byVxos73Guq/D7bbgpZ3HUGhb36XvFFFHV/bWI2xcTJX9msOh5+xm5THTKIN/coh
 9evs6p+XFd2ybuVKt3fXyKJt7O9OuJAPkPsQW7be4I9Ns21hgAiuOC/DAmqY1ZLDlIHq
 7w7g==
X-Gm-Message-State: AOAM531ADnmkDUoOa6yBi5oVKukRbvASmUdHRXSXJPvSuzOcxcSuOsIc
 W6kkd1iQ/U0CRwA6mXbIWgY=
X-Google-Smtp-Source: ABdhPJx167H1fAgL/KmXy1rENYzktplaGGUYU4gAvdGnsSMNHZcY0XH6zGUWkiCZLwfScLf3roysbg==
X-Received: by 2002:a17:90a:549:: with SMTP id
 h9mr21590806pjf.158.1622874229119; 
 Fri, 04 Jun 2021 23:23:49 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:23:48 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 0/6] Add serial and i2c aliases for Khadas VIM boards
Date: Sat,  5 Jun 2021 14:23:07 +0800
Message-Id: <20210605062313.418343-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232351_488402_8848B1B4 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Nick Xie <nick@khadas.com>

This patch series update / add serial and i2c aliases to
keep the same with 4.9 kernel for Khadas VIM boards
(VIM1, VIM2, VIM3 and VIM3L).

Nick Xie (6):
  arm64: dts: meson: vim3: add serial aliases
  arm64: dts: meson: vim1: update serial aliases
  arm64: dts: meson: vim2: update serial aliases
  arm64: dts: meson: vim3: add i2c aliases
  arm64: dts: meson: vim1: add i2c aliases
  arm64: dts: meson: vim2: add i2c aliases

 .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts      | 8 +++++++-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts    | 7 ++++++-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi       | 9 +++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
