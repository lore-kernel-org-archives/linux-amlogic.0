Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD139C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A635F20896
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CZ8zgfUo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WkPt5Yf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A635F20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRZW1f/5ceDhFijtHf5gxcst8XoQpONlA3t9/dIBRpQ=; b=CZ8zgfUo8ylCOB
	gM7SBF0s5iFdBbJ6z7Q9SKBCe8LtpQzx8OECX5pcZP9GjdTvInu6NJtZQXruoEuS19OfK+Sh+cP13
	AmMqRn7Resha/Tn4bhj18B4LgIMg556MZVRgpMOZtQMsilwuJUjXsc5TcuZ7x4FRH8IFW4DtpRJxw
	desOSQMdE2saY1S2PwXFl9QG+PQOzEH7buU+0OJ9shQKbey0SAWF92yB2WT1sZ24vNoAeOFGPuxg9
	/8oRB1gkXp3tfEq0aNVMSENshIT6/3cetayvC9qfN40NTtcAR3YGowuIe4RcNchSKKnbj+r7Z7az8
	1bJ/VA8FQiE2Q6iIN7kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbV4t-0007cR-1i; Thu, 13 Jun 2019 19:08:03 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbV4p-0007bY-J9
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 19:08:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id bh12so8542281plb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GMnghIl7eXWXzs6/0zMCrD5jkYbNpzmrrUy+d4e0iJU=;
 b=WkPt5Yf6Jc/jE8ojCnCJ4Kr86w57zSBU5UOq7t1FQ8y6mOmpr9OZZjVjAkg7c4VUpB
 hf+8g5lfbocX8ZWwRefESSQBv5voTSbCTb4JyTRfspIKqwrWNRuEPKOOpRDetar/W+7R
 YvCOKqUMOLTz4j612toG7PRYuH6C9xT07ToIKfFCi1yHZhOTy912m5P1K5kogRroJr01
 sGcgZRC71k0GrkKc9YL9SIzXRKFOyh4hD7yFjIZH66V6mTouR1d0FWJsl54/eECWeXfl
 jbxYps1d1NqT5d62EgLSZibs0JRdUDtnqGZgdeFoyI8bcSS4/c6spBJQ0WErIMXHkXae
 pCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GMnghIl7eXWXzs6/0zMCrD5jkYbNpzmrrUy+d4e0iJU=;
 b=r35xxmPw5Q2bxW1AzLyNx7h0Fp9UugU4Ql75KD+v72t9ABgPny5aMJ0gjPzNpRXF3O
 4DFjCqGqVNnXA519jevXCCEdl7bAS72ib7Ps5wyk/oxB/Sth7M1Hb528LAK/plhwLGz3
 2/z2zCxmeER3zLhgha/O3e6ht81xX+HSrOp2adXx8vm/8xibWh1f+72di4HQ/oC0N4U2
 lGGjGfloJvJGERez/+pBxb1CacqfQbeZBZ6QopDIXa/DSdfOaIunyCW9BS1fWy/kDpF7
 81VfWlfE3N4l8ymVTpERZ0Cy68J4MKDy2XRWGmYZWHm3ALzwBmxgctGtpsLwkWSA8/o1
 p1nw==
X-Gm-Message-State: APjAAAVjVSf8YyU7W5pf9dhCWpe/4ZfndjTcWV5d25JD4kyBKcVVUg2d
 YT/QTRqde4mOLitVrajxCeTcKA==
X-Google-Smtp-Source: APXvYqw9VdST2x6sbLH0VNcls856gB7kMteKDCmWa0BzccKnV9n2mkwqg0v1z57AORxB8mwtaA1o2w==
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr89422886plb.221.1560452878443; 
 Thu, 13 Jun 2019 12:07:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id w16sm500200pfj.85.2019.06.13.12.07.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 12:07:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
In-Reply-To: <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
 <20190612230201.3692F20896@mail.kernel.org>
 <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
Date: Thu, 13 Jun 2019 12:07:57 -0700
Message-ID: <7hlfy54836.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_120759_654722_9BD0B60E 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Wed, 2019-06-12 at 16:02 -0700, Stephen Boyd wrote:
>> Quoting Jerome Brunet (2019-06-11 05:23:33)
>> > Dear clock maintainers,
>> > 
>> > Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
>> > These are typos in recently added clocks, the most annoying one being in
>> > the DT binding identifier on the MPLL50M which is used by the network PLL.
>> > 
>> > Regards
>> > 
>> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>> > 
>> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>> > 
>> > are available in the Git repository at:
>> > 
>> >   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
>> > 
>> > for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>> > 
>> >   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>> > 
>> > ----------------------------------------------------------------
>> 
>> Thanks. Pulled into clk-next.
>> 
>
> Hi Stephen,
>
> This was actually meant for clk-fixes
> We could probably cope with next, but it would be preferable if the typo in the
> bindings was fixed by the 5.2 release.

Yes please.  That would help my dependency management also.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
