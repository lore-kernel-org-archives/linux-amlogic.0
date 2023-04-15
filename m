Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8637C77B71
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Apr 2023 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiM7te+tmCEMJVD6N361m58TkkF9E3QvN8+YlmULumU=; b=3UmWdqbk0Z61Vq
	SagZLYtiEXGsGZ3/EDWFTV0vZ8yEXGT8CQolu+dbuDaZ2k2BXfYOEypKQ5MpM2vyhhSK52LucgB7z
	TekVXya3NybiiVy9Nk6UQV3itfOl3xpkjoImWyqMjOUUMO0xaRl2myIDKsGjlA/s1a8/oH81O3U3a
	PZjQyQnxNR2bf/gSP8mTzZSHkn/10wrXkyXuOH5zA9iV+hGSv3gn4vQp/ftkKKGTVFXJQ3u++nF4h
	GOa4mVlO+fFX4PGYdak9uq+YMqg5PwxnvHZO+WHTwmV21Epr4BbesiN0tMGfcPweAyrtHjJ5E8cu6
	n0WbHEuGexsyHKdlNUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnZZJ-00BTDA-2K;
	Sat, 15 Apr 2023 06:39:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnZZF-00BTC6-1R;
	Sat, 15 Apr 2023 06:39:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id si1so20874608ejb.10;
        Fri, 14 Apr 2023 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681540762; x=1684132762;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBQSN+fAxZoAVm5Rkojym6pn+56SmKTpupeGE0Al3bY=;
        b=Minq1Rmt2+PdKP7THoyit0oHLfDmeGI7SUXx2ipKJ4KER2HxM3M5Ktgr8f7XK36Wr7
         dvfmrVCBxn4VYYk5VGQoZFv+sp1L66XMOTHB0BtyPrimh4AA1TEKWurmpr9mii+qTYag
         DT+CoJwvl7zancRMboxxGDLEwf0FxOKWi0FUBfEJajKhaA2FI1fwNTASVfvZSS9bEvv4
         IlBc+iOFNCXlV67bQyYandhhLViU2OvicX53NP2oP9HqX6WqegAQYyxpJ2SsC+BrFSGu
         +koMJFEDXLZFifLLRM6gWexouv7iR5hceQ9Avv0HEirVBp142yNvicIkd4eWF7kBDmmM
         lLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681540762; x=1684132762;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBQSN+fAxZoAVm5Rkojym6pn+56SmKTpupeGE0Al3bY=;
        b=jCRFTA00U3iEi+Xkgvdq7CIG1K8ALM5Ych83dEAWolVZZ0ZQ5IAU5KZ57mo0k3jS0f
         eJitA6Rxl+yIG1v3i1eBdalv2Dn2JwaJDeSNid1CDOVsQAVfvn5mEUR7xUaaGCOnARvZ
         WlOgT+yzzeyyx7F6dINS3Vqib0/KA9R/tnTp4Lsj1hhSLz7MP2azDAU6Z30BHXJ9q65H
         vRNYh3T8RD0xH/gbr8lNv5EHrsJ9k8q9RAGfeJZfncIdGmpD4twsqIM+KRHtjf9UOeyg
         XdY0GjOhsW9SoesiPuE/H11n3zFTXZVZvl1yha2ZD1Z00FAZZBJQ+WQt6R9zPZT/t7BQ
         A3BA==
X-Gm-Message-State: AAQBX9f/oLjX4kaLHYgyQZsXCxEn+ltbn7UoiVZmFgyql5qUfBrpc71y
	ighAYD2Dg3PNYunHhYtMeJU=
