Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AF2C43602
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNFjIGpvoHmf2owhBujsVJy3YTQW0OpqDC7SrlkVakY=; b=RLNT3niXVmEi+V
	X+mjvTHfUqTVW+jrONVn7tj/1O0rUmyTlcTXsYA3ow6bcLjUeuuntxb79Snfiz82OxUm8DJ/W8pbo
	ODEullhpQZth4SsPOtWy//a2Ke1u1G4v1s2BGKb+nm8/cF2hqMNqI/ccr6Am7Gc9AUf41wo8oGC0T
	KromUkI5cXgYD3IX/DV4XEs/dbKAZQ5bfgbvKL9ud+SzfK3DDggHGCoHF77o5o8MdWPVLzjipirfP
	9HE4UPnXg0dYL2hDR8kzBbCj82jqXDmM4VE12/IeUvi2UcWH4FFcN1iWhZjLxhXgiJ/ZMnSW5Ppko
	xJ5kfjLsTnap2zRb7TJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHN-0000000EvrO-1Els;
	Mon, 29 Jun 2026 14:48:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHL-0000000Evq9-11QX
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so24426445e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744485; x=1783349285; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=jSqu8OK5dmZTnlKNyu7cH8G+0GcaolJopd8PSwxoi009U57GlvKMXIQA1zutGvUxea
         4SJLj0ShVn8BBFGeGfr7+O+gQjRzOUt1eTO+nhH2K5bosO00wyqhb+o8W0imcpd2Sfwp
         mgONbeNz3GhiTKBzOF05fbTjdtchnWiZNtaWACObdNNsTKD7OurRxuIcmtBde2RyAJDl
         N+5EXHhwm6AWHH/Tk81phO56vU1u9r4/pWshc+vl8E1e6Jvj4y5k5nfNbSe4ZKfx5Ni8
         cFevigonzJZIXLkiU0iqJBMhSUhpdAo3i69K/79s2XKQDN5mKhmZcxWY5i9FD+Z+3Zbc
         ZYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744485; x=1783349285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=nFJ9PO9AbdtXkimZLDyjTlTqiPfQMb0DGqaersv2oPImkpWRYMOuBjZY9apCBu6/Ux
         VfTubcXSErXZDA98gwAeMVBYJanUEsIRn7NAEiLSdyeKnR/6jSb9SAu2n0mcckZ6GKSf
         ThG6FKIJ7ZFfJteUwR4Fry+rwCY/35GacfZl1mXuz4hwzpPO4Qq7TYOm2dE/rpaLfE1f
         cGXdozNySh2zE8T+29DE3GVYVj3+6sAO8biF6Gq6G3Y1VxTzuNMLWNHbEyGDHvkhp1MG
         vH3A/vf+XGGQgVX4D2Pz4afKB94VqSsljgLt6EFYHjixwv7jzZW0FgGaO4ZnUOzjo2Kq
         pQjA==
X-Forwarded-Encrypted: i=1; AFNElJ+QNWopvbuQQk8r1Z2WquJclmaVLeWk3tuEzS67a8B8UedYF56eJnlOQ0QnsiohIR/8Ax0c7nyO872FEaxy@lists.infradead.org
X-Gm-Message-State: AOJu0YxoXSRGvE9EGZ3pHcLNArB9i8ND/S8JtN++bsuLenuZbwJ/8JTV
	lTdxU4PTuyOqiGlu9L5f8I1VKxtJVxM9CqwVCqQl/LGCqFp2wvv4nD8P
