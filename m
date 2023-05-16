Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21643C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/0cbGTnr5OtKBC86nWP47nF9hU4SoK/yEa3XdPxZTM=; b=Tc3KfSPOHZpF76
	G/nytGALrhNs51oNvU6UDA1T4kWiEZaMDkLYxdzwLV3PS3EHzOa9yK36fBlODDs3QYk9CDFDe+crF
	+dfwFiSwf//PpZFeu8dQInR6AEK31i/vWhPjELDsExXpBtinJVMn/jO5MyyjeoYPOIyMmHwNn480M
	ecTUe3P0lwgUTmG7Oe3kCErHFCwz39BcWw0W7qM0/zPHv7zjp5DqgTaaCutCci8kBs6v+ZRFukUH5
	SZcV4gKMyY1M1f6kyfUL9/4HvziKPJawVda0Pl2ucBQ7W9knDgUPA0t66nl9X7QEIkDgM42xtLbx9
	8qKVmO1p4D/by1zynldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1Y2-0075YR-1W;
	Tue, 16 May 2023 20:45:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz1Xz-0075Xb-0j
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 20:45:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso3416547a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684269925; x=1686861925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLuNzxgt4u7wYy4U8lUYhqOALXydn6b7WXFOJngr8yI=;
        b=Fw0fmDSHT4fboK1etWSMbJ4UTjJufy/4YmlEKwzF4KXiTLKoDDD1sUV8moO8Cidf+J
         3hgQ6YLL2zzGT8wgogtBkOXovi2ZmQCxd2NunOH5l33fmCzerzZpu6rWjLn04ZXhlJzr
         zEGmF+uLUM2mPW2irMxxLrqNaXXXlVnB6qjcEAU9X6fIyM+BvJ7ZSyI6/xbxn15puhSa
         GHX/433UnJrrSkmUT+2byGV35OmFZkQtkkqRDwfaYddgikeRVNU/T8TKBCfDw1ONEGJu
         D/ElAGFUIEFIti1z1tg8VrwE2jdTvSPiTqc/VP0u4Y+8615jytYhYjeNfohFKDdk5+ST
         aGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684269925; x=1686861925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLuNzxgt4u7wYy4U8lUYhqOALXydn6b7WXFOJngr8yI=;
        b=R0d+DxrfAy8MGo7Az6Kj5/B6hYd0jWqXNlqeh2xhcdHpd9QSBcNyA44WVMWEDSdtRE
         gyLuUxYVeylXKBZGi+FiXlGvz0ykGKs59BLeahjxGuECMFzvGqaBAwKf5t+kxSi5lhHa
         rwn0vVggkPWdoNHqrfvJuBXf7nRwOr7EHowM+axfRLNpc7mjOWGdp3RYzs7co/rFHbK4
         0G9N+QH2hjEDqo/gmfFRBVsThOsaNzUQ+mFlMtwJJrFLZZ2CkIVgfQGagheCUhrBQ0UA
         FT1LofOhoRhWo255wcU/64SS8uR8qztmCSqCec1hnwOAmb738TUDsNvL29yDVZ7rmXIL
         gxaw==
X-Gm-Message-State: AC+VfDwYl5pmhXevPM/+LwrGL8jySm9f/hf3DPv0COd8PPSo5rx2Eay8
	aJFLs5/wbEsW//PaDIvoWivUfB4C5xgUqdNh1t4=
X-Google-Smtp-Source: ACHHUZ5A/qcEmUqmdhQJ4a20RyacFe7ibnyzP+AGiKCcqftnAp0QRaurLuLtBclnLo2zrB5DXnCGcGNeDjHFbciY2pk=
X-Received: by 2002:a17:907:d21:b0:94a:57d1:5539 with SMTP id
 gn33-20020a1709070d2100b0094a57d15539mr75336ejc.5.1684269924790; Tue, 16 May
 2023 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com> <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
In-Reply-To: <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 16 May 2023 22:45:13 +0200
Message-ID: <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_134527_289711_C5B72C5F 
X-CRM114-Status: GOOD (  18.13  )
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

