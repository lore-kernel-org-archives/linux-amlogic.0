Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3569C282C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 16:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45DA2184C
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jan 2019 16:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H37ebvnc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45DA2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mt/8XU8JvWp+nMm5dH1rartSWTZKRpdS5aBirXNg1hk=; b=H37ebvncY971fXVdk/IoqXsZx
	/AtN3sBc4EhTo3D9s07MEkTFSyzgLXLPB12WKw+FXiSERT3zvKMNNy1tHsUjkxEesZc+OPLxEeMME
	BoGRdG4hA/3MULDKrA46ynFe9lhBjHOBiUKNlSqzx1dGns4nWh5I1RMmA4qs3BOatpkVcwZAD4AJg
	DI3u2CTtRb7UsEd9kjwwKdTCAobWtjaljtV5jR/zkJkgPIY0GhdnkpL+Km+WRdGaeG86BEJz8Atnm
	EUvmVvPeSOSHIpFK13DYL+5K1D4ey2ARpOVldypykvtzpGvstRM4O0ZQx79doYYKMXCL6AeQDBcUj
	jMjFwQTUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmLB5-0004cF-BV; Wed, 23 Jan 2019 16:14:59 +0000
Received: from imap1.codethink.co.uk ([176.9.8.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmLB2-0004ae-LR
 for linux-amlogic@lists.infradead.org; Wed, 23 Jan 2019 16:14:58 +0000
Received: from [192.168.122.135] (helo=_)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1gmLAv-0002Jf-4z; Wed, 23 Jan 2019 16:14:49 +0000
MIME-Version: 1.0
Date: Wed, 23 Jan 2019 16:14:49 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] regulator: pwm: suppress EPROBE_DEFER error message
In-Reply-To: <20190123160405.GD7503@sirena.org.uk>
References: <20190121183723.25231-1-martin.blumenstingl@googlemail.com>
 <20190121183723.25231-2-martin.blumenstingl@googlemail.com>
 <20190123160405.GD7503@sirena.org.uk>
Message-ID: <afa9ed378b7fa62e81662363fdaf7543@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.1.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_081456_848243_A360EB58 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: boris.brezillon@free-electrons.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019-01-23 16:04, Mark Brown wrote:
> On Mon, Jan 21, 2019 at 07:37:23PM +0100, Martin Blumenstingl wrote:
>> Suppress the "Failed to get PWM" error output if the actual error code
>> is EPROBE_DEFER. This makes the behavior of the pwm-regulator driver
>> consistent with what most other drivers do (which is: print all errors
>> except EPROBE_DEFER).
>> 
>> An example where this cleans up the kernel log are the 32-bit Amlogic
>> Meson boards:
>> multi_v7_defconfig has CONFIG_REGULATOR_PWM=y and CONFIG_PWM_MESON=m.
> 
> This also cleans up the kernel log in the case where you've not got a
> driver enabled that you need (or it's not loading for some reason) 
> which
> isn't super helpful when you're trying to figure out why the driver
> won't probe.  There's not even anything at debug level, that would
> probably be fine.
> 
> The ideal thing here would be to work on setting up the dependency
> information based on DT and using that to try to sort initialization
> order so we try things in an order that minimizes the number of failed
> tries.

Hmm, would it be useful to have a devfs file which holds the last probe 
code?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
