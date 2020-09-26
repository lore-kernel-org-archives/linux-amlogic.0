Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6231EC2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 11:55:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67F72075A
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 11:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GS4rXU1v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx/M0MAL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67F72075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ASbabkw+THIIVUmptMkzaO4WtHFi3wuFxNrOsSK5Tno=; b=GS4rXU1vKVwv0RNQxedynV5OA
	kGtk+96+NYq2g/BszlTzL10r2HL54opZ0izYZqzfQtkSZhSqXfXxZ+AmkcpC69diMlCJF3fI0RqIr
	CIBo0GC6wET9qTNc5JyxHBaCarov4trYcOT98k2AoPz95IqbzKdZDYbkF0X6paixdPK39szcT/Q6a
	5shajuZFI8HS65Cwbyv8j4kZSLlw8dIEVxs0/u50k02XsgjX8pvLRxsIHXh28p59WRgsnHLgBk+sW
	WVqfZwUG+5aOJZTas4OLhsHCatMKbIS5mt+uLll05xD1UCzvr1A9A5ubPwzc5d7CUkodA5Vn+Ghgo
	ZQcbmsFww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM8nV-0005Sq-9J; Sat, 26 Sep 2020 11:55:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM8nT-0005SW-Fw
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 11:55:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so6805232wrn.0
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 04:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lHpDGO3eipCJBv/JBXAcsVMlGwZEUUhI8iuzgMFtJmM=;
 b=Wx/M0MAL/yQ+YpBbNrG0u5Kp+tUngk6GDqMhOn8Fj1vTTpFl3vdmWvBK7iUK0yle3d
 yz1Sea7ZDeFH4VeYCP/HABkNfDDgB1j6L+7JanT/IDuMTty92vWPf7/EleMr22lBYP7i
 z+3JDbySwyexLBGTRsQPhPuqYAq5PhYQ1G92kovhmnhePz2Y59ZXJPIUMjhSjEAac3Lp
 Su9A6TgYiV1Cq+jSP1IqIINc0SM6kh541v30iy9uT7grEZE5mloaDht1dxHiO4bVxUiJ
 Dm08X2uQziSlQbYBLQ8C3QebE4/0XEd1ys7d9hoRJkYO1yraiWQJDSg/P5tBq/LfaB/d
 xq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lHpDGO3eipCJBv/JBXAcsVMlGwZEUUhI8iuzgMFtJmM=;
 b=Qtu8OBZ7Xop/vZ1XAjpdyyyidxHKcQN3den89xltTnWnQhq4HPdyI+Epcfxc5rd79i
 uKu58mixTf3surRmZciim11AmskQ/NxkdiwXerv15mPKHvPj3xJR2Nsk+rB2GQte/YHr
 mVm0bQUpf6chAQx9Bs7MV+gyC+/4lHfJcUbdGUBIWBlA1ctKoCqEMnaphjB1sSqMz1X1
 Cfgkfb2E8TJIwMhQqgiPkX0dJwno0tW6ad94PaFz++sXn8NjBg0SIWGMhNZnvv1HP0rg
 LSke/pY9R5MilCEYpt1cDfVPmmEMVPG8IbAc5hVGPPP64WP5LADokAmFuM7RN92SDMpD
 Vdpg==
X-Gm-Message-State: AOAM532nJx0y+xrdNWL8OX5pwjVXbOMvwU2yBOLKbEyjAoj3pnVw2M5O
 nLm7EBoYVPH2nHuNqeC907I=
X-Google-Smtp-Source: ABdhPJwezDQMRyJjlJ2x54xV5sUJhYCIpJFqrqR8TiMN0dETRCHh5AGT6FWowwiRJAH+y2cy8/HYIg==
X-Received: by 2002:a5d:660d:: with SMTP id n13mr9515562wru.308.1601121322592; 
 Sat, 26 Sep 2020 04:55:22 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c14sm6350811wrm.64.2020.09.26.04.55.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Sep 2020 04:55:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
