Return-Path: <SRS0=10CR=R2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D653BC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 14:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A560920811
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2019 14:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szMtGf/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A560920811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zn9dCfIA/B0MBNwW+BP5zSHNxJI+t1xIE34aZplyHfM=; b=szMtGf/Ywe51sJ
	OuQTU1QgB2rwuaIaiEMb8c0Ia2NV6MGs92DuXIwyMutztig+1kY+tF34qdyo3oVNrLNlkllMyq4t4
	hsS5s/C3LeY4ZGNuVFRDf5iBKdCDAKh+9BMkJj10IjQ9OFpUNs+UpD6J06Pl2hNjfOQvzBFAWfiVd
	Ovpx39O7A3eRIqXYAlhBnqXxFtz93SnkkV8ylF+jscPr/zHv2ibB6n3Ihtg6SGVHO805YdzvF2CNu
	JF2sK86eDyRYRjRNEQjsQ5t8M8VYjyTdbNm0wG7/5CYDZC51DVhyQMg15HTF9Qgk1j2hhrSrDYCRs
	iQfGRa09VctLbxn1Xb6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7hPR-0007P2-OZ; Sat, 23 Mar 2019 14:14:05 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7hPP-0007Ny-1B
 for linux-amlogic@lists.infradead.org; Sat, 23 Mar 2019 14:14:04 +0000
Received: by mail-io1-f72.google.com with SMTP id z6so4150761ioh.16
 for <linux-amlogic@lists.infradead.org>; Sat, 23 Mar 2019 07:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=PsYFp35cFHs+5EpxQdqt4DnROaY5BNIXaA5kW14ZkHM=;
 b=o6UiuEXefSDfUn6ZYBjgNg10NDGIGTGd5yrkta1zcpkP4kWrpj1bc3rjPYQU/waOh1
 JiZB4yBgp8AyS/s5EGGZK0eg9auyyHc5DcHJrzEnGypOOhZsnTJ9Gt07YHrgRjigaLuM
 7WrKP05cSn0oBQxX799tUjp9IIDrMR3a+NZ1vddWjVTmpaKfT5xi7mZ/koU8CM9tEq7s
 s5XdaB134DVPHw9Kq6gI7brRtArR6BZV/vk34mlnMseU44OdBsz4d+dz/IvGR/651dO5
 ZlMdkPlErd8okeRtrRmUoMMMgaL5JzCmgjZS05RDsH6CxmukTEzZojkmqzA5kV3T5AUe
 BY7g==
X-Gm-Message-State: APjAAAXSh7kEFJZsXpcDfYLvFEQ4SpTjZsrGN3Ur9lG2Nar2LxYDR3fW
 R5DRHCanrUrPb57BcMJCzbmEbmGTrjS4k/DbVnqWtK2K4Eha
X-Google-Smtp-Source: APXvYqxrlhN7ZDSj5xzFZUOsZkR2w5UMagQnWSWyFsjEj1xFUpW9RSUHz2nSPn08J7oOQmE0yPfsE/xLggyWS6ZwEfvr/Ehy7Hk1
MIME-Version: 1.0
X-Received: by 2002:a02:8c2f:: with SMTP id l44mr10677090jak.46.1553350440469; 
 Sat, 23 Mar 2019 07:14:00 -0700 (PDT)
Date: Sat, 23 Mar 2019 07:14:00 -0700
In-Reply-To: <000000000000685dc805829e835c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003749360584c395ba@google.com>
Subject: Re: WARNING: bad unlock balance detected! (3)
From: syzbot <syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com>
To: davem@davemloft.net, devicetree@vger.kernel.org, jbrunet@baylibre.com, 
 khilman@baylibre.com, kuznet@ms2.inr.ac.ru, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org, 
 syzkaller-bugs@googlegroups.com, yoshfuji@linux-ipv6.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_071403_077708_78A66468 
X-CRM114-Status: UNSURE (   2.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

syzbot has bisected this bug to:

commit ec01fb69ac8034ad6e839b31f9df167a110f868b
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed Jan 16 17:59:47 2019 +0000

     arm64: dts: meson: s400: fix emmc maximum rate

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afb7cf200000
start commit:   065b6c4c Merge tag 'devicetree-for-5.1' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12afb7cf200000
console output: https://syzkaller.appspot.com/x/log.txt?x=14afb7cf200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4067c9a08ae046
dashboard link: https://syzkaller.appspot.com/bug?extid=f3e3434787332dfc1c47
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a10577200000

Reported-by: syzbot+f3e3434787332dfc1c47@syzkaller.appspotmail.com
Fixes: ec01fb69ac80 ("arm64: dts: meson: s400: fix emmc maximum rate")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
