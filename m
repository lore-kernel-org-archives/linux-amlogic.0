Return-Path: <SRS0=Y6TM=YP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6544CCA9EA0
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2019 05:49:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A2220B7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2019 05:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UD5iJfB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A2220B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKYI1GeGE5TkIVd98P99KMQIEO57wm5Nom6TouJFIAw=; b=UD5iJfB38Y4ynx4O+yMvswMAr
	rwbP442vozyHAbB/PSqmkfQQ4D8fenqkZTpNO3P79/WLwO0BVIqYdBQXabMSY/GaAReM4s6gqr1pN
	HCuHo5CO7Vb0e5VV5/6roAVkmxSnYYBBAMShpsSd2bTIMIVWOADUv/QDJPsQ7vE5k8sJ5zoybYiSI
	/vZX5Jsnn1zi8FffnXOeJEYITTHeH/DKwD4sB9WCPqVauZNfQnlpMmg4qJVbFdXadvMFj9857rmOK
	qOeFEeHUyS5DlbLDNFNwKGIdBf9ao/87V9PwiaNv0X9SVdexMG2Lz7N5nfPn+9OuKQS9J+HkIi75A
	HirbMgFbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMn2m-0007dE-Hf; Tue, 22 Oct 2019 05:49:20 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMn2c-0007W3-U8; Tue, 22 Oct 2019 05:49:12 +0000
Received: from [10.28.19.63] (10.28.19.63) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 22 Oct
 2019 13:49:20 +0800
Subject: Re: [PATCH v2 3/4] watchdog: add meson secure watchdog driver
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
 <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
 <7397f6db-1dc8-3abd-41ff-2e47323c7ffa@roeck-us.net>
 <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
 <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <1b841195-cf76-7128-9569-5c2b0d39c1c1@amlogic.com>
