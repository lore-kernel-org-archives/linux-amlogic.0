Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E97D29FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHqPO28mN8V8g3JTx40xotLO3Tyy4dFF+kMbdTJ0hNo=; b=RCEkobi+MKb53K
	SdlC9zZY+WWaYdf0R7o+efHbK2yUItWomNXzMary64Gd6ujX9dpe2WlvGx0Q4C3QhjXGdepndZu6b
	qGnIc6athh/bRv8FjkrEr/PJ91FeoQqixasmNW1LRYxbF4aKxB2mdnfDOqBqraRbWDX/RBt/s1sgq
	jrWMigYZ0GV9vrF/qf+1XIXaxhv9TishfroQ3P3CtrjRt/BQVqj1yPIz9pVckuWNRti5nHxpNXZy7
	+NoxL3mNFoD/nzX82aJjzihEt4VHJrWozn9a2Vwm+zX7h7762SJLvSSurfdR02b1rWdEwvtVBSszH
	jyMtqkWg+jn0WjG1ErmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0X-00000008x1H-4BKP;
	Wed, 14 Jan 2026 11:25:49 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz0V-00000008wzP-1eLU
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 11:25:48 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ad70765db9so1715690eec.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 03:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768389946; x=1768994746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfhgRc6vTwsEnX3dOX00U1qmC/HK8O2dZPFjKNu4aWk=;
        b=IKYeQGRFla2H26mp0wN1RV8IOXLHRnqDmn/hiqiRI+GLAMtyqrPhvXi5q2Tv+2ZErR
         728IE8kFg95fn7B2YqlQH4MkPv6VzovM3an26KbOMPZXiJU7tWH/DguavjkWSN1bQ/oF
         UWZYgISTsDXp6uBdfMV7X2Xxx304g/+LwA1e05hu5IW6RYj+b2CC4f/b1U0LjvE6bGEg
         hEBlAvm08NePSEulgCt+ghcUeYVp6xde+u1hz8U5WaE2pxXiLEVew2FXLn7Oj43oAee/
         VBtRFM3TKVq4vBeS2CL3sP9yao+70W6WpfWSeTQ8FWQpZjRuChXtHT+7gaHrZ9cvZcyN
         dFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768389946; x=1768994746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wfhgRc6vTwsEnX3dOX00U1qmC/HK8O2dZPFjKNu4aWk=;
        b=QeFjogyvrGUcKcDzXLD8kYj3O2oYvwOHbAKiNxsPF9vKLjJ+0+xcp4v33yqwMb+4RN
         EWEFKnoE8BXDGUtZgApxryOrblHL+HIwKaoKUwgvfQxcMbiVFXDt5gG/i9tBJyBG7gfW
         x+zr52KgXuYu/kBAPNrSO4+g4Tr3NFrFFeSJjQ9SU/+lh/1qAh6THqGXDqjeQqSSVmNH
         HspcJ6vTA8MCJCzvoVeK4xfzzIijJUSJGaIAN/FhFKksKMsd5FLTbZXy6losYfXJvPit
         F81+Qev0/yCdVah3qPQhkAluEOeEr+GdGdYl9nlzScZX5vkB06c327mtUdHMShN55xiZ
         pkRg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ19tvdcdGFAe4nTRgKKmfZykZKr8Hxuc7CwZCWH9h2E1nh2gVBLAGWuH0kQy4bPymG0ZpP/+8XSM5Hz+T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2f+xd0nr0W3Ex/FsloE451TMGUA60jmkDzUoof98yRsw8Wos0
	6zVP1ANjO8KdLmeXey5Hr/raFWl5LZbSFV2bUZ3FDJSZeoDgBzbtBWDJlnfkFtFo+zMpj9sKKkA
	MD6mUOQ9upZa2SbTFA3iEVJnMJNTqcic=
X-Gm-Gg: AY/fxX6lBsGtw6fI7aQEmuKYyAJCI9U3JSZ6yj0Ehiqpr4KdEbDivGYouHDw76gfz2r
	MqLN8F4iwaZskMSyQFlQdBaO9uF4oF5H4iBWS5pezgRUJbvQacPhtva/pGexZjTmoi/cJVn5Jo5
	l4qMsHm/xhmmdWNvUe5euWxOag94y/XfwTu9XERRAP7lGdSm+c8rEdW7jWDR009ggoqaMkjAkKg
	2WHQBDk9qqT7jgNg0DgAMgXgMkJVDHtnKJDj23tI/8XshRWJiDAnG4AzJvHM1693eR5
X-Received: by 2002:a05:7301:10cb:b0:2af:fbb:97cf with SMTP id
 5a478bee46e88-2b4873448e8mr3277294eec.43.1768389946359; Wed, 14 Jan 2026
 03:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20260114062549.68954-1-nick@khadas.com> <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll> <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
 <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
