Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D272BCCFA1A
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRrzpLdmbVTKJp4eIJBfkVgv/r59jX9vDtHlhmyWoZE=; b=MNtyeoYBujXue9
	BgcCS094gw+TAR8Kv0nldJr6qEVt8OC7H5knwO4carTC5PR2bLAFAaqDOVX09v5vdsWQC6bpGd+QN
	v3JW5BeTsbnxlbVs/gM+vp8DLuNoZ0EkVEyPP73hBWsmsDKBBSqLAr3Y9Ra6Z/r0pxB2SbLSdcMlo
	PQEEZQaTO1L+ggaPUnME9iz+n0jx9ym+RmXwyFgaRSfOd4/lAYKYnTKNz7CL199PsaK6LGIF6SSd0
	ZSTitl/MDUXz+wHIn12S3n3XV/4lW9iog7JiVHD9M5Eb6Y51yBhuYbIs5eG5cFYoZmM/srEpMk/wD
	dxhELIe/gs3q9BfuoQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6g-00000003Sje-179M;
	Sat, 08 Nov 2025 21:04:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6d-00000003Siu-2qns
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 21:04:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7af73974a4bso1185867b3a.0
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762635859; x=1763240659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/7GraEMhRfGX80xNeYuFThBogqrpJru9RaOOCG7cpM=;
        b=TeRLw1AQ7+mZRJ+PsJtkmXU7tu7GmvggQIuBA+koZh7JAZ3galwLJEJ8vHkqYvoM3X
         KNfFVgzjXuFEB2+WIl4YX6arifasAMuM1ZJlj9r5J2h/FgNVVT9yEJ0ETCyncT2iuOAN
         dXo7FDW3xwb2OtYvJqZIlxJfOqVf7wUDLxdNWbrb+Xygq7ER1xRSnQ2YDP7LC2wPwSPR
         xL8RubCjHkdjAi8RXXwQgoYn4npA6cagzjFWEA1PSA/+79zFituq8+TaPE4GT77y8hHR
         LvBuNZlml30AtdfnPILkkwvg6YDv84Y17vC2AdlJ+q47ddt3lSrBqg5PRojWDRSAhrDK
         vyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635859; x=1763240659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/7GraEMhRfGX80xNeYuFThBogqrpJru9RaOOCG7cpM=;
        b=OvKkHlNZboSfik0lpHBbd6FAHenuvrm8V7OgqW+DoHaPHuIoMntZvvm8jkcRN27peP
         GPQC57DC/DhVig8ARBtIQIuLOcyfHy030kq0kpMn0NoPTYEmG3sQAqoIGYH0TDWEsq76
         vdStfQacj4VYQpfkl4/FkIlIdLKEdY1OpRrk50F6MwQe+VyCu9PS0kj6lD0O/sX6d/xS
         6JarZM+f2E026SJvtKdDq3pfO3K2v0IZyILNPVzffdULkU2ukLweclSL6L9Vh3QUhutl
         UKd0EIlWRcar1LYnQ1rmwknZpWa2EZpbxvZ63+xgNe4x9686Uerr417br1pSmCAmedoP
         uGzg==
X-Forwarded-Encrypted: i=1; AJvYcCXy9nGCIGRGQEfOA5IBELLqur3pOCvtXpsMg+OIyg58E4MmTL2kFXHJt7Jt79TSg8M1ab+mwGe2kU6QyeNA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs+Vn6uOSAMWyIOZoYaDUlOMOWXtDtgX3PwxFDwhkJmW4aIB1y
	8M/tb53hpVWwFi8npSYVDC7u8d53KpOHdFENNkEkzRcU1qs5aM5fKEl7ePBzSnyKdqPchsVfAcw
	Wp/TlXCgIIfdrgsnE26pCN4HndTgGnu8=
X-Gm-Gg: ASbGncvThabHUzk1vsJQ7XLv2UvV+/BKZqfEGuAS9IFjNm4+IdzGwSp657dereTwfmF
	Bp4Y5s9xXumX1Zrfxr6pqrITtOir0zCWvMKp3XpG7ui3z/WV5Ei74cTLGBU3tNbiZmkN+mJDIao
	++3OplXi8Y63ybjGYrjTD/iXYjQYgDn6wKxpUdcchCndDOMda6Fn/KPpwQySWa86bd28v575rl1
	vp1QR0tYh6vBYJ1W9xSDF0myurAtkZ6HC5v8stuKfkohh8Fs747cACGVHtpngMLZLkjoOzNmFPV
	lhD5JMy9XacxI+lD3SOPBRKwZcm5
X-Google-Smtp-Source: AGHT+IHYseG28VeVAj+noWF9xeZjKVsK8sMaLAuq9kZaFRIKXzdbOlTmekGRfg/kBIVHWNLoWwy6INlqqqY7HWNBhaU=
X-Received: by 2002:a17:903:1a26:b0:25c:43f7:7e40 with SMTP id
 d9443c01a7336-297e1da7480mr46581775ad.10.1762635858817; Sat, 08 Nov 2025
 13:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 22:04:07 +0100
X-Gm-Features: AWmQ_bmagaCbCEB_Hmpf3J-UvtRMuC04_pkThYtgGIcc82yezqw-vegzX0N5NQA
Message-ID: <CAFBinCBSjKzHZ_k+c70B+YsJHiOS4qbjAgtnWaEeQy11xg94cA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_130419_737028_A4C320BE 
X-CRM114-Status: GOOD (  14.04  )
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

