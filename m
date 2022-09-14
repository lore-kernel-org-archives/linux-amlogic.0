Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FBEC6FA82
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Sep 2022 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHP9cw19kpzWx5aCg9OokM6V/xFXrl+0hmM77KBvY28=; b=bYVTOy/fjrRXkB
	Xcmh7a0p9w9GO4cGfx4AI2NIHbx5bgsz4Lp/5XYoNHmJdGkSlSFaNjSZ8FUndr5Y2e5wm/W8U31z6
	lz8QaKYasyFNBDJZjc9T8rmhUW7ZavKErfuC7MUo8COjPU9Qh3NR4C5A3TpMMbbDKAxTqJ1Dm6u7H
	0SGI7ulu0Qq1UBjN9cDZh29EALOEb/5yYBi7xbXgZye6zhW2z3hFu1OHWarib9XOgYBtJn5HXthvR
	r4fVCWctLDjpyKP+F4MgU1VGsab3a4LT6/dCMFmd+n2sJewVZkNBfLAaDjnh0jMVKNRu9fOdFURV6
	D+6WfsQVVaRtI0xHWIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSGu-000e67-Cl; Wed, 14 Sep 2022 13:17:44 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSGr-000e30-GO; Wed, 14 Sep 2022 13:17:42 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 0DDB12B05DAE;
	Wed, 14 Sep 2022 09:17:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 14 Sep 2022 09:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663161459; x=1663165059; bh=GdgMo8oW1+
	2SMCLkBxj5GR3RIMNzrKHtUDN4Kx4rnvU=; b=oV2STMsFokkBLoSvn4LZ0bRXEy
	PHOYPvTVkohPZ3QmjXZLv9j5XItd9ZNYiti3Wo4bAf2GM4x9AeypXkXC3LBsScan
	Kmy9B8+xsVZr/vnEyYBcz21o9Yw88uaUeLjkqr74E7pCILyqReQ29e45Wa5acU3J
	ho+vBjNlTfz6VOp/hN5SHKvU8cT2hJwBZjMD2XYx367k/jlYM/Z5veWFt3Fhg6fh
	rbxmdolsi8GJbQn/KwhhogeJrfd1TMEsn8JPMEKFQMUVj0WpvLIMH6d4kDZWb04U
	/PRpWHr6uHjcf0/3XhAOUqlKo/UfxA1K+lDQF6i1zuhT9mfv04hiddcn+cEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663161459; x=1663165059; bh=GdgMo8oW1+2SMCLkBxj5GR3RIMNz
	rKHtUDN4Kx4rnvU=; b=XCF+z87anTvBmL047FIOUpa6x9uESrqeWJ3cwS786o4z
	xEAaXWiyDQjSXtwPo9X/c9XThNu3ZGvo2Or/gRR2LgdEdH28HJY6Q9bHHngv6Hgf
	/UaaCIt+37K95+xGc58DX0sjTo3ddMtRgCXmpRjG/wZ24MvXETdwjenDrwzjLDAE
	ER7Om+9EtMgd20C6baZSASSXID4sKdc8eZxcsx3O31RYU9M7A94Zc3uWvQC8XqA2
	nagA+oi6svFbnoiY1GDTondJ6rcDHD7wCV8roRcRoFA2DjIJxPZNR+iY/NUpk/dy
	tHgTNZRT7kSGcyTnz/pGCQsB2woNL2fQ10G9mfqF4Q==
X-ME-Sender: <xms:c9QhYwNU1B3CFZ9FtJk6ZWvN6ycygvi59KycL-TIvj-wqmK2s4HCRw>
    <xme:c9QhY2-TnMvcy_oJGJXZFzUg7HuEdflBSfav2AZZ2hm6CmLEpvQBiZrVZFi4l0ca5
    sCsUUJTOBYqf5X01Go>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduiedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:c9QhY3TY1IEVSEOOna3_4PFQX1dFGTueXtVLfkWVexxdzCSgaYNYPg>
    <xmx:c9QhY4vN6-ltPj0HDnOD-MOOZLIlkzPT2vypTCOvTWEeo9IUeE-2Sg>
    <xmx:c9QhY4cqebahSOONM198AYIhlJN6sYnlngJHkdU8Eo012O3XVP9dKQ>
    <xmx:c9QhYw70bq9fTuEpVjnaG2x6gUvgPPWuTqrV856AxnykH6fb2q9C_2kUGGU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48733B60086; Wed, 14 Sep 2022 09:17:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-934-g6274855a4c-fm-20220913.002-g6274855a
Mime-Version: 1.0
Message-Id: <28501fbf-3508-4afe-804d-fa5a3ccd4291@www.fastmail.com>
In-Reply-To: <499f0940-3d7f-0ed5-e469-5c0979e6f761@baylibre.com>
References: <20220913140303.437994-1-narmstrong@baylibre.com>
 <667da463-1edc-4a99-9ac1-85303d9187c6@www.fastmail.com>
 <499f0940-3d7f-0ed5-e469-5c0979e6f761@baylibre.com>
Date: Wed, 14 Sep 2022 15:17:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <narmstrong@baylibre.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: add support for DMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061741_594738_1ED6B015 
X-CRM114-Status: GOOD (  16.41  )
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

On Wed, Sep 14, 2022, at 2:35 PM, Neil Armstrong wrote:
> On 14/09/2022 13:19, Arnd Bergmann wrote:
>> On Tue, Sep 13, 2022, at 4:03 PM, Neil Armstrong wrote:
>> 
>>> + /* Sometimes, TC gets triggered while the RX fifo isn't fully flushed *
>>> + if (spicc->using_dma) {
>>> +          unsigned int rxfifo_count = FIELD_GET(SPICC_RXCNT_MASK,
>>> +                       readl_relaxed(spicc->base + SPICC_TESTREG));
>> 
>> Same here in the interrupt controller, I don't see anything enforcing
>> the DMA to actually complete before the readl_relaxed().
>
> I don't see the relathionship between a register relaxed read and the 
> DMA not finishing
> writing the data in uncached memory, for me it's 2 unrelated things.

The race is between the readl_relaxed() and a subsequent access
to the data that is being transferred. On Arm processors you
need a "dmb(oshld)" instruction to ensure that the CPU cannot
prefetch data from the DMA buffer while it is waiting for the
MMIO to complete.

The __io_ar() in readl() exists specifically there for this race, and
this is the reason that readl_relaxed() exists for drivers that
do not do any DMA.

Note that this prefetching can happen for uncached memory, but
spe-meson-spicc uses cached memory.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
