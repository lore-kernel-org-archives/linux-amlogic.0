Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05184C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 May 2025 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYt1uCJjBs1TV9F1BAC3+USOXALtMQHHxiFOJ+QaV1U=; b=rm8aq+vthkcQVS
	46uPZ99bwEKHZjuZnu/GVhuc/HUlDJK7LkE4pBuNHcACY+tmJU52oNPBEq3WtxtQa02IgKFs59wRQ
	LshtHWyCO8xpfk+qmsvPmQLlrzxC4K9vpvaUnfTT3T6dsVEks+X+i0ETuw1Z/oCdqF6+lo0aaj3EH
	B6PWV0N+amBX+kvXDIA6OWCC8uofcDT2d/6c0zdA+77Sbs07Wdz5dlfn9OJL6EWKSOAVjzJJBynQY
	x4a6d5F0WhEKn04y+2OrFLzJqq1LJPiU1lmy7R195GUBSG0fEjDMwqRFe2E7vagrXDcMVE3hYvDSP
	Ku8xLusgQIRJ3W7flU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN8w-00000008a2S-44T0;
	Mon, 12 May 2025 07:00:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN8u-00000008a1d-0Rad
	for linux-amlogic@lists.infradead.org;
	Mon, 12 May 2025 07:00:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ace94273f0dso788106466b.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 May 2025 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747033202; x=1747638002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE4W61aAOb1s0oTAzxitw/T5NG98quwd4lODU2UlHFo=;
        b=mhWUycbBOcY2nQjfhDecyx8My9SwI18+strg8RC0nF9fxoPGnszn++P9XhifFDwRkl
         V8rmX6MlUxNLZrpzln2d5qtZq+Qoo5w2amtBZL+RBgEfVBVOiEBfvkNde9BjcNr0P7fx
         bBKys0Y8n3cTWfHG0Y2RgNjZlYzzz1xfTjankmZvCZdHdxXOE4rwIVIxMLSYDHuVOney
         6jYIFWGKYiwrwlbQwgpnO3/HwB8aDsW07RH/zE/tXdx50/zhXQchd4E2fFxl0byQZi9s
         uLoU5k4epB5FKoXgdN77nlxGBK7eQnEftqmbDKjxbiIZbRmCpycGa52kFA/or5B2UWoy
         iSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747033202; x=1747638002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE4W61aAOb1s0oTAzxitw/T5NG98quwd4lODU2UlHFo=;
        b=PEVeoGV3PRK3DpkCqiJbrAYl5TGnxLwlvCIJ7NldnjHh7rWvFgeH876L4kcB6QwvC2
         gLmpKaDhPjDTp7KEU/iwsuHQm0LUyCvEvshzyDs88g2FrxuNMX3M272fvHXLwChEXzrz
         inkH6GLsilJaq1XV0XhrOij4IBBTMdUUcHf5ELYloK65uZLCv6Tr7If0wQY4ApI0z1w2
         SQvq2u8K5b0/nLAmtFFUioTiS1fc/xiLx5HIoUhaST7dGWKBLNYNRjrQtNckCRATwmhY
         OQ03UkyvjDvuBYJnEao6HVPbPXQMUk5SZJA1+Pf9f6PxEa+67EFMNIL4Sud6Fm6NY7V6
         mJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/M6y06+B/Flkq/2rESNJ+yjDnVoiXGEcbMLHJ3njNL3jTv1Ps21Mk8qtEyBQfFbJ+RaRfZfOTrvodmzWd@lists.infradead.org
X-Gm-Message-State: AOJu0YwEUJeliawv3EOYjqgzUYdeU0+x6LTPvqF4GLQIs35O0KbOxtIN
	+THPfh2hRaQWwlEvosQPgbgfO2jE5pbImfDk419WLd5Uh/SXOBLQkscBae7jhfaU5/fDA9A3aPx
	RI/rLWwo3J6dVs19afHORsqVUmQk=
