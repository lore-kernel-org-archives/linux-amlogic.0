Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7902FC54E71
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2024 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FKMSm0cBBfEEbe+DJeGvYHF9+PALpoAi0mnQqjtyayA=; b=gLxCMq200kefgP
	F0+Kb+LLu3scxVq91wvOMEQ4YP+MaUjFkEOYNOwVCqD/YxowhjCV38Z+eVZSjmNOaPRxGqAJCd1Js
	APb/ZbXQPJZ+Xmi5OxWjWcd49DMJokAXAxsEbFAAtIZUVsSCXbOXzAOYL6sMQMkyVMjBkO7D4jRKg
	4A6QDDmRFWYO2oxXgDiwXmFr6PkASXLdlDy6/Xn6wLJTNQr7PYDONo94sLCVAJc3hJLM1mC9/g/cL
	oR8WE2FK5nYFAmgHhc9qYg+HBRpfdVzKJUq6I51hE36FikgioNoxyvmnDmz+DqB7ba/n5HN186qZK
	5ye1j3UKNJLQ7DdIKN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUk-00000003Dm4-2JAN;
	Sat, 16 Mar 2024 13:54:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUh-00000003Dkc-1K1B
	for linux-amlogic@lists.infradead.org;
	Sat, 16 Mar 2024 13:54:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-414037e9acdso7483545e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2024 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710597275; x=1711202075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt/YjxGxxxRTEXNRaujnbBUr5TtFYZAAACdznTR67QE=;
        b=URfv+66YQb4oc8QV6ZQ2PntijLotVrzh2AMzXLuNNLqBZZHlE1XGAePlg1EgEUSmrA
         Kcn9p9PKKTBB84aEsYXD8ava4ofj+gq1jpqDubPHAIsZrhBBIc4PUBlv5vOzZTma7rXk
         nPBqC7upI9RWZoGs+sKlfv5SqvtwmQgj+iah21UkmQG3qAf4GRXSJ/4JzfOKiuElEJLV
         Wobjsj5lTyqo6N+VH4j8Y0OjKUad895esdXkCDhFpHykKs8uug9CxO0QULhp/8avxq2X
         j4R+Iy9a6EHnpdRugN9uLJpuwYG5UVkXzg29mem3QlFIjAuNJY7ifWou8V/xeOuVCqDU
         QB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710597275; x=1711202075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kt/YjxGxxxRTEXNRaujnbBUr5TtFYZAAACdznTR67QE=;
        b=fY0lX+FdbBRcrY5OYFe6cF6Vn1SpQoG0Sod/v92QalMbHFm5uvyrRwHgOTlpm5kv0k
         TUj/od4AIZ6Nj6gLw/HmvXLntjyaHn9MjREU3d+6EtAeVL36XM8BCzSUp7TbG/fCWih2
         pfY/4zCsOHS97AORC6Q3UdsMtWbxJvOX9ENb3qDddqRXjBEEGu85d3N1LB2y3pmrj2K3
         MGgo1kF38Sj55dZhG9S9NI/zzIgu2ixIptEBrsavbH+usLtHae9+Ju5nBRXC5dfdBr+O
         kqrOTc86IXhSz00P4ik0ibrBuKAFam9sUjerFJA5KoOSA4jvgfOQg+ImYCc7tjDpIZxA
         txIg==
X-Forwarded-Encrypted: i=1; AJvYcCU4uBeqUY/v/6XHsJ8keQZ8ZWrGF9GYPfGdf+tE4rNHPhucnE1tsZjGyARrK8emWdJR+EyJXpOnFV3otkLaECxs/t+v8Cbx10bdywFs6Drqioc=
X-Gm-Message-State: AOJu0Yx4TomPdqfkpnKBuXSYCWUiA66AiDs9fThgBpskGwQGpxwL6aNL
	+MvtzY8puGpCQBXxGP0pI7QcJ3nlNo3MaX3hSfGwwXlSGFUBQ9tB
X-Google-Smtp-Source: AGHT+IGYxko7SOhWbl0XhbZC2hlDbIu9Uyg0oBzjsgz5cMhOL4IYHGlOEO0cArEepQ4PLNvpMrDW5w==
X-Received: by 2002:a05:600c:3505:b0:414:630:26ba with SMTP id h5-20020a05600c350500b00414063026bamr1928214wmq.15.1710597274911;
        Sat, 16 Mar 2024 06:54:34 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041409fa57c4sm523963wmq.34.2024.03.16.06.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 06:54:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] ARM: dts: fix Ethernet and random MAC's on WeTek Hub/Play2
Date: Sat, 16 Mar 2024 13:54:27 +0000
Message-Id: <20240316135430.826898-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_065439_382579_3B26D82E 
X-CRM114-Status: GOOD (  11.98  )
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

In submitting the original patches for WeTek Hub/Play2 I appear to have
squashed an experimental change to place the u-boot.dtsi file on the common
board dtsi, but this was incorrect and results in broken Ethernet. Patch 1
creates per-board u-boot.dtsi files to fix that. However, while the NIC is
now probed correctly this results in random MAC addresses. Setting the p200
family in board configs also does not work, so patch 2 revises (overwrites)
the board init function using the same code as VIM3 which reads the factory
MAC from efuse correctly, and patch 3 sets board family to ensure boards
have a static MAC. The alternative would be to create a dedicated board
definition for wetek boards. If that would be preferred, let me know and I
can rework the changes to do that. And apologies for the mistake on the
original submission.

Christian Hewitt (3):
  ARM: dts: fix Ethernet on WeTek Hub/Play2
  ARM: board: meson: update efuse MAC reading code
  configs: amlogic: set board family to avoid random MAC on WeTek
    Hub/Play2

 arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi | 14 ++++++++
 ...tsi => meson-gxbb-wetek-play2-u-boot.dtsi} |  0
 board/amlogic/p200/p200.c                     | 35 +++++++++++--------
 configs/wetek-hub_defconfig                   |  1 +
 configs/wetek-play2_defconfig                 |  1 +
 5 files changed, 37 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
 rename arch/arm/dts/{meson-gxbb-wetek-u-boot.dtsi => meson-gxbb-wetek-play2-u-boot.dtsi} (100%)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
