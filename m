Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A90C369C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Apr 2025 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i1hREitFoI4c714LxaLAg9Mi1oZlO5lby3mw/rFTQg=; b=DFYjhqoQai9DD8
	3Y6Lcnz0lkSTh6FNTYMwKeyO90sreSE11DdqtGPVdRJVWVMj9P7/9z4fZc0yxPq/nD2gza0rQnx+2
	OeSFKYPyBAdPccH3vriUMP9gERn6Q0U1TFpnn3U2S82Esni/Gd8zWtkqUyv50dJIjyeOjl8ERHh69
	5+nJ1ginsVTSIGZORskXn2fYfiOAK1aeVo27EhLJ82VGVK2UwpbsY/4UR7Fy0NMAnviZAMaN6E61S
	6Wll6F8NxpRVs/sU8XMYBS5NyDyNeiAizXW92AVP6f/J2ZmaytRcAaElHHuHk9vy5wHKjBlxBpeCT
	i5Xza+TTLPEPUG3o+CVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XzW-00000002nuQ-41yK;
	Sun, 20 Apr 2025 16:58:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xuu-00000002nWv-2um0;
	Sun, 20 Apr 2025 16:53:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c336fcdaaso35782795ad.3;
        Sun, 20 Apr 2025 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167996; x=1745772796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=CtED3q5VDI5DQZlEJVN0EBpn1I+nVE9GiWMkBHJohdBg6xhzK5KS+++kpY5bQDphs0
         Jn4ZR4yOl+BJLQOHiKmr9xydosgZjndcKz/H1rJ+/UrAlZxlActoGuLLEXFeAwLu2IIY
         UG+SBiKGDlaNky/OjORemq7+5KTXC/I4SyA/h/VZwSVhOzXuvuMiXulI/wVGLCaBK3VL
         q1SwAaoNygfjzKhN1cQ3r7Sf33jgscguXrOaXJKEnsgoEygAWGjMuGuMcoHxT0gpUXj5
         YuJl4noHtA8PSBhdWzqQzXueQhI+UN+ZxBNt82uW8q4wTqQuXDOkzhB5TIpPVCYgNK++
         MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167996; x=1745772796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=JWqqiRnyTnnOyXYHBT3eTtso8rxpPFXFvyIXlrZpYmTaVhxl44nZMi8xM0rkJm8u2R
         usoIW9Ve52MKhrIymKhMzfZtHFqCD3uGo8qkl/oGBUI4c8PUG825hLRfKCFtdrcRiAQO
         eimIu5JRB/YDwC+vzpB/K79wU1EkFczHDANK5Y2zONu0fuwvwT4zH9gcPylgsRGeHVob
         IryszIcchYcxKYDM2qDeCEky/6FwLf2xi2YAcwFve6YAhtHeZzgIiZ95vBkN2dmwXXOY
         9LuGsLpIzTi5qVAQsVlWaXfHxr2HOn9kRt3nyWcfH95E7O38KHztl4U7iOqm7mLXLK5X
         42tw==
X-Forwarded-Encrypted: i=1; AJvYcCX9zR7OSbpBpbMVYHrX1PebpA72mUrAeHmRhHSuTQNhdebp4ltVdAY6virzK0E8ui5TNPOf/s32TAgMsKg9Whqh@lists.infradead.org
X-Gm-Message-State: AOJu0YyTe98bSOsupoEIXu7yRMhSS+UrsiqTOPtNv345KOnqE7QPWnZM
	0q/h3/l4smxsui2VzANgMkWWpIQVl0ATzgj6MWFKpEyzPguyek3wVuuORRGiJor01WhmtwH1n+b
	l5xihnhK6SRIyXFO8Ogd4K1SZO84=
X-Gm-Gg: ASbGncsSSb5gl1W77m5mB4nGNiERxVURg+k7SvMg6IVpFr0NeMeuBJPW3VL9CY8NrRp
	x43GXJqTgbFPi+LRowTT3zrQdh7S212LM9LGBtPFpCdq2jyxFEZIBD1poyTC5gBdvGSLTEAfC/W
	Va0bkcIw2af/bX/wfPkegKfFhQBkM6RE6lJQXgCIIQT18+ebY=
