Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DEEC27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGiqk5OjQ5NdFfpX9ngpIfZ1Kk8Vo6Yv05+jIgd6k5M=; b=dS3KEs8ZIPRlc9
	rhfS0UO5nqTjV/+iKyVwv2+n52TwSJvJjXDjZy+dfDwbeUL8wCPpQ6EGTdvre/itNbh+WyKJxOzQu
	PBKqdJKpAWk5RA3BU6H8D54zXE3IphSeVd0HepMNi0Y1uJPAC0l4WwXthZJ+QBl9giKhe5NDEM1aY
	6LwsiyDrP3jjDCLyUazP/3dfCp/XonTquzl1QpmzVVe3bXDH9qGFrW+DHj7CmSMxbKlYwQvH2I5ko
	KwEMj3hTBxxhevz4X+8IMCzCAtayK/4sd4Pe5PaDHXGhve2KqfSnCxCiSQQokGOjwqk2J5CCPp8m2
	R8lsJcWo1KNd6OtfMFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9dc-00000009F8P-29E6;
	Thu, 06 Jun 2024 09:42:28 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9da-00000009F6D-229s
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:42:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6bce380eb96so508069a12.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717666944; x=1718271744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZxkAQ+JG8hv+VfYtFPLswW4j/3rOvFhx5X0N2PU448=;
        b=C+4DbVBQTsmKm6wfxxN9HG+UjWn5yV7xppZmF/J40K2KO6OdKBzVwIhjr1TF8wLrou
         Gkt9rzxXMf/gChvHKN3P6miIucNYYd5ViYmc2Fhi00Q2eBQ9VRNVymt1qed5+TyE4XVn
         JYVyr4OF+vxJLTVmRB0TyWPVRmIXim/kZhNi5SXt1ZWFjhQ7itD+I/CHUqlVirSkpltQ
         eh+IbodNqGHNSU8vffNfsz6cGJPMKy5irotAw7N9pHpNhzE0Fc/ZicA79gUnipVyq41j
         TOZy0M2/RY7q4OwEtUd+I8qjyH+cFOkC79rbYEw4ULSs34X0mGjrQiGDbItsOcqG/oVB
         vHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717666944; x=1718271744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZxkAQ+JG8hv+VfYtFPLswW4j/3rOvFhx5X0N2PU448=;
        b=qtpoNaWJP/a8c+EN0zoY2AavCUMH5UAwsv8zAzaY4SxSXmDlAneHxw3hFh8Gke6Zwh
         M3ALQAXqdxZP1PjvOzHuBwKgp2mizomnQvcJuNkF3lKtVpnqoiTUoTqIsqiLNlRs/9UK
         D6+sJldPt3Logn+pMcNnlEp5yITkvnamKkI3rrNrN+aESKaAMNIApu8Zwzvu9HfsMU/O
         KU8RCrCXzyuK9Jk3GSZv+HxiRwxS2bsGRaRVjIVpEGmQpqDoqEfm3fOqEWQqk+zziLhY
         MoCCcITPBhxJ7sgu1FAO6iexNUVnzR8HS7VEkaa3K97A++0K/eMW344JIDL2+a8r7vK0
         Sh0w==
X-Forwarded-Encrypted: i=1; AJvYcCUH8yWhjHPezldMTLisWIxteFKI4tFr5IM4psd1uNeoPlpzaQtvRGwvGFIFiC0h8EVXXJWHYPWoIpBlISk2foqBMA5XA56ipr004JDcMgytVnQ=
X-Gm-Message-State: AOJu0Yw72VwS56VMpouHRinvdfjdZOdm4sg0AtbibVYCVx1RB8zNyA9m
	fSMr2PnYd22pWRJ8ZYq42xR7XiHBum5c5hi+O/IBhbnHPTCFNdK0O0Ci4lUiNtrxOvfLnpruwRK
	aPXHvvfaOLUPEhvA1lpdyTjZ2MRbnFxX9QQx/
X-Google-Smtp-Source: AGHT+IEWwVSwT6aqEkrDe0tLMBSTWElwotQtqstSRStzjfIU8jhDcLm33ZWeSi7tWYVCsMsV4ghgN5gJvMEjynSIzaM=
X-Received: by 2002:a05:6a20:daa4:b0:1a7:aabc:24ae with SMTP id
 adf61e73a8af0-1b2b6ed7966mr5928466637.18.1717666944034; Thu, 06 Jun 2024
 02:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
