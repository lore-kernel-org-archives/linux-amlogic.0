Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC4DC83F04
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s91WXQ5YpiA6uRQtLjk3ksRWgw07AdjAD3nWhwbvEA4=; b=Thu5N7WWcjnWQS
	YE9SeLl8KFmLYV8jaVQBT1Z4h83zqBN3cw4V9/rjoaHBsDCjbPpz+j5MhVn2lvDkgIB0ylBGFb6cs
	o2xWRsd6HYUHo1qyS/JgW2Du5J3Bu8pdOKdkDDFeByaddILjm0/ySzTCOxVsxcJosKvO7UsQD40CB
	pG+tDog/HuCX9NbdleSbkqEHd0o5O8yZwCyMPk7uTBokklm4ZqyxI3fpvsyHH51IggOXXPV7ZUAe6
	nm9g6EEw7dFx0FexcKfO6LRLrU0ARES17OXLHmYI2RGArHsBwdecPjLj+w3etrnYm1w0Y/l8qgpdE
	iXbNIF5tbd0SfZr6ff+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0wz-000000094OS-2Qpv;
	Wed, 02 Jul 2025 17:08:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Jb-00000008wzP-2wIE;
	Wed, 02 Jul 2025 16:28:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235f9ea8d08so65638935ad.1;
        Wed, 02 Jul 2025 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751473686; x=1752078486; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCTshSXQVcM1KFm7TGSucuLFTkQjMwCjolHqQrquCrk=;
        b=VnzsC+lPwPrQOe/mLbfJ3tvJKKc9wj+pfRv0TFSO/RZbBiFFcgYBOS9Eu+8Wz/y4lY
         aVNfFG0EOJ1bUzwl7qBOKlqH2F1nMOm8V2xMbptQJq8Y41RYcRGK0xbrEzKw0ltgUucP
         ThyFc23zqJJZR401lNqyUkJ2kj/FfL/B1GawN8N7o+kj+pDLL9BL5RvSAgHiIkwXvOaG
         wgF84awTYLPiUDER4gLpBrnnF+T56NYfcVB2YrF1OiXsULWMb41wS8DpoRTNMCOB3wae
         tk4xwqsuxNIddFCFY/o5tGn9KDwKDUrvnespFfPNofcEfooLl9F4caAFcF4iPldpxZ/6
         prpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751473686; x=1752078486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCTshSXQVcM1KFm7TGSucuLFTkQjMwCjolHqQrquCrk=;
        b=DRyGAHUgrggyUy5n1uNOrrcecQs3DZqavUlHP6X3qx4AlDae0w3CSGKlLbNSjPxeyC
         s1VyQx/h5tTxhPl7qllEE1W0r+1Vm523KT+8vTjpUtS3QeghvHkZGGc23PtKK24zVkAe
         A/jCd1Rkqg3eEmZowY41JuqhREz85WXXKopsm+/JnofkibFv7OA9yZN6FUBKuXOcrH6S
         bLE4R7TToF5Bs0C3XN396TNDP4cxUNh9sqPmXfl+ONpivRr5Pv9v29uHIld054I8lOnZ
         5aSKsGPA/vmrZ3X5MBfwkS3uzxXS2w4ZxfVYSQtjRtBOWmqvgx+so8W2W2+VWLGepxV8
         fECg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2Bt8lgBtMdFbTzCPXn+yJEf/L3+AmllHNtXUzmXPyOHyLRrkXOJtXHxEWsE87Wb+oiBYiAJxEFOtKFz3@lists.infradead.org, AJvYcCXEoQXypfds60dcwavR82BrxSggUvWthSrblAnZb02ihIzl7RBy1h9koBSAOHSJUEvyYwgLcmVHGh2rCfFc2YjmzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4nInylns6Oij2UwpN655MaP7vzVTH9i+K6uQ/Dgy+0fBGu0Of
	ZVHAn3SbNo2up7ZdiiE8TXZXcUielhM1ObOowvNJt2tO7NmO1PaQxhbyRZwKb3Plh3qWEiZPmgh
	lG+xYPzkGfSKUXFgckWXRMSDXxqKzzGE=
X-Gm-Gg: ASbGncs8QH52H4t++G6GMxctLe0zFfuE1NX6HORoc0YQSuvg7w/3z8viPHK9E2Pd/13
	4XdsfYgIPvxqMj/1P5AxcomZTpJGSOhQGgMeIYlqsFMPm5oaDAHZ85h4+dPAU44jSSegXrt8+wT
	+O7ETr0Cd+zPCof7sdkkp2P1aifADdijCXPlBzdbAijYwpo4A1aX4598jatNLjJAQykNd81LPE4
	8ec
X-Google-Smtp-Source: AGHT+IF14YYWtSQVLNWBilfTD0yTzo9aWZ97ZCPc9J9lKF7t4wOtrLhQknUMxWAgb+WT7kDpQ/opeNe9S8UxrZAnEVk=
X-Received: by 2002:a17:903:1ae3:b0:22e:421b:49b1 with SMTP id
 d9443c01a7336-23c6e5d61d7mr51904205ad.48.1751473686514; Wed, 02 Jul 2025
 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
