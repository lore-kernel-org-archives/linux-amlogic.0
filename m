Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F9BC4363C
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 16:47:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B3E20719
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 16:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2SXeP4Gr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a1gXL5to"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B3E20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=InrHtS6HQlKzPhL8vQmOcxxcXyMHcww4Rj+5NW/Oooc=; b=2SXeP4Gr6zMQrTj0yzLNIULhi
	z4dM9Uk3jEGTzokThtiN3NajbLb1dY4MVKK9CnFpY+9lsEr0+oH3Aue7v3B3S2jE57WfZjmqPNMoQ
	xI1ejeqA81GV0fzGQVdZdSQtWJW7wsFulitIKl7lL3vQoeshX3YChDcFp4o9uZwGv0OfPHvIM+Q6/
	JpoND6gQIlhQD+OwoobiiHCaUGlTYBicrjYShH5aqIMZY4Nd9b2ytbveXZoo3P1PHnYn4cATlEv7V
	gBFHieKKAA05NYpn584Ntt1dZ3g7jZ9qFpajLPsb9Cf2PZkNx2ybs3IxZ4cayfDGJEcTCZZkHc5lE
	YFnU2/bcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOODM-0000mY-KI; Fri, 02 Oct 2020 16:47:24 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOODH-0000jf-3r
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 16:47:20 +0000
Received: by mail-io1-xd44.google.com with SMTP id g7so2203269iov.13
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Li4M3GK5y6x0SzTfqjxLLA9AT+ROiUGVRcFqRzm5Djg=;
 b=a1gXL5toNpXLmacnL7yhtJtYu+HmO+zq2HSfVRcyZ9z5aGYPOUMcOsxSjRxLjTiwhj
 zJBgESeE1qI3ToOAsK8MZWwKmHt51a3nMoD6FLDGupRKEjHEktpPC4yX8sNz7w/nKYtr
 hL0t3LhSNNDXOlNOrlInWA796iaMFGVw4FjQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Li4M3GK5y6x0SzTfqjxLLA9AT+ROiUGVRcFqRzm5Djg=;
 b=JCfmGJ39w1zNbTurZLHBpH5zxdHmHGDtZkNiJnAythqeoA/NiaQ2H61PHcXfsGN33a
 ALJJXvmYRlqs6XaxX5K2S9AnNvMXOJkry1ZQ7qJxTVasFGCXaHpA9DCDYqfCSM0i1P9q
 D1Drf5l2hzlf0gWhdZ9EOyfDZxSj7QVg+8ktxiUPh2QRpUS6qxml1P5qW24R6kyNRhSW
 K+B97Suwp5zYaSf8IWgEA4EY2VSlSO5Svg7krSYWMhsOYB3y7LEm3FazUsbvcjTiKR9D
 sZIyRtgm3Bh4Cm4035veHlw4BZyjriL/tmEQW751E7dz+d6bDN1m3BscZ9wiPvo0ydqj
 yREA==
X-Gm-Message-State: AOAM533HpAPehBGxq+uRBig0y+5+h8yMb/ILeMEJ21S8EIH3CXkytdpL
 adN3/Aymvxe15Co2NlX+jXy8vw==
X-Google-Smtp-Source: ABdhPJzrfRpNIYzV2uFrhJdCHt/QTSYBKDnpK2pS6zKI5Da6BP91uaqOQt3S2LEYZ+yKmaDKjo66AQ==
X-Received: by 2002:a05:6638:10e9:: with SMTP id
 g9mr2960820jae.139.1601657236070; 
 Fri, 02 Oct 2020 09:47:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id h2sm932771ioj.5.2020.10.02.09.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 09:47:15 -0700 (PDT)
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
 <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
 <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <81b94c3a-43d6-c9f5-0bc0-43bf65b3d5fc@linuxfoundation.org>
Date: Fri, 2 Oct 2020 10:47:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_124719_216647_3731A346 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
 =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 drbd-dev@tron.linbit.com, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gOS8yOS8yMCA3OjQyIEFNLCBTaHVhaCBLaGFuIHdyb3RlOgo+IE9uIDkvMjkvMjAgNzozNCBB
TSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+IE9uIFR1ZSwgMjAyMC0wOS0yOSBhdCAxNDo0NyArMDIw
MCwgSnVsaWEgTGF3YWxsIHdyb3RlOgo+Pj4gT24gVHVlLCAyOSBTZXAgMjAyMCwgRGFuIENhcnBl
bnRlciB3cm90ZToKPj4+PiBUaGUgdGltZXMgd2hlcmUgY29tbWFzIGFyZSB1c2VkIGRlbGliZXJh
dGVseSB0byByZXBsYWNlIGN1cmx5IGJyYWNlcyAKPj4+PiBhcmUKPj4+PiBqdXN0IGV2aWwuwqAg
RWl0aGVyIHdheSB0aGUgY29kZSBpcyBjbGVhbmVyIHdpdGggc2VtaS1jb2xvbnMuCj4+Pgo+Pj4g
SSBhbHNvIGZvdW5kIGV4YWFtcGxlcyBsaWtlIHRoZSBmb2xsb3dpbmcgdG8gYmUgcGFydGljdWxh
cmx5IHVuZm9ydW5hdGU6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcHJpbnRmKHN0ZGVyciwKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJwYWdlX25yICVsdSB3cm9uZyBjb3VudCAlTHUgCj4+PiAlTHVc
biIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZV9uciwgY291bnQsCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY291bnRfdmVyaWZ5W3BhZ2VfbnJdKSwgZXhpdCgxKTsKPj4+Cj4+PiBU
aGUgZXhpdCBpcyB2ZXJ5IGhhcmQgdG8gc2VlLCB1bmxlc3MgeW91IGtub3cgdG8gbG9vayBmb3Ig
aXQuCj4+Cj4+IEkgc2VudCB0aGF0IHBhdGNoIGxhc3QgbW9udGguCj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MzQ4NzcvCj4+Cj4gCj4gSSBzZWUgd2hhdCBoYXBwZW5l
ZC4gVGhpcyBwYXRjaCB0b3VjaGVzIGxpYiwgY3B1cG93ZXIsIGFuZCBzZWxmdGVzdHMuCj4gR3Vl
c3MgbG9zdCBpbiB0aGUgbGltYm8gb2Ygd2hvIHRha2VzIGl0Lgo+IAo+ICDCoHRvb2xzL2xpYi9z
dWJjbWQvaGVscC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEw
ICstCj4gIMKgdG9vbHMvcG93ZXIvY3B1cG93ZXIvdXRpbHMvY3B1ZnJlcS1zZXQuY8KgwqAgfMKg
IDE0ICstCj4gIMKgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIHzC
oCAxOCArLQo+ICDCoHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3VzZXJmYXVsdGZkLmPCoMKg
IHwgMjk2ICsrKysrKysrKysrKystLS0tLS0tLQo+ICDCoDQgZmlsZXMgY2hhbmdlZCwgMjEwIGlu
c2VydGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkKPiAKPiBJIGNhbiB0YWtlIGl0IHRocm91Z2gg
b25lIG9mIG15IHRyZWVzLgo+IAoKUmFmYWVsLCBBbmRyZXcsCgpUaGlzIHBhdGNoIGlzIG5vdyBh
cHBsaWVkIHRvCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3NodWFoL2xpbnV4LWtzZWxmdGVzdC5naXQgCmZpeGVzIGJyYW5jaC4KClRoaXMgc3BhbnMgcG0s
IGtzZWxmdGVzdC1tbSB0ZXN0cyBhbmQgdG9vbHMvbGliIGFuZCBoYXMgYmVlbgppbiBsaW1ibyBm
b3IgYSBmZXcgd2Vla3MgZm9yIHRoYXQgcmVhc29uLgoKSSBkZWNpZGVkIHRvIHRha2UgdGhpcyB0
aHJvdWdoIGtzZWxmdGVzdCB0cmVlIHRvIGF2b2lkIGhhdmluZwpKb2Ugc3BsaXQgdGhlIHBhdGNo
ZXMuCgp0aGFua3MsCi0tIFNodWFoCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
