Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8245C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 12:14:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1456B2389E
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 12:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3dJDEB+5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="Ka2QDCWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1456B2389E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a+UncgmsMOBOUU1Q52ywvTWDYAfmHSFq/AqbDzeE+og=; b=3dJDEB+59uhz+z+QNaDW7BXV9
	hUeUKI1DDmOHOorIOQny447uJQeb8RVjz84SbvNrvD+ot5gK6zZsJG34XbXnE57UrmitJfJihqeyu
	7WcAcfsGoPw2MfVr5naxOwLMgMBO+BF/QbV8/NE8ihHmoWg97UrM17l0cjq9vPtDyDy3rUHPWsR2U
	mNX7dfxf/qNadFR1IcaXU1Ej0VpUouj7DR6xK7mqK01EA2pd6SAFBnFVidt1PTlUlARB+SrnU90UC
	1qus7SQkkqNZ2Y6Qfdmg/lGf9Ng2k1BQXA4NgtauSL3yZbYC6rNx9CS3VdQz9TM57zlFURln7+4t1
	Vc6Dm2hCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM95W-000633-SJ; Sat, 26 Sep 2020 12:14:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM95U-00062U-2b
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 12:14:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id x16so3838076pgj.3
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aRXjYNPvAllPLssAHFUtgdpWvskcOPt9BvCCI5W6OtA=;
 b=Ka2QDCWgyF4jROThlTol1M5vTtwbiqi4LO/EVRotYTxBJa1C/tMH8FdKgjnEYC19zJ
 G6Fx8w4z8QsN8X5o+1dH9EBvmmyIp0x+a7fGR/nOq5xiHvAXu/WaLZo0CxlaGHiE4E3r
 Rqkd/xhG8bTMonE93mkRb42DKW+oVBqOjERjHngcdE0HaNRTGl8fG+6G7FhUrwbiQKvV
 NlODNQS2WyXJLCeBr9jGQfjcBSVss6VcJQpijYByZENLads2kYZtRrdWIt5pVg4PKFqn
 OFl9vdvRFBhCnIqHeLvk30bHRYawE+Hh6RdtqgK+ubwKeIY6cVwLZ0/wo0IWrMIXJFQA
 ewJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aRXjYNPvAllPLssAHFUtgdpWvskcOPt9BvCCI5W6OtA=;
 b=aMywcpHc6JE6fCxkQtcERFUW2wCwdnjRnvFz16EQi2kJcIPgCqWRgahZofmoqdYbzQ
 O9BBilY4wRGXQHbWvwwYW1WA46boNH3rZA/qmlOP8mJcmtkx2zsE70Ntyt7dv0VE5A1D
 Bzev7V5Ip3YrgC2KDvyqTVzUoaT/FrzoJlOuIeGZzUbR7lVZ3bddSuhGTWN+N/EJ78O3
 1kIjhWCVcZ837hm5AgjmTDbuwoRUMRZjVafn64xgrunCprLW3Xf9Q0SlQ+fzhsb5/kqZ
 AFiI8GawSV1FHaqrMqzZXINHDwzjDrGYgcy04wd0BpmHQZ7rK7IBunLoRfY0L4p0BNEA
 OXMA==
X-Gm-Message-State: AOAM5318RYe1oDtxBnBoGZ5dO+mka1ip9uNc3Vx5yTX5cNZbf6KxTrba
 RaXc9hHemJLLUNWXkx/dKSx7SA==
X-Google-Smtp-Source: ABdhPJzBir37uzxTY1+XemYaduPLOJdPSP7mTT1f5/5h2CUIjJ+5isOPmF/PCvy93XO0y3tSQ9AT0w==
X-Received: by 2002:a63:4945:: with SMTP id y5mr2532416pgk.181.1601122437798; 
 Sat, 26 Sep 2020 05:13:57 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id i62sm5571842pfe.140.2020.09.26.05.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 05:13:57 -0700 (PDT)
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
To: Christian Hewitt <christianshewitt@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
 <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
