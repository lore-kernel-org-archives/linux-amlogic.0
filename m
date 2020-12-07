Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E25C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 17:54:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FBC321D42
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 17:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FBC321D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k/V7l7xzYCGaYlNbMfNDUkLF85vR48ssXtDgGIw2Aag=; b=dS31XGZ/E7AyUuzKaZKKYpw52
	5xjvBu7R9F287DYwB5JMdz1YkMraTBTcl7U7K818xmc336TbbiCgRRp4ze/iPc4pifbx31RZFH6x9
	yLFugiqkYk9ZPy0t1KOsPfwwfKi4oNF1NSo8SLjnAeFAivGmhobVoj7pBfB3deopyNkvUPaDFxl2i
	G//HndsNrxdPeE0Isin5RLBE0gRIRFzJt5OudCA1qoR/FfLvTiw6FuSZNb9MsabR3Jzde9ZP6BG73
	mqspiOaDmn+jclGCwH+hG+zEsr0nWv/dsuwybwrMZ0ZJRtghruCglmbn1gHWjijMGQpMfdOnqFcjv
	mWM2ROgug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmKhr-0004n7-6b; Mon, 07 Dec 2020 17:53:51 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmKhn-0004mc-95; Mon, 07 Dec 2020 17:53:49 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 6CB545C0054;
 Mon,  7 Dec 2020 18:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1607363623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkGJj4xRtLjLHi9uk2lHu+eJLiMO4r8tHRe6lcpmSbI=;
 b=raPdImDDTIiegSJWjc9kp0oB2+0DxMTvr7V45zgBlwAyRvQvZJYeV65YXexfMT6YySjMio
 MGhyV6XVgfS3gjot5iY7Kan2RfqSx8D5JVuEZYvwkQiluiOdbExVol7zVEQkdAw6hGsPfm
 IP1eU/sZ3VORqVBeqt08uRn3tapwSQ0=
MIME-Version: 1.0
Date: Mon, 07 Dec 2020 18:53:43 +0100
From: Stefan Agner <stefan@agner.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: meson: fix PHY deassert timing
 requirements
In-Reply-To: <CAFBinCA_eaJHv7e+8ZM=z=zUZ9uQY_JZ=618=LwJYM-Gi+OO+g@mail.gmail.com>
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
 <6bfe17d86ead62c20d236e2ebbc7b7fe3354829d.1606828668.git.stefan@agner.ch>
 <CAFBinCA_eaJHv7e+8ZM=z=zUZ9uQY_JZ=618=LwJYM-Gi+OO+g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1275fb519490b00a079ac832277585f1@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_125347_445509_87D80B8A 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jian.hu@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-12-05 14:04, Martin Blumenstingl wrote:
> Hi Stefan,
> 
> On Tue, Dec 1, 2020 at 2:21 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
>> 72ms "for internal circuits settling time" before accessing the PHY
>> egisters. On similar boards with the same PHY this fixes an issue where
> there's a typo here: it should be "registers"
> this is the same for the other four patches also

Whoops, will send v3 shortly.

> 
>> Ethernet link would not come up when using ip link set down/up.
> I have never experienced that myself but gotten a few reports about this.
> thank you very much for coming up with info from the datasheet!
> 
> the following stmmac patch [0] has been added recently which may - or
> may not - have any impact also.

Thanks for the hint, wasn't aware of that.

--
Stefan

> 
>> Fixes: a2c6e82e5341 ("ARM: dts: meson: switch to the generic Ethernet PHY reset bindings")
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> with above typo fixed:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> and also:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #
> on Odroid-C1+
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro/stmmac?id=56311a315da7ebc668dbcc2f1c99689cc10796c4

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
