Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DDC4727C
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 23:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9E720838
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 23:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BFVzThcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9E720838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s6AIZmwkYT6XwsvcsWdkDXexC7d+voPBav65EdxnZIo=; b=BFVzThcF2iWEWgsRXKcgYwCFH
	ySsOn2Yd6SUJxwW9wZASnAW/aIxkYiQw8LV2pdr3MUvVa6XurB6IP5aBaDlPMcVuhQGfGssYLE54Q
	TqZiMTW2RekbWln6iK9RqT/7LObH5oiI5mkP67f/NVTYyf/Ker6eo2P4PwCYFTudKUh/Gg8CGHMlh
	gdn4645BcenwTjbaw2EKLNiCKLdY2zpFuT/gBGDym94lKGnEKocdVb6WXntAcpRf1ZqYGJT/QsFCh
	QPXL29MO67kqX8hlfEFCdGbLSoffSqsGcWm5mzBYvBb8AjKqPpmNovXE92RJuI+E3Z1vQ4xh2r6rK
	pNHzbBLqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLx6g-0005gt-JB; Fri, 25 Sep 2020 23:26:26 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLx6e-0005g6-Au; Fri, 25 Sep 2020 23:26:25 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E7B0413B9D46A;
 Fri, 25 Sep 2020 16:09:25 -0700 (PDT)
Date: Fri, 25 Sep 2020 16:26:12 -0700 (PDT)
Message-Id: <20200925.162612.1706734858463106489.davem@davemloft.net>
To: martin.blumenstingl@googlemail.com
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: add calibration registers
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200925215629.545233-1-martin.blumenstingl@googlemail.com>
References: <20200925215629.545233-1-martin.blumenstingl@googlemail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Fri, 25 Sep 2020 16:09:26 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_192624_592897_1124AA32 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 linux-amlogic@lists.infradead.org, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 23:56:29 +0200

> The Amlogic dwmac Ethernet IP glue has two registers:
> - PRG_ETH0 with various configuration bits
> - PRG_ETH1 with various calibration and information related bits
> 
> Add the register definitions with comments from different drivers in
> Amlogic's vendor u-boot and Linux.
> 
> The most important part is PRG_ETH1_AUTO_CALI_IDX_VAL which is needed on
> G12A (and later: G12B, SM1) with RGMII PHYs. Ethernet is only working up
> to 100Mbit/s speeds if u-boot does not initialize these bits correctly.
> On 1Gbit/s links no traffic is flowing (similar to when the RGMII delays
> are set incorrectly). The logic to write this register will be added
> later.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Please add these definitions alongside actual uses of them.

Thank you.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
