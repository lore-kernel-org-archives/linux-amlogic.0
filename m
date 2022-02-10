Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E98C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/IP+Djs4HkWFo55G7Yl2EVzlhq0TMvS4lPBAwHUjH8=; b=fdt82ad77FnwPr
	yi7WcgKEJi+SyjLIi5VUhJ6mz/mh8gcX/uzqcPTMkLCNpdmTNE0Pbj6APlc7j5cS0pAzIaXhzrpi7
	oUVmy/nDw97rEuT91bqUGxgl3sef5TrJucBzE8zoqJnGZrwLqtMzoxT1KIk4uQ7JQOzCBKbtdvgmz
	1aPfjZ0zBupQ9OnvicHUFIUI2LkyYJve+XnuZl2+Dm8lO7vO0LkFpXakd+flgK6DTBXancdvpwqDL
	V7ovdPOGQ5cFyudpcNjSNr1El17YTyJ7MznofO8/jjpePe+CJRjIFU6Vv/spkqSsDq+fkU6fOyRLa
	7rMETEUriciadieZJmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHyYD-002DJj-0Z; Thu, 10 Feb 2022 01:47:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHyY1-002DId-VE; Thu, 10 Feb 2022 01:47:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id r131so2556765wma.1;
 Wed, 09 Feb 2022 17:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4hS/S8hMrcbzcsd090a7H7Kvjs/YdvSJTEAtKUvaT0c=;
 b=UPYGrhCeCFm3efuGmjPifYeeiF7tS6LK1qydpI2IDkk1Uyj6ukty8Ilq89fPV6xRU3
 9B/pMZFIo6eJSe3vNfaKlgF8eyd+ddXhQ0ATCCvxbAG1wuizheGGNhDMmj9R87miJYQZ
 WhrcDBc029TwMvUu7wseFf/eDcC+sX6pHoqUM2Y+R1odRKiTtdjl6zDsc8I4KTcrjd7a
 nxM/Tdz3fDGJXvp1B5bnITLrXq5nk+fQYawpVH9SkMFvRZmAaK09WpU8klRnwQsWZmyK
 RxY65xjlwdfRo7vGPWcxVK1FambKB9+nMXBayPjmeMuaDeuMmYHt1/aB5oblhJ2f9iUi
 U0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4hS/S8hMrcbzcsd090a7H7Kvjs/YdvSJTEAtKUvaT0c=;
 b=j0DOWWHPhNFMhl2f3m+PZzNv5FctIwzRnfsql8PMtrsNSfWP3JxA9hYNYzpsnZKrRG
 vOFSngVD2yzDms/LqpSpef1uBcwM2PMHAERiqfnzye6HwouSYODKlSlGN3qaw4kUxMs/
 9/0en+ZiOG8wUEwvddjteaGNO79Ft/72Q8EFAPIpiVUPTsW+0zFzlUN7deCACHZTRURC
 HOKKEXEV+w/PYEO4+PqHAtoTK7u8WUh08OrDjMS9fVyO4Wviz50yMM3/Q+Kawu/h+S2F
 35W1eYPeK37VyfQrPq4/ntI57t13ezB64sHXeOxgbXYmxTKuCFGMRr8/moYuNEAJSVei
 gFxA==
X-Gm-Message-State: AOAM533jCvMbleXKeSBqAypLvqpDmTuKj3Mv2ZD8UmP14LMjtHmtaxp4
 ik8a0tM59QjywTE1Q4Fwe/M=
X-Google-Smtp-Source: ABdhPJzmXI7yunJKDvBF1JSvA/wajCekPuYA4bzw3VQ+iAPTNblKmHmXMqrQ0D+M47cMkcmdfDPqkg==
X-Received: by 2002:a05:600c:4f85:: with SMTP id
 n5mr160081wmq.64.1644457616199; 
 Wed, 09 Feb 2022 17:46:56 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id m5sm84571wms.4.2022.02.09.17.46.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Feb 2022 17:46:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7h7da3o6cg.fsf@baylibre.com>