In-Reply-To: <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
From: Nick Xie <xieqinick@gmail.com>
Date: Wed, 14 Jan 2026 19:25:34 +0800
X-Gm-Features: AZwV_Qg70Hy7I-zqtjJH4CnT0wrSCnqXmLnlIp4duk0mQjb7lfd2ZqN3oox8UgU
Message-ID: <CAP4nuTX556F6a+aMndYayu-29u-SsYi0g0ie8ONz8b5GStgv-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_032547_469133_69BC19D5 
X-CRM114-Status: GOOD (  19.31  )
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel
5ZGo5LiJIDE4OjMz5YaZ6YGT77yaCj4KPiBPbiAxNC8wMS8yMDI2IDExOjA3LCBOaWNrIFhpZSB3
cm90ZToKPiA+IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4g5LqOMjAyNuW5
tDHmnIgxNOaXpeWRqOS4iSAxNjo1MeWGmemBk++8mgo+ID4+Cj4gPj4gT24gV2VkLCBKYW4gMTQs
IDIwMjYgYXQgMDI6MjU6NDhQTSArMDgwMCwgTmljayBYaWUgd3JvdGU6Cj4gPj4+IEFkZCBkZXZp
Y2V0cmVlIGJpbmRpbmcgZm9yIEtoYWRhcyBWSU0xUyBib2FyZCBiYXNlZCBvbgo+ID4+PiBBbWxv
Z2ljIFM0IFM5MDVZNCBTb0MuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxu
aWNrQGtoYWRhcy5jb20+Cj4gPj4KPiA+PiBZb3Ugc3RpbGwgaGF2ZSB0aGUgc2FtZSBGcm9tL1Nv
QiBtaXNtYXRjaC4KPiA+Cj4gPiBPSywgIEkgd2lsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLgo+
ID4KPiA+Pgo+ID4+PiAtLS0KPiA+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYW1sb2dpYy55YW1sIHwgNiArKysrKysKPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiA+Pj4gaW5kZXggMDhkOTk2M2ZlOTI1OS4uNTU2
NjNlMGY3ZjkxNSAxMDA2NDQKPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiA+Pj4gQEAgLTI0Nyw2ICsyNDcsMTIgQEAg
cHJvcGVydGllczoKPiA+Pj4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLGFxMjIyCj4gPj4+ICAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxzNAo+Cj4gTG9vayBoZXJlCj4KPiA+Pj4KPiA+Pj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFM0IFM5
MDVZNCBTb0MKPiA+Pj4gKyAgICAgICAgaXRlbXM6Cj4gPj4+ICsgICAgICAgICAgLSBlbnVtOgo+
ID4+Cj4gPj4gWW9wdSBhbHJlYWR5IGhhdmUgZXhhY3RseSBzdWNoIGVudW0gd2l0aCBzdWNoIGRl
c2NyaXB0aW9uLCBzbyB5b3VyCj4gPj4gY29tcGF0aWJsZSBnb2VzIHRoZXJlLiBMb29rIC0gaXQg
aXMgY2FsbGVkICJCb2FyZHMiIC0gcGx1cmFsLgo+ID4KPiA+IFRoZSBleGlzdCBib2FyZCBhcTIy
MiBpcyBiYXNlZCBvbiBTb0MgUzkwNVgyLCBidXQgdGhlIG5ldyBib2FyZCB2aW0xcwo+ID4gaXMg
YmFlZCBvbiBTOTA1WTQsCj4gPiB0aGV5IGFyZSBkaWZmZXJlbnQgU29DLCBzbyB3ZSBuZWVkIHRv
IHB1dCBTOTA1WTQgdW5kZXIgUzgwNVgyID8KPgo+IFdoYXQgaXMgdGhlIHBvaW50IG9mIGhhdmlu
ZyB0d28gc2VwYXJhdGUgbGlzdHMgd2l0aCBlbnVtcyBlbmRpbmcgdGhlCj4gc2FtZSBTb0MgY29t
cGF0aWJsZT8KCkFjdHVhbGx5IFM4MDVYMiBhbmQgUzkwNVk0IGFyZSBkaWZmZXJlbnQgU29DLiBT
byBtYXliZSBsaWtlIHRoaXMgPwoKUzgwNVgyOgotIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0
aGUgQW1sb2dpYyBNZXNvbiBTNCBTODA1WDIgU29DCiAgaXRlbXM6CiAgICAtIGVudW06CiAgICAg
ICAgLSBhbWxvZ2ljLGFxMjIyCiAgICAtIGNvbnN0OiBhbWxvZ2ljLHM4MDV4MgogICAgLSBjb25z
dDogYW1sb2dpYyxzNAoKUzkwNVk0OgotIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1s
b2dpYyBNZXNvbiBTNCBTOTA1WTQgU29DCiAgaXRlbXM6CiAgICAtIGVudW06CiAgICAgICAgLSBr
aGFkYXMsdmltMXMKICAgIC0gY29uc3Q6IGFtbG9naWMsczkwNXk0CiAgICAtIGNvbnN0OiBhbWxv
Z2ljLHM0CgpTYW1lIGFzIEFtbG9naWMgQTMxMUQgJiBTOTIyWAoKUzkyMlg6Ci0gY29uc3Q6IGFt
bG9naWMsczkyMngKLSBjb25zdDogYW1sb2dpYyxnMTJiCgpBMzExRDoKLSBjb25zdDogYW1sb2dp
YyxhMzExZAotIGNvbnN0OiBhbWxvZ2ljLGcxMmIKCj4KPiA+Cj4gPj4KPiA+Pj4gKyAgICAgICAg
ICAgICAgLSBraGFkYXMsdmltMXMKPiA+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM0
Cj4KPiBBbmQgaGVyZS4KPgo+ID4+Cj4gPj4gQmVzdCByZWdhcmRzLAo+ID4+IEtyenlzenRvZgo+
ID4+Cj4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
