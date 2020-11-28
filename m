Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5802BC63697
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 17:09:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94A7246CF
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 17:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbKzlgaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A94A7246CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iyxU10B9b2BufMH8dB0IJBMWfbVeuJ0tjp+LzvqbmMM=; b=qbKzlgaqdDUahL
	Y5j5FJIvJFs9/6SPtLd0uEaRcjjdpLl90voD5XsIHxnJFra+Jk4LuEwKDKIOtoBxu7Cra/oPo/rvN
	5zTTzC3wVkAOAB6F28FcKWNhhKFVhQ1eYnjJJxYr6jNmDAgE9G8AWz+04IZZKXyFQUozyV+QgiKox
	yjXgVNx7eEoS1ysfEyqzzRd/dgh4E76ffEDylL+Yg4DaKlZ6fYgEPN/uMibGI3UfeX/sCzzuZacgb
	bERO78MUMRYIGfu7ZdRBWpgO67DZY2UNBJMFQIEU74rhPvh8zdcj31SvtXWgDVj2o+7MJ5kMRhuh7
	/3zAGqC5vg3vIRuMizVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3j4-0006IQ-Tr; Sat, 28 Nov 2020 17:09:34 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3j1-0006Hd-E1
 for linux-amlogic@lists.infradead.org; Sat, 28 Nov 2020 17:09:33 +0000
Received: from odsus.home.arpa
 (dslb-002-205-253-229.002.205.pools.vodafone-ip.de [2.205.253.229])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id F050D1F4014B
 for <linux-amlogic@lists.infradead.org>; Sat, 28 Nov 2020 18:09:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id 8220D3D671;
 Sat, 28 Nov 2020 18:09:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxWWUFSDV9_f; Sat, 28 Nov 2020 18:09:21 +0100 (CET)
Received: from [192.168.20.240] (r64.home.arpa [192.168.20.240])
 by odsus.home.arpa (Postfix) with ESMTP id 4B8F83D66F;
 Sat, 28 Nov 2020 18:09:21 +0100 (CET)
To: linux-amlogic@lists.infradead.org
From: Otto Meier <gf435@gmx.net>
Subject: [BUG]odroid-c2 does not hotplug usb-devices
Message-ID: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
Date: Sat, 28 Nov 2020 18:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_120931_604458_D1AFDAF1 
X-CRM114-Status: UNSURE (   6.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

I run an Odroid-c2 with newest kernel 5.10.0-rc5
usb recognises usb devices only when they are plugged in before boot.
after boot plugged in devices get not recognized.

Any idea where to search for a fix?

Best regards
Otto


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
