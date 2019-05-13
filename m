Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22629C04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 16:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF6421019
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 16:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FP+hAJYr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF6421019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61/a8n6gNeg2g29E+0KtJPF36nLbo4w8MX252SyOans=; b=FP+hAJYrW851vd
	r1aZ1hSkgw8ftcSriaxH2nBAakSlAi2bNG9HdyHfF7K7pAi3Xppkaa+d0C2EXlMr8ynhIjfIXS0Dz
	Wo0r+HOjsEN27Od/U4o14nW/4mgjleehHlJ9Kec4K1wRL+Cn1lzeojpzMJtm5TBOmxarQ0/VrxkZ6
	lI6Qx1Uq9FQBhzqj+k/NoEob4wINJM0ls2vpi413ApqWPHz18RIzH+rFUW1owoD3MFHUGZ8orj/mL
	UD0nIxiFHEho3iuUFTR7nuBwU2iqpXzt9/jIuHVhcd9fR852O6ZnBHDySLNmQ81gyKo6bl6ylmMbX
	yR7XrmJvL4lC/a0JHEYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQDZC-0008Hf-FQ; Mon, 13 May 2019 16:12:42 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQDZ8-0008Gw-7o
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 16:12:39 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 89B0514E226DB;
 Mon, 13 May 2019 09:12:37 -0700 (PDT)
Date: Mon, 13 May 2019 09:12:37 -0700 (PDT)
Message-Id: <20190513.091237.2207310474648188323.davem@davemloft.net>
To: jbrunet@baylibre.com
Subject: Re: [PATCH net] net: meson: fixup g12a glue ephy id
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190512211237.24571-1-jbrunet@baylibre.com>
References: <20190512211237.24571-1-jbrunet@baylibre.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 13 May 2019 09:12:37 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_091238_499978_EB1588C1 
X-CRM114-Status: UNSURE (   6.63  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 qi.duan@amlogic.com, linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Sun, 12 May 2019 23:12:37 +0200

> The phy id chosen by Amlogic is incorrectly set in the mdio mux and
> does not match the phy driver.
> 
> It was not detected before because DT forces the use the correct driver
> for the internal PHY.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Reported-by: Qi Duan <qi.duan@amlogic.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
