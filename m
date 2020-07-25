Return-Path: <SRS0=MxIh=BE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CECAC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Jul 2020 06:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD72206D8
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Jul 2020 06:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nvn2aTZw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=telus.net header.i=@telus.net header.b="XjjpJ0XK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD72206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=telus.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6NPIRoZ9js+F483cNm07dXnisCsOg57SbhzqJ2kMBc0=; b=nvn2aTZwTqgqRhWp+Qq5oN3Ig
	XAkheKsQ3PxE0aLc6mjUKaPdM+n58VlE+vkOzQqFazJn8HB72/rk6CnzpjJhcPENVD9M9BaTemC7U
	jzHTZS6t3Af79UytmieAJw8AjUZe5DHI6a8BJfDYpflFoIbh6fQTzUeGUa/yBFrhYhbqWypT3LTrk
	ZJmOcdaFowMPxkYN9+27RW7O7sDTa1LIeH6RMJ0PHvcHCvvotJpBJS/yLxyocJ1s2PBOZKNs0s5Oe
	iryhtpwssOmVCNZA5fc4KhdulKhyA4/UQFGSVNKRtJK4P96JbbIlXwXBzp8/2JuIugTW1+4WSdC4X
	0yI2CZvOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzDEt-00078C-O8; Sat, 25 Jul 2020 06:00:55 +0000
