Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDBC43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jul 2022 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e+dGXweXrXpg6+zUr2tebQklOe4/eVylb+/jKIRDgQ=; b=VbtaXzE6H1ihVqbEj+3utyJKK1
	vPREXATRyxo4BTJB6uvobew6bbkmuLmu7RiAbTVdNd4Jg/5bE0jFOOJQU9E21eWJrT/WvtXqQgvNJ
	nc99C1rXn0JqrWyxOybsC/JTmA8OdKdzdtHjC/RCL8Me5fgDPJRraE6X+MhjaVtR9lME03sEWaHSj
	GqgRl/fTrbEKKyA+QshAtAVxn+HAH7BSdrDEVfvJ3wFda1vBpQWHkRDIJYi+4tywT5ju5H6QSqBO7
	khuI21spcpLJ+OCqc8GHALzyq4FyYow7GlNeBI45GHCY29fEOQrbiM7YpxxysW+jkK1MkYDU9Ex0Q
	QsRJUAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLcA-00BZjZ-PH; Mon, 18 Jul 2022 07:56:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLc5-00BZgm-EJ
	for linux-amlogic@lists.infradead.org; Mon, 18 Jul 2022 07:56:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id az2-20020a05600c600200b003a301c985fcso6572955wmb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Jul 2022 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=oKcb/OS3S9hjRLH4pWkYJiXmN7IOjQXrtgPCo34Tb0w=;
        b=3bgL7duAuoVKfqqZKTy5kINERqOvOiumApi5fLR/5ynoVBrIFHajAC30rjxneK4kVl
         FUDS/cy1MlHEMgmIWPU/0ZSf72OLCtm92BAnpLElQOZUd3t5AJzOKjNxjpsPz40P5o8W
         pAr0/vRvcvvONF80R+7eBHwIQ7VDwOh7tOyTrLzJgE8edH1/6WtZtu6J/52keBF/GGh5
         SOm9yR4m0ndDEg0f1akLHypFROrtm45h6r4y4ivbJPSMbybRuv2X5kDPU1S3R3JGlKSz
         B+Zr9yY1n0w0Anl62rwFPqR6egBrYmPHsAhEwEseM1zeUcwZf78P1TIYcmvxN882c9wA
         uw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=oKcb/OS3S9hjRLH4pWkYJiXmN7IOjQXrtgPCo34Tb0w=;
        b=mSgzUmAIHQohzfpjYcSU9Ih5aUaQuAYQHONuVpX3xPmS6saNhiqj4AzmuU1hKMdxxj
         QubP8ZOKwE/Krau+qpci8j0uwHUkK1cvV2D5jFwUyppZFbNsnOeH7hv9/uAUQ6zUDhFy
         BQP26k4s2Dygn6Tby/dVbXkNlSZT4TlcEI8rb6SJnrjQ1Kife10PEJaiby4Cqm8AKvO5
         kTF8l8qLzR9IHbxa/OFPNW9EBrhUoEDWeql+xLBIQumCFkzSxefKGbRZEb6IDy7/TAum
         evXcfRp8ooEgz/cSmGq4t5Juobo83fIpOao93NVk2kiIly58vU3M2hwNggYtotPkx8zs
         kc0Q==
X-Gm-Message-State: AJIora9TmXyNIfMBXAjNXxsfs7nIoNi34CdpMu29qI2Q+aeAMZ5Ddx8z
	KTUNAy4adEItMbRR9WtwgYUfe4qbntf1TiFE
X-Google-Smtp-Source: AGRyM1ui9srHJBLF5ZHJkidHYNRQ+ltQtueDIRFLW9AHZEJk0rimQsTPQBvXXAzk8WF5MjgrLzf8eA==
X-Received: by 2002:a05:600c:4e51:b0:3a2:e2a1:21f8 with SMTP id e17-20020a05600c4e5100b003a2e2a121f8mr24460270wmq.204.1658130978037;
        Mon, 18 Jul 2022 00:56:18 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:a2b7:375c:fabd:3626? ([2001:861:44c0:66c0:a2b7:375c:fabd:3626])
        by smtp.gmail.com with ESMTPSA id a27-20020a5d457b000000b0021dbaa4f38dsm9076047wrc.18.2022.07.18.00.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 00:56:17 -0700 (PDT)