Date: Sat, 26 Sep 2020 06:13:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_081400_135007_752E479E 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, furkan@fkardame.com,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gOS8yNi8yMCA1OjU1IEFNLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+Pgo+PiBPbiAyNiBT
ZXAgMjAyMCwgYXQgMjo1MSBwbSwgSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPiB3cm90ZToK
Pj4KPj4gT24gOS8yNi8yMCAxOjU1IEFNLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+Pj4gSSBh
bSB1c2luZyBhbiBBUk0gU0JDIGRldmljZSB3aXRoIEFtbG9naWMgUzkyMlggY2hpcCAoQmVlbGlu
awo+Pj4gR1MtS2luZy1YLCBhbiBBbmRyb2lkIFNUQikgdG8gYm9vdCB0aGUgS29kaSBtZWRpYWNl
bnRyZSBkaXN0cm8KPj4+IExpYnJlRUxFQyAod2hpY2ggSSB3b3JrIG9uKSBhbHRob3VnaCB0aGUg
aXNzdWUgaXMgYWxzbyByZXByb2R1Y2libGUKPj4+IHdpdGggTWFuamFybyBhbmQgQXJtYmlhbiBv
biB0aGUgc2FtZSBoYXJkd2FyZSwgYW5kIHdpdGggdGhlIEdULUtpbmcKPj4+IGFuZCBHVC1LaW5n
IFBybyBkZXZpY2VzIGZyb20gdGhlIHNhbWUgdmVuZG9yIC0gYWxsIHRocmVlIGRldmljZXMgYXJl
Cj4+PiB1c2luZyBhIGNvbW1vbiBkdHNpOgo+Pj4KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3
aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWcxMmItZ3NraW5nLXguZHRzCj4+PiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0
dC9saW51eC9ibG9iL2FtbG9naWMtNS45LWludGVnL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTJiLWd0a2luZy1wcm8uZHRzCj4+PiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0
dC9saW51eC9ibG9iL2FtbG9naWMtNS45LWludGVnL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTJiLWd0a2luZy5kdHMKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xp
bnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWcxMmItdzQwMC5kdHNpCj4+Pgo+Pj4gSSBoYXZlIHNjaGVtYXRpY3MgZm9yIHRoZSBkZXZp
Y2VzLCBidXQgY2FuIG9ubHkgc2hhcmUgdGhvc2UgcHJpdmF0ZWx5Cj4+PiBvbiByZXF1ZXN0Lgo+
Pj4KPj4+IEZvciB0ZXN0aW5nIEkgYW0gYm9vdGluZyBMaWJyZUVMRUMgZnJvbSBTRCBjYXJkLiBU
aGUgYm94IGhhcyBhIDRUQgo+Pj4gU0FUQSBkcml2ZSBpbnRlcm5hbGx5IGNvbm5lY3RlZCB3aXRo
IGEgVVNCID4gU0FUQSBicmlkZ2UsIHNlZSBkbWVzZzoKPj4+IGh0dHA6Ly9peC5pby8yeUxoIGFu
ZCBJIGNvbm5lY3QgYSBVU0Igc3RpY2sgd2l0aCBhIDRHQiBJU08gZmlsZSB0aGF0IEkKPj4+IGNv
cHkgdG8gdGhlIGludGVybmFsIFNBVEEgZHJpdmUuIFdpdGhpbiAxMC0yMCBzZWNvbmRzIG9mIHN0
YXJ0aW5nIHRoZQo+Pj4gY29weSB0aGUgYm94IGRlYWRsb2NrcyBuZWVkaW5nIGEgaGFyZCBwb3dl
ciBjeWNsZSB0byByZWNvdmVyLiBUaGUKPj4+IHRpbWluZyBvZiB0aGUgZGVhZGxvY2sgaXMgdmFy
aWFibGUgYnV0IHRoZSBkZXZpY2UgX2Fsd2F5c18gZGVhZGxvY2tzLgo+Pj4gQWx0aG91Z2ggSSBh
bSB1c2luZyBhIHNpbXBsZSBjb3B5IHVzZS1jYXNlLCB0aGVyZSBhcmUgc2ltaWxhciByZXBvcnRz
Cj4+PiBpbiBBcm1iaWFuIGZvcnVtcyBwZXJmb3JtaW5nIHRhc2tzIGxpa2UgaW5zdGFsbHMvdXBk
YXRlcyB0aGF0IGludm9sdmUKPj4+IEkvTyBsb2Fkcy4KPj4+Cj4+PiBGb2xsb3dpbmcgYWR2aWNl
IGluIHRoZSAjbGludXgtYW1sb2dpYyBJUkMgY2hhbm5lbCBJIGFkZGVkCj4+PiBDT05GSUdfU09G
VExPQ0tVUF9ERVRFQ1RPUiBhbmQgQ09ORklHX0RFVEVDVF9IVU5HX1RBU0sgYW5kIHdhcyBhYmxl
IHRvCj4+PiBnZXQgb3V0cHV0IG9uIHRoZSBIRE1JIHNjcmVlbiAoaXQgaXMgbm90IHBvc3NpYmxl
IHRvIGNvbm5lY3QgdG8gVUFSVAo+Pj4gcGlucyB3aXRob3V0IGRlc3Ryb3lpbmcgdGhlIGJveCBj
YXNlKS4gSWYgeW91IGFkdmFuY2UgdGhlIGZvbGxvd2luZwo+Pj4gdmlkZW8gZnJhbWUgYnkgZnJh
bWUgaW4gVkxDIHlvdSBjYW4gc2VlIHRoZSBvdXRwdXQ6Cj4+Pgo+Pj4gaHR0cHM6Ly93d3cuZHJv
cGJveC5jb20vcy9rbHZjaXppbThjczVsemUvbG9ja3VwX2NsaXAubW92P2RsPTAKPj4KPj4gVHJ5
IHdpdGggdGhpcyBwYXRjaDoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxv
Y2svMjAyMDA5MjUxOTE5MDIuNTQzOTUzLTEtc2hha2VlbGJAZ29vZ2xlLmNvbS8KPiAKPiBJdCBz
dGlsbCBsb2NrcyB1cCBhcHByb3guIDI1IHNlY29uZHMgaW50byB0aGUgY29weSBvcGVyYXRpb24u
IEhlcmXigJlzIHRoZSBvdXRwdXQgaW4gdmlkZW8gYWdhaW4gKGEgbGl0dGxlIGJsdXJyeSk6Cj4g
Cj4gaHR0cHM6Ly93d3cuZHJvcGJveC5jb20vcy8zajJjemFxNTA5YXJnNmcvbG9ja3VwX2NsaXAy
Lm1vdj9kbD0wCgpDYW4geW91IHRyeSBhbmQgc2V0IENPTkZJR19TTFVCIGluIHlvdXIgLmNvbmZp
ZyBpbnN0ZWFkIG9mIENPTkZJR19TTEFCPwoKQWxzbywganVzdCB0YWtlIGEgcGljdHVyZSwgc2hv
dWxkIGJlIGVhc2llciB0byBnZXQgcmVhZGFibGUgdGhhbiBhIHZpZGVvLgpBbmQgdGhlIHN0YXRp
YyB0cmFjZSBpcyBhbGwgdGhhdCBpcyBuZWVkZWQuCgotLSAKSmVucyBBeGJvZQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
