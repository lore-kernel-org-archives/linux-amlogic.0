Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E307C43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmLcNpBzCqRLiTUD3+IT1FtNSDQFVY+Bm00p8KZ3fcA=; b=J1qJKUBhP+m9cM
	RQtQqIk2JrniN3ZnPYpcCL2M1jIaYAY0z8L/g7LD1K5wQtGen71/PM8KKBWZSMB/k1U42IW4GTscc
	wVlWY/k7GMdQM2f2bnBvbuKDHIuMkorFzvaQLu6ERC+NHnsWqoJQXis8PkpBrleozAvkM271IERjL
	ZtSbLgfepzrE9e4eOfwW3uqNXgq3pI3UfPZYsToevA4MvLUlG/D4/qCDYdt1ZL2gTEpmMyV/lITOH
	kOEuT49MhotPO3HPqGsJ48z+JyKeVE63KP9Sog8Svf0g14Polezd2Nz1TFZpK37EF0+icBU+8C1R4
	zB7aZevnby5XULCGBkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5bu7-00E84v-5p; Sun, 26 Jun 2022 23:42:59 +0000
Received: from m1550.mail.126.com ([220.181.15.50])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5bu3-00E81x-9x; Sun, 26 Jun 2022 23:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=1jjBM
	0G8rePWSenCZFvS1Ki1QCFz4BJbCCrehpQ20cE=; b=gMO/M/d7xaDDoahP/jDSD
	0WQGrAQaZ/DxoHjhmv0nxVZPS36f87snXwTFxB85K4MsADcL8bqmNbCRHehshb2j
	AC680cjyIwqqDLUH/ftY5AJKFkZ3eHMX3S/9KTVIk8d4/yDvVbNjTcphvuVZQuHt
	E5mDXzJUTWajsrOM0gC8uU=
Received: from windhl$126.com ( [123.112.70.164] ) by ajax-webmail-wmsvr50
 (Coremail) ; Mon, 27 Jun 2022 07:42:24 +0800 (CST)
X-Originating-IP: [123.112.70.164]
Date: Mon, 27 Jun 2022 07:42:24 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Cc: "Neil Armstrong" <narmstrong@baylibre.com>, jbrunet@baylibre.com, 
	mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH] clk/meson: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAFBinCB3=JWs78oC1GrZ_JkW56np1CAVkW25uST5hhYfoXxu-A@mail.gmail.com>
References: <20220624102719.4166125-1-windhl@126.com>
 <CAFBinCB3=JWs78oC1GrZ_JkW56np1CAVkW25uST5hhYfoXxu-A@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <18de8077.1a5.181a2651e88.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowAAnfPDi7rhiSs49AA--.13220W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAEsF2JVkEOkagAAso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_164255_706256_C4124EA5 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpBdCAyMDIyLTA2LTI3IDA2OjAyOjQ1LCAiTWFydGluIEJsdW1lbnN0aW5nbCIgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+SGVsbG8sCj4KPnRoYW5rIHlvdSBm
