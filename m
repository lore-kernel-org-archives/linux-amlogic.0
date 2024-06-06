Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C9BC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqo3aM/1jwl3mLr92tPSvG122Q4cnIDsx27gPbHSI4s=; b=MdkGYkUwheSMGX
	zCSmbfBkFfBqI7W7sQ05/fC1k7cT4yVYc0QH84WwqFGv8FpPu6H2xSZ9CeQkyq26ou5zva1S2HLG5
	5Dy73TRoizmPFyNrEv58lWFsvkK0OD5N01dhn8r0WaA99bAmQ9lv0KWy0wFRh86pqiHLiUCFfduqd
	jkzTHjY2asNmD6cGXKHMcNHkmzGFbzvTX22nmMHE7YqsgMudzEq/f4V0PpQyetP3fSHa6tNZYcIlm
	X9fdpFlJ1ogflD/9XRSyq65JRA4rGSdRYuf3LSbaba+qUvGxwQByPWn238xa6hWMXSB8BiCFqi0cq
	7DK8+613nnO9ueoiJlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9MF-0000000986R-219C;
	Thu, 06 Jun 2024 09:24:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9MB-000000097yD-07JR
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:24:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c21574d8ddso621604a91.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665866; x=1718270666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=H2Rh5ShQJX087eGsrBGsuOTOediLhL3pUXnZXaGT9mcNoymVtNg9+Ce3pSeTnc8pO9
         7dySQbHE43+jf06MlINKZn+JK5F+/m2JKNAFr/INWIVAzZPoXAnMwfXeer+dTqIiQcLn
         xP58sbLmDHsPrK4u/DPKbscsXf8tN6bRHSM/1JXPHIT8RrypsHi+5PDxmj1qtG2FDNLu
         acLGFhmKwDCvrPYYdt8vF4muGCE1dw/sVTk6rGgIMxCWVPYfrAKxHL7uCOSDhQZOYFl/
         XRQ0Ta1yJsaB3znLc4pVkzDdXExh1EEQLKV1JdZzsO+uKVm/aG4k0IWnx0oN2J5uRoM6
         h36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665866; x=1718270666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=dg1qw1hvy7pdmhlRuvcSoeQk14v+a1ajo0xU+0g+YCDPixktWsziC4F6HM/iCpPxDX
         jdvHXnTGxU5DtRu3/kngWe7rdkvTvPhdxngTCngp6hvUTj54yE2z3GV8m1mtGbr3FFZS
         31hC88MPw39f4Q3sWEpdXQm7Bt2qwncMKfqQYuBMJ1MR0xzIeY/nbqWvvkidpc1xbGZf
         FaWwF2cw8Xwxjgl95gZ0uyYFOQ1dRTTu3XXkqYlk3ssCEoa8nENiDFLZorMyykF7bK2q
         keBDTSbvm4d945riE8SL9tc/+Lk1O4I0jgEbwjLkaSQqVRaQc40DrbDhRABGY8sOnOSD
         /s2A==
X-Forwarded-Encrypted: i=1; AJvYcCVCceUFRUJk6UVGlDTFXunsrWDpylM/sGfi1DqhL1sfdAY+3N/bx2ppgjvhdDyClpnbw6rMqY7snT7HzAf7WLZBSpRdL2R1ZVYbQJspx5OYO+U=
X-Gm-Message-State: AOJu0YwekUUClN0x3AedzwUWtcglBXEBzkUUh0Jc8HbNqz4O4fi+jzXt
	wb5njm+cmD1YDWQ6KWZACXka7IM0uYTkOzK1uaWDgym+jH6R4tDgiODLFSv+9ed0m39W1AL2dT0
	su9oPYlkhhg6J0XXkTx8Q4iGQyeTmTBLRJRcH
X-Google-Smtp-Source: AGHT+IFO27fLQ60otnz+VPqegLb1l+ah/BSl+EBtF4Q1892OcY0hAdcmXoAoiATlOwzJL3jUrPraipj4bPnP8gdWMEU=
X-Received: by 2002:a17:90b:4ad0:b0:2c1:ad46:7133 with SMTP id
 98e67ed59e1d1-2c27dafd1d8mr5026032a91.8.1717665865426; Thu, 06 Jun 2024
 02:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-6-joychakr@google.com>
 <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
