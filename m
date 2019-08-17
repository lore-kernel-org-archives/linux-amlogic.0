Return-Path: <SRS0=Zj7N=WN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C10C41514
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCF82173B
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PlPq18rg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXETHoTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCF82173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qz4b2/Igra5GgVnZA+0GnM89AbSuPWgNjZVtzfTXJEg=; b=PlPq18rgysRnP1
	HRqAAqdm1fgiukS77/vrzZ1nI19ZxVE0sww2Gs5dV+w2452lOa/kIeHXPc0BAJt3/FYoL846QFpIJ
	DhtkqoaFwPCE5JAewyeTl4g09jNgGFSFGshMoJc4CQBuQD2x2qyrzwVyWb4B97dK4n6LbLPQ75FpT
	sYitYKDQLc1kcbv4NO3h6kSLtwfNMkJHRp+ZM1fTRCFizJaXnM06JmHDb1TuyFxM1ld3u3yYAYdTf
	4TrxjFv/8nhX3DzbVncJSl9cuLdnoMM+eiF3kL6m4Laf/FV11EnPDwzboBgulCEAgxjKbcNDpbEJF
	uJDjrbznFy4mAFPFogbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyvwx-0002IZ-Hx; Sat, 17 Aug 2019 10:28:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyvwt-00027W-1Y
 for linux-amlogic@lists.infradead.org; Sat, 17 Aug 2019 10:28:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id u16so3899346wrr.0
 for <linux-amlogic@lists.infradead.org>; Sat, 17 Aug 2019 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ic4QxDcnEZDhCpYny2vHTdJ+dOVOWXSrwdjwSM39+oE=;
 b=dXETHoTZ3yT1tDkbMOzWnf07w9/anSOn9DCxcm5/e0bW1/D7P7CoqbQVunPZjHNxyL
 pWsz+FvGrHvrczRXk40yAZzFpx4onSHTQVF5o0FrHLCfJLxlk0PTMpzRv0FIfpbxoR3F
 xnBhyXMaLE8fKBm/SEttWKS6uHWs17+B/Ija1Vn7AuqR9VaojRsx01CYvlVQwiWOflLr
 /zRU7NyJnwk/ZuaCGjtzSJOInV2hDoxzI6RcUmr65rsZaCSp4Vqm0b1bs1GCR2lbo0+C
 MhXUCkDN2RgqNbNjuTosc6+fdUiAFmtEqKNIZv/lRUToGwemYn0X2fkrczTY0cPGoPzd
 9MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=ic4QxDcnEZDhCpYny2vHTdJ+dOVOWXSrwdjwSM39+oE=;
 b=HRg66CGchm2NzDF/zprDmDxIAvEHLrJqid2/RGf9XZfGQ/7cKkKgjOkNC2s1xZTf9f
 reQB+zkwCP217YDXJgfwX7GSs+Gf0DtKuwtEm1XwMQnqp7ERe6QUJjkT4tshPOz1iYHd
 ADg+zW1Div1DL4Htx0Y9/dm5W4+MGyp7ZYYfG+zQvN4aqXxnPDNKDPwPvBnGXK/rKvCo
 8y1B+AHyyJ0rCqDyqVkyjJWbS+KqhZVuMQ2LQmfh//u0kvR2/Q9Rn8scy4gzlik5GSjC
 7bn3J4ofakPSaX5T5QbiD79Ztyzw2cfRDa/fDqGCLoJYmTQvKvXUHJXU5cnwkY35ny3w
 QBcQ==
X-Gm-Message-State: APjAAAUA2ORQxXq5gO/To+/D0HSSTIYhO/G84zixYoAfmfIYTyscWeRo
 jSdK5qP5T6U1zYddS1Tt9g8U42dd
X-Google-Smtp-Source: APXvYqxY5+kiPOd6DrP5bS66mWlMUYUrbzpIKhgZdFRKIQA74iNtBh7etxMglSPusTVUbnz3rk0K8g==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr14493248wrn.264.1566037713892; 
 Sat, 17 Aug 2019 03:28:33 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f47:db00:ec01:10b1:c9a3:2488?
 ([2003:ea:8f47:db00:ec01:10b1:c9a3:2488])
 by smtp.googlemail.com with ESMTPSA id 24sm5380514wmf.10.2019.08.17.03.28.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 03:28:33 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v3 0/3] net: phy: remove genphy_config_init
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Message-ID: <8790db9d-af10-c3b1-bc65-ee21bb99e6d9@gmail.com>
Date: Sat, 17 Aug 2019 12:28:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_032839_084622_7A2DA0E6 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Supported PHY features are either auto-detected or explicitly set.
In both cases calling genphy_config_init isn't needed. All that
genphy_config_init does is removing features that are set as
supported but can't be auto-detected. Basically it duplicates the
code in genphy_read_abilities. Therefore remove genphy_config_init.

v2:
- remove call also from new adin driver
v3:
- pass NULL as config_init function pointer for dp83848

Heiner Kallweit (3):
  net: phy: remove calls to genphy_config_init
  net: dsa: remove calls to genphy_config_init
  net: phy: remove genphy_config_init

 drivers/net/phy/adin.c         |  4 ---
 drivers/net/phy/at803x.c       |  4 ---
 drivers/net/phy/dp83822.c      |  5 ----
 drivers/net/phy/dp83848.c      | 11 ++------
 drivers/net/phy/dp83tc811.c    |  4 ---
 drivers/net/phy/meson-gxl.c    |  2 +-
 drivers/net/phy/microchip.c    |  1 -
 drivers/net/phy/microchip_t1.c |  1 -
 drivers/net/phy/mscc.c         |  4 +--
 drivers/net/phy/phy_device.c   | 51 ----------------------------------
 drivers/net/phy/vitesse.c      |  6 ++--
 include/linux/phy.h            |  1 -
 net/dsa/port.c                 |  5 ----
 13 files changed, 9 insertions(+), 90 deletions(-)

-- 
2.22.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
