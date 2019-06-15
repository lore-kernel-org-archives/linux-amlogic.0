Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B69AC31E47
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 11:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE2220866
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 11:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGoEp2z0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LTVSKQKv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE2220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg3ovOshCTceFWPwOqlvSTdk5l68pkzE/LMvIiKRlew=; b=kGoEp2z0CFNoVL
	vqSi5yuP1CSmFGdosmCeENMMFT8X+WrV2Q0R2CFEyA6vcVbTK85j6/Sw/U621gYa6whQ0AFG/Z0R5
	B+KagySC9tYLDkwAgPKFQGZzWq0EYMClovCPIwsj7FWh/kbPjcTyXIFJ1wSLR644NWaNdlAvP/mww
	97aZfZbQnsHBp0y4EQE6Yo4JhsqELpFQax+XYxVXD1qYG/j6GVpvQYBwfJ+GPiruo31HR0APv8pHB
	Pk7rRCI82iWayTnPGLPP90OsYuBouu1svnUCUYPHYVbZYhhYt4b2LBJHp8UYWoGLn9XSrf7GRP3j+
	Cf5Eo9G6Gvp9DE79RKrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc6xf-0005eY-Jx; Sat, 15 Jun 2019 11:35:07 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc6xb-0004zL-0i
 for linux-amlogic@lists.infradead.org; Sat, 15 Jun 2019 11:35:04 +0000
Received: by mail-ot1-x341.google.com with SMTP id r6so5115301oti.3
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jun 2019 04:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hRhCiEWbAdaFzFAgh5LGmeMBDNwJYjb9Dh+n4yiAa9c=;
 b=LTVSKQKvajccwPJHLQoHoR24zcLY7JxuFEeHiy33zEFKbQ17tlEemFHNCuersqBgRm
 fTWZZQsMB2ljd6y8SSu326Dryjs6Xba4MkfxIe7VABnSAuf0lr/qKhi9/alLKB68fAm/
 wxdgaPXEtU7AYI78iXB/TOwUQFov1xKbooqTaj4DZLvJdJt2ClGde3jR5/WGT+C9+nb9
 a1K+sxN5J9tuvWGul/BKzizJfcdsrhku9QhUWKFERTnYsGjNv+NpNylEPqbjNxVhtJn/
 s379DzH9IAXqYsKgDjWrXn67NWJDpLwBGBOIBydChN8w+3CrJyt0g7g/137JJk9hJPZ5
 weMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hRhCiEWbAdaFzFAgh5LGmeMBDNwJYjb9Dh+n4yiAa9c=;
 b=B9STRgG2MWYBT6FdmFLse0dlyWw8qgj0F9iRio3V2GIQgVVXmzd6eTLb0upAY4Es3v
 XJSOb0lLud+bbfhhi+jRXUWxSChHR+VNxvpwetdEOkD9HS+9NQJvaYOXkgd+CuRkuirL
 dF7CF1lx2lnubL4gfLKzGM5xz7ktLMm6xHKg1WoBs9fpWVMY3HaVzuSxq5AViDZXV29t
 wKQX8XL8tQkJsVj7y8ZbvvhXqLS5uzv/a/31hnfal/AX+GqeYkeH3CLtu1tK1ytNAdHA
 t5quSEcSds3+Zjvy5yeI/VqUAcwjY7sDyJUuAmU1NCoI5aQF1Wu9ck0dyzxgbOSXGSPh
 /UwQ==
X-Gm-Message-State: APjAAAUd8dwCH6FKSQsPw0HBmX+fLxLUiG45zv1Z4M93CcflFKE1fNQJ
 yN3gtm4nlL6TuJyiSbkdSUqXatm4B5uUlsjhZ191hQ0pjQo=
X-Google-Smtp-Source: APXvYqySrXn485XJyrY5QNi8s1rw+Jkwhw//F9jolcy91ItuTCeNRFeAY//OcYe+uf7sv7KpKV2VMBIr9bBPcuwLTBM=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr8139606otb.81.1560598499069; 
 Sat, 15 Jun 2019 04:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
