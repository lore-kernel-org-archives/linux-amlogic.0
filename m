Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3807AC00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytAL4T0Q+NKXv4i+myNuYhtpCL8NNzXC9mxbpx6DZ4s=; b=u8fYyRRUhOb+bZ
	0oHhNivTODvB+HlIzjw2CafnBM0Lf1cZntsojWFwtNUQwlVZTLEqvZfMap6FSDVWrjcq5FqAVtzXO
	MBtrQ0yX9uH5D7uT0MW6e/rwpsJWoXrUJoG8P1fKsZjbc60gUAjZYwtuyZPoxctBxzOV8vvlQsFNr
	bZsq4UtnYbAHjbgVOaIjN6RuOL07tWks/4SxQH44jGEWqI5BN/elEio6REi8O9GBIlanPb/SCjoGN
	+3LQsHZAZWWkZKs6ggYogmPtkBPceB9x/zvmi0u4kM7aKvRBnHfRjJ01mHOdKsP86usPNjH614SF6
	CWwtROfU4XKIQ4gWVTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmsc-00CMo5-O2; Wed, 10 Aug 2022 14:40:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmsR-00CMkm-QE
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 14:40:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v3so18073324wrp.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=3zoT29l2qJ9aTsY+6ZgozKW8nBr9jlEDg3mjpflKN7U=;
        b=6f9vtUxhe784fp23lP6rOYryqTkvlaJq070gQ0cOXntG1rnOXeY/inEjE390LYUM3V
         F+7CYWBxIYPpFNbxy4jkhJall3nyuk54rGCN4Jaj2eqeTOg1PXi9J4mEEnMM9McBZ/nO
         x0lhPSg/BYcswX3mt7uqqasP8X5Y/0UTUyZI8pt4egjDlp9IacEsVHRezzTk4S26xLfH
         pyXN0lxFHUV37u0DVoFu3jUErUjSQHgud2CH6U7OIp90FQDzON+PLbPffezOiBiHqRBq
         TWeemrp6GMr4Pihqgyn9TRjcz/eI4KbscdSt5VSYnSTtOuHOKY2ZCyZ0brZggfJXbZgn
         6I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=3zoT29l2qJ9aTsY+6ZgozKW8nBr9jlEDg3mjpflKN7U=;
        b=xj4eFpKC+mFVhkotEozJ7xIG1SwExS9dErWajP/tI7b+EuVbowdr0r0B5jC0DB2x3S
         nxWL2Iuq038IIL6xylff/RDXLGIuGUSOgwnGespcABLybbvMqH2LgfaDnXwPXMDEfzBG
         ri4OJtRjZNAeM3nsjFjUaXWn+3ua+WWWBQhnL2QGi+BLSdUvp0Q5t1e20Sy9uiiDr104
         nhrVtlquUE2V0wNa+uiQJl7Su0Q3IZuwtf6H8wt+dO93lN1PDjoZ1Ou7NpKsokQnq3lI
         oNrpRdJ+Spnv8sXTdHMQt8e1FJch+JHTR78CPasluHDlePv59cesZFHgRCMZE32/bS0t
         swyg==
X-Gm-Message-State: ACgBeo1gHkVwLWLsD5z13cdpf48nMexOGEB5mTpjx/zBEYDcHVpm4/Kb
	XXDLc1NmTbdcdLFxPYvqp42Yvg==
X-Google-Smtp-Source: AA6agR4vOEiO9UfNGfLbBT7KPPyGdUzwnaj707ZIWzWUwHvF23mK2tcUvXiNy5X4xG/E27w8ShcnIQ==
X-Received: by 2002:a05:6000:1011:b0:220:5a7d:9cd6 with SMTP id a17-20020a056000101100b002205a7d9cd6mr16331099wrx.504.1660142406033;
        Wed, 10 Aug 2022 07:40:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006? ([2a01:e0a:982:cbb0:bbf0:b69d:fecb:8006])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b002235eb9d200sm6018414wrz.10.2022.08.10.07.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:40:05 -0700 (PDT)
Message-ID: <9dabe979-f6b5-329d-f017-a8f0c00adeca@baylibre.com>
Date: Wed, 10 Aug 2022 16:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Da Xue <da@libre.computer>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
 <YvOmnDJA+ov49chC@sirena.org.uk>
 <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
 <YvPBX7zJ72RXnrpk@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YvPBX7zJ72RXnrpk@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_074010_203059_31E4ED82 
X-CRM114-Status: GOOD (  20.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/08/2022 16:31, Mark Brown wrote:
> On Wed, Aug 10, 2022 at 04:01:33PM +0200, Neil Armstrong wrote:
>> On 10/08/2022 14:37, Mark Brown wrote:
> 
>>> Sure, but that doesn't really address the concern - is this something
>>> that the clk driver programmed or is this the driver forgetting to
>>> restore a register that it programmed itself?  The commit message sounds
>>> like the former which is a much bigger problem.
> 
>> It's what is programmed by the Clock Framework yes, it was designed as-is
>> so the Clock Framework takes the most accurate clock path but the reset case
>> wasn't taken in account.
> 
> This seems like a bad idea, we shouldn't have two different drivers
> managing the same register without explicit and visible coordination
> with each other, this is at best asking for trouble as you've found
> here.  I've not looked in detail but I think if you want to use the
> clock framework here then this driver should register a clock provider
> for the clock hardware in the IP block.

I totally understand, this wasn't explicit until I found the bug.

I don't think it's worth adding so much code for this since we already
had an open-coded function which perfectly worked before.

> 
> How does this work with runtime PM, what happens if the clock driver
> decides to change something while the device is powered down?

There's no runtime PM implemented, and yes it would be an issue.


I'm perfectly OK to remove the CCF driver for the legacy clock path
and return back to the old open coded calculation since it perfectly
worked and stop using the legacy clock path for new SoCs since it would
never be selected anyway...
... but GX SoCs are broken so it would need an intermediate fix until
I push the refactoring to cleanup all this.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