Date: Thu, 10 Feb 2022 05:46:52 +0400
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <C70293C2-8CE8-42CE-911A-E0CC3DFB82FC@gmail.com>
References: <20220209135535.29547-1-christianshewitt@gmail.com>
 <7h7da3o6cg.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_174702_064057_02BB1CE6 
X-CRM114-Status: GOOD (  13.52  )
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

Cj4gT24gMTAgRmViIDIwMjIsIGF0IDU6MzEgYW0sIEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+IHdyb3RlOgo+IAo+IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPiB3cml0ZXM6Cj4gCj4+IEFtbG9naWMgRzEyQiBhbmQgU00xIGRldmljZXMgZXhw
ZXJpZW5jZSBDUFUgc3RhbGxzIGFuZCByYW5kb20gYm9hcmQKPj4gd2VkZ2VzIHdoZW4gdGhlIHN5
c3RlbSBpZGxlcyBhbmQgQ1BVIGNvcmVzIGNsb2NrIGRvd24gdG8gbG93ZXIgb3BwCj4+IHBvaW50
cy4gUmVjZW50IHZlbmRvciBrZXJuZWxzIGluY2x1ZGUgYSBjaGFuZ2UgdG8gcmVtb3ZlIDEwMC0y
NTBNSHoKPj4gKHdpdGggbm8gZXhwbGFuYXRpb24pIFswXSBidXQgb3RoZXIgZG93bnN0cmVhbSBz
b3VyY2VzIGFsc28gcmVtb3ZlCj4+IHRoZSA1MDAvNjY3TUh6IHBvaW50cyAoYWxzbyB3aXRoIG5v
IGV4cGxhbmF0aW9uKS4gVW5sZXNzIDEwMC02NjdNaHoKPj4gb3BwcyBhcmUgcmVtb3ZlZCBvciB0
aGUgQ1BVIGdvdmVybm9yIGZvcmNlZCB0byBwZXJmb3JtYW5jZSwgc3RhbGxzCj4+IGFyZSBvYnNl
cnZlZCwgc28gbGV0J3MgcmVtb3ZlIHRoZW0gYW4gaW1wcm92ZSBzdGFiaWxpdHkvdXB0aW1lLgo+
IAo+IEp1c3QgY3VyaW91czogd2hhdCBDUFVmcmVxIGdvdmVybm9yIGRvIHlvdSB1c2UgYnkgZGVm
YXVsdCBmb3IgdGhlCj4gTGlicmVFTEVDIGtlcm5lbD8KCkxFIHVzZXMgb25kZW1hbmQuIE9uZSBv
ZiB0aGUgb3JpZ2luYWwgY2x1ZXMgb24gdGhlIHByb2JsZW0gdXMgdGhhdCB0aGUKaXNzdWUgaXNu
4oCZdCBzZWVuIGluIHNvbWUgb2YgdGhlIHJldHJvLWdhbWluZyBmb3JrcyBvbiBMRSdzIGNvZGVi
YXNlCndoaWNoIHVzZSB0aGUgcGVyZm9ybWFuY2UgZ292ZXJub3IgKGFuZCBvdmVyY2xvY2tzLCBl
dGMuKQoKPiBZb3VyIHBhdGNoIGdyZWF0bHkgaW1wcm92ZXMgdGhlIHN0YWJpbGl0eSBJJ20gc2Vl
aW5nLCBidXQgZG9lc24ndCBxdWl0ZQo+IGVsaW1pdGF0ZSBpdC4KPiAKPiBJJ20gdGVzdGluZyBz
dXNwZW5kL3Jlc3VtZSBpbiBhIGxvb3Agb24gVklNMywgYW5kIHdpdGggc2NoZWR1dGlsCj4gKGRl
ZmF1bHQpIG9yIG9uZGVtYW5kLCBpdCBldmVudHVhbGx5IGhhbmdzLiAgV2l0aCBlaXRoZXIgcG93
ZXJzYXZlIG9yCj4gcGVyZm9ybWFuY2UgaXQncyBzdGFibGUuICAKPiAKPiBLZXZpbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
