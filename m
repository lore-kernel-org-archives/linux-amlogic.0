Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE1C46467
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 22:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIoYnoz9KJNYaMfzpr2H6Uh+Y1c7x5eLzUyiawN1wUU=; b=san4cF19USc9Ul
	gPeYzcFw8WU5pKKahtM96AfO5w+7fZcXL37/gB79ruUQh8lY7WCNpx3MyGL55HmlhKrAZ3kl9KYyM
	4GtC7F7Pku8FYNx2bgugzdiVtGBBQ7dGzsF79BWFNlfMsIKmx3RyZolq66EU14J80Ps4xG/1AKldO
	Unw9gS15/hhOiXWXEyU1yaB2hrqDqapv1kWuX5oZCjdfWIpIh+jMNCFrge+QkEmm1da9j+Fih3M33
	Kp585AmVRBTRPG6dWet/u8F5LzHJ802klwhPz29ZRXg5lHRRVXcv3+D9WUVTW4XsxrWNdbyiBBAI2
	uOSL4dExuuN+aJKxMW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdcn-007V2P-5i; Thu, 19 Jan 2023 22:43:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdca-007Uyl-QB; Thu, 19 Jan 2023 22:43:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id ud5so9641650ejc.4;
        Thu, 19 Jan 2023 14:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wp1oH3VUeR8ctDbrH8Su2X852AptYELpIhyYkwz3XhU=;
        b=fgBrJZbIA/l4ZBuwloIrwqfNZDxDJ6pT5E0y/03G4LSnHeQyhmYY2Dn31ZQSuZNq7c
         5xAbt6XeL21Tyxdia6IsElgzdkWGVu+OW3/TEgB3++PMxS95NMje7CDNJoMMeQ9sCBJN
         RbFu55SK7eGr8ldGitcj7LULi9nN6Yn5+uT3q0utpjcCT3+6eDtZn6D1u2KCukWLtdzr
         JP0ty3lusp4xI3TB656j84TrZReZt8YypJMxDGX+gcYFtJBhaMyrUrMz872fkdOLEmQE
         Hq9TblLX/a7VexOVuDhZ+Ma57LW4BxqnYpXTVvx4EywQHVDkvETPDCrvqb/TbyLtSdpB
         fkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wp1oH3VUeR8ctDbrH8Su2X852AptYELpIhyYkwz3XhU=;
        b=xv9dsCuBB8DgcfaeNwmWBE9YTRIXMtUFvQKkPzp5lwOKvM59iNjjPVu+z7S5GuEHpJ
         zNpgqKmxYixT1yPosf0JrJCuCIS12v71ty2gg+ocDAdvVjLpBQjVNPSwuikQT1cWosu+
         T3czWklzl9JZxMstpuLuzNxqHYELi5v3R6LHDCFGaoTSWtC2urM7XADIABDyi8XMCgwt
         9fmbOK6XhzPF1hGFzlOKly6dJ7YYHrZADZfEY76Jy//Khvt9cQLgTlsG1S4uAz3ViQeK
         +pBHoOjH458usGFybHwAWmrqiwKm9ie160y6O/YlmXfe/BBvC/hI80yfwCjkQuGpVzZD
         OPEA==
X-Gm-Message-State: AFqh2kqap6RsFzhDG7A8VKgNQZkG3OqbgakbTcnprpNmGTrl/Hw0rZuW
	8MjYnCmQ4suBXnyMYvS2lUs=
X-Google-Smtp-Source: AMrXdXsmxFZd/rHacNHGgaNO0QgicI8Ygk33pTya8486hCbXBRvtbb9wFn//Xw+vipC4b2R7t75KSA==
X-Received: by 2002:a17:906:6a27:b0:872:8c97:db27 with SMTP id qw39-20020a1709066a2700b008728c97db27mr14876851ejc.69.1674168176978;
        Thu, 19 Jan 2023 14:42:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1? (dynamic-2a01-0c23-c477-4300-3c6e-3915-fc5a-2ff1.c23.pool.telefonica.de. [2a01:c23:c477:4300:3c6e:3915:fc5a:2ff1])
        by smtp.googlemail.com with ESMTPSA id 9-20020a170906218900b0084cb4d37b8csm17043453eju.141.2023.01.19.14.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 14:42:56 -0800 (PST)
Message-ID: <e75ed56f-ba25-f337-e879-33cc2a784740@gmail.com>
Date: Thu, 19 Jan 2023 23:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
In-Reply-To: <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_144300_908014_433FC904 
X-CRM114-Status: GOOD (  31.03  )
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

