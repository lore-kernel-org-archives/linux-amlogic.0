Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D670EC2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:37:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC80220838
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWp2bD2e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oW/XveMr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC80220838
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9YilDAzt2kxL1FdAyOBnACyEkgG8J9zPVDTXX0quJIQ=; b=RWp2bD2eq037lG
	g1J25NP7b5TSO6woiyQAgJk65XPzY50jZ3onGBRQTMWBsgqx8oMXkGMyFAE4olLu2sXgu124CQKY/
	ET8vCLWuBmv8H+mivoggR98gNji31iytj5DCf1BdlbHksHM7rtaNdKXwCGOclLqe24/UzlEUFK4wN
	ZFnPzsh1ffuaDaXMRbvQF3thn82Cudsz91y+SPoEPadHy/NLdGLWfF8b1b7sD8XTJpy0Tg7GvbJ1J
	qLw2JeiDd/DoHK8/pc1wkTmXTYTWLpK4AuzWM3EtHR8XTJ1HST3M6ySbJqM+xAk8q2xt3Pizg5R/3
	C1JTqIHwD3d6gYJTbaxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikZsi-00059R-2F; Thu, 26 Dec 2019 20:37:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikZsf-00058a-Ke; Thu, 26 Dec 2019 20:37:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so6648302wmc.2;
 Thu, 26 Dec 2019 12:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llajuKPgaOsGAZ6hxa/EUEXLbYSF0qHLJQBA9/H47cY=;
 b=oW/XveMrY7fe5BgQnxbWDFAdmRLzL34s6I+JDTYtT8TRs6ext70L0wuYi/+Vtfhd45
 p99aaZp8WvB3IUsF09jM6FRejA5aZqbmUQPfEqA7hfIs69wsamf2BZWiOhUni2C/SLVb
 DroTOrzmhzBXznCFPGZ903sH6HHNvidiSuV0NXecfwA70KkKc60JxEGg21o4y7U3iHoo
 Q7zDTePknya/1fOgs6TMIOf82MU5Auee5qqrrrzIIbavbMBQWbbu/WHTN85vtN9SJqdS
 hyeRaEbNItnY7nIsgz+Fl1sAAtKzv/lmtZz6u4WQyP2EbSuL3mBCs9H3gQ8KDvucVYf2
 wpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llajuKPgaOsGAZ6hxa/EUEXLbYSF0qHLJQBA9/H47cY=;
 b=MkDRppUVOty2GYM9Bl1GzCQVcE9s12+QonqOhVsdutpAHlvJtXLTElnN1dzlNKbNor
 NXrYVp8Uv8YLwJvb3r0C9oZqSPnX4Fv/b+7CaNB5GkKxe8AwgLMVZVEjkDf9EwClAm5f
 UfYyelxycrrFQlcMPCCJ6RhZexhhFn1D+kmdsSZB9rpPuULEhJWPoYKjhf3I/lYqPLTD
 TVt4BGIJA0H4oyGLIBTwEF7TlRuqCSZjQmJ8KJ+qv9RraC+7ebM6jpQ8OssDbjpvOciy
 8pPOLRXcGG2qH8hoPRLeQI4yNkpfzTqJOcbU7bbKHdrSiIgp4T8rA76FQVxDSh93aWxx
 1GJg==
X-Gm-Message-State: APjAAAWpIKN+xeyQ8TdxshdwC1ghn5IvvQpFrovzG4iCvUmxeVfiL5sf
 42fi4MsbujxLWr57Gaw8U2w=
X-Google-Smtp-Source: APXvYqykOW8DBg++MEZzLBMV1jVOWJRZFOWwgqriD5aTx1V21CwR+2x7Bg2km6Aa9r9ts2qbHE2J7g==
X-Received: by 2002:a1c:28d4:: with SMTP id
 o203mr15485931wmo.123.1577392631651; 
 Thu, 26 Dec 2019 12:37:11 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q3sm32911665wrn.33.2019.12.26.12.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 12:37:10 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, linux-amlogic@lists.infradead.org,
 jianxin.pan@amlogic.com
Subject: [RFC v1 0/2] dwmac-meson8b Ethernet RX delay configuration
Date: Thu, 26 Dec 2019 21:36:53 +0100
Message-Id: <20191226203655.4046170-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_123713_704825_7021FE09 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ethernet TX performance has been historically bad on Meson8b and
Meson8m2 SoCs because high packet loss was seen. I found out that this
was related (yet again) to the RGMII TX delay configuration.
In the process of discussing the big picture (and not just a single
patch) [0] with Andrew I discovered that the IP block behind the
dwmac-meson8b driver actually seems to support the configuration of the
RGMII RX delay (at least on the Meson8b SoC generation).

The goal of this series is to start the discussion around how to
implement the RGMII RX delay on this IP block. Additionally it seems
that the RX delay can also be applied for RMII PHYs?

@Jianxin: can you please add the Amlogic internal Ethernet team to this
discussion? My questions are documented in the patch description of
patch #2.

Dependencies: this series is based on my other series [1]
"net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs"


@David: please do NOT merge this series yet, it's only meant for
discussion in it's current state!


[0] https://patchwork.kernel.org/patch/11309891/
[1] https://patchwork.kernel.org/patch/11310669/


Martin Blumenstingl (2):
  net: stmmac: dwmac-meson8b: use FIELD_PREP instead of open-coding it
  net: stmmac: dwmac-meson8b: add support for the RX delay configuration

 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 60 ++++++++++---------
 1 file changed, 33 insertions(+), 27 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
