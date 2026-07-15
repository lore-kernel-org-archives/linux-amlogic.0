Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B095C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTSzAGKrmm67AW7DIpf4kwxj3trUNDWawIgSQ6Weyqs=; b=LGYsRfckXYH2H5
	lTAouA9l/PqUP/yjCuOqlPYct6uqcnKKlOlavYS9xrDkeqdi9FvwImXuQskTTGEltzWhRfY0kCh5k
	NYnltKAiTjyVC04DSW1rT4z2pzSyKbUq7LlBZffpYDepVYVr3d6SNX0FCSjY2/pqBcDzZ0Ao3i5Fa
	t/FuezfVA6u9NFc+OaD4dzp1SEEoQ+AjkIO7UAN7vrUe6qKBjbJ+rq/kL4FJ3v6IT1b0lFQkPBDTG
	Jd7rC8Fju65glUtTLTT9bm0HLxT0JAqyfE5X6YyEJD5LACw+AavmCa2UBMhi+9XAU/B/3Xmz4WqnL
	HomIHM3oVbERJ5Pf8SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3vB-0000000Fbvg-2OsN;
	Wed, 15 Jul 2026 18:01:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3vA-0000000FbvV-31AL
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E8F40AF7;
	Wed, 15 Jul 2026 18:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22591F000E9;
	Wed, 15 Jul 2026 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138484;
	bh=mlxZwrSj52gIvTUPUdAYBmpMOM91NMc8x8fb2guLXC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oQiRJPpnZWv9R7Z2xH7O8qWxNmOgJ7Qz+OVrt4jR0NTAM6HOhwMXil/JASaTGkdng
	 deBtvUH2FGrZHCqGVP36zIFRL3QWrxVIWaOx+l5xDbaLYyxUXsnflnBY/pedVdGOn1
	 6oxQ9yUSnO4mxw/F4JlwgCtzosel5qarlhRFG9mQ+Iu8C3DRWC2YvSDtOG2mZHjEvE
	 Z/VOvMRd+S6+lY57v7e60Om9gdNZ2N5vVK1K/tfGWwQja0op4kD5PD6dMSi/1miLR+
	 dGPSQ3IGG2NaWjJ6GnBXXtYQZ1v3y6eLQmXLesKvPP1wr9NtoOPoE84q+cMo5wqhfo
	 LdFvD/RlTUcuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] rtc: make all reg_write callbacks take const void *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, Frank.Li@kernel.org, linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev, lee@kernel.org, imx@lists.linux.dev, ojeda@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260715175229.24672-4-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-4-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:01:23 +0000
