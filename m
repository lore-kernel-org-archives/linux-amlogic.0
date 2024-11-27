Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F5D6D23D
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2024 21:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RhOGUh1x4NvUB8haAAD1jGK+wSAeESRjn0fNRyOEgRQ=; b=vb9sIxzw8gHcUp4HziHEtdtgjI
	qsms8msy7MpziVAiTzPR/6ak7Mlfoud6BXQFEjMscJzZkNte46rKr80UCsFvQvhSoqMnhu5toOWDa
	jcJoPoGdz8lN5/3LgQyHpZLFkuucCvQjE2iQEx9SCHCgF5ZktuXFykrUfgaF2jL31Xy2ueBtsJA8y
	zBA5ps3b8E7Zz7VdAgmhB5tpJszeBt5Nb2aaFT1ZVvz6UjvxzoTq+e2GAqPgs/QNF4gRtddDco7rC
	UGKfil7PUVwrq0s9xG5aSWFx0OZMRfKa1G44b5ObNDNHDpR/nTqIAMpnTkigm2kzAVxpS6wSjq9qL
	NC/xt38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPWD-0000000E7Sj-2p1L;
	Wed, 27 Nov 2024 21:24:17 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPWB-0000000E7SC-0a1y;
	Wed, 27 Nov 2024 21:24:16 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F9E3114019B;
	Wed, 27 Nov 2024 16:24:13 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 16:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732742653;
	 x=1732829053; bh=A/qG1PCWH5DIdjBCou8V6S3ZjochUv53NXLjRXrbNBA=; b=
	gjq3hl0XgvRADwxaY6xtVoz2rKXiUC+9uUIjK4JTyo1B1TgozvlUu5J+lfzmMGRx
	+U/PbOrTr4G7/wW18lBRGEjs9AGk0CuZ83nO6loMdATqv/Rjt8z93Z8kdraPeB7d
	RNZlMOMN0ZsWn592gnrKjD5D7gnQDr87DZnHPgxet3szA6Q+QKzb6PogLVj1Bv8B
	QnhbeiNFAu1wVbvxhpWpdoy2PYHhoUWp5GL1uMCozj8bbICGt0I9LKfQRFJUwKHo
	Y6fd9aKXXMsJjkZTvivrdYdyA1UpyWT8xdyhM2imAD4506dtLLzhjHtKEdeQNwoE
	+wSmRZXmmdicvinRZt7R4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732742653; x=
	1732829053; bh=A/qG1PCWH5DIdjBCou8V6S3ZjochUv53NXLjRXrbNBA=; b=O
	wTYQmd9TokVOLvF2vAUccJfwlyLPiRR+Ctjlp2D6Q/+QhK3bWZM02wr+h03D8YSm
	6tOQf5lLvxwMMHMc1o/SmIuwG06+W6utUJMtT4GsgvWTHzrGdqCrV1fGdGBvVC/7
	GMLQ//uep/AFuZkzU7mws1oFFxAfSFMAjckG1oWESy8lGU3qbPbidUZ8YLiKVewL
	k0zy2FszKmEmkv/WoAALuUHhx5tH9d1nv5fKkgx2S9bPQaMm3KiouInkWVnQ2EZx
	Q8V1gQMusCh+nCJ5UuXVa3V+gSHzC4jcdxzd/mHSyvgT+gCHWccCOVaPAu4v2cKL
	Rmg19EGUt3wu5i9ezquzw==
X-ME-Sender: <xms:_I1HZyaQhEH4eHjR5OhZ10hCPejA0CCvC8p2egqcgPvxViq50J-bSQ>
    <xme:_I1HZ1ag8R2tf9dHilhGNaPLvdg3vOs-jhTjLRj5Xhg3xiadbUMimzlUHPN5iPGHX
    A42ur3BB-deBEAgGlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisg
    hrvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdp
    rhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpth
    htohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgt
    ohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshht
    rhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrmhhlohhgih
    gtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:_I1HZ8_gljDEAjSj2_i2Z32mj08WcG0CpxI1zfSJ_oJPxJPsntoPpQ>
    <xmx:_I1HZ0oe70OojxKuJDXilLWlsi8MBucRGyAEZ3uUCGQ5n36zHwBSuQ>
    <xmx:_I1HZ9olghZMkwyy6fj-KC-n5WxUi5GgDyBvL1LJOAPGhMcPWB1qIg>
    <xmx:_I1HZySWSvXIL8IFo4ONqcn7vqXzffoi6f45QK1OqQcg3_N46AoHRQ>
    <xmx:_Y1HZ6jihTLiBZlmwD58U1KDPO3yzSFtSW4gdoCbZ3mvINjfEFKhJ_mX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A71B22220071; Wed, 27 Nov 2024 16:24:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 22:23:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
In-Reply-To: <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
 <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
 <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_132415_571980_5D44AAA3 
X-CRM114-Status: GOOD (  19.24  )
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

On Wed, Nov 27, 2024, at 21:56, Jerome Brunet wrote:
> On Wed 27 Nov 2024 at 20:30, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>> It looks like RESET_MESON_AUX is a user-visible symbol,
>> so you can simply ask users to turn it on, and add it to
>> the defconfig.
>
> That would work yes but It's really something a user should not be
> concerned with. I can follow-up with another change to remove the user
> visibilty of RESET_MESON_AUX. It is always going to be something
> requested by another driver.

But that's true for all reset drivers, each one of them is
only useful because it's going to be used by another driver,
same for clk, pinctrl, regulator, ...

All other reset drivers are user-visible, with 'default, so for
consistency I think it's best to keep it that way, and
just add a 'default ARCH_MESON' the same way we have for many
other reset drivers:

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 3bee9fd60269..c02edc1b51aa 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -14,6 +14,7 @@ config RESET_MESON
 config RESET_MESON_AUX
        tristate "Meson Reset Auxiliary Driver"
        depends on ARCH_MESON || COMPILE_TEST
+       default ARCH_MESON
        select AUXILIARY_BUS
        select RESET_MESON_COMMON
        help

The only bit that's special here is the exported symbol,
but that is handled by the dependency.

>> I also see some silliness going on in the
>> include/soc/amlogic/reset-meson-aux.h, which has a
>> non-working 'static inline' definition of the exported
>> function. Before my fix, that would have caused the
>> problem auf a non-working audio driver.
>
> If by 'silliness' you mean there is symbol definition for when
> RESET_MESON_AUX is disabled, indeed I guess that could go away.

Yes, that's what I meant.

      Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