Received: from cmta20.telus.net ([209.171.16.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzDEq-00076I-QL
 for linux-amlogic@lists.infradead.org; Sat, 25 Jul 2020 06:00:54 +0000
Received: from [192.168.1.209] ([173.180.110.58]) by cmsmtp with SMTP
 id zDEkjk5zcljNxzDEljW0tA; Sat, 25 Jul 2020 00:00:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telus.net; s=neo;
 t=1595656848; bh=sZggzFN6k3juphxvK1+74Zq7kmWFBtt8K/Bs1SKEsWI=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=XjjpJ0XK1z5twKElFAco7q7EFPOjIE5uL7CE94f8hc1+d1xOPvsHF3z2XQApNiavi
 f1UmEq8lXxvLfbrP1H5WfvF4EWbLWXNl5tVnI75h3CMqdjs3SXpU9b+mJLZHMO38F0
 B7HHEGMWHwhat/iuF8mcFJFhx8Ed08JClDEdCz/ELLxA77yoUQpuxrYm5buHs2x5PC
 rkdfkaw1KcNe0rFMUIVapv1j2n1Lxwz6/aC+zmM+Oi6PBnnAX88+v7RV9WSks6Hv84
 fS6nNAqEkN3JqtzhhEyT/8be9XfdbaF9AsOsPNnTefClrMGTUpVnyQ2+3BSNASbcpO
 PyrnARR6WF5+Q==
X-Telus-Authed: YTZiMDQzOTM=
X-Authority-Analysis: v=2.3 cv=Z8aS40ZA c=1 sm=1 tr=0
 a=TGg0qk4LsF+PfxzQJA4TSg==:117 a=TGg0qk4LsF+PfxzQJA4TSg==:17
 a=IkcTkHD0fZMA:10 a=aatUQebYAAAA:8 a=JfrnYn6hAAAA:8 a=Jozsuq5hV7MS9ukgvVMA:9
 a=QEXdDO2ut3YA:10 a=7715FyvI7WU-l6oqrZBK:22 a=1CNFftbPRP8L7MoqJWF3:22
Subject: Re: GPIO Interrupts
To: linux-amlogic@lists.infradead.org
References: <1356858918.38098893.1595529644632.JavaMail.zimbra@mailid.telus.net>
 <a212ea3d-dc08-73e6-0706-79c01d0be377@baylibre.com>
From: E Honsch <honsch@telus.net>
Message-ID: <482a6743-db2a-c66f-f644-f139a0ae0d8a@telus.net>
Date: Fri, 24 Jul 2020 23:00:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a212ea3d-dc08-73e6-0706-79c01d0be377@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfC9k2gc/1U9vLbUsvM6TW2Iok9W1MOBs1B/LXBRcGEd7+8w4EnE9Bvf9hzQB593iX6ZAUd/ODLY0Exf7hnL75XP3U99tun8MslwZCPWgEBAtpZwxA/he
 66bCS6X8ssK95in/tyY5pYPxSpeQxIJ1PsbraVZR2mswM33Q9RVlOmjGZtvZorKYwmSvRIZfUTVkww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_020052_977492_68DD3E3F 
X-CRM114-Status: GOOD (  18.81  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TmVpbCwKClRoYW5rcyBmb3IgdGhlIHZlcmlmaWNhdGlvbiBvZiB0aGUgc3RhdGUgb2YgdGhlIHN5
c3RlbS7CoCBBcmUgdGhlcmUgCmludGVyZXN0aW5nIHN0b3JpZXMgYmVoaW5kIHRoZSBoaXN0b3Jp
Y2FsIHJlYXNvbnMgaXQncyBicm9rZW4/CgpJIGRpZCBnZXQgdGhlIGludGVycnVwdHMgdG8gd29y
ayB0b25pZ2h0LCBzbyB0aGVyZSdzIHRoYXQuCgpJIGp1c3Qgd2lzaCBJIGRpZG4ndCBoYXZlIHRv
IG1vZGlmeSB0aGUgZHJpdmVycyB0byBnZXQgaXQgdG8gd29yay4KClRoYW5rcyBhZ2Fpbi4KCgpF
cmljCgpPbiAyMDIwLTA3LTI0IDE6MDUgYS5tLiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGks
Cj4KPiBPbiAyMy8wNy8yMDIwIDIwOjQwLCBob25zY2hAdGVsdXMubmV0IHdyb3RlOgo+PiBIaSB0
aGVyZSwKPj4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gYSBPRHJvaWQgQzIgcHJvamVjdCBmb3IgYSB3
aGlsZSwgKG1lc29uLCBneGJiKSBhbmQgSSBjYW5ub3QgZ2V0IGdwaW8gaW50ZXJydXB0cyB3b3Jr
aW5nIGZyb20gdGhlIGRldmljZXRyZWUuCj4+Cj4+IEknbSB0cnlpbmcgdG8gaG9vayB1cCB0aGUg
UFBTIGdwaW8gZHJpdmVyIGFzIHdlbGwgYXMgc29tZSBncGlvIElJTyB0cmlnZ2Vycy4gIEkgaGFk
IGl0IGFsbCB3b3JraW5nIG9uIGEgNC54IGtlcm5lbCBhIGNvdXBsZSBvZiB5ZWFycyBhZ28gYnV0
IG9uIHRoZSA1LjcgaXQncyBhIG5vLWdvLgo+Pgo+PiBUaGUgcGluY3RybC1tZXNvbiBkcml2ZXIg
aXMgbWlzc2luZyB0aGUgaG9vayBmb3IgZ3Bpb2RfdG9faXJxKCksIGFuZCB0aGUgaXJxLW1lc29u
LWdwaW8gZHJpdmVyIGlzIG1pc3NpbmcgdGhlIGFjdGl2YXRlIGZ1bmN0aW9uIGZvciBwbGF0Zm9y
bV9nZXRfaXJxKCkgdG8gZnVuY3Rpb24uCj4+Cj4+IEhhcyBlaXRoZXIgb2YgdGhlc2UgcGF0aHMg
ZXZlciBiZWVuIGltcGxlbWVudGVkIG9yIHRlc3RlZD8gIEFtIEkgbWlzc2luZyBzb21ldGhpbmcg
c2ltcGxlPwo+IFRoZSBvbmx5IGF2YWlsYWJsZSBkcml2ZXIgZm9yIEdQSU8gaW50ZXJydXB0cyBp
cyBpcnEtbWVzb24tZ3BpbyBhbmQgc2hvdWxkIGJlIGVub3VnaCBmb3IgbW9zdCBvZiB5b3VyIHVz
ZS1jYXNlcwo+IGlmIHlvdSBwYXNzIHRoZSBHUElPIGludGVycnVwdCBhcyBgaW50ZXJydXB0ID0g
YCBhbmQgYGludGVycnVwdC1wYXJlbnQgPWAgYXMgd2UgZG8gZm9yIHRoZSBFdGhlcm5ldCBQSFkg
b24gc29tZQo+IGJvYXJkcy4KPgo+IEZvciBoaXN0b3JpY2FsICYgSFcgYXJjaGl0ZWN0dXJlIHJl
YXNvbnMsIGl0J3Mgbm90IHBvc3NpYmxlIHRvIGltcGxlbWVudCB1cHN0cmVhbSBzdXBwb3J0IGZv
ciB0aGUgZ3Bpb2RfdG9faXJxKCkgaW4gdGhlIHBpbmN0cmwgZHJpdmVyLgo+Cj4gTmVpbAo+Cj4+
IFRoYW5rcy4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4gbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo+Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
