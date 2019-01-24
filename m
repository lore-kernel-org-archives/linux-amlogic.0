Return-Path: <SRS0=E298=QA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229A4C282C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jan 2019 14:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E736221872
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jan 2019 14:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BdOFqcjH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3AYFbIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E736221872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QlQ9TPgnkWB5hdVwc0/4N1Rma9eOK37uHU3ozIRqtro=; b=BdO
	FqcjHNwuWFB/SiweWW8hy/wWpQuYHKnIrOnuPls0RldJiCV6b7DF5wTyL+P170fbpzXUsaNurvJ3N
	k9MrSDRRqzhHAchx4Iju0O1Eru7J2ivcj9cqMV4nwQdN3pEOy/nltRcMJE/lRjfLaLij7KrkSn18i
	FTliQ9vp8GbtdxDDfDUrHNs4Cx3txt8ahBq0eZXSxxM4w0zon7UKFuUjsj1dHAiaRGwru5/7DonrV
	TDptpwZJMWAkCu2OkpXvvrRWQxm5lt2aP4NE5DNZi8ZJDhjDwRIAm+f1vwkgEkC/rhr4ZZOBogQ4w
	4ed6sz+sCNFE9Fqhmq4R90PT4E+cUBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmftY-00061a-HJ; Thu, 24 Jan 2019 14:22:16 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmftU-00060W-Sz
 for linux-amlogic@lists.infradead.org; Thu, 24 Jan 2019 14:22:14 +0000
Received: by mail-it1-x143.google.com with SMTP id h193so4575434ita.5
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Jan 2019 06:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TzuGwlH/0Mzr/AQFH1v+FMxuAlr4J0f7x0FsIxp6yuA=;
 b=b3AYFbIrlVIhiqQd7R+jjQA4rcBFV233QrbG3B6huCP8t9FrtAlovtXCBxeJ1PkOF2
 ep5mempTggp3feqihyy472xNO9CcBF2gWm10yzhL5c0MX446seB1TMifZObY3Qj4R5Vl
 HZI7HCtG9ot4OLptBYMzGITBVfBf2diCsaY7QhgHJmFfqpGGd3dLx9aRq3i8MtLNhfE5
 ve0tOzeFqHTHsZAFaoRKXd/5QyahdyTPdmmkfT2oSjtAp0BGn/dgjT8bUCG7Vo1pqnAV
 DqrRAM5/2dexyxI8yWhy8mDaKA3vdHoFA8+x6ICx2cilJR/jEksTOCSYx0b4z8ZWuQMW
 Vi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TzuGwlH/0Mzr/AQFH1v+FMxuAlr4J0f7x0FsIxp6yuA=;
 b=EOmgFljw88h/q9Kgay4LNFtQbWFna5c5n9CoZiUojQ4lJ0nKB8IwvcDVDqWjIBiU2J
 slvSWmyI/yEYXS3YErdc3mQbqUOws7+Wvdy9ITztrn/nDaiDlMuRN3EoSplBF0Q1c/hU
 bRy4GuEp/2+fYOAdTbLd5OSwG/zpBbDwskjJKv3BspNBlbUOUi0LbFewvyiZtzEWL0Qe
 xz5JUQKArdcxq0V6MyVjREI30nsdYAAQhJQBb8vnoktekQ7QZpDSK3pljE1ylTWlAYre
 aeHZjcD+M6tVRpoi7KrKn6E/C53Lm+laCeOrmuyHPgk2yx/M9Q7HP1CpWohb7nSfVw+i
 YHng==
X-Gm-Message-State: AJcUukftWM93/LD7T18bc6/3VC0lrR3XTlZGghB1KCAICXOkFU4cGCdp
 ta26IHvpBQWBUlkKEkTtXukSouEnnltEyEyzTZuIi12Q
X-Google-Smtp-Source: ALg8bN48QoxqxN0hm5cU938eyMd0C+irIx6i8wOr5nKMS4jHre0krGYPT6U75VlAesP1YgNO32tLyzOLOXjlXZblWBM=
X-Received: by 2002:a24:9144:: with SMTP id i65mr1619084ite.115.1548339731247; 
 Thu, 24 Jan 2019 06:22:11 -0800 (PST)
MIME-Version: 1.0
From: Piero <ottuzzi@gmail.com>
Date: Thu, 24 Jan 2019 15:22:00 +0100
Message-ID: <CAPo5REEKkqctyS2+X8xjn8YgH93RrtAqBu4nELxzgSo0TCgeAQ@mail.gmail.com>
Subject: odroidc1 eth0 problem with 250HZ
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_062212_955382_E5CBA80B 
X-CRM114-Status: UNSURE (   4.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi,

    I tested armbian distribution on my odroid C1+ using kernel
4.19.17 and later.
I observed that with 250HZ kernel eth0 is non-functional giving the
following error:

[   14.853086] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   14.853367] meson8b-dwmac c9410000.ethernet eth0: device MAC
address b6:e8:26:b6:da:4a
[   14.853378] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
[   14.853386] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
Cannot attach to PHY (error: -19)
[   15.064433] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   15.084471] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
[   15.084486] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
Cannot attach to PHY (error: -19)
[   15.193033] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   15.225926] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
[   15.225958] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
Cannot attach to PHY (error: -19)
[   15.239227] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   15.293190] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
[   15.293213] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
Cannot attach to PHY (error: -19)
[   15.306038] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   15.352091] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
[   15.352111] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
Cannot attach to PHY (error: -19)
[   15.370056] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready

Only changing 250HZ to 100HZ is enough to fix this problem.
Some more details on armbian forum[1].
Can you check it please?
I can provide more logs and details if requested. If needed I can test fixes.

Thanks in advance
**Bye
Piero
[1]https://forum.armbian.com/topic/9138-odroid-c0c1c1-please-update-the-mainline-kernel-version/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