X-Gm-Gg: AfdE7cmO9pdZjfzNc1b/PSxCLZkonidgqBQptUKfFDUkwDHiSnKVhUh9knHpR7Czh6T
	PfOLPME0UN184wXZV9ZHVyKwcLTvCEkIcNb5LoXjPu53xz9nlXzUyeiMQYPyf3B1AVrT1LPbaSW
	euYHN32H2WcdG9Sy8TL2oJHbzyjdGzjmgzsqb9ERrVHY1bm47uzTPOXBbj9fK4WRi0qQsEAB8O9
	/9Mk68ntKfQi501TdOkN6WRRukUOmsh4jE2+JRxoYRx/e5Kf1QWs0pnvTbSRuLX1YJqzeNvJ3AP
	p0xZ/H38qUJC5Osr+rjkqGQj1pLxm8+o6G88EYpxDRn8lyYLLoLTm30OSYQroqR2YAIMNID0CGn
	z5AV/ujtVVh1ODKJ5fEYPE3cY/Gs22uNhykvkdFJHwuRDQy+miVcg0OpCj8y31IMLVMhtiK6Yo1
	J0Hhr/JsFCXsUbqOKnz8Cjp52ET0/NK9k9wqE9Oo8G1LwGJv4xUjr0Bic5rzXNsz1zK6tdMv5sI
	R/nUJvpQp34q7q/
X-Received: by 2002:a05:600c:8b08:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-493b8289905mr175815e9.14.1782744484783;
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0f32sm321549885e9.3.2026.06.29.07.48.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 29 Jun 2026 18:47:44 +0400
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <D8EA185E-1F9C-4655-82C9-2C46A035782B@gmail.com>
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
 <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
 <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074807_299736_3666EC4A 
X-CRM114-Status: GOOD (  17.25  )
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

