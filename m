Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A5EC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 05:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh8KmiVSc81+pFgLyLD+I1Mw+lR67R7R8hCFMbKhSuQ=; b=24XVSirlVc9qaR
	dh6MCGO5t659Or9eTUszQ9CMdzlcG97ec1ikDO8wpLGebDYQyTI0PDyJE9G+qJe5QPEsdLG8C8Z4w
	4GfVUb+Lz6yUySPX2jzXsBVucqBws4aiRTI42E+ikI0g3HgNz5DWFmaR7o/3Q7QoF68Fl0XoHg8bI
	2Y/PSadCc6bWgT9UjD4TNzT4JbkeiPmOT78diQovELYrVuPaUwUnuG9OW707BoSXQaGyZFMS6xVnG
	Ur1i2fMgnoW3h4NbloSGQWiek0toCOysUbqOddaEijr4N68zUb5nC4GN1T0QJ7CuUIlEciDk/xH53
	j/CL3021iB4jaccS2ZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRpE8-007O3Q-2K; Wed, 09 Mar 2022 05:51:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRpE6-007O33-8K; Wed, 09 Mar 2022 05:51:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id h15so1302316wrc.6;
 Tue, 08 Mar 2022 21:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ntVZeP/ZOGlR7r3GVyF2LVHOL98e/gbBmFj21WaZDPc=;
 b=WlskuyIs6bV5vuXlPbuY80WlUqpgtBB2BT3OaDs/kZraZOZvE7Kl/R/SXQjklTa2v9
 5Fkchu28aR260Qu7HO36sdD0IeroD9IcZmGS7cG9L8Zz1WttNQDL07Ut1SmbxUEKS0cC
 Fezi1i3D67Frb59Niz4ti5UoasmYo5k85DV36zJHJ7d2ItpFmWb4mnsAHb4+lnR6QNR0
 hdF9KPY4fd6DQZaZbXFH96wmbrCE1bJASBwrjKHqgO+1Q5O8bPZWfmz88/VGKDYu27Eb
 /Liv5ySAYDRBDKlKhk2Z2gibxJq0Wu0SOYXnml9y6vwsWZIhYHTHTzh0XD+C9zIdG+CH
 EZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ntVZeP/ZOGlR7r3GVyF2LVHOL98e/gbBmFj21WaZDPc=;
 b=Gr7m+m8PSUpNAzPfkBUrwDmCXkPBsBnNoevYzECQYPj2ERVUe6KJqaB/LZHxqHHxUN
 qOon2TS7cZ1umm1G0MmTc9+u4rFu7N+WUXXVCWt0M3QLqon6XAKp3VW5nRzpvVYnDrO+
 VQ0e1uKvAbPJ3ArwmLWgskF6Y14vlk2ChSOU002Nyt2eVISdsW/7s/IRgD/ERnTX6LOj
 j3JQM3B21zlFlFC56jHEmNM4or+R490WzQPbUhUxPOOjqTvkb2/5B6yRCswyr25h5GUr
 E/8U9/n0GctPGbk/wSkvrkq2OUKpNU/G8gz2kYme5FpCavK67I6h5/SBsVwFG1elI6Iy
 9YdA==
X-Gm-Message-State: AOAM5321pvZOAkqJ65AFjdC8uutcmG9WXrk/UURbxwGM9mJZRu2DApiH
 lEEy7vTR470alGqvjyJbeLo=
X-Google-Smtp-Source: ABdhPJxfA7kjG6ko00xScXemifNTbPyySjwSihda6fkhtp5/pF0n/+SWPrWIR4WyAnQJnu0+gCmg0A==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr13998452wri.401.1646805067003; 
 Tue, 08 Mar 2022 21:51:07 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003899263bab1sm680112wmi.20.2022.03.08.21.51.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Mar 2022 21:51:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: Missing mali regulator in Amlogic dts
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7eec71da-e4b4-eac3-a29c-4244c28f2875@arm.com>
Date: Wed, 9 Mar 2022 09:51:03 +0400
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-Id: <907B2B12-F33F-4DF5-8CAA-41CB7766FC78@gmail.com>
References: <13ecb1a6-6ae6-2815-7ff8-58f661c14b2d@gmail.com>
 <CAFBinCB700+g_fDmC5dXbNONLyESghp+RmZ+1myvhPbseXpY4A@mail.gmail.com>
 <7eec71da-e4b4-eac3-a29c-4244c28f2875@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_215110_346451_A5BC4E00 
X-CRM114-Status: GOOD (  16.11  )
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

