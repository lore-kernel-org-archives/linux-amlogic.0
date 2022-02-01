Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400D0C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Feb 2022 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DxMSJnQBPShdBlId787oOZ3ZBZpna2Cb2RfDg+7Qs8=; b=qrcrsniar3jjVg
	jinmYrWaT7a0uZvKXuy7akhVTPXwwdWXrc+jqLszTOselIVOA7uNS8z5bUPf48G5QFBFHS88E0cul
	lB20a6sVpZcJq+Ez44haHBkVvdyRZrH7PjnkjEJILdZtfnXzGUbK/LjkjJtECY87gWMpNfv8F7f/9
	VPA4Ew2nLWiYdWXNm+6Xr5+MwkB2NX+1yYXwIGqB9hCwsONgCU0dO7iCUdKarCq4mIiosNkhRQr1X
	kS7M+IJcAh3HGwEofE57Hre9jbbqX74/e7lecOKKG7ztbG3O5BCuzABZG3AAD7Ohorn3BgHNLJEZn
	aA54czlnf0f6GwxvzJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEySd-00DTuA-Ob; Tue, 01 Feb 2022 19:05:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEyS7-00DTjU-MA
 for linux-amlogic@lists.infradead.org; Tue, 01 Feb 2022 19:04:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so3591669pjp.0
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Feb 2022 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wIaENBg/7AsUHJDq4OgnIPqvHUp4Vts4+P8qgAxYW1s=;
 b=Y95dzwDrfydpWDBxj30R2ZccMBa6llxL8kVA34F+lHigePxpWyJM1muhJRfbeXA5Go
 0eKhAoQ5DrDBUxYRj46MLXMjhW9WDqWO27hhkKB2VbeNmYWnn9cZlLdSJaeqyf6SxhGT
 /LlkOBZ5N4r4rO0KCSZBCZnVLl8x14f9/mLfR8Kn+8/6hUl2mDVGUxiftpPgUsXYB2j/
 oXkjyEfIeIZ1UFp4r2Sm5StQhyJCU0JqxolSVYYoTW8lHIMWUj0In0Uk5kzWAPPF8orv
 RKz8F8zPEtTNamxib0Pz+00rphknQEOZBAIQtn9LxZUEQH6vC14znFQ61HUsIKVnG0PO
 9bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wIaENBg/7AsUHJDq4OgnIPqvHUp4Vts4+P8qgAxYW1s=;
 b=JlOaLYh1iSMLE21Z4w6X7ozuqUEL6+yJb6ykOxfVGTc1XMtUI7LOYEZ+nutQKWLHEM
 Lp3boQ79Pdt5Fuf/dOAQuOq79bHJbZOBj599nmwq7LbVBFu45igXtAzACwMk90/q56Ir
 j5pTvKkHYSe1xKTwO6m4ihvv+RKJTKELEp53RXxWVDhFOxYHNNL1NQuM2EfrVGh0BwTM
 eXx+9kmMx8qG1tGoVM3O302YgXDR0JEkaIOcjkMEze9DTi2LlMhvUrByrC4AxAHLpie+
 YdQB17YlZpz3Dq3uPMvr1vwTwQtaEQ3UlAVb9n2TBiXKu8VPv+drFj87wspg+DJjOXC2
 +eZw==
X-Gm-Message-State: AOAM532sEut/Do7IXhgq6JnB/5bdwUKymFYKx3BxrzKqq9DM0IcB1wAg
 ndK/kfaaHrzhor98q2Jzmcsc9Q==
X-Google-Smtp-Source: ABdhPJygCi8b1yCmG8oqZZPB+iH/tseA+EFVP6QFMDH3+XAyTEM1OWhw4r4ydzfW6NVUYlCesgahMA==
X-Received: by 2002:a17:902:d2c3:: with SMTP id
 n3mr27222538plc.45.1643742270670; 
 Tue, 01 Feb 2022 11:04:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d32sm33229135pgb.46.2022.02.01.11.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:04:30 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add ATF BL32 reserved-memory
 regions
In-Reply-To: <20220126044954.19069-1-christianshewitt@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
Date: Tue, 01 Feb 2022 11:04:29 -0800
Message-ID: <7hr18m9znm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_110431_750864_54A45B89 
X-CRM114-Status: GOOD (  13.22  )
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

Christian Hewitt <christianshewitt@gmail.com> writes:

> This series supersedes [0] which fixed a long-running kernel panic issue
> seen with Beelink G12B devices booted from Amlogic vendor firmware. The
> same issue exists with a wider set of devices from GXBB to SM1, although
> it is not often seen due to my kernel fork including 'catch-all' patches
> for some time (the meson-gx patch was suggested by Matheusz in 2019) and
> many distros actively supporting Amlogic hardware consuming some or all
> of my regular patchset.
>
> I've also included a cleanup to the SEI510/SEI610 board files. If that's
> not desirable feel free to ignore that patch. I also dropped the fixes
> tagging as I'm not sure what original commits could be targetted. If you
> think fixes are good please provide some guidance and I'll be happy to
> send a revised series.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