X-Gm-Gg: ASbGncu/K3zogrKP0q+/I44uQjLgzkL/coMh+1K/6dHqkSOWVRDuEH16CpAx0qf15F9
	Z7PEfZ1842Sdpk2MPC4zejb0rW46RPWJqhuYTzzWf2dvT9z2HSYyeuoCVweqIVQFP33RUuaG0WO
	2HWlviPNvRjI3iye0RHWrCASYtem4LN2c=
X-Google-Smtp-Source: AGHT+IGMxSCbWcgPzDLdDPHV7TfxL8v/NW+1JmcI6bueniQxO5V4IVkVoPOd+64ynfcPW+GlQfBTX11OdkJnRa9tEGY=
X-Received: by 2002:a17:907:a4c1:b0:ace:d957:d6d8 with SMTP id
 a640c23a62f3a-ad2190246bamr985408566b.34.1747033201870; Mon, 12 May 2025
 00:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org> <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
 <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
 <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com> <CAEUiLuY2D_CzkEH0+gCvkbC_MtJ4B-MLYYkx_r2E9BHxPvuVjg@mail.gmail.com>
In-Reply-To: <CAEUiLuY2D_CzkEH0+gCvkbC_MtJ4B-MLYYkx_r2E9BHxPvuVjg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 May 2025 12:29:46 +0530
X-Gm-Features: AX0GCFuPfWHrJ33a9lpuqKkhYPNkooJHOZyZqq_x46YoNFQCXw_ATD6jRE8W2w8
Message-ID: <CANAwSgRvtgsejhsj=TyRAYWdQRfGRigvw9+=HzcdxbDopoiFYw@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Wayne Schroeder <raz@chewies.net>
Cc: Ferass El Hafidi <funderscore@postmarketos.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_000004_164918_8C747313 
X-CRM114-Status: GOOD (  33.09  )
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