Message-ID: <963ce12a-ade1-09c1-984d-52df1531da17@baylibre.com>
Date: Mon, 18 Jul 2022 09:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: GPIO dynamic IRQ handling for AMlogic
Content-Language: en-US
To: =?UTF-8?Q?Peter_H=c3=b6ller?= <drmedvet.hoeller@gmail.com>,
 linux-amlogic@lists.infradead.org
References: <CAJgPF1+b+=iaxE_RkAY=zG7y=PeEZ8r-2A6JSvNQbkTtHBUVAw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAJgPF1+b+=iaxE_RkAY=zG7y=PeEZ8r-2A6JSvNQbkTtHBUVAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_005621_716889_3A1758DF 
X-CRM114-Status: GOOD (  24.44  )
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

SGkgUGV0ZXIsCgpPbiAwOS8wNy8yMDIyIDIyOjE0LCBQZXRlciBIw7ZsbGVyIHdyb3RlOgo+IEhp
LAo+IAo+IHdlIGFyZSB3b3JraW5nIG9uIGFuIE9kcm9pZCBDMiByZXYyIChTOTA1IEFNbG9naWMp
IHByb2plY3QgZm9yIDMgeWVhcnMgbm93Lgo+IFdoaWxlIHVwZ3JhZGluZyB0byBLZXJuZWwgNS4x
NiB3ZSBzdHVtYmxlZCBvdmVyIHRoZSBpc3N1ZSB0aGF0IHRoZXJlCj4gd2VyZSBvbmx5IDggc3Rh
dGljIElSUSBhdmFpbGFiZSBmb3IgR1BJTywgc28geW91IGdldCByZWR1emVkIGRvd24gdG8gNAo+
IEkvTy1waW5zLCBpZiB5b3UgdXNlIHRoZW0gd2l0aCBlZGdlIGJvdGgsIHJpc2luZyBhcyB3ZWxs
IGFzIGZhbGxpbmcgLQo+IGlmIHlvdSBzZXQgdXAgdGhlIElSUXMgZm9yIEdQSU8gc3RhdGljYWxs
eS4KPiAKPiBSZWZlcnJpbmcgdG8geW91ciBwb3N0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2xpbnV4LWFtbG9naWMvMjAyMC1KdWx5LzAwNzY4NC5odG1sCj4gZnJvbSBO
ZWlsIEFybXN0cmFvbmc6Cj4gPDwKPiBUaGUgb25seSBhdmFpbGFibGUgZHJpdmVyIGZvciBHUElP
IGludGVycnVwdHMgaXMgaXJxLW1lc29uLWdwaW8gYW5kCj4gc2hvdWxkIGJlIGVub3VnaCBmb3Ig
bW9zdCBvZiB5b3VyIHVzZS1jYXNlcwo+IGlmIHlvdSBwYXNzIHRoZSBHUElPIGludGVycnVwdCBh
cyBgaW50ZXJydXB0ID0gYCBhbmQgYGludGVycnVwdC1wYXJlbnQKPiA9YCBhcyB3ZSBkbyBmb3Ig
dGhlIEV0aGVybmV0IFBIWSBvbiBzb21lCj4gYm9hcmRzLgo+IAo+Pj4KPiAKPiB3ZSBjb21wbGV0
ZWx5IHVuZGVyc3RhbmQgdGhlcmUgaXMgbm8gb3V0LW9mLXRoZS1ib3ggdXBzdHJlYW0KPiBjb21w
YXRpYmlsdHkgYmVjYXVzZSB5b3UgYXJlIGxvb3Npbmcga2VybmVsJ3MgY29tcGF0aWJpbHR5IGZv
ciBvdGhlcgo+IGJvYXJkcy4gQnV0IGFzIHdlIGFyZSB1c2luZyBvdXIga2VybmVsIG9ubHkgZm9y
IG9kcm9pZEMyIG9ubHksIHdlCj4gd29uZGVyZWQgaG93IHRvIGN1c3RvbWl6ZSBpdCBjb3JyZWN0
bHk6Cj4gCj4gU28gd2UgbmVlZCBpbmZvcm1hdGlvbiBhcyBmb29sbG93cyBwbGVhc2U6Cj4gCj4g
MS4pIFdoYXQgYXJlIHRoZSBJUlEtcmFuZ2VzIGF2YWlsYWJlIGZvciBHUElPIG9mIG9kcm9pZCBD
MiB3b3JraW5nCj4gd2l0aCBLZXJuZWwgNS4xNi4gVW5mb3J0dW5hdGVseSwgd2UgY2Fubm90IGRl
cml2ZSB0aGF0IGluZm9ybWF0aW9uCj4gZnJvbSBhbnl3aGVyZSBlbHNlLgoKWW91IGNhbiBmaW5k
IHRob3NlIG51bWJlcnMgaW4gdGhlIFM5MDUgYXQgWzFdIHBhZ2UgODYsIG51bWJlciBpcyBpbiB0
aGUgdGhlICJJbnB1dCBNdXggTG9jYXRpb24iIGNvbHVtbi4KCj4gCj4gMi4pIHdlIHdvdWxkIGJl
IHZlcnJ5IGhhcHB5IHRvIGdldCBmdXJ0aGVyIHN5bnRheCBpbmZvcm1hdGlvbiBhYm91dAo+IGhv
dyBleGFjdGx5IHRvIGltcGxlbWVudCB0aGUgbWVudGlvbmVkICAnaW50ZXJydXBzID0nIGFuZAo+
ICdpbnRlcnJ1cHQtcGFyZW50ID0nIGluIHRoZSBEZXZpY2VUcmVlIHdpdGggdGhlIGNvcnJlY3Qg
SVJRLXJhbmdlcy4KClRoZSBzeW50YXggaXMgYWxyZWFkeSBpbiB0aGUgT2Ryb2lkIEMyIERUUyBh
dCBbMl0gYW5kIGZvbGxvd3MgdGhlIHN0YW5kYXJkIGludGVycnVwdHMgRFQgc3ludGF4LgoKPiBh
bmQgMy4pIEhvdyB0byBjb3JyZWN0bHkgZGVjbGFyZS9hbm5vdW5jZSB0aGUgR1BJTy1JUlFzIGR5
bmFtaWNhbGx5IGluCj4gdGhlIERldmljZVRyZWUgKHN5bnRheCkgYW5kLCBpZiBzbywgd2hpY2gg
Y29ycmVzcG9uZGluZyBzeW50YXgtY2hhbmdlcwo+IGFyZSBuZWVkZWQgdG8gYmUgZG9uZSB3aGVy
ZSBpbiB0aGUgZHJpdmVyICdpcnEtbWVzb24tZ3BpbycgdG8gbWFrZQo+IHRoaXMgZmluYWxseSB3
b3JrLgoKVGhlIG9ubHkgd2F5IHRvIGdldCBhbiBpbnRlcnJ1cHQgZm9yIGEgR1BJTyBpbiBMaW51
eCBpcyB2aWEgdGhlIEdQSU8gdG9faXJxKCkgY2FsbGJhY2ssCmJ1dCB1bmZvcnR1bmF0ZWx5IHRo
ZSBIVyBkZXNpZ24gb2YgdGhlIEFtbG9naWMgU29DIGRvZXNuJ3QgbWFrZSBpdCBlYXN5IHRvIHRy
YW5zbGF0ZSBhbnkKR1BJTyB0byBhbiBpbnRlcnJ1cHQgYmVjYXVzZSBpdCBvbmx5IGhhcyA4IGF2
YWlsYWJsZSBHUElPIGludGVycnVwdHMgaW4gYSBzZXBhcmF0ZSBIVyBibG9jay4KCkFuIGltcGxl
bWVudGF0aW9uIGV4aXN0cyBidXQgaXQncyBub3Qgc2FmZSBlbm91Z2ggYW5kIGZlYXR1cmUtZnVs
bCB0byBiZSBhY2NlcHRlZCB1cHN0cmVhbS4KCk5laWwKCj4gCj4gd2l0aCBraW5kIHJlZ2FyZHMg
YW5kIG1hbnkgbWFueSB0aGFua3MgaW4gYWR2YW5jZQo+IAo+IFBldGVyCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKClsxXSBo
dHRwczovL2RuLm9kcm9pZC5jb20vUzkwNS9EYXRhU2hlZXQvUzkwNV9QdWJsaWNfRGF0YXNoZWV0
X1YxLjEuNC5wZGYKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL2Zm
Njk5MjczNWFkZTc1YWFlM2UzNWQxNmIxN2RhMTAwOGQ3NTNkMjgvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWd4YmItb2Ryb2lkYzIuZHRzI0wyNDYtTDI0OAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