Cj4gT24gOSBNYXIgMjAyMiwgYXQgMTI6MzQgYW0sIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5
QGFybS5jb20+IHdyb3RlOgo+IAo+IE9uIDIwMjItMDMtMDggMTk6MjksIE1hcnRpbiBCbHVtZW5z
dGluZ2wgd3JvdGU6Cj4+IEhpIEhlaW5lciwKPj4gT24gVHVlLCBNYXIgOCwgMjAyMiBhdCA3OjI0
IFBNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gCj4+
PiBJIGdldCBmb2xsb3dpbmcgZXJyb3Igb24gYSAgUzkwNVctYmFzZWQgc3lzdGVtLgo+Pj4gbGlt
YSBkMDBjMDAwMC5ncHU6IGRldl9wbV9vcHBfc2V0X3JlZ3VsYXRvcnM6IG5vIHJlZ3VsYXRvciAo
bWFsaSkgZm91bmQ6IC0xOQo+PiBUaGlzIHdhcm5pbmcgaXMgaGFybWxlc3MgKHNlZSBiZWxvdykK
Pj4+IEkgc2VlIG1hbGktc3VwcGx5IGluIHRoZSBEVFMgb2YgZmV3IG90aGVyIHZlbmRvcnMsIGJ1
dCBpbiBubyBBbWxvZ2ljIERUUy4KPj4+IElzIGl0IG1pc3NpbmcsIG9yIGFyZSBBbWxvZ2ljIFNv
Q3MgZGlmZmVyZW50IGhlcmU/Cj4+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIG9uIEdYQkIgYW5k
IEdYTCBTb0NzIHRoZSBWRERFRSByZWd1bGF0b3IgaXMKPj4gbWFuYWdlZCBieSB0aGUgZmlybXdh
cmUgKHdoaWNoIGlzIHVuZm9ydHVuYXRlbHkgY2xvc2VkLXNvdXJjZSkuCj4+IElJUkMgb24gdGhl
IGhhcmR3YXJlIHNpZGUgVkRERUUgaXMganVzdCBhbm90aGVyIFBXTSByZWd1bGF0b3IsIGp1c3QK
Pj4gbGlrZSB3aXRoIHRoZSAzMi1iaXQgU29DcyBvciB3aXRoIEcxMkEgKGFuZCBsYXRlcikgU29D
cy4KPj4+IEluIHRoZSBsYXR0ZXIgY2FzZSBzdXBwb3NlZGx5IGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZGV2ZnJlcS5jIHdvdWxkCj4+PiBoYXZlIHRvIGJlIGNoYW5nZWQgdG8gY2hlY2sgZm9y
IHRoZSBvcHRpb25hbCByZWd1bGF0b3IgYW5kIG5vdCBjYWxsCj4+PiBkZXZtX3BtX29wcF9zZXRf
cmVndWxhdG9ycygpIGlmIGl0J3MgbWlzc2luZy4KPj4gSSB0aGluayBJIGp1c3QgY29waWVkIHRo
ZSBsb2dpYyBmcm9tIHBhbmZyb3N0Cj4+IChkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jKSB0byBsaW1hLgo+PiBTbyBHWE0gYm9hcmRzICh1c2luZyBwYW5mcm9zdCkg
d2lsbCBwcm9iYWJseSByZXBvcnQgYSBzaW1pbGFyIHdhcm5pbmcuCj4+IFRoYXQgc2FpZCwgSSBk
b24ndCBrbm93IGVub3VnaCB0byBqdWRnZSB3aGV0aGVyIHlvdXIgYXBwcm9hY2ggbWFrZXMgc2Vu
c2UuCj4gCj4gQXMgYSBxdWFsaXR5LW9mLWxpZmUgdGhpbmcsIGl0IG1pZ2h0IG1ha2UgdGhlIG1v
c3Qgc2Vuc2UgdG8gcmVmYWN0b3IgdGhlIEFQSSBhIGJpdCBzbyB0aGF0IGl0IGNhbiBvZmZlciBh
IGRlZGljYXRlZCBoZWxwZXIgZm9yIHNldHRpbmcgb3B0aW9uYWwgcmVndWxhdG9ycyAtIHBvc3Np
Ymx5IHNwZWNpZmljYWxseSBhIHNpbmdsZSBvcHRpb25hbCByZWd1bGF0b3IsIHNpbmNlIGl0J3Mg
bm90IG5lY2Vzc2FyaWx5IGNsZWFyIGhvdyBvcHRpb25hbGl0eSBzaG91bGQgc2NhbGUgdG8gYSBz
ZXQgb2YgbXVsdGlwbGUgaXRlbXMuCgpJIHNlZSBvY2Nhc2lvbmFsIChub3QgZnJlcXVlbnQsIGJ1
dCBwZXJzaXN0ZW50KSDigJxlcnJvcuKAnSByZXBvcnRzIGZyb20gdXNlcnMgd2l0aCBzb21lIGtp
bmQgb2YgZGlzcGxheSByZWxhdGVkIHByb2JsZW0sIGFuZCB0aGV5IGxvb2sgdGhyb3VnaCB0aGUg
Ym9vdCBsb2cgYW5kIHNlZSB0aGlzIGFuZCBwb2ludCBmaW5nZXJzLiBJdOKAmXMgaGFybWxlc3Ms
IGJ1dCBub3Qgc2hvd2luZyB0aGlzIG9uIEFtbG9naWMgZGV2aWNlcyAoYWxsIG9mIHRoZW0gc2hv
dyB0aGlzIHZpYSBsaW1hIG9yIHBhbmZyb3N0KSB3b3VsZCBiZSBhbm90aGVyIG1pY3JvLXN0ZXAg
dG93YXJkcyBsZXNzIGRpc3RybyBzdXBwb3J0IGVmZm9ydC4KCkNocmlzdGlhbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
