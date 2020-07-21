Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56C6C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:59:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728C6206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUd4HMpD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6vVU9Xz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728C6206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fexuwJbygBOZ2qkUHSraFJvxHfmSry0zgnKqvBME3xk=; b=KUd4HMpDWh8NrjDLF4+kGwSjx
	FfB79jp+cq5/UdJAtAcKnMN2eTLUE4YfXC4T/qDXVThlani7QmM4h+3kdEkde+sari69Q23on8lyh
	w+sxLFNgkBcQ0UskJ/gaI/8UFO/+Vmus7CTYWy6RV+W3DAO7W/IGqBf3Gs/zqhAxwpuXI4+cUtFUw
	TZWoBPijruj0GEVNTQaD5feBjet2A2o+OMmmGe/tuCrjYAjJ4vdQfC9VgNPZJCxwAD0WokuZZrQu6
	9PwfCGDM3Ei+QJXmdpF0/yculcWVgxwmwiZs0Nb8w4DaBvAbhboivD1/f1gcEPr7OzOOUBi76CLff
	521DqJIfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhYh-0006Wo-QS; Tue, 21 Jul 2020 01:59:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhYd-0006Vs-Ib; Tue, 21 Jul 2020 01:59:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id r12so19499690wrj.13;
 Mon, 20 Jul 2020 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3AdpinBar8jETyVImXGpH6Wr1zXFF6+rdd6Lks1U3Ns=;
 b=f6vVU9Xz1UlzuOxQZDfXu2a7CCfo8aIjAPCHfuNfNivztTLOia8vPrpZ5OQQyBOyxw
 rs5t8M5xfemApzlRRYMxXBmy/gEWNponh4jdmcFCAr9p0CsuoByqoZt1a/Tm4+DNUdpU
 WBxTxejrV40DTEqmHBQQCs7SMqcwEq27bcMWds9zPbOj/Caqc26IBC3m0illBXPMzSSN
 vMmSew/85P/nWeaODKWVbCB5ogopq/GB2BIXom8OeOF6hAzQUDiVLLunYyKC29sgLVhD
 gf3HPYED8QhkzhZnOXQZ72vaoZlrb728aHS9yTVcqJ08+zmBxdTDNjKfRdIhgD6ubpHx
 IA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3AdpinBar8jETyVImXGpH6Wr1zXFF6+rdd6Lks1U3Ns=;
 b=X5BtMWbROk6pYMCGAZyNfYLUFqqy5Ne3Xdgs72SQFEhZCn5Wy/diwSrXb5WMIxMmx2
 ZFKZKiXp3wphALcy+/K5Ctf9uraU3s/cLHNaJzjlhWpAF0EJnJnuyLZ/rY/aHaijkn/C
 /UqDzOcjU8mvI9c7bLXTHmxSIhShMKOeSXhi9SLmQp1N7+QMdsN9P8gASgDc/ZQODiTK
 6AbjZbwKcL/WP85FRv3MH5s38bb4ICRb0k/3ai7E816wOg5U0jpDO62RiY8gHa7jB6gX
 KTYK5Q8DudBlKVbAw9Tbq8QmUf/h6azW1xN8ad9DmbP5Ldf4I0l8hcO/Knery9FOjg1/
 ax8Q==
X-Gm-Message-State: AOAM533E2iZWYpkXHcoMuiV7Q77FLDRGLlAXOsq5iBSdViWku1pfxa/2
 686bjpFUi2K7zI/3lzGIJ/I=
X-Google-Smtp-Source: ABdhPJwRJp23dSroRcW60lmsvBJ47busZ4vu3U0ShSeLjQlmLaitxIRTt3lM/mEufxbm8oBJdmFApg==
X-Received: by 2002:adf:bb83:: with SMTP id q3mr11377722wrg.58.1595296742289; 
 Mon, 20 Jul 2020 18:59:02 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f15sm33997391wrx.91.2020.07.20.18.59.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 18:59:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7ha6ztakpp.fsf@baylibre.com>
Date: Tue, 21 Jul 2020 05:58:58 +0400
Message-Id: <E704137A-432C-41D8-9B33-9A96E2936ADD@gmail.com>
References: <20200718054040.3996-1-christianshewitt@gmail.com>
 <7ha6ztakpp.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_215903_680625_6378F2BB 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjEgSnVsIDIwMjAsIGF0IDI6MjQgYW0sIEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+IHdyb3RlOgo+IAo+IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPiB3cml0ZXM6Cj4gCj4+IFNpbWlsYXIgdG8gb3RoZXIgRzEyQiBkZXZpY2VzIHVz
aW5nIHRoZSBXNDAwIGR0c2ksIEkgc2VlIHJlcG9ydHMgb2YgbW1jMAo+PiB0dW5pbmcgZXJyb3Jz
IG9uIFZJTTMgYWZ0ZXIgYSBmZXcgaG91cnMgdXB0aW1lOgo+PiAKPj4gWzEyNDgzLjkxNzM5MV0g
bW1jMDogdHVuaW5nIGV4ZWN1dGlvbiBmYWlsZWQ6IC01Cj4+IFszMDUzNS41NTEyMjFdIG1tYzA6
IHR1bmluZyBleGVjdXRpb24gZmFpbGVkOiAtNQo+PiBbMzUzNTkuOTUzNjcxXSBtbWMwOiB0dW5p
bmcgZXhlY3V0aW9uIGZhaWxlZDogLTUKPj4gWzM1NTYxLjg3NTMzMl0gbW1jMDogdHVuaW5nIGV4
ZWN1dGlvbiBmYWlsZWQ6IC01Cj4+IFs2MTczMy4zNDg3MDldIG1tYzA6IHR1bmluZyBleGVjdXRp
b24gZmFpbGVkOiAtNQo+PiAKPj4gSSBkbyBub3Qgc2VlIHRoZSBzYW1lIG9uIFZJTTNMLCBzbyBy
ZW1vdmUgc2QtdWhzLXNkcjUwIGZyb20gdGhlIGNvbW1vbiBkdHNpCj4+IHRvIHNpbGVuY2UgdGhl
IGVycm9yLCB0aGVuIChyZSlhZGQgaXQgdG8gdGhlIFZJTTNMIGR0cy4KPj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzaXRhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+IAo+
IEZpeGVzPwo+IAo+IEtldmluCgpJ4oCZbGwgcmVzZW5kIHYyIHdpdGggdGhlIGZpeGVzIHRhZyhz
KS4gVGhhbmtzLgoKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
