Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33BBF0181D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kR7KopFHN3cWdCCg6zM3zRoTapaANTUwb30fJyy7zs=; b=xcd4J8FqBWZt3c
	FUiHRAYzD3UExKCV2ivuF+wEpBRaNRrqWFbiGgvZ2r93gu7OIzDhb40/3TYoHv+wIxkQKJ2BwwWsP
	vsOXcU12uqANLj8ZuZ08/HTVYbBbRPNp2iAd6vOcvhZosVUAusSmOUJSpm1r+LSpQRvOkoI29zUNo
	RXrqUbsOtfKc9SgLBNan2lGFvOTCCyRvxYAtHA8xMgSEpt9bJtYODc3iBTKpBJOaaFzyorppWFpRZ
	Rox2PaUqMD3nsTNtGiCEXcScQVrgsKb/Yfd+9CoXTRDhDQdhZ3xZw23yajByIsvkS2TTmoBD9QEQu
	Sl6UVGHFbVHIHToMGjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS4H-00000003PPf-04rR;
	Fri, 06 Mar 2026 10:06:01 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS4D-00000003PPG-1X7s
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 10:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772791552; x=1773396352; i=markus.elfring@web.de;
	bh=coaATVB2ThPJ6g/S8pcCGqIqy+Txjoz0RQnV/SvC4T0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o2pC7VlfZ7z0znx95U5rbjOk7yUcVPza1fj6v1+Q4lCcszqHfWZJC7ClsYcdBRmC
	 B8BEOuBg7df1SIgJ0ZDKhe5gB5humNahp7/9LLBBN2yyNqPIqigEQrAMAHmbyinu4
	 SRmXvZnWPi7fFzh38IRBY3SIUc4FH+vquvNu8F/OKy9IxQ6CkExPt2HGEBrCwLjRr
	 SfsxKK2V/BFA/W9Mh+MJH2/2/QZbswJKj81YwT7ubq+8owpDzrofWpCW90G+jWtVc
	 1Sfpb0oHw8zonvkKbaN2pbVEdzD6tmx62JhheAlUu6i4EJWOLnFMCRlBLUuc8bibM
	 9KrqU8qt6lyDefT6zQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGSW-1vp49C2HvW-00ECSh; Fri, 06
 Mar 2026 11:05:52 +0100
Message-ID: <b73d200b-828b-4f04-acd0-f50898a94057@web.de>
Date: Fri, 6 Mar 2026 11:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Feng Chen <feng.chen@amlogic.com>, Liang Yang <liang.yang@amlogic.com>,
 Mark Brown <broonie@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20260306-spifc-a4-v1-1-f22c9965f64a@gmail.com>
Subject: Re: [PATCH] spi: amlogic: spifc-a4: Fix DMA mapping error handling
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260306-spifc-a4-v1-1-f22c9965f64a@gmail.com>
X-Provags-ID: V03:K1:7bTKpWrHjHFAlbjNgKtQFY3PmMjHX19Y7jY+bxZ/x7jVDhmajXK
 bdJXCZuQ1CH43QGHz5ARcGuSh2pE6Zsaj/I7MiZ4Yw+IUfvg7PkrXLT1Y5XlUUXqf6liNpN
 hgPLJ6DXaw+IvZAPLkEUf9nvPbvNRK3dOfl9nOetVEFkTa4mRrTLLwt55un9iCRAsESKFDT
 YOAv6IMBIN+JaD7aD9K9g==
UI-OutboundReport: notjunk:1;M01:P0:RaywFNjIkQI=;HAKBQxCIXhZV0zAflVSDcTVp2/i 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 o/1wyc9DKoNIVkzjo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_020557_690977_AD2168B7 
X-CRM114-Status: UNSURE (   2.28  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBGaXggdGhyZWUgYnVncyBpbiBhbWxfc2ZjX2RtYV9idWZmZXJfc2V0dXAoKSBlcnJvciBwYXRo
czoK4oCmCgpQbGVhc2Ugc3BsaXQgZGVzaXJlZCBhZGp1c3RtZW50cyBpbnRvIHNhZmVyIHVwZGF0
ZSBzdGVwcy4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmct
cGF0Y2hlcy5yc3Q/aD12Ny4wLXJjMiNuODEKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