PiBPbiAyOSBKdW4gMjAyNiwgYXQgNDowNOKAr3BtLCBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJh
eWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4gT24gdmVuLiAyNiBqdWluIDIwMjYgYXQgMjI6NDEsIE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdy
b3RlOgo+IAo+PiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAxMDowNOKAr0FNIENocmlzdGlhbiBI
ZXdpdHQKPj4gPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPj4+IAo+Pj4gVGhl
IEkyUyBGSUZPIHNvZnQtcmVzZXRzIGl0cyBmYXN0IGRvbWFpbiBvbiBzdGFydCAoQUlVX1JTVF9T
T0ZUIGJpdCAwICsKPj4+IEFJVV9JMlNfU1lOQyByZWFkIGluIGFpdV9maWZvX2kyc190cmlnZ2Vy
KSwgbWlycm9yaW5nIHRoZSBkb3duc3RyZWFtCj4+PiB2ZW5kb3IgZHJpdmVyJ3MgYXVkaW9fb3V0
X2kyc19lbmFibGUoKS4gVGhlIFMvUERJRiBGSUZPIGhhcyBubyBlcXVpdmFsZW50Ogo+Pj4gaXQg
b25seSB0b2dnbGVzIHRoZSBJRUM5NTggRENVLCBzbyBhIHN0YWxlIGRhdGFwYXRoIEZJRk8gY2Fu
IGJlIHJlcGxheWVkLAo+Pj4gcHJvZHVjaW5nIHRoZSAibWFjaGluZSBndW4gbm9pc2UiIGJ1ZmZl
ciB1bmRlcnJ1biAtIG9uIHN0YXJ0IHdoZW4gc3dpdGNoaW5nCj4+PiBvdXRwdXRzLCBhbmQgb24g
c3RvcCB3aGVuIHBsYXliYWNrIGVuZHMuIFRoZSBsYXR0ZXIgaXMgYXVkaWJsZSBvbiBkZXZpY2Vz
Cj4+PiB3aXRoIGFuIGFsd2F5cy1vbiBTL1BESUYtZmVkIERBQyAoZS5nLiB0aGUgRVM3MTQ0IG9u
IHRoZSBXZVRlayBQbGF5MikuCj4+PiAKPj4+IFRoZSB2ZW5kb3IgZHJpdmVyIHJlc2V0cyB0aGUg
SUVDOTU4IGZhc3QgZG9tYWluIChBSVVfUlNUX1NPRlQgYml0IDIpIG9uCj4+PiBib3RoIGVuYWJs
ZSBhbmQgZGlzYWJsZSAoYXVkaW9faHdfOTU4X2VuYWJsZSksIGFuZCB3aGVuIHJlY29uZmlndXJp
bmcKPj4+IChhdWRpb19od185NThfcmVzZXQgY2xlYXJzIEFJVV85NThfRENVX0ZGX0NUUkwgdGhl
biByZXNldHMpLiBEbyB0aGUgc2FtZToKPj4+IHJlc2V0IGJlZm9yZSBlbmFibGluZyB0aGUgRENV
IG9uIHN0YXJ0LCBhbmQgYWZ0ZXIgZGlzYWJsaW5nIGl0IG9uIHN0b3AuCj4+PiAKPj4+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+
PiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4KPj4gCj4+IFRoaXMgbWF0Y2hlcyB0aGUgdmVuZG9yIGRyaXZlciwgcmVm
ZXJlbmNlczoKPj4gLSBmYXN0LXJlc2V0IFNQRElGIGlzIHRyaWdnZXJlZCBvbiBlbmFibGUgYW5k
IGRpc2FibGU6IFswXQo+PiAtIGZhc3QtcmVzZXQgU1BESUYgaXMgdHJpZ2dlcmVkIGFmdGVyIGFs
bCBvZiB0aGUgY29uZmlndXJhdGlvbiBpcwo+PiB3cml0dGVuLCB0aGVuIERDVV9GRl9DVFJMIGlz
IGVuYWJsZWQ6IFsxXQo+IAo+IFRha2Ugd2hhdCB0aGUgdmVuZG9yIGRyaXZlciBkb2VzIHdpdGgg
YSBncmFpbiBvZiBzYWx0LCBlc3BlY2lhbGx5IHdoZW4KPiBpdCBjb21lcyB0byBhdWRpbwo+IAo+
PiAKPj4gWy4uLl0KPj4+ICAgICAgICBjYXNlIFNORFJWX1BDTV9UUklHR0VSX1NVU1BFTkQ6Cj4+
PiAgICAgICAgY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9QVVNIOgo+Pj4gICAgICAgIGNh
c2UgU05EUlZfUENNX1RSSUdHRVJfU1RPUDoKPj4+ICAgICAgICAgICAgICAgIGZpZm9fc3BkaWZf
ZGN1X2VuYWJsZShjb21wb25lbnQsIGZhbHNlKTsKPj4+ICsgICAgICAgICAgICAgICBzbmRfc29j
X2NvbXBvbmVudF93cml0ZShjb21wb25lbnQsIEFJVV9SU1RfU09GVCwKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBSVVfUlNUX1NPRlRfOTU4X0ZBU1QpOwo+PiBJ
dCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBhbnkgZGlmZmVyZW5jZSwgc28ganVzdCBmb3IgdGhlIHJl
Y29yZDoKPj4gVGhlIHZlbmRvciBkcml2ZXIgZmlyc3QgdHJpZ2dlcnMgQUlVX1JTVF9TT0ZUXzk1
OF9GQVNUIHRoZW4gZGlzYWJsZXMgRENVOiBbMl0KPj4gCj4gCj4gT25lIGNvdWxkIGV2ZW4gd29u
ZGVyIGlmIHRoZXJlIGlzIGFueSBwb2ludCBpbiBhcHBseWluZyBhIHJlc2V0IHdoZW4KPiBldmVy
eXRoaW5nIGlzIHN0b3BwZWQsIGlmIHRoZSBlbmFibGUgcGF0aCB3aWxsIGFwcGx5IHRoaXMgc2Ft
ZQo+IHJlc2V0IGJlZm9yZSBhbnl0aGluZyBlbHNlIGlzIHN0YXJ0ZWQgYWdhaW4gPyBEb2VzIGl0
IHJlYWxseSBjaGFuZ2VzCj4gYW55dGhpbmcgdG8gdGhlIHJlcG9ydGVkIGlzc3VlID8KClVzaW5n
IGRpc2FibGUvcmVzZXQgb3IgcmVzZXQvZGlzYWJsZSBkaWRu4oCZdCBtYWtlIGFueSBkaWZmZXJl
bmNlIGluIG15CnRlc3RpbmcsIGJ1dCB3aXRob3V0IGFueSByZXNldCBwbGF5YmFjayBzdG9wIG9u
IHRoZSBXZVRlayBQbGF5MiBib2FyZAp3aXRoIGhhcmR3aXJlZCBEQUMgYWx3YXlzIHRyaWdnZXJz
IHRoZSBidWZmZXIgdW5kZXJydW4uCgpDSC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
