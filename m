Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA04C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3KJFo1bDUGdfGNVLyffJVHcQG2ReFgiAhnk/uywK2c=; b=ccNvqu3dnaK33K
	IWxw4cUCTuqjEzi4LwO0CqDYQb8PNGlhgZPwh3cKcRYkxU1eckyZouJ5VjwpIKEGYofUl4O3OMp5Y
	f9PPYAI3BHFKD02r1iFNuv5r3PWaxJeDsn6XJfPI6uZjFtIL/IY+BCdsn5MIc/OYNza6sio23vdJ1
	qR3GmVkHFDXuHFAkzsltSnWV9S1rH6C6QTvi4BrhxL06vD+DaL2bEDH6gEwqT4gewzGRfpQiBKpqp
	daH7TTfs1o+0VPHKvnYp4S9IrbPFyguCAArfcZ3MWBgKJFrr2QNn9Gm5kyuQeKHQa9Tg/oAvgZ59b
	cSxGsXI/uv4pfArfEwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqPi-00000008tvP-2mAJ;
	Tue, 13 Feb 2024 10:53:22 +0000
Received: from wfout6-smtp.messagingengine.com ([64.147.123.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqPf-00000008tuy-1Se3;
	Tue, 13 Feb 2024 10:53:20 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id DE8C01C00087;
	Tue, 13 Feb 2024 05:53:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 13 Feb 2024 05:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707821593; x=1707907993; bh=6dv3XkVpsh
	WAdzS8Nc4Xo0CoQTmrm60p1TUc7YC2Dao=; b=hdWJrUS8Cd51e7g6sHyMhMiCxv
	IDWxmxNLFPEiqY+2GMkGyjR8B8XSgya46SGAtMuyBQ/eW2An26StdfkpA6wC8S6g
	LuJTGDhGXLsntq83AcJAOtuW98rfnCbKxncDN3QVgRbDxMvaPmCq57xQwVgR2I7H
	+UlLZ7ltgGP14MFBIcNnSK/dS7wb4+Fi72zXXwTBbOxaVaot+dbzoa4ScEVZGF3w
	gSxd5R5MMAG38ir1USb5rRVnvmlzFvdPU6idyu6sNe9GkY2HAl2MNhEmDSwnux4Q
	VmGCD7B9Ruxsgy8d4UdVCKlPPG6k0z3ndm78tVLasKcstligOWQlDT3eEbbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707821593; x=1707907993; bh=6dv3XkVpshWAdzS8Nc4Xo0CoQTmr
	m60p1TUc7YC2Dao=; b=G02pROHA+7jjMd7tHb5W9Mk1RHyKHtv+aGTn41ZLW0fH
	TeDGVYBX5dqUePSIxI0FC/zSx8psmAhZsU2w2xqEZpYNMKtCAqUppnDdcxNKd/Gq
	t7v7HDGf+wTfHKW1oIRp6dTsyFDFkIRBYLeHpQbB1dDWdAtwyFaa3Od+5wWJq/y4
	YHhUPnHwW4mbW4LM/+uL4x21bUnKQya075BRbFDcNy3bqfseqZn4J+EZ8HMwvQqe
	PUeKkR8Ve8iedu7wfp4NfaMD9/aiHMqWwUB8UdvLekkwgqMFJbu6IAnZOAIWOjYW
	Vw7e7GDFqI6KFb/+a/V/Ofa27HmNYxUzVwGh1D7xYA==
X-ME-Sender: <xms:F0rLZb_1q4NKRMH-XXweuv45E4i6FkWcds3C1qZ80Ws1TMhlCedt-w>
    <xme:F0rLZXtYCwVkCjihBn9E_icVc9UEUFEBcYTprGOvxx8x770weQ-EuImCYvFjUiE70
    vTv3049MW5pipRXSvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:F0rLZZCGF4p3x0Tli4MvIOHCz3GP44OMlMiAIBqdkgchzB1cmvLNvQ>
    <xmx:F0rLZXcXjSCXz4H84WVOn0iFRqU4fNWpZD2PIwaO0L4RzJF_UJ1o4g>
    <xmx:F0rLZQOsH68J5cLPZ8MzFdW_2JYHAoCTzJJ6bmTQV3gsg88zA7cFDA>
    <xmx:GUrLZRxiq9tjm-VczEMhcII7VaYv9BO8Xu8yf6vQZFSyb0aOzroxWDV57V4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6BDE7B6008D; Tue, 13 Feb 2024 05:53:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
In-Reply-To: <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 13 Feb 2024 11:52:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_025319_756329_DABB5B5A 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:

> This probably pre-dates the introduction of devm_clk_get_enabled()
> It would probably be better to use that instead of duplicating helper
> functions which do the same thing.

Ah, I had not thought of that interface either, so you are probably
right that this is the best way to do it.
Can you send a replacement patch then and add my Reported-by?

I also sent the same patch for drivers/nvmem/meson-efuse.c, which
I guess will also need the same treatment. I also checked and saw
that all three files already had this code in linux-6.0 when
devm_clk_get_enabled() got added.

> If for any reason it is not possible, a common helper in clk.h would
> preferable I think.

I can't think of anything that prevents us from using
devm_clk_get_enabled() here.

    Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
