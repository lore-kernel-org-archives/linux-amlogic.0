Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF65AC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uptUjR+ufDg/Xlg+6OoYcYAG7jKmyc2fMWYTrUm/RhY=; b=SDbN3joWQ5tEPy
	5jJT40I1rYMOPQHCXY4CmgI8eeqtGLXs1CsoofOwL3SffPnA2VRHinUa26puV/20V/ZDAJM9fjHIu
	TBQYioPn6xv4s4hi2agfXD7sDCAbRDuEwi4spfhA8gKA8Q1tcwNcWQprJP3XOCuhXGbPsRLemDuqD
	00H1/g+8GGBjb2aOt+AAlcfqLLRQItXQqM0PcvVzqzENyUBHPWrpcmcmawlrhIv6B75Hv0p3h/qKA
	r/OiA3thjtFLRqJvXyD5fpe/N5HgHDgKzqBs97aoOHhIMFmZmG6qFTryAeGzwJpG06NAevbO7rovc
	SRqmOgCUsY73mO4+1tAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peuKE-00FGzu-1h;
	Wed, 22 Mar 2023 09:00:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peuKA-00FGxd-1U
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 09:00:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id o32so4612041wms.1
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679475599;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDWhDX61pEZpOC/Qh13y4vUXorcsmxd3OlXqgNKWZDE=;
        b=6ZA1ZR0/6wDTVRFkHZ92A3pWWOaEVFibEUDA2P1NJrTPCxZKUEMVdqJjYgTBqdtVMr
         jf9G4qnFGWwfZtb6Pw2RIFJc8RRypESQBA5aMuxN3kPE1pBIzOzz1F58MaqlGNKk2b8I
         rGWVn24/ZxHflRtjl9HY7ie6KpvoykJC/Kmdm2lUTyeuGfDG7iF759fLGUFLWtm/KrfU
         /LmyrHPaGWOuml9/+rTHx5kZJYJLH5BrYqfeYnyphFcfJ/p7RXTWRYFf38IIvQbF+Ozl
         lnROV0+6f/ZFeheb2lDHILWur9oG7LOqxJ0GmzshAW9uhbLB38O00WPlc6NbDw7jEB62
         UcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679475599;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDWhDX61pEZpOC/Qh13y4vUXorcsmxd3OlXqgNKWZDE=;
        b=jslLdKr5joAEbQpZR6Al8V3vLj9bJO6qdeGMV3/8OXsKPw3NsqWWGp8fMbEmOmsJvq
         kHJJQ3yHNGZqDMe/idQ6SjhxWuRR8QrwxH8eUJ2wuaUBT3dOUOCV7iO7F+3rhLpTvjfj
         LGlteL2iCkqbF9q/C76xx0puDcODFuOHB3PgClrQp2SYDReF1VPMBFwGZ7pc3s6NPszT
         EuhV1IIKLSARmgaMzZw96Z+heHM4J7XEezeuwTWdxXwB6jZaT8pXY06LDV6sP+ZxsxuO
         nLGwQWLudjj2uYE1CQJUqxlLuLINsuDeK0UFPY0/fqi9M3qFpyehdHQcnsAEZ5N2GSy6
         49+A==
X-Gm-Message-State: AO0yUKVkTc9b+ndyoHLPEwrXkTHUa4iDacYHIKgkCcxwLXhn5cCcsXWN
	XWfQSmTIir+1SYyFJGeziOwCSg==
X-Google-Smtp-Source: AK7set/l+T35hALC3b1FNj8Sid6f9cfqYeNM7XX9QpST1HgtuW/nZ4b26CCHYsecaWGcPNr2Fn6QPA==
X-Received: by 2002:a05:600c:3781:b0:3ed:b103:4fe5 with SMTP id o1-20020a05600c378100b003edb1034fe5mr4724897wmr.31.1679475598769;
        Wed, 22 Mar 2023 01:59:58 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003ee5fa61f45sm1223082wmq.3.2023.03.22.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 01:59:58 -0700 (PDT)
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
 <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
 <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, kelvin.zhang@amlogic.com,
 qi.duan@amlogic.com
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
Date: Wed, 22 Mar 2023 09:41:39 +0100
In-reply-to: <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
Message-ID: <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_020002_498272_824C8665 
X-CRM114-Status: GOOD (  31.39  )
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

