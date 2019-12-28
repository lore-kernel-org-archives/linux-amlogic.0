Return-Path: <SRS0=KhJ2=2S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC56DC2D0C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 00:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9016120828
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 00:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mtVC7Gdj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9016120828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/M+aeXv68T/YVbna7xO7QVPsZVmF1tgIhLjhyEHMxQ=; b=mtVC7GdjDzaCDz
	oAkWtUWoATAGrRJrV8dIIr0Q4El8nqr5j2uJJJwBpZOJ/d+mj3P6WvizjnjctBvMa46XRGyn1bTbl
	orgVt3HTN7zyyn6BXx7t8a7Ry7S9m7uRgwYvQ4ecwO7OcsPLg1GdH3zxzarOU/vCgynFBM2ykD1kU
	4BzP5cNmVCZRcZ4RBjK6uNMEHY1DMTfiAKqcvV1fuMqMKq51veyu5f12FAqhwcogtPA1JmdAYGiIk
	e87VjwMb8jXCRlU3VDqhnv3hVuxkMpRqg4sINMrl4on7nBYWXl4d+a1/44K/KOpR6QH6u3xdl4met
	44cUXTsPTDNA9p63Ir/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il03K-0000ED-0m; Sat, 28 Dec 2019 00:33:58 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il03I-0000Dk-5h; Sat, 28 Dec 2019 00:33:57 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 39CAE154D1158;
 Fri, 27 Dec 2019 16:33:49 -0800 (PST)
Date: Fri, 27 Dec 2019 16:33:48 -0800 (PST)
Message-Id: <20191227.163348.1668601477335834984.davem@davemloft.net>
To: martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 0/3] Meson8b/8m2: Ethernet RGMII TX delay fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 27 Dec 2019 16:33:49 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_163356_212691_62B604B9 
X-CRM114-Status: UNSURE (   5.76  )
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
Cc: linus.luessing@c0d3.blue, balbes-150@yandex.ru, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, ingrassia@epigenesys.com, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Dec 2019 01:56:52 +0100

> The Ethernet TX performance has been historically bad on Meson8b and
> Meson8m2 SoCs because high packet loss was seen. Today I (presumably)
> found out why this is: the input clock (which feeds the RGMII TX clock)
> has to be at least 4 times 125MHz. With the fixed "divide by 2" in the
> clock tree this means that m250_div needs to be at least 2.
 ...

It looks there needs to be more discussion on this series, please respin
once the discussions are resolved.

Thank you.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
