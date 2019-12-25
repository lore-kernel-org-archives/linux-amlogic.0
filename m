Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0747DC3F68F
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2631206D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uiz2Nj5H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aNXqgDez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2631206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cA7T5sUSPhsNqLzQgyE5RYpBzTsR6t0j5O+FIJrggNI=; b=Uiz2Nj5Hk3vd3L
	gyYzFBnSHnA+ufvMESVlQ/yodcKWiZVKoZQYTQWcdswiR9hWHjPZ8fWDuotyr8OYnNgtutkq8KQmu
	4qQ91m1oMPZfvDrlIso2KWDmIIMi+WZaZEZ0ESV6lbUAvlDatWMU/LUX5jyi+XVi5a8xrC6BRqn//
	g/5FsHWRH5jcqPFTi2QvXlcZsfmgdiSrzqKvW3hov1R+P3vRb0Yjari6w6pDUkWfEGW+qQh3jaYI9
	Q1sVCA2yPh66eSeRhEa5CX/zr0FBSA7p9Q5flXZFfQtkXIciuZULll4WBiCZyDSZMH23qH/fhFdDK
	bih9+6HGHn+PB3rQC5Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijuzu-0004x5-8i; Wed, 25 Dec 2019 00:57:58 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijuzr-0004vj-8d; Wed, 25 Dec 2019 00:57:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id p17so3529188wma.1;
 Tue, 24 Dec 2019 16:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VotzchowBWia33SBZNWvtqHuElucwAtYumoZTzGpWCQ=;
 b=aNXqgDezUiPP92OPEEgyn6ex0MJJ6tkJa1iQLQ3x7tPeF92q1JidZhcqqXoZq/cqIe
 hI33UVV6w97dO3Io4itkMlCA5gfJh3Cv5DjCYNlz0Fb5nUGZMkuN5wYA52KfiTqvISIU
 XeVzRKIDZMV33Qs9uzua+D3v4QYNQFOwOlWhRUWqGRGUnJTg/gD51DETHTr2P34cg77i
 8KgduyphFPuHG9G+ZMHQQ1pJJyTOlk+JzCQTFC2+mU1hc1TKLyaV2eCQGcVhQlcq2UUK
 lhNnaA040a2/80/4FSVcGuKrfqG+FW/GzMixMLDW5ccq2YA82/i6ttml9s/VY0qWjYfl
 mAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VotzchowBWia33SBZNWvtqHuElucwAtYumoZTzGpWCQ=;
 b=saGl2NIrlZx+cu+iabB/c/L7uXEytmT8o0gxxmg4dM0pwJvmr4V1YLxeQBx7dsT8Z+
 1MSzMiWDdqwO1rY2qZJeS9wmZkxp/O20fcF0xqU5oxm+PxtuFxmirVVksP9eRvEvMjTj
 1OCgDrL4fHcdJ2WVFoURmv7uuknbZpNfYNR3jJuJM4YFw/RlMRQAQOEtfxW9P4ukcx8g
 Wk0WI8v41Df8/xdCMs0OpkTsQoTOJ1j4wCcnJMEF0iaHeVOsjAWFFz2+K5wdfoe8lX7v
 930rKyx1FUYeali8qpUtWxGhnsTh8zKFj5hgfGTZsBl9UkZsc5k40rTzrb3M8Ee2EnEf
 K4Pw==
X-Gm-Message-State: APjAAAVI3zenLFNmwFAXhkNzCN6969f7Z4mJH6fQCzDVzehX34KvYqU0
 EsFkQpdiVyoRAMpGrB+2R5pBCqnp
X-Google-Smtp-Source: APXvYqxT1GuAR0B1XYM3pxm/0fTXXYbqGvbrMnzYbqu3FXAimku+BcOGTgmHUUv4jgJzrLt3vo/FbA==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr6444994wmg.110.1577235473304; 
 Tue, 24 Dec 2019 16:57:53 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id e18sm26034448wrw.70.2019.12.24.16.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 16:57:52 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 davem@davemloft.net, khilman@baylibre.com
Subject: [PATCH 0/3] Meson8b/8m2: Ethernet RGMII TX delay fixes
Date: Wed, 25 Dec 2019 01:56:52 +0100
Message-Id: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_165755_329794_6307EC43 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: linus.luessing@c0d3.blue, balbes-150@yandex.ru,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, ingrassia@epigenesys.com,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ethernet TX performance has been historically bad on Meson8b and
Meson8m2 SoCs because high packet loss was seen. Today I (presumably)
found out why this is: the input clock (which feeds the RGMII TX clock)
has to be at least 4 times 125MHz. With the fixed "divide by 2" in the
clock tree this means that m250_div needs to be at least 2.

Now the PRG_ETH0 register in Linux matches what u-boot and the vendor
3.10 kernel use. iperf3 output on my Odroid-C1 (where this series has
been tested):
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


@David: please only apply patch #1 from this series. I included the .dts
changes so others can test them together with the driver update (as the
.dts has to be updated to fully fix the TX packet loss - with the old TX
delay in the .dts there is still packet loss, even with a fixed driver).

I will ask Kevin to apply patches #2 and #3 through his linux-amlogic
tree - or resend them. When applying the .dts patches without the fix in
the driver then I get 100% packet loss on my Odroid-C1. So unfortunately
there's a hard dependency between patch 1 and 2/3.


Martin Blumenstingl (3):
  net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs
  ARM: dts: meson8b: odroidc1: use the same RGMII TX delay as u-boot
  ARM: dts: meson8m2: mxiii-plus: use the same RGMII TX delay as u-boot

 arch/arm/boot/dts/meson8b-odroidc1.dts             |  2 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts          |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 14 +++++++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
