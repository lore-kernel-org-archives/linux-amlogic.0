Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEF2E77188
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2025 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOUg90eYPNyNcp3JeIjkfJ/E2uM71sz70Ru20KGYbfA=; b=YTQLX/NnqhIvDq
	h5Tbu6JcRbKJcddB5MZZhw34NsWPBsa+9jCVQ6bs3psaiwGJEBRmUIKeOBZ3uiAzm/E53MkHxVJ17
	0wsQeF/ulm5PRIRGw3qYKIcU6UJKB2gCE51FVBkgMc2f/Zwwte3WR3r2ffQvGeyO47ac7xG6tAnVa
	gDrztd530gLoYyI9Y2nFtR3hxvDgaksS861MMp4uFc9BDGqsIpS1wJLD+SFI/UDWL/YWqjRaVkKCD
	aO4SW+EKgIIVrjaBYGCmaCteP6EtXHOlUYWX3Xtw/P5nWF+STCooWoJRj4cfRiiDXIoirIzp+oZf8
	BICVPEy0u2T8/9thzWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd7y-00000009pzM-2X0U;
	Wed, 08 Jan 2025 20:58:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVd6g-00000009pqi-2iAV;
	Wed, 08 Jan 2025 20:56:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso1940695ad.2;
        Wed, 08 Jan 2025 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736369809; x=1736974609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSdUqdwrauCyORBsaipaRx5uPIDRCF7bNyQAUTlnqs8=;
        b=Nhp5o7FZ87kIpp5IpwQRLvpo3xcjicOngK3ruaQ9/1HlDJMxNBa6k1Yh5hK3AoJi97
         cbio+hcpjtIcY5rFyYLNTtV5dH87igmy1CpON6qV5Xpafts9/MFBOGRuypO7E26R41PX
         aMXs72c78z4TRbbH7KvEcbjmJRBDLzX11MBojsohDrVWCmSWSCp9cqQH+UGD/qr6H4q2
         04A/DGgab15HH7UJTLvzMHkI4+xN4AGJyoZrlg6Gw2zb4I/W2J+LKF+A4XdIX/qq7nlZ
         EoQCzQjchM0Sum2PBpX9Vlc0TDGZG+YZrjevcbghKEl2fpjayDfjk/Ldq+avPcCZU8af
         4kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736369809; x=1736974609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSdUqdwrauCyORBsaipaRx5uPIDRCF7bNyQAUTlnqs8=;
        b=OUXSu+UkmD3TkGTnppP25vVBA+gyzUi/QP/ejo80xZcWXC1JSZrZ0lMnfdAWvb4u7W
         rEc+3GxLE7QKaCynH0KjD0faPsS+JQ6rInEHtpMK6KQXKD2cEIcHkagy8sWPss5rQP+y
         hZxppZAEjalFnk6POTm5f0W18X3RG+/m7TdezZlgFF2xtS2U8Ymdm5UDtg8zbrXkD6hS
         4gZ6e0nALPH9FyK47hOtCsqKdArPYXceEK7Dyeyr4SQ3tuR4chn1XANOhZZJ6OiztfW1
         4bisETDwO4Wg5y9aEKwHwATeLgY3L7ZhZEWbLlMj4ir0mcUxNQfh+fw5dYy85wih9W44
         HYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm8Kko1vG3H2UqXY5iZVQ6nh0TxI4qV0rN88k1S1oGSY0pwwvKBvxDFHqomnxbvKWiymM9zAGAduouuiTxB6sRXg==@lists.infradead.org, AJvYcCWVClvwI5QMS0W8ZTYIS+SXnHKA4DmtG0SwvtChVZFJh0rrxmLRzHgYdSPw1ULTVSYMk5QQ5n1pJmoH78wb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz05IVrXKV+5OcrvY0bR/gQZi17WpnyQWCTZ8qMPgt4qYTBhz7L
	/icw+37KzyzLxIK5+LV+wNo5PySmKfGMlD1Ma4QtJABNZnhY9EOvnHPMf6VMB9fLNtycsgEYO9a
	rZtec2YcIuYXzhMnMH4XjdxxkRdc=
X-Gm-Gg: ASbGncugwlraKDrnB1Ji5Vl/VHaZO0PTRgGv+wLRaiIGUHv7F2sW+xhhNz+poKFMpVt
	GS/zSnqOaw7e3qDxUOriy8pEyPJyYyOM1nUfMmdbKCQF/+DuUAur66FOeIZvmBd3xIl/t/Zg=