In-Reply-To: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 15:12:03 +0530
Message-ID: <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240606_024226_590673_7D6A27DC 
X-CRM114-Status: GOOD (  34.89  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAyOjEx4oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDA1LCAyMDI0IGF0IDA1OjU5
OjUxUE0gKzAwMDAsIEpveSBDaGFrcmFib3J0eSB3cm90ZToKPiA+IEBAIC0xOTUsMTAgKzE5NSwx
MSBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqc2VybnVtX2F0dHJzW10gPSB7Cj4gPiAgfTsK
PiA+ICBBVFRSSUJVVEVfR1JPVVBTKHNlcm51bSk7Cj4gPgo+ID4gLXN0YXRpYyBpbnQgYXQyNV9l
ZV93cml0ZSh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2ZmLCB2b2lkICp2YWwsIHNpemVfdCBj
b3VudCkKPiA+ICtzdGF0aWMgc3NpemVfdCBhdDI1X2VlX3dyaXRlKHZvaWQgKnByaXYsIHVuc2ln
bmVkIGludCBvZmYsIHZvaWQgKnZhbCwgc2l6ZV90IGNvdW50KQo+ID4gIHsKPiA+ICAgICAgIHN0
cnVjdCBhdDI1X2RhdGEgKmF0MjUgPSBwcml2Owo+ID4gICAgICAgc2l6ZV90IG1heHN6ID0gc3Bp
X21heF90cmFuc2Zlcl9zaXplKGF0MjUtPnNwaSk7Cj4gPiArICAgICBzaXplX3QgYnl0ZXNfd3Jp
dHRlbiA9IGNvdW50Owo+ID4gICAgICAgY29uc3QgY2hhciAqYnVmID0gdmFsOwo+ID4gICAgICAg
aW50ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gMDsKPiA+ICAgICAgIHVuc2lnbmVkICAg
ICAgICAgICAgICAgIGJ1Zl9zaXplOwo+ID4gQEAgLTMxMyw3ICszMTQsNyBAQCBzdGF0aWMgaW50
IGF0MjVfZWVfd3JpdGUodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZiwgdm9pZCAqdmFsLCBz
aXplX3QgY291bnQpCj4gPiAgICAgICBtdXRleF91bmxvY2soJmF0MjUtPmxvY2spOwo+ID4KPiA+
ICAgICAgIGtmcmVlKGJvdW5jZSk7Cj4gPiAtICAgICByZXR1cm4gc3RhdHVzOwo+ID4gKyAgICAg
cmV0dXJuIHN0YXR1cyA8IDAgPyBzdGF0dXMgOiBieXRlc193cml0dGVuOwo+ID4gIH0KPgo+IFNv
IHRoZSBvcmlnaW5hbCBidWcgd2FzIHRoYXQgcm1lbV9yZWFkKCkgaXMgcmV0dXJuaW5nIHBvc2l0
aXZlIHZhbHVlcwo+IG9uIHN1Y2Nlc3MgaW5zdGVhZCBvZiB6ZXJvWzFdLiAgVGhhdCBzdGFydGVk
IGEgZGlzY3Vzc2lvbiBhYm91dCBwYXJ0aWFsCj4gcmVhZHMgd2hpY2ggcmVzdWx0ZWQgaW4gY2hh
bmdpbmcgdGhlIEFQSSB0byBzdXBwb3J0IHBhcnRpYWwgcmVhZHNbMl0uCj4gVGhhdCBwYXRjaHNl
dCBicm9rZSB0aGUgYnVpbGQuICBUaGlzIHBhdGNoc2V0IGlzIHRyeWluZyB0byBmaXggdGhlCj4g
YnVpbGQgYnJlYWthZ2UuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
MjA2MDQyNDA4LjIyNDEzOC0xLWpveWNoYWtyQGdvb2dsZS5jb20vCj4gWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI0MDUxMDA4MjkyOS4zNzkyNTU5LTItam95Y2hha3JAZ29vZ2xl
LmNvbS8KPgo+IFRoZSBidWcgaW4gcm1lbV9yZWFkKCkgaXMgc3RpbGwgbm90IGZpeGVkLiAgVGhh
dCBuZWVkcyB0byBiZSBmaXhlZCBhcwo+IGEgc3RhbmQgYWxvbmUgcGF0Y2guICBXZSBjYW4gZGlz
Y3VzcyByZS13cml0aW5nIHRoZSBBUEkgc2VwYXJhdGVseS4KPgoKVHJ1ZSwgZml4aW5nIHRoZSBy
ZXR1cm4gdHlwZSB3b3VsZCBmaXggdGhhdCBhcyB3ZWxsIGlzIHdoYXQgSSB0aG91Z2h0CmJ1dCBt
YXliZSB5ZXMgd2UgbmVlZCB0byBmaXggdGhhdCBzZXBhcmF0ZWx5IGFzIHdlbGwuCgo+IFRoZXNl
IGZ1bmN0aW9ucyBhcmUgdXNlZCBpbnRlcm5hbGx5IGFuZCBleHBvcnRlZCB0byB0aGUgdXNlciB0
aHJvdWdoCj4gc3lzZnMgdmlhIGJpbl9hdHRyX252bWVtX3JlYWQvd3JpdGUoKS4gIEZvciBpbnRl
cm5hbCB1c2VycyBwYXJ0aWFsIHJlYWRzCj4gc2hvdWxkIGJlIHRyZWF0ZWQgYXMgZmFpbHVyZS4g
IFdoYXQgYXJlIHdlIHN1cHBvc2VkIHRvIGRvIHdpdGggYSBwYXJ0aWFsCj4gcmVhZD8gIEkgZG9u
J3QgdGhpbmsgYW55b25lIGhhcyBhc2tlZCBmb3IgcGFydGlhbCByZWFkcyB0byBiZSBzdXBwb3J0
ZWQKPiBmcm9tIHN5c2ZzIGVpdGhlciBleGNlcHQgR3JlZyB3YXMgd29uZGVyaW5nIGFib3V0IGl0
IHdoaWxlIHJlYWRpbmcgdGhlCj4gY29kZS4KPgo+IEN1cnJlbnRseSwgYSBsb3Qgb2YgZHJpdmVy
cyByZXR1cm4gLUVJTlZBTCBmb3IgcGFydGlhbCByZWFkL3dyaXRlcyBidXQKPiBzb21lIHJldHVy
biBzdWNjZXNzLiAgSXQgaXMgYSBiaXQgbWVzc3kuICBCdXQgdGhpcyBwYXRjaHNldCBkb2Vzbid0
Cj4gcmVhbGx5IGltcHJvdmUgYW55dGhpbmcuICBJbiBhdDI0X3JlYWQoKSB3ZSBjaGVjayBpZiBp
dCdzIGdvaW5nIHRvIGJlIGEKPiBwYXJ0aWFsIHJlYWQgYW5kIHJldHVybiAtRUlOVkFMLiAgQmVs
b3cgd2UgcmVwb3J0IGEgcGFydGlhbCByZWFkIGFzIGEKPiBmdWxsIHJlYWQuICBJdCdzIGp1c3Qg
YSBtb3JlIGNvbXBsaWNhdGVkIHdheSBvZiBkb2luZyBleGFjdGx5IHdoYXQgd2UKPiB3ZXJlIGRv
aW5nIGJlZm9yZS4KCkN1cnJlbnRseSB3aGF0IGRyaXZlcnMgcmV0dXJuIGlzIHVwIHRvIHRoZWly
IGludGVycHJldGF0aW9uIG9mIGludApyZXR1cm4gdHlwZSwgdGhlcmUgYXJlIGEgZmV3IGRyaXZl
cnMgd2hpY2ggYWxzbyByZXR1cm4gdGhlIG51bWJlciBvZgpieXRlcyB3cml0dGVuL3JlYWQgYWxy
ZWFkeSBsaWtlCmRyaXZlcnMvbWlzYy9tY2hwX3BjaTF4eHh4L21jaHBfcGNpMXh4eHhfb3RwZTJw
LmMgLgpUaGUgb2JqZWN0aXZlIG9mIHRoZSBwYXRjaCB3YXMgdG8gaGFuZGxlIHBhcnRpYWwgcmVh
ZHMgYW5kIGVycm9ycyBhdAp0aGUgbnZtZW0gY29yZSBhbmQgaW5zdGVhZCBvZiBsZWF2aW5nIGl0
IHVwIHRvIGVhY2ggbnZtZW0gcHJvdmlkZXIgYnkKcHJvdmlkaW5nIGEgYmV0dGVyIHJldHVybiB2
YWx1ZSB0byBudm1lbSBwcm92aWRlcnMuCgpSZWdhcmRpbmcgZHJpdmVycy9taXNjL2VlcHJvbS9h
dDI1LmMgd2hpY2ggeW91IHBvaW50ZWQgYmVsb3csIHRoYXQgaXMKYSBwcm9ibGVtIGluIG15IGNv
ZGUgY2hhbmdlLiBJIG1pc3NlZCB0aGF0IGNvdW50IHdhcyBtb2RpZmllZCBsYXRlciBvbgphbmQg
c2hvdWxkIGluaXRpYWxpemUgYnl0ZXNfd3JpdHRlbiB0byB0aGUgbmV3IHZhbHVlIG9mIGNvdW50
LCB3aWxsCmZpeCB0aGF0IHdoZW4gSSBjb21lIHVwIHdpdGggdGhlIG5ldyBwYXRjaC4KCkkgYWdy
ZWUgdGhhdCBpdCBkb2VzIG5vdCBpbXByb3ZlIGFueXRoaW5nIGZvciBhIGxvdCBvZiBudm1lbSBw
cm92aWRlcnMKZm9yIGV4YW1wbGUgdGhlIG9uZXMgd2hpY2ggY2FsbCBpbnRvIG90aGVyIHJlZ19t
YXBfcmVhZC93cml0ZSBhcGlzCndoaWNoIGRvIG5vdCByZXR1cm4gdGhlIG51bWJlciBvZiBieXRl
cyByZWFkL3dyaXR0ZW4gYnV0IGl0IGRvZXMgaGVscAp1cyBkbyBiZXR0ZXIgZXJyb3IgaGFuZGxp
bmcgYXQgdGhlIG52bWVtIGNvcmUgbGF5ZXIgZm9yIG52bWVtCnByb3ZpZGVycyB3aG8gY2FuIHJl
dHVybiB0aGUgdmFsaWQgbnVtYmVyIG9mIGJ5dGVzIHJlYWQvd3JpdHRlbi4KClBsZWFzZSBsZXQg
bWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbnMgb24gaG93IHRvIGhhbmRs
ZQp0aGlzIGJldHRlci4KClRoYW5rcwpKb3kKCj4KPiBkcml2ZXJzL21pc2MvZWVwcm9tL2F0MjUu
Ywo+ICAgIDE5OCAgc3RhdGljIGludCBhdDI1X2VlX3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBvZmYsIHZvaWQgKnZhbCwgc2l6ZV90IGNvdW50KQo+ICAgIDE5OSAgewo+ICAgIDIwMCAg
ICAgICAgICBzdHJ1Y3QgYXQyNV9kYXRhICphdDI1ID0gcHJpdjsKPiAgICAyMDEgICAgICAgICAg
c2l6ZV90IG1heHN6ID0gc3BpX21heF90cmFuc2Zlcl9zaXplKGF0MjUtPnNwaSk7Cj4gTmV3OiAg
ICAgICAgICAgIHNpemVfdCBieXRlc193cml0dGVuID0gY291bnQ7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiBUaGlzIGlzIG5vdCB0aGUgbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4uCj4KPiAgICAyMDIgICAgICAgICAgY29uc3QgY2hhciAqYnVmID0gdmFs
Owo+ICAgIDIwMyAgICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAwOwo+
ICAgIDIwNCAgICAgICAgICB1bnNpZ25lZCAgICAgICAgICAgICAgICBidWZfc2l6ZTsKPiAgICAy
MDUgICAgICAgICAgdTggICAgICAgICAgICAgICAgICAgICAgKmJvdW5jZTsKPiAgICAyMDYKPiAg
ICAyMDcgICAgICAgICAgaWYgKHVubGlrZWx5KG9mZiA+PSBhdDI1LT5jaGlwLmJ5dGVfbGVuKSkK
PiAgICAyMDggICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQklHOwo+ICAgIDIwOSAgICAgICAg
ICBpZiAoKG9mZiArIGNvdW50KSA+IGF0MjUtPmNoaXAuYnl0ZV9sZW4pCj4gICAgMjEwICAgICAg
ICAgICAgICAgICAgY291bnQgPSBhdDI1LT5jaGlwLmJ5dGVfbGVuIC0gb2ZmOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eCj4gVGhpcyBpcy4KPgo+ICAgIDIxMSAgICAgICAgICBpZiAo
dW5saWtlbHkoIWNvdW50KSkKPiAgICAyMTIgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAgICAyMTMKPiAgICAyMTQgICAgICAgICAgLyogVGVtcCBidWZmZXIgc3RhcnRzIHdpdGgg
Y29tbWFuZCBhbmQgYWRkcmVzcyAqLwo+ICAgIDIxNSAgICAgICAgICBidWZfc2l6ZSA9IGF0MjUt
PmNoaXAucGFnZV9zaXplOwo+ICAgIDIxNiAgICAgICAgICBpZiAoYnVmX3NpemUgPiBpb19saW1p
dCkKPiAgICAyMTcgICAgICAgICAgICAgICAgICBidWZfc2l6ZSA9IGlvX2xpbWl0Owo+ICAgIDIx
OCAgICAgICAgICBib3VuY2UgPSBrbWFsbG9jKGJ1Zl9zaXplICsgYXQyNS0+YWRkcmxlbiArIDEs
IEdGUF9LRVJORUwpOwo+ICAgIDIxOSAgICAgICAgICBpZiAoIWJvdW5jZSkKPiAgICAyMjAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAgICAyMjEKPgo+IHJlZ2FyZHMsCj4gZGFu
IGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
