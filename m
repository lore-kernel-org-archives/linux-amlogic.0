Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24866C48BE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11542083D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMtwxu9R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xTp9LKDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11542083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ghbn6JgDYA7i3HJiezStMp4q3Ed03Pz9V/w1Z1rteAw=; b=IMtwxu9R3Nyikc
	tHa5ZHG4qR6C9c9aQcLJpqnd6qGNe9fN0TRSP/uCo6xjlCauC2FuBEyl9/UpoVzpe3WEssP1Evjhj
	R8vdRftywAWXoDn3vjj9jHy6Ep7T2qRR2bKZmwNTfK/n/IyfnnwIo+tFEGkGpO+vRDBeKtVNVPiMM
	pPfdyo718zevFGVDL/rNDIamfsK77/o8b/ytZ1tXf6YVjRaNV959PArK7ggdiptntCKd6Li6TtPo/
	HVJcH0Msubbjgj0/3KTRSj4BshSk0MDteGBX8ZuJhMrWiFqzYIxewpyAtLHHdzJVyPtHz1Xym1eKa
	ZWIhpBbWwf1JJkKqeYSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfKlf-0002DF-N8; Mon, 24 Jun 2019 08:56:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfKlb-0002CP-IY
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 08:56:01 +0000
Received: by mail-wr1-x444.google.com with SMTP id r16so12942692wrl.11
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tsqDfC0/6IGkXvSlVTobk5beuguL0n3jpdD2n3NwLco=;
 b=xTp9LKDzfklLDkCYl/npiybu7Qii3HLNt7uvpx7L/lL/bascfni2K1eHCHXzXpeRHp
 Rb2vJ21BhFOjMupEQx5R4AIrMYIjEVUuH/hna97Gqd/5V3Y29/91RMbqGOimQXYE+wrJ
 pSy3ScE9qG76AwmXiwN5pY5fwLCAoC0ve9b02FkK06O4/GJzNAvA9nS73LF5QJbQuG6O
 q4P1k7Ofj+3bMfEAtKASb2ldb0rmJBJXepiuqSI+G8r1PK8mo9nE/Q2LrIK/YVGLX3wi
 OH3rV/kH/yJQYjOfQg7Q8+dxvCRiDNqyOOfyzSRHVfbjDWMfNILQVmIyhPGW5B3vOUng
 dR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tsqDfC0/6IGkXvSlVTobk5beuguL0n3jpdD2n3NwLco=;
 b=TK8Dhs3CVlYiLKRrnX5PXY9zZLY4YB0A5gP7NHpK72e3OkyfVMmhdUUibhkgVt+OAF
 DEpZxiUq3lhsDvzIiS5Rnn0pY8qcMAxP3w+GUM6aWcLWRg+GiQbk3CPdGqV1V0VtV449
 URQ0c6+AyX4vsCKLiYXTsSxspJw3Jy7qQR2Aw3j9ytDnGHsgzQRJr5Zc1aIvpb5pRnHC
 cNKEKZWE32UOyrFcN6TJandjdclBs9lAID1fF02WedaWBgPz+yWsSKmcG6UrOFZ/8aPY
 bXnav+i4ooSzQJIGgo01cAepuj8K81IwtukWjYbg/APR5MH6108gE2NNbPVWD2gFYzWv
 U1/g==
X-Gm-Message-State: APjAAAUXCCbmV4KExJZB8RgpAsYjstDNeQaP7c2LoI7T5+Q+1iqzmfQ3
 HpQ2djpCVYEbdzpINWA2nOa1VA==
X-Google-Smtp-Source: APXvYqwl6uyQyh9H/2TLaTx8Lmj4y4RxTk14OPwFBUZccGkTVy1ph8PRdsnwT9S3Ad6EqBGNsWiazQ==
X-Received: by 2002:adf:e841:: with SMTP id d1mr45741252wrn.204.1561366557341; 
 Mon, 24 Jun 2019 01:55:57 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d5sm9220657wrc.17.2019.06.24.01.55.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 01:55:56 -0700 (PDT)
Subject: Re: Help offering for AmLogic S905Y2 Mainline Effort
To: Daniel Laube <mail@dlaube.de>
References: <0292EC91-0CBE-4F22-8F28-BD581A157CD6@dlaube.de>
 <2543a892-d7b6-f528-4df3-923edbf1dd85@free.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <cdd4111c-16d7-adce-d7f7-4c3ee77d2a43@baylibre.com>
Date: Mon, 24 Jun 2019 10:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2543a892-d7b6-f528-4df3-923edbf1dd85@free.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_015559_633976_0C0E4567 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Daniel,

DRM Display support for the S905Y2 will be available in Linux v5.2,
but necessary devices (mmc, sdcard, sdio, ethernet) will land in Linux v5.3-rc1
in allmost 4weeks, but you can check the integ tree to test these features as
described on http://linux-meson.com/doku.php#development_resources :
https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v5.3/integ

Video decoder support for S905Y2 is in the work, bit we mainly focused to have
the bare minimum driver being merged for S905/S905X/S912 before pushing more
complex decoder and new SoCs support :
https://github.com/Elyotna/linux/tree/mjourdan/media/v5.2/aml/vdec

BTW, you are very welcome !

As Chen-Yu Tsai said, we idle on #linux-amlogic IRC channel on freenode and
activaly use the linux-amlogic@lists.infradead.org ML.

You can also join the u-boot-amlogic@groups.io ML if you are interested in
mainline U-Boot dev for amlogic SoCs.

Neil

On 24/06/2019 10:36, Marc Gonzalez wrote:
> On 23/06/2019 22:42, Daniel Laube wrote:
> 
>> recently bought a cheap HDMI Stick Computer with an AmLogic Chip (S905Y2 on x96s Board) 
>> because i was told that it had mainline linux support. That seems to be 
>> true only partly because there are drm drivers missing for the gpu and 
>> no video encoding/decoding support.
>> Because i would like to get these things working in the future i would 
>> like to offer my help.
>> I already ripped that thing open to get access to UART to see boot progress.
>> Could someone please guide me where i can help with the mainlining effort?
> 
> I suppose the first thing to do is try to get in touch with whomever
> might be working on this at the moment or in the (recent) past.
> 
> Look at the MAINTAINERS file, to find "official" maintainers and reviewers.
> 
> The baylibre team seems to be handling some of the mainlining effort,
> so perhaps they are in a good position to provide relevant information.
> 
> There's also a specific mailing list: linux-amlogic@lists.infradead.org
> 
> Regards.
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
