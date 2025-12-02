Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAC9CFD376
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6XKf17PlLcYU45Fag5m9kz3NuXhQrOTYkLNCAA3Xdc=; b=G3vURzEwsSSLW/
	5etIO6cXD1NAsvnjSXznLwiwLaT+omOel9A/2R+DmVkan6HIEBX7g9nMsX8hAl5ntGUmT529pLjPc
	N1fbEY3+LSvg8WI7Upqbj7l2utdGkdQVdeW9xRlnA0EWd+kIcmKmlIhoubgb4Qf8/0qtnTZtAZ2Xc
	/UjuIFpmP9mOmNljRj8g0UggksAVn/VROnwMKRXUJYvAhrG+ZTbqwzPN3wrGNBvjtTBZPJKakuES0
	SzXzKR+G95HvWUdBCQ1JDMnlLJoLzClYHA1S61w58vmbSBzHKDfjHlzAKC3WVQbtEfOANTijjKbWD
	qXq3BrmeKuEzbMmSM/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLlQ-000000053JN-1JeG;
	Tue, 02 Dec 2025 08:29:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLlO-000000053If-49TS
	for linux-amlogic@bombadil.infradead.org;
	Tue, 02 Dec 2025 08:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=; b=Gkb+dD0I7zQga/f+ubdktFau0u
	3h3AAqP4Phg2SsRUlq81ldB3h56+NxHmwsf4L/w1Mv0yCBk84KsYCs5GGs/pGTookj6wZHtpHsRxK
	BoqUsnS/RRK/3IcfxAcEOoxF5N/pZjM0sEQikpqvZgWeIe9PSU5w2lljR4ZEjjtuc7+pY/Wh38CYv
	medv4HqAehLp39QkduEHjDWhyMWbjZtPrhPPW+ytb14kviGe+yZtIxmZ6d+uk/1YpmzOn7LqpC3Ze
	AEpDtRbde/5Z1s7NyAJ6yWre8eXXHlCkCpToMZVygo6EXTHV6UQGpbFyC494Qvql+phei8u5L+3qI
	dhvDptmQ==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKtf-0000000HU2T-2pO3
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Dec 2025 07:34:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso4096915a12.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Dec 2025 00:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764664162; x=1765268962; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
        b=MG6VwAWHzkQw17/l/A+L9plTlafcRXLCTiyRlN3SufLhrSYn5ynsKGNhLYBgX6ToG1
         IgHyH1Zs6CQt7mNhbxoXhkcPXwnvnLflfMTB9UKrbke7E14JKpkY6wPlQl+IwgismL1s
         5nffCXFYitP7c/RBrhH4MwEOy12UlPOoHyscSZbmxTtIKPgd1SsAlsv6ukQWpDveCEtH
         eTY1ah5PCGXELeMW3LBgGBeOk+cllffT1wYTwzUs1AqTwinLnR5Ld0hBOIMNJGWBcP/+
         5vW7ysqCEdhgJxfbBRno9GvhnFM1rdCTcBt/guNZPyB13BoisAeI52ig0PRmApfbwPC4
         1V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664162; x=1765268962;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcgzur0HEUNJflCgkpwrwXAczgebSEaHIRN6YepyWwU=;
        b=oTYTKOAXscTkoh6W2H3CGGQc/BKffD8WrxppjI6Wq3ZAw3B+BPnrEuJLUKxDuYJ17J
         WDsu/Lm5WjJ0Been2o/FRB3ZhG6AzC7/tHQOSdJUxnzExp8ukSAPqFMmFrCHxGNqpPq1
         A0eYtdUIa31FThOd4tDAZSgegbszjS43Gk1uQjjxF2ve2m+Hq/mgegx8MLfWROwJb5mS
         CSfIcJoVzNSZZ43RGPqh6PiLt3gbDY2YuwnxyU9lhVzv7s8YSwduRVr5erdPaXAUeOqQ
         BISbow73vQjmBk0X5FkBcqAhs7PaC2mIj6H4GIkBVN0Ek6t0tcll4uF8Th1ud45dUKYX
         vQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtOjBWgIJnQtqEpfbcRBB0oX5tDgYaIo6twbTlGKdMOO6sZEQVwOMChJZ40V0W+h90KSpT8XuCf/2dd5DU@lists.infradead.org
X-Gm-Message-State: AOJu0YziHRuwVs/KV+xHC4AqoAVo8JmjiJV8Rpj3JL0yOSMyxh1JQmZp
	zkhN5bmtDf2AwWzrVgbaSnXuvEcJMcuPjRZj9a92VUZpMFvGkIyyET4J
