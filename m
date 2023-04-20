Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B4C77B72
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Apr 2023 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSQFPS4ijxhjU6vjZLZjj1c6c6yW2hRYxa77BZ7TBLM=; b=cwTALjANU26DIPtTMRcragxhC2
	5EfJKrwDWjzKyFKE90ZCxnBdljMZCc7Kvg3adfkCyU6X0V0cQ3C6ONlAjbilaiB2RbPSWsVbY8rpY
	sycx9b1ZyeWLvrN5XIDtRembvO9S/iZ2wUJcrG/AmkT8hiAaNBfIxtHaPXZR2Tjce0N5IzybFB8aV
	biz2Y2X1EtUNeR5xlVcbYtMG3xaPK7FqoZyeXx+nTtI4VxGmr8UtI9ncmHfW/65rdxfuIAby7EWA7
	OsFCnlBV9eL7v+Ct0YyTmNuDFM94ulcLWYB/4TlJu53hc/jG5ldS5M6ebYihf/YQFOmm3sjmwpn9Q
	cDkPmZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTFN-0082DR-2C;
	Thu, 20 Apr 2023 12:18:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTFJ-0082CJ-2I
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Apr 2023 12:18:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so6648355e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Apr 2023 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681993119; x=1684585119;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V6W51aK7dtxbbEU35T6tokn9AAiBsIBkywYQixWbs7k=;
        b=iTtiiG9BKoyTchdjjOZneyQjqTMORk610b8n4BxXsaAVPl7Gre4AdWZ/IZNDNikc0I
         9oVvjGHvZF41a9aQZorUJ56/ayYdp2eb0S2ddGConjzfSKA77/+rl/OihAq2PPmibGz+
         3MJ3YOqGm7W4S33UuqNz+ygwbVE75moawpJPeZtWIZX9xc0ZwDyQ9TAvIVZOwbLDZ73o
         MzsNhmVeCjjzkg5C/2v32Up3CEjAnSjUcAvmv/g2ITv085Zm/Maye9fot1GHMz2rUQGh
         ST4Ruw1sylm07dH9PtQmotS1+fDktwg9bD7iKezrkV+6UH8p/ngg6+ZdTHgtJG66cL00
         ja9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993119; x=1684585119;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6W51aK7dtxbbEU35T6tokn9AAiBsIBkywYQixWbs7k=;
        b=imYbs5J3LPyyhe+/KiyAOI9QDPT1Lxnc3LOT52lYz9FUM9RMjYlW3E6+8TS4rHS6T6
         sMhm8eh4Tpmy6MSmRUnCL2vxFBSFPmtp2e5Bxpw3ZfB69TB8q4k3slMRP5T96Sb/QTLk
         IbsAWZJqoqijLtZslwrya4UF8s/Qr71SAHcHNtZw30zTK1m8IlbhoeI7im8XW5XDp7YX
         yGFvhasPaF3XgjvaC20staXMOijTL4ZKvLWdF3PfRfcCo7QkhQHLUBFhnZ9ceV/40Bqu
         xGdvZwHELaQ3Pe0MVczjlbg02eJin0q1CpCgQH3Ql1AbAspQMr8mZ4ySOblCJBgF55iD
         qUAQ==
X-Gm-Message-State: AAQBX9eoFRz3Mv6e4VeKszrrL26GZUVWU1KT7OuHBKHVLfs6+LGK/t25
	RDE0EVB54R36woBO+cV0EOhbrg==
X-Google-Smtp-Source: AKy350ajYdesVgaKLsZF97mzYar7CBydA7JI6X215xO0mHTy3oZBXgMqc9PddsNj6bpO8qap5q6p8g==
X-Received: by 2002:adf:f58d:0:b0:2f9:61b5:7796 with SMTP id f13-20020adff58d000000b002f961b57796mr1262812wro.29.1681993119207;
        Thu, 20 Apr 2023 05:18:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:455d:d09b:3d7d:bb7d? ([2a01:e0a:982:cbb0:455d:d09b:3d7d:bb7d])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe70d000000b002fbaef32231sm1865638wrm.22.2023.04.20.05.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:18:38 -0700 (PDT)
