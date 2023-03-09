Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B2EC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxBuQAiUnk0BARO4EYCRyqthW5MpAAnkBPhY10HJYB4=; b=jr1bZo00JaERo7
	BIqqJKBILGGxpT4wMywPTJO2d0PNDd5CvhIjWk2GYZ7GgNezkuuXZBxA8dnPwteq7h7W2Xmk6E94u
	3mC2gyNUE28FmdVzJOuSjtksFUMwQd99Eo/X+bSdc9WfN8ApioEDZ6+VSpu8Z6ECJjyPSruwqpSE2
	huNhY+5CM42TnlZxgDTwqvy3fGaDHLlDdFjYrN3a7Pnyj/yqB9Jig3G9/pqYh/NadTmpHoAqwMHyT
	HhtI9+dZWXbPTx+Ec1oQ/+3S0AhAAe8nSuCO/SvVeF4ZO8i0nbnmNnfDkBhWOgsdtCmXKQettx0vu
	5iZ+j5vizl6lbfrlFstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNwf-00C1TO-Ja; Thu, 09 Mar 2023 21:37:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNwb-00C1P2-Ge; Thu, 09 Mar 2023 21:37:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id s11so12654696edy.8;
        Thu, 09 Mar 2023 13:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678397816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO/At0hTp6xBUjdPDu09VPxsm+2HhEwia18RIvOTuEI=;
        b=Psz3BEtx2j3YQwT2FEmtlFxJFM77O2U2uXDTLB/TCG1w//Q8ZBhOHDz2Mid4Rp78DL
         XpXtM6JpdNuN9xdI7dpKu3wBwo3/QOZ8t5Xdxmp55i+UB84ehxly39T4HCmphLv2+dxk
         X2EOYCYOQmKeOM3rdKfQitJcdZoYonwB4SFeEvAMnSLLA8nHEqoSx4H+UHsvQZjtZg8P
         qBWbJcGyr6LVrFgqJYJnvArpGqevmqgOpYLwdLzMQs+80C6Dpkf4mMUQI4/+Ly0iVL1Q
         n2gT5dRuGk498y3hSkDmesSJFMVy2+wprzB5ttVEJKXz4VkNR1UuOhood/0/2WYa7DVP
         +lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO/At0hTp6xBUjdPDu09VPxsm+2HhEwia18RIvOTuEI=;
        b=MJGShYMgPs14rhDiQ2SrYXv2YtkOwSyG7J3o45nDJtNVQEdRSMldM42j76DTXhF5e4
         +Kdqfz1sHPNpZJgFTQLkRi+BIdkTsPWgy6xE6c1cBBQZS2DH7xZYDms3DolephNHiD9V
         VQ8ejip19kH2eEJEi+lmfclZXcAZ4Cl0zzb/W32vaEytmTAhAWyojR3u0XqLc2lCHGbl
         J4h+ecd6fuStPkUHqRla+aZS7BK8ecNF8zwLBWIk9C+pAcJ2kT5mQv/3WaALbxN795xI
         ahgiXTw9Z9SpXP5oj+nx8xc55XC7JwjBwnDH9YAIQh0aaZkWQLdCOg8WDSqahbq/W135
         XedA==
X-Gm-Message-State: AO0yUKWK9pkQ5BTIqEt1W/fx934rZ3bvDFybcFvfA2ZNRWiSeP9vI9Qx
	FJCkwghfwVBadQm66XGiY7aSkTF8hqWRHd/BDec=
X-Google-Smtp-Source: AK7set+BWHQgdgflLZb73E8MJGlYbgN11thQFq8NfTHSXi+Kyu0wWdgZP7wzlGdhhDcM/IWlR8dFJ0vhIIej8GQkcsc=
X-Received: by 2002:a50:d581:0:b0:4bf:7914:98c5 with SMTP id
 v1-20020a50d581000000b004bf791498c5mr12993149edi.4.1678397816125; Thu, 09 Mar
 2023 13:36:56 -0800 (PST)
MIME-Version: 1.0
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr> <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr> <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
In-Reply-To: <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Mar 2023 22:36:45 +0100
Message-ID: <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
Subject: Re: Conflict between video-lut and pmu on meson-g12
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>, AML <linux-amlogic@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Chris Healy <healych@amazon.com>, Will Deacon <will@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pierre-Hugues Husson <phh@phh.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133701_595348_DA0E950C 
X-CRM114-Status: GOOD (  17.09  )
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

