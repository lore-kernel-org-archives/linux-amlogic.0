Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FB8FF885A
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2026 04:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97GVY7phXu4b5NDNrzQa1nIftVssRJPW3DRUcYf9wuM=; b=EgsyH0CcwdnCgE
	ytvpvZ7rne/OSxRw9gl+6XjyJOZi97jV/kerggGCLNMedJk59vOTdp+xYLE5UiDtJj67JxAsEdqJq
	2n2d5Ltic2+JM29nW2ZcyX3uHvnfJn1Kst8CYswFx+ETvN2jbtdGrIYanOLIvkBevHpFFDH/Qzh+Q
	Q+IkYzsAfT/NmANg//pSCZQTk3gXP152BIsj35TECDBLrJ0t8udwY4ha/3qy0BSTgg6apXOvBhm9k
	0ujRy0UolY7Fi0z5Ro7FzvI9jDhQ4BLuAoK/zQ1aCy5SpM9R9Z5W/MyIbV1BBCBJY13QlfCWDJS2P
	qPrLEri+HN04FIe2chqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7Kk-0000000F6Gg-3FyQ;
	Tue, 05 May 2026 04:24:34 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7Kh-0000000F6FH-3qKQ;
	Tue, 05 May 2026 04:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3B2CunHCGpiMjcTDIPvkA5wnx3g/cxDEDO4exp2ZkTA=;
	b=VBoDHIY4WJJi70YRfo0kb2nK/+cju4NajjJmVjFHGt7bThYMY/JDla9gJih2UX
	KZEWKBLXh/MbVlXiXid8BOx2ovYOfsu7WpBfnOLNrzg2JJJjL5dc2c5mpWgtzOZx
	WMWtVyyYMzkssQTjuVe2VJeOtqZUuZud/YB6NXldV8GlY=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3T+7RcPlpXxPvDQ--.4818S2;
	Tue, 05 May 2026 12:23:46 +0800 (CST)
Message-ID: <9be240fa-ab46-4b58-9240-5e96cab8a097@163.com>
Date: Tue, 5 May 2026 12:23:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
To: David Laight <david.laight.linux@gmail.com>
Cc: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 lhjeff911@gmail.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
References: <20260430155456.36998-1-18255117159@163.com>
 <20260501093050.3f97cd3e@pumpkin>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260501093050.3f97cd3e@pumpkin>
X-CM-TRANSID: _____wC3T+7RcPlpXxPvDQ--.4818S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw48Cr43ArW3JFykuFWfKrg_yoW5GrW3pF
	48GF42vFs7JrWFkF4xCrW5CF1Yya4fKrWjga4Ut3s3ZwnYvr17ZrWkt3WrWa9rAFykGFWx
	KF4jy3s0k3ZxZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4OJOUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxUqzWn5cNXchAAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_212432_321321_47BD75B9 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzEvMjYgMTY6MzAsIERhdmlkIExhaWdodCB3cm90ZToKPiBPbiBUaHUsIDMwIEFwciAy