X-Google-Smtp-Source: AKy350bN9gMdbrkdLPw7CLCEb1iIMSs6wuuJRE1Z+JNcoAXk1VKW+sKTr4TflNn4I0DxTpkMZoBfzw==
X-Received: by 2002:a17:906:d8a9:b0:947:72bd:f72a with SMTP id qc9-20020a170906d8a900b0094772bdf72amr1171861ejb.72.1681540761989;
        Fri, 14 Apr 2023 23:39:21 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76c9:5300:c449:604e:39a7:3bce? (dynamic-2a01-0c22-76c9-5300-c449-604e-39a7-3bce.c22.pool.telefonica.de. [2a01:c22:76c9:5300:c449:604e:39a7:3bce])
        by smtp.googlemail.com with ESMTPSA id lv25-20020a170906bc9900b0094a77168584sm3310109ejb.125.2023.04.14.23.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 23:39:21 -0700 (PDT)
Message-ID: <4b328dab-5f96-e5d0-3181-ce059d11b04b@gmail.com>
Date: Sat, 15 Apr 2023 08:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
 <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
In-Reply-To: <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_233925_509976_F96FB408 
X-CRM114-Status: GOOD (  25.73  )
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

T24gMTQuMDQuMjAyMyAyMTozOSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIZWxsbyBI
ZWluZXIsCj4gCj4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgNzo1NeKAr0FNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+IFsuLi5dCj4+IFRlc3RlZC1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
PiBVbmZvcnR1bmF0ZWx5IEkgaGF2ZSBzb21lIGJhZCBuZXdzIGFuZCBJIG5lZWQgdG8gdGFrZSBi
YWNrIG15IFRlc3RlZC1ieSA6LSgKPiBQcmV2aW91c2x5IG15IHRlc3Qgd2FzOiBjeWNsZSB0aHJv
dWdoIGFsbCBhdmFpbGFibGUgQ1BVIGZyZXF1ZW5jaWVzCj4gd2hpbGUgc3RyZXNzaW5nIHRoZSBD
UFUuCj4gTXkgYXNzdW1wdGlvbiB3YXM6IGlmIHRoZSBzeXN0ZW0gZG9lc24ndCBsb2NrIHVwIGV2
ZXJ5dGhpbmcncyBmaW5lCj4gYmVjYXVzZSB3ZSBoYXZlIGEgaGlnaCBlbm91Z2ggdm9sdGFnZS4K
PiAKPiBUaGlzIGV2ZW5pbmcgaG93ZXZlciBJIGdvdCBhIG1lbW9yeSBjb3JydXB0aW9uIGVycm9y
IHdoaWxlIHRyeWluZyB0bwo+IGxvZyBpbiB2aWEgVUFSVCAtIHdoaWNoIEkgdGhvdWdodCB3YXMg
c3RyYW5nZS4KPiBTbyBJIGNvbm5lY3RlZCBteSBsb2dpYyBhbmFseXplciB0byBteSBPZHJvaWQt
QzEgYW5kIGRpZCBzb21lIGV4cGVyaW1lbnRzOgo+IAo+IHBlcmlvZCA9IDMwNTE4LCBkdXR5IGN5
Y2xlID0gMTUyNTkgKHR5cGljYWxseSB1c2VkIGZvciB0aGUgMzJrSHoKPiBvdXRwdXQgdG8gdGhl
IFNESU8gd2lmaSBjaGlwKQo+IGJlZm9yZSB5b3VyIHBhdGNoZXMgLyBhZnRlciBhcHBseWluZyB5
b3VyIHBhdGNoZXM6Cj4gUFdNOiBkdXR5IGN5Y2xlOiA1MC4wMDAwMDAlIC8gNTAuMDAwMDAwJQo+
IFBXTTogcGVyaW9kOiAzMC42IMK1cyAvIDMwLjUgwrVzCj4gVGltaW5nOiBUaW1lOiAxNS4yOTIg
wrVzICg2NS4zOTUga0h6KSAvIDE1LjI1MCDCtXMgKDY1LjU3NCBrSHopCj4gVGltaW5nOiBBdmVy
YWdlOiAxNS4yOTYgwrVzICg2NS4zNzcga0h6KSAvIDE1LjI2NCDCtXMgKDY1LjUxMyBrSHopCj4g
ZHJpdmVyIGRlYnVnIG1lc3NhZ2VzIHdpdGggeW91ciBwYXRjaGVzIGFwcGxpZWQ6Cj4gZmluX2Zy
ZXE6IDg1MDAwMDAwMCBIego+IHBlcmlvZD0zMDUxOCBjbnQ9MjU5NDAKPiBkdXR5PTE1MjU5IGR1
dHlfY250PTEyOTcwCj4gCj4gVGhlbiBJIHRyaWVkIHBlcmlvZCA9IDEyMjE4LCBkdXR5IGN5Y2xl
ID0gMCAodHlwaWNhbGx5IHVzZWQgZm9yIHRoZQo+IGhpZ2hlc3QgQ1BVIHZvbHRhZ2UpOgo+IGJl
Zm9yZSB5b3VyIHBhdGNoZXMgLyBhZnRlciBhcHBseWluZyB5b3VyIHBhdGNoZXM6Cj4gUFdNOiBk
dXR5IGN5Y2xlOiAwLjMzODk4MyUgLyBuL2EgKGNvbnN0YW50IGxvdyBvdXRwdXQpCj4gUFdNOiBw
ZXJpb2Q6IDEyLjMgwrVzIC8gbi9hCj4gVGltaW5nOiBUaW1lOiAxMi4yNTAgwrVzICg4MS42MzMg
a0h6KSAvIG4vYQo+IFRpbWluZzogQXZlcmFnZTogNi4xNDggwrVzICgxNjIuNjY4IGtIeikgLyBu
L2EKPiBkcml2ZXIgZGVidWcgbWVzc2FnZXMgd2l0aCB5b3VyIHBhdGNoZXMgYXBwbGllZDoKPiBm
aW5fZnJlcTogODUwMDAwMDAwIEh6Cj4gcGVyaW9kPTEyMjE4IGNudD0xMDM4NQo+IApXaXRoIGEg
ODUwTUh6IGlucHV0IGNsb2NrIHdlIHNob3VsZCBzZWUgYSAwLjAxJSBkdXR5IGN5Y2xlIHdpdGgg
MS4ybnMKY2xvY2sgcHVsc2VzLiBDYW4gd2UgcnVsZSBvdXQgYW4gaXNzdWUgd2l0aCB0aGUgbWVh
c3VyaW5nIGVxdWlwbWVudD8KSXMgeW91ciBsb2dpYyBhbmFseXplciBhYmxlIHRvIGRpc3BsYXkg
c3VjaCBzaG9ydCBjbG9jayBwdWxzZXM/Cgo+IEZpbmFsbHkgSSB0cmllZCBwZXJpb2QgPSAxMjIx
OCwgZHV0eSBjeWNsZSA9IDEyMjE4ICh0eXBpY2FsbHkgdXNlZCBmb3IKPiB0aGUgbG93ZXN0IENQ
VSB2b2x0YWdlKToKPiBiZWZvcmUgeW91ciBwYXRjaGVzIC8gYWZ0ZXIgYXBwbHlpbmcgeW91ciBw
YXRjaGVzOgo+IFBXTTogZHV0eSBjeWNsZTogOTkuNjYxMDE3JSAvIG4vYSAoY29uc3RhbnQgbG93
IG91dHB1dCkKPiBQV006IHBlcmlvZDogMTIuMyDCtXMgLyBuL2EKPiBUaW1pbmc6IFRpbWU6IDEy
LjI1MCDCtXMgKDgxLjYzMyBrSHopIC8gbi9hCj4gVGltaW5nOiBBdmVyYWdlOiA2LjE0OCDCtXMg
KDE2Mi42Njgga0h6KSAvIG4vYQo+IGRyaXZlciBkZWJ1ZyBtZXNzYWdlcyB3aXRoIHlvdXIgcGF0
Y2hlcyBhcHBsaWVkOgo+IGZpbl9mcmVxOiA4NTAwMDAwMDAgSHoKPiBwZXJpb2Q9MTIyMTggY250
PTEwMzg1Cj4gCkhlcmUgSSBoYXZlIG5vIGlkZWEgeWV0LgoKPiBBZnRlciBzZWVpbmcgdGhlIGNv
bnN0YW50IGxvdyBvdXRwdXQgd2l0aCBwZXJpb2QgMTIyMTggSSByZWFsaXplZCB0aGF0Cj4gbXkg
cHJldmlvdXMgdGVzdCB3YXMgbm8gZ29vZDogdGhlIENQVSB3YXMgZmVkIHRoZSBoaWdoZXN0IHBv
c3NpYmxlCj4gdm9sdGFnZSBhbGwgdGhlIHRpbWUuCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2h5
IHBlcmlvZCAxMjIxOCB3b3VsZCBnaXZlIG5vIFBXTSBvdXRwdXQgYXQgYWxsCj4gd2hpbGUgcGVy
aW9kIDMwNTE4IHdvcmtzIGZpbmUuCj4gSSBkaWQgYW4gZXhwZXJpbWVudCBieSByZW1vdmluZyBD
TEtfU0VUX1JBVEVfUEFSRU5UIGZyb20gdGhlIGRpdmlkZXIncwo+IGluaXQuZmxhZ3MgLT4gbm93
IFhUQUwgKDI0TUh6KSBpcyB0aGUgb25seSBwb3NzaWJsZSBjbG9jayAoaXQncyB0aGUKPiBoYXJk
d2FyZSBkZWZhdWx0KS4gSXQgZG9lcyBpbmRlZWQgYnJpbmcgYmFjayB0aGUgZXhhY3Qgc2FtZSBy
ZXN1bHRzIGFzCj4gYmVmb3JlICh3aGVyZSB0aGUgWFRBTCBjbG9jayB3YXMgYWxzbyB1c2VkOyB3
aXRoIHRoZSBjaGFuZ2VzIGZyb20gdGhpcwo+IHNlcmllcyBGQ0xLX0RJVjMgaXMgbm93IGNob3Nl
biwgd2hpY2ggcnVucyBhdCA4NTBNSHopLgo+IAo+IERvIHlvdSBoYXZlIGFueSBpZGVhIHdoYXQg
Y291bGQgY2F1c2UgdGhpcz8KPiBUaGUgRkNMS19ESVYzIGlucHV0IHNlZW1zIHRvIHdvcmsgYXMg
b3RoZXJ3aXNlIHBlcmlvZCAzMDUxOCB3b3VsZCBhbHNvIG5vdCB3b3JrLgo+IFRoZSBjYWxjdWxh
dGVkIHZhbHVlcyBhbHNvIGxvb2sgc2FuZSwgc28gaXQncyBub3QgdGhhdCB3ZSBoYXZlIHNvbWUK
PiAzMi1iaXQgb3ZlcmZsb3cgKGFzIEknbSB0ZXN0aW5nIG9uIGEgMzItYml0IE1lc29uOGIgU29D
KS4KPiAKQXQgZmlyc3QgSSdkIGxpa2UgdG8gdmVyaWZ5IHRoYXQgdGhlIHJlZ2lzdGVycyBoYXZl
IHRoZSBleHBlY3RlZCB2YWx1ZXMuCkNhbiB5b3UgcHJvdmlkZSB0aGUgdmFsdWVzIG9mIFBXTV9B
L0IgKGRlcGVuZGluZyBvbiB3aGljaCBjaGFubmVsIGlzIHVzZWQgaW4geW91cgpjYXNlKSBhbmQg
UFdNX01JU0NfQUIgYXQgdGhlIGVuZCBvZiBtZXNvbl9wd21fZW5hYmxlKCk/IFRoYW5rcyEKCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKSGVpbmVyCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