In-Reply-To: <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 18:27:55 +0200
X-Gm-Features: Ac12FXxvG-ViHEbQFCSslz9e9T4bovXAzoVxc9U88YSGNB8BC_29uQExD1MkQUM
Message-ID: <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Anand Moon <linux.amoon@gmail.com>
Cc: Da Xue <da@libre.computer>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092807_749480_67D22D4A 
X-CRM114-Status: GOOD (  19.28  )
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

SGkgQW5hbmQsCgpPbiBUdWUsIEp1bCAxLCAyMDI1IGF0IDEyOjAw4oCvUE0gQW5hbmQgTW9vbiA8
bGludXguYW1vb25AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIERhLAo+Cj4gT24gU2F0LCAyOCBK
dW4gMjAyNSBhdCAwOToxNSwgRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4gd3JvdGU6Cj4gPgo+
ID4gUmVndWxhdG9ycyBjb250cm9sbGluZyB0aGUgU0QgY2FyZCBwb3dlciBuZWVkIHNvbWUgc2V0
dGxpbmcgdGltZSBmb3IgU0QKPiA+IGNhcmRzIHRvIGZ1bGx5IHJlc2V0IGZyb20gVUhTIG1vZGVz
LiBUaGUgcmVndWxhdG9yIGZyYW1ld29yayBzZWVtcyB0bwo+ID4gaWdub3JlIGZhbGxpbmcgdGlt
ZXMgc2V0IGluIHRoZSBkZXZpY2UgdHJlZSBjYXVzaW5nIGEgZmV3IGJvYXJkcyB3aXRoIHRoZQo+
ID4gc2FtZSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbiB0byBoYW5nIG9uIHJlYm9vdCBiZWNhdXNl
IHRoZSBTRCBjYXJkIHN0aWxsCj4gPiBoYWQgc29tZSB2b2x0YWdlIGFuZCBkaWQgbm90IHJlc2V0
IHByb3Blcmx5IHRvIGJlIGluaXRpYWxpemVkIGFnYWluLgo+ID4KPiA+IEFkZCBhIGRlbGF5IHN1
ZmZpY2llbnRseSBsb25nIGZvciB0aGUgdm9sdGFnZSB0byBkcm9wIHNvIHRoYXQgdGhlIFNEIGNh
cmQKPiA+IGNhbiByZXNldCBwcm9wZXJseS4gT3RoZXJ3aXNlIHRoZSByZWJvb3Qgd2lsbCBoYW5n
IGF0IG1pc3NpbmcgU0QgY2FyZAo+ID4gZXNwZWNpYWxseSB3aXRoIFNhbXN1bmcgY2FyZHMuCj4g
Pgo+IEFsdGhvdWdoIHRoZSBkcml2ZXIgZGVmaW5lcyByZXNldCBpZGVudGlmaWVycyBzdWNoIGFz
Cj4gUkVTRVRfU0RfRU1NQ19BLCBSRVNFVF9TRF9FTU1DX0IsIGFuZCBSRVNFVF9TRF9FTU1DX0Ms
Cj4gSXQgZG9lcyBub3QgaW1wbGVtZW50IHByb3BlciByZXNldCBjb250cm9sbGVyIGZ1bmN0aW9u
YWxpdHksCj4gc3BlY2lmaWNhbGx5IGxhY2tpbmcgc3VwcG9ydAo+IGZvciByZXNldF9jb250cm9s
X2Fzc2VydCgpIGFuZCByZXNldF9jb250cm9sX2RlYXNzZXJ0KCkgb3BlcmF0aW9ucy4KSSB0aGlu
ayB0aGVyZSdzIGEgbWlzdW5kZXJzdGFuZGluZzoKVGhlIG1lc29uLWd4LW1tYyBkcml2ZXIgY2Fs
bHMgZGV2aWNlX3Jlc2V0X29wdGlvbmFsKCkgZHVyaW5nIC5wcm9iZQp3aGljaCB3aWxsIGludGVy
bmFsbHkgY2FsbCByZXNldF9jb250cm9sX3Jlc2V0KCkuClNvIEkgZG9uJ3Qgc2VlIGEgcHJvYmxl
bSBoZXJlLgoKVGhlIHBhdGNoIHNlZW1zIG1vcmUgYWJvdXQgcG93ZXIgc2VxdWVuY2luZywgd2hl
cmUgZWl0aGVyIHRoZSBTRCBjYXJkCm9yIHJlZ3VsYXRvciB1c2VkIHRvIHBvd2VyIHRoZSBTRCBj
YXJkIHJlcXVpcmVzIGEgY2VydGFpbiBhbW91bnQgb2YKdGltZSAoZGVsYXkpIHdoZW4gc3dpdGNo
aW5nIGZyb20gT04gLT4gT0ZGIC0+IE9OIChteSB1bmRlcnN0YW5kaW5nIGlzOgp3aXRob3V0IHRo
aXMgZGVsYXkgdGhlIGNhcmQgc2VlcyBPTiAtPiBPTiB3aGljaCBmYWlscyB0byB1cGRhdGUgc29t
ZQpzdGF0ZSBpbnRlcm5hbGx5KS4KClRvIG1lIGl0J3Mgbm90IGNsZWFyIGlmIHRoaXMgaXMgYSBw
cm9wZXJ0eSBvZiB0aGUgU0Qgc3BlYyBvciByYXRoZXIKdGhlIHJlZ3VsYXRvci4KVWxmLCBKZXJv
bWUgLSBhbnkgaWRlYXMgLyBpbnB1dHMgZnJvbSB5b3U/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
