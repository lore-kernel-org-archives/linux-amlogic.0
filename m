Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C850C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTwoEMZKpLJoBt1H/sMOuASYNeiXOvfDrL3UHiru+IM=; b=3T3i5IgzJgb6qX
	py3w22iwC0a/SOalpA4UlAgZySDc5osgcI6JPqaGUyZapTmFhEojkrHoCheAewszLvXsXfjAhVr9A
	C+AU1W3By7gUDObcDqRaS4X/exyN4gKXOzIk51DctrW4EY3qYAR4aITE0PQbsLwajV3qhg3Rpghqm
	lkx3bG+t0bKvXw6UAaMrDEVa5uk9ImqQY13vgj1F4URv0ijuDhuaausD9LfwokmR8kepEg45X7KGI
	93i0wxKWHI2ZtnCG4yxtF5d89VzKbuO4bPglBU7Q/QjUgpfBTbjkR+08L5lVA+s7MGJMjxhYL3L8T
	OSSUd2F8mZSml1qqfL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLqI-00DuNh-Gp; Fri, 27 Jan 2023 10:20:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLq1-00DuG2-MY; Fri, 27 Jan 2023 10:20:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h12so4495080wrv.10;
        Fri, 27 Jan 2023 02:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=986kNoTX7HQuFjtuPYsQX3nJMp/mDefMIZLTNU//MaA=;
        b=Sad+FyBArEkw4v91Xh8DZW6D8RxM9cDW+CD10015GaCQjTLX8LJveXhaJjkIf5U01L
         aC1KMtktWlQxDDbaEyvokaDTLFQQEDNyt1BZeeZfOQKg36R8OcvOTTZVFEOWUyCSHWO3
         mLwxUXNmTAamQd3pwnVBs+a39y37+tHUcriRO0DipO30+GY1c1AXrY/SF9GH5b+uydSb
         1WIg0EZMuLmC6JZSIP/TGUM5LTpxVlN8pXXZ5/o6vGZkfk075Xph2A/6yDmVscmkkTyv
         ARvsTt1fcGoxmWaIH+AE+4ilcEVps43hTH8lOoVTC9aX231PoZC2HwTn2OuR0KvenHhE
         nF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=986kNoTX7HQuFjtuPYsQX3nJMp/mDefMIZLTNU//MaA=;
        b=lCnNY4dq99GG45zK3jtKCiGnuvy1I6EXtcrrEAynrQfCFVTcbZXPnPCSDDqUq7egTm
         0RxMWOaJuxq9lzaLy3iQlTD6wzzJEYPWR9/pypAaNP/ubXvXKR3FDMKRzQfS2m82REnt
         hufz98rXMr3qh2EPJatDa0wVwFzL++ZebRycl/5ivbKlAHPBouOFWESFiaaHD/KIvOOd
         mF0uMLToxZXYq9CkgLw8VLqwbHAxGkOVlBUBQBebJ9oRhCDPhbFWaR29fPuL4gsOSHPL
         oLyBc1FNxBfPHd4BmcqkcJQvDuXciYbt4rFgBbjbeuUbQxmsZQ31sbYc4tyW+jyb9GpQ
         kQTw==
X-Gm-Message-State: AO0yUKVXFRZby6Ls6BBlUUrCEGyZwZOXQBJB3CQHObTytVT0bqE8Mw0i
	8aquykCrEQZM9QzUqEezqu+KgiD8WP0bmA==
X-Google-Smtp-Source: AK7set+Pd50pUM5H0ZNoleGCfOH/eDbbphd/8EJ4gOMzwxstG7KxGUcSUThAxOZMYAYXw1n6FifzEQ==
X-Received: by 2002:adf:a491:0:b0:2bf:b394:4f23 with SMTP id g17-20020adfa491000000b002bfb3944f23mr10327198wrb.51.1674814803600;
        Fri, 27 Jan 2023 02:20:03 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002bfc0558ecdsm3478532wrs.113.2023.01.27.02.20.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:20:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
Date: Fri, 27 Jan 2023 14:19:59 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <356B9EBF-B9C4-4CB0-9F83-9E7A62F93F65@gmail.com>
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-5-christianshewitt@gmail.com>
 <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_022005_761203_4A92412B 
X-CRM114-Status: GOOD (  14.93  )
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

