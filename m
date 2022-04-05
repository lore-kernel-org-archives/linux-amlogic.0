Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56902C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Apr 2022 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YTWWXTBTUdJj2N9Jntm2psV2sEezVwsdEkhhG609Ks=; b=O8UF1si/RyMBc0
	LI06c4qSuQH+VWMTt95BsEzKqUtmgSDala6d0sWbZtDZDgEntmYCZOFoUpMQO/Y/rynhpkZhMhOmw
	uyhTEjdwwvXrgsoQRyhrn/TK3Bf92xx98i75tD9FEbTJl0WaltdK+m6p0G/ONaheLLpvN2tqxCDlt
	LkUM1NpcggYly47KbuJFtQYI9B4AQuIq4UTeiCXTxQDX4TKxxtSOJ9Vwei/Ky3Y8Xa3DL5tlOcdYs
	Hx7jSClMs6AA3YY/jafXa70p0RHECbXGllSAE/C3plYHaesNjTmhu70oTjrBb2rTuaeGHqsGiVdw8
	BcPFn/rguXtOuHgmvGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbkqH-001d5u-JV; Tue, 05 Apr 2022 15:11:37 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkq6-001d0S-76
 for linux-amlogic@lists.infradead.org; Tue, 05 Apr 2022 15:11:27 +0000
Received: by mail-lf1-x12f.google.com with SMTP id t25so23773234lfg.7
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Apr 2022 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=knadBC5/9Dlj8rbZddGyUUv9/Z5ol7Dtv9U1ioqP9jA=;
 b=4WXxBwXx7EL1bnbBadqVFwnRXzEoKBnMCPyQY1ZoY51R3YnPyJSrpchjfB6SICDwsJ
 5alKgXGkZ0+I2dyFvgJGXRqq9S7J0CWijdEsqtbZyqcsb9/kzsafqkVrI8xVxcY72nkg
 UGCEDmkItzRH77RJhiDAiVZmPMq9iBdIfg9uaN8BHGlPsTQynByp4OpSEyaEevxlFS77
 Qef8G+zninZ7IFRAGP9u/2MlkCD19bQzY1o2vc3fSvDaAeHrUE7NH83wxI08mKsTZK7G
 sJ5I+oQd+gn/b/mCW4Ct/uXiaXcZ1hOSLpsU3SjMOep+xv/JHCQbkqq7/lg9kEhzrpAK
 li0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=knadBC5/9Dlj8rbZddGyUUv9/Z5ol7Dtv9U1ioqP9jA=;
 b=iQdNy9gRuFgDI2FWuPchcb5fKiDeJOGUxtFlc3+WZpilFg9/mGvteQ7MWikTduPtqC
 NRwCHtcdmZ+UcumDb/F0GPT0m9KC7NTq82CbODkW4ie8CUasM7EKE+Lac9rDVBmVrifT
 dyBDFhHSZkNjncBA7vWrNav0ZKWA3ex6m6xjZ2WIQqHEpQhATi11hiXYi21eyirSLuXn
 DC8PQZbq3Y9vFNe0UYPZL0pKTUv7xipSUZILfx6vX3XLQbVG23eehbJkLpDAcstVvUQ+
 o90BLCHcnqULRFkxmw5wIIC8EoBUwyExn0IRnHzxmz/GsyhGhyjHkLauQrciQowKe3Ng
 lF6g==
X-Gm-Message-State: AOAM531EeFDdibgeY/BgmyX5KiEngCrFTzX7mQwlyPiju+SacszdFYGr
 zgc310eLQ+tyEUEy0CumphI0og==