T24gMTUuMDEuMjAyMyAyMTozOCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDE1LjAxLjIw
MjMgMTk6NDMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBIaSBIZWluZXIsCj4+Cj4+IExlIDE1
LzAxLzIwMjMgw6AgMTg6MDksIEhlaW5lciBLYWxsd2VpdCBhIMOpY3JpdMKgOgo+Pj4gT24gMTUu
MDEuMjAyMyAxNzo1NywgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4gT24gU3VuLCBKYW4gMTUsIDIw
MjMgYXQgMDQ6MTk6MzdQTSArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4+PiBPbiBt
eSBTQzItYmFzZWQgc3lzdGVtIHRoZSBnZW5waHkgZHJpdmVyIHdhcyB1c2VkIGJlY2F1c2UgdGhl
IFBIWQo+Pj4+PiBpZGVudGlmaWVzIGFzIDB4MDE4MDMzMDAuIEl0IHdvcmtzIG5vcm1hbCB3aXRo
IHRoZSBtZXNvbiBnMTJhCj4+Pj4+IGRyaXZlciBhZnRlciB0aGlzIGNoYW5nZS4KPj4+Pj4gU3dp
dGNoIHRvIFBIWV9JRF9NQVRDSF9NT0RFTCB0byBjb3ZlciB0aGUgZGlmZmVyZW50IHN1Yi12ZXJz
aW9ucy4KPj4+Pgo+Pj4+IEhpIEhlaW5lcgo+Pj4+Cj4+Pj4gQXJlIHRoZXJlIGFueSBkYXRhc2hl
ZXRzIGZvciB0aGVzZSBkZXZpY2VzPyBBbnl0aGluZyB3aGljaCBkb2N1bWVudHMKPj4+PiB0aGUg
bG93ZXIgbmliYmxlIHJlYWxseSBpcyBhIHJldmlzaW9uPwo+Pj4+Cj4+Pj4gSSdtIGp1c3QgdHJ5
aW5nIHRvIGF2b2lkIGZ1dHVyZSBwcm9ibGVtcyB3aGVyZSB3ZSBmaW5kIGl0IGlzIGFjdHVhbGx5
Cj4+Pj4gYSBkaWZmZXJlbnQgUEhZLCBuZWVkcyBpdHMgb3duIE1BVENIX0VYQUNUIGVudHJ5LCBh
bmQgdGhlbiB3ZSBmaW5kIHdlCj4+Pj4gYnJlYWsgZGV2aWNlcyB1c2luZyAweDAxODAzMzAyIHdo
aWNoIHdlIGhhZCBubyBpZGVhIGV4aXN0cywgYnV0IGdvdAo+Pj4+IGNvdmVyZWQgYnkgdGhpcyBj
aGFuZ2UuCj4+Pj4KPj4+IFRoZSBTQzIgcGxhdGZvcm0gaW5oZXJpdGVkIGEgbG90IGZyb20gRzEy
QSwgdGhlcmVmb3JlIGl0J3MgcGxhdXNpYmxlCj4+PiB0aGF0IGl0J3MgdGhlIHNhbWUgUEhZLiBB
bHNvIHRoZSB2ZW5kb3IgZHJpdmVyIGZvciBTQzIgZ2l2ZXMgYSBoaW50Cj4+PiBhcyBpdCBoYXMg
dGhlIGZvbGxvd2luZyBjb21wYXRpYmxlIGZvciB0aGUgUEhZOgo+Pj4KPj4+IGNvbXBhdGlibGUg
PSAiZXRoZXJuZXQtcGh5LWlkMDE4MC4zMzAxIiwgImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIy
IjsKPj4+Cj4+PiBCdXQgeW91J3JlIHJpZ2h0LCBJIGNhbid0IHNheSBmb3Igc3VyZSBhcyBJIGRv
bid0IGhhdmUgdGhlIGRhdGFzaGVldHMuCj4+Cj4+IE9uIEcxMkEgKCYgR1hMKSwgdGhlIFBIWSBJ
RCBpcyBzZXQgaW4gdGhlIE1ESU8gTVVYIHJlZ2lzdGVycywKPj4gcGxlYXNlIHNlZToKPj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9t
ZGlvL21kaW8tbXV4LW1lc29uLWcxMmEuYyNMMzYKPj4KPj4gU28geW91IHNob3VsZCBlaXRoZXIg
YWRkIHN1cHBvcnQgZm9yIHRoZSBQSFkgbXV4IGluIFNDMiBvciBjaGVjawo+PiB3aGF0IGlzIGlu
IHRoZSBFVEhfUEhZX0NOVEwwIHJlZ2lzdGVyLgo+Pgo+IFRoYW5rcyBmb3IgdGhlIGhpbnQuIEkg
anVzdCBjaGVja2VkIGFuZCByZWFkaW5nIGJhY2sgRVRIX1BIWV9DTlRMMCBhdCB0aGUKPiBlbmQg
b2YgZzEyYV9lbmFibGVfaW50ZXJuYWxfbWRpbygpIGdpdmVzIG1lIHRoZSBleHBlY3RlZCByZXN1
bHQgb2YgMHgzMzAxMDE4MC4KPiBCdXQgc3RpbGwgdGhlIFBIWSByZXBvcnRzIDMzMDAuCj4gRXZl
biBpZiBJIHdyaXRlIHNvbWUgb3RoZXIgcmFuZG9tIHZhbHVlIHRvIEVUSF9QSFlfQ05UTDAsIEkg
Z2V0IDAxODAvMzMwMAo+IGFzIFBIWSBJRC4KPiAKPiBGb3IgdS1ib290IEkgZm91bmQgdGhlIGZv
bGxvd2luZzoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20va2hhZGFzL3UtYm9vdC9ibG9iL2toYWRh
cy12aW00LXItNjRiaXQvZHJpdmVycy9uZXQvcGh5L2FtbG9naWMuYwo+IAo+IHN0YXRpYyBzdHJ1
Y3QgcGh5X2RyaXZlciBhbWxvZ2ljX2ludGVybmFsX2RyaXZlciA9IHsKPiAJLm5hbWUgPSAiTWVz
b24gR1hMIEludGVybmFsIFBIWSIsCj4gCS51aWQgPSAweDAxODAzMzAwLAo+IAkubWFzayA9IDB4
ZmZmZmZmZjAsCj4gCS5mZWF0dXJlcyA9IFBIWV9CQVNJQ19GRUFUVVJFUywKPiAJLmNvbmZpZyA9
ICZtZXNvbl9waHlfY29uZmlnLAo+IAkuc3RhcnR1cCA9ICZtZXNvbl9hbWxfc3RhcnR1cCwKPiAJ
LnNodXRkb3duID0gJmdlbnBoeV9zaHV0ZG93biwKPiB9Owo+IAo+IFNvIGl0J3MgdGhlIHNhbWUg
UEhZIElEIEknbSBzZWVpbmcgaW4gTGludXguCj4gCj4gTXkgYmVzdCBndWVzcyBpcyB0aGF0IHRo
ZSBmb2xsb3dpbmcgaXMgdGhlIGNhc2U6Cj4gCj4gVGhlIFBIWSBjb21wYXRpYmxlIHN0cmluZyBp
biBEVCBpcyB0aGUgZm9sbG93aW5nIGluIGFsbCBjYXNlczoKPiBjb21wYXRpYmxlID0gImV0aGVy
bmV0LXBoeS1pZDAxODAuMzMwMSIsICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7Cj4gCj4g
VGhlcmVmb3JlIGlkIDAxODAvMzMwMSBpcyB1c2VkIGV2ZW4gaWYgdGhlIFBIWSByZXBvcnRzIHNv
bWV0aGluZyBlbHNlLgo+IE1lYW5zIGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIHZhbHVlIHlvdSB3
cml0ZSB0byBFVEhfUEhZX0NOVEwwLgo+IAo+IEkgcmVkdWNlZCB0aGUgY29tcGF0aWJsZSBzdHJp
bmcgdG8gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiIKPiBhbmQgdGhp
cyByZXN1bHRlZCBpbiB0aGUgYWN0dWFsIFBIWSBJRCBiZWluZyB1c2VkLgo+IFlvdSBjb3VsZCBj
aGFuZ2UgdGhlIGNvbXBhdGlibGUgaW4gZHRzIHRoZSBzYW1lIHdheSBmb3IgYW55IGcxMmEgc3lz
dGVtCj4gYW5kIEkgYXNzdW1lIHlvdSB3b3VsZCBnZXQgMDE4MC8zMzAwIHRvby4KPiAKPiBSZW1h
aW5pbmcgcXVlc3Rpb24gaXMgd2h5IHRoZSB2YWx1ZSBpbiBFVEhfUEhZX0NOVEwwIGlzIGlnbm9y
ZWQuCj4gCgpJIHRoaW5rIEkgZm91bmQgd2hhdCdzIGdvaW5nIG9uLiBUaGUgUEhZIElEIHdyaXR0
ZW4gdG8gU29DIHJlZ2lzdGVyCkVUSF9QSFlfQ05UTDAgaXNuJ3QgZWZmZWN0aXZlIGltbWVkaWF0
ZWx5LiBJdCB0YWtlcyBhIFBIWSBzb2Z0IHJlc2V0IGJlZm9yZQppdCByZXBvcnRzIHRoZSBuZXcg
UEhZIElELiBXb3VsZCBiZSBnb29kIHRvIGhhdmUgYSBjb21tZW50IGluIHRoZQpnMTJhIG1kaW8g
bXV4IGNvZGUgbWVudGlvbmluZyB0aGlzIGNvbnN0cmFpbnQuCgpJIHNlZSBubyBlYXN5IHdheSB0
byB0cmlnZ2VyIGEgc29mdCByZXNldCBlYXJseSBlbm91Z2guIFRoZXJlZm9yZSBpdCdzIGluZGVl
ZAp0aGUgc2ltcGxlc3Qgb3B0aW9uIHRvIHNwZWNpZnkgdGhlIG5ldyBQSFkgSUQgaW4gdGhlIGNv
bXBhdGlibGUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
