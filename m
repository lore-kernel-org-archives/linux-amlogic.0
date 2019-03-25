Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C0CC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88EA20850
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ttz9Lxz9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ps/ltZex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88EA20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4qmjs+v9QDnBdFb9lJSlGITzfGbeIug3O/mxzhVePY=; b=Ttz9Lxz9eu9TNi
	TVWdyajDSgfQ0maEhzVaFzMHNuC9aoZLewyaikbcoerw5kL691CO8JbZqM5ijvtqueBAvwVHWwO98
	MP2hipo6NECBohRTmS+tLWhDD5g0QOQB7lzdVly+wT9g7mwr0N1MwLmXo8YXVnskO4HG2ADBl28vK
	yGfDg3flRQrqSrx9E8qlHXYguV7+pXQLg+knFuXG/5xjV13TO7vc04Fg/LrATcCK3o0sMzSiIfGDZ
	ba8SHJVPK6/gj/ud54cwiTDLMIN+9kcb5R2YlB8ttqLY6rMx9nNvS3ltGyBEWXlBmjV9o6pXtnFAz
	kAoAATsfnXkkMrUwtjXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8OC5-0006b5-D0; Mon, 25 Mar 2019 11:55:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8OBu-0005xA-AC
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:54:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id k17so1818667wrx.10
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=AdpgoZOF5+08hWqxT68WkSHPgRmLJx4JnkStnFQFVnc=;
 b=Ps/ltZexMWx9W4Vzm5hUCDd/3qbZzxJlDNgbh/X/Z56M9IAmpuwFDQWjO1sdOefkg7
 gJJvmA0iOY2UfR5NjW6tVOimw2SNO3/qsNJcI3oeTChndsqhfgJZUWZaaoofJkO19ZfE
 ImMlwlsQ/8+dwzUmOG3dSsIblhKsSgE6QUm5+VhfKc57z5uHOrvTdNq8plpmos9nRNNy
 K4f3Aom19+6cw9U09u9HQilqZ+eruFfN7nZHOu/1yBP0kSsBukpkKZK+/mtOBYjTXxnL
 pz+ZwZ8eVNTNgwnmKvu8noPoRXELGGEB9qs268ZgEnJQ+hvVbLcVOBOi6JlOG+/OtfV0
 SRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AdpgoZOF5+08hWqxT68WkSHPgRmLJx4JnkStnFQFVnc=;
 b=o2b3vjR340rVe0OtEOQFm8Zztr7VIz1dlmyULt5/A0/zoFJL1DOVLr60hd2ddol7Gu
 hYBodZnc/MdE3m5k/bfL/HkCvJMC7wSvf1cuw2R687YKlRdY2qKpYK/yIRWodwAwygMZ
 BwnmOqgehqJLJUoqQWejTRvS/2JjUHVrsf6H3wd1SP1uBJTj22hjD/KMPh7u4kHuYcaj
 GdKiNmzVJ157ps0kMn9651ohViHh8gW2KotJJXb3M/W2Gv/8XX+s+IDBE+zniBvef8V5
 PrW49gUDvQqfd1n99txAM57La5WdOfBiPmHIb/pgD6atN/AkLjvtGQgc/ZxPzbJnjVt9
 6hwA==
X-Gm-Message-State: APjAAAXj+ulymvue2jC3KPfp1KJBr8e60Ld5/naqO8w7lS9hPXZIxpvI
 CzMWcu7WanaVZ8LFSy1W1XZb9ydvvqw=
X-Google-Smtp-Source: APXvYqwkQLM4luYP8mb97pmXDQuShw3lZulQjA7xZHp1aET6ogZ9y9ujmPpKRPfKcum91FMJ7EQhoA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr16563721wro.2.1553514893493; 
 Mon, 25 Mar 2019 04:54:53 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 b3sm19513901wmj.15.2019.03.25.04.54.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 04:54:52 -0700 (PDT)
Message-ID: <e3d9d95fd07502cccf8ef97ba7b2e2adb4eefbb3.camel@baylibre.com>
Subject: Re: WARNING: bad unlock balance detected! (3)
From: Jerome Brunet <jbrunet@baylibre.com>
To: syzbot <syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com>, 
 davem@davemloft.net, devicetree@vger.kernel.org, khilman@baylibre.com, 
 kuznet@ms2.inr.ac.ru, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, 
 syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org
Date: Mon, 25 Mar 2019 12:54:49 +0100
In-Reply-To: <0000000000003749360584c395ba@google.com>
References: <0000000000003749360584c395ba@google.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_045458_352317_DABE9771 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-03-23 at 07:14 -0700, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit ec01fb69ac8034ad6e839b31f9df167a110f868b
> Author: Jerome Brunet <jbrunet@baylibre.com>
> Date:   Wed Jan 16 17:59:47 2019 +0000
> 
>      arm64: dts: meson: s400: fix emmc maximum rate
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afb7cf200000
> start commit:   065b6c4c Merge tag 'devicetree-for-5.1' of git://git.kerne..
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=12afb7cf200000
> console output: https://syzkaller.appspot.com/x/log.txt?x=14afb7cf200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4067c9a08ae046
> dashboard link: https://syzkaller.appspot.com/bug?extid=f3e3434787332dfc1c47
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a10577200000
> 
> Reported-by: syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com
> Fixes: ec01fb69ac80 ("arm64: dts: meson: s400: fix emmc maximum rate")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Hi David,

I'm not sure I understand what the problem reported is but I don't think a DT
patch could be the cause of a locking issue on x86.

If I missed something, feel free to let me know.

Cheers
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