X-Google-Smtp-Source: ABdhPJzACQiDfI4qUdkgsvTX0RPVvPl+IFhGVEeH45oKkhd6o7WfMVVtWugGdQVsuaBLCEHNpE0Tsw==
X-Received: by 2002:a05:6512:3a83:b0:44a:5878:24d6 with SMTP id
 q3-20020a0565123a8300b0044a587824d6mr2899935lfu.426.1649171480237; 
 Tue, 05 Apr 2022 08:11:20 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed?
 ([2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a056512047700b0044a3c53e12dsm1533643lfd.169.2022.04.05.08.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 08:11:19 -0700 (PDT)
Message-ID: <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
Date: Tue, 5 Apr 2022 17:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: en-US
To: tanure@linux.com, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_081126_283896_9FC89B26 
X-CRM114-Status: GOOD (  16.97  )
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

SGksCgpPbiAyOC8wMy8yMDIyIDIzOjUxLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gCj4gCj4gT24g
TW9uLCAyOCBNYXIgMjAyMiwgMjE6MzcgS2V2aW4gSGlsbWFuLCA8a2hpbG1hbkBiYXlsaWJyZS5j
b20gPG1haWx0bzpraGlsbWFuQGJheWxpYnJlLmNvbT4+IHdyb3RlOgo+IAo+ICAgICBIaSBMdWNh
cywKPiAKPiAgICAgTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tIDxtYWlsdG86dGFudXJl
QGxpbnV4LmNvbT4+IHdyaXRlczoKPiAKPiAgICAgID4gVGhlIGRlZmF1bHQgZHV0eSBjeWNsZSBv
ZiAzMyUgaXMgbGVzcyB0aGFuIHRoZSByZXF1aXJlZAo+ICAgICAgPiBieSB0aGUgSTJDIHNwZWNz
IGZvciB0aGUgTE9XIHBlcmlvZCBvZiB0aGUgU0NMIGNsb2NrLgo+ICAgICAgPgo+ICAgICAgPiBT
bywgZm9yIDEwMEtoeiBvciBsZXNzLCB1c2UgNTAlSC81MCVMIGR1dHkgY3ljbGUsIGFuZAo+ICAg
ICAgPiBmb3IgdGhlIGNsb2NrIGFib3ZlIDEwMEtoeiwgdXNlIDQwJUgvNjAlTCBkdXR5IGN5Y2xl
Lgo+ICAgICAgPiBUaGF0IGVuc3VyZXMgdGhlIGxvdyBwZXJpb2Qgb2YgU0NMIGlzIGFsd2F5cyBt
b3JlIHRoYW4KPiAgICAgID4gdGhlIG1pbmltdW0gcmVxdWlyZWQgYnkgdGhlIHNwZWNzIGF0IGFu
eSBnaXZlbiBmcmVxdWVuY3kuCj4gCj4gICAgIFRoYW5rcyBmb3IgdGhlIGZpeGVzIQo+IAo+ICAg
ICBUaGlzIGlzIGdvaW5nIHRvIGFmZmVjdCBhbGwgU29Dcywgc28gb3VsZCB5b3UgcGxlYXNlIHN1
bW1hcml6ZSBob3cgeW91cgo+ICAgICBjaGFuZ2VzIHdlcmUgdGVzdGVkLCBhbmQgb24gd2hpY2gg
U29DcyAmIGJvYXJkcz8KPiAKPiAgICAgVGhhbmtzLAo+IAo+ICAgICBLZXZpbgo+IAo+IAo+IEhp
LAo+IAo+IEkgb25seSB0ZXN0ZWQgYWdhaW5zdCB2aW0zIGJvYXJkLCBtZWFzdXJlZCB0aGUgYnVz
IHdpdGggYW7CoHNhbGVhZSBsb2dpYyBwcm8gMTYuCj4gVGhlIG1lYXN1cmVtZW50cyB3ZXJlIHdp
dGggMTAwaywgNDAwayBhbmQgYSBmZXcgaW4gYmV0d2VlbiBmcmVxdWVuY2llcy4KPiAKPiBJcyB0
aGF0IGVub3VnaD8KCkkgZGlkIGEgZmV3IG1lYXN1cmVzIG9uIHRoZSBMaWJyZSBDb21wdXRlciBM
ZSBQb3RhdG8gUzkwNVggYm9hcmQ6CgppMmNfQU86CgpCZWZvcmUgdGhlIHBhdGNoc2V0LCBJIGdv
dDoKLSAxMDBLSHo6IDEuNjZ1UyBISUdILCA2Ljc1dVMgTE9XLCAyMCUvODAlLCBGcmVxIDExOEtI
eiAvIVwKLSA0MDBLSHo6IFVuYWJsZSB0byBkZWNvZGUsIGNsb2NrIGxpbmUgaXMgaW52YWxpZCwg
RGF0YSBsaW5lIGlzIGFsc28gaW52YWxpZAoKV2l0aCB0aGUgcGF0Y2hzZXQKLSAxMDBLSHo6IDQu
MjV1UyBISUdILCA2LjU4dVMgTE9XLCA0MCUvNjAlLCBGcmVxIDkyS0h6Ci0gNDAwS0h6OiAwLjMz
dVMgSElHSCwgMy4wMHVTIExPVywgMTAlLzkwJSwgRnJlcSAzMDBLSHoKCmkyY19COgoKQmVmb3Jl
IHRoZSBwYXRjaHNldCwgSSBnb3Q6Ci0gMTAwS0h6OiAyLjI1dVMgSElHSCwgNS40MXVTIExPVywg
MjklLzcxJSwgRnJlcSAxMzBLSHogLyFcCi0gNDAwS0h6OiAwLjQydVMgSElHSCwgMS42NnVTIExP
VywgMjAlLzgwJSwgRnJlcSA0ODBLSHogLyFcCgpXaXRoIHRoZSBwYXRjaHNldAotIDEwMEtIejog
NC43NXVTIEhJR0gsIDUuNDJ1UyBMT1csIDQ2JS81NCUsIEZyZXEgOThLSHoKLSA0MDBLSHo6IDAu
NjZ1UyBISUdILCAyLjAwdVMgTE9XLCAyNCUvNzUlLCBGcmVxIDM3NUtIegoKClNvIHRoaXMgZml4
ZXMgdGhlIGZyZXF1ZW5jeSwgYmVmb3JlIHRoZXkgd2VyZSBpbnZhbGlkLgpBbmQgaXQgZml4ZXMg
NDAwS0h6IG9uIGkyY19BTy4uLgoKSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgYmVoYXZpb3IgaXMg
ZGlmZmVyZW50IGJldHdlZW4gaTJjX0FPICYgaTJjX0IsIHRoZXkKYXJlIGZlZWQgd2l0aCB0aGUg
c2FtZSBjbG9jayBzbyBpdCBzaG91bGQgYmUgdGhlIHNhbWUuCgpEaWQgeW91IGNoZWNrIG9uIGJv
dGggaTJjIGludGVyZmFjZXMgPyBjYW4geW91IHNoYXJlIHlvdXIgcmVzdWx0cyA/CgpOZWlsCgo+
IAo+IFRoYW5rcwo+IEx1Y2FzCj4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
