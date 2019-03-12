Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F37C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29982087C
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOCOfWlS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MVB27H+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29982087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoDKco7bSzreVUW/m74JkE7mqha1TBUjBPSaCPLgKY4=; b=kOCOfWlSqkWNXX
	oaLOdl2XqbDHvM+AH8UvY4eR8KKj+zOvX0oWWscAi6PcOnDAoY0qpvuxFSGNwIZm3i/lsKXR9tfRf
	MR6VLx0/iZLHdj7+Qt15bv+jhvN+lOOWuU7am9QtbqN6yqCbSftGh6unBoVGpdxIdpteM8Tg47jRS
	BXEK6IydWmBgBd/6Ir5Tk4yJRWI6Zs9Z9ro+pPz56ijbeJxvATlSnQDTTlqmISu6nh4YY0uECDs2/
	0llvRAeEa94Z7z2Nk5+AxandY4ApBgbPHzUaYGtwYFfmkx87l1yLDX23ePnHG39wPw3N1HlsMj6b7
	mz8qXxIegqGi77fAM7Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h41Pn-0000GF-PJ; Wed, 13 Mar 2019 10:47:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41Pl-0000Fb-01
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 10:47:14 +0000
Received: by mail-pf1-x444.google.com with SMTP id v21so1074690pfm.12
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=xgREfe6VYhgvZSNFi6AtU15uCjA8bty6jN0rAL1RU+0=;
 b=MVB27H+zeXEwu/DhsDBGTXUoUhiiBS7TClAd41aNTwTBWv6o8k9uVKOK1GLoWiBClk
 7VmRipAmQ6bgKm7PotWJRpqUOXVUWdOtuCCFBr2gn4UX12qWQE6toC9aOPMDzeSZl4dE
 ufhSl0JVlzDJ3U5bBN0x+ji3rXqO+okBI2wM2U6b21okqJgOu49f00Niq47dBYUa/W91
 gA+X6etSafjNluKFEGdgw6waL2/QvYN3vtr97jq+s5uoeJGL16YbwixFGtQ4g9di/Ydk
 ufitDCGTFhFxznlpX+oNlzA1GVm1GDaRRwtCbnFtH89Rhrp0aWTWsZa1wDLSypRPEudM
 I/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xgREfe6VYhgvZSNFi6AtU15uCjA8bty6jN0rAL1RU+0=;
 b=T47lMfoHcnw17bn+Je/duOvQJd/AP2OTKrQtutCDjPwxaCxXUglKD4Lt9pOHfK+bfg
 zr3GlFybzEvFwGvbTicQ4hnURaAWMK3WGO+ME5baM5Ochijl+Em+3dzM9NWmi0HLqk3R
 Nw2fqSnZGX8Ko8Wyk396fnqo4BJxvcBL7/CK29n42cSP3yE3LNFMvs/cdrAGIcopk1dB
 95S8QLCaewVPpI3dtJvmM7oNq0bJzIkwYlNRvyG1phIRz8zOE9SwdZEu2m0Do3mfG7TH
 rcWoKLdxgnYKmlct0dGhU/0+rT0i/06QfbZ/FUCM1x+z3luMQRdYJ3UiKtADU8z2eox3
 sLsw==
X-Gm-Message-State: APjAAAVkJ2owvOIlZfGUs55R51I9nCK2kX3Z5pBxMwQ4EcCACUDUWUJt
 iMKnJbyyJPlSUCdvaxaXG35KCw==
X-Google-Smtp-Source: APXvYqzQAO+a0aGGXg3ufBju27TDB3RPu0Hbk7EqB73YliMbXittcdO8huOaB1f4CuYmUHu/vu4x2A==
X-Received: by 2002:a63:c804:: with SMTP id z4mr11389231pgg.228.1552425341054; 
 Tue, 12 Mar 2019 14:15:41 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:1daf:3f96:9f7f:33ba])
 by smtp.googlemail.com with ESMTPSA id f4sm12146957pgq.94.2019.03.12.14.15.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 14:15:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/9] arm64: dts: meson: g12a: add uart_ao_a pinctrl
In-Reply-To: <244fba9a-31ab-a75c-3de2-a66638a9d36d@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-5-narmstrong@baylibre.com>
 <244fba9a-31ab-a75c-3de2-a66638a9d36d@baylibre.com>
Date: Tue, 12 Mar 2019 14:15:39 -0700
Message-ID: <7h36nru744.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_034713_041044_D64CE883 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 07/03/2019 16:13, Neil Armstrong wrote:
>> From: Jerome Brunet <jbrunet@baylibre.com>
>> 
>> Add the always on UART pinctrl setting to the g12a soc DT and
>> use it for the u200 reference design
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../arm64/boot/dts/amlogic/meson-g12a-u200.dts |  2 ++
>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi    | 18 ++++++++++++++++++
>>  2 files changed, 20 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> index c44dbdddf2cf..f2afd0bf3e28 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
>> @@ -25,5 +25,7 @@
>>  
>>  &uart_AO {
>>  	status = "okay";
>> +	pinctrl-0 = <&uart_ao_a_pins>;
>> +	pinctrl-names = "default";
>>  };
>>  
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> index c141cc7f6b09..f8f055c49f9a 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> @@ -177,6 +177,24 @@
>>  						#gpio-cells = <2>;
>>  						gpio-ranges = <&ao_pinctrl 0 0 15>;
>>  					};
>> +
>> +					uart_ao_a_pins: uart_a_ao {
>> +						mux {
>> +							groups = "uart_ao_a_tx",
>> +								 "uart_ao_a_rx";
>> +							function = "uart_ao_a";
>> +							bias-disable;
>> +						};
>> +					};
>> +
>> +					uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
>> +						mux {
>> +							groups = "uart_ao_a_cts",
>> +								 "uart_ao_a_rts";
>> +							function = "uart_ao_a";
>> +							bias-disable;
>> +						};
>> +					};
>>  				};
>>  			};
>>  
>> 
>
> Will move this out of this patchset to the boards patchset

I assume you meant you'd move the first hunk, the one that modifies the
u200 board to the other series, but keep this hunk in this series?

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
