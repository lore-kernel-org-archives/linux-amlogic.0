Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DEC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Dec 2021 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l7qEgGnseMXu5FHRUVSPfowP5FX9zwbJGYl3kyCu4mY=; b=cg/wxUQ+nM98dMfaRgmV+fFnNE
	LGk0OsQ1z4r46LECBUJOGpMpfLEUAxF3KXkscH/keHe1eq+fLBroK5DZd/GQ0P4RgcXZh0DCyF0OJ
	xT8Yk1FLzfdzhzrkH1XZU2R+Eq/bok0FtfSa7jXLjzxgMrUT2WZu+2pUmJTBzlq3omtLCjtFWBmcM
	D+7xr+MlBHdxpXt6hnkY5wMTpKmKgN4cBpnvjr4owtLhHACveTnOHnxXV49TpaV2qqmwGEDITVwD4
	DJ0Ivldq0Id3GsF3f63tPm+bp9OSeGlghrMGW/PzIjyLONOunEbBCxbeyomNslEqzNETh7QPF8p9P
	RfArfjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mus9P-00Bg0E-Fd; Wed, 08 Dec 2021 08:18:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mus9B-00Bfy9-OJ
 for linux-amlogic@lists.infradead.org; Wed, 08 Dec 2021 08:17:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so3612749wme.0
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Dec 2021 00:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lefHfKE34iN2p1ZLfnnsya19wPeFFyglrNNbrUVmITA=;
 b=k/l3QcLPU8iWZY1229lunqMUPVkkT6K1yXj0wmGZ8bOvkgMaIeTa5yyg4muOyamaIv
 9m39fOS+2E57jztIbXvWk7unwxBtWLc+cV77DKSqGYkTsCP208JRJaJhjYBti+Jruu0i
 RNrSF1q+bKJsY+xhi1id/6SP84T0VysUgvnXkqq1b1fwS/pNtw1s7VDqF8DUtaTN7Fex
 1IvmxX78pvYw8ln06GdMmTCUmVUaRw1CiyzCkDuPg9eXf8nazLMKAxBrlg29A9mKQeLh
 ha4FJTiy2hZp9IMzZSEKCqYyBKXsAyEP62OVlwAuX3nxB6zPMGuEdDVrttGhsrUCYTEi
 IUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lefHfKE34iN2p1ZLfnnsya19wPeFFyglrNNbrUVmITA=;
 b=Wg2XojnYYuRxX7sRzPb+Ow01ULkxw4siHbayLJ0iaHU43kVEtd2O0BY1mSCIZFGB4B
 y7eUQ+PsrjFqlYjtOs2bkxvvzTYvUEV+5ZjDm2f2D5m1GSohyVXfl+NrVEaHR63pItoP
 yHtTZ3sLtpir+obhBuUshZ4UtiGH4lAPhv/aeG6+ddWWyCYLEWwFrUbpSKHdYU66n/mg
 TBg5R3r0hzAhHMF1PlBF0mh0+U9J/1npSOZH/zdg2YQoTTBcewAvEoCAfzN9C347vvh/
 FSQm9dVZ3Kf89eIzZwjqGqE5JpKiy2I6Wxnh/ZZV26kOWW+y3DrNg4YcP4ZS4yJujB6v
 75Kw==
X-Gm-Message-State: AOAM533w7rz2TSjWOn+LMx05zr/nCYIDAF7bHhtvFgSc8HsSy4voxsC9
 zhAPOzCCVIEK+A31EOBtCyhVXA==
X-Google-Smtp-Source: ABdhPJyrPpzIrMmzjZxmp1JOMP0OzoPDHXAMEAEuljzRqg3sM2iiawD2lnjSigiJ92Fl1wJQQUq2Bg==
X-Received: by 2002:a05:600c:4e51:: with SMTP id
 e17mr14077484wmq.127.1638951470915; 
 Wed, 08 Dec 2021 00:17:50 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:5245:80ea:cf46:35bb?
 ([2001:861:44c0:66c0:5245:80ea:cf46:35bb])
 by smtp.gmail.com with ESMTPSA id o9sm2071298wrs.4.2021.12.08.00.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:17:50 -0800 (PST)