Ck9uIFdlZCAyMiBNYXIgMjAyMyBhdCAxNTo0NiwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gT24gMjAyMy8zLzIxIDE3OjQxLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVY
VEVSTkFMIEVNQUlMIF0KPiBIaSBKZXJvbWUsCj4gCVRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4K
Pj4gT24gVHVlIDIxIE1hciAyMDIzIGF0IDEwOjI5LCBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+
IHdyb3RlOgo+PiAKPj4+IEhpIE1hcnRpbu+8jAo+Pj4gCUZpcnN0IG9mIGFsbCwgdGhhbmsgeW91
IGZvciB5b3VyIHJlcGx5Lgo+Pj4KPj4+IE9uIDIwMjMvMy8yMCAyMzozNSwgTWFydGluIEJsdW1l
bnN0aW5nbCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+PiBIZWxsbyBZdSBUdSwK
Pj4+PiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCAxMjozNeKAr1BNIFl1IFR1IDx5dS50dUBhbWxv
Z2ljLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IFNpbmNlIHRoZSBwcmV2aW91cyBjb2RlIG9ubHkg
cHJvdmlkZXMgInJvX29wcyIgZm9yIHRoZSB2aWRfcGxsX2Rpdgo+Pj4+PiBjbG9jay4gSW4gZmFj
dCwgdGhlIGNsb2NrIGNhbiBiZSBzZXQuIFNvIGFkZCAib3BzIiB0aGF0IGNhbiBzZXQgdGhlCj4+
Pj4+IGNsb2NrLCBlc3BlY2lhbGx5IGZvciBsYXRlciBjaGlwcyBsaWtlIFM0IFNPQyBhbmQgc28g
b24uCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4K
Pj4+Pj4gLS0tCj4+Pj4gcGxlYXNlIGRlc2NyaWJlIHRoZSBjaGFuZ2VzIHlvdSBkaWQgY29tcGFy
ZWQgdG8gdGhlIHByZXZpb3VzIHZlcnNpb24ocykKPj4+Cj4+PiBJJ2xsIGFkZCBpdCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLgo+Pj4KPj4+PiBbLi4uXQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvbWVzb24vdmlkLXBsbC1kaXYuaCBiL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmgK
Pj4+Pj4gaW5kZXggYzAxMjhlMzNjY2Y5Li5iYmNjYWIzNDA5MTAgMTAwNjQ0Cj4+Pj4+IC0tLSBh
L2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmgKPj4+Pj4gKysrIGIvZHJpdmVycy9jbGsv
bWVzb24vdmlkLXBsbC1kaXYuaAo+Pj4+PiBAQCAtMTAsMTEgKzEwLDE0IEBACj4+Pj4+ICAgICNp
bmNsdWRlIDxsaW51eC9jbGstcHJvdmlkZXIuaD4KPj4+Pj4gICAgI2luY2x1ZGUgInBhcm0uaCIK
Pj4+Pj4KPj4+Pj4gKyNkZWZpbmUgVklEX1BMTF9ESVZfVEFCTEVfU0laRSAgICAgICAgIDE0Cj4+
Pj4gSW4gdjEgeW91IHVzZWQgQVJSQVlfU0laRSh2aWRfcGxsX2Rpdl90YWJsZSkgd2hlcmV2ZXIg
dGhpcyBuZXcgbWFjcm8KPj4+PiBpcyB1c2VkIGluc3RlYWQuCj4+Pj4gSSB0aGluayB1c2luZyBB
UlJBWV9TSVpFIGlzIHRoZSBiZXR0ZXIgYXBwcm9hY2ggYmVjYXVzZSBpdCBtZWFucyB0aGUKPj4+
PiByZWZlcmVuY2VzIHdpbGwgdXBkYXRlIGF1dG9tYXRpY2FsbHkgaWYgYW4gZW50cnkgaXMgYWRk
ZWQvcmVtb3ZlZCBmcm9tCj4+Pj4gdmlkX3BsbF9kaXZfdGFibGUKPj4+Cj4+PiBJIGFncmVlIHdp
dGggeW91LiBQZXJoYXBzIHRoZSBrZXkgaXMgdG8gdW5kZXJzdGFuZCB3aGF0IEplcm9tZSBzYWlk
Lgo+PiBJIGFza2VkIHlvdSB0byBkZXNjcmliZSBob3cgdGhpcyBkaXZpZGVyIGFjdHVhbGx5IHdv
cmtzLiBOb3QgcmVtb3ZlCj4+IEFSUkFZX1NJWkUoKS4KPgo+IE9LYXkhIEkgbWlzdW5kZXJzdG9v
ZCB5b3VyIG1lYW5pbmcuCj4KPj4gVGhpcyBkaXZpZGVyIHVzZXMgdGFibGVzIG9ubHkgYmVjYXVz
ZSB0aGUgcGFyYW1ldGVycyBhcmUgIm1hZ2ljIi4KPj4gSSdkIGxpa2UgdGhlIGRyaXZlciB0byBi
ZSBhYmxlIGNvbWUgdXAgd2l0aCAiY29tcHV0ZWQiIHZhbHVlcyBpbnN0ZWFkLgo+PiBXaGF0IEkg
cmVxdWVzdGVkIGlzIHNvbWUgZXhwbGFuYXRpb24gYWJvdXQgaG93IHRoaXMgSFcgY2xvY2sgd29y
a3MKPj4gYmVjYXVzZSB0aGUgZG9jdW1lbnRhdGlvbiBpcyBub3QgdmVyeSBjbGVhciB3aGVuIGl0
IGNvbWVzIHRvIHRoaXMuIFRoZXNlCj4+IHZhbHVlcyBtdXN0IGNvbWUgZnJvbSBzb21ld2hlcmUs
IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgImhvdyIuCj4+IFRoaXMgaXMgdGhlIHNhbWUgYXMgdGhl
IFBMTCBkcml2ZXIgd2hpY2ggY2FuIHRha2UgYSByYW5nZSBhbmQgY29tZSB1cAo+PiB3aXRoIHRo
ZSBkaWZmZXJlbnQgcGFyYW1ldGVycywgaW5zdGVhZCBvZiB1c2luZyBiaWcgcHJlLWNvbXB1dGVk
IHRhYmxlcy4KPj4gCj4+Pgo+Pj4+IEFsc28gSSB0aGluayB0aGVyZSdzIGEgZGlmZmVyZW50IHVu
ZGVyc3RhbmRpbmcgYWJvdXQgd2hhdCBKZXJvbWUKPj4+PiBwcmV2aW91c2x5IHdyb3RlOgo+Pj4+
PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGFjdHVhbGx5IGRlc2NyaWJlIGhvdyB0aGlzIHZpZCBwbGwg
d29yayBzbyB3ZSBjYW4KPj4+Pj4gc3RvcCB1c2luZyBwcmVjb21wdXRlICJtYWdpYyIgdmFsdWVz
IGFuZCBhY3R1YWxseSB1c2UgdGhlIElQIHRvIGl0cyBmdWxsCj4+Pj4+IGNhcGFjaXR5Lgo+Pj4+
ICAgRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBpcyB0aGF0IHlvdSBpbnRlcnByZXRlZCB0aGlzIGFz
ICJsZXQncyBjaGFuZ2UKPj4+PiBBUlJBWV9TSVpFKHZpZF9wbGxfZGl2X3RhYmxlKSB0byBhIG5l
dyBtYWNybyBjYWxsZWQKPj4+PiBWSURfUExMX0RJVl9UQUJMRV9TSVpFIi4KPj4+PiBCdXQgSSB0
aGluayB3aGF0IEplcm9tZSBtZWFudCBpczogImxldCdzIGdldCByaWQgb2YgdmlkX3BsbF9kaXZf
dGFibGUKPj4+PiBhbmQgaW1wbGVtZW50IGhvdyB0byBhY3R1YWxseSBjYWxjdWxhdGUgdGhlIGNs
b2NrIHJhdGUgLSB3aXRob3V0Cj4+Pj4gaGFyZC1jb2RpbmcgMTQgcG9zc2libGUgY2xvY2sgc2V0
dGluZ3MgaW4gdmlkX3BsbF9kaXZfdGFibGUiLiBMb29rIGF0Cj4+Pj4gY2xrLW1wbGwuYyBhbmQv
b3IgY2xrLXBsbC5jIHdoaWNoIGFsbG93IGNhbGN1bGF0aW5nIGFyYml0cmFyeSByYXRlcwo+Pj4+
IHdpdGhvdXQgYW55IGhhcmQtY29kZWQgdGFibGVzLgo+Pj4KPj4gZXhhY3RseSAuLi4gb3IgYXQg
bGVhc3QgYW4gZXhwbGFuYXRpb24gYWJvdXQgaG93IGl0IHdvcmtzIGFuZAo+PiB3aHkgaXQgaXMg
dG9vIGNvbXBsaWNhdGVkIHRvIGNvbXB1dGUgdGhlIHZhbHVlcyBhdCBydW50aW1lLgo+PiAKPj4+
IEluIGZhY3QsIHBsbCBhbmQgbXBsbCBhcmUgYWxzbyBmaXhlZCByZWdpc3RlciB3cml0ZXMgY29y
cmVzcG9uZGluZwo+Pj4gdmFsdWVzLgo+PiBUaGF0IGlzIG5vdCB0cnVlLiBUaGUgcGxsIGFuZCBt
cGxsIGRyaXZlcnMgYXJlIGFibGUgdG8gY29tcHV0ZSB0aGVpcgo+PiB2YWx1ZXMgYXQgcnVudGlt
ZS4gUGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoZSBkcml2ZXJzLgo+PiAKPgo+IEFmdGVyIGNvbnN1
bHRpbmcgdGhlIGVuZ2luZWVyIG9mIHRoZSBjaGlwIGRlc2lnbiwgdGhlIGNsb2NrIGlzIGEgZGln
aXRhbAo+IGZyZXF1ZW5jeSBkaXZpZGVyLCBhbmQgdGhlIGZyZXF1ZW5jeSBkaXZpZGVyIGlzIHZl
cmlmaWVkIGJ5IHRoZSBzZXF1ZW5jZQo+IGdlbmVyYXRvciwgd2hpY2ggaXMgYml0MC1iaTE1LiBi
aXQxNi1iaXQxNyBjb25maXJtcyB0aGUgc2l6ZSBvZiB0aGUKPiBmcmVxdWVuY3kgZGl2aXNpb24u
CgpUaGF0LCB3ZSBhbHJlYWR5IGtub3cuIFRoaXMgaXMgd2hhdCB0aGUgZGF0YXNoZWV0IGFscmVh
ZHkgZ2l2ZSB1cy4KSXQgaXMgc3RpbGwgYSBiaXQgbGlnaHQuCgpZb3UgZG9uJ3Qgc2V0IHRoZSBi
aXQgcmFuZG9tbHkgYW5kIGNoZWNrIHRoZSBvdXRwdXQsIGRvIHlvdSA/CgpUaGUgcXVlc3Rpb24g
aXMgaG93IHNldHRpbmcgdGhpcyBiaXQgaW1wYWN0IHRoZSByZWxhdGlvbiBiZXR3ZWVuCnRoZSBp
bnB1dCBhbmQgb3V0cHV0IHJhdGU/IElPVywgZnJvbSB0aGVzZSAxN2JpdHMsIGhvdyBkbyB5b3Ug
Y29tZSB1cAp3aXRoIHRoZSBtdWx0aXBsaWVyIGFuZCBkaXZpZGVyIHZhbHVlcyAoYW5kIHRoZSBv
dGhlciB3YXkgYXJvdW5kKSA/IAoKPiBXaGVyZWFzIG90aGVyIFBMTFMgYW5kIE1QTExTIGFyZSBh
bmFsb2cgZGl2aWRlcnMgc28KPiB0aGVyZSBhcmUgZml4ZWQgZm9ybXVsYXMgdG8gY2FsY3VsYXRl
Lgo+Cj4gU28gTmVpbCBoYWQgbm8gcHJvYmxlbSBpbXBsZW1lbnRpbmcgaXQgdGhpcyB3YXkuIFNv
IG5vdyBJIHdhbnQgdG8ga25vdyB5b3VyCj4gYWR2aWNlIHdoYXQgc2hvdWxkIEkgZG8gbmV4dD8K
CjEpIE5laWwgZGlkIHdoYXQgaGUgY291bGQgdG8gZ2V0IGNvbXB1dGUgdGhlIHJhdGUgKFJPKSB3
aGljaCB0aGUgbGl0dGxlCmluZm9ybWF0aW9uIGhlIGhhZC4gWW91IGFyZSB0cnlpbmcgdG8gZXh0
ZW5kIHRoZSBkcml2ZXIsIGtlZXBpbmcgYW4KZHVtbXkgYXBwcm9hY2guIEl0IGlzIG9ubHkgZmFp
ciB0aGF0IEkgYXNrIHlvdSB0byBtYWtlIHRoaXMgYSByZWFsCmRyaXZlci4KCjIpIEJlY2F1c2Ug
c29tZXRoaW5nIGhhcyBiZWVuIGRvbmUgb25jZSwgaXQgbm90IG5lY2Vzc2FyaWx5IGFwcHJvcHJp
YXRlCnRvIGNvbnRpbnVlIC4uLiB0aGlzIHR5cGUgb2YgYXJndW1lbnQgaGFyZGx5IGEgdmFsaWQg
cmVhc29uLgoKSSBkb24ndCB3YW50IHRvIGtlZXAgYWRkaW5nIHRhYmxlIGJhc2VkIGRyaXZlciB1
bmxlc3MgbmVjZXNzYXJ5LgpTbyBmYXIsIHlvdSBoYXZlIG5vdCBwcm92ZWQgdGhpcyBhcHByb2Fj
aCBpcyByZWFsbHkgcmVxdWlyZWQsIG5vcgpwcm92aWRlZCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0
aW9uIHRvIG1ha2UgdGhlIGNhbGN1bGF0aW9uLgoKPgo+Pj4gQnV0IGV2ZXJ5IFNPQyBpcyBkaWZm
ZXJlbnQsIHNvIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gc2V0IGl0Cj4+PiBvdXRzaWRlLiBUaGUg
VklEIFBMTCBpcyBhIGZpeGVkIHZhbHVlIGZvciBhbGwgY3VycmVudCBTb0NzLgo+Pj4KPj4+PiBC
ZXN0IHJlZ2FyZHMsCj4+Pj4gTWFydGluCj4+Pj4KPj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