Message-ID: <9037aa40-c441-b610-ed7b-2c9840dff751@linaro.org>
Date: Thu, 20 Apr 2023 14:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
 <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
 <20230419160405.d7qfir3nv6tlxx2a@CAB-WSD-L081021>
 <427e79ef-156d-027e-9296-6f4e6513a04d@linaro.org>
 <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
 <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_051841_884482_1E1B2496 
X-CRM114-Status: GOOD (  32.44  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgS2VsdmluLAoKT24gMjAvMDQvMjAyMyAxMDo0MywgS2VsdmluIFpoYW5nIHdyb3RlOgo+IE9u
IDIwMjMvNC8yMCAwMTowMCwgRG1pdHJ5IFJva29zb3Ygd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1B
SUwgXQo+Pgo+PiBPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAwNjoyNTowN1BNICswMjAwLCBOZWls
IEFybXN0cm9uZyB3cm90ZToKPj4+IE9uIDE5LzA0LzIwMjMgMTg6MDQsIERtaXRyeSBSb2tvc292
IHdyb3RlOgo+Pj4+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDAzOjQzOjEyUE0gKzAyMDAsIE5l
aWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+PiBPbiAxOS8wNC8yMDIzIDE1OjE0LCBEbWl0cnkgUm9r
b3NvdiB3cm90ZToKPj4+Pj4+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDAzOjM4OjMzUE0gKzA4
MDAsID1YaWFud2VpIFpoYW8gd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFu
d2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgQyBzZXJpZXMgU29DcyBh
cmUgZGVzaWduZWQgZm9yIHNtYXJ0IElQIGNhbWVyYQo+Pj4+Pj4+IGFwcGxpY2F0aW9ucywgd2hp
Y2ggZG9lcyBub3QgYmVsb25nIHRvIE1lc29uIHNlcmllcy4KPj4+Pj4+PiBTbywgQWRkIEFSQ0hf
QU1MSVBDIGZvciB0aGUgbmV3IHNlcmllcy4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZXJlIGFyZSBub3cg
bXVsdGlwbGUgYW1sb2dpYyBTb0Mgc2VpZXMgc3VwcG9ydGVkLCBzbyBncm91cCB0aGVtIHVuZGVy
Cj4+Pj4+Pj4gdGhlaXIgb3duIG1lbnUuIHdlIGNhbiBlYXNpbHkgYWRkIG5ldyBwbGF0Zm9ybXMg
dGhlcmUgaW4gdGhlIGZ1dHVyZS4KPj4+Pj4+PiBJbnRyb2R1Y2UgQVJDSF9BTUxPR0lDIHRvIGNv
dmVyIGFsbCBBbWxvZ2ljIFNvQyBzZXJpZXMuCj4+Pj4+Pj4KPj4+Pj4+PiBObyBmdW5jdGlvbmFs
IGNoYW5nZXMgaW50cm9kdWNlZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53
ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+IMKg
wqDCoCBhcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIHwgMTIgKysrKysrKysrKysrCj4+Pj4+
Pj4gwqDCoMKgIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgfMKgIDIgKysKPj4+Pj4+PiDC
oMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4+Pj4+Pj4KPj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3JtcyBiL2FyY2gvYXJtNjQvS2Nv
bmZpZy5wbGF0Zm9ybXMKPj4+Pj4+PiBpbmRleCA4OWEwYjEzYjA1OGQuLmJmYmM4MTdlZWY4ZiAx
MDA2NDQKPj4+Pj4+PiAtLS0gYS9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zCj4+Pj4+Pj4g
KysrIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+Pj4+Pj4+IEBAIC0xNjIsMTIgKzE2
MiwyNCBAQCBjb25maWcgQVJDSF9NRURJQVRFSwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgVGhp
cyBlbmFibGVzIHN1cHBvcnQgZm9yIE1lZGlhVGVrIE1UMjd4eCwgTVQ2NXh4LCBNVDc2eHgKPj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgICYgTVQ4MXh4IEFSTXY4IFNvQ3MKPj4+Pj4+PiArbWVudWNv
bmZpZyBBUkNIX0FNTE9HSUMKPj4+Pj4+PiArwqDCoMKgwqAgYm9vbCAiTlhQIFNvQyBzdXBwb3J0
Igo+Pj4+Pj4gTlhQPyBEaWQgeW91IG1lYW4gIkFtbG9naWMiPwo+Pj4+Pj4KPj4+Pj4+PiArCj4+
Pj4+Pj4gK2lmIEFSQ0hfQU1MT0dJQwo+Pj4+Pj4+ICsKPj4+Pj4+PiDCoMKgwqAgY29uZmlnIEFS
Q0hfTUVTT04KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgYm9vbCAiQW1sb2dpYyBQbGF0Zm9ybXMiCj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIGhlbHAKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgZW5h
YmxlcyBzdXBwb3J0IGZvciB0aGUgYXJtNjQgYmFzZWQgQW1sb2dpYyBTb0NzCj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBzdWNoIGFzIHRoZSBzOTA1LCBTOTA1WC9ELCBTOTEyLCBBMTEzWC9EIG9y
IFM5MDVYL0QyCj4+Pj4+Pj4gK2NvbmZpZyBBUkNIX0FNTElQQwo+Pj4+Pj4gRG8gd2UgcmVhbGx5
IG5lZWQgYSBkaWZmZXJlbnQgQVJDSCBmb3IgQW1sb2dpYyBJUEM/Cj4+Pj4+PiBJIGNhbiBpbWFn
aW5lIHRoYXQgaXQncyBub3QgdGhlIE1lc29uIGFyY2hpdGVjdHVyZSBhdCBhbGwuCj4+Pj4+PiBC
dXQgbWF5YmUgYSBiZXR0ZXIgc29sdXRpb24gaXMganVzdCB0byByZW5hbWUgQVJDSF9NRVNPTiB0
byBBUkNIX0FNTE9HSUM/Cj4+Pj4+IEl0IHNob3VsZCBiZSBjaGFuZ2VkIHRyZWV3aWRlLCBhbmQg
aXMgaXQgd29ydGggaXQgPwo+Pj4+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoZSBBMSBhbmQg
UzQgZmFtaWxpZXMgYXJlIG5vdCBmdWxseSBjb21wYXRpYmxlCj4+Pj4gd2l0aCB0aGUgTWVzb24g
YXJjaGl0ZWN0dXJlLCBhbmQgd2UgaGF2ZW4ndCBwcm92aWRlZCBhZGRpdGlvbmFsIEFSQ0hfKgo+
Pj4+IGZvciB0aGVtLgo+Pj4gVGhlIEdYQkIsIEdYTC9HWE0sIEcxMkEsIEcxMkIgJiBTTTEgYXJl
IGFsc28gbm90IGZ1bGx5IGNvbXBhdGlibGUsCj4+PiBidXQgdGhleSBsaWUgdW5kZXIgdGhlICJN
RVNPTiIgdW1icmVsbGEgd2hpY2ggY292ZXJzIFNvQyBzaW5jZSB0aGUKPj4+IE1lc29uNiBhcmNo
aXRlY3R1cmUuIEl0J3MgYSBmYWNpbGl0eSB0byBpbmNsdWRlL2V4Y2x1ZGUgQW1sb2dpYwo+Pj4g
ZHJpdmVycy9EVCwgbm90aGluZyBlbHNlLgo+IEdYQkIsIEdYTC9HWE0sIEcxMkEsIEcxMkIgLCBT
TTEgYW5kIFM0IGJlbG9uZyB0byBtZWRpYSBib3guCj4gU28sICJNRVNPTiIgcmVwcmVzZW50cyB0
aGUgbWVkaWEgYm94IHNlcmllcy4KPiBVcCB0byBub3csICJNRVNPTiIgd29ya3Mgd2VsbCBmb3Ig
YWxsIGV4aXN0aW5nIGNoaXBzIGV4Y2VwdCBBMSBhbmQgQVhHLgo+Pj4gSWYgeW91IGNvbXBhcmUg
aXQgdG8gQkNNIG9yIE5YUCwgaXQncyBkaWZmZXJlbnQgc2l0dWF0aW9uLCB0aGUKPj4+IGRpZmZl
cmVudCBBUkNIXyogYWN0dWFsbHkgdGFyZ2V0cyB0b3RhbGx5IGRpZmZlcmVudCBTb0NzIGZyb20K
Pj4+IGNvbXBsZXRlbHkgZGlmZmVyZW50IEJ1c2luZXNzIFVuaXRzIG9yIGZyb20gY29tcGFuaWVz
IGFjcXVpc2l0aW9ucy4KPiBGaXJzdGx5LCB0aGUgbmV3IEMgc2VyaWVzIGlzIHRvdGFsbHkgZGlm
ZmVyZW50IGZyb20gcHJldmlvdXMgTUVTT04gc2VyaWVzLgo+ICBGcm9tIHRoZSBwZXJzcGVjdGl2
ZSBvZiBhcHBsaWNhdGlvbiwgdGhlIG5ldyBDIHNlcmllcyBpcyBkZXNpZ25lZCBmb3Igc21hcnQg
SVAgY2FtZXJhIGFwcGxpY2F0aW9ucywKPiB3aGlsZSBNRVNPTiBzZXJpZXMgaXMgZGVzaWduZWQg
Zm9yIGh5YnJpZCBPVFQvIElQIFNldCBUb3AgQm94wqAgYW5kIGhpZ2gtZW5kIG1lZGlhIGJveCBh
cHBsaWNhdGlvbnMuCj4gIEZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIGFyY2hpdGVjdHVyZSwgdGhl
IG5ldyBDIHNlcmllcyBpbnRlZ3JhdGVzIHRoZSBzZW5zb3IgaW50ZXJmYWNlLCBpbWFnZSBzaWdu
YWwgcHJvY2Vzc2luZyB1bml0LCBEZXdhcnAsIHZpZGVvIGVuY29kZXIsIG5ldXJhbCBuZXR3b3Jr
aW5nIHByb2Nlc3NpbmcgdW5pdCwKPiB3aGljaCBNRVNPTiBzZXJpZXMgZG9lcyBub3QgYW5kIHdp
bGwgbmV2ZXIgaGF2ZS4KPiBTZWNvbmRseSwgdGhlcmUgYXJlIEMxIGFuZCBDMiBiZXNpZGVzIEMz
Lgo+IE1vcmVvdmVyLCBtb3JlIG90aGVyIHNlcmllcyBhcmUgb24gdGhlIHdheSwgc3VjaCBhcyBU
IHNlcmllcy4KPiBJZiB3ZSBhbHdheXMgc3RpY2sgdG8gIk1FU09OIiwgcGVvcGxlIHdpbGwgZ2V0
IG1vcmUgYW5kIG1vcmUgY29uZnVzZWQuCj4gVGhlcmVmb3JlLCBJIHRoaW5rIGl0IGlzIHRoZSBy
aWdodCB0aW1lIHRvIGFkZCBBUkNIX0FNTElQQy4KClRoYW5rcyBmb3Igc2hhcmluZyBzdWNoIGRl
dGFpbHMsIHdlIGFyZSBhbGwgaGFwcHkgdG8gc2VlIEFtbG9naWMncwpjb21taXRtZW50IHRvIHVw
c3RyZWFtIG9mIHRoZXNlIFNvQyBmYW1pbGllcy4KCkJ1dCBhcyBJIGV4cGxhaW5lZCwgdGhpcyBB
UkNIX01FU09OIGRvZXNuJ3QgZGVmaW5lIHRoZSBTb0MgdHlwZQpidXQgYmFkbHkgZGVmaW5lcyB0
aGUgQW1sb2dpYyBTb0NzIHN1cHBvcnQuCgo+Pj4gV2Ugc2hvdWxkIGhhdmUgbmFtZWQgaXQgQVJD
SF9BTUxPR0lDIHNpbmNlIHRoZSBiZWdpbm5pbmcsIGJ1dCB3ZQo+Pj4gY2FuJ3QgY2hhbmdlIGhp
c3RvcnkuCj4gU2hvdWxkbid0IHdlIGRlc2VydmUgYSBjaGFuY2UgdG8gbWFrZSBpdCByaWdodD8K
Clllcywgc28gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIHRvIG1vdmUgdG8gQVJDSF9BTUxPR0lD
Cgo+Pj4+IEluIG15IG9waW5pb24sIGl0J3MgYSBnb29kIHRpbWUgdG8gc3BsaXQgdGhlIE1lc29u
IGFyY2hpdGVjdHVyZSBpbnRvCj4+Pj4gcHJvcGVyIHN1YnNldHMsIG9yIHJlbmFtZSBpdCB0cmVl
d2lkZSAobWF5YmUgb25seSBjb25maWcgb3B0aW9uCj4+Pj4gQVJDSF9NRVNPTiA9PiBBUkNIX0FN
TE9HSUMpLgo+Pj4gTUVTT04gaXMgb25seSBhIGNvZGVuYW1lIHRvIGRpZmZlcmVudGlhdGUgZnJv
bSBvdGhlciBTb0MgdmVuZG9ycwo+Pj4gYmVjYXVzZSBBbWxvZ2ljIHVzZWQgaXQgYXMgYSBjb2Rl
bmFtZSBmb3IgYSBsb25nIHRpbWUuCj4+PiBDb21wYXJlIHRoaXMgdG8gQWxsd2lubmVyJ3MgInN1
bnhpIiBvciBRdWFsY29tbSdzICJtc20iLgo+Pj4KPj4+IFRoaXMgY29uZmlnIGhhcyBubyBmdW5j
dGlvbmFsIG1lYW4sIGl0J3Mgb25seSBhIGNvbmZpZyBuYW1lc3BhY2UuCj4+Pgo+Pj4gUmVuYW1p
bmcgaXQgd291bGQgbmVlZCByZW5hbWluZyBpdCBpbiBhbGwgc3Vic3lzdGVtcyBLY29uZmlnL01h
a2VmaWxlcwo+Pj4gYW5kIHdpbGwgY2VydGFpbmx5IGJyZWFrIGJ1aWxkcyB3aXRoIGN1c3RvbSBr
ZXJuZWwgY29uZmlncwo+Pj4gaW4gdmFyaW91cyBwdWJsaWNseSB1c2VkIGJ1aWxkcyBsaWtlIEFy
bWJpYW4sIG1ldGEtbWVzb24sIExpYnJlRUxFQywKPj4+IERlYmlhbiwgU3VzZSwgLi4uCj4gTGV0
J3MgZ2V0IGJhY2sgdG8gQVJDSF9BTUxJUEMuCj4gV2UganVzdCBuZWVkIHRvIGFkZCBBUkNIX0FN
TElQQyBpbiB0aGUgbmVjZXNzYXJ5IHN1YnN5c3RlbXMgS2NvbmZpZy9NYWtlZmlsZS4KPiBUaGlz
IGNoYW5nZSB3aWxsIGtlZXAgdGhlIGV4aXN0aW5nIE1FU09OIHJlbGF0ZWQgY29kZSzCoCBhbmQg
d2lsbCBuZWl0aGVyIGludm9sdmUgcmVuYW1pbmcgbm9yIGJyZWFrIGFueSBidWlsZHMuCgpUaGUg
Z29hbCBvZiBtYWlubGluZSBMaW51eCBpcyB0byBidWlsZCBhcyBtdWNoIGFzIHBvc3NpYmxlIGFu
ZApiZSBtb2R1bGFyIGF0IHJ1bnRpbWUsIHRoZSBvbmx5IHN1cHBvcnRlZCBjb25maWd1cmF0aW9u
IGlzIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKYW5kIGFkZGluZyBhIG5ldyBjb25maWcg
dG8gZGlmZmVyZW50aWF0ZSBhbiBBcHBsaWNhdGlvbiB0eXBlCmRvZXNuJ3QgbWFrZSBzZW5zZS4K
Cj4+PiBTbyBpdCdzIHBvaW50bGVzcyB0byBjaGFuZ2UsIGFuZCBldmVuIGFkZCBhIGRpZmZlcmVu
dCBvbmUgc2luY2UKPj4+IGl0J3Mgbm90IGEgZmFtaWx5IGRpZmZlcmVudGlhdG9yIHNpbmNlIHRo
ZSBLZXJuZWwgaXMgbW9kdWxhcgo+Pj4gYW5kIHdvcmtzIGFyb3VuZCBEVCB0byBkZXRlcm1pbmUg
d2hpY2ggZHJpdmVycyB0byBwcm9iZS4KPiBQcm9wZXIgbmFtZXMgcGxheSBhbiBpbXBvcnRhbnQg
cm9sZSBpbiB1bmRlcnN0YW5kaW5nIHRoZSBjb2RlLCByaWdodD8KClllcywgYnV0IHN0YWJsZSBj
b25maWcgbmFtZXMgYWxzbyBwbGF5IGFuIGltcG9ydGFudCByb2xlIGZvciB0aGUKdXNlcnMgZm9y
IG1haW5saW5lLCBhbmQgdGhlcmUncyBhIGJpZyBudW1iZXIgb2YgdXNlcnMgcmVseWluZwpvbiB0
aGUgc3RhYmxlIG5hbWluZyBmb3IgYWxsIFNvQ3Mgc3RhcnRpbmcgZnJvbSBNZXNvbjYuCgpTbyBp
ZiB5b3UgcmVhbGx5IHdhbnQgdG8gZ2V0IHJpZCBvZiB0aGUgQVJDSF9NRVNPTiwgbWlncmF0aW5n
IHRvCkFSQ0hfQU1MT0dJQyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8sIGJ1dCBpdCBpbnZvbHZl
cyBkb2luZwphIHRyZWV3aWRlIG1pZ3JhdGlvbiBhbmQgdGhlcmUncyBubyBlYXN5IHdheSB0byBk
byB0aGlzIGFuZCBtYWtlCnN1cmUgdGhlIHVzZXJzIHN0aWxsIG1hbmFnZXMgdG8gYnVpbGQgZm9y
IG90aGVyIEFtbG9naWMgcGxhdGZvcm1zLgoKU28gYXMgdGhlIEFtbG9naWMgQVJNL0FSTTY0IFNv
QyBzdXBwb3J0IG1haW50YWluZXIgSSBtdXN0IG1ha2Ugc3VyZQpicmVha2FnZSBkb24ndCBoYXBw
ZW5zLCBhbmQgc28gZmFyIEkgZG9uJ3Qgc2VlIGhvdyBhY2hpZXZlIHRoYXQuCgpOb3csIHlvdSBj
YW4gcG9zdCBhIFJGQyBzbyB3ZSBjYW4gZGlzY3VzcyBvbiBzb21ldGhpbmcuCgpOZWlsCgo+Pj4g
TmVpbAo+Pj4KPj4gVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb247IGl0IG1h
a2VzIHNlbnNlIQo+PiBBY3R1YWxseSwgSSBkaXNhZ3JlZSB3aXRoIGNyZWF0aW5nIGEgc2VwYXJh
dGUgQVJDSCB3aXRob3V0IGZpcnN0IHJld29ya2luZwo+PiBhbGwgb2YgaXRzIHN1YnNldHMgLSB0
aGF0J3Mgd2h5IEkgc3RhcnRlZCB0aGlzIGRpc2N1c3Npb24uCj4+IE5vdywgSSBzZWUgdGhhdCB5
b3Ugc2hhcmUgbXkgcGVyc3BlY3RpdmUgYW5kIGJlbGlldmUgdGhhdCBDMwo+PiBzaG91bGQgYmUg
YWRkZWQgdG8gdGhlIEFSQ0hfTUVTT04gc3Vic2V0LCBzbyBJIGhhdmUgbm8gb2JqZWN0aW9ucy4K
Pj4KPj4gWy4uLl0KPj4KPj4gLS0gCj4+IFRoYW5rIHlvdSwKPj4gRG1pdHJ5Cj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
