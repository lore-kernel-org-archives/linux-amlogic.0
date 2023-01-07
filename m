Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EECC46467
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wefJrCFI34TLRXEGKw1/ZbXbdX5KUvdTd0IfYyX5xb8=; b=KGniWmECcB91wu
	uwOJL3/ityfyAZGK1WaeNxLRpLNt+Oj4MS35Oi8fWJ3bLiP23NR2NsPOgWCKH2QbD9DIOk/5eL5H0
	q9Subgj1LAkBecyRA6pE6IKEHABqi/Bl3sncaPSWAAwD6kosqCMn+0HLeLfr608nf+BbypDbRde3N
	fkRfgHvpAM+OZddmL8ueC7ULiqlHay6gUsKjI0ty+MqQXzF+exE2YnIoEgtr5a/+5fczs0P/ted0r
	dvY86bYTGfv97iLW2yWCotEom7fmToLAuJkV3b1y5TlV+/cMp+q4QUDIpAVcZevdeExRWxNxxbzfq
	3oIvpsksMshDngOnQCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAec-007RHG-3g; Sat, 07 Jan 2023 14:58:38 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAeZ-007RFv-J2
	for linux-amlogic@lists.infradead.org; Sat, 07 Jan 2023 14:58:37 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id j18so171193vkn.10
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Jan 2023 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etuGUMlz1OGZPLC3N2dsybJcv0GF1qcAGisyjEZpP/U=;
        b=Nqs0hq7qEOd9Wbfvi1Sh+OsqVulVM5R3Hi7j1ddD1/VVE46t62ThnjyqG/x0vMge8B
         5l1CK4KFBBqnkaS/Z9Kopo10udHZC3W6tYB+ac/fHrUtdoeCNfg8wlXc009nETgXURbf
         VnJYJcCFGr+h5qEid9ddza63RqwQF8k0FgxprXvBEhQ7M6IXIdmkOe1i4sLNf/H64pWI
         ZqWTBzF1f/ckyspS8rl6lk7oK9vdvXLPfae0TwcDzFKHF16CEM1q8CvGJ2e3UMac5LHu
         B2fETbhvAmoaz1jPYHmcKnhc2A/kFptrQgArKiTxXnbv6sUhrzyV4t8QPF7M6TqZEKp9
         NT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etuGUMlz1OGZPLC3N2dsybJcv0GF1qcAGisyjEZpP/U=;
        b=NPQrYDWNCRMzWTqPHot903qjnEbDyq3aMAJULJRdZQ6gDt2kHaU/J9R9gmUPnV6KNo
         3AoJrlkA1r7I4deXt+HikVk9so/TKC3t5QwhJQjN8BcCDohMBsnFG7eWrLBj2Cji0Hwp
         ljXTDdmhsRa1G/RgDBsNAPV4A93U0MB5aqd8MvRf6BOiVz3zvcC0oIzGcM3Uyj8fed6n
         tyMtHS5flD7mGoWS+vIU9ZYoavgTsc/x9nixS49y16KVZR6pC96an1O2NP70TT39DwBo
         CHASn9YpcffmkXrRz+tUVudGGIqeQzZVJJvS7eMZnKx1PTfarL2rsDM6ciNR4JNeh//e
         c0cw==
X-Gm-Message-State: AFqh2kqu2cbT+pWOxo6aaF3sDnohDqgrkGdooBq59SzLFaEAzH3cgvx3
	r8pZxpEW15BNm1AuY22MwXUjFoVhyX0Umsh0ibU=
X-Google-Smtp-Source: AMrXdXsYRMv57sqBsp8WHzBL5A35b5HiFMXzzy9cTFHvCMaCiRc6CewnLg/TqNYduCrsvnNlAbDka61FZvrmhD1sOkA=
X-Received: by 2002:a1f:2189:0:b0:3d5:8603:a96f with SMTP id
 h131-20020a1f2189000000b003d58603a96fmr4338822vkh.22.1673103507209; Sat, 07
 Jan 2023 06:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-7-linux.amoon@gmail.com>
 <Y7Xk/lPUshC+U8OQ@google.com>
In-Reply-To: <Y7Xk/lPUshC+U8OQ@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:28:11 +0530
Message-ID: <CANAwSgTySFm3o-9JcTTiKMHN-8w510DKNFKKxwz3PjA6DDQwHQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL3523-QFN76 hub support
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_065835_649072_890A77CA 
X-CRM114-Status: GOOD (  30.93  )
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

