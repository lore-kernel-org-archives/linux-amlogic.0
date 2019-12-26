Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C896C2D0DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67B320828
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgCbMFZA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OG2vGorW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67B320828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ob4plV2R0d+enOudWFmbP3zv61uTDEBFAZeUJJ55Z0o=; b=dgCbMFZAJiVmDm
	8rmIqtWd42Uy8Lz7I3SYSzwK4lZeplYiwvVe+lrlH3dEzw3swarCF+/BOefYezWN/cG6CCEIg16mM
	qeYAVdw4wKzTVw77hXJf1riIiTkn0eJYH6LoQVVO1FKDrtFj8aPXMEGMOl9PlCk/U+ppmFKViA7g3
	wKayHP1ARYqNiRaKTafUWyaEJk3ZYFm0iMXqtUim64HebMRbgfUwrygJWEDeVGkzS1Opq6QNw5Yj4
	ntP26dOaBtv6es80JA0quyAAsAjlPOvu07XNUiV1wOdH4lH6sezl8V0kkEq4stFlQA3kzIiG/3CSv
	qkWkhgEpiNZpOlD0HLgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikYNs-0006Nn-7q; Thu, 26 Dec 2019 19:01:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYNn-0006MP-Hk; Thu, 26 Dec 2019 19:01:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id u2so6666215wmc.3;
 Thu, 26 Dec 2019 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ncp0cKjiqSNqZtUZj6kSVhT3fNnvKYgj+9vZwHCvLHU=;
 b=OG2vGorWxsVVWtHw8LcxkzPlVF8DTxDoodaUSMIy1WNJTNkvvSkZRVTN8+QAcO4TF+
 BeA84DgZvW64FGHilCuwScNiEckg8lvJjC1G4siYN5zQujILB1NMUkzwKGzEC3KGGlUZ
 Tkm578bVH9QmfnZYmUFbaErWmfWeqB1PK8jdwfkme/0Jldsdqi4XI3A1cVO52nwz6mD7
 EJ+izmSGSCbYVk9y9J4DcSuMczsoLYpsXPnf7WTcFeQ+r5pUpUeGQQHK8qHx9KjjOLXT
 dxYkeNK3g9ji0vmpZd2jeU9cI3WrTFSTtfFnbD7spBii7q20Hbe6/Cd8a4no2QihtKF+
 SHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ncp0cKjiqSNqZtUZj6kSVhT3fNnvKYgj+9vZwHCvLHU=;
 b=QEB364iR6GUYx1RhSKGoppBfNEl1p2hhSfV8ZcavbDaUN8rgHkY1lbCYpkoHnXrnhF
 fcDVNkJ2xz/d4pSBU9y6gRHnv4zUJK/X3A1h+6KVpuVTJslqEFQY6PQcXMvPhd7Vfjk3
 0d0TtbbS1C/5xsMrZstQn8hIdg+cMNjn2sht3jSdNws7HeqcxWi3u9df6P70GWxHl37z
 JGk4c8mjk491WUBORQXmqz/Pj9TBYtrxiC/r138ygDWoSnpG2E5i7ND3AqXtL6TMXypJ
 TBOluU4bYv0Gk33w6j5bmd/34IjOQVfcPnadHL44FMGr5FQORS0kisPOSweqdnEJdLC0
 TO/g==
X-Gm-Message-State: APjAAAVH09ViY82Yht+TIa//b6z1uQI78EeZTaqyWRzt09ft+tVQFm/n
 BYGdyPInq5NtVJt041p0O9Y=
X-Google-Smtp-Source: APXvYqwyHmDN753nFzJKANB8LWnP8tdzNpfU5bel2yfMTlsatjTbMVaemA+4OF1AHv2hPmAbPF+juQ==
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr16253154wmh.104.1577386873950; 
 Thu, 26 Dec 2019 11:01:13 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u18sm31777854wrt.26.2019.12.26.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 11:01:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/1] dwmac-meson8b: Ethernet RGMII TX delay fix
Date: Thu, 26 Dec 2019 20:01:00 +0100
Message-Id: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_110115_610877_C0E76073 
X-CRM114-Status: UNSURE (   9.46  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ethernet TX performance has been historically bad on Meson8b and
Meson8m2 SoCs because high packet loss was seen. Today I (presumably)
found out why this is: the input clock (which feeds the RGMII TX clock)
has to be at least 4 times 125MHz. With the fixed "divide by 2" in the
clock tree this means that m250_div needs to be at least 2.

With this patch and a 2ns TX delay generated by either the MAC *or* the
PHY this results in improved Ethernet TX performance and no packet loss
anymore:
# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  5] local 192.168.1.163 port 42636 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   105 MBytes   878 Mbits/sec    0    609 KBytes       
[  5]   1.00-2.00   sec   106 MBytes   885 Mbits/sec    0    683 KBytes       
[  5]   2.00-3.09   sec  73.7 MBytes   570 Mbits/sec    0    683 KBytes       
[  5]   3.09-4.00   sec  81.9 MBytes   754 Mbits/sec    0    795 KBytes       
[  5]   4.00-5.00   sec   104 MBytes   869 Mbits/sec    0    877 KBytes       
[  5]   5.00-6.00   sec   105 MBytes   878 Mbits/sec    0    877 KBytes       
[  5]   6.00-7.00   sec  68.0 MBytes   571 Mbits/sec    0    877 KBytes       
[  5]   7.00-8.00   sec  80.7 MBytes   676 Mbits/sec    0    877 KBytes       
[  5]   8.00-9.01   sec   102 MBytes   853 Mbits/sec    0    877 KBytes       
[  5]   9.01-10.00  sec   101 MBytes   859 Mbits/sec    0    877 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   927 MBytes   778 Mbits/sec    0             sender
[  5]   0.00-10.01  sec   927 MBytes   777 Mbits/sec                  receiver


The .dts of these boards are still using an incorrect TX delay of 4ns.
This will be fixed in follow-up patches when it's clear whether the MAC
really generates an RX delay and how this can be configured.


Changes since v1 [0]:
- update cover-letter title
- dropped the .dts patches after discussion with Andrew in [1]
- slightly reworded the patch description of patch #1 to indicate that
  the goal is to fix the TX delay generated by the MAC, without
  suggesting that it's recommended to let the MAC actually generate it.


[0] https://patchwork.kernel.org/cover/11309887/
[1] https://patchwork.kernel.org/patch/11309891/


Martin Blumenstingl (1):
  net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
