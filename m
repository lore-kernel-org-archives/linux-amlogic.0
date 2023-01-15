Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA44DC3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKyt77ebMw/QSxx7KHMPpb/16r/YbAk8eHxCoZtDC+U=; b=WrWN4tMPt6Uh+T
	y+ZYed5FfOIyTKp5c3J6cDP4kIxpX4iDeBsyzrulC9uI93UwcoSpqubjg5PukRDLfkNmuP+S7G4eN
	wGd6/m1Pg/d5zIJPa85aKUzWk5x/cMHxLXG4LnvQpOTPf7+sa1DbhDlZP0CANfrq0igQ+SiQ21mGP
	GW6iQdyhTYNl58S6shRqRd7ldHzOccIp8enFshlW4QTxV6mJhLepoigY9C2eLasMX8wSoH0OFpAk/
	kLDC3txkOrl5S4apXkLaqZZqiFLs8Kj0QFpsR4xbEofnP276RWqo1D6d7p9BFuh8ZV98KDm8ZaPj/
	N95qeEVxQPWu0U0CXuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH6Vv-007iDr-VQ; Sun, 15 Jan 2023 17:09:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH6Vi-007iCQ-Me; Sun, 15 Jan 2023 17:09:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bs20so25438510wrb.3;
        Sun, 15 Jan 2023 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4GbAtoP62CKRZQ5YvzhQGV21nLCzrKZf6UMHAQ7R6c=;
        b=Qs0TzHwISeaa+WuDsKBjv50JXQ0sW2dd7xFzal9LKEP2JauK10Flyvnok32oDzL7eE
         EMAOjheyxs3J1B4yjrWrIjpNnyU9LE23jrKirfgpc5YP4Shs4ziYRL+gKFckJ+Tc+HtE
         x/Xz3d68nEBza5/h6JcxIBhaEVfVKqIodGC5OLY+Y9U7Zu+jkJX5T31RQtdxXnfGHjbZ
         ksS9jbmSSP1G9EKDLvJ3p0CxFgvST/a/ALE7YV1c2YZP0ftSI2EccL77Y6l3H019nJ//
         HKsseal/G97fdOhlV3BegoyW0KK7qjGjmD3262SmDtXKL5UYndU9nhR1bZn18CYrJEEo
         w2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4GbAtoP62CKRZQ5YvzhQGV21nLCzrKZf6UMHAQ7R6c=;
        b=Qrw2mtit5EaAwdQmDLTbCLT15SRRXE/xK7NTQo3okKn9r6VZrMD6Uia1EOd9WfINIr
         ghQana3H65C2O/3SQLODzSS6xjMOXI5lpx9ukXD6KqAf+ehcsMnSzc2ZusuCbgDPVhZ5
         emm/7MOt8pKGWlI54XFG0RuCR76UsIriq653oIrsRXBptG8OHBhN1sQirSFswP7rYxzh
         QkhUNBkurWOSlmUkTQxuUAUny+5xy4tmIGGUHZ/XZufutTUg3StmQv07exzP2kkQPnr8
         +lQVRQ7bPicvN0/oR6Hi1w/xtGQsh9S/y9xzYp88qW35vtIQ2ZMh51QZ2WMSE4tJncri
         dsnQ==
X-Gm-Message-State: AFqh2ko+kV3++rR4s9o+XfIzMOztv0Ovhp3uwKW9Zt6WkUDQBCFrnbWi
	2VfhOPFjoV5+ROvUQheyaNs=
X-Google-Smtp-Source: AMrXdXs7vx3SPHsW1PelQFTJn9+Sy2O6IpmYQHTlnDdC0LBH10nr5JVcbl4fGABESGPY8w+pE3omkw==
X-Received: by 2002:a05:6000:1e08:b0:2bb:6c04:4598 with SMTP id bj8-20020a0560001e0800b002bb6c044598mr23683323wrb.67.1673802568012;
        Sun, 15 Jan 2023 09:09:28 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id b16-20020adff910000000b002bdf8dd6a8bsm2172869wrr.80.2023.01.15.09.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 09:09:27 -0800 (PST)
Message-ID: <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
Date: Sun, 15 Jan 2023 18:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
In-Reply-To: <Y8Qwk5H8Yd7qiN0j@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_090934_790549_BBBEA79B 
X-CRM114-Status: GOOD (  16.98  )
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

On 15.01.2023 17:57, Andrew Lunn wrote:
> On Sun, Jan 15, 2023 at 04:19:37PM +0100, Heiner Kallweit wrote:
>> On my SC2-based system the genphy driver was used because the PHY
>> identifies as 0x01803300. It works normal with the meson g12a
>> driver after this change.
>> Switch to PHY_ID_MATCH_MODEL to cover the different sub-versions.
> 
> Hi Heiner
> 
> Are there any datasheets for these devices? Anything which documents
> the lower nibble really is a revision?
> 
> I'm just trying to avoid future problems where we find it is actually
> a different PHY, needs its own MATCH_EXACT entry, and then we find we
> break devices using 0x01803302 which we had no idea exists, but got
> covered by this change.
> 
The SC2 platform inherited a lot from G12A, therefore it's plausible
that it's the same PHY. Also the vendor driver for SC2 gives a hint
as it has the following compatible for the PHY:

compatible = "ethernet-phy-id0180.3301", "ethernet-phy-ieee802.3-c22";

But you're right, I can't say for sure as I don't have the datasheets.

> 	Andrew

Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