X-Google-Smtp-Source: AGHT+IH8DzvTiy4h+KL4U19Sci4voDMK4mciBQ4BPN22Pz+pQoaq5S9v0/nWEx5fqmVPXETBHXM/RT+poBdLM+MB/+0=
X-Received: by 2002:a17:902:f684:b0:223:635d:3e2a with SMTP id
 d9443c01a7336-22c535c0760mr127312745ad.23.1745167995675; Sun, 20 Apr 2025
 09:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com> <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
In-Reply-To: <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 20 Apr 2025 18:53:04 +0200
X-Gm-Features: ATxdqUHEOYPXXRr0KRgABoAXqlDBucnLKVCiuCrN19sebvABvHD_xIDDHJKPPek
Message-ID: <CAFBinCC7HrT_fD0zYudtj10SNiajwq-OSC7ceeoNrz2neChptg@mail.gmail.com>
Subject: Re: [PATCH 0/5] dts: amlogic: switch to the new PWM controller binding
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_095316_737908_634C7DFE 
X-CRM114-Status: GOOD (  25.15  )
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

T24gU3VuLCBBcHIgMjAsIDIwMjUgYXQgOTo0NeKAr0FNIENocmlzdGlhbiBIZXdpdHQKPGNocmlz
dGlhbkBoZXdpdHRmYW1pbHkub3JnLnVrPiB3cm90ZToKPgo+ID4gT24gMjggRGVjIDIwMjQsIGF0
IDE6MjXigK9hbSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBzZXJpZXMgc3dpdGNoZXMgYWxsIEFtbG9n
aWMgU29DcyB0byB1c2UgdGhlIG5ldyBQV00gY29udHJvbGxlcgo+ID4gYmluZGluZy4gVGhlIG1h
aW4gYmVuZWZpdHMgb2YgdGhlIG5ldyBiaW5kaW5nIGFyZToKPiA+IC0gdGhlIHB3bSBjb250cm9s
bGVyIGRyaXZlciBub3cgcGlja3MgdGhlIGJlc3QgcG9zc2libGUgY2xvY2sgdG8KPiA+ICBhY2hp
ZXZlIHRoZSBtb3N0IGFjY3VyYXRlIHB3bSBvdXRwdXQKPiA+IC0gYm9hcmQuZHRzIGRvbid0IGhh
dmUgdG8ga25vdyBhYm91dCB0aGUgcHdtIGNsb2NrIGlucHV0cyBhbnltb3JlIChhcwo+ID4gIHRo
ZSBkcml2ZXIgcGlja3MgdGhlIGJlc3Qgb25lIGF1dG9tYXRpY2FsbHkpCj4gPiAtIG5ldyBTb0Nz
IG9ubHkgbmVlZCBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyBidXQgbm8gcHdtLW1lc29uIGRyaXZl
cgo+ID4gIGNoYW5nZXMsIGFzc3VtaW5nIG9ubHkgdGhlIGNsb2NrIGlucHV0cyBkaWZmZXIgZnJv
bSBvbGRlciBJUAo+ID4gIHJldmlzaW9ucwo+ID4KPiA+IFRoaXMgc2lsZW5jZXMgdGhlIGZvbGxv
d2luZyB3YXJuaW5nKHMpIGF0IGJvb3QgKGZvciBlYWNoIHB3bQo+ID4gY29udHJvbGxlciBpbnN0
YW5jZSk6Cj4gPiAgdXNpbmcgb2Jzb2xldGUgY29tcGF0aWJsZSwgcGxlYXNlIGNvbnNpZGVyIHVw
ZGF0aW5nIGR0Cj4gPgo+ID4gSSBoYXZlIHRlc3RlZCB0aGlzIG9uIHR3byBkZXZpY2VzOgo+ID4g
LSBtZXNvbjhiOiBvZHJvaWRjMSAoYm9vdHMgZmluZSBhbmQgY3ljbGluZyB0aHJvdWdoIGFsbCBD
UFUKPiA+ICBmcmVxdWVuY2llcyBhbmQgdGh1cyB2b2x0YWdlcyB3b3JrcyBmaW5lKQo+ID4gLSBt
ZXNvbi1zbTE6IHg5Ni1haXItZ2JpdCAoYm9vdHMgYW5kIHRoZSBydHc4ODIyY3MgU0RJTyBjYXJk
IGlzCj4gPiAgZGV0ZWN0ZWQsIHNvIHRoZSAzMmtIeiBjbG9jayBmb3IgdGhlIFNESU8gY2FyZCB3
b3JrcykKPiA+Cj4gPiBTaW5jZSBJIGNhbm5vdCB0ZXN0IGFsbCBkZXZpY2VzIEknbSBhc2tpbmcg
Zm9yIHRoaXMgc2VyaWVzIHRvIGJlCj4gPiBhcHBsaWVkIHNvIHRoZSBLZXJuZWwgQ0kgYm9hcmQg
ZmFybSBjYW4gaGVscCB2ZXJpZnkgaXQgd29ya3Mgb24gYWxsCj4gPiBib2FyZHMgYXZhaWxhYmxl
IHRoZXJlLgo+Cj4gVGhpcyBzZXJpZXMgYnJlYWtzIEJyb2FkY29tIEJUIG9uIHRoZSBHWEJCL0dY
TS9HMTJCIGJvYXJkcyBpbiBteQo+IGN1cnJlbnQgdGVzdCByb3RhdGlvbi4gSeKAmW0gcnVubmlu
ZyBMaW51eCA2LjE0LjIgd2l0aCB0aGlzIHNlcmllcwo+IGJhY2twb3J0ZWQgZm9yIHRlc3Rpbmcu
IFRoaXMgaXMgZ2VuZXJhbGx5IHdoYXTigJlzIHNlZW4gaW4gZG1lc2c6Cj4KPiBWSU0yOn4gIyBk
bWVzZyB8IGdyZXAgLWkgYmx1ZQo+IFsgICAgOC42NTk1MzVdIEJsdWV0b290aDogQ29yZSB2ZXIg
Mi4yMgo+IFsgICAgOC42NTk2ODFdIE5FVDogUmVnaXN0ZXJlZCBQRl9CTFVFVE9PVEggcHJvdG9j
b2wgZmFtaWx5Cj4gWyAgICA4LjY1OTY5MF0gQmx1ZXRvb3RoOiBIQ0kgZGV2aWNlIGFuZCBjb25u
ZWN0aW9uIG1hbmFnZXIgaW5pdGlhbGl6ZWQKPiBbICAgIDguNjU5NzEyXSBCbHVldG9vdGg6IEhD
SSBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQKPiBbICAgIDguNjU5NzIxXSBCbHVldG9vdGg6IEwy
Q0FQIHNvY2tldCBsYXllciBpbml0aWFsaXplZAo+IFsgICAgOC42NTk3NDJdIEJsdWV0b290aDog
U0NPIHNvY2tldCBsYXllciBpbml0aWFsaXplZAo+IFsgICAgOC43MjQ4OThdIEJsdWV0b290aDog
SENJIFVBUlQgZHJpdmVyIHZlciAyLjMKPiBbICAgIDguNzI0OTUzXSBCbHVldG9vdGg6IEhDSSBV
QVJUIHByb3RvY29sIEg0IHJlZ2lzdGVyZWQKPiBbICAgIDguNzI1MTA2XSBCbHVldG9vdGg6IEhD
SSBVQVJUIHByb3RvY29sIFRocmVlLXdpcmUgKEg1KSByZWdpc3RlcmVkCj4gWyAgICA4LjcyNTQz
NF0gQmx1ZXRvb3RoOiBIQ0kgVUFSVCBwcm90b2NvbCBCcm9hZGNvbSByZWdpc3RlcmVkCj4gWyAg
ICA4LjcyNTUwMl0gQmx1ZXRvb3RoOiBIQ0kgVUFSVCBwcm90b2NvbCBRQ0EgcmVnaXN0ZXJlZAo+
IFsgICAgOC43MjU1NTldIEJsdWV0b290aDogSENJIFVBUlQgcHJvdG9jb2wgQU1MIHJlZ2lzdGVy
ZWQKPiBbICAgIDguOTY2NzI3XSBCbHVldG9vdGg6IGhjaTA6IEZyYW1lIHJlYXNzZW1ibHkgZmFp
bGVkICgtODQpCj4gWyAgICA4Ljk2Njc3Ml0gQmx1ZXRvb3RoOiBoY2kwOiBGcmFtZSByZWFzc2Vt
Ymx5IGZhaWxlZCAoLTg0KQo+IFsgICAxMS4xNDgxNTddIEJsdWV0b290aDogaGNpMDogY29tbWFu
ZCAweGZjMTggdHggdGltZW91dAo+IFsgICAxMS4xNDgzODNdIEJsdWV0b290aDogaGNpMDogQkNN
OiBmYWlsZWQgdG8gd3JpdGUgdXBkYXRlIGJhdWRyYXRlICgtMTEwKQo+IFsgICAxMS4xNDg0NDZd
IEJsdWV0b290aDogaGNpMDogRmFpbGVkIHRvIHNldCBiYXVkcmF0ZQo+IFsgICAxMy4yODE1MTBd
IEJsdWV0b290aDogaGNpMDogY29tbWFuZCAweGZjMTggdHggdGltZW91dAo+IFsgICAxMy4yODE1
NzZdIEJsdWV0b290aDogaGNpMDogQkNNOiBSZXNldCBmYWlsZWQgKC0xMTApCj4KPiBUaGlzIGlz
IGFsc28gdmlzaWJsZSBvbiBhIFZJTTMgYm9hcmQgaW4ga2VybmVsY2kgKExpbnV4IDYuMTUuLXJj
Mik6Cj4KPiBodHRwczovL2Rhc2hib2FyZC5rZXJuZWxjaS5vcmcvdGVzdC9tYWVzdHJvJTNBNjdm
ZDNjZGEzMzI4ZTA0M2U5NmRhMjMwP2w9dHJ1ZQo+Cj4gWyAzLjk1NDI2N10gQmx1ZXRvb3RoOiBo
Y2kwOiBGcmFtZSByZWFzc2VtYmx5IGZhaWxlZCAoLTg0KQo+IFsgNC4wNDA1NTVdIEJsdWV0b290
aDogaGNpMDogRnJhbWUgcmVhc3NlbWJseSBmYWlsZWQgKC04NCkKPgo+IChsaW51eC1maXJtd2Fy
ZSBhbmQgdGh1cyBrZXJuZWxjaSBpcyBsYWNraW5nIEJyb2FkY29tIEJUIGZpcm13YXJlcyBzbwo+
IGxhdGVyIG1lc3NhZ2VzIHRoYXQgcmVzdWx0IGZyb20gdHJ5aW5nIHRvIGxvYWQgZncgYXJlbuKA
mXQgc2VlbikKPgo+IFdpdGggdGhlIHNlcmllcyByZXZlcnRlZDoKPgo+IFZJTTI6fiAjIGRtZXNn
IHwgZ3JlcCAtaSBibHVlCj4gWyAgICA4LjQ1MjU3MF0gQmx1ZXRvb3RoOiBDb3JlIHZlciAyLjIy
Cj4gWyAgICA4LjQ1MjY5NV0gTkVUOiBSZWdpc3RlcmVkIFBGX0JMVUVUT09USCBwcm90b2NvbCBm
YW1pbHkKPiBbICAgIDguNDUyNzAzXSBCbHVldG9vdGg6IEhDSSBkZXZpY2UgYW5kIGNvbm5lY3Rp
b24gbWFuYWdlciBpbml0aWFsaXplZAo+IFsgICAgOC40NTI3MjRdIEJsdWV0b290aDogSENJIHNv
Y2tldCBsYXllciBpbml0aWFsaXplZAo+IFsgICAgOC40NTI3MzVdIEJsdWV0b290aDogTDJDQVAg
c29ja2V0IGxheWVyIGluaXRpYWxpemVkCj4gWyAgICA4LjQ1Mjc1Ml0gQmx1ZXRvb3RoOiBTQ08g
c29ja2V0IGxheWVyIGluaXRpYWxpemVkCj4gWyAgICA4LjUzMDA3N10gQmx1ZXRvb3RoOiBIQ0kg
VUFSVCBkcml2ZXIgdmVyIDIuMwo+IFsgICAgOC41MzAxMTNdIEJsdWV0b290aDogSENJIFVBUlQg
cHJvdG9jb2wgSDQgcmVnaXN0ZXJlZAo+IFsgICAgOC41MzAzODddIEJsdWV0b290aDogSENJIFVB
UlQgcHJvdG9jb2wgVGhyZWUtd2lyZSAoSDUpIHJlZ2lzdGVyZWQKPiBbICAgIDguNTMwOTAyXSBC
bHVldG9vdGg6IEhDSSBVQVJUIHByb3RvY29sIEJyb2FkY29tIHJlZ2lzdGVyZWQKPiBbICAgIDgu
NTMwOTgzXSBCbHVldG9vdGg6IEhDSSBVQVJUIHByb3RvY29sIFFDQSByZWdpc3RlcmVkCj4gWyAg
ICA4LjUzMTAzN10gQmx1ZXRvb3RoOiBIQ0kgVUFSVCBwcm90b2NvbCBBTUwgcmVnaXN0ZXJlZAo+
IFsgICAgOC45MTc2ODVdIEJsdWV0b290aDogaGNpMDogQkNNOiBjaGlwIGlkIDEwMQo+IFsgICAg
OC45MTgwMDBdIEJsdWV0b290aDogaGNpMDogQkNNOiBmZWF0dXJlcyAweDJmCj4gWyAgICA4Ljkx
OTUyNl0gQmx1ZXRvb3RoOiBoY2kwOiBCQ000MzU0QTIKPiBbICAgIDguOTE5NTYwXSBCbHVldG9v
dGg6IGhjaTA6IEJDTTQzNTZBMiAoMDAxLjAwMy4wMTUpIGJ1aWxkIDAwMDAKPiBbICAgIDguOTQx
ODM3XSBCbHVldG9vdGg6IGhjaTA6IEJDTTQzNTZBMiAnYnJjbS9CQ000MzU2QTIuaGNkJyBQYXRj
aAo+IFsgICAgOS44MzEzMjFdIEJsdWV0b290aDogaGNpMDogQkNNOiBmZWF0dXJlcyAweDJmCj4g
WyAgICA5LjgzMjg4NF0gQmx1ZXRvb3RoOiBoY2kwOiBCQ000MzU2IDM3LjRNSHogQU1QQUsgQVA2
MzU2LTAwNTUKPiBbICAgIDkuODMyOTAyXSBCbHVldG9vdGg6IGhjaTA6IEJDTTQzNTZBMiAoMDAx
LjAwMy4wMTUpIGJ1aWxkIDAyNjYKPiBbICAgIDkuODU2MDQ0XSBCbHVldG9vdGg6IE1HTVQgdmVy
IDEuMjMKPgo+IEFuIFNNTDU0NFRXIGJvYXJkIChTOTA1RCkgd2l0aCBhIFFDQTkzNzcgY2hpcCBp
cyBub3QgYWZmZWN0ZWQgYnkgdGhlCj4gY2hhbmdlcyBzbyB0aGUgc2NvcGUgYXBwZWFycyB0byBi
ZSBsaW1pdGVkIHRvIEJyb2FkY29tIEJULgo+Cj4gSeKAmXZlIGFsc28gbm90aWNlZCB0aGF0IFZJ
TTMgYW5kIHRoZSBTTUw1NDQyVFcgaGF2ZSBkZXZpY2UtdHJlZSBpdGVtcwo+IGxpa2UgbWF4LXNw
ZWVkLCBjbG9ja3MsIGNsb2NrLW5hbWVzIGRlZmluZWQsIGJ1dCBhZGRpbmcgdGhlc2UgdG8gZS5n
Lgo+IGEgV2VUZWsgUGxheTIgYm9hcmQgb3IgcmVtb3ZpbmcgZnJvbSBWSU0zIGRvZXNu4oCZdCBj
aGFuZ2UgYW55dGhpbmcuClRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMgLSBhIGZpeCBoYXMgYmVl
biBzdWJtaXR0ZWQgaGVyZTogWzBdCgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWFtbG9naWMvMjAyNTA0MjAxNjQ4MDEuMzMwNTA1LTEtbWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbS9ULyN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
