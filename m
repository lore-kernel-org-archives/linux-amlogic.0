Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56334C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhaDEBg1ab6F28W1I2aHmXq1evGXvkW+M9dSQdjH1TQ=; b=w3bmHvKHG4PlfE
	7AMyNbm4WndmA7HGGpmCY1NTaDUPtY15BHHML3FPchJlirnWphmnTHd7jMwdb8D/4zfbyIQIfDiUZ
	L9E/d0KrmU3fQsLrbyJpYlP/uy7RIR4RrDmVwEhQdn8UQGr0xeZ/expLqdqAh9ekPV3oa9+9sbaKT
	8madioTNwmpIOev8jz+swNTK4ZjtRTNxdHAgmeMaeglhmr4TRKlxpq+5RD1a+bdZ0EDl7flmmFE2R
	b0S9kUxBNcYg/HHdb0AG7aPg4sIo2ZnCgyoM8YEhmGg9tPBnyQmFPJd0h/bORAH70sxVqEGXPhGj4
	74TsmFHD4h9iAsVFj4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuup-002Ye4-GU; Mon, 09 Jan 2023 16:22:27 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuum-002YbW-6l
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 16:22:26 +0000
Received: by mail-il1-x136.google.com with SMTP id a9so4443788ilp.6
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jan 2023 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QndtQI2o6re4w2RYBTL5OxpJzOImlGMaOEhW7Zae+9M=;
        b=WzIC8fjcuKllwFvHeuf6Di+xuXmcnowMUee2CyNGyq0I/0wOGnCTTRvF5sSSvke2Cs
         4qRkRkwjl3GBA4HOmgvJeKtRjDXkA3JzOz/OEDoLac79cmbXHbwG/+UBN5F5al78wP/3
         r/DXvZ9glcboYLdmKO3AaU/yoJhdPQV031X9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QndtQI2o6re4w2RYBTL5OxpJzOImlGMaOEhW7Zae+9M=;
        b=d2cWlAR9YEWRVcdbTVesS1o5oTHxlYEWmcTQpDPHtEzHfTzhCXfenRMpLe8BxlUEEJ
         X8luBKNw8tddirbDkWk6r9z832c0LiD0BOtVaz6QnfmG+Ny+ykcKOxtC++FLqLpmLWHk
         SA+5LhP4LDWQ0GcR4Borvgeeu9mIO1jivcfOUhppl5kRFR2vTkmre2EM2TZZDsOIi+sN
         3RazVu9K4r7Cy8uIGR5Cr1wj6SRG3vMTrsck6d93vjFhOz5nkzv3DWp3uoj/CHVw3D6K
         zM8bsdXS3iAIuivguCJuar+TYQmeLAagsMLCb020KVCtyO0zM+Zycxvud2O3kLulPuu0
         XHbg==
X-Gm-Message-State: AFqh2kq5K029pC2e7KVxOlLZYf1g+KOm4NYBDrrJLmaaPT60RsKl2eLi
	aomy4kK1GHtxR81vHYx+N9/0UGSRFhGIL2Gc
X-Google-Smtp-Source: AMrXdXvHvRaI4beu0Y1w/VI0e+6oiYx7N6DNui5fQPfvHVuMFL1KdHzU42J6VSGBQscfH3Iqbeibfg==
X-Received: by 2002:a05:6e02:1d89:b0:30d:7cf4:5d5a with SMTP id h9-20020a056e021d8900b0030d7cf45d5amr15522385ila.23.1673281341493;
        Mon, 09 Jan 2023 08:22:21 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id y1-20020a92c981000000b0030392271239sm2828271iln.8.2023.01.09.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 08:22:21 -0800 (PST)
Date: Mon, 9 Jan 2023 16:22:20 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/11] usb: misc: onboard_usb_hub: add Genesys Logic
 GL3523-QFN76 hub support
