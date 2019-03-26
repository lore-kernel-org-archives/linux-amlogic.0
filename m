Return-Path: <SRS0=zyCZ=R5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B16AC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 08:30:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F2242084B
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 08:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NcYvb8Dj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CB6mIR8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F2242084B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tww/71jTo5WVkILcbpbqq5HtGzkbYsu2QctnB8PkyLs=; b=NcYvb8DjbQyN40
	1cjwwNH0Pzt3A9TMLSv3QKjySKBPpDjxj8Y1Cnq8indWn0IPp3Xpm2KGC8z9ZmR1ZZeWE6+H3U4hx
	ln1aY/ctP3NKHFpjBJIj3g+5rDwZr4WF8NOnmFdyB/kiQSLgDoRKD0QPO2JGz3PPTWux1oNeTOZTM
	H4SfVz91moyqh6dNVGO3EweaGEUinwVUZxxzTtrUrF0BOneRB0U8Zk0sBExLE97UqJIJwPh3w8EPZ
	5PRBCmAfLkTalFFeWRS2FM6PlEmjcUDytSD4Y23lQf4Gueo5yLhb7zSrfoHLoe72S8KzeOG3XNjVB
	4ZIyurDX4/+3zybL6jQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8hTq-0007k8-9t; Tue, 26 Mar 2019 08:30:46 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8hTi-0007f4-4C
 for linux-amlogic@lists.infradead.org; Tue, 26 Mar 2019 08:30:39 +0000
Received: by mail-io1-xd41.google.com with SMTP id f6so10024518iop.3
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Mar 2019 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u96/XQWaO743CQx0zQrII7tRo50afqDt59PdQotFCIA=;
 b=CB6mIR8YphRDYR2hBlUkNjK3fCHHG7rBfksisjzvUSwOf8gwtQIoG51aiGBThXiWU7
 R+wFGVbUNbfKBXHBYLPLk02QgktT0mlOwrsX9hSD1R4nNIgBU23eJKMQZV167cDK0BWK
 LKFKpY1F7j6EpRKYl4wV2SouwGPvPncbmFhTyh7iAxSK+cT+CG+euh8O2mQsiTFdeunT
 zoE2xXNn8Ev/Xo8DtlPHRgzx/xFNaYfROnJY56D1hGJWi9vrB1UN3eg+2Nfet+4o/p1L
 Yf+rFVwwbnKYnQ8XBGfFewlA9cU7e0XO2+YVSzITf6MlO5Y5L2hPYSSW0EPAyf8VJFKA
 4c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u96/XQWaO743CQx0zQrII7tRo50afqDt59PdQotFCIA=;
 b=TCXYsTotzBx8Z9elxfS+75RSF8IFyiBYk24piEM9QbJTXp+1RsAj1mBzRvxseKxGOs
 NyXG7xjZexmnEWqyoCjRxymGYwfFAGe/0miwTvhtrmdqdCAMGj+rbW5ywNPSdd0wGk5z
 zR8JzDNc7WkZ3Ye36aJC9oqXIiJwpVAY3CDVmPsuSDOKIgTMiKs/2AxJx1EtX/I8DGjZ
 Av0OMTtLtgjYbj2SycMQymy4WJ5+jBe2BZ82X5gNWuDhdl0g/p8SJsA0d81TTEjronac
 9S+oy6wo34vzH0GniHnSEske0nvlHzWc/D4+P76VCNzf7jSRTF8zHG8ZcWkPo8TCAQAh
 X/pA==
X-Gm-Message-State: APjAAAWf0QAsVdXdr6PzaaWRF42Aqy+09UFIkjhagsevw5vq24UM8Xa/
 r7uD2JX0nXV2q5f0V1YwK/A2LhsWibOX0YhEi5431w==
X-Google-Smtp-Source: APXvYqyakt+XhEnLW8Dz1cBNdjuL8IrEMJDOAgPgsXzO2R9f19orCOVA+KtCuSot+00YXPHZnHoOMWrDDvZlVQMydgw=
X-Received: by 2002:a5d:9457:: with SMTP id x23mr3564593ior.271.1553589029810; 
 Tue, 26 Mar 2019 01:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000003749360584c395ba@google.com>
 <e3d9d95fd07502cccf8ef97ba7b2e2adb4eefbb3.camel@baylibre.com>
In-Reply-To: <e3d9d95fd07502cccf8ef97ba7b2e2adb4eefbb3.camel@baylibre.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 26 Mar 2019 09:30:18 +0100
Message-ID: <CACT4Y+ZWY973sS7645uo8gNsU+wOddutZttXzYc9DjvqfPjqgA@mail.gmail.com>
Subject: Re: WARNING: bad unlock balance detected! (3)
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_013038_170026_3F92CF4D 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Kevin Hilman <khilman@baylibre.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, robh+dt@kernel.org,
 netdev <netdev@vger.kernel.org>,
 syzbot <syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 12:54 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2019-03-23 at 07:14 -0700, syzbot wrote:
> > syzbot has bisected this bug to:
> >
> > commit ec01fb69ac8034ad6e839b31f9df167a110f868b
> > Author: Jerome Brunet <jbrunet@baylibre.com>
> > Date:   Wed Jan 16 17:59:47 2019 +0000
> >
> >      arm64: dts: meson: s400: fix emmc maximum rate
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afb7cf200000
> > start commit:   065b6c4c Merge tag 'devicetree-for-5.1' of git://git.kerne..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=12afb7cf200000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14afb7cf200000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4067c9a08ae046
> > dashboard link: https://syzkaller.appspot.com/bug?extid=f3e3434787332dfc1c47
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a10577200000
> >
> > Reported-by: syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com
> > Fixes: ec01fb69ac80 ("arm64: dts: meson: s400: fix emmc maximum rate")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> Hi David,
>
> I'm not sure I understand what the problem reported is but I don't think a DT
> patch could be the cause of a locking issue on x86.
>
> If I missed something, feel free to let me know.

Hi Jerome,

I think you are right. It seems that other unrelated kernel bugs have
diverged bisection into the wrong direction.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
