Return-Path: <SRS0=yXyy=WL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53742C41514
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288912173E
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/6DnFAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk1QYm3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288912173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Asn2NUOU2R8jHgLhx/NBfAi9C33n+gi3q9AhtzXuIX4=; b=o/6DnFAlhMwrT+
	65e4ikoA4IMRlHu9QxJKin7cvaUpWzk8lxgsVQmHQQ8X5fiDnRm+HDLdD+Od4blZ4Ihlo1KFLERLv
	48HCrfH4jkzUxnIYygNHsga8K5OaHa3AC25tb18cRnnmiBNNKuVghwSbq0OeF3bHRFuHRy7gizAOe
	KwhpAKmSUxKabm40CeQZjfnrAoWprR+Xkk+OnhvOcvqfJ4w95tgyQGAVLBjHm0Sf5JAvPlGIF66sh
	E5u4Eh4H/jAPEq/hKAe4aDZt3tSBHuMjdgRpEB7oj9TUm5mfZtvtbPe6ggC+XDn4SlrL9hxaRY2u8
	55C+0YYUIZ7mB93PccNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyEUZ-00025C-U5; Thu, 15 Aug 2019 12:04:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyEUX-00022H-3O
 for linux-amlogic@lists.infradead.org; Thu, 15 Aug 2019 12:04:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id v19so1057408wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Aug 2019 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=upg+bZO2tl76NuL5qRGzzUNcHidJHyMzxJdBLW1vxSA=;
 b=Lk1QYm3XO1TtrYnK82C1/2XHM6FgvEjRLBDA78xV8inQss+x3UpnkON9d1b0nrwZPD
 EvmnribxuwZyieoATcD5QzkZ9Ei8oat9lstQPRD8tBF+LTL0d0BZxUHJSJ1RJemQ5VNG
 vLhv9lGnP1UWtvUst2PLOUzBMFXGElWnIWqmA1TFkaHWdOEw9mrJRl+06JJ518+3nQRl
 9tJ9iIf2M637YJppuwb6YJuNdaOE4yQZ2RVz5jLOaTAahS2hBnM6+3pJQAH9flr0rKDk
 7np4leR9J5gPkGmCXj+dtSYOH+Toms002zCHqLI424gi1wSGY+cj74DWa16DP/+FcK79
 rtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upg+bZO2tl76NuL5qRGzzUNcHidJHyMzxJdBLW1vxSA=;
 b=nn+TTlLZp94AnKaKehzpeG5WdgTpEPgne8cBnLY1dwbqa9Hhuu3xhMcS2Cuud6msD/
 yNAL/yLTq9iPrZZsPAP6QvV17fytRziTbTOrVdFIJ84p/S/PFqkF2Iu1+1s3xKRpy+8q
 jy4VmTeCb+KpVLNd7Mws+Q3KXivyq1AwZsNtNPjGSjDW4qDm8pMV5bGBq/w7iFah8bFZ
 7tIHvs9OuotBRu6gWzwOkieAblzJMixCsnD1LLOYNj0toOmIUjVzfX5C2+TENTkUTNkv
 yXMZ1gPEuKgMmHx4ROHW+xoQ+KZOx7DJpNVKeWEvXkR7TeZZ41koB+73Gt10hJA09LKY
 Ex0A==
X-Gm-Message-State: APjAAAWdfSR05cpVL+fK6jsfH9zuabFGJAmns1VLm7OVvIA6XnmeLmKb
 MaoeT/gokCtbtl9AwPdryHDXQOjc
X-Google-Smtp-Source: APXvYqxDY3rncrRpFh7C8203dLkXoB1cu1beyAIHcrcOVnulG2BXBLacpK+xewCQya0hkBQnJeKQcQ==
X-Received: by 2002:a7b:c929:: with SMTP id h9mr2609218wml.1.1565870664648;
 Thu, 15 Aug 2019 05:04:24 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:b8fa:18d8:f880:513c?
 (p200300EA8F2F3200B8FA18D8F880513C.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:b8fa:18d8:f880:513c])
 by smtp.googlemail.com with ESMTPSA id v23sm1645106wmj.32.2019.08.15.05.04.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 05:04:24 -0700 (PDT)
Subject: [PATCH net-next 2/3] net: dsa: remove calls to genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
Message-ID: <8c34396e-fa3d-bf1f-8792-4056df64fc0f@gmail.com>
Date: Thu, 15 Aug 2019 14:03:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_050429_147367_89CB38D0 
X-CRM114-Status: GOOD (  11.13  )
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
In both cases calling genphy_config_init isn't needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/dsa/port.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/dsa/port.c b/net/dsa/port.c
index f071acf28..f75301456 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -538,10 +538,6 @@ static int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable)
 		return PTR_ERR(phydev);
 
 	if (enable) {
-		err = genphy_config_init(phydev);
-		if (err < 0)
-			goto err_put_dev;
-
 		err = genphy_resume(phydev);
 		if (err < 0)
 			goto err_put_dev;
@@ -589,7 +585,6 @@ static int dsa_port_fixed_link_register_of(struct dsa_port *dp)
 		mode = PHY_INTERFACE_MODE_NA;
 	phydev->interface = mode;
 
-	genphy_config_init(phydev);
 	genphy_read_status(phydev);
 
 	if (ds->ops->adjust_link)
-- 
2.22.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
