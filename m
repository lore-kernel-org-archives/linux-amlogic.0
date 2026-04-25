Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68747FF8860
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Apr 2026 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9nj6z4OVD9AyG7JUa1BjTjxctBQpMFCLwvw8BH88hk=; b=ousoxnO3qGdMQI
	7S6C8GSmjtVvOzGN9C+mPVwNzNx9+hJHzNh/okGQao8pA6gIjNHfPuSHxYTdEm7bDGqq8bVxNb/VC
	/0TF9FKiQseuuxUB5DRWI0Kf/nBPGLlnAqFp5wvI4tBIbS5cBFGJrEcx/qciA6I0LlGNJqlILy6A3
	vLb+0D9UnMvbDszCezxEOsN22XHZ8OUUahbEV6d5EMFCSQ2ohzA3KtgVliNDStbDEw9NiRTwWWi9R
	vHxAJGaW4mVWxi2bqeJkrsaCt4Rn4PsRrX3dwvCmLXhDs/JVc4BkrSGmC9tKn+qUNsWx/e1o63cng
	yEFFAxq2SBkhAn/HU4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGiYy-0000000ElOS-2gNn;
	Sat, 25 Apr 2026 19:21:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGiYv-0000000ElNg-25Lv
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Apr 2026 19:21:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so12958416a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Apr 2026 12:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777144867; cv=none;
        d=google.com; s=arc-20240605;
        b=Ge/omgPxh+NmB3pHjenoiVW+MzSkZrrtX7uTVH3AHIdjbOmRyHv4ibPoKvT4lYMrCD
         npKEM+KN65dSSoJSyb9aCL8KJ/oXIT2Mb8/zGX+SIywGn2LD3AoNmx8/waJqoMBOEfU5
         qusWRQMUblQF5Y6SZCXw7vhGXqPK8wrKJDHe8I21DtUC7LbiHW0xQMPxIL5bbKisGZL6
         fdXeuqKCGVplbZm1lg9kHXNFBuaxz0mOFKHK+GNxEj+LGggmNGDtzzXAlRue7E7fyhNi
         jR7NYT5a9w9OQFOYVfWr2waQ8oncnhZ/s4KmvXrZiAjfGfpXmT/BLmWkln3/f3akIjau
         QDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        fh=JIinbhqLpzigWOWpoE86hu/sSeMYrOpHZTEDsOkVKoQ=;
        b=G+Nc7bElNvm7UC1xo9Ha8xKGFLz6o4ix0tZzEs1vPZX+q/6b4F9l3wg4yxumMSdXJv
         Egi94aE4LUEW3nEhRPzp3Cp+Ac6nN3zVeYg9eDC2xsea/nksRXat8x9MJ4f96VLXn4WD
         Fs26C/MOfQF/xYmYcJuiM1YeOyEYIRWzBOEM972e75Hzr+DezAVR4qSMvUX2ReBjDbo5
         VsxizEvo9lSmVC3RACMS/FP0A32glpoP6q87DxTerkNhTMSjI8cfLrClnX14srxmakCo
         72dhSJ4qEAlaOfzvgBBUI5zMVsrsiaIeubIyJkQ7GNvHp10hbIceMFdY2YjADkv/SAbq
         8TvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777144867; x=1777749667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        b=LJWIJWgogiz0wrmOit8xKzNrwFGHCx0I5S1G8rW59MssA3yHlMxwkzvragE0bdFmtB
         0dijCfK5osfBNGNSoCxx9VEk5Y+0UcTlI/A9Olxlbf6X255TVydPGwfO4frBNJithfI3
         1jcR8oWkYuk+yrFI5NyMT5za+EVHkBlxvG9blqR7s/AdG12Agp4jh1GSpacBEot99SDn
         mQY2bNdkqBn79djQ6Ic6w096FhWz+K43+gl8L+dZoldTMyaS+t/Hrj4CB2JR/7U89Dkr
         lS6cnCZCC5rFPrgsTOO39Z7nHEK6mp/CAQ5bMqhGx2VuSlucPkkTxb9b/hS5ExaZIfwQ
         cwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777144867; x=1777749667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+8c6yWGMQo5L1X5gw5Y++BUlPK4zJUB8QavkHYAjxYo=;
        b=p3CIsH31WvpCDDwHo1UocuPK0rNx0lF9LmEXeXtBj+U9elrgMtAbu3pMIX2iDYrz7u
         hToS7q18OwOfa4t6yJaBrnT/7/fyx9CGg/HFwGqWB2AEyOmoryJsBUIZzlohEts0lXB4
         ExNPVDn6V+ZhzKuS8e4sUAnbGT9aI/4tUfRs2fvs184ExinO2G3pa93pVIULnnPs0i95
         ja6naO+an52f3/Rh2HBd7fdqNLcqwhMbcb95fbN85Lg/uWEVt7/Cee7TyjuZ0PSYCdHv
         7skuop4VMVJHAnumXExZbxwe3LpqBfuEdQsqSTx/WzvemxkddZjjGtKBaSVIkU6PjufX
         XNSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9S0FBrvxccnjZqt0Is0vkGcKqepwSHUSSPdUO0gOwDz+6gHRWmsbajuKOOC2PvVsxoWcP+u0gRYTXTh2Wf@lists.infradead.org