Message-ID: <Y7w/PGMrjHFAjHNH@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-7-linux.amoon@gmail.com>
 <Y7Xk/lPUshC+U8OQ@google.com>
 <CANAwSgTySFm3o-9JcTTiKMHN-8w510DKNFKKxwz3PjA6DDQwHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgTySFm3o-9JcTTiKMHN-8w510DKNFKKxwz3PjA6DDQwHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_082224_498587_65F6AD66 
X-CRM114-Status: GOOD (  35.03  )
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

T24gU2F0LCBKYW4gMDcsIDIwMjMgYXQgMDg6Mjg6MTFQTSArMDUzMCwgQW5hbmQgTW9vbiB3cm90
ZToKPiBIaSBNYXR0aGlhcywKPiAKPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnRzLAo+
IAo+IE9uIFRodSwgNSBKYW4gMjAyMyBhdCAwMjoxMywgTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEFuYW5kLAo+ID4KPiA+IE9uIFdlZCwgRGVj
IDI4LCAyMDIyIGF0IDEwOjAzOjE1QU0gKzAwMDAsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiA+IEdl
bmVzeXMgTG9naWMgR0wzNTIzLVFGTjc2IGlzIGEgNC1wb3J0IFVTQiAzLjEgaHViIHRoYXQgaGFz
IGEgcmVzZXQgcGluIHRvCj4gPiA+IHRvZ2dsZSBhbmQgYSA1LjBWIGNvcmUgc3VwcGx5IGV4cG9y
dGVkIHRob3VnaCBhbiBpbnRlZ3JhdGVkIExETyBpcwo+ID4gPiBhdmFpbGFibGUgZm9yIHBvd2Vy
aW5nIGl0Lgo+ID4gPgo+ID4gPiBBZGQgdGhlIHN1cHBvcnQgZm9yIHRoaXMgaHViLCBmb3IgY29u
dHJvbGxpbmcgdGhlIHJlc2V0IHBpbiBhbmQgdGhlIGNvcmUKPiA+ID4gcG93ZXIgc3VwcGx5Lgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuYyB8
IDEgKwo+ID4gPiAgZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuaCB8IDEgKwo+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmMgYi9kcml2ZXJzL3VzYi9taXNj
L29uYm9hcmRfdXNiX2h1Yi5jCj4gPiA+IGluZGV4IGMwZThlNmY0ZWMwYS4uNjk5MDUwZWIzZjE3
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1Yi5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfaHViLmMKPiA+ID4gQEAgLTQx
MCw2ICs0MTAsNyBAQCBzdGF0aWMgdm9pZCBvbmJvYXJkX2h1Yl91c2JkZXZfZGlzY29ubmVjdChz
dHJ1Y3QgdXNiX2RldmljZSAqdWRldikKPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2Rl
dmljZV9pZCBvbmJvYXJkX2h1Yl9pZF90YWJsZVtdID0gewo+ID4gPiAgICAgICB7IFVTQl9ERVZJ
Q0UoVkVORE9SX0lEX0dFTkVTWVMsIDB4MDYwOCkgfSwgLyogR2VuZXN5cyBMb2dpYyBHTDg1MEcg
VVNCIDIuMCAqLwo+ID4gPiAgICAgICB7IFVTQl9ERVZJQ0UoVkVORE9SX0lEX0dFTkVTWVMsIDB4
MDYxMCkgfSwgLyogR2VuZXN5cyBMb2dpYyBHTDg1MkctT0hHIFVTQiAyLjAgKi8KPiA+ID4gKyAg
ICAgeyBVU0JfREVWSUNFKFZFTkRPUl9JRF9HRU5FU1lTLCAweDA2MjApIH0sIC8qIEdlbmVzeXMg
TG9naWMgR0wzNTIzLVFGTjc2IFVTQiAzLjEgKi8KPiA+Cj4gPiBQbGVhc2UgZHJvcCB0aGUgJy1R
Rk43Nicgc3VmZml4LiBUaGUgR0wzNTIzIGNvbWVzIGluIGRpZmZlcmVudCBwYWNrYWdlcywgJ1FG
Tjc2Jwo+ID4gaXMgb25lIG9mIHRoZW0sIEknZCBleHBlY3QgdGhlIG90aGVyIHBhY2thZ2VzIHRv
IHVzZSB0aGUgc2FtZSBwcm9kdWN0IGlkLgo+ID4KPiA+IFRoZSBHTDM1MjMgaXMgYSBzaW5nbGUg
SUMsIGhvd2V2ZXIgbGlrZSB0aGUgVEkgVVNCODA0MSBvciB0aGUgUlRTNTQxNCBpdAo+ID4gcHJv
dmlkZXMgYm90aCBhIFVTQiAzLjEgYW5kIGEgVVNCIDIuMCBodWIuIFlvdSBzaG91bGQgYWxzbyBh
ZGQgYW4gZW50cnkgZm9yCj4gPiB0aGUgVVNCIDIuMCBodWIgaGVyZS4KPiA+Cj4gCj4gT2ssCj4g
Cj4gPiA+ICAgICAgIHsgVVNCX0RFVklDRShWRU5ET1JfSURfTUlDUk9DSElQLCAweDI1MTQpIH0s
IC8qIFVTQjI1MTRCIFVTQiAyLjAgKi8KPiA+ID4gICAgICAgeyBVU0JfREVWSUNFKFZFTkRPUl9J
RF9SRUFMVEVLLCAweDA0MTEpIH0sIC8qIFJUUzU0MTEgVVNCIDMuMSAqLwo+ID4gPiAgICAgICB7
IFVTQl9ERVZJQ0UoVkVORE9SX0lEX1JFQUxURUssIDB4NTQxMSkgfSwgLyogUlRTNTQxMSBVU0Ig
Mi4xICovCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1
Yi5oIGIvZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9odWIuaAo+ID4gPiBpbmRleCAyZWUx
YjAwMzJkMjMuLmIzMmZhZDNhNzBmOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvbWlz
Yy9vbmJvYXJkX3VzYl9odWIuaAo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9taXNjL29uYm9hcmRf
dXNiX2h1Yi5oCj4gPiA+IEBAIC0zMiw2ICszMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG9uYm9hcmRfaHViX21hdGNoW10gPSB7Cj4gPiA+ICAgICAgIHsgLmNvbXBhdGli
bGUgPSAidXNiNDUxLDgxNDIiLCAuZGF0YSA9ICZ0aV90dXNiODA0MV9kYXRhLCB9LAo+ID4gPiAg
ICAgICB7IC5jb21wYXRpYmxlID0gInVzYjVlMyw2MDgiLCAuZGF0YSA9ICZnZW5lc3lzX2dsODUw
Z19kYXRhLCB9LAo+ID4gPiAgICAgICB7IC5jb21wYXRpYmxlID0gImdlbmVzeXMsdXNiNWUzLDYx
MCIsIC5kYXRhID0gJmdlbmVzeXNfZ2w4NTBnX2RhdGEsIH0sCj4gPiA+ICsgICAgIHsgLmNvbXBh
dGlibGUgPSAiZ2VuZXN5cyx1c2I1ZTMsNjIwIiwgLmRhdGEgPSAmZ2VuZXN5c19nbDg1MGdfZGF0
YSwgfSwKPiA+Cj4gPiBzL2dlbmVzeXMsLy8KPiA+Cj4gPiBUaGlzIHJldXNlcyB0aGUgc2V0dGlu
Z3Mgb2YgdGhlIEdMODUwRyBodWIsIHdoaWNoIGRvZXNuJ3Qgc2VlbSBjb3JyZWN0IGluCj4gPiB0
aGlzIGNhc2UuIEZvciB0aGUgR0w4NTBHIGEgKG1pbmltdW0pIHJlc2V0IHRpbWUgb2YgM3VzIGlz
IGNvbmZpZ3VyZWQuIFRoZQo+ID4gZGF0YSBzaGVldCBvZiB0aGUgR0wzNTIzIHNheXM6Cj4gPgo+
ID4gICAiVGhlIChpbnRlcm5hbCkgcmVzZXQgd2lsbCBiZSByZWxlYXNlZCBhZnRlciBhcHByb3hp
bWF0ZWx5IDQwIM68UyBhZnRlcgo+ID4gICAgcG93ZXIgZ29vZC4KPiA+Cj4gPiAgICBUbyBmdWxs
eSBjb250cm9sIHRoZSByZXNldCBwcm9jZXNzIG9mIEdMMzUyMywgd2Ugc3VnZ2VzdCB0aGUgcmVz
ZXQgdGltZQo+ID4gICAgYXBwbGllZCBpbiB0aGUgZXh0ZXJuYWwgcmVzZXQgY2lyY3VpdCBzaG91
bGQgbG9uZ2VyIHRoYW4gdGhhdCBvZiB0aGUKPiA+ICAgIGludGVybmFsIHJlc2V0IGNpcmN1aXQu
Igo+ID4KPiA+IFNpbmNlIGl0IGlzICdhcHByb3hpbWF0ZWx5IDQwIM68UycgSSdkIHNheSBtYWtl
IHRoZSBleHRlcm5hbCByZXNldCA1MCDOvFMKPiA+IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIGl0
J3MgYSB2ZXJ5IHNob3J0IHRpbWUgaW4gYW55IGNhc2UuCj4gPgo+IAo+IFRoYW5rcyBmb3IgdGhp
cyBpbnB1dCB3aWxsIHVwZGF0ZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gCj4gPiBQbGVh
c2UgYWxzbyBhZGQgYW4gZW50cnkgZm9yIHRoZSBVU0IgMi4wIHBhcnQgb2YgdGhlIElDLgo+IAo+
IGFsYXJtQG9kcm9pZC1uMjp+JCBsc3VzYiAtdHYKPiAvOiAgQnVzIDAyLlBvcnQgMTogRGV2IDEs
IENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaS1oY2QvMXAsIDUwMDBNCj4gICAgIElEIDFkNmI6
MDAwMyBMaW51eCBGb3VuZGF0aW9uIDMuMCByb290IGh1Ygo+ICAgICB8X18gUG9ydCAxOiBEZXYg
MiwgSWYgMCwgQ2xhc3M9SHViLCBEcml2ZXI9aHViLzRwLCA1MDAwTQo+ICAgICAgICAgSUQgMDVl
MzowNjIwIEdlbmVzeXMgTG9naWMsIEluYy4gR0wzNTIzIEh1Ygo+IC86ICBCdXMgMDEuUG9ydCAx
OiBEZXYgMSwgQ2xhc3M9cm9vdF9odWIsIERyaXZlcj14aGNpLWhjZC8ycCwgNDgwTQo+ICAgICBJ
RCAxZDZiOjAwMDIgTGludXggRm91bmRhdGlvbiAyLjAgcm9vdCBodWIKPiAgICAgfF9fIFBvcnQg
MTogRGV2IDIsIElmIDAsIENsYXNzPUh1YiwgRHJpdmVyPWh1Yi80cCwgNDgwTQo+ICAgICAgICAg
SUQgMDVlMzowNjEwIEdlbmVzeXMgTG9naWMsIEluYy4gSHViCj4gCj4gU28gZWFybGllciBwYXRj
aCBhZGRzIHN1cHBvcnQgZm9yIHRoaXMgZGV2aWNlIElELgoKRG8gSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSB0aGF0IDB4MDYxMCBpcyB0aGUgcHJvZHVjdCBpZCBvZiBib3RoIHRoZQpHTDg1MkcgWzFd
IGFuZCB0aGUgVVNCIDIgcGFydCBvZiB0aGUgR0wzNTIzICh0aGUgYWJvdmUgJ2xzdXNiJwpvdXRw
dXQpPwoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC11c2Iv
cGF0Y2gvMjAyMjEyMjgxMDAzMjEuMTU5NDktMi1saW51eC5hbW9vbkBnbWFpbC5jb20vCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