Date: Sat, 26 Sep 2020 15:55:20 +0400
Message-Id: <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
To: Jens Axboe <axboe@kernel.dk>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_075523_561230_7C5EA814 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, furkan@fkardame.com,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiAKPiBPbiAyNiBTZXAgMjAyMCwgYXQgMjo1MSBwbSwgSmVucyBBeGJvZSA8YXhib2VAa2VybmVs
LmRrPiB3cm90ZToKPiAKPiBPbiA5LzI2LzIwIDE6NTUgQU0sIENocmlzdGlhbiBIZXdpdHQgd3Jv
dGU6Cj4+IEkgYW0gdXNpbmcgYW4gQVJNIFNCQyBkZXZpY2Ugd2l0aCBBbWxvZ2ljIFM5MjJYIGNo
aXAgKEJlZWxpbmsKPj4gR1MtS2luZy1YLCBhbiBBbmRyb2lkIFNUQikgdG8gYm9vdCB0aGUgS29k
aSBtZWRpYWNlbnRyZSBkaXN0cm8KPj4gTGlicmVFTEVDICh3aGljaCBJIHdvcmsgb24pIGFsdGhv
dWdoIHRoZSBpc3N1ZSBpcyBhbHNvIHJlcHJvZHVjaWJsZQo+PiB3aXRoIE1hbmphcm8gYW5kIEFy
bWJpYW4gb24gdGhlIHNhbWUgaGFyZHdhcmUsIGFuZCB3aXRoIHRoZSBHVC1LaW5nCj4+IGFuZCBH
VC1LaW5nIFBybyBkZXZpY2VzIGZyb20gdGhlIHNhbWUgdmVuZG9yIC0gYWxsIHRocmVlIGRldmlj
ZXMgYXJlCj4+IHVzaW5nIGEgY29tbW9uIGR0c2k6Cj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20v
Y2hld2l0dC9saW51eC9ibG9iL2FtbG9naWMtNS45LWludGVnL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwo+PiBodHRwczovL2dpdGh1Yi5jb20vY2hl
d2l0dC9saW51eC9ibG9iL2FtbG9naWMtNS45LWludGVnL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTJiLWd0a2luZy1wcm8uZHRzCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3
aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWcxMmItZ3RraW5nLmR0cwo+PiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9s
aW51eC9ibG9iL2FtbG9naWMtNS45LWludGVnL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTJiLXc0MDAuZHRzaQo+PiAKPj4gSSBoYXZlIHNjaGVtYXRpY3MgZm9yIHRoZSBkZXZp
Y2VzLCBidXQgY2FuIG9ubHkgc2hhcmUgdGhvc2UgcHJpdmF0ZWx5Cj4+IG9uIHJlcXVlc3QuCj4+
IAo+PiBGb3IgdGVzdGluZyBJIGFtIGJvb3RpbmcgTGlicmVFTEVDIGZyb20gU0QgY2FyZC4gVGhl
IGJveCBoYXMgYSA0VEIKPj4gU0FUQSBkcml2ZSBpbnRlcm5hbGx5IGNvbm5lY3RlZCB3aXRoIGEg
VVNCID4gU0FUQSBicmlkZ2UsIHNlZSBkbWVzZzoKPj4gaHR0cDovL2l4LmlvLzJ5TGggYW5kIEkg
Y29ubmVjdCBhIFVTQiBzdGljayB3aXRoIGEgNEdCIElTTyBmaWxlIHRoYXQgSQo+PiBjb3B5IHRv
IHRoZSBpbnRlcm5hbCBTQVRBIGRyaXZlLiBXaXRoaW4gMTAtMjAgc2Vjb25kcyBvZiBzdGFydGlu
ZyB0aGUKPj4gY29weSB0aGUgYm94IGRlYWRsb2NrcyBuZWVkaW5nIGEgaGFyZCBwb3dlciBjeWNs
ZSB0byByZWNvdmVyLiBUaGUKPj4gdGltaW5nIG9mIHRoZSBkZWFkbG9jayBpcyB2YXJpYWJsZSBi
dXQgdGhlIGRldmljZSBfYWx3YXlzXyBkZWFkbG9ja3MuCj4+IEFsdGhvdWdoIEkgYW0gdXNpbmcg
YSBzaW1wbGUgY29weSB1c2UtY2FzZSwgdGhlcmUgYXJlIHNpbWlsYXIgcmVwb3J0cwo+PiBpbiBB
cm1iaWFuIGZvcnVtcyBwZXJmb3JtaW5nIHRhc2tzIGxpa2UgaW5zdGFsbHMvdXBkYXRlcyB0aGF0
IGludm9sdmUKPj4gSS9PIGxvYWRzLgo+PiAKPj4gRm9sbG93aW5nIGFkdmljZSBpbiB0aGUgI2xp
bnV4LWFtbG9naWMgSVJDIGNoYW5uZWwgSSBhZGRlZAo+PiBDT05GSUdfU09GVExPQ0tVUF9ERVRF
Q1RPUiBhbmQgQ09ORklHX0RFVEVDVF9IVU5HX1RBU0sgYW5kIHdhcyBhYmxlIHRvCj4+IGdldCBv
dXRwdXQgb24gdGhlIEhETUkgc2NyZWVuIChpdCBpcyBub3QgcG9zc2libGUgdG8gY29ubmVjdCB0
byBVQVJUCj4+IHBpbnMgd2l0aG91dCBkZXN0cm95aW5nIHRoZSBib3ggY2FzZSkuIElmIHlvdSBh
ZHZhbmNlIHRoZSBmb2xsb3dpbmcKPj4gdmlkZW8gZnJhbWUgYnkgZnJhbWUgaW4gVkxDIHlvdSBj
YW4gc2VlIHRoZSBvdXRwdXQ6Cj4+IAo+PiBodHRwczovL3d3dy5kcm9wYm94LmNvbS9zL2tsdmNp
emltOGNzNWx6ZS9sb2NrdXBfY2xpcC5tb3Y/ZGw9MAo+IAo+IFRyeSB3aXRoIHRoaXMgcGF0Y2g6
Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxvY2svMjAyMDA5MjUxOTE5MDIu
NTQzOTUzLTEtc2hha2VlbGJAZ29vZ2xlLmNvbS8KCkl0IHN0aWxsIGxvY2tzIHVwIGFwcHJveC4g
MjUgc2Vjb25kcyBpbnRvIHRoZSBjb3B5IG9wZXJhdGlvbi4gSGVyZeKAmXMgdGhlIG91dHB1dCBp
biB2aWRlbyBhZ2FpbiAoYSBsaXR0bGUgYmx1cnJ5KToKCmh0dHBzOi8vd3d3LmRyb3Bib3guY29t
L3MvM2oyY3phcTUwOWFyZzZnL2xvY2t1cF9jbGlwMi5tb3Y/ZGw9MAoKQ2hyaXN0aWFuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
