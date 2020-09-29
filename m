Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB830C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 20:19:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5792076B
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 20:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t6OUWUTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5792076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wva15582b/aZ2ls6HnBzyDHTDbpCH88X/81NiUPAITY=; b=t6OUWUTrcED05NU7lcYlC+TQ0
	ndpmI4y0hWDVCjWmqq0/Sv8QTjj6OWerkODNOP1B3zZQWsFyr4atV/ustpF4mwrLUvQfzh9ZGMFEO
	uS8sWr9p69mpG3Htj+xU1rOm4ae80NPaJfgSCqlV7fYp2/Cggxpr3povEzQcRUJ+lYAMaTAUcctEY
	f3wjTNv0mxOsAQbQTD6/dJwkCF7XoGNrVaW10Q7gxjrR2uEJ+JAcYeoLuT2RF8kbqGTHhEvzlpb7q
	CSxPhKkOktLPAmffHcSxKFeSwukDKpWPXgsvGJbSlDdw6J3Q8bWn43z4M/q2cYAlPYz+Pd8RuoOqC
	fHUjkmP0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNM6B-0005FA-Up; Tue, 29 Sep 2020 20:19:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNM6A-0005EE-04; Tue, 29 Sep 2020 20:19:43 +0000
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr
 [90.65.88.165]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D69641C000A;
 Tue, 29 Sep 2020 20:19:35 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Liu Shixin <liushixin2@huawei.com>
Subject: Re: [PATCH -next] rtc: meson: simplify the return expression of
 meson_vrtc_probe
Date: Tue, 29 Sep 2020 22:19:35 +0200
Message-Id: <160141075616.2802191.14464973075596319249.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919100856.1639319-1-liushixin2@huawei.com>
References: <20200919100856.1639319-1-liushixin2@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_161942_149396_AAC3C9EB 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 19 Sep 2020 18:08:56 +0800, Liu Shixin wrote:
> Simplify the return expression.

Applied, thanks!

[1/1] rtc: meson: simplify the return expression of meson_vrtc_probe
      commit: 9ce42e8e0323d39fad01f3d17c35dd16d91c4f46

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