X-Gm-Message-State: AOJu0YwG6+qjLZ3tmPfkE1okV1c/CcXjWcnFAeRlGV7ZDWOHPbS3bo+G
	OGUXNOfNy+ddJceByD+PqQQROPTSEfQIi10wcMNinYg7o52PHhIbIrVL45Gl37mjOYUJskKOMO0
	wEe0hhV6pXhTNPRTLJI2Bmjkj+OvdFvU=
X-Gm-Gg: AeBDieukwzO4owdK7ETw0nZ2QOKTQLU/x6u6oDyxgyOWA+gr2f8C1IJ5/Ofuby76hMd
	4TF6+H7A+U4lUrUEMxFf9uqbbYWeT5Eu24Bshw0Rh10KBIbY9KOOEJ+hCA5d0QfFUvg84v7KjOB
	Sd3mzjbsyW4pR4AIalpm8dzj2yWDnWrvUmsfsH1xSiJM/kXDqRN9qyMJRoLRxIjhRI9PCGL1fMz
	iGKKgcuArk9F7ux6qUUBx7SaRGQxf8RIXVUW36+zjRmmf64L6D+WH+VwSPMBwjALTwheMfl9mW8
	OfKlJs4GXPrh4Z08bHwjtlA/kDIO44AS34jTBURDA2VbH0xcS6JzEX/OSdSI1NkuHxlsH0F+eFn
	r/Ma+dultomcwlJm6p93urXMdziBQ7IkM81zyNRT57EPPQzjA
X-Received: by 2002:a17:907:7f86:b0:bae:2aac:3cfc with SMTP id
 a640c23a62f3a-bae2aac3d84mr333598766b.3.1777144866692; Sat, 25 Apr 2026
 12:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
