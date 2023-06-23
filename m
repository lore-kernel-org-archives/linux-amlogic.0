Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5C7EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 17:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTDb2sfpKJVTi/4NQvTCy6xMxI/BYqDbjIW7Hf7sIC0=; b=bRhvWZBJkXnmR5
	0ShEIkOjV08gVgh8TFO3F9mEcYHpfMww7xEE0fWjGlFoX7TsCIWnCK6g7duli1zZ5KCnz1FxtgqO5
	Wf/1nte604BDhlCkQYsQDY8CZSYPWMDZHBuatBLmPmKGgs9cASHDQjjq/LUjwY9QRe7Qxg6+7R1CT
	cP5t3ga/1HXdHTghlAI4Bm2nOnIgOT7tLp8HAZcPaBp7babq03Vx5zjAset7FbzPxTuF3NJCu8dWY
	5t9cXnN0NMU+0Id1QodfpNDQcQlxi/IOG6xid1fmxPagapZjepIK1EUJYoFZ6Lkz6lhROOGktT2mH
	nt3RC4Wg1RfgcOKSsVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCl1D-004FXY-08;
	Fri, 23 Jun 2023 17:56:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCl18-004FWT-2y
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jun 2023 17:56:20 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b4826ba943so15332341fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Jun 2023 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687542975; x=1690134975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dqpntf/6Jri52Dcd19VIMHj5sv//Ye/CfucOhTnMjgU=;
        b=Yj0UJFhh2g2V49OOG4n5Gda142ZxJ4dg235MQYhivc9d0ZojA3dKvfYOhxBujrF9QI
         U4BTstcBKpe6uHtOYFF+W25IqepRYllfB/w9tYjAhM7uTCxl9/yr5plD/R6Lit+hFGmT
         +jEV8l66VXQsCO+UXk+jU+tZl1o3rgu8HvvTzh0eD1n9/uHCn6h3Xn1wx5T3ckK3GCzr
         eOr0wXf5u3FZdHmY2gYkQsBHuP+2xtzHU6w6ez03wHwx3JeJ5mxSAX2EhBASwKXh6aeD
         LPewZFDqiWRhO9il6HKDANA87U9FjG7oTr2hV+wrrTHDgRDEYzARs/MDUSDiu7gqileL
         VEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687542975; x=1690134975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqpntf/6Jri52Dcd19VIMHj5sv//Ye/CfucOhTnMjgU=;
        b=TYWHIc0QWG/drmTEWm7XA59S9J6QfINnVgLW9IoK3CCwJbgde5r/uNFmtD3l8+aOL9
         ybWulvEFOfwQ3IaSe35lsdLAhuaWlSoiONKXhzgL+OV/F9ySEXXhQBMaZxumfatMKdop
         izk672ep8ne4hcBadDmK3e5J7C51HrF5/PSuGe/htt/+3G2Gesdt4MO5gSdz1AR84H6T
         6KCgLXaR4Hx3V5Tk5a1jwlTki1I36MrtdBwFEKEMKO09BoQP8/eYnl6m/UQFG/S0LUDm
         eMfDiEdCxUVwhoGNS48JWpylH0T9CrW+qjGNZ26tVnyX7lYy905C0I6SEqoouRGz1eGq
         08Qg==
X-Gm-Message-State: AC+VfDz+10Ty+5w+MO/1Ode/SX5WGkpubOK4xvthM+x/oXB5qkss2SHX
	PfXtEWrAig6lXWl05Pglghf/+g==
X-Google-Smtp-Source: ACHHUZ5Rb1W0hIZd8jNjDreq5gpwDgx93jadu/h6j65zS2ADyQMD99TR5ZTtPVk0E+fLejpNAIB9BQ==
X-Received: by 2002:a05:651c:1022:b0:2b4:636a:67f4 with SMTP id w2-20020a05651c102200b002b4636a67f4mr13763243ljm.20.1687542974817;
        Fri, 23 Jun 2023 10:56:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w20-20020a1709060a1400b00977eec7b7e8sm6279522ejf.68.2023.06.23.10.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 10:56:14 -0700 (PDT)
Message-ID: <4fba1603-5741-ec1b-122f-d6a92803f49a@linaro.org>
Date: Fri, 23 Jun 2023 19:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/4] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Content-Language: en-US
To: tanure@linux.com
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230623081242.109131-1-tanure@linux.com>
 <20230623081242.109131-3-tanure@linux.com>
 <a885b97e-aaf0-cb72-f25b-71054d6d3fe2@linaro.org>
 <CAJX_Q+2qZg+RuwxmnM3rzs_akt_UMJRx+=aMxf72P-sGNjm9uw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJX_Q+2qZg+RuwxmnM3rzs_akt_UMJRx+=aMxf72P-sGNjm9uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_105619_019121_9185D446 
X-CRM114-Status: GOOD (  19.32  )
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