In-Reply-To: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:54:09 +0530
Message-ID: <CAOSNQF3Kes3MHWf3FMCCfNOCvymSZV8RS+UMM_oKjhBQzQz8Bg@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
X-CRM114-CacheID: sfid-20240606_022427_235823_FBCB22EF 
X-CRM114-Status: GOOD (  15.97  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAyOjQ44oCvQU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0PiB3cm90ZToKPgo+IE9uIDYvNS8yNCAxMDo1OSwgSm95IENoYWtyYWJvcnR5IHdy
b3RlOgo+ID4gQ2hhbmdlIG52bWVtIHJlYWQvd3JpdGUgZnVuY3Rpb24gZGVmaW5pdGlvbiByZXR1
cm4gdHlwZSB0byBzc2l6ZV90Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpveSBDaGFrcmFib3J0
eSA8am95Y2hha3JAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL21pc2MvZHMxNjgy
LmMgfCAxNiArKysrKystLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mv
ZHMxNjgyLmMgYi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKPiA+IGluZGV4IDVmOGRjZDBlMzg0OC4u
OTUzMzQxNjY2ZGRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9taXNjL2RzMTY4Mi5jCj4gPiAr
KysgYi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKPiA+IEBAIC0xOTgsMjYgKzE5OCwyMiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgZHMxNjgyX2VlcHJvbV9hdHRyID0gewo+ID4g
ICAgICAgLndyaXRlID0gZHMxNjgyX2VlcHJvbV93cml0ZSwKPiA+ICAgfTsKPiA+Cj4gPiAtc3Rh
dGljIGludCBkczE2ODJfbnZtZW1fcmVhZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0
LCB2b2lkICp2YWwsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnl0ZXMp
Cj4gPiArc3RhdGljIHNzaXplX3QgZHMxNjgyX252bWVtX3JlYWQodm9pZCAqcHJpdiwgdW5zaWdu
ZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVfdCBieXRlcykKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IHByaXY7Cj4gPiAtICAgICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgIHJldCA9IGkyY19z
bWJ1c19yZWFkX2kyY19ibG9ja19kYXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00gKyBvZmZz
ZXQsCj4gPiArICAgICByZXR1cm4gaTJjX3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEoY2xpZW50
LCBEUzE2ODJfUkVHX0VFUFJPTSArIG9mZnNldCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJ5dGVzLCB2YWwpOwo+ID4gLSAgICAgcmV0dXJuIHJldCA8IDAg
PyByZXQgOiAwOwo+ID4gICB9Cj4gPgo+ID4gLXN0YXRpYyBpbnQgZHMxNjgyX252bWVtX3dyaXRl
KHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnl0ZXMpCj4gPiArc3RhdGljIHNzaXplX3QgZHMx
NjgyX252bWVtX3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZh
bCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGJ5dGVzKQo+ID4g
ICB7Cj4gPiAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gcHJpdjsKPiA+IC0gICAg
IGludCByZXQ7Cj4gPgo+ID4gLSAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2kyY19ibG9ja19k
YXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00gKyBvZmZzZXQsCj4gPiArICAgICByZXR1cm4g
aTJjX3NtYnVzX3dyaXRlX2kyY19ibG9ja19kYXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00g
KyBvZmZzZXQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ynl0ZXMsIHZhbCk7Cj4KPiBpMmNfc21idXNfd3JpdGVfaTJjX2Jsb2NrX2RhdGEoKSBkb2VzIG5v
dCByZXR1cm4gdGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVuLgo+IEl0IHJldHVybnMgZWl0aGVy
IDAgb3IgYW4gZXJyb3IgY29kZS4KPgpBY2ssIEkgc2VlIG9ubHkgaTJjX3NtYnVzX3JlYWRfaTJj
X2Jsb2NrX2RhdGEoKSAgcmV0dXJucyB0aGUgbnVtYmVyIG9mCmJ5dGVzIHJlYWQgLiBXaWxsIGZp
eCBpdCBuZXh0IHJldmlzaW9uLgoKPiBHdWVudGVyCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