MDI2IDIzOjU0OjQ2ICswODAwCj4gSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4gd3Jv
dGU6Cj4gCj4+IFJlcGxhY2Ugb3Blbi1jb2RlZCBiaXRmaWVsZCBtb2RpZmljYXRpb25zIHdpdGgg
dGhlIHN0YW5kYXJkIEZJRUxEX01PRElGWSgpCj4+IG1hY3JvIGFjcm9zcyBtdWx0aXBsZSBTUEkg
Y29udHJvbGxlciBkcml2ZXJzLiBUaGlzIGltcHJvdmVzIHJlYWRhYmlsaXR5IGFuZAo+PiBhZGRz
IGNvbXBpbGUtdGltZSBjaGVja2luZyB3aXRob3V0IGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBJ
IGRvbid0IHRoaW5rIHRoZXNlIGNoYW5nZXMgYXJlIHdvcnRoIHRoZSBlZmZvcnQuCj4gVGhlIHJl
YWRhYmlsaXR5IGRvZXNuJ3QgY2hhbmdlIG11Y2ggLSB5b3UgbmVlZCB0byBrbm93IHdoYXQgYSBz
bGlnaHRseQo+IG1vcmUgb2JzY3VyZSAnaGVscGVyJyBkb2VzLgo+IFRoZSBleHRyYSBjb21waWxl
LXRpbWUgY2hlY2tzIGFyZSBwcmV0dHkgdW5saWtlbHkgdG8gZXZlciBmaW5kIGEgcHJvYmxlbQo+
IGFuZCBtb3N0bHkganVzdCBzbG93IGRvd24gdGhlIGNvbXBpbGUuCj4gVGhlIGdlbmVyYXRlZCBj
b2RlIGlzIGxpa2VseSBiZSBzbGlnaHRseSB3b3JzZS4KPiBBbmQsIHdpdGggdGhlIGJlc3Qgd2ls
bCBpbiB0aGUgd29ybGQsIGl0IGlzIGVhc3kgdG8gbWFrZSBzaWxseSBtaXN0YWtlcy4KPiAKPiAJ
RGF2aWQKCkhpIERhdmlkLAoKRklFTERfTU9ESUZZKCkgaXMgYSBzdGFuZGFyZCBrZXJuZWwgaGVs
cGVyIChiaXRmaWVsZC5oKSwgbm90IGFuIG9ic2N1cmUKb25lLiBNeSByZWNlbnQgcG93ZXIgZG9t
YWluIHNlcmllcyB1c2luZyBzaW1pbGFyIHBhdHRlcm5zIHdhcyBhY2NlcHRlZDoKCmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1wbS9jb3Zlci8yMDI2MDQzMDE2MzIx
My40NDY5NS0xLTE4MjU1MTE3MTU5QDE2My5jb20vCgpUaGUgUENJZSBtYWludGFpbmVyIGFsc28g
dmFsdWVzIHRoaXMga2luZCBvZiBjb2RlIHNpbXBsaWZpY2F0aW9uLCB3aGljaAplbmNvdXJhZ2Vk
IG1lIHRvIHNlbmQgdGhlc2UgU1BJIHBhdGNoZXMuCgpUaGUgbWFjcm8gb2ZmZXJzIGNvbXBpbGUt
dGltZSBvdmVyZmxvdyBjaGVja3MsIGFuZCBJJ3ZlIHZlcmlmaWVkIHRoZQpnZW5lcmF0ZWQgYXNz
ZW1ibHkgaXMgaWRlbnRpY2FsIChHQ0MvQ2xhbmcpLiBJIGJlbGlldmUgdGhlIHRyYWRl4oCRb2Zm
CmZhdm91cnMgcmVhZGFiaWxpdHkgYW5kIHNhZmV0eS4KCklmIHlvdSBzdGlsbCBwcmVmZXIgdG8g
a2VlcCB0aGUgb3BlbuKAkWNvZGVkIHZlcnNpb25zLCBJJ2xsIGRyb3AgdGhlCnNlcmllcy4gUGxl
YXNlIGxldCBtZSBrbm93LgoKCkJlc3QgcmVnYXJkcywKSGFucwoKPiAKPj4KPj4gRWFjaCBwYXRj
aCBtb2RpZmllcyBhIHNpbmdsZSBkcml2ZXIsIGFsbG93aW5nIGluZGVwZW5kZW50IHJldmlldyBh
bmQKPj4gYXBwbGljYXRpb24uCj4+Cj4+IEhhbnMgWmhhbmcgKDEwKToKPj4gICAgc3BpOiBhbWxv
Z2ljLXNwaWZjLWExOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBhbWxvZ2ljLXNwaXNn
OiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBjYWRlbmNlLXhzcGk6IFVzZSBGSUVMRF9N
T0RJRlkoKQo+PiAgICBzcGk6IG1lc29uLXNwaWNjOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAg
c3BpOiBueHAteHNwaTogVXNlIEZJRUxEX01PRElGWSgpCj4+ICAgIHNwaTogc24tZi1vc3BpOiBV
c2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBzdG0zMi1vc3BpOiBVc2UgRklFTERfTU9ESUZZ
KCkKPj4gICAgc3BpOiBzdG0zMi1xc3BpOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBz
dW5wbHVzLXNwNzAyMTogVXNlIEZJRUxEX01PRElGWSgpCj4+ICAgIHNwaTogdW5pcGhpZXI6IFVz
ZSBGSUVMRF9NT0RJRlkoKQo+Pgo+PiAgIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaWZjLWEx
LmMgfCAgNSArKy0tLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaXNnLmMgICAgfCAx
MyArKysrKy0tLS0tLS0tCj4+ICAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgICB8
ICAzICstLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jICAgICAgfCAgNSArKy0t
LQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1ueHAteHNwaS5jICAgICAgICAgfCAxMiArKysrLS0tLS0t
LS0KPj4gICBkcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgICAgICAgIHwgIDUgKystLS0KPj4g
ICBkcml2ZXJzL3NwaS9zcGktc3RtMzItb3NwaS5jICAgICAgIHwgIDcgKysrLS0tLQo+PiAgIGRy
aXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLmMgICAgICAgfCAgNSArKy0tLQo+PiAgIGRyaXZlcnMv
c3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jICAgfCAgMyArLS0KPj4gICBkcml2ZXJzL3NwaS9zcGkt
dW5pcGhpZXIuYyAgICAgICAgIHwgMTMgKysrKystLS0tLS0tLQo+PiAgIDEwIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQo+Pgo+Pgo+PiBiYXNlLWNvbW1p
dDogM2IzYmVhNmQ0YjljMTYyZjllNTU1OTA1ZDk2YjhjMWRhNjdlY2Q1YgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