T24gMjMvMDYvMjAyMyAxOTo1MywgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDIz
LCAyMDIzIGF0IDk6NTHigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIzLzA2LzIwMjMgMTA6MTIsIEx1Y2Fz
IFRhbnVyZSB3cm90ZToKPj4+IEFtbG9naWMgVDcgU29DcyB1c2VzIHRoZSBzYW1lIFVBUlQgY29u
dHJvbGxlciBhcyBTNCBTb0NzIGFuZCBHMTJBLgo+Pj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgYW4g
ZXh0cmEgY29tcGF0aWJsZSBsaW5lIGluIHRoZSBkcml2ZXIsIGJ1dAo+Pj4gYWRkIFQ3IGNvbXBh
dGlibGUgbGluZSBmb3IgZG9jdW1lbnRhdGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNh
cyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4+PiAtLS0KPj4+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgICAgICAgIHwgNCArKysrCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFy
dC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2lj
LG1lc29uLXVhcnQueWFtbAo+Pj4gaW5kZXggMDFlYzQ1YjNiNDA2Li5hZDk3MGM5ZWQxYzcgMTAw
NjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2Ft
bG9naWMsbWVzb24tdWFydC55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4+PiBAQCAtNTAsNiArNTAs
MTAgQEAgcHJvcGVydGllczoKPj4+ICAgICAgICAgIGl0ZW1zOgo+Pj4gICAgICAgICAgICAtIGNv
bnN0OiBhbWxvZ2ljLG1lc29uLWcxMmEtdWFydAo+Pj4gICAgICAgICAgICAtIGNvbnN0OiBhbWxv
Z2ljLG1lc29uLWd4LXVhcnQKPj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBVQVJUIGNvbnRyb2xs
ZXIgb24gVDcgY29tcGF0aWJsZSBTb0NzCj4+Cj4+IFlvdXIgZGVzY3JpcHRpb24gaXMgcmF0aGVy
IGluY29ycmVjdC4gVGhpcyBpcyBVQVJUIG9uIFNvQ3MgY29tcGF0aWJsZQo+PiB3aXRoIFM0LCBu
b3Qgd2l0aCBUNy4gT3RoZXJ3aXNlIHdoYXQgZG8geW91IGV4cGVjdCB0byBncm93IGxhdGVyIHdo
ZW4KPj4gYWRkaW5nIG1vcmUgY29tcGF0aWJsZSBkZXZpY2VzPyBKdXN0IGRyb3AgdGhlIGRlc2Ny
aXB0aW9uLCBpdCdzIGtpbmQgb2YKPj4gb2J2aW91cyB3aGVuIGRvbmUgY29ycmVjdGx5IChidXQg
Y2FuIGJlIG1pc2xlYWRpbmcgaWYgZG9uZSB3cm9uZykuCj4+Cj4+IEFja2VkLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4+Cj4gU29ycnks
IGJ1dCBTNCBpcyBhbHJlYWR5IGFkZGVkIGluIGFub3RoZXIgd2F5LCB3aGljaCBhY2NlcHRzIGp1
c3QgYW4KPiBTNCBjb21wYXRpYmxlIHN0cmluZy4KPiBCdXQgZm9yIFQ3IHdlIG5lZWQgYSBmYWxs
YmFjay4KPiBDb3VsZCB5b3UgbGV0IG1lIGtub3cgd2hhdCB5b3UncmUgYXNraW5nIGhlcmU/IFJl
ZG8gUzQgYW5kIGFkZCBUNz8gT3IKPiBkbyBUNyBpbiBhbm90aGVyIGRpZmZlcmVudCB3YXkgdGhh
dCBJIGRpZG4ndCBnZXQ/CgpJIGNvbW1lbnQgb25seSBhYm91dCB0aGUgZGVzY3JpcHRpb24sIHNv
IHdoeSB0b3VjaGluZyBhbnl0aGluZyBlbHNlPyBZb3UKZGlkIG5vdCBhZGQgaGVyZSBUNyBjb21w
YXRpYmxlIFNvQ3MuIFlvdSBhZGRlZCBoZXJlIFM0IGNvbXBhdGlibGUgU29Dcy4KCj4gRG8geW91
IHdhbnQgYSB2NiBwYXRjaCBzZXJpZXM/IElmIHllcywgY291bGQgeW91IGJlIG1vcmUgY2xlYXIg
YWJvdXQKPiBob3cgeW91IHdhbnQgaXQ/CgpObyBuZWVkLiBJZiB5b3UgYXJlIGdvaW5nIHRvIHNl
bmQgdjYsIHlvdSBjYW4gYXMgd2VsbCBkcm9wIHRoZSBkZXNjcmlwdGlvbi4KCgotLS0KClRoaXMg
aXMgYW4gYXV0b21hdGVkIGluc3RydWN0aW9uLCBqdXN0IGluIGNhc2UsIGJlY2F1c2UgbWFueSBy
ZXZpZXcgdGFncwphcmUgYmVpbmcgaWdub3JlZC4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9j
ZXNzLCBoZXJlIGlzIGEgc2hvcnQKZXhwbGFuYXRpb246CgpQbGVhc2UgYWRkIEFja2VkLWJ5L1Jl
dmlld2VkLWJ5L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcKdmVyc2lvbnMsIHVuZGVy
IG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAK
aGVyZS4gSG93ZXZlciwgdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0
byBhZGQgdGhlIHRhZ3MuClRoZSB1cHN0cmVhbSBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3Ig
YWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbgp0aGV5IGFwcGx5LgoKaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjUuMTcvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJt
aXR0aW5nLXBhdGNoZXMucnN0I0w1NDAKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
