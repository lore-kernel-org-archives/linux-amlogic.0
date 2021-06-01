Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED08AC47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 10:01:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C2176136E
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 10:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C2176136E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=whitequark.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpsIwmDkx9Vi3U+wt80aax8GmuENOZ/REJ5EdYWExvk=; b=faooFtf0g0IIHuVbkXm1tPhAR1
	WIE87wM+92YUYrsT7tkSZ1dwSMKo8OfZlSMKNiM3WsM6NXSrB2nyY7NW0RFitZkiu4/27vsbQmJTS
	1DjitTlJOodAR3Eg8RpgVpz9TZs2bD5cMJfjKoEzBHMeyHL2LESV3x6vegSFSin1VsOgNnWPwZlPL
	Nk8kLuMEfr12GGm0/2ZClPWWJL1KZ3x4Tkge7FRJV0dczReJUrv0egBsGorjJvy9OQRdpIZL8qhX/
	BbDm1sZaCWtk1vSHasXykKlqBmJHoqbocEcj/t9thisk85aY8Mle0P04wSDBlWwXXmco4oSKBK0Ex
	vkDMAsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo1DS-00Fm41-J9; Tue, 01 Jun 2021 10:01:42 +0000
Received: from uruz.whitequark.org ([188.166.218.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo1DP-00Fm22-FG
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 10:01:41 +0000
Received: from mail.whitequark.org (localhost [127.0.0.1])
 by uruz.whitequark.org (Postfix) with ESMTP id 78CF2201D0;
 Tue,  1 Jun 2021 10:01:29 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 10:01:29 +0000
From: whitequark <whitequark@whitequark.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: #linux-amlogic irclog migration from Freenode to Libera.Chat
In-Reply-To: <cfac682d-13ad-d4fd-2bcb-678a1edc0d53@baylibre.com>
References: <cfac682d-13ad-d4fd-2bcb-678a1edc0d53@baylibre.com>
Message-ID: <cafa8ee990d84280216d6056613ae282@whitequark.org>
X-Sender: whitequark@whitequark.org
User-Agent: Roundcube Webmail/1.3.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_030139_743778_42412E71 
X-CRM114-Status: UNSURE (   5.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2021-06-01 08:14, Neil Armstrong wrote:
> Like plenty of other channels, we are moving to Libera.Chat for the
> #linux-amlogic which was logged from Freenode,
> If you could do the switch it would be awesome !

Done: https://libera.irclog.whitequark.org/linux-amlogic

-- 
whitequark

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
