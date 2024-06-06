Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CAC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 10:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nh9lebnMQV8w+tyI11BtYKjSWwiWq6XNUY0FFcQ0Wg=; b=eAHRKQrefyrf+e
	RlShw4otPmPwRLDOIMuVNdX+PAf/gkWh82pt2YfOhCvwQv+2drtsT5o+NLNQvwswuSalNOx5w3XG0
	+e+hDMYlWwxZsh+q/CN1IaHcn+ff6rP5utxUowvLfY1rhRGPOmkrZD/0v2ocKUMU/36brRt1v/Rpw
	6/e8hzQjG3ECFsg5ORa3hTqqez+QAHIDEikR5FfOiIciKfs9/etkz3GyoSxSCjeiNAw9TKK5eHOip
	F1Qi/fA/JWlA9NxlH6e06u+klbZGphaWr/bYTQuUHsliwLahiH+tGjB47p+SAd1BFRsg2e4uPTbvm
	QNSjU2D6UQNqOhP2uPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAPh-00000009P3R-0Vz1;
	Thu, 06 Jun 2024 10:32:09 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAPd-00000009Ozl-3uul
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 10:32:07 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2eabd22d441so11701641fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717669923; x=1718274723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yOK4FlQCW+JMOCwnWP72jJymCtr5dD6IgIpna60BCY=;
        b=M+jLJ2F8asLRfjJ2p99Ik/PiJg8acfGkG9FoTorNkOSgVuXAjczNgeHba3rBZrQ2Si
         o9hGLly0QASbP0NYtujqlH3ZQow6qf6/WL0rR1KHaRkUi9Vk/ExFw1IGfPBQGfZvR0yZ
         unYf0WjboFlz16vVozVcF3waRnkCiVgkbiBWrk2Px5ShjKPQ60vsl87HaGw3Dcl4X7dt
         Cs1dx/1gHgHdPBD9iw64vE/q8vFm7cZHxqGOBNsUxI5zsTkhTUIIcdiqNeII8zWMs3Yz
         a+4jNSItXJQmMMckkdGrNemz4+htP4481ATyqufflUPakfu384fDAX57gnJN+C0CGQLI
         bvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717669923; x=1718274723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yOK4FlQCW+JMOCwnWP72jJymCtr5dD6IgIpna60BCY=;
        b=gy48w/lF9x2FCPLRL2KxMW1abVCiYNX+1QLBZ9L5tQsA8senVyELCeVhjnP0SLG6pr
         GaQ/WDwr1xE3sIJAmhyBXDJp8jBWLi0UqJtS3eMTy6nFWDOP1nQeGBJSukssb+IVRuJC
         ev/Vgq3hnn8bfpRHkUkh5ihQhubOu5vHYlJl01bUIPlByVGNWSuFSKJBHaL0qG00lEZ2
         y39MM3iBMf0ljZtD9+eTQApiwx69TmVg1qEK7j3fU4wQ3czCjpBQ7Bk+zMaBxqXIyPOs
         4kobG7v0fO6WsMprqRAsAJS3jN3wCZ/l0pvDimyxgZKRMW+5+JTmWu9HVwnq3jaggyEh
         fpzw==
X-Forwarded-Encrypted: i=1; AJvYcCV0XcjX2Subw4SOAszaDWHGnmbHn74Y2oFx/IUbJFZpzUsT3kpBJCGusyYt9VdjoH7sfmPHr16g0ykvTtfk1JfyTz1Fe3Uj8KjTXcUVonqEW2g=
X-Gm-Message-State: AOJu0YwYhxBM33KK3yHvvcMIPz3OefaMLlcdw7Y2jkLOLfwwJlwbD1WE
	agNVrahz3CUQkBvJ9iVSFVdNmqeWKGPKQ/ULDtPruUcb/WX/P0llZyFRVG1mTjIaib4is55Gv8R
	Rpr6yz/Bn2dLSmBscmJe8wDjpgiK3yRAJvms3
X-Google-Smtp-Source: AGHT+IHb92CvWzY0UMLIO3bnYXJ9lrbqmbf5jFApgNniI36TJ0LubnwynaglXsT5ps/3HCuaPh8FvkYR0EYkfnbTRiI=
X-Received: by 2002:a2e:9643:0:b0:2e1:9c57:195a with SMTP id
 38308e7fff4ca-2eac7a5fd4dmr33302121fa.32.1717669922881; Thu, 06 Jun 2024
 03:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain> <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
 <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