X-Gm-Gg: ASbGncuKOu4Xua6lobWg6utmcEPQcyOl++pHZw94I5CubxaYRVkExDNnp/FuozzuGhQ
	fgEpS4QjE1kYjGIrdtfX/eDkeU4/NCqumaA2tCF1/BllTjqZk40XiDvJOvyPpzx8BXlt1aMineB
	bLo2xJOxvBSkLKNlEbVDQ/HR8flJ704VfG3U4WaqwBgACXjjPK4bsqZewJZVpE2Cq+qLPSKtKR+
	uwDvw61nsesW0CE5kRrgDV6IoJ3Lo/iLhGbsEPIPm100/sSwNi3GTfj1DAmvwrPuOge3VPLHlk2
	X3G8lHbl8i8u8WFNWMvcJtHWJ+Utjal2//93eWrxZQrX7ybINkFTmW9Xf6WWpJVDJ2/pP7BnGFI
	A9H68DiRudh2XnbsvZluQdCnyiTBq2IIer9wAbdytdj4eD6zyaP/yf8C6naAvNEkAH0Jt+b+z+f
	jPjJiX6/g2jkv5h/l9O00/VvOXuIuPM2JKkSoKiqNpvQ0izDjajhsRNQkV9Rv2zdfiPZyJg3EtP
	x4=
X-Google-Smtp-Source: AGHT+IHjEo3dTSPtXuaE0YTbWgrbA87SGNQIz1itunkq73Jcs/neO8kKvVs5IxH7P+kpLe+c3V08gg==
X-Received: by 2002:a05:6402:280d:b0:647:62ba:123b with SMTP id 4fb4d7f45d1cf-647892a97a6mr1662944a12.9.1764664161284;
        Tue, 02 Dec 2025 00:29:21 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90e44sm14669936a12.14.2025.12.02.00.29.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Dec 2025 00:29:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Tue, 2 Dec 2025 09:29:07 +0100
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
To: Ao Xu <ao.xu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_073404_010062_10611036 
X-CRM114-Status: GOOD (  16.84  )
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