SGkgTWF0dGhpYXMsCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnRzLAoKT24gVGh1LCA1
IEphbiAyMDIzIGF0IDAyOjEzLCBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4g
d3JvdGU6Cj4KPiBIaSBBbmFuZCwKPgo+IE9uIFdlZCwgRGVjIDI4LCAyMDIyIGF0IDEwOjAzOjE1
QU0gKzAwMDAsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiBHZW5lc3lzIExvZ2ljIEdMMzUyMy1RRk43
NiBpcyBhIDQtcG9ydCBVU0IgMy4xIGh1YiB0aGF0IGhhcyBhIHJlc2V0IHBpbiB0bwo+ID4gdG9n
Z2xlIGFuZCBhIDUuMFYgY29yZSBzdXBwbHkgZXhwb3J0ZWQgdGhvdWdoIGFuIGludGVncmF0ZWQg
TERPIGlzCj4gPiBhdmFpbGFibGUgZm9yIHBvd2VyaW5nIGl0Lgo+ID4KPiA+IEFkZCB0aGUgc3Vw
cG9ydCBmb3IgdGhpcyBodWIsIGZvciBjb250cm9sbGluZyB0aGUgcmVzZXQgcGluIGFuZCB0aGUg
Y29yZQo+ID4gcG93ZXIgc3VwcGx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIE1vb24g
PGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdXNiL21pc2Mvb25i
b2FyZF91c2JfaHViLmMgfCAxICsKPiA+ICBkcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1
Yi5oIHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuYyBiL2RyaXZlcnMv
dXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmMKPiA+IGluZGV4IGMwZThlNmY0ZWMwYS4uNjk5MDUw
ZWIzZjE3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIu
Ywo+ID4gKysrIGIvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuYwo+ID4gQEAgLTQx
MCw2ICs0MTAsNyBAQCBzdGF0aWMgdm9pZCBvbmJvYXJkX2h1Yl91c2JkZXZfZGlzY29ubmVjdChz
dHJ1Y3QgdXNiX2RldmljZSAqdWRldikKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZp
Y2VfaWQgb25ib2FyZF9odWJfaWRfdGFibGVbXSA9IHsKPiA+ICAgICAgIHsgVVNCX0RFVklDRShW
RU5ET1JfSURfR0VORVNZUywgMHgwNjA4KSB9LCAvKiBHZW5lc3lzIExvZ2ljIEdMODUwRyBVU0Ig
Mi4wICovCj4gPiAgICAgICB7IFVTQl9ERVZJQ0UoVkVORE9SX0lEX0dFTkVTWVMsIDB4MDYxMCkg
fSwgLyogR2VuZXN5cyBMb2dpYyBHTDg1MkctT0hHIFVTQiAyLjAgKi8KPiA+ICsgICAgIHsgVVNC
X0RFVklDRShWRU5ET1JfSURfR0VORVNZUywgMHgwNjIwKSB9LCAvKiBHZW5lc3lzIExvZ2ljIEdM
MzUyMy1RRk43NiBVU0IgMy4xICovCj4KPiBQbGVhc2UgZHJvcCB0aGUgJy1RRk43Nicgc3VmZml4
LiBUaGUgR0wzNTIzIGNvbWVzIGluIGRpZmZlcmVudCBwYWNrYWdlcywgJ1FGTjc2Jwo+IGlzIG9u
ZSBvZiB0aGVtLCBJJ2QgZXhwZWN0IHRoZSBvdGhlciBwYWNrYWdlcyB0byB1c2UgdGhlIHNhbWUg
cHJvZHVjdCBpZC4KPgo+IFRoZSBHTDM1MjMgaXMgYSBzaW5nbGUgSUMsIGhvd2V2ZXIgbGlrZSB0
aGUgVEkgVVNCODA0MSBvciB0aGUgUlRTNTQxNCBpdAo+IHByb3ZpZGVzIGJvdGggYSBVU0IgMy4x
IGFuZCBhIFVTQiAyLjAgaHViLiBZb3Ugc2hvdWxkIGFsc28gYWRkIGFuIGVudHJ5IGZvcgo+IHRo
ZSBVU0IgMi4wIGh1YiBoZXJlLgo+CgpPaywKCj4gPiAgICAgICB7IFVTQl9ERVZJQ0UoVkVORE9S
X0lEX01JQ1JPQ0hJUCwgMHgyNTE0KSB9LCAvKiBVU0IyNTE0QiBVU0IgMi4wICovCj4gPiAgICAg
ICB7IFVTQl9ERVZJQ0UoVkVORE9SX0lEX1JFQUxURUssIDB4MDQxMSkgfSwgLyogUlRTNTQxMSBV
U0IgMy4xICovCj4gPiAgICAgICB7IFVTQl9ERVZJQ0UoVkVORE9SX0lEX1JFQUxURUssIDB4NTQx
MSkgfSwgLyogUlRTNTQxMSBVU0IgMi4xICovCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
bWlzYy9vbmJvYXJkX3VzYl9odWIuaCBiL2RyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfaHVi
LmgKPiA+IGluZGV4IDJlZTFiMDAzMmQyMy4uYjMyZmFkM2E3MGY5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuaAo+ID4gKysrIGIvZHJpdmVycy91c2Iv
bWlzYy9vbmJvYXJkX3VzYl9odWIuaAo+ID4gQEAgLTMyLDYgKzMyLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgb25ib2FyZF9odWJfbWF0Y2hbXSA9IHsKPiA+ICAgICAgIHsg
LmNvbXBhdGlibGUgPSAidXNiNDUxLDgxNDIiLCAuZGF0YSA9ICZ0aV90dXNiODA0MV9kYXRhLCB9
LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJ1c2I1ZTMsNjA4IiwgLmRhdGEgPSAmZ2VuZXN5
c19nbDg1MGdfZGF0YSwgfSwKPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZ2VuZXN5cyx1c2I1
ZTMsNjEwIiwgLmRhdGEgPSAmZ2VuZXN5c19nbDg1MGdfZGF0YSwgfSwKPiA+ICsgICAgIHsgLmNv
bXBhdGlibGUgPSAiZ2VuZXN5cyx1c2I1ZTMsNjIwIiwgLmRhdGEgPSAmZ2VuZXN5c19nbDg1MGdf
ZGF0YSwgfSwKPgo+IHMvZ2VuZXN5cywvLwo+Cj4gVGhpcyByZXVzZXMgdGhlIHNldHRpbmdzIG9m
IHRoZSBHTDg1MEcgaHViLCB3aGljaCBkb2Vzbid0IHNlZW0gY29ycmVjdCBpbgo+IHRoaXMgY2Fz
ZS4gRm9yIHRoZSBHTDg1MEcgYSAobWluaW11bSkgcmVzZXQgdGltZSBvZiAzdXMgaXMgY29uZmln
dXJlZC4gVGhlCj4gZGF0YSBzaGVldCBvZiB0aGUgR0wzNTIzIHNheXM6Cj4KPiAgICJUaGUgKGlu
dGVybmFsKSByZXNldCB3aWxsIGJlIHJlbGVhc2VkIGFmdGVyIGFwcHJveGltYXRlbHkgNDAgzrxT
IGFmdGVyCj4gICAgcG93ZXIgZ29vZC4KPgo+ICAgIFRvIGZ1bGx5IGNvbnRyb2wgdGhlIHJlc2V0
IHByb2Nlc3Mgb2YgR0wzNTIzLCB3ZSBzdWdnZXN0IHRoZSByZXNldCB0aW1lCj4gICAgYXBwbGll
ZCBpbiB0aGUgZXh0ZXJuYWwgcmVzZXQgY2lyY3VpdCBzaG91bGQgbG9uZ2VyIHRoYW4gdGhhdCBv
ZiB0aGUKPiAgICBpbnRlcm5hbCByZXNldCBjaXJjdWl0LiIKPgo+IFNpbmNlIGl0IGlzICdhcHBy
b3hpbWF0ZWx5IDQwIM68UycgSSdkIHNheSBtYWtlIHRoZSBleHRlcm5hbCByZXNldCA1MCDOvFMK
PiB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLCBpdCdzIGEgdmVyeSBzaG9ydCB0aW1lIGluIGFueSBj
YXNlLgo+CgpUaGFua3MgZm9yIHRoaXMgaW5wdXQgd2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4
dCB2ZXJzaW9uLgoKPiBQbGVhc2UgYWxzbyBhZGQgYW4gZW50cnkgZm9yIHRoZSBVU0IgMi4wIHBh
cnQgb2YgdGhlIElDLgoKYWxhcm1Ab2Ryb2lkLW4yOn4kIGxzdXNiIC10dgovOiAgQnVzIDAyLlBv
cnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMXAsIDUwMDBNCiAg
ICBJRCAxZDZiOjAwMDMgTGludXggRm91bmRhdGlvbiAzLjAgcm9vdCBodWIKICAgIHxfXyBQb3J0
IDE6IERldiAyLCBJZiAwLCBDbGFzcz1IdWIsIERyaXZlcj1odWIvNHAsIDUwMDBNCiAgICAgICAg
SUQgMDVlMzowNjIwIEdlbmVzeXMgTG9naWMsIEluYy4gR0wzNTIzIEh1YgovOiAgQnVzIDAxLlBv
cnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMnAsIDQ4ME0KICAg
IElEIDFkNmI6MDAwMiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290IGh1YgogICAgfF9fIFBvcnQg
MTogRGV2IDIsIElmIDAsIENsYXNzPUh1YiwgRHJpdmVyPWh1Yi80cCwgNDgwTQogICAgICAgIElE
IDA1ZTM6MDYxMCBHZW5lc3lzIExvZ2ljLCBJbmMuIEh1YgoKU28gZWFybGllciBwYXRjaCBhZGRz
IHN1cHBvcnQgZm9yIHRoaXMgZGV2aWNlIElELgo+Cj4gPiAgICAgICB7IC5jb21wYXRpYmxlID0g
InVzYmJkYSw0MTEiLCAuZGF0YSA9ICZyZWFsdGVrX3J0czU0MTFfZGF0YSwgfSwKPiA+ICAgICAg
IHsgLmNvbXBhdGlibGUgPSAidXNiYmRhLDU0MTEiLCAuZGF0YSA9ICZyZWFsdGVrX3J0czU0MTFf
ZGF0YSwgfSwKPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAidXNiYmRhLDQxNCIsIC5kYXRhID0g
JnJlYWx0ZWtfcnRzNTQxMV9kYXRhLCB9LAo+ID4gLS0KPiA+IDIuMzguMQo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
