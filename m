Return-Path: <SRS0=6t6z=WM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DA0C3A59D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:32:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60905206C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sp+p2HLo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byDNfTIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60905206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Asn2NUOU2R8jHgLhx/NBfAi9C33n+gi3q9AhtzXuIX4=; b=sp+p2HLo3H+0GA
	tk5mT67VgB9oFXKTDOEqYmBrkBVQ7DePvD1k3439nCpC5xy94zJ1Ze5V4uETKYqjK4fSbftmeRgr6
	/2mJN3RUB1+kPm8tsOUGDJ8qI/akdNbDrgOsz/Kk4w+z4RxrMYX2eT+s95+qW2CrV5iAMjfSZct9b
	S7BHzzgHU0y9blyO7u/41eoWABU4rXwWPNkNBSFiQ5nalaF0A9W+Ho3LRtpuN8Y32i15n+o/wsb71
	Heq+Y8HDWlHydC/xxVFcQKXrYFmJ0au6jtQKEL6cseFCxyisGY+4skEMMvsqBJMHQyrfplsk2mb6Q
	w84jE8375sOsQPBzgKwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyitt-00013q-Dw; Fri, 16 Aug 2019 20:32:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyitq-00012u-Ct
 for linux-amlogic@lists.infradead.org; Fri, 16 Aug 2019 20:32:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id g17so2689120wrr.5
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2019 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=upg+bZO2tl76NuL5qRGzzUNcHidJHyMzxJdBLW1vxSA=;
 b=byDNfTIYBSJyv/QXUlb+z8Zt+wxNx1j+e1wWOziiixFQ5HLHeRP9whf8GNPBKrTzX4
 E4DuESKwYMaCJi5/kqC9eKeRadLazx9rA5/bvpTvwa/0u/vt+fnh/gzO5kwZIAe/UUys
 u6sTnF7H9Twsh9hNIx9Oa7pQqK+R19bVhoN+sZpUQI3wu4EBB1SeyTgoJnJfmpRcy81j
 ka70nBUUtHWwfrvppM5iKzk+difTmgPz6V/sFwGUT5izlj7KYIm/q3oa9Wwg5wtNosHC
 i1Nj5CSSgn5fiE5WxxoYaYcvchjF7v0Sf5hf+nfmx7AhU2xmDfo+UTexEaHcv6x7Ym/I
 IoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upg+bZO2tl76NuL5qRGzzUNcHidJHyMzxJdBLW1vxSA=;
 b=aGNjt4ssDDDSVof1DIQv8hudItnLZ5TVCGy6Iz2Lk5lxpjKAhj3tZeTFWsueGJzq69
 8aLq7tdSE/9NCg1aaxoAPAouvkCPdZq+xwwCaoJLDtuGubcY0wjiwKtwRDVHQPM2bG6L
 XR/UuLi9+MRw+lEoH9jhXpefRr0lSK2WdX+LQ3Bl0/1MQBCPws3ojcySmqc7kUPQKgEn
 x6bZpwdHPH7cqnGBMvjEXAH3kF+USxK9Aw/J+StXZBIoKNpkpoh99v/oRtM+Mns4Hi9X
 dHk4dV2/66xIsKnsUzkg+8ZQdZ1FWRl2W1pETEh1wj/3DWQge2yNBX/NVB1gTyn16zKE
 kD0g==
X-Gm-Message-State: APjAAAX/Pzswa404fRUDU8aDYfmdYSSHz731hWe1qR0DcpGdwiDIV9Tv
 kq55+jrvWEExdHgU98I6ROv9Jijb
X-Google-Smtp-Source: APXvYqybJyUoMp4mWW8bmZbY5bspM2sqepJoluxCLyTUXUpJVZFzc0hK+2bY3N0mqXi3f5lcafCplA==
X-Received: by 2002:adf:8043:: with SMTP id 61mr13025994wrk.115.1565987556561; 
 Fri, 16 Aug 2019 13:32:36 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:4112:e131:7f21:ec09?
 (p200300EA8F2F32004112E1317F21EC09.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:4112:e131:7f21:ec09])
 by smtp.googlemail.com with ESMTPSA id s19sm5034956wrb.94.2019.08.16.13.32.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 13:32:36 -0700 (PDT)
Subject: [PATCH net-next v2 2/3] net: dsa: remove calls to genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <62de47ba-0624-28c0-56a1-e2fc39a36061@gmail.com>
Message-ID: <13a9fa50-4e7d-4cb5-8c2c-0754d8a96542@gmail.com>
Date: Fri, 16 Aug 2019 22:31:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62de47ba-0624-28c0-56a1-e2fc39a36061@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_133238_434932_A655C7EA 
X-CRM114-Status: GOOD (  10.28  )
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
