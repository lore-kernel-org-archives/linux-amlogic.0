Return-Path: <SRS0=QFoF=T5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C454BC072B1
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2019 00:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDA921019
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2019 00:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUdEeFch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDA921019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lj/bAYX0nUN4r/KKHU2Zs2DGxFJp4ECk6OXkKHuSXd4=; b=AUdEeFchci53eT
	oIuEmeUJ258FKG9tVVaLA7asNX+DsMWfiGE2Tem8PsS3VvU7TxbAP884FM3k3QGk43W41lm+BcZcR
	VuDgKvzNSTbMwayUHfKWf5v5Aq+fOPPuPL2aAa+a1209OuAEpDBcTWzn1PdxdwdF/OQ22q19g6aXs
	c1aPSgD0xuvR0Z+iEcWGIzYIAf4KWqC4fWi7FpP/zS8mgM0P5Pzd5+UCi8nV50UBCg5rS6iOX/Cbi
	ynTCENkePsf7JPI3yzU9Ksd70DRZjwWh2HNA9eiEiDyJTThi2tKSuhTUkSyForNyaZfQ3+oJ/GbuB
	zU7TWIJx5cMc07vcg7nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVmA5-0004QL-9a; Wed, 29 May 2019 00:09:45 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVmA1-0004Pz-Gb; Wed, 29 May 2019 00:09:42 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id E8D5513FB671F;
 Tue, 28 May 2019 17:09:35 -0700 (PDT)
Date: Tue, 28 May 2019 17:09:32 -0700 (PDT)
Message-Id: <20190528.170932.1841104373899073742.davem@davemloft.net>
To: narmstrong@baylibre.com
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-meson: update with
 SPDX Licence identifier
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190527134623.5673-1-narmstrong@baylibre.com>
References: <20190527134623.5673-1-narmstrong@baylibre.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 28 May 2019 17:09:36 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_170941_550375_44625A06 
X-CRM114-Status: UNSURE (   5.21  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 27 May 2019 15:46:21 +0200

> Update the SPDX Licence identifier for the Amlogic Meson6 and Meson8 dwmac
> glue drivers.

Series applied.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
