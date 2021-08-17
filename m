Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDC9C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 10:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CE2660F35
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 10:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CE2660F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/5t8O62qEP31t1ifwLTbLMTpUTFPQyoF+F8o+0hq38=; b=wn/YcEeL+Y/twD
	C/GCBrw3HoaN6YJRl6OINmW1oOCIraJrNURBOUXb6yKa8I+CxaTK2m/P3Q/THWGY5iaFLYRJ3JH2M
	PJv1JkHGgwD+f2SRGj704KGcoFpMc4O9o231Gw+C/f2DUkztFyFNWR0NOzsupWMR1aW2vlrm2J8wc
	LzMPSf4ZJhgU/VjucD1cYPhRnQw2c6hPyzUO1cwFCi2g02y+5z/mGnymeQGigzhIdaUtTDu8VIMcY
	n5NZ6y3h0bQBnr3Je8GrK6m7C8XWby1PvNNSESa9NxA3tqMrPhFzXx/6kg+knXTwV/pGud97Sa+SQ
	OHhLu8Qhj4eidXrHN1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwN2-0028Az-M8; Tue, 17 Aug 2021 10:31:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwMz-0028AJ-Ji; Tue, 17 Aug 2021 10:30:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA027600CC;
 Tue, 17 Aug 2021 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629196257;
 bh=BxxNEfEkon7WthJuxGlsYjRnS9m+9ksjcTGePwqMEgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuVPytyt0SZu3yHNad9pEQrINoIXaagtLFgVrlJwGS1mZxrBVnZNxLLrwNiQkKEn0
 4yoymzhT7NhUfeiq4ERTqojSUIfXjxSmS++U/ykel11QHLIYyvWgDZJs7yXmGcgg0c
 EMQyZ8nc5UWo3c67PlkKAe9cnw0RZTKyuJf5naGm95JKCg2eFej1C7TrGfMvwjB+At
 PW84oV393djGxTMWgFJMjQi5K5S/smp0F92ZR+W7j/fg4tPsWNYOvaV1wHZgYuiRbU
 WKEC+a7kmjkb2Q1btZ2cP0CRzwTYOC7kdr1M0YCRxfUTkshQET7lEY60ivJc/vT0f0
 Q0ZWZhkQX5jLw==
Date: Tue, 17 Aug 2021 16:00:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: Re: [PATCHv3 5/6] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode
Message-ID: <YRuP3D6EMlaKJOx7@matsya>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-6-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817041548.1276-6-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_033057_702431_6CD405A7 
X-CRM114-Status: UNSURE (   4.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 17-08-21, 09:45, Anand Moon wrote:
> Power off the PHY by putting it into reset mode.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
