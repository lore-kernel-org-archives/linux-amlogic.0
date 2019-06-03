Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46BCC28CC6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 11:57:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9495264A7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 11:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KxzHUSEJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftc63eNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9495264A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqyKz3liByBLIL4pYHH1u6xKerLT5+5WDNZb5AO/KV0=; b=KxzHUSEJSVWEz2
	IWSXP2XfPtO19mU2RSHIMj4BFVWdIkHEi1A845OWDUTnjXr8PKvSLSv4jS0WF8qfJZ7mFenZEyGPI
	9Zp/MmPuzqUMACxQnn6t+5gvFICb1vWHuZE/QiT9LMzi72YI5FwhlwcS/GFWWAu8L3njik10bCiSC
	p0bj7NQKYbena+IcHxxVmM9UWY7QA5rzx9kn/jVA+PEczFyWAtFe6PcBK+60d4YfRkkK2TLsIYMIL
	ovrDXacTuQiAYcmBRidGlg8i0gegRVKHFtRD0un34SogKEz1xtTDRzd8PFDh9bafakPGlLztdGKQt
	wI+9f2xEuzF09F7UdAYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXlaf-0003Sj-U4; Mon, 03 Jun 2019 11:57:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlad-0003SH-BY; Mon, 03 Jun 2019 11:57:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id u16so5529178wmc.5;
 Mon, 03 Jun 2019 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zH0gwAXR2vq1LzxeIdBnF5nu1CZS6B3eFInE+nGAFt0=;
 b=ftc63eNWKSOctdyZNlAYGAku04L0is+S+OEP4bRpRestEgSgaHcFo2bqG7Yn5YhkxE
 URi5im1qvT08UtnLoZW1ZEn3CXBoid90GtMgBV9m2m8FSEdDm1UrvVuTmxtikYKdx77O
 rcN5dliZM/eCWO4xpImtvMezKs4kqfQlvw06wgEX8N8hXUa9AVcHrflFAaaZYp/1U8ld
 Za32KkBP83weG8P1hp9UqKNMc0pdJ07OUbSTs8uWn6tMBHPvEEha6R5Yuuwls2Q7vMx3
 vD2uTAe+fqywl3lx04kqqwrT+x08HansnhIiOYTksLR0TmCs0fF+gZqrMiQ355AeE7Au
 CFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zH0gwAXR2vq1LzxeIdBnF5nu1CZS6B3eFInE+nGAFt0=;
 b=WagYjX8AL+wKTrPjBkbNkok3pW1zRUpawy1tc/xrFnAwz3PafixvnDLU+uHOVxzhp8
 RmAfpbGPSvOukTUf+VS1B6e1dB0aIQFcfZz81pkWqA8ldnuK+ZgLFR/JOWq6UjKYQ/0h
 a0/uCPqNBbvvSi19Mef/5jan+aRxr/D9lJKEDpyS83MgVNcd0QTGKlnhDOBbsn7sGV7K
 Yefhh1TpaqAAvcLURQfmupi1w7wX1VlRpOx0x2uQRwM+USt2voWFYD8B2MyAmP7ONps2
 E0KUb1Tc6n9DTOln/YyJRa0h7PXTE6Ut9vOxpIBbCvYAp/AIRCnHmNddNaygx47kxQdF
 8UaA==
X-Gm-Message-State: APjAAAUwVmNlmyuICHId+NadUJjz05umnZNOEB32NGiWcTU8v7JLcoVW
 cWfGCBGu65sMSXrBZeW0t0I=
X-Google-Smtp-Source: APXvYqyW4glgD2xmrXxBinQAo2biQZPnENKHNb36mGg6c0c3av8dimZ27SHg7BF981umISYRPDwm3g==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr4017194wmd.131.1559563041072; 
 Mon, 03 Jun 2019 04:57:21 -0700 (PDT)