Message-Id: <20260715180123.C22591F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gSW1wbGljaXQgcG9pbnRl
ciBjb252ZXJzaW9ucyBkaXNjYXJkIHRoZSAnY29uc3QnIHF1YWxpZmllciwgY2F1c2luZyBjb21w
aWxlciB3YXJuaW5ncy4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCAzLzhdIHJ0YzogbWFrZSBh
bGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKiAtLS0KY29tbWl0IGRjY2Vi
YTY2YzQ1YWViMWUwZGE1ZGZhZjRjZDdiM2UwODI4ZWM2OWUKQXV0aG9yOiBMaW5rIE1hdXZlIDxs
aW5rbWF1dmVAbGlua21hdXZlLmZyPgoKcnRjOiBtYWtlIGFsbCByZWdfd3JpdGUgY2FsbGJhY2tz
IHRha2UgY29uc3Qgdm9pZCAqCgpUaGlzIGNvbW1pdCB1cGRhdGVzIHZhcmlvdXMgUlRDIGRyaXZl
cnMgdG8gdXNlIGEgY29uc3Qgdm9pZCAqIHBhcmFtZXRlciBmb3IKdGhlaXIgbnZtZW1fY29uZmln
IHdyaXRlIGNhbGxiYWNrcywgYWxpZ25pbmcgd2l0aCB0aGUgdXBkYXRlZCBudm1lbV9jb25maWcg
QVBJLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWNtb3MuYyBiL2RyaXZlcnMvcnRj
L3J0Yy1jbW9zLmMKPiBpbmRleCBmYTA0ZWNlMTUxYjhiLi4wOWRhNzFhMDAwOWU4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1jbW9zLmMKPiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtY21v
cy5jClsgLi4uIF0KPiBAQCAtNjU5LDcgKzY1OSw3IEBAIHN0YXRpYyBpbnQgY21vc19udnJhbV9y
ZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmYsIHZvaWQgKnZhbCwKPiAgCXJldHVybiAw
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGNtb3NfbnZyYW1fd3JpdGUodm9pZCAqcHJpdiwgdW5z
aWduZWQgaW50IG9mZiwgdm9pZCAqdmFsLAo+ICtzdGF0aWMgaW50IGNtb3NfbnZyYW1fd3JpdGUo
dm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZiwgY29uc3Qgdm9pZCAqdmFsLAo+ICAJCQkgICAg
c2l6ZV90IGNvdW50KQo+ICB7Cj4gIAlzdHJ1Y3QgY21vc19ydGMJKmNtb3MgPSBwcml2OwoKW1Nl
dmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBjYXVzZSBhIGNvbXBpbGVyIHdhcm5pbmcgZm9yIGRpc2Nh
cmRlZCBxdWFsaWZpZXJzPwoKSW4gdGhlIGJvZHkgb2YgY21vc19udnJhbV93cml0ZSgpLCB0aGUg
Y29kZSBhc3NpZ25zIHZhbCB0byBhIG5vbi1jb25zdApwb2ludGVyIGp1c3QgYmVsb3cgdGhlIGRp
ZmYgY29udGV4dDoKCiAgICB1bnNpZ25lZCBjaGFyICpidWYgPSB2YWw7CiAgICAKU2hvdWxkIGJ1
ZiBhbHNvIGJlIGRlY2xhcmVkIGFzIGNvbnN0IHVuc2lnbmVkIGNoYXIgKiB0byBhdm9pZCBicmVh
a2luZwpidWlsZHMgd2hlcmUgd2FybmluZ3MgYXJlIHRyZWF0ZWQgYXMgZXJyb3JzPwoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXJ2MzAzMi5jIGIvZHJpdmVycy9ydGMvcnRjLXJ2MzAz
Mi5jCj4gaW5kZXggNmJhZmRlYzYzN2FlYS4uYjZiNDAxYmUwOWJiNSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3J0Yy9ydGMtcnYzMDMyLmMKPiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtcnYzMDMyLmMK
WyAuLi4gXQo+IEBAIC00OTMsNyArNDkzLDcgQEAgc3RhdGljIGludCBydjMwMzJfbnZyYW1fcmVh
ZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsIHNpemVfdAo+ICAJ
cmV0dXJuIHJlZ21hcF9idWxrX3JlYWQocHJpdiwgUlYzMDMyX1JBTTEgKyBvZmZzZXQsIHZhbCwg
Ynl0ZXMpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHJ2MzAzMl9lZXByb21fd3JpdGUodm9pZCAq
cHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4gK3N0
YXRpYyBpbnQgcnYzMDMyX2VlcHJvbV93cml0ZSh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LCBjb25zdCB2b2lkICp2YWwsIHNpemVfdCBieXRlcykKPiAgewo+ICAJc3RydWN0IHJ2MzAz
Ml9kYXRhICpydjMwMzIgPSBwcml2Owo+ICAJdTMyIHN0YXR1cywgZWVyZDsKCltTZXZlcml0eTog
TG93XQpTaW1pbGFyIHRvIHRoZSBjbW9zIGRyaXZlciwgZG9lcyB0aGlzIGRpc2NhcmQgdGhlIGNv
bnN0IHF1YWxpZmllcj8KClRoZSBydjMwMzJfZWVwcm9tX3dyaXRlKCkgZnVuY3Rpb24gYXNzaWdu
cyB0aGUgbmV3IGNvbnN0IHZvaWQgKnZhbCB0byBhIApub24tY29uc3QgcG9pbnRlciBqdXN0IGJl
bG93IHRoZSBxdW90ZWQgZGlmZiBjb250ZXh0OgoKICAgIHU4ICpidWYgPSB2YWw7CgpTaG91bGQg
dGhpcyBiZSB1cGRhdGVkIHRvIGNvbnN0IHU4ICpidWYgYXMgd2VsbD8KCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcnRjL3J0Yy1zMzUzOTBhLmMgYi9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jCj4g
aW5kZXggYjcyZWVmNGZiMDk5Ny4uNzNmZjA0OTFmNjc1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3J0Yy9ydGMtczM1MzkwYS5jCj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYwpbIC4u
LiBdCj4gQEAgLTY3LDcgKzY3LDcgQEAgc3RydWN0IHMzNTM5MGEgewo+ICAJaW50IHR3ZW50eWZv
dXJob3VyOwo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBzMzUzOTBhX3NldF9yZWcoc3RydWN0IHMz
NTM5MGEgKnMzNTM5MGEsIGludCByZWcsIHU4ICAqYnVmLCBpbnQgbGVuKQo+ICtzdGF0aWMgaW50
IHMzNTM5MGFfc2V0X3JlZyhzdHJ1Y3QgczM1MzkwYSAqczM1MzkwYSwgaW50IHJlZywgY29uc3Qg
dTggKmJ1ZiwgaW50IGxlbikKPiAgewo+ICAJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IHMz
NTM5MGEtPmNsaWVudFtyZWddOwo+ICAJc3RydWN0IGkyY19tc2cgbXNnW10gPSB7CgpbU2V2ZXJp
dHk6IExvd10KRG9lcyB0aGlzIGFzc2lnbm1lbnQgaW4gczM1MzkwYV9zZXRfcmVnKCkgdHJpZ2dl
ciBhIGRpc2NhcmRlZCBxdWFsaWZpZXJzCndhcm5pbmc/CgpUaGUgc3RydWN0IGkyY19tc2cgZGVm
aW5lcyBpdHMgYnVmIG1lbWJlciBhcyBfX3U4ICogKG5vbi1jb25zdCkuIFdoZW4gdGhlCm1zZyBh
cnJheSBpcyBpbml0aWFsaXplZCBqdXN0IGJlbG93IHRoaXMgaHVuazoKCiAgICBzdHJ1Y3QgaTJj
X21zZyBtc2dbXSA9IHsKICAgICAgICB7CiAgICAgICAgICAgIC5hZGRyID0gY2xpZW50LT5hZGRy
LAogICAgICAgICAgICAubGVuID0gbGVuLAogICAgICAgICAgICAuYnVmID0gYnVmCiAgICAgICAg
fSwKICAgIH07CgpXaWxsIGFzc2lnbmluZyB0aGUgY29uc3QgdTggKmJ1ZiB0byB0aGUgbm9uLWNv
bnN0IC5idWYgZmllbGQgY2F1c2UgYSBjb21waWxlcgp3YXJuaW5nPyBXb3VsZCBpdCBiZSBiZXR0
ZXIgdG8gZXhwbGljaXRseSBjYXN0IGl0IGxpa2UgKHU4ICopYnVmIHRvIHNhdGlzZnkKdGhlIGky
Y19tc2cgc3RydWN0IGRlZmluaXRpb24/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzE1MTc1MjI5LjI0NjcyLTEtbGlua21hdXZl
QGxpbmttYXV2ZS5mcj9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