Date: Tue, 22 Oct 2019 13:49:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
Content-Language: en-GB
X-Originating-IP: [10.28.19.63]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_224910_972095_FF584F31 
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIEd1ZW50ZXIKCk9uIDIwMTkvMTAvMjEgMjE6MzgsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4g
T24gMTAvMjEvMTkgMTowMyBBTSwgWGluZ3l1IENoZW4gd3JvdGU6Cj4+IEhpLCBHdWVudGVyCj4+
Cj4+IE9uIDIwMTkvMTAvMjEgMDo1NiwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4+IE9uIDEwLzE4
LzE5IDE6MzMgQU0sIFhpbmd5dSBDaGVuIHdyb3RlOgo+Pj4+IFRoZSB3YXRjaGRvZyBjb250cm9s
bGVyIG9uIHRoZSBNZXNvbi1BL0Mgc2VyaWVzIFNvQ3MgaXMgbW92ZWQgdG8gc2VjdXJlCj4+Pj4g
d29ybGQsIHdhdGNoZG9nIG9wZXJhdGlvbiBuZWVkcyB0byBiZSBkb25lIGluIHNlY3VyZSBFTDMg
bW9kZSB2aWEgQVRGLAo+Pj4+IE5vbi1zZWN1cmUgd29ybGQgY2FuIGNhbGwgU01DIGluc3RydWN0
aW9uIHRvIHRyYXAgdG8gQUZUIGZvciB3YXRjaGRvZwo+Pj4+IG9wZXJhdGlvbi4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBDaGVuIDx4aW5neXUuY2hlbkBhbWxvZ2ljLmNvbT4KPj4+
PiAtLS0KPj4+PiDCoCBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxNyArKysrCj4+Pj4gwqAgZHJpdmVycy93YXRjaGRvZy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKg
IHzCoMKgIDEgKwo+Pj4+IMKgIGRyaXZlcnMvd2F0Y2hkb2cvbWVzb25fc2VjX3dkdC5jIHwgMTg3
IAo+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgIDMg
ZmlsZXMgY2hhbmdlZCwgMjA1IGluc2VydGlvbnMoKykKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy93YXRjaGRvZy9tZXNvbl9zZWNfd2R0LmMKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcKPj4+
PiBpbmRleCA1OGU3YzEwLi5lODRiZTQyIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvS2NvbmZpZwo+Pj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZwo+Pj4+IEBAIC04
MjYsNiArODI2LDIzIEBAIGNvbmZpZyBNRVNPTl9HWEJCX1dBVENIRE9HCj4+Pj4gwqDCoMKgwqDC
oMKgwqAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTog
dGhlCj4+Pj4gwqDCoMKgwqDCoMKgwqAgbW9kdWxlIHdpbGwgYmUgY2FsbGVkIG1lc29uX2d4YmJf
d2R0Lgo+Pj4+ICtjb25maWcgTUVTT05fU0VDX1dBVENIRE9HCj4+Pj4gK8KgwqDCoCB0cmlzdGF0
ZSAiQW1sb2dpYyBNZXNvbiBTZWN1cmUgd2F0Y2hkb2cgc3VwcG9ydCIKPj4+PiArwqDCoMKgIGRl
cGVuZHMgb24gTUVTT05fU00KPj4+PiArwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBD
T01QSUxFX1RFU1QKPj4+Cj4+PiBUaGlzIGRlcGVuZGVuY3kgaXMgcG9pbnRsZXNzLiBNRVNPTl9T
TSBhbHJlYWR5IGRlcGVuZHMgb24gQVJDSF9NRVNPTiwKPj4+IHRodXMgc3BlY2lmeWluZyAiQ09N
UElMRV9URVNUIiBoZXJlIGFkZHMgbm8gdmFsdWUgYnV0IG9ubHkKPj4+IGNyZWF0ZXMgY29uZnVz
aW9uLgo+PiBUaGFua3MgZm9yIHlvdXIgYW5hbHlzaXMsIHBlcmhhcHMgaSBzaG91bGQgcmVtb3Zl
IHRoZSBsaW5lIGJlbG93Lgo+PiAtIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RF
U1QKPj4KPj4gSXMgaXQgb2sgdG8gbW9kaWZ5IGNvZGUgYWJvdmUgbGlrZSB0aGlzID8KPiAKPiBZ
ZXMuClRoYW5rcywgZml4IGl0IGluIG5leHQgdmVyc2lvbi4KCj4gWyAuLi4gXQo+IAo+Pj4+ICtz
dGF0aWMgdW5zaWduZWQgaW50IG1lc29uX3NlY193ZHRfZ2V0X3RpbWVsZWZ0KHN0cnVjdCAKPj4+
PiB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIGludCByZXQ7
Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgdGltZWxlZnQ7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
bWVzb25fc2VjX3dkdCAqZGF0YSA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkdF9kZXYpOwo+Pj4+
ICsKPj4+PiArwqDCoMKgIHJldCA9IG1lc29uX3NtX2NhbGwoZGF0YS0+ZncsIFNNX1dBVENIRE9H
X09QUywgVGhhbmtzJnRpbWVsZWZ0LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTUVTT05fU0lQX1dEVF9HRVRUSU1FTEVGVCwgMCwgMCwgMCwgMCk7Cj4+Pj4gKwo+Pj4+ICvC
oMKgwqAgaWYgKHJldCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+Cj4+PiBN
ZWgsIHRoYXQgZG9lc24ndCB3b3JrLiBJIGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGUgcmV0dXJuIHR5
cGUgaXMgCj4+PiB1bnNpZ25lZCwKPj4+IHNvIHJldHVybmluZyBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUgaXMgcG9pbnRsZXNzLiBHdWVzcyB3ZSdsbCBoYXZlIHRvCj4+PiBsaXZlIHdpdGggcmV0dXJu
aW5nIDAgaW4gdGhpcyBjYXNlIGFmdGVyIGFsbC4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkCj4+PiBm
aXggdGhlIEFQSSBhbmQgcmV0dXJuIGFuIGludGVnZXIgKHdpdGggbmVnYXRpdmUgZXJyb3IgY29k
ZSksIGJ1dCB0aGF0Cj4+PiBpcyBhIGRpZmZlcmVudCBxdWVzdGlvbi4KPj4gVGhhbmtzIGZvciB5
b3VyIHJldmlldy4KPj4KPj4gSU1PLCBpZiByZXR1cm5pbmcgYW4gaW50ZWdlciwgYW5kIHRoZSB2
YWx1ZSB3aGljaCBjb3B5IHRvIHVzZXIgYnVmIAo+PiBzaG91bGQgYmUgZm9ybWF0dGVkIHdpdGgg
JWQgaW5zdGVhZCBvZiAldSAoc2VlIHRpbWVsZWZ0X3Nob3cpLCBpdCB3aWxsIAo+PiBjYXVzZSB0
aGUgbWF4IHZhbHVlIG9mIHRpbWVsZWZ0IGlzIHJlZHVjZWQgZnJvbSA0Mjk0OTY3Mjk1IHRvIAo+
PiAyMTQ3NDgzNjQ3LiBidXQgaSdhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IHdpbGwgYnJpbmcgcmlz
ay4KPiAKPiBOb3QgdGhhdCBpdCBtYXR0ZXJzIHJpZ2h0IG5vdywgYnV0IEkgZG9uJ3QgdGhpbmsg
dGhhdCBsaW1pdGluZyAndGltZWxlZnQnCj4gcmVwb3J0aW5nIHRvIDIxNDc0ODM2NDcgc2Vjb25k
cywgb3IgfjY4IHllYXJzLCB3b3VsZCBjYXVzZSBhbnkgcmlzay4KPiBJdCB3b3VsZCBqdXN0IGJl
IGEgbGFyZ2UgcGF0Y2ggY2hhbmdpbmcgc2V2ZXJhbCBkcml2ZXJzIGFsbCBhdCBvbmNlLAo+IHRo
YXQgaXMgYWxsLgo+IAo+Pgo+PiBTbyBpIGFsc28gdGhpbmsgcmV0dXJuaW5nIDAgbWF5IGJlIGJl
dHRlciBpbiB0aGlzIGNhc2UuCj4gCj4gWWVzLCBwbGVhc2UgZG8gdGhhdC4KVGhhbmtzLCBmaXgg
aXQgaW4gbmV4dCB2ZXJzaW9uLgo+IAo+IFRoYW5rcywKPiBHdWVudGVyCj4gCj4gLgo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