Received: from [172.16.20.20] ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id 6sm27934997wrd.51.2019.06.03.04.57.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 04:57:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH 02/10] arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth
 support
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <bbf3c69f-8695-d665-c7ca-587b7e77eb4f@baylibre.com>
Date: Mon, 3 Jun 2019 15:57:17 +0400
Message-Id: <CD983BAA-CC37-455E-B78A-CF8A72ACE7A4@gmail.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-3-narmstrong@baylibre.com>
 <CAFBinCBTK=6OW4kG=i0KZe-+AzGVXyou9g0frnh9yqLsdmB5+w@mail.gmail.com>
 <b54c7899-95b3-1202-d70b-9b8ee2955164@baylibre.com>
 <CAFBinCB9PZ-mjyjCafK24cH3sN5E1r4vt1z=m+uvkHsmRW2PFQ@mail.gmail.com>
 <bbf3c69f-8695-d665-c7ca-587b7e77eb4f@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_045723_420811_DA5E65E4 
X-CRM114-Status: GOOD (  11.62  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMyBKdW4gMjAxOSwgYXQgMTI6NTcgcG0sIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4gT24gMjkvMDUvMjAxOSAyMDowOCwgTWFydGluIEJsdW1l
bnN0aW5nbCB3cm90ZToKPj4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTI6MjUgUE0gTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gMjcv
MDUvMjAxOSAyMDozNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4+PiBPbiBNb24sIE1h
eSAyNywgMjAxOSBhdCAzOjIyIFBNIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBGcm9tOiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3Rp
YW5zaGV3aXR0QGdtYWlsLmNvbT4KPj4+Pj4gCj4+Pj4+IC0gUmVtb3ZlIHNlcmlhbDEgYWxpYXMK
Pj4+Pj4gLSBBZGQgc3VwcG9ydCBmb3IgdWFydF9BIHJ0cy9jdHMKPj4+Pj4gLSBBZGQgYmx1ZXRv
b3RoIHVhcnRfQSBzdWJub2RlIHFpdGggc2h1dGRvd24gZ3Bpbwo+Pj4+IEkgdHJpZWQgdGhpcyBv
biBteSBvd24gS2hhZGFzIFZJTTI6Cj4+Pj4gQmx1ZXRvb3RoOiBoY2kwOiBjb21tYW5kIDB4MTAw
MSB0eCB0aW1lb3V0Cj4+Pj4gQmx1ZXRvb3RoOiBoY2kwOiBCQ006IFJlYWRpbmcgbG9jYWwgdmVy
c2lvbiBpbmZvIGZhaWxlZCAoLTExMCkKPj4+PiAKPj4+PiBJJ20gbm90IHN1cmUgd2hldGhlciB0
aGlzIGlzIHNwZWNpZmljIHRvIG15IGJvYXJkIG9yIHdoYXQgY2F1c2VzIHRoaXMuCj4+PiAKPj4+
IFdoaWNoIGtlcm5lbCB2ZXJzaW9uID8KPj4gNS4yLXJjMgo+PiAKPj4gaXQncyBhIEtoYWRhcyBW
SU0yIEJhc2ljICh0aHVzIGl0IGhhcyBhIEFQNjM1NlMpLCBib2FyZCByZXZpc2lvbiB2MS4yCj4g
Cj4gQ2FuIHlvdSB0cnkgd2l0aCA6Cj4gCj4gY2xvY2tzID0gPCZ3aWZpMzJrPjsKPiBjbG9jay1u
YW1lcyA9ICJscG8iOwo+IAo+IGFkZGVkIGluIHRoZSBibHVldG9vdGggbm9kZSA/CgpUZXN0ZWQg
YW5kIGNvbmZpcm1lZCB3b3JraW5nIHdpdGggcmV2IDEuMiDigJhiYXNpYycgYW5kIDUuMSBrZXJu
ZWwgd2l0aCB0aG9zZSBub2RlcyBhZGRlZC4KClZJTTI6fiAjIGRtZXNnIHwgZ3JlcCAtaSBibHVl
ClsgICAxMC43OTM2MDBdIEJsdWV0b290aDogQ29yZSB2ZXIgMi4yMgpbICAgMTAuNzkzNzkyXSBC
bHVldG9vdGg6IEhDSSBkZXZpY2UgYW5kIGNvbm5lY3Rpb24gbWFuYWdlciBpbml0aWFsaXplZApb
ICAgMTAuNzkzODE0XSBCbHVldG9vdGg6IEhDSSBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQKWyAg
IDEwLjc5MzgyMV0gQmx1ZXRvb3RoOiBMMkNBUCBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQKWyAg
IDEwLjc5Mzg1MV0gQmx1ZXRvb3RoOiBTQ08gc29ja2V0IGxheWVyIGluaXRpYWxpemVkClsgICAx
MC44MDE5MjhdIEJsdWV0b290aDogSENJIFVBUlQgZHJpdmVyIHZlciAyLjMKWyAgIDEwLjgwMTk0
NF0gQmx1ZXRvb3RoOiBIQ0kgVUFSVCBwcm90b2NvbCBINCByZWdpc3RlcmVkClsgICAxMC44MDQ5
MTldIEJsdWV0b290aDogSENJIFVBUlQgcHJvdG9jb2wgQnJvYWRjb20gcmVnaXN0ZXJlZApbICAg
MTAuODA1MDI1XSBCbHVldG9vdGg6IEhDSSBVQVJUIHByb3RvY29sIFFDQSByZWdpc3RlcmVkClsg
ICAxMS4wMTY2MjldIEJsdWV0b290aDogaGNpMDogQkNNOiBjaGlwIGlkIDEwMQpbICAgMTEuMDE4
NTM3XSBCbHVldG9vdGg6IGhjaTA6IEJDTTogZmVhdHVyZXMgMHgyZgpbICAgMTEuMDQzMTEyXSBC
bHVldG9vdGg6IGhjaTA6IEJDTTQzNTRBMgpbICAgMTEuMDQzMTM0XSBCbHVldG9vdGg6IGhjaTA6
IEJDTTQzNTZBMiAoMDAxLjAwMy4wMTUpIGJ1aWxkIDAwMDAKWyAgIDExLjA3NTkxOV0gQmx1ZXRv
b3RoOiBHZW5lcmljIEJsdWV0b290aCBTRElPIGRyaXZlciB2ZXIgMC4xClsgICAxMS4zNTk3ODRd
IEJsdWV0b290aDogQk5FUCAoRXRoZXJuZXQgRW11bGF0aW9uKSB2ZXIgMS4zClsgICAxMS4zNTk3
OTNdIEJsdWV0b290aDogQk5FUCBmaWx0ZXJzOiBwcm90b2NvbCBtdWx0aWNhc3QKWyAgIDExLjM1
OTgxMV0gQmx1ZXRvb3RoOiBCTkVQIHNvY2tldCBsYXllciBpbml0aWFsaXplZApbICAgMTcuMDc1
NTA5XSBCbHVldG9vdGg6IGhjaTA6IEJDTTQzNTZBMiAoMDAxLjAwMy4wMTUpIGJ1aWxkIDAyNjYK
CkkgdXNlIEJUIHJlbW90ZXMgdG8gYXZvaWQgaXNzdWVzIHdpdGggbXVsdGlwbGUgYm9hcmRzIHJl
c3BvbmRpbmcgdG8gSVIgc28gaXQgd2FzIHdvcmtpbmcgYmVmb3JlIGF0IHNvbWUgcG9pbnQuIEkg
YXNzdW1lIEkgZHJvcHBlZCBhIGNoYW5nZSBzb21ld2hlcmUgaW4gdGhlIHByb2Nlc3Mgb2YgZmVl
ZGluZyB5b3UgdGhlIGJhdGNoIG9mIHBhdGNoZXMgLSBhcG9sb2dpZXMhCgpDaHJpc3RpYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