b3Igc3VibWl0dGluZyB0aGlzIHBhdGNoIQo+Cj5PbiBGcmksIEp1biAyNCwgMjAyMiBhdCAxMjoy
OCBQTSBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Wy4uLl0KPj4gIHRoZXNlIGJ1
Z3MgYXJlIGNvbXBpbGVkIHRlc3RlZCBpbiA1LjE5cmMyIHdpdGggYXQ5MV9kdF9kZWZjb25maWcK
PlBsZWFzZSBub3RlIHRoYXQgeW91J3JlIGNoYW5naW5nIHNvbWUgZHJpdmVycyB3aGljaCBhcmUg
b25seSBpbiB0aGUKPmFyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnIHdoaWxlIG90
aGVycyBhcmUgb25seSBpbgo+YXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZwo+SSB0aGluayBh
dDkxX2R0X2RlZmNvbmZpZyB3aWxsIG5vdCBjb21waWxlIGFueSBvZiB0aGUgZHJpdmVycyBiZWxv
dwo+CgpIaSwgTWFydGluLgoKVG8gc2ltcGxpZnkgdGhlIGJ1aWxkaW5nIHRlc3QsIEkgdXNlIHRo
ZSBhdDkxX2R0X2RlZmNvbmZpZyB0byBidWlsZCAuY29uZmlnCmZvciB0aGVzZSBzaW1pbGFyIGJ1
Z3MgaW4gY2xrLWF0OTEsIGNsay1zcHJko6xldGMuClRoZW4gSSB1c2UgZm9sbG93aW5nIGNvbW1h
bmQgdG8gY29tcGxldGUgZGlmZmVyZW50IGNvbXBpbGUgdGVzdHMgZm9yIGNsay1tZXNvbjoKCm1h
a2UgQ09ORklHX0FSQ0hfTUVTT049eSBDT05GSUdfQ09NTU9OX0NMS19NRVNPTjhCPXkgQ1JPU1Nf
Q09NUElMRT1hcm0tbGludXgtZ251ZWFiaS0gQVJDSD1hcm0gLi9kcml2ZXJzL2Nsay9tZXNvbi9t
ZXNvbjhiLm8KbWFrZSBDT05GSUdfQVJDSF9NRVNPTj15IENPTkZJR19DT01NT05fQ0xLX01FU09O
X0VFX0NMS0M9eSBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpLSBBUkNIPWFybSAuL2Ry
aXZlcnMvY2xrL21lc29uL21lc29uLWVlY2xrLm8KbWFrZSBDT05GSUdfQVJDSF9NRVNPTj15IENP
TkZJR19DT01NT05fQ0xLX01FU09OX0FPX0NMS0M9eSBDUk9TU19DT01QSUxFPWFybS1saW51eC1n
bnVlYWJpLSBBUkNIPWFybSAuL2RyaXZlcnMvY2xrL21lc29uL21lc29uLWFvY2xrLm8KCkkgd2ls
bCBhZGQgdGhlc2UgZGV0YWlsZWQgY29tcGlsZSBjb21tYW5kcyBpbiBteSB2ZXJzaW9uLTIgcGF0
Y2ggYW5kIGFsc28gaW4gZnV0dXJlIHBhdGNoIGNvbW1pdC4KCj5bLi4uXQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvbWVzb24vbWVzb244Yi5jIGIvZHJpdmVycy9jbGsvbWVzb24vbWVzb244
Yi5jCj4+IGluZGV4IDhmM2I3YTk0YTY2Ny4uNTQxODgzMTlmMzQ5IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2Nsay9tZXNvbi9tZXNvbjhiLmMKPj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vbWVz
b244Yi5jCj4+IEBAIC0zNzk2LDggKzM3OTYsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IG1lc29u
OGJfY2xrY19pbml0X2NvbW1vbihzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+PiAgICAgICAgIHN0
cnVjdCBjbGsgKm5vdGlmaWVyX2NsazsKPj4gICAgICAgICBzdHJ1Y3QgcmVnbWFwICptYXA7Cj4+
ICAgICAgICAgaW50IGksIHJldDsKPj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnRwOwo+
VGhpcyBmdW5jdGlvbiB1c2VzIHJldmVyc2UgY2hyaXN0bWFzIHRyZWUgc29ydGluZywgc28gdGhl
IGxvbmdlc3QgbGluZQo+Z29lcyBvbiB0b3Agd2hpbGUgdGhlIHNob3J0ZXN0IHNob3VsZCBzdGF5
IG9uIHRoZSBib3R0b20uCj5DYW4geW91IHBsZWFzZSBleHBsYWluIHdoYXQgInRwIiBzdGFuZHMg
Zm9yPyBQZXJzb25hbGx5IEkgd291bGQgY2FsbAo+dGhpcyB2YXJpYWJsZSBwYXJlbnRfbnAsIGJ1
dCBtYXliZSAidHAiIGhhcyBhIHNpbWlsYXIgbWVhbmluZy4KPgo+Cj5CZXN0IHJlZ2FyZHMsCj5N
YXJ0aW4KClRoYW5rcyB2ZXJ5IG11Y2gsIE1hcnRpbi4KCkkgd2lsbCBzZW5kIHZlcnNpb24tMiBw
YXRjaCB0byBrZWVwIHRoZSAgcmV2ZXJzZSBjaHJpc3RtYXMgdHJlZS4KQW5kIEkgd2lsbCBmb2xs
b3cgdGhpcyBydWxlIGluIG15IGZ1dHVyZSBwYXRjaCBjb2RlLgoKSSBqdXN0IHdhbnQgdG8gdWVz
ICd0cCcgYXMgJ3RtcF9wb2ludGVyJywgYnV0IHlvdXIgYWR2aWNlIGlzCm1vcmUgcmVhc29uYWJs
ZSBhbmQgSSB3aWxsIGNoYW5nZSB0aGF0IGluIHZlcnNpb24tMiBwYXRjaC4KCkxpYW5nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