QW8sCkFueSBjaGFuY2UgZm9yIHVwZGF0ZWQgczQgaGRtaSBzZXJpZXMgZm9yIDYuMTg/CiAKCj4g
V2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPiB3IGRu
aXUgMjEgbGlzIDIwMjUsIG8gZ29kei4gMDM6NTU6Cj4gCj4gSGkgUGlvdHLvvIwKPiAKPiAgICAg
SSB3aWxsIGNoZWNrIHRoaXMgaXNzdWUKPiAKPiDlnKggMjAyNS8xMS8xOSAxODoyNywgUGlvdHIg
T25pc3pjenVrIOWGmemBkzoKPj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBwaW90
ci5vbmlzemN6dWtAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4gCj4+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+PiAKPj4gUGxzIHNlZSBpbmxpbmUKPj4gCj4+PiBXaWFkb21vxZvEhyBu
YXBpc2FuYSBwcnpleiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gdyBkbml1IDE5
IGxpcyAyMDI1LCBvIGdvZHouIDAzOjU3Ogo+Pj4gCj4+PiBIaSBQaW90ciwKPj4+IAo+Pj4gCj4+
PiBPbiAxMS8xOC8yMDI1IDEwOjUwIFBNLCBQaW90ciBPbmlzemN6dWsgd3JvdGU6Cj4+Pj4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBwaW90ci5vbmlzemN6dWtAZ21haWwuY29tLiBM
ZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0KPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+PiBBbywKPj4+
PiBJcyB0aGVyZSBhbnkgY2hhbmNlIHRvIGdldCB0aGlzIHM0IGRybSBoZG1pIHNlcmllcyBmb3Ig
Y3VycmVudCA2LjE4Pwo+Pj4+IChpIHRyaWVkIGJhY2twb3J0IHRoaXMgc2VyaWVzIHRvIDYuMTgg
YnV0IGhhdmUgc29tZSBpc3N1ZXMgd2l0aCByZXBhcmVudCB2cHVfMF9zZWwgdG8gc3lzY2xrX2Jf
c2VsKQo+Pj4gV2h5IGRvIHdlIG5lZWQgdG8gcmVwYXJlbnQgdnB1XzBfc2VsIHRvIHN5c2Nsa19i
X3NlbD8gaXMgdGhlcmUgYW55Cj4+PiBiYWNrZ3JvdW5kIGhlcmU/Cj4+IFdlbGwgLSBpdCBsb29r
cyBpdCBpcyBiZWNhdXNlIGJ1Zy4uLi4KPj4gTWFydGluIEJsdW1lbnN0aW5nbCBoYWQgcGVyZmVj
dCBleWUgYW5kIGNhdGNoIHR5cG8gaW4gcGF0Y2ggaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwMTEwLWRybS1zNC12MS0xMS1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vOgo+PiAKPj4g
QnkgcmVwbGFjaW5nOgo+PiBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGtjX3BlcmlwaHMg
Q0xLSURfRkNMS19ESVYzPiwKPj4gPDA+LCAvKiBEbyBOb3RoaW5nICovCj4+IDwmY2xrY19wZXJp
cGhzIENMS0lEX1ZQVV8wPiwKPj4gPCZjbGtjX3BlcmlwaHMgQ0xLSURfRkNMS19ESVY0PiwKPj4g
PDA+LCAvKiBEbyBOb3RoaW5nICovCj4+IDwmY2xrY19wZXJpcGhzIENMS0lEX1ZBUEJfMD47Cj4+
IAo+PiB3aXRoOgo+PiBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGtjX3BsbCBDTEtJRF9G
Q0xLX0RJVjM+LAo+PiA8MD4sIC8qIERvIE5vdGhpbmcgKi8KPj4gPCZjbGtjX3BlcmlwaHMgQ0xL
SURfVlBVXzA+LAo+PiA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElWND4sCj4+IDwwPiwgLyogRG8g
Tm90aGluZyAqLwo+PiA8JmNsa2NfcGVyaXBocyBDTEtJRF9WQVBCXzA+Owo+PiAKPj4gZG1lc2cg
aXMgbGlrZSB0aGlzIGh0dHBzOi8vdGVybWJpbi5jb20vNjAyMAo+PiAKPj4gU28gaSdtIGdldHRp
bmcgaGRtaSB3b3JraW5nIC0gYnV0IG9ubHkgd2hlbiBkZXZpY2UgYm9vdHMgX3dpdGhvdXRfIGNv
bm5lY3RlZCBoZG1pIGF0IGJvb3QgKGFuZCBjb25uZWN0ZWQgbGF0ZXIpCj4+IElmIGhkbWkgaXMg
Y29ubmVjdGVkIGF0IGJvb3QgLSBib290IGhhbmdzIGF0Ogo+PiAKPj4gICAgIDAuMzQxNjc2XSBt
ZXNvbi1kdy1oZG1pIGZlMzAwMDAwLmhkbWktdHg6IERldGVjdGVkIEhETUkgVFggY29udHJvbGxl
ciB2Mi4wMWEgd2l0aCBIRENQIChtZXNvbl9kd19oZG1pX3BoeSkKPj4gWyAgICAwLjM0Mjc1MF0g
bWVzb24tZHctaGRtaSBmZTMwMDAwMC5oZG1pLXR4OiByZWdpc3RlcmVkIERlc2lnbldhcmUgSERN
SSBJMkMgYnVzIGRyaXZlcgo+PiBbICAgIDAuMzQzNjYwXSBtZXNvbi1kcm0gZmYwMDAwMDAudnB1
OiBib3VuZCBmZTMwMDAwMC5oZG1pLXR4IChvcHMgbWVzb25fZHdfaGRtaV9vcHMpCj4+IFsgICAg
MC4zNDQ4MzJdIFtkcm1dIEluaXRpYWxpemVkIG1lc29uIDEuMC4wIGZvciBmZjAwMDAwMC52cHUg
b24gbWlub3IgMAo+PiAKPj4gRllJOiBJdCBpcyBhZnRlciBhcHBseWluZyBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1sb2dpYy9jb3Zlci8yMDI1MDExMC1kcm0t
czQtdjEtMC1jYmMyZDVlZGFhZThAYW1sb2dpYy5jb20vIG9uIG1haW5saW5lIDYuMTggKHdpdGgg
c29tZSBteSBhZGp1c3RtZW50cyBvbiB0aGlzIHNlcmllcyByZXF1aXJlZCBieSBjaGFuZ2VzIGlu
IDYuMTgpLgo+PiBGb3IgVlBVIGNsayBjaGFuZ2VzIHNlZSBodHRwczovL2dpdGh1Yi5jb20vd2Fy
cG1lL21pbmlteXRoMi9ibG9iL21hc3Rlci9zY3JpcHQva2VybmVsL2xpbnV4LTYuMTgvZmlsZXMv
MDMxMi1kcm0tbWVzb24tYWRkLXZwdS1jbGstc2V0dGluZy1mb3ItUzQucGF0Y2gKPj4gSXQgaXMg
Ni4xOCBhZGFwdGF0aW9uIG9mIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1hbWxvZ2ljL3BhdGNoLzIwMjUwMTEwLWRybS1zNC12MS05LWNiYzJkNWVkYWFlOEBhbWxv
Z2ljLmNvbS8KPj4gCj4+IEFzIGtlcm5lbCBoYW5ncyAtIGkgaGF2ZSBsaW1pdGVkIGNhcHMgdG8g
ZHJpbGwgd2hlcmUgcm9vdCBjYXVzZSBpcy4KPj4gCj4+IE1heWJlIGFib3ZlIGhhbmcgaXMgcmVh
c29uIG9mIG15IGJhY2twb3J0cyBvciBtaXNzaW5nIGFueSBwcmUtcmVxIHJlcXVpcmVkIHRvIGdl
dCBzNCBkcm0gd29ya2luZz8KPj4gQW55d2F5IC0gaXQgd2lsbCBiZSBnb29kIHRvIHRlc3Qgd2l0
aCB1cGRhdGVkIHRvIDYuMTggc2VyaWVzIG9mIEFkZCBEUk0gc3VwcG9ydCBmb3IgQW1sb2dpYyBT
NCAocGx1cyBpbmZvIGFib3V0IGFueSBwcmUtcmVxIHJlcXVpcmVkIHRvIGdldCBzNCBkcm0gd29y
a2luZykKPj4gCj4+IAo+Pj4gVGhlIHZwdV9jbGsgb24gUzQgZG9lc24ndCBzdXBwb3J0IHN5c2Ns
a19iX3NlbCBhcyBvbmUgb2YgaXRzCj4+PiBzZWxlY3RhYmxlIGNsb2NrIHNvdXJjZXMsIHNvIHRo
aXMgcmVwYXJlbnQgb3BlcmF0aW9uIHdpbGwgZGVmaW5pdGVseQo+Pj4gZmFpbC4gVGhpcyBoYXMg
bm90aGluZyB0byBkbyB3aXRoIHRoZSBrZXJuZWwgdmVyc2lvbi4KPj4+IAo+Pj4+PiBXaWFkb21v
xZvEhyBuYXBpc2FuYSBwcnpleiBBbyBYdSB2aWEgQjQgUmVsYXkgPGRldm51bGwrYW8ueHUuYW1s
b2dpYy5jb21Aa2VybmVsLm9yZz4gdyBkbml1IDEwIHN0eSAyMDI1LCBvIGdvZHouIDA2OjM5Ogo+
Pj4+PiAKPj4+Pj4gRnJvbTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+PiAKPj4+Pj4g
QWRkIGRldmljZXRyZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+Pj4+PiAKPj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW8gWHUgPGFvLnh1QGFtbG9naWMuY29tPgo+Pj4+PiAtLS0KPj4+
Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNv
bi1kdy1oZG1pLnlhbWwgfCAxICsKPj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4+Pj4+IAo+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+Pj4+
PiBpbmRleCA4NGQ2OGI4Y2ZjY2M4NmZkODdhNmEwZmQyYjcwYWYxMmU1MWViOGE0Li42ZTBhODM2
OWVlZTkxNWZhYjU1YWYyNGQ0NTBhNmM0MGUwOGRlZjM4IDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhk
bWkueWFtbAo+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+Pj4+PiBAQCAtNTUsNiArNTUsNyBAQCBw
cm9wZXJ0aWVzOgo+Pj4+PiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1neC1kdy1o
ZG1pCj4+Pj4+ICAgICAgIC0gZW51bToKPj4+Pj4gICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1n
MTJhLWR3LWhkbWkgIyBHMTJBIChTOTA1WDIsIFM5MDVZMiwgUzkwNUQyKQo+Pj4+PiArICAgICAg
ICAgIC0gYW1sb2dpYyxtZXNvbi1zNC1kdy1oZG1pICMgUzQgKFM5MDVZNCkKPj4+Pj4gCj4+Pj4+
ICAgcmVnOgo+Pj4+PiAgICAgbWF4SXRlbXM6IDEKPj4+Pj4gCj4+Pj4+IC0tCj4+Pj4+IDIuNDMu
MAo+Pj4+PiAKPj4+Pj4gCj4+Pj4+IAo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Pj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4+
PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+Pj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdAo+Pj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
YwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