In-Reply-To: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 15 Jun 2019 13:34:47 +0200
Message-ID: <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
Subject: Re: Meson8b network not stable at gigabit
To: Aymeric <mulx@aplu.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_043503_102857_1B508FC8 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gQXltZXJpYywKCk9uIFNhdCwgSnVuIDE1LCAyMDE5IGF0IDEyOjIyIEFNIEF5bWVyaWMg
PG11bHhAYXBsdS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBhbGwsCj4KPiBJJ3ZlIGp1c3Qgc3Vic2Ny
aWJlIG9uIHRoaXMgbWFpbGluZyBsaXN0LCBzbyBmb3JnaXZlIG1lIGlmIEknbSBub3QKPiBmb2xs
b3dpbmcgc29tZSBydWxlcy4KPgo+IEFueXdheSwgSSd2ZSBhbiBPRFJPSUQtQzEgYm9hcmQgKHdo
aWNoIG1lYW4gbWVzb244Yi9TODA1KSBhbmQgSSd2ZSBzb21lCj4gbmV0d29yayBzdGFiaWxpdHkg
aXNzdWUgd2l0aCBib3RoIGtlcm5lbCA1LjAueCBhbmQgNS4xLnggKGFzIG9mIHRvZGF5Cj4gSSdt
IHVzaW5nIDUuMS45LCBjb21waWxlZCBteXNlbGYgLSBjb25maWcgZmlsZSB1c2VkIGlzIGF2YWls
YWJsZSBoZXJlIFvCuV0pLgo+Cj4gVGhlIG5ldHdvcmsgY2FyZCBpcyBkZXRlY3RpbmcgdGhlIGxp
bmsgYXMgZG93biBhbmQgdXAgZXZlcnkgZmV3IHNlY29uZHMKPiBtYWtpbmcgaXQgdW51c2FibGUu
CnRoYXQgaXMgYmFkIDooCmhvdyBkbyB5b3UgdHJpZ2dlciB0aGlzIHByb2JsZW0/CgpJIGp1c3Qg
dHJpZWQgaXQgd2l0aCA1LjItcmM0IGJ5IGp1c3QgYm9vdGluZyB0aGUgYm9hcmQsIGJyaW5naW5n
IHVwCnRoZSBldGgwIGludGVyZmFjZSBhbmQgZG93bmxvYWRpbmcgfjUwTWlCCkkgY2Fubm90IHJl
cHJvZHVjZSB5b3VyIGxpbmsgdXAgLyBkb3duIGlzc3VlOgojIHVwdGltZQoxMTozNDoxNyB1cCAx
MSBtaW4sICAxIHVzZXIsICBsb2FkIGF2ZXJhZ2U6IDEuNzAsIDIuMzksIDEuNTEKIyBkbWVzZyB8
IHRhaWwgLW4xClsgICA0My4wNjIxODVdIG1lc29uOGItZHdtYWMgYzk0MTAwMDAuZXRoZXJuZXQg
ZXRoMDogTGluayBpcyBVcCAtCjFHYnBzL0Z1bGwgLSBmbG93IGNvbnRyb2wgb2ZmCgo+IFRoZSBr
ZXJuZWwgZnJvbSBIYXJka2VybmVsICgzLjEwLnNvbWV0aGluZykgaXMgd29ya2luZyBmaW5lLgp0
aGUgMy4xMCBrZXJuZWwgdXNlcyBwb2xsaW5nIGZvciB0aGUgUEhZIHN0YXR1cyB3aGlsZSB0aGUg
bWFpbmxpbmUKa2VybmVsIHVzZXMgYW4gaW50ZXJydXB0Lgp0aGF0IG1lYW5zIDMuMTAgd2lsbCBv
bmx5IGxvb2sgZm9yIGEgbGluayBjaGFuZ2UgZXZlcnkgeCBtaWxsaXNlY29uZHMKKEkgYmVsaWV2
ZSBpdCdzIDUwMCBvciAxMDAwIGJ5IGRlZmF1bHQpIHdoaWxlIG1haW5saW5lIHdpbGwKImluc3Rh
bnRseSIgZGV0ZWN0IGFueSBsaW5rIGNoYW5nZQoKY2FuIHlvdSBwbGVhc2U6CjEuIGJvb3QgbWFp
bmxpbmUgTGludXgKMi4gYnJpbmcgZXRoMCB1cAozLiBydW4gImNhdCAvcHJvYy9pbnRlcnJ1cHRz
IHwgZ3JlcCBzdG1tYWMiCjQuIHdhaXQgMSBtaW51dGUsIGRvIG5vdCBkaXNjb25uZWN0IHRoZSBu
ZXR3b3JrIGNhYmxlIGV0Yy4KNS4gcnVuICJjYXQgL3Byb2MvaW50ZXJydXB0cyB8IGdyZXAgc3Rt
bWFjIiBhZ2FpbgoKaW4gbXkgY2FzZSB0aGUgImNvdW50IiAoc2Vjb25kIGNvbHVtbiBmcm9tIHRo
ZSBjYXQgb3V0cHV0IGFib3ZlKSBpcyAxCmFmdGVyIHN0ZXAgMyBhbmQgc3RpbGwgMSBhZnRlciBz
dGVwIDUKYW55dGhpbmcgZWxzZSBzdWdnZXN0cyB0aGF0IHRoZSBFdGhlcm5ldCBQSFkgc2VlcyBh
IGxpbmsgY2hhbmdlICh0aGVuCndlIGhhdmUgdG8gZmluZCBvdXQgd2h5KQoKPiBTZWUgYSBzYW1w
bGUgb2YgdGhlIGxvZyAoZG1lc2cpIGhlcmUgW8KyXS4KPgo+IFRoZSBvbmx5IHdheSBJIGZvdW5k
IHRvIGhhdmUgdGhlIG5ldHdvcmsgc3RhYmxlIGlzIHRvIHVzZSBldGh0b29sIHRvCj4gZm9yY2Ug
dGhlIGxpbmsgYXQgMTAwTS4KZGlkIHlvdSBydWxlIG91dCB0aGUgdXN1YWwgc3VzcGVjdHMgKGRp
ZmZlcmVudCBzd2l0Y2ggcG9ydCwgdHJ5IHdpdGgKYW5vdGhlciBjYWJsZSk/Cgo+IEFyZSB5b3Ug
YXdhcmUgb2YgaXQ/IElzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvPwo+Cj4gQWxzbywgSSBkaWRu
J3QgdHJ5IHdpdGgga2VybmVsIDUuMi1yYzQgeWV0LCBtYXliZSBJJ3ZlIG1hZGUgYSBtaXN0YWtl
IGluCj4gbXkgLmNvbmZpZz8KeW91ciAuY29uZmlnIGxvb2tzIGZpbmU6IG1lc29uOGItZHdtYWMg
KGFuZCB0aHVzIHRoZSBzdG1tYWMgRXRoZXJuZXQKY29udHJvbGxlciBkcml2ZXIpIGFyZSBkZXRl
Y3RlZCBhcyB3ZWxsIGFzIHRoZSBSVEw4MjExRiBQSFkKCgpNYXJ0aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
