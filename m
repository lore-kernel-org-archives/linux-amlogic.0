Return-Path: <SRS0=pUon=SJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CE4C10F0E
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 20:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64418206C0
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 20:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0xgzkH8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIilBfck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64418206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXH43QA7NiuB77HyyGZVXoH6jk59Y2QxmiePfwXYRN4=; b=Z0xgzkH8lZahBx
	r5WFZwiUoMKQDNGIrqs+frORERO1JLEiE5cyGXq9YTsghAMMnR89vPWmeYUlnf1zelYoXufEr6gsI
	dI+eBN2KkmyHOfITu5crfdT8fiOeZycpdcQ/3/h3iAfJ0fM8T6bxWaonsoM6ulJ2QFwKbzafExi43
	qPUoQILuXNt6BbkcICm9tc8NEzLepOzC8CtcuxO8paeduuGwzc9sNqSgJnzj64ftuukNcqQaXeXEX
	y5etCYjEY2u6rVBvK5Bd3vzzSOTb5xRrdddDCkRvA96izYdvzIFIC9/iCMPVR+BMLzfil8S3vIJbQ
	dI1UoimHjtt4JnR4/CtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDEid-0007YW-GM; Sun, 07 Apr 2019 20:48:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDEia-0007Xb-1P; Sun, 07 Apr 2019 20:48:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id w10so13948863wrm.4;
 Sun, 07 Apr 2019 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ri1cr14M4G0qutMlKQ01RRuoGpeGpaxSObSnStKZmHo=;
 b=mIilBfckXPA0hGHAmv8eAmEn1dcJhg0yZlKSqDySntye0XBP3t/lLKSpLAAXp1IwP9
 zizhIK82uYLvWjNmRpOVtPrvgBytJcQR85Nl1NzBWb4uRqdV2QWOiN+frzw52rbQBB9g
 6MPbNzIvQGMUpbiL0Eb0uymvpMMaZTPGyIHleREOkjBLHhOiJLMRe2BXF+NCfsR+Z2H6
 nZpJceRJmdAMDrHH7tiRiXDNA5TmWEw/MxOjC+ygpHBnUa7nwz5Z5HEtLTOfJUEQeQaN
 InY9I37MPfwP8VClP8WNElM53UYAI3xp7MVv/zGWidq1g8lkk+17sY3lGtehgmqAbw0p
 NDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ri1cr14M4G0qutMlKQ01RRuoGpeGpaxSObSnStKZmHo=;
 b=gnMEDPp29DQmASOtflrWJ5tHknowNnMeqHQiGSgxdVK2aSTUBqhfq1JQzBT3LhMxWU
 C00RhLsYyH2RC2ZTHh+nbC06kyKlLWRZXPXet2uqNEqDx7NdZaVElbRT7r64yaz63mAW
 Ueg9T6q8WdpLvvAuzwsvwwZFVkzmVbzG302PyHq/d6gPz88BHV5g6MOauYSCyVSubCkA
 awe/Chl/hxBmme9Fm/tvG9d7Es1txSqAQFiesW+m5JVUFIMPvh33XcFeLGYKpCkuuNP/
 8qEHdNnepEGnFDIClogvEZZ3gva1kY/F/NAbE0tJ5EgBYmN90oJnBQmUiV6DDGmY4LoR
 hYTQ==
X-Gm-Message-State: APjAAAUpmbFCpP6j3Sql5Y6JR+tySAY+KWZqBair5ZvgRV8Ui7QAhQZG
 GD9tFUQ4IO9l2JLj4go3phH7tx7M
X-Google-Smtp-Source: APXvYqzA5bneIYSk+mLlS1vEAqEQNhKsuslVf6t5UChBwz2cY+xN/2SK4qspM9nFyL9QMDZw8GMXcA==
X-Received: by 2002:adf:df92:: with SMTP id z18mr7325851wrl.239.1554670121344; 
 Sun, 07 Apr 2019 13:48:41 -0700 (PDT)
Received: from ?IPv6:2003:ea:8be1:dd00:cd3d:7432:4830:ab0a?
 (p200300EA8BE1DD00CD3D74324830AB0A.dip0.t-ipconnect.de.
 [2003:ea:8be1:dd00:cd3d:7432:4830:ab0a])
 by smtp.googlemail.com with ESMTPSA id x14sm10221996wmj.3.2019.04.07.13.48.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Apr 2019 13:48:40 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 David Miller <davem@davemloft.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <53f5d96e-4594-7a32-792d-4837479da7f2@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ed1679cd-42b4-df7d-e72f-a734bee8d675@gmail.com>
Date: Sun, 7 Apr 2019 22:48:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <53f5d96e-4594-7a32-792d-4837479da7f2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_134844_106383_36627C1C 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07.04.2019 22:31, Florian Fainelli wrote:
> 
> 
> On 4/7/2019 2:57 AM, Heiner Kallweit wrote:
>> Recently genphy_read_abilities() has been added that dynamically detects
>> clause 22 PHY abilities. I *think* this detection should work with all
>> supported PHY's, at least for the ones with basic features sets, i.e.
>> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
>> features explicitly and rely on phylib feature detection.
>>
>> I don't have access to most of these PHY's, therefore I'd appreciate
>> regression testing.
> 
> The nice thing about the features is that we can right away tell which
> PHY entries are Fast Ethernet/Gigabit etc... so if you remove that
> assignment, we would need at least a standardized comment allowing us to
> quickly grep for that information.
> 
Yes, that gets lost. Well, in a lot (most?) of cases you still have it in
the name. But who needs this information what for? At runtime e.g. ethtool
tells what's supported. And for all PHY's w/o dedicated driver that are
using the genphy driver you don't know anyway.
For c45 PHY's this would become even more tricky as they can support much
more speeds.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