T24gRnJpLCBPY3QgMzEsIDIwMjUgYXQgOToxMOKAr0FNIENodWFuIExpdSB2aWEgQjQgUmVsYXkK
PGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhp
cyBwYXRjaCBzZXJpZXMgY29uc2lzdHMgb2YgZm91ciB0b3BpY3MgaW52b2x2aW5nIHRoZSBhbWxv
Z2ljIFBMTAo+IGRyaXZlcjoKPiAtIEZpeCBvdXQtb2YtcmFuZ2UgUExMIGZyZXF1ZW5jeSBzZXR0
aW5nLgo+IC0gSW1wcm92ZSB0aGUgaXNzdWUgb2YgUExMIGxvY2sgZmFpbHVyZXMuCj4gLSBBZGQg
aGFuZGxpbmcgZm9yIFBMTCBsb2NrIGZhaWx1cmUuCj4gLSBPcHRpbWl6ZSBQTEwgZW5hYmxlIHRp
bWluZy4KPgo+IEZvciBlYXNpZXIgcmV2aWV3IGFuZCBtYW5hZ2VtZW50LCB0aGVzZSBhcmUgc3Vi
bWl0dGVkIGFzIGEgc2luZ2xlCj4gcGF0Y2ggc2VyaWVzLgo+Cj4gVGhlIFBMTCB0aW1pbmcgb3B0
aW1pemF0aW9uIGNoYW5nZXMgd2VyZSBtZXJnZWQgaW50byBvdXIgaW50ZXJuYWwKPiByZXBvc2l0
b3J5IHF1aXRlIHNvbWUgdGltZSBhZ28gYW5kIGhhdmUgYmVlbiB2ZXJpZmllZCBvbiBhIGxhcmdl
Cj4gbnVtYmVyIG9mIFNvQ3M6Cj4gLSBBbHJlYWR5IHN1cHBvcnRlZCB1cHN0cmVhbTogRzEyQSwg
RzEyQiwgU00xLCBTNCwgQTEsIEMzLgo+IC0gUGxhbm5lZCBmb3IgdXBzdHJlYW0gc3VwcG9ydDog
VDcsIEE1LCBBNCwgUzcsIFM3RCwgUzYsIGV0Yy4KPgo+IEJhc2VkIG9uIHRoZSB1cHN0cmVhbSBj
b2RlIGJhc2UsIEkgaGF2ZSBwZXJmb3JtZWQgZnVuY3Rpb25hbCB0ZXN0aW5nCj4gb24gRzEyQSwg
QTEsIEE1LCBBNCwgVDcsIFM3LCBTN0QsIGFuZCBTNiwgYWxsIG9mIHdoaWNoIHBhc3NlZC4KSW4g
dGhlIHBhc3QgSSBoYWQgbW9zdCBwcm9ibGVtcyB3aXRoIE1lc29uOC84Yi84bTIgQ1BVIGNsb2Nr
IHNjYWxpbmcKKHZpYSBzeXNfcGxsKS4KU28gSSB0ZXN0ZWQgdGhpcyBzZXJpZXMgbG9jYWxseSB1
c2luZyB0aGUgZm9sbG93aW5nIHNoZWxsIHNjcmlwdCBvbiBhbgpPZHJvaWQtQzEgKE1lc29uOGIp
OgojIS9iaW4vYmFzaAoKQ1BVRlJFUT0iL3N5cy9idXMvY3B1L2RldmljZXMvY3B1MC9jcHVmcmVx
IgoKZWNobyAidXNlcnNwYWNlIiA+ICIke0NQVUZSRVF9L3NjYWxpbmdfZ292ZXJub3IiCgp3aGls
ZSByZWFkIC1yYSBMSU5FCmRvCiAgICBmb3IgKCggaT0wOyBpPCR7I0xJTkVbKl19OyBpKysgKSkK
ICAgIGRvCiAgICAgICAgZm9yICgoIGo9MDsgajwkeyNMSU5FWypdfTsgaisrICkpCiAgICAgICAg
ZG8KICAgICAgICAgICAgaWYgWyAkaSAhPSAkaiBdCiAgICAgICAgICAgIHRoZW4KICAgICAgICAg
ICAgICAgIGVjaG8gIiR7TElORVtpXX0gLT4gJHtMSU5FW2pdfSIKICAgICAgICAgICAgICAgIGVj
aG8gIiR7TElORVtpXX0iID4gIiR7Q1BVRlJFUX0vc2NhbGluZ19zZXRzcGVlZCIKICAgICAgICAg
ICAgICAgIHNsZWVwIDFzCiAgICAgICAgICAgICAgICBlY2hvICIke0xJTkVbal19IiA+ICIke0NQ
VUZSRVF9L3NjYWxpbmdfc2V0c3BlZWQiCiAgICAgICAgICAgICAgICBzbGVlcCAxcwogICAgICAg
ICAgICBmaQogICAgICAgIGRvbmUKICAgIGRvbmUKZG9uZSA8ICIke0NQVUZSRVF9L3NjYWxpbmdf
YXZhaWxhYmxlX2ZyZXF1ZW5jaWVzIgoKVGhpcyBoYXMgYmVlbiBydW5uaW5nIGluIGEgbG9vcCBm
b3IgdHdvIGhvdXJzIChhdCBhbiBhbWJpZW50CnRlbXBlcmF0dXJlIG9mIH4xM8KwQykgYW5kIEkg
aGF2ZW4ndCBvYnNlcnZlZCBhbnkgcHJvYmxlbS4KU2luY2UgbW9zdCBwYXRjaGVzIGFyZSBhIG5v
LW9wIGZvciBteSBjYXNlIEknbGwgc2VwYXJhdGVseSByZXBseSB0bwpwYXRjaCAjMiB3aXRoIG15
IFRlc3RlZC1ieSAoYXMgdGhhdCdzIHdoYXQgSSd2ZSBiZWVuIGVmZmVjdGl2ZWx5CnRlc3Rpbmcp
LgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