X-Google-Smtp-Source: AGHT+IGOW27FHokf8sgObdZCgih5wBSNSIeA7bOubCTLpiyN4Z4nB0G4BwyHZiUuJKOgDby83TB0PieIAwmC2MWNzz0=
X-Received: by 2002:a17:903:41c3:b0:216:6590:d472 with SMTP id
 d9443c01a7336-21a83f4e4f8mr59615275ad.21.1736369808857; Wed, 08 Jan 2025
 12:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
 <20241219-scenic-revision-17da9231d61a@spud> <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
 <CAFBinCCxZjuXL0duy3ePPDtL1oJS_GZiX3=djXpHR+-6gLkN_w@mail.gmail.com> <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
In-Reply-To: <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jan 2025 21:56:37 +0100
X-Gm-Features: AbW1kvb98S1fSQRIIu1Gd-WnPy0Ge9shDwipgShzVZZxxYskdFEoJKeN27AkIW0
Message-ID: <CAFBinCAO0bpd7PXaVJWMby4Mqj1On5DaqNZua4V3gPUDms8=LA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
To: Dharma.B@microchip.com
Cc: conor@kernel.org, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_125650_684614_873F3576 
X-CRM114-Status: GOOD (  11.16  )
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

SGkgRGhhcm1hLAoKT24gV2VkLCBKYW4gOCwgMjAyNSBhdCA0OjEx4oCvQU0gPERoYXJtYS5CQG1p
Y3JvY2hpcC5jb20+IHdyb3RlOgpbLi4uXQo+ICJPbmUgaXNzdWUgaXMgJ2NvbXBhdGlibGUnIGlz
IHJlcXVpcmVkLiBFaXRoZXIgdGhhdCB3b3VsZCBoYXZlIHRvIGJlCj4gZHJvcHBlZCBhcyByZXF1
aXJlZC4iCj4KPiBJbnN0ZWFkIG9mIGp1c3QgZHJvcHBpbmcgaXQgZnJvbSAicmVxdWlyZWQ6Iiwg
SSByZW1vdmVkIHRoZSBwcm9wZXJ0eQo+IGl0c2VsZiBhbmQgbW92ZWQgaXQgdG8gYW5vdGhlciBi
aW5kaW5nLgo+Cj4gSSB3aWxsIHNlbmQgYSB2MiBieSByZW1vdmluZyBpdCBmcm9tIHRoZSByZXF1
aXJlZCwgd2lsbCBpdCBiZSBmaW5lPwpGb3IgbWUgdGhpcyBpcyBmaW5lLgoKTXkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IGlmIHdlIGRyb3AgdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgY29tcGxldGVs
eQp0aGVuIGFueSBjb21wYXRpYmxlIHN0cmluZyB3aWxsIGJlIGFsbG93ZWQgKGZvciBleGFtcGxl
OiBjb21wYXRpYmxlID0KInJhbmRvbSxuYW1lIikuIFRoaXMgaXMgYmVjYXVzZSBtbWMtc2xvdC55
YW1sIGluaGVyaXRzIHRoZSBwcm9wZXJ0aWVzCmZyb20gbW1jLWNvbnRyb2xsZXItY29tbW9uLnlh
bWwgd2hpY2ggaXRzZWxmIGhhcwoiYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUiLgpIb3dldmVy
LCBpZiB3ZSBhbGxvdyBpdCBidXQgbWFrZSBpdCBvcHRpb25hbCBpdCBtZWFucyB0aGF0IHRoZXJl
J3MKb25seSB0d28gdmFsaWQgc3RhdGVzOgotIG5vIGNvbXBhdGlibGUgcHJvcGVydHkgKG9uIHRo
ZSBBdG1lbCAvIE1pY3JvY2hpcCBTb0NzKQotIGEgY29tcGF0aWJsZSBwcm9wZXJ0eSB3aXRoIHRo
ZSB2YWx1ZSAibW1jLXNsb3QiIChhcyB1c2VkIG9uIEFtbG9naWMKTWVzb24gYW5kIENhdml1bSBU
aHVuZGVyIFNvQ3MpCi0gKGFueXRoaW5nIGVsc2UgaXMgY29uc2lkZXJlZCBpbnZhbGlkKQoKUm9i
LCBDb25vcjogY2FuIGNvbmZpcm0gdGhpcyBvciBjb3JyZWN0IG1lIHdoZXJldmVyIEkgZ290IHNv
bWV0aGluZyB3cm9uZy4KSSBob3BlIHRoYXQgeW91ciBmZWVkYmFjayB3aWxsIGhlbHAgRGhhcm1h
IHdyaXRlIGEgZ29vZCBwYXRjaApkZXNjcmlwdGlvbiBmb3IgdjIuCgoKQmVzdCByZWdhcmRzLApN
YXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
