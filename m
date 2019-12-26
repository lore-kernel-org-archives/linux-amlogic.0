Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D279C2D0DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B7F20828
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 18:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ETvms7TQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F/35XYsC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B7F20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MOhFF0O1tO/vnL81Dk7qlhURgmjEpsz+ZWCoMXWVQG8=; b=ETvms7TQZTa7jV
	6UIYXdTevhWgB7Q1hjBIf+96bYjofWAgZqgFz5FUlaq/+XpSDGgTrkABxcNut0TIHRz5FVHRWXl9o
	qI4eYVqBZKOIwQYuXC/k0v7PqIA8ru1EOvEUzwDWvE0Qr45tBJ80ANPt5NyV3kgnEWomLk8mrF7Vf
	Ug5kdKxoI4wcY17hykjtMar2RQ7AgLDWWUu9rPcDlk2o7qwvyOvUQT4Zi+8dTSsmFVrhySrJjI7FK
	DNVWsvgiLcWsqnXubfNlRNiQbkYPtFHlDfty42vmNuWz3KU8B5W+H+RgDINer4amXHZMEDbRjjpjc
	qp3tbaeY4FqVdj7ls7LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikYFM-0002M4-W4; Thu, 26 Dec 2019 18:52:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYFH-0002IH-Up; Thu, 26 Dec 2019 18:52:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id u2so6651561wmc.3;
 Thu, 26 Dec 2019 10:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ypv1P+w8u0b0xjjfk63+8/r3fcQQ50esgG/WxnES284=;
 b=F/35XYsCTf2aMj5zaXMWHKeSm3rrKNRco1feL0oBX2a3PYEiLiNAXf+YLSBNl5Xxlg
 orKHkmAhn5ACBZOz8ibgXQ18cgBNFtC1XwNvIT7Gr3H1SCjXScO0jOqAHKh1qUXXybvv
 xmPAcEhIgSXuAwALHZFy8OzlTezEQpwlqYOqGfvd5sglTbwFM/IXpk8yritCeSViRWbw
 m6yRCsaBiubozEzpqnmaxZUE9wuqBx1rrjxW8fD75pFWb45MeAYlFsJa0xk/WitRlMDd
 SlTU8M1IwGO0PJayZ8hPxsc7Cp5kfVsm4LNJup58YKp2g4c+jEf1Wd8nQ9rnZ/IujWa6
 kXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ypv1P+w8u0b0xjjfk63+8/r3fcQQ50esgG/WxnES284=;
 b=dLpdkudEfKDUlZCDBsudbmzgW63FUdrHBd6iW8s2rNJbWmXKHDZxWszOBFLW37ufjL
 i4s+ueAXQQvMSSwTjiCwrRZ7XviXDwVESoK3Le+lB4yKJuLYWiWkznyO8GNZ1B1Roo2y
 0DkRV9K510wIanOsTABpw1XyYXKzLo9apGpyFRH1dw+0Z3rtbKSLEvPc5hfnhuOPa851
 559HjyrNmFD/5KGjQQLUMKPA0bL2lRQy7YF6Jak+oQf3RhbfXKjHpMxDT6wE+8eonPvU
 IeN/S2hTiDB2QqXA4o6WPa+IUD+IF72jeZZqD1UKpOEyDlTPvid8+06C/Llu1aiUA5nP
 9qpg==
X-Gm-Message-State: APjAAAV/vXzo3B6DOZio8o/NjoC8U7fTQzmsqwCbCY+IRpZukPbqcAcF
 47FTMMFWsHAAVvLUT0OuW98=
X-Google-Smtp-Source: APXvYqwMKe4kUhbmqrhzGeJU3YnHO6wYl9UjKxkT1wrIQ6Yam19y77XrTS8FzO1pKIASH4l19LKEqQ==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr15914955wmm.1.1577386346270;
 Thu, 26 Dec 2019 10:52:26 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j12sm32129352wrt.55.2019.12.26.10.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 10:52:25 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] RTL8211F: RGMII RX/TX delay configuration improvements
Date: Thu, 26 Dec 2019 19:51:46 +0100
Message-Id: <20191226185148.3764251-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_105227_990700_92BA6079 
X-CRM114-Status: GOOD (  10.35  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In discussion with Andrew [0] we figured out that it would be best to
make the RX delay of the RTL8211F PHY configurable (just like the TX
delay is already configurable).

While here I took the opportunity to add some logging to the TX delay
configuration as well.

There is no public documentation for the RX and TX delay registers.
I received this information a while ago (and created this RfC patch
back then: [1]). Realtek gave me permission to take the information
from the datasheet extracts and phase them in my own words and publish
that (I am not allowed to publish the datasheet extracts).

I have tested these patches on two boards:
- Amlogic Meson8b Odroid-C1
- Amlogic GXM Khadas VIM2
Both still behave as before these changes (iperf3 speeds are the same
in both directions: RX and TX), which is expected because they are
currently using phy-mode = "rgmii" with the RX delay not being generated
by the PHY.


[0] https://patchwork.ozlabs.org/patch/1215313/
[1] https://patchwork.ozlabs.org/patch/843946/


Martin Blumenstingl (2):
  net: phy: realtek: add logging for the RGMII TX delay configuration
  net: phy: realtek: add support for configuring the RX delay on
    RTL8211F

 drivers/net/phy/realtek.c | 59 +++++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 8 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
