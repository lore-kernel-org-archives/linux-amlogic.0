Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EBBC47092
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E4E6611CA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E4E6611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPEIBAUi3rO0/rDWjh+Ys0IpkLXKZfCXhXiZGulruK0=; b=th1Dciu/fMxyU3
	JyCHs7XWy6khZu3OnEgcxQcq5gKlfNRQy8Od3wUB9a0mCMZVldFYstBuunJR4MvwMjhBhUXpnem8J
	WcnMwo9LhCskzrizs6CsOQ9PM2r1yfpSO5ejahTTYaTR42W+BoKcM66laH97/ntmAlQt+OZziY9Ri
	RVXMIpahl8t/tevqD+pTmYWvcBp5yvGBU0MGwKOHmzikb2FGIuPR6Bd7PHZt/QCwOapZ1q5rxUGi9
	QDLTlxk8dy9k43+iPQ8KpMShNd9+1tLbrPGMHTWOlw+rVWU6sjaqA2e62Ove5aiq9J0UYdPk0Geo0
	+351SbOPpcnlNckQn2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzeW-00FHXo-RC; Tue, 01 Jun 2021 08:21:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzeM-00FHWb-1j
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:21:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id n4so13302457wrw.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=wOGm2Hs8v3V7JpPxG035S8ZXZvziypiGVSbV54BlWCU=;
 b=a2H49BWC1xdlAOiB8V/Eynw9ntaTRtmRg4xCLkf/hYg++C0h8KTUZhWtf3OAH3pwEu
 s2Dlw+jTbKKmqzAVZeAbmBPxdtJ8mkDjo3m/s7w95hxMZHkm+RK+MNaGmi62WAWWjnCb
 NJW22jZI9mRu09j8X7Pnlx8iBYUrKnHB2hb5zZs6hPI+OPCZfurQbdMTR8Xf+reJTTTX
 BYNezzTAhwWw2b56qvBybZSAHhUgXo7MoCK2PA14rlzliO9nkoQxxbId4CCCtqh8vneI
 StljtPcHpuUm8tYQgzvEgYcB4d286+v3YH9gx4Np9oSWmD183w453DaJzInK52UXJeft
 NGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=wOGm2Hs8v3V7JpPxG035S8ZXZvziypiGVSbV54BlWCU=;
 b=qVVIqKP6LKr10GkPbgW/SHaBlZAB70v8SvlbVfULtXoeA4oxolOUpHy8fqpnb4jEwz
 6lcWeQwcP8T27qnnY5ATJLrpQ0pzunNt1s52Ed32ZafIvEF0sYZd34YAcqaV0loRr2KS
 siw5dAR1gclgzjsAAaq3gWq+uWzELFXQjizJsRiSr3zHpUaD3MkXcUemN78qYwWijfjl
 nMDw8BtHiFshraYUU3nKyBlkFCX6GlNdzc/CkbAgL3E5QgIXfyJbjLSfDCweTf0os6Q4
 NbaJJtIt89N2vt1Qw7azJ3sAnol0EPFO/xkxl7d/Mg6ElrmEsjwZ9H0GuppiKhAi980H
 5sbg==
X-Gm-Message-State: AOAM531TqfCLYSeUyGQ5x8SUVnRqGLZB+WnClUCkXe2ptDw+aDvoosP9
 PxFfYRtsIQZvc9erCcBkZvTf8/4hRfnLfNot
X-Google-Smtp-Source: ABdhPJzUfiojQAr38K/C+cqumSC/Sz1NkpJ4zwdLd3LjCQ7NvF7d0oe3+x6Fdk/AbKg51ovPegi5xA==
X-Received: by 2002:adf:9031:: with SMTP id h46mr5828901wrh.125.1622535678473; 
 Tue, 01 Jun 2021 01:21:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a3a:d001:6a80:207a?
 ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id s8sm2805973wrr.36.2021.06.01.01.21.17
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 01:21:18 -0700 (PDT)
To: linux-amlogic@lists.infradead.org
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: #linux-amlogic IRC channel moving to Libera.Chat
Organization: Baylibre
Message-ID: <d522cbb8-af11-a835-27f2-5c13fcaa4a4d@baylibre.com>
Date: Tue, 1 Jun 2021 10:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_012122_129614_9226AA63 
X-CRM114-Status: GOOD (  10.64  )
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

Hi All,

Following the backslash and hostile takover of hundreds of channels, we don't trust anymore Freenode to serve
our community #linux-amlogic IRC channel.

Since these events, most of the users connected on the channel moved to #linux-amlogic on the new Libera.Chat server,
and it seems to be the best decision to only keep the Libera.Chat channel.

The OFTC and Freenode channels will be kept registered but with the +m flags (moderated: only ops and voiced can speak) to guide people
to the Libera.Chat network with the proper information in the topic (Freenode topic will only have a link to the wiki to avoid another hostile takeover).

The whitequark irc logger will (hopefully) be moved shortly to this new Libera.Chat network, and hopefully this event will be behind us...

Neil
-- 
Neil Armstrong
Embedded Linux Software Engineer
BayLibre - At the Heart of Embedded Linux
www.baylibre.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
