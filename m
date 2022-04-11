Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B27C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uE3UeRlsMFCTpLmVFq5HSj4eojPcWsqMYNuY7ieOud0=; b=GQdKmq+g1aRWGKF3TSRuPl49UP
	1Rij6ci9/7XY73ulc2x6C3w9JeFhAiuIDJML83u/xoJchhQxmu+SQ9NooxmlBOW6qYK3yqcohSqm5
	VUth/2VWD1Bt7IY9GsqFJ4pX1mXB9f2KU/5L3TuVOIlCWkeAy9wNTzco+5BWa1L5gD2tOSVblOrT6
	X4yRM557zOjmrQ1LOrtgm02bsfTstl6HJWU11/EcrNvYk5/0/XsIc/e1bMHZ0x5JyMWCN8UgEkYxZ
	p1r1mzQpYv1eDcMaUvi4DtOX1bt0NIEZGMolmGv2y7dGwo5dmgNjcyaK5zRPE/BUkRxxolL9QQ8Ae
	mh/DzRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndwka-009ka9-0c; Mon, 11 Apr 2022 16:18:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndwkW-009kZJ-Dq
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 16:18:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so8844092wmn.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:subject
 :content-language:organization:content-transfer-encoding;
 bh=KZq1JNDvgY016qnbiQ72f4znC/LoDLkQblMhqS61dJ0=;
 b=f+HXwO+yMXwMWGYaAvM/xqbwSkOsNxbwuphhjrnjROFRsPNUBGgwR2tVnnFNjOAwgA
 QOVFahZy1ywrG+D19J+Ncs+gLhmktS2F9DDNUjRuIMWZTNR3ostTu86vk1MEAJAhKSrl
 bLxeT1NGFEi9T3aY1vFgP+rGLf/sZ1lbAh2HHvvH+FUpbdMXplbJ5AG0vNyx7PJuLW0v
 GtjwxXLvBrsi8m/h81h6BCan3fyX+SWdtq+j/ciKreefGfNBaZQBfvzyPIOq0ZKpUjVN
 JbXJcOp5OGp9e7Bw9oA9j52aBqmAq7OLHfp8XEXBMW2niHdZkUNdnGcskqu1fzDxu6o5
 Bc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:subject:content-language:organization:content-transfer-encoding;
 bh=KZq1JNDvgY016qnbiQ72f4znC/LoDLkQblMhqS61dJ0=;
 b=kGYcFSA1brN+xf8gxWFbYn76EevpiR+miD/5+AzqRCGj0EhcPEVxSIhzpaH8BxccFw
 ArrEmA0cqMzdHzd1eT3aZn9WzR0CLMteqap7raay/JM/o4V3dNGBBDNjpIaK3bKk0m/N
 yJxrjVy2UlZAjYXjDL+mELvJm+bQ9cANoFM9k4Dcy+GtAKyPwSZ3Jg6mQCBD8NX+a+D3
 PNi7Vjezb3S/MAs0cR5lAkpvHkcqp18WvrHnB4MATQtF2UMUn5PDNcJf/sWZhmITvRB6
 mDqp5ahq2G33+GEtYVRR5lND/N7m4sSDmHuExQU1Z5r0+AYtaxTlomhLLTpkEDbgi2+H
 rVTA==
X-Gm-Message-State: AOAM533Bq+wAlYhHefslf7a2jDJJHIAHuMLCncF6XNjmHScvyApQEqgs
 zKfa4jU8nbildLGxB7p9kuYIlJ1yNePoc/6L
X-Google-Smtp-Source: ABdhPJyZnh7jZqpnPva4AxZxoSafP/Ev3VW0bBx4kbSLfbsVVZShVO9R+ezV+gt54W5hf1nWwV/4Yw==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr30483518wmi.91.1649693922908; 
 Mon, 11 Apr 2022 09:18:42 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d6b8f000000b00207ab69284csm1119381wrx.23.2022.04.11.09.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 09:18:42 -0700 (PDT)
Message-ID: <1132bd6e-cd29-6e58-1fae-38e074545b25@baylibre.com>
Date: Mon, 11 Apr 2022 18:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic fixes for v5.18-rc
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_091844_511293_7612BAC7 
X-CRM114-Status: UNSURE (   7.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a couple of DT fixes for v5.18-rc1, first removing the unstable lower OPPs
for the G12B & SM1 in order to increase stability over time, then fixing the S4
cpu compatible and finally fixing the GPIO Line Names for the BananaPi M5 board.

Neil


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.18/fixes

for you to fetch changes up to 962dd65e575dde950ef0844568edc37cfb39f302:

   arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1 (2022-04-11 17:53:38 +0200)

----------------------------------------------------------------
Christian Hewitt (2):
       arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
       arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards

Guillaume Giraudon (1):
       arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1

Xianwei Zhao (1):
       arm64: dts: remove cpu compatible "arm,armv8" for s4

  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  | 40 ----------------------
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  | 40 ----------------------
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  8 ++---
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  1 +
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 20 -----------
  5 files changed, 5 insertions(+), 104 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
