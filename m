Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81A5C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 08:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9084920650
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 08:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVzf5z40";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HjBx0MkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9084920650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3NUfC48ZEIDZfSoCFCZUi1duOHd69MOZLX0ILOAJ7U=; b=aVzf5z40IxBcOS
	hdJM8Su9s8nQeIFKMqn8d9K/wFw6BjKn6KfbBPh0MyhTNsEg0PGMxMlI/L08bEIgWV1bthJPUHOov
	LMsk8EY1EcWcd6MOx79e2YE1x5fw5yQl0LAlzjKz8ZgnZRbSoXpwcW4bRr5JACLI1OLp1WkritjYl
	TrCHTj3zeBRKmJtrORDIPC8QLJ1OcWXqCxqyIdRu4l9zrBI2HTo+gj5T3BSH6eZ6WFVwAzjirSCek
	bPSwKhCpkvgz48xGIK7nQdjFIuJoINdeVRJBQh5q7kQRygCskO7GZjrjVcFmLNo/5XHkQBOUu2jYo
	qlHM+M1tx4rNLREY3S7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i69uy-0007Fr-BZ; Fri, 06 Sep 2019 08:48:32 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i69u1-0006mC-L8
 for linux-amlogic@lists.infradead.org; Fri, 06 Sep 2019 08:47:36 +0000
Received: by mail-wr1-x443.google.com with SMTP id s18so5680188wrn.1
 for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2019 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CfSPQ11gyL7LqqJg+RfxL7pUmtUK1NuleIgsu8AI50g=;
 b=HjBx0MkBebOyrjQ51slXLTQOOyqLUMka35p52q5dCPEkOoeD78IHBI/Z9AEP4+vIcn
 OKBCX5MjwA0GrX2TYkMksZqvUEugNCv1NXQ/JTaxgrnUROcRsv0B8q/knrOWVg36nk5t
 rRVrQSgEggtShsP10h9DIhud+PuQ9d6gytfJ6ETRD8ZfsBnWDu15NZwVBLFk7U8etroK
 y0RLEA6oDQGlxCqHF7iU5DzO6Xnh8b5QT7P4XG7MpEEXNxiahCeuH1viypdP7zyyVrDJ
 os8CGeBSYPLOEilqK7Y3jAQ1lBuiGHKlx6/PHUtTReUrz2v2QtJPp8cHX3HOzoLCxcC/
 +jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CfSPQ11gyL7LqqJg+RfxL7pUmtUK1NuleIgsu8AI50g=;
 b=aiRHydxKuPhjZtdkKJFs3KLedNkirBmG5qi+6bw3H+ay4zan93R72IF/1TGJCqfHz8
 xBO0A+/Yxu6yRWsxMEl/aJ0IQpSRc9IgBTP4zzLKF2MZmURHXnUUVfxXLJwqsBK61N0q
 m/gt3VZZawE2p+FTbrbfMhueAlEWNgQ1oI8aNItoWj8f5iyirrzhDRSFsjrkaGdAF4cw
 rnqRn1WIjU5mD9E5fBRu6HT1qHMDdLn0zFKFCTk3mwACGe4xBGmEY9uvmXkcTOlBU5rU
 Q3FhIlWTEPpjozdbbbkImhynbcLnDssZLMwYozXOUfFnPpZva0jqUqb8LmmypME3i7SK
 ftXA==
X-Gm-Message-State: APjAAAVWLdYhWyayg/wmyrJaJd25ee9x8dlM+UJXKI/yiV/0SNUDvW5J
 2laWoz5AfhVXyCX2BEH7Pl0ARHoSgLnzug==
X-Google-Smtp-Source: APXvYqzgyU/+indOnTNrg+U/5WDAdwju1MgsP1cT9PecaBiEJfZB6rRcN63enCexjtj7BJZDawOwAQ==
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr4964942wrp.143.1567759652033; 
 Fri, 06 Sep 2019 01:47:32 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n1sm6222078wrg.67.2019.09.06.01.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 01:47:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1: set gpio interrupt controller
 compatible
In-Reply-To: <7hpnkeqxxy.fsf@baylibre.com>
References: <20190902160334.14321-1-jbrunet@baylibre.com>
 <7hpnkeqxxy.fsf@baylibre.com>
Date: Fri, 06 Sep 2019 10:47:30 +0200
Message-ID: <1jmufh3j6l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_014734_218787_712DF643 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 05 Sep 2019 at 13:40, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> Set the appropriate gpio interrupt controller compatible for the
>> sm1 SoC family. This newer version of the controller can now
>> trig irq on both edge of the input signal
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Queued.
>
> I may do a late round for the dev cycle of v5.4, otherwise this will go
> for v5.5.

No problem

> If it goes for v5.5, it should probably have a Fixes tag, no?

Maybe, but then every change to meson-sm1.dtsi would be some kind of fix
on what is provided by meson-g12-common.dtsi.

Not sure this really qualify as a fix but I'll do as you prefer, just
let me know


>
> Kevin
>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> index 521573f3a5ba..6152e928aef2 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> @@ -134,6 +134,11 @@
>>  	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
>>  };
>>  
>> +&gpio_intc {
>> +	compatible = "amlogic,meson-sm1-gpio-intc",
>> +		     "amlogic,meson-gpio-intc";
>> +};
>> +
>>  &pwrc {
>>  	compatible = "amlogic,meson-sm1-pwrc";
>>  };
>> -- 
>> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