Cj4gT24gMjcgSmFuIDIwMjMsIGF0IDI6MDYgcG0sIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4gT24gMjcvMDEvMjAyMyAxMTow
MiwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gQlBJLU0yLVBSTyBpcyBiYXNlZCB1cG9uIHRo
ZSBCUEktTTUgZGVzaWduIGV4Y2VwdCBmb3IgYSBkaWZmZXJlbnQKPj4gcGh5c2ljYWwgYm9hcmQg
bGF5b3V0IGFuZCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4+IAo+PiAtIFVTQiAzLjAgcG9ydHMg
cmVkdWNlZCBmcm9tIDR4IHRvIDJ4Cj4+IC0gMy41bW0gQ29tYmluZWQgQ1ZCUy9BdWRpbyBKYWNr
IHJlbW92ZWQKPj4gLSBSVEw4ODIxQlUgV2lGaS9CVCBtb2R1bGUgKGludGVybmFsIFVTQiBjb25u
ZWN0ZWQpCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5z
aGV3aXR0QGdtYWlsLmNvbT4KPj4gLS0tCj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9N
YWtlZmlsZSAgICAgICAgICB8ICAxICsKPj4gLi4uL2R0cy9hbWxvZ2ljL21lc29uLXNtMS1iYW5h
bmFwaS1tMi1wcm8uZHRzIHwgOTggKysrKysrKysrKysrKysrKysrKwo+PiAyIGZpbGVzIGNoYW5n
ZWQsIDk5IGluc2VydGlvbnMoKykKPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtYmFuYW5hcGktbTItcHJvLmR0cwo+PiAKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBpbmRleCA5N2I0MmUyMTAwZTAuLjY0NDQ1MTc5
NGFjYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxl
Cj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+PiBAQCAtNjAs
NiArNjAsNyBAQCBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXdldGVrLWNv
cmUyLmR0Ygo+PiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tczQtczgwNXgyLWFx
MjIyLmR0Ygo+PiBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLWE5NXhmMy1h
aXItZ2JpdC5kdGIKPj4gZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS1hOTV4
ZjMtYWlyLmR0Ygo+PiArZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS1iYW5h
bmFwaS1tMi1wcm8uZHRiCj4+IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEt
YmFuYW5hcGktbTUuZHRiCj4+IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEt
aDk2LW1heC5kdGIKPj4gZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS1raGFk
YXMtdmltM2wuZHRiCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tc20xLWJhbmFuYXBpLW0yLXByby5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tc20xLWJhbmFuYXBpLW0yLXByby5kdHMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi40ODkwZDVkOWE0ZjcKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLWJhbmFuYXBpLW0yLXBy
by5kdHMKPj4gQEAgLTAsMCArMSw5OCBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEJheUxp
YnJlIFNBUwo+PiArICogQXV0aG9yOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cj4+ICsgKi8KPj4gKwo+PiArL2R0cy12MS87Cj4+ICsKPj4gKyNpbmNsdWRlICJtZXNv
bi1zbTEtYmFuYW5hcGkuZHRzaSIKPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9zb3VuZC9tZXNv
bi1nMTJhLXRvaGRtaXR4Lmg+Cj4+ICsKPj4gKy8gewo+PiArCWNvbXBhdGlibGUgPSAiYmFuYW5h
cGksYnBpLW0yLXBybyIsICJhbWxvZ2ljLHNtMSI7Cj4+ICsJbW9kZWwgPSAiQmFuYW5hIFBpIEJQ
SS1NMi1QUk8iOwo+PiArCj4+ICsJc291bmQgewo+PiArCQljb21wYXRpYmxlID0gImFtbG9naWMs
YXhnLXNvdW5kLWNhcmQiOwo+PiArCQltb2RlbCA9ICJCUEktTTItUFJPIjsKPj4gKwkJYXVkaW8t
YXV4LWRldnMgPSA8JnRkbW91dF9iPjsKPj4gKwkJYXVkaW8tcm91dGluZyA9ICJURE1PVVRfQiBJ
TiAwIiwgIkZSRERSX0EgT1VUIDEiLAo+PiArCQkJCSJURE1PVVRfQiBJTiAxIiwgIkZSRERSX0Ig
T1VUIDEiLAo+PiArCQkJCSJURE1PVVRfQiBJTiAyIiwgIkZSRERSX0MgT1VUIDEiLAo+PiArCQkJ
CSJURE1fQiBQbGF5YmFjayIsICJURE1PVVRfQiBPVVQiOwo+PiArCj4+ICsJCWFzc2lnbmVkLWNs
b2NrcyA9IDwmY2xrYyBDTEtJRF9NUExMMj4sCj4+ICsJCQkJICA8JmNsa2MgQ0xLSURfTVBMTDA+
LAo+PiArCQkJCSAgPCZjbGtjIENMS0lEX01QTEwxPjsKPj4gKwkJYXNzaWduZWQtY2xvY2stcGFy
ZW50cyA9IDwwPiwgPDA+LCA8MD47Cj4+ICsJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI5NDkx
MjAwMD4sCj4+ICsJCQkJICAgICAgIDwyNzA5NTA0MDA+LAo+PiArCQkJCSAgICAgICA8MzkzMjE2
MDAwPjsKPj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+IAo+IEl0J3MgYnkgZGVmYXVsdC4gRGlkIGFu
eSBEVFNJIGRpc2FibGUgdGhlIHNvdW5kIG5vZGU/CgpOby4gSeKAmW0gc2ltcGx5IHRyYW5zY3Jp
YmluZyBmcm9tIHRoZSBvcmlnaW5hbCBNNSBkdHMgKHdpdGggZWRpdHMgdG8gb21pdAp0aGUgYXVk
aW8gamFjayBiaXRzKSBhbmQgdGhlIHNvdW5kIG5vZGVzIG9mIG90aGVyIEFtbG9naWMgZHRzIHdo
aWNoIGhhdmUKbG9uZyBpbmNsdWRlZCB0aGUgc2FtZS4gCgpRLiBEbyBJIG5lZWQgdG8gcmVtb3Zl
IGl0IGhlcmU/IChzb3VuZHMgbGlrZSBhIHllcykKUS4gRG8gd2UgbmVlZCB0byBleG9yY2lzZS9j
bGVhbnVwIHRoZSBzYW1lIGZyb20gYWxsIG90aGVyIG1lc29uIGR0cz8KCkNocmlzdGlhbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