In-Reply-To: <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 16:01:42 +0530
Message-ID: <CAOSNQF02nUPZ=8re=uyruhxReQSjPoc8L-9yTnWMe4EfJ0-huA@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_033206_011203_90E95844 
X-CRM114-Status: GOOD (  40.68  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAzOjQx4oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDA2LCAyMDI0IGF0IDAzOjEy
OjAzUE0gKzA1MzAsIEpveSBDaGFrcmFib3J0eSB3cm90ZToKPiA+ID4gVGhlc2UgZnVuY3Rpb25z
IGFyZSB1c2VkIGludGVybmFsbHkgYW5kIGV4cG9ydGVkIHRvIHRoZSB1c2VyIHRocm91Z2gKPiA+
ID4gc3lzZnMgdmlhIGJpbl9hdHRyX252bWVtX3JlYWQvd3JpdGUoKS4gIEZvciBpbnRlcm5hbCB1
c2VycyBwYXJ0aWFsIHJlYWRzCj4gPiA+IHNob3VsZCBiZSB0cmVhdGVkIGFzIGZhaWx1cmUuICBX
aGF0IGFyZSB3ZSBzdXBwb3NlZCB0byBkbyB3aXRoIGEgcGFydGlhbAo+ID4gPiByZWFkPyAgSSBk
b24ndCB0aGluayBhbnlvbmUgaGFzIGFza2VkIGZvciBwYXJ0aWFsIHJlYWRzIHRvIGJlIHN1cHBv
cnRlZAo+ID4gPiBmcm9tIHN5c2ZzIGVpdGhlciBleGNlcHQgR3JlZyB3YXMgd29uZGVyaW5nIGFi
b3V0IGl0IHdoaWxlIHJlYWRpbmcgdGhlCj4gPiA+IGNvZGUuCj4gPiA+Cj4gPiA+IEN1cnJlbnRs
eSwgYSBsb3Qgb2YgZHJpdmVycyByZXR1cm4gLUVJTlZBTCBmb3IgcGFydGlhbCByZWFkL3dyaXRl
cyBidXQKPiA+ID4gc29tZSByZXR1cm4gc3VjY2Vzcy4gIEl0IGlzIGEgYml0IG1lc3N5LiAgQnV0
IHRoaXMgcGF0Y2hzZXQgZG9lc24ndAo+ID4gPiByZWFsbHkgaW1wcm92ZSBhbnl0aGluZy4gIElu
IGF0MjRfcmVhZCgpIHdlIGNoZWNrIGlmIGl0J3MgZ29pbmcgdG8gYmUgYQo+ID4gPiBwYXJ0aWFs
IHJlYWQgYW5kIHJldHVybiAtRUlOVkFMLiAgQmVsb3cgd2UgcmVwb3J0IGEgcGFydGlhbCByZWFk
IGFzIGEKPiA+ID4gZnVsbCByZWFkLiAgSXQncyBqdXN0IGEgbW9yZSBjb21wbGljYXRlZCB3YXkg
b2YgZG9pbmcgZXhhY3RseSB3aGF0IHdlCj4gPiA+IHdlcmUgZG9pbmcgYmVmb3JlLgo+ID4KPiA+
IEN1cnJlbnRseSB3aGF0IGRyaXZlcnMgcmV0dXJuIGlzIHVwIHRvIHRoZWlyIGludGVycHJldGF0
aW9uIG9mIGludAo+ID4gcmV0dXJuIHR5cGUsIHRoZXJlIGFyZSBhIGZldyBkcml2ZXJzIHdoaWNo
IGFsc28gcmV0dXJuIHRoZSBudW1iZXIgb2YKPiA+IGJ5dGVzIHdyaXR0ZW4vcmVhZCBhbHJlYWR5
IGxpa2UKPiA+IGRyaXZlcnMvbWlzYy9tY2hwX3BjaTF4eHh4L21jaHBfcGNpMXh4eHhfb3RwZTJw
LmMgLgo+Cj4gUmV0dXJuaW5nIG5vbi16ZXJvIGlzIGEgYnVnLiAgSXQgd29uJ3QgYnJlYWsgYmlu
X2F0dHJfbnZtZW1fcmVhZC93cml0ZSgpCj4gYnV0IGl0IHdpbGwgYnJlYWsgb3RoZXIgcGxhY2Vz
IGxpa2UgbnZtZW1fYWNjZXNzX3dpdGhfa2VlcG91dHMoKSwKPiBfX252bWVtX2NlbGxfcmVhZCgp
IGFuZCBudm1lbV9jZWxsX3ByZXBhcmVfd3JpdGVfYnVmZmVyKCkgd2hlcmUgYWxsCj4gbm9uLXpl
cm8gcmV0dXJucyBmcm9tIG52bWVtX3JlZ19yZWFkKCkgYXJlIHRyZWF0ZWQgYXMgYW4gZXJyb3Iu
Cj4KClllcywgSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2ggdG8gZml4IHRoYXQuCgo+ID4gVGhlIG9i
amVjdGl2ZSBvZiB0aGUgcGF0Y2ggd2FzIHRvIGhhbmRsZSBwYXJ0aWFsIHJlYWRzIGFuZCBlcnJv
cnMgYXQKPiA+IHRoZSBudm1lbSBjb3JlIGFuZCBpbnN0ZWFkIG9mIGxlYXZpbmcgaXQgdXAgdG8g
ZWFjaCBudm1lbSBwcm92aWRlciBieQo+ID4gcHJvdmlkaW5nIGEgYmV0dGVyIHJldHVybiB2YWx1
ZSB0byBudm1lbSBwcm92aWRlcnMuCj4gPgo+ID4gUmVnYXJkaW5nIGRyaXZlcnMvbWlzYy9lZXBy
b20vYXQyNS5jIHdoaWNoIHlvdSBwb2ludGVkIGJlbG93LCB0aGF0IGlzCj4gPiBhIHByb2JsZW0g
aW4gbXkgY29kZSBjaGFuZ2UuIEkgbWlzc2VkIHRoYXQgY291bnQgd2FzIG1vZGlmaWVkIGxhdGVy
IG9uCj4gPiBhbmQgc2hvdWxkIGluaXRpYWxpemUgYnl0ZXNfd3JpdHRlbiB0byB0aGUgbmV3IHZh
bHVlIG9mIGNvdW50LCB3aWxsCj4gPiBmaXggdGhhdCB3aGVuIEkgY29tZSB1cCB3aXRoIHRoZSBu
ZXcgcGF0Y2guCj4gPgo+ID4gSSBhZ3JlZSB0aGF0IGl0IGRvZXMgbm90IGltcHJvdmUgYW55dGhp
bmcgZm9yIGEgbG90IG9mIG52bWVtIHByb3ZpZGVycwo+ID4gZm9yIGV4YW1wbGUgdGhlIG9uZXMg
d2hpY2ggY2FsbCBpbnRvIG90aGVyIHJlZ19tYXBfcmVhZC93cml0ZSBhcGlzCj4gPiB3aGljaCBk
byBub3QgcmV0dXJuIHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVhZC93cml0dGVuIGJ1dCBpdCBkb2Vz
IGhlbHAKPiA+IHVzIGRvIGJldHRlciBlcnJvciBoYW5kbGluZyBhdCB0aGUgbnZtZW0gY29yZSBs
YXllciBmb3IgbnZtZW0KPiA+IHByb3ZpZGVycyB3aG8gY2FuIHJldHVybiB0aGUgdmFsaWQgbnVt
YmVyIG9mIGJ5dGVzIHJlYWQvd3JpdHRlbi4KPgo+IElmIHdlJ3JlIGdvaW5nIHRvIHN1cHBvcnQg
cGFydGlhbCB3cml0ZXMsIHRoZW4gaXQgbmVlZHMgdG8gYmUgZG9uZSBhbGwKPiB0aGUgd2F5LiAg
V2UgbmVlZCB0byBhdWRpdCBmdW5jdGlvbnMgbGlrZSBhdDI0X3JlYWQoKSBhbmQgcmVtb3ZlIHRo
ZQo+IC1FSU5WQUwgbGluZXMuCj4KPiAgICA0NDAgICAgICAgICAgaWYgKG9mZiArIGNvdW50ID4g
YXQyNC0+Ynl0ZV9sZW4pCj4gICAgNDQxICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4KPiBJdCBzaG91bGQgYmU6Cj4KPiAgICAgICAgIGlmIChvZmYgKyBjb3VudCA+IGF0MjQtPmJ5
dGVfbGVuKQo+ICAgICAgICAgICAgICAgICBjb3VudCA9IGF0MjQtPmJ5dGVfbGVuIC0gb2ZmOwo+
Cj4gU29tZSBkcml2ZXJzIGhhbmRsZSB3cml0aW5nIHplcm8gYnl0ZXMgYXMgLUVJTlZBTCBhbmQg
c29tZSByZXR1cm4gMC4KPiBUaG9zZSBjaGFuZ2VzIGNvdWxkIGJlIGRvbmUgYmVmb3JlIHdlIGNo
YW5nZSB0aGUgQVBJLgo+CgpTdXJlLCB3ZSBjYW4gZG8gaXQgaW4gYSBwaGFzZWQgbWFubmVyIGxp
a2UgeW91IHN1Z2dlc3RlZCBpbiBhbm90aGVyCnJlcGx5IGJ5IGNyZWF0aW5nIG5ldyBwb2ludGVy
cyBhbmQgc2xvd2x5IG1vdmluZyBlYWNoIGRyaXZlciB0byB0aGUKbmV3IHBvaW50ZXIgYW5kIHRo
ZW4gZGVwcmVjYXRpbmcgdGhlIG9sZCBvbmUuCgo+IFlvdSB1cGRhdGVkIG52bWVtX2FjY2Vzc193
aXRoX2tlZXBvdXRzKCkgdG8gaGFuZGxlIG5lZ2F0aXZlIHJldHVybnMgYnV0Cj4gbm90IHplcm8g
cmV0dXJucyBzbyBpdCBjb3VsZCBsZWFkIHRvIGEgZm9yZXZlciBsb29wLgo+CgpZZXMsIHRoYXQg
aXMgYSBwb3NzaWJsZSBjYXNlLiBXaWxsIHJld29yayBpdC4KCj4gcmVnYXJkcywKPiBkYW4gY2Fy
cGVudGVyCj4KVGhhbmtzCkpveQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