T24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgMTE6NDTigK9BTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNz
b25AbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCj4gPiA+IDMpIElmIDIpIHNlZW1zIHRvIHdvcmsg
YWJvdmUsIHdlIG5lZWQgdG8gZmlndXJlIG91dCB3aHkKPiA+ID4gbW1jX3N3aXRjaF9zdGF0dXMo
KSBpcyBoYW5naW5nLiBJZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgZU1NQwo+ID4gPiBj
YXJkIHJlc3BvbmRpbmcgaW4tY29ycmVjdGx5LCB0aGUgaG9zdCBkcml2ZXIgc2hvdWxkIHJldHVy
biB3aXRoIGFuCj4gPiA+IGVycm9yIGNvZGUsIHJpZ2h0Pwo+ID4gWW91J3JlIHJpZ2h0OiBpdCdz
IGluZGVlZCBoYW5naW5nIGluIG1tY19zd2l0Y2hfc3RhdHVzKCkKPiA+IEkgZG9uJ3QgZ2V0IGFu
eSBpbnRlcnJ1cHRzICh0aW1lb3V0LCBDUkMgZXJyb3IsIC4uLikgZm9yIGl0Lgo+ID4gRG8geW91
IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHdoYXQgdG8gY2hlY2sgbmV4dD8KPgo+IFNvIHRoZSBtbWNf
c3dpdGNoX3N0YXR1cygpIGlzIHNlbmRpbmcgYSBDTUQxMy4gRXZlbiBpZiB0aGUgY2FyZAo+IGRv
ZXNuJ3QgcmVwbHksIEkgd291bGQgZXhwZWN0IHRoYXQgdGhlIG1lc29uIG1tYyBjb250cm9sbGVy
IHdvdWxkCj4gcmFpc2Ugc29tZSBraW5kIG9mIGVycm9yIGNvbmRpdGlvbiwgcHJvYmFibHkgdmlh
IGEgdGltZW91dC1pcnEuCj4KPiBEaWQgeW91IHZlcmlmeSB0aGF0IHRoZSBkcml2ZXIgaXMgYWN0
dWFsbHkgd2FpdGluZyBmb3IgYW4gSVJRIHRvCj4gaGFwcGVuLCB3aGljaCBhbHNvIG1lYW5zIHdh
aXRpbmcgZm9yIGEgQ01EMTMgcmVzcG9uc2U/CnJlZ2lzdGVyIDB4MjQgaXMgSUNUTCAoaW50ZXJy
dXB0IGNvbnRyb2wpIGFuZCAweDI4IGlzIElTVEFUIChpbnRlcnJ1cHQgc3RhdHVzKQpJU1RBVCBp
cyBhbGwgemVyb3MgYW5kIElDVEwgaXMgMHgzMDY3IHdoaWNoIHRyYW5zbGF0ZXMgc286Ci0gQklU
KDApOiBSRVNQX09LCi0gQklUKDEpOiBSRVNQX1RJTUVPVVQKLSBCSVQoMik6IFJFU1BfRVJSX0NS
QwotIEJJVCg1KTogREFUQV9USU1FT1VUCi0gQklUKDYpOiBEQVRBX0VSUl9DUkMKLSBCSVQoMTIp
OiBSWEZJRk9fRlVMTAotIEJJVCgxMyk6IFRYRklGT19FTVBUWQoKSSBndWVzcyBpbiB0aGlzIGNh
c2UgQklUKDEpIFJFU1BfVElNRU9VVCBpcyB0aGUgcmVsZXZhbnQgb25lLgoKcmVnaXN0ZXIgMHgw
NCBpcyBTRU5EIGFuZCByZWFkcyAweDRkIHdoaWNoIHRyYW5zbGF0ZXMgdG86Ci0gQ01EMTMKLSBN
TUNfUlNQX1BSRVNFTlQgKEhBU19SRVNQLCBCSVQoNikpCi0gbm8gb3RoZXIgZmxhZ3MgKFNUT1As
IFIxQiwgLi4uKSBhcmUgc2V0CgpGdWxsIHJlZ2lzdGVyIGR1bXA6CiMgY2F0IC9zeXMva2VybmVs
L2RlYnVnL3JlZ21hcC9jMTEwOGUwMC5tbWMvcmVnaXN0ZXJzCjAwOiAwMDAwMDkwMAowNDogMDAw
MDAwNGQKMDg6IGU3ZmZlMDAyCjBjOiAwMmYwMDAzZgoxMDogMDAwM2YwMDkKMTQ6IDAzYjgxYzAw
CjE4OiAyYzQzYmNmMAoxYzogZTAwMDAxNTAKMjA6IDAwMDAwMDAwCjI0OiAwMDAwMzA2NwoyODog
MDAwMDAwMDAKMmM6IDAwMDAwMDAwCjMwOiAwMDAwMDAwMAozNDogMDBmZTBjZmYKMzg6IDAwMDAx
MDBiCgpJbiBjYXNlIHlvdSBhcmUgY3VyaW91cywgdGhlIGRyaXZlciBpczogZHJpdmVycy9tbWMv
aG9zdC9tZXNvbi1teC1zZGhjLW1tYy5jCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