SGkgV2F5bmUsCgpPbiBTdW4sIDExIE1heSAyMDI1IGF0IDAxOjUxLCBXYXluZSBTY2hyb2VkZXIg
PHJhekBjaGV3aWVzLm5ldD4gd3JvdGU6Cj4KPiBBcHBsaWVkIHBhdGNoZXMgdG8gMjAyNS4wNCBy
ZWxlYXNlIChhcHBsaWVkIGNsZWFuKS4gIE1hZGUgc3RvY2sKPiBkZWZjb25maWcgZm9yIG9kcm9p
ZCBuMiwgYnVpbHQsIHNpZ25lZCwgaW5zdGFsbGVkLiAgVGhlIHJlYm9vdCBpc3N1ZQo+IHJlbWFp
bnMgYW5kIHVzYiBwb3J0cyBhcmUgdW5hdmFpbGFibGUgdG8gbGludXgga2VybmVsIGFmdGVyIHJl
Ym9vdC4KPgo+IEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IGxpbnV4IGRvZXMgc2VlIHNvbWUgZW51
bWVyYXRpb24gb2YgZGV2aWNlcwo+IGFmdGVyIGEgd2hpbGUsIGJ1dCBldmVuIGlmIGl0IGxvZ3Mg
dG8gdGhlIGNvbnNvbGUgYWJvdXQgZGV2aWNlCj4gYXR0YWNobWVudCwgdGhlIGRldmljZXMgZG9u
J3QgYWN0dWFsbHkgZnVuY3Rpb24uICBUaGlzIHdhcyB0aGUgc2FtZQo+IGJlaGF2aW9yIHdpdGgg
dGhlIHJlbGVhc2UgdmVyc2lvbi4KPgpUaGFua3MgZm9yIHRlc3RpbmcgdGhlc2UgcGF0Y2hlcy4K
V2UgbmVlZCB0byBtb2RpZnkgdGhlIGJvb3Qgb3JkZXIgdG8gcHJvYmUgVVNCIGJlZm9yZSBNTUMK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3MvbWVzb242NC5oIGIvaW5jbHVkZS9jb25maWdz
L21lc29uNjQuaAppbmRleCBmMzI3NWIzN2E1MS4uM2FjZTU5ODgwYmQgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvY29uZmlncy9tZXNvbjY0LmgKKysrIGIvaW5jbHVkZS9jb25maWdzL21lc29uNjQuaApA
QCAtMTE5LDggKzExOSw4IEBACiAjZGVmaW5lIEJPT1RfVEFSR0VUX0RFVklDRVMoZnVuYykgXAog
ICAgICAgIGZ1bmMoUk9NVVNCLCByb211c2IsIG5hKSAgXAogICAgICAgIGZ1bmMoVVNCX0RGVSwg
dXNiZGZ1LCBuYSkgIFwKLSAgICAgICBCT09UX1RBUkdFVF9NTUMoZnVuYykgXAogICAgICAgIEJP
T1RfVEFSR0VUX0RFVklDRVNfVVNCKGZ1bmMpIFwKKyAgICAgICBCT09UX1RBUkdFVF9NTUMoZnVu
YykgXAogICAgICAgIEJPT1RfVEFSR0VUX05WTUUoZnVuYykgXAogICAgICAgIEJPT1RfVEFSR0VU
X1NDU0koZnVuYykgXAogICAgICAgIEJPT1RfVEFSR0VUX1BYRShmdW5jKSBcCgpIZXJlIGlzIHRo
ZSBib290IHNlcXVlbmNlIGF0IG15IGVuZC4KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClUtQm9v
dCAyMDI1LjA3LXJjMS0wMDIyMy1nNzA0YTRkMWZkODA0IChNYXkgMTIgMjAyNSAtIDEyOjE1OjI5
ICswNTMwKQpvZHJvaWQtbjIvbjItcGx1cwoKTW9kZWw6IEhhcmRrZXJuZWwgT0RST0lELU4yClNv
QzogICBBbWxvZ2ljIE1lc29uIEcxMkIgKFM5MjJYKSBSZXZpc2lvbiAyOTpjICg0MDoyKQpEUkFN
OiAgMSBHaUIgKHRvdGFsIDMuOCBHaUIpCkNvcmU6ICA0MDIgZGV2aWNlcywgMzAgdWNsYXNzZXMs
IGRldmljZXRyZWU6IHNlcGFyYXRlCk1NQzogICBtbWNAZmZlMDUwMDA6IDAsIG1tY0BmZmUwNzAw
MDogMQpMb2FkaW5nIEVudmlyb25tZW50IGZyb20gbm93aGVyZS4uLiBPSwpJbjogICAgdXNia2Jk
LHNlcmlhbApPdXQ6ICAgdmlkY29uc29sZSxzZXJpYWwKRXJyOiAgIHZpZGNvbnNvbGUsc2VyaWFs
CkJvYXJkIHZhcmlhbnQ6IG4yLXBsdXMKTmV0OiAgIGV0aDA6IGV0aGVybmV0QGZmM2YwMDAwCgpI
aXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAgMApzdGFydGluZyBVU0IuLi4KUmVnaXN0ZXIg
MzAwMDE0MCBOYnJQb3J0cyAzClN0YXJ0aW5nIHRoZSBjb250cm9sbGVyClVTQiBYSENJIDEuMTAK
QnVzIHVzYkBmZjUwMDAwMDogNCBVU0IgRGV2aWNlKHMpIGZvdW5kCiAgICAgICBzY2FubmluZyB1
c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAxIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5kCgpEZXZp
Y2UgMDogVmVuZG9yOiBBU01UICAgICBSZXY6IDAgICAgUHJvZDogMjExNQogICAgICAgICAgICBU
eXBlOiBIYXJkIERpc2sKICAgICAgICAgICAgQ2FwYWNpdHk6IDExNDQ3My40IE1CID0gMTExLjcg
R0IgKDIzNDQ0MTY0OCB4IDUxMikKLi4uIGlzIG5vdyBjdXJyZW50IGRldmljZQpTY2FubmluZyB1
c2IgMDoxLi4uCkNhcmQgZGlkIG5vdCByZXNwb25kIHRvIHZvbHRhZ2Ugc2VsZWN0ISA6IC0xMTAK
Q2Fubm90IHBlcnNpc3QgRUZJIHZhcmlhYmxlcyB3aXRob3V0IHN5c3RlbSBwYXJ0aXRpb24KTG9h
ZGluZyBCb290MDAwMCAnbW1jIDEnIGZhaWxlZApMb2FkaW5nIEJvb3QwMDAxICd1c2IgMCcgZmFp
bGVkCkVGSSBib290IG1hbmFnZXI6IENhbm5vdCBsb2FkIGFueSBpbWFnZQpDYXJkIGRpZCBub3Qg
cmVzcG9uZCB0byB2b2x0YWdlIHNlbGVjdCEgOiAtMTEwCnN3aXRjaCB0byBwYXJ0aXRpb25zICMw
LCBPSwptbWMxKHBhcnQgMCkgaXMgY3VycmVudCBkZXZpY2UKU2Nhbm5pbmcgbW1jIDE6MS4uLgpG
b3VuZCAvZXh0bGludXgvZXh0bGludXguY29uZgpSZXRyaWV2aW5nIGZpbGU6IC9leHRsaW51eC9l
eHRsaW51eC5jb25mCjE6ICAgICAgTWFuamFybyBBUk0KUmV0cmlldmluZyBmaWxlOiAvSW1hZ2UK
UmV0cmlldmluZyBmaWxlOiAvaW5pdHJhbWZzLWxpbnV4LmltZwphcHBlbmQ6IGluaXRyZD0vaW5p
dHJhbWZzLWxpbnV4LmltZyBjb25zb2xlPXR0eUFNTDAsMTE1MjAwbjgKcm9vdD1QQVJUVVVJRD0w
ZWZjN2MzNi0wMiByb290d2FpdCBhdWRpdD0wIGNsa19pZ25vcmVfdW51c2VkCnBseW1vdXRoLmln
bm9yZS1zZXJpYWwtY29uc29sZXMKCj4gV2F5bmUKPgo+IE9uIEZyaSwgTWF5IDksIDIwMjUgYXQg
MTA6MDHigK9BTSBXYXluZSBTY2hyb2VkZXIgPHJhekBjaGV3aWVzLm5ldD4gd3JvdGU6Cj4gPgo+
ID4gWWVzLiAgV2lsbCByZXBvcnQgYmFjayBob3cgaXQgd29ya3Mgb24gdGhlIG4yKy4KPiA+Cj4g
Pgo+ID4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjA44oCvQU0gQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgV2F5bmUsCj4gPiA+Cj4gPiA+
IE9uIEZyaSwgOSBNYXkgMjAyNSBhdCAwMToyNSwgV2F5bmUgU2Nocm9lZGVyIDxyYXpAY2hld2ll
cy5uZXQ+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSSBhY3R1YWxseSBhbHJlYWR5IGhhdmUgYSB3
b3JraW5nIHNvbHV0aW9uIHRoYXQgSSBkb2N1bWVudGVkIGluIG15Cj4gPiA+ID4gZ2l0aHViIHJl
cG8gKGR1YnNjaHJvL29kcm9pZC1uMikuICBBbGwgSSBkbyBpcyBzZXQgQk9PVENPTU1BTkQgdG8K
PiA+ID4gPiBjaGVjay9kZWxldGUgYSBmbGFnIGZpbGUgb24gbXkgYm9vdCBwYXJ0aXRpb24gYW5k
IGlmIGl0IGlzIGZvdW5kLCB0aGVuCj4gPiA+ID4gcmVzZXQgdXNiIGFuZCBzbGVlcCBmb3IgMTAg
c2Vjb25kcy4gIEkgdGhlbiBoYXZlIGEgc3lzdGVtZCBzaHV0ZG93bgo+ID4gPiA+IHNjcmlwdCBv
bmx5IG9uIHJlYm9vdCB0byB0b3VjaCB0aGF0IGZpbGUuCj4gPiA+ID4KPiA+ID4gPiBDT05GSUdf
Qk9PVENPTU1BTkQ9ImZhdHJtIG1tYyAwOjEgcmVib290ICYmIGVjaG8gUmVzZXR0aW5nIFVTQiBv
bgo+ID4gPiA+IHJlYm9vdC4uLiAmJiB1c2IgcmVzZXQgJiYgc2xlZXAgMTA7IHJ1biBkaXN0cm9f
Ym9vdGNtZCIKPiA+ID4gPgo+ID4gPiA+IEl0IGlzIGEgaGFjaywgYnV0Li4uIHRoZSBzeXN0ZW0g
cmVsaWFibHkgcmVib290cyByZW1vdGVseSBub3csIGFuZAo+ID4gPiA+IHRoYXQncyB0aGUgaW1w
b3J0YW50IHBhcnQgZm9yIG5vdy4KPiA+ID4gPgo+ID4gPiA+IFdheW5lCkkgZGlkIG5vdCBtb2Rp
ZnkgdGhpcyBhdCBteSBlbmQuIEhvd2V2ZXIsIHRoaXMgaXMgbm90IHJlcXVpcmVkIHdpdGgKdGhl
IGFib3ZlIGZpeC4KClRoYW5rcwotQW5hbmQKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgTWF5IDgs
IDIwMjUgYXQgMTE6MjLigK9BTSBGZXJhc3MgRWwgSGFmaWRpCj4gPiA+ID4gPGZ1bmRlcnNjb3Jl
QHBvc3RtYXJrZXRvcy5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFdlZCBNYXkg
NywgMjAyNSBhdCAxOjAzIFBNIFVUQywgV2F5bmUgU2Nocm9lZGVyIHdyb3RlOgo+ID4gPiA+ID4g
PiBJdCdzIGhhcmQgZm9yIG1lIHRvIHF1YW50aWZ5IGlmIHVzYiB3b3JrcyBpbiB1LWJvb3QgYXMg
SSdtIG5vdCBsb2FkaW5nCj4gPiA+ID4gPiA+IG9mZiBvZiBhbnkgdXNiIHN0b3JhZ2UgZGV2aWNl
cy4gIEl0IGNlcnRhaW5seSBuZXZlciBsZXRzIG1lIHVzZSB0aGUKPiA+ID4gPiA+ID4ga2V5Ym9h
cmQgdG8gYWJvcnQgYXV0byBib290LCBhbmQgbmV2ZXIgaGFzLiAgT24gcmVib290LCB0byByZWxp
YWJseQo+ID4gPiA+ID4KPiA+ID4gPiA+IFlvdSBjYW4gc2VuZCBieXRlcyB2aWEgVUFSVCB0byBh
Ym9ydCBib290LCBpZiB5b3UgaGFwcGVuIHRvIGhhdmUgYSBVQVJUCj4gPiA+ID4gPiBhZGFwdGVy
IGFyb3VuZC4KPiA+ID4gPgo+ID4gPiBDYW4geW91IHRlc3QgdGhpcyBzZXJpZXMgdG8gc2VlIGlm
IHRoaXMgcmVzb2x2ZXMgdGhlIGlzc3VlPwo+ID4gPgo+ID4gPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvdWJvb3QvbGlzdC8/c2VyaWVzPTQ1NjA4OAo+ID4gPgo+ID4gPiBU
aGFua3MKPiA+ID4gLUFuYW5kCj4gPiA+Cj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dAo+ID4gPiA+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