Subject: Re: [RFC PATCH 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Benoit Masson <yahoo@perenite.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-3-christianshewitt@gmail.com>
 <Ya/Qask7Fpb6mTxb@robh.at.kernel.org>
 <C1918DC0-F873-4832-AF1A-91AFEF4F7151@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b3307dfd-962c-73bb-1712-8dbbf977b6f5@baylibre.com>
Date: Wed, 8 Dec 2021 09:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <C1918DC0-F873-4832-AF1A-91AFEF4F7151@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_001753_905218_1378901F 
X-CRM114-Status: GOOD (  20.86  )
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

T24gMDgvMTIvMjAyMSAwNTo0NCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPj4gT24gOCBE
ZWMgMjAyMSwgYXQgMToyMSBhbSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Cj4+IE9uIFR1ZSwgTm92IDMwLCAyMDIxIGF0IDA2OjA1OjE2QU0gKzAwMDAsIENocmlzdGlh
biBIZXdpdHQgd3JvdGU6Cj4+PiBBZGQgYm9hcmQgYmluZGluZ3MgZm9yIHRoZSBBbWVkaWF0ZWNo
IFg5Ni1BSVIgU1RCIHdoaWNoIHNoaXBzIHdpdGgKPj4+IG1vZGVsIHZhcmlhbnRzIGRpc3RpZ3Vp
c2hlZCBieSBFdGhlcm5ldCBjb25maWd1cmF0aW9uOiBtb2RlbHMgdXNpbmcKPj4+IGludGVybmFs
IDEwLzEwMCBQSFkgaGF2ZSBhIC0xMDAgc3VmZml4LCB3aGlsZSBtb2RlbHMgdXNpbmcgZXh0ZXJu
YWwKPj4+IEdpZ2FiaXQgUEhZIGhhdmUgYSAtMTAwMCBzdWZmaXguCj4+Cj4+IElzbid0IHRoZSBw
aHkgZGVzY3JpYmVkIGluIERUPyBXaHkgZG8geW91IG5lZWQgdG8gZGVzY3JpYmUgdGhpcyAxIAo+
PiBkaWZmZXJlbmNlIGF0IHRoZSB0b3AgbGV2ZWw/CgpUaGUgZGlmZmVyZW5jZSBpcyBiZXR3ZWVu
IGludGVybmFsIFZTIGV4dGVybmFsIFBIWSwgd2hpY2ggbWVhbnMKZGlmZmVyZW5jZSBpbiBwaW5t
dXhpbmcgJiBzZXR0aW5ncyBmb3IgdGhlIE1ESU8gbXV4IHNlbGVjdGluZyB0aGUKUEhZIGludGVy
ZmFjZS4KClRoZSBvdGhlciBpc3N1ZSBpcyBhYm91dCB0aGUgYm9vdGxvYWRlciwgdGhlIHZlbmRv
ciBib290bG9hZGVyIGlzIG5vdApuZWNlc3NhcmlseSBjYXBhYmxlIG9mIGRldGVjdGluZyB0aGUg
UEhZIHR5cGUsIGFuZCBjb3JyZWN0bHkgYWx0ZXJpbmcKdGhlIERUIHdpdGhvdXQgYSBjb21wbGV4
IHNjcmlwdC4KCkhhdmluZyBhIHNpbmdsZSBEVCBhZGRzIGEgZGVwZW5kZW5jeSBvbiB0aGUgYm9v
dGxvYWRlciwgd2hpY2ggZm9yIG1lIGlzbid0CmFjY2VwdGFibGUuCgpOZWlsCgo+IAo+IFVzZXJz
IHdobyBwdXJjaGFzZSBBbmRyb2lkIFNUQnMgYXMgYSBjaGVhcCBMaW51eCBtZWRpYSBkZXZpY2Ug
KG9yIGFyZQo+IHJlaW1pYWdpbmcgYW4gZXhpc3RpbmcgZGV2aWNlIHdoZW4gdGhleSBnaXZlIHVw
IG9uIEFuZHJvaWQpIGdlbmVyYWxseQo+IGhhdmUgbm8gaWRlYSB3aGF0IGEgUEhZIGlzLCBzbyBy
ZWFkaW5nIGEgZGV2aWNlLXRyZWUgZmlsZSB0byBwaWNrIHRoZQo+IGNvcnJlY3Qgb25lIGlzIGJl
eW9uZCB0aGVtLiBNb3N0IHBlb3BsZSBibGluZGx5IHRyeSBhbGwgZHRiIGZpbGVzIGZvcgo+IGEg
Y2xhc3Mgb2YgZGV2aWNlIHVudGlsIHRoZXkgZmluZCBvbmUgdGhhdCB3b3Jrcywgc28gdG9wLWxl
dmVsIG5hbWluZwo+IGlzIHNpbXBseSB0byBoaW50IHRoZSBwcm9jZXNzIGFuZCByZWR1Y2UgZ3Vl
c3N3b3JrLiBJdOKAmXMgbm90IHBlcmZlY3QsCj4gYnV0IGl0IGRvZXMgYXBwZWFyIHRvIHJlZHVj
ZSB0aGUgcXVhbnRpdHkgb2Yg4oCcRXRoZXJuZXQgZG9lc27igJl0IHdvcmsh4oCdCj4gcG9zdHMg
c2VlbiBpbiBzdXBwb3J0IGZvcnVtcy4KPiAKPiBDaHJpc3RpYW4KPiAKPj4+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+Pj4gLS0t
Cj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8
IDIgKysKPj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4g
aW5kZXggMzYwODE3MzRmNzIwLi5lOWFiMGZmZThiZTcgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPj4+IEBAIC0x
NzAsNiArMTcwLDggQEAgcHJvcGVydGllczoKPj4+ICAgICAgIC0gZGVzY3JpcHRpb246IEJvYXJk
cyB3aXRoIHRoZSBBbWxvZ2ljIE1lc29uIFNNMSBTOTA1WDMvRDMvWTMgU29DCj4+PiAgICAgICAg
IGl0ZW1zOgo+Pj4gICAgICAgICAgIC0gZW51bToKPj4+ICsgICAgICAgICAgICAgIC0gYW1lZGlh
dGVjaCx4OTYtYWlyLTEwMAo+Pj4gKyAgICAgICAgICAgICAgLSBhbWVkaWF0ZWNoLHg5Ni1haXIt
MTAwMAo+Pj4gICAgICAgICAgICAgICAtIGJhbmFuYXBpLGJwaS1tNQo+Pj4gICAgICAgICAgICAg
ICAtIGhhcmRrZXJuZWwsb2Ryb2lkLWM0Cj4+PiAgICAgICAgICAgICAgIC0gaGFyZGtlcm5lbCxv
ZHJvaWQtaGM0Cj4+PiAtLSAKPj4+IDIuMTcuMQo+Pj4KPj4+Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
