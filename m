Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E52C63797
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEgUgINRQkN44qOMeQREIQ3vi9jz858OWa/OZkD1ZR0=; b=HuTN2qlGyyzXFK
	+a3ElLo2poxnFgfZxKvn3egH5SfoyJfaUrQe//uHtczqgdwH1X3pR0274jG4fbBxkgfEZj2pgJKrU
	99l4D0j3+OmxG1QDAEBuBzdXM+cHVJnX3H/D4tVby+XtKHAaBzpDO64xhnhDk0hpdFjALpB8a05fx
	6Ha2kPEMSh1oQGMDMlXI50j/fPGhnvsHKuCOLmZNiQ2k4fUinXrVGhr/bxgdv3d2O+wFSmUGdnRtI
	geVTrkBb9ZDSNSWI/LA1R63qtPhAXEatFelHYhPMzuORHrDpR1DhlS/M3+C1U2KZQ1So/2fpFz4QI
	JRMWuyi0NTNHTnV8eR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjNa-00DoWh-9X; Tue, 17 Jan 2023 10:39:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjNX-00DoVg-A1
	for linux-amlogic@lists.infradead.org; Tue, 17 Jan 2023 10:39:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B44DC6125C;
	Tue, 17 Jan 2023 10:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B507C433D2;
	Tue, 17 Jan 2023 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673951982;
	bh=mdaYoCHieqlR/XZypf3TarTc+QlmTt1KMt/bm1NDAz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sif5820mhWBTYwW9xX+3U+VHdMetfAu71sahgUqIe0lCZw5Djjtlaw6H/hf3wy/7e
	 V2O07oyBdG+5eFeS+dorFRiD3/cXCT5J1MsSDfxXhcYji7YFZ3WYivq5CMFS20cxKD
	 vITeLJhacnHBKeEGiNAKTMnjq+avDGhtwVbMpaxXYzLQxF+lH8gzhdV7RusS8EadfK
	 2aUv7db2dM2RB0ZbsVUZ7A0kCihKoTTSV7vUap3ejqGExBJjx1IYAAj6g3XOUlflI6
	 b6HhcCrljZeGbqo2uhh0v9K3txufTYZBJ+z7KZUpGa2YPff+eQKPQ3V68MdfGqRKEv
	 NiJlAlqtrolJw==
Message-ID: <a37c0632-08cf-7083-3776-84bdbb33ccd4@kernel.org>
Date: Tue, 17 Jan 2023 11:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: add amlogic gxl mdio
 multiplexer
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-2-jbrunet@baylibre.com>
 <4be60ea2-cb67-7695-1144-bf39453e9e1f@kernel.org>
 <1jzgah1puj.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1jzgah1puj.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_023943_419140_DD71110B 
X-CRM114-Status: GOOD (  16.56  )
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

On 17/01/2023 10:05, Jerome Brunet wrote:
> 
> On Tue 17 Jan 2023 at 09:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 16/01/2023 10:16, Jerome Brunet wrote:
>>> Add documentation for the MDIO bus multiplexer found on the Amlogic GXL
>>> SoC family
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
> 
> Hi Krzysztof,
> 
> I do use get_maintainers.pl but I also filter based on past experience
> to avoid spamming to much. It seems I stayed on the pre-2015
> requirement to send only to devicetree list (I was actually making an
> exception specifically for DT) ... and there was no complain so far ;)
> 
> I've read documentation again and it is explicit. This will be fixed for
> v2.
> 
> Thanks for pointing this out.

For regular patchsets not spanning over 10 different subsystems (so
total number of CCs should be 5-10), please Cc all
maintainers/reviewers/supporters/lists pointed by maintainers.pl. Skip
git fallback. How your patch should appear in my mailbox if you skip me?
Not everyone are using Patchwork.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