SGkgTWFyYywKCk9uIFRodSwgTWFyIDksIDIwMjMgYXQgMTA6NDjigK9BTSBNYXJjIEdvbnphbGV6
IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4gd3JvdGU6ClsuLi5dCj4gQW55IGlkZWFzL3N1Z2dl
c3Rpb25zPwo+IEhvdyBkbyB3ZSBwcm9jZWVkPwpJIHN1Z2dlc3QgeW91IGdvIGFoZWFkIGFuZCBz
ZW5kIHlvdXIgb3JpZ2luYWwgZGlmZiBhcyBmb3JtYWwgcGF0Y2hlcy4KSXQgd291bGQgYmUgYmVz
dCB0byBoYXZlIHR3by90aHJlZSBwYXRjaGVzICh0aGF0IGNhbiBnbyB0aHJvdWdoCmRpZmZlcmVu
dCBtYWludGFpbmVycyByZXBvc2l0b3JpZXMgaWYgbmVlZGVkKToKLSBtb3ZlICZwbXUgaW50byAm
ZG1jLCB1cGRhdGUgdGhlIHJlZ2lzdGVyIHNpemUgKGFzIHlvdSBzdWdnZXN0ZWQpIGFuZAphbHNv
IHVwZGF0ZSB0aGUgb2Zmc2V0IChzaW5jZSB0aGV5IHdpbGwgaGF2ZSB0byBiZSBjYWxjdWxhdGVk
IGJhc2VkIG9uCiZkbWMpCi0gZml4IHVwIHRoZSAjZGVmaW5lcyBpbiB0aGUgZHJpdmVyIGFzIHlv
dSBzdWdnZXN0ZWQKLSBuaWNlIHRvIGhhdmU6IHVwZGF0ZSB0aGUgZXhhbXBsZSBpbgpEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWxvZ2ljLGcxMi1kZHItcG11LnlhbWwK
CkJlZm9yZSB3ZSB3b3JrIG9uIHRoZSBYVEFMIGNsb2NrIGlucHV0IEkgdGhpbmsgaXQncyBiZXN0
IGlmIHdlIGtub3cKYWJvdXQgdGhlIGFjdHVhbCBoYXJkd2FyZSBzZXR1cC4KYW1sb2dpYyxnMTIt
ZGRyLXBtdS55YW1sIG1lbnRpb25zIHRoYXQgdGhlIHNlY29uZCByZWdpc3RlciBzZXQgaXMgZm9y
CnRoZSAiRE1DIFBMTCByZWdpc3RlciBzcGFjZSIuCkkgc3VzcGVjdCB0aGF0IHRoZSBETUMgUExM
IGhhcyB0d28gcHVycG9zZXM6Ci0gaXQncyB1c2VkIGFzIHRpbWVyL2NvdW50ZXIgZm9yIHRoZSBQ
TVUKLSBpdCBpcyBhbHNvIHVzZWQgZm9yIGNsb2NraW5nIHRoZSBERFIgbWVtb3J5CgpJZiB0aGlz
IGFzc3VtcHRpb24gaXMgY29ycmVjdCB0aGVuIEkgdGhpbmsgdGhhdCB0aGUgRE1DIFBMTCBzaG91
bGQgZ2V0CmEgc2VwYXJhdGUgbm9kZSAod2l0aCBYVEFMIGFzIGNsb2NrIGlucHV0KS4gVGhlbiB0
aGUgRE1DIFBMTCBvdXRwdXQKc2hvdWxkIGJlIHVzZWQgYXMgY2xvY2sgaW5wdXQgZm9yIHRoZSAm
cG11IG5vZGUuClRoZSByZWFzb24gZm9yIHRoaXMgaXMgdGhhdCB0aGUgZGV2aWNlIHRyZWUgc2hv
dWxkIGRlc2NyaWJlIHRoZQpoYXJkd2FyZSwgbm90IGRyaXZlcnMuIEFsc28gZGV2aWNlIHRyZWUg
aXMgbm90IExpbnV4IHNwZWNpZmljLCBpdCBjYW4KYmUgdXNlZCBieSB1LWJvb3QsIGV0Yy4KU28g
aWYgc29tZW9uZSB3b3VsZCBpbXBsZW1lbnQgdGhlIEREUiBzZXR1cCBpbiB1LWJvb3QgKG9yIGFu
b3RoZXIKYm9vdGxvYWRlciAtIHdoaWNoIG1heSBldmVuIHNoYXJlIHRoZSBkZXZpY2UgdHJlZSB3
aXRoIExpbnV4KSB0aGVuIGl0CmhhcyB0byBiZSBkZXNjcmliZWQgY29ycmVjdGx5LgpJJ20gaG9w
aW5nIHRoYXQgSml1Y2hlbmcgY2FuIHByb3ZpZGUgaGlzIGlucHV0IG9uIHRoaXMgdG9waWMuCgpC
eSB0aGUgd2F5OiB3ZSBhbHJlYWR5IGhhdmUgYSBERFIgKFBMTCkgZHJpdmVyIGluCmRyaXZlcnMv
Y2xrL21lc29uL21lc29uOC1kZHIuYy4gQXQgdGhpcyBwb2ludCBpbiB0aW1lIGl0IG9ubHkgaGFz
Ck1lc29uOC9NZXNvbjhiL01lc29uOG0yIHN1cHBvcnQuIEkgc3VzcGVjdCBpdCB3aWxsIGJlIGVh
c3kgdG8gZXh0ZW5kCnRoZSBleGlzdGluZyBkcml2ZXIgb3IganVzdCB3cml0ZSBhIG5ldyBvbmUu
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