In-Reply-To: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Apr 2026 12:20:55 -0700
X-Gm-Features: AQROBzBWERVyzPtDfabAtbUn-NQMbd1-MjW_pzWLW_K4WY_b7oYxhF49AZGCCKg
Message-ID: <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: Felix Gu <ustc.gu@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_122109_588025_D3FD612B 
X-CRM114-Status: GOOD (  18.37  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgOTowN+KAr0FNIEZlbGl4IEd1IDx1c3RjLmd1QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBtZXNvbl9zYXJfYWRjX3RlbXBfc2Vuc29yX2luaXQoKSBhbGxvY2F0
ZXMgYSBidWZmZXIgd2l0aAo+IG52bWVtX2NlbGxfcmVhZCgpLCBidXQgdGhlIG9sZCBjb2RlIGxl
YWtlZCBpdCBpZgo+IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoKSBmYWlsZWQuCj4K
PiBTd2l0Y2ggYnVmIHRvIF9fZnJlZShrZnJlZSkgc28gYWxsIHJldHVybiBwYXRocyByZWxlYXNl
IGl0Lgo+Cj4gRml4ZXM6IGQ2ZjJlYWM2NDQwMyAoImlpbzogYWRjOiBtZXNvbjogbm8gZGV2bSBm
b3IgbnZtZW1fY2VsbF9nZXQiKQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vYWRjL21lc29uX3NhcmFkYy5jIHwgMTAgKysr
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYyBiL2RyaXZl
cnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYwo+IGluZGV4IDIzOTkxYTM2MTJiZC4uOTcwOGRkY2M0
OTE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYwo+ICsrKyBi
L2RyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYwo+IEBAIC03ODYsNyArNzg2LDcgQEAgc3Rh
dGljIGludCBtZXNvbl9zYXJfYWRjX2Nsa19pbml0KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYs
Cj4gIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY190ZW1wX3NlbnNvcl9pbml0KHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtZXNvbl9zYXJfYWRjX3ByaXYg
KnByaXYgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+IC0gICAgICAgdTggKmJ1ZiwgdHJpbW1pbmdf
Yml0cywgdHJpbW1pbmdfbWFzaywgdXBwZXJfYWRjX3ZhbDsKPiArICAgICAgIHU4IHRyaW1taW5n
X2JpdHMsIHRyaW1taW5nX21hc2ssIHVwcGVyX2FkY192YWw7Cj4gICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBpbmRpb19kZXYtPmRldi5wYXJlbnQ7Cj4gICAgICAgICBzdHJ1Y3QgbnZtZW1f
Y2VsbCAqdGVtcGVyYXR1cmVfY2FsaWI7Cj4gICAgICAgICBzaXplX3QgcmVhZF9sZW47Cj4gQEAg
LTgwNywxNCArODA3LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY190ZW1wX3NlbnNvcl9p
bml0KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIHJl
YWRfbGVuID0gTUVTT05fU0FSX0FEQ19FRlVTRV9CWVRFUzsKPiAtICAgICAgIGJ1ZiA9IG52bWVt
X2NlbGxfcmVhZCh0ZW1wZXJhdHVyZV9jYWxpYiwgJnJlYWRfbGVuKTsKPiArICAgICAgIHU4ICpi
dWYgX19mcmVlKGtmcmVlKSA9IG52bWVtX2NlbGxfcmVhZCh0ZW1wZXJhdHVyZV9jYWxpYiwgJnJl
YWRfbGVuKTsKPiAgICAgICAgIG52bWVtX2NlbGxfcHV0KHRlbXBlcmF0dXJlX2NhbGliKTsKPiAg
ICAgICAgIGlmIChJU19FUlIoYnVmKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKGJ1ZiksICJmYWlsZWQgdG8gcmVhZCB0ZW1wZXJhdHVyZV9jYWxp
YiBjZWxsXG4iKTsKPiAtICAgICAgIGlmIChyZWFkX2xlbiAhPSBNRVNPTl9TQVJfQURDX0VGVVNF
X0JZVEVTKSB7Cj4gLSAgICAgICAgICAgICAgIGtmcmVlKGJ1Zik7CkkgZG9uJ3QgbGlrZSB0aGlz
LiBKdXN0IGFkZCB0aGUgbWlzc2luZyBrZnJlZS4KPiArICAgICAgIGlmIChyZWFkX2xlbiAhPSBN
RVNPTl9TQVJfQURDX0VGVVNFX0JZVEVTKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIC1FSU5WQUwsICJpbnZhbGlkIHJlYWQgc2l6ZSBvZiB0ZW1wZXJhdHVyZV9j
YWxpYiBjZWxsXG4iKTsKPiAtICAgICAgIH0KPgo+ICAgICAgICAgcHJpdi0+dHNjX3JlZ21hcCA9
IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLCAiYW1sb2dpYyxo
aGktc3lzY3RybCIpOwo+ICAgICAgICAgaWYgKElTX0VSUihwcml2LT50c2NfcmVnbWFwKSkKPiBA
QCAtODM1LDggKzgzMyw2IEBAIHN0YXRpYyBpbnQgbWVzb25fc2FyX2FkY190ZW1wX3NlbnNvcl9p
bml0KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4gICAgICAgICBwcml2LT50ZW1wZXJhdHVy
ZV9zZW5zb3JfYWRjX3ZhbCB8PSB1cHBlcl9hZGNfdmFsIDw8IEJJVFNfUEVSX0JZVEU7Cj4gICAg
ICAgICBwcml2LT50ZW1wZXJhdHVyZV9zZW5zb3JfYWRjX3ZhbCA+Pj0gdHJpbW1pbmdfYml0czsK
Pgo+IC0gICAgICAga2ZyZWUoYnVmKTsKPiAtCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4K
PiAtLS0KPiBiYXNlLWNvbW1pdDogNzA4MGUzMmQzZjA5ZDg2ODhjNGE4N2Q4MWJkY2M3MWY3ZjYw
NmIxNgo+IGNoYW5nZS1pZDogMjAyNjA0MjUtbWVzb25fc2FyYWRjLTU0YWJjNTJkOWIzMQo+Cj4g
QmVzdCByZWdhcmRzLAo+IC0tCj4gRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwuY29tPgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
