Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A2D167E7
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44kYNzpNDFrlULdBUZ4kRzNyLj66VVybhEBBqJpFKUI=; b=U05ojzBxG+e1vI
	HwokAdkf3fAru9uOcDm2SWtlQKDvh8iF6wf9GYzyF5n377EDjFOPLHpLuAgaVRb/nQEqxiH/1tm/C
	TngoKI+c7MgV5KmFLQLM9ErVBY+sKiqfNqgIES2c5419CQfLuiOsV2ANTS1d4RoCK/uB0lZexvPWU
	aFSfnjQX/wbayfQLj2tgKjhs6DLNt96oGRw1li3V57Uxw8X7dy14cokPDsAu27AIevZu57QO6XxiT
	ru30FFuQnrcZ92oK+pFtDUVwbSWPXZySDTn9GN5UR1ClfXK10aAscLt/Z6KywSzgC/4yPd7P/Lg06
	n7Sk2eSHlBLULFVB6ugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pW-000000021GQ-4AQ1;
	Fri, 09 Jan 2026 09:30:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pU-000000021Fz-46bt
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 09:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08FBE60136
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B633EC19421
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951047;
	bh=6LNdm3fUgjKNrloN/NydUJPrfwSNFkztsLyEogcqh/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hu7+oOeN1CG6qA4cqOd65h7eTJRVtcKJ3o8a7JrrBjmyiyeyd8g3/uch0eUalhG/d
	 EMWtRORiXIOoxHNQgaHvM6xf5UirHxHmfnPLE34i54UfeYOG8uD+O72ewmJOhQvrOX
	 Fb+82va25549OQTLb7sFjXJ/XnqKbDc8HRPdT94nLHFFMIUfIelVV1nbyR62IEBdWh
	 F7JvWPg5FoncdSX9Xa5XAbsWXyBDqD525oTOU20B3c6Ij+jiwfWqFVbIgJbGJvYG4t
	 YHSiWA4FzOKY/R+qjWIUt/kKXq1X5sjLS6SkjXfvNy/nFnZ4iDiHVqdcShysGAnU/v
	 IlWna3lwVNzVA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79045634f45so46093637b3.1
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 01:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRIfqYgUB4do7JmtdeY5/Fu2VgZsogZEkR7smvdkctv8mc/xnIEg5qFvlb4htWQHBuQXfnv3jAXzKXUiPj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+eOGEkOTbXRTi02EkaRF82QZ+uhDzxQ06ZgVKLSC/EjM8TS/O
	4DltPinFeI7+v5/WOsU70EeHpE+vQXQyINXkOuzWHp25HJnTu28xqOqxUYqVrzmoFeE8r1V4TAn
	jgu+1by6PMBLZ8V2zBiu370Y1Vdfr19c=
X-Google-Smtp-Source: AGHT+IHW9AloGVPNneim+o5wu5kst869KHt4MS2BcIEWf1BhFWXSHQH3d/MN0P4Js6T3JHk+sgUFV5uMx0nD8b2J3Z0=
X-Received: by 2002:a05:690c:6c08:b0:788:14a2:8bda with SMTP id
 00721157ae682-790b580708bmr83145167b3.38.1767951047030; Fri, 09 Jan 2026
 01:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:30:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
X-Gm-Features: AZwV_QifJwM8PVt6EB8CPnUaPiq8Laa3KkCYXyF0XiD2OsUIzet-cnQ9j7hifFk
Message-ID: <CAD++jLkHTX-bJ6Fi7n2kGX3VvEk4eaBfTDc+vpd-2QWQvKWfSQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
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

T24gTW9uLCBKYW4gNSwgMjAyNiBhdCA0OjA14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKCj4gVGhlIEdQSU8gY29u
dHJvbGxlciBpcyBjb25maWd1cmVkIGFzIG5vbi1zbGVlcGluZyBidXQgaXQgdXNlcyBnZW5lcmlj
Cj4gcGluY3RybCBoZWxwZXJzIHdoaWNoIHVzZSBhIG11dGV4IGZvciBzeW5jaHJvbml6YXRpb24u
Cj4KPiBUaGlzIGNhbiBjYXVzZSB0aGUgZm9sbG93aW5nIGxvY2tkZXAgc3BsYXQgd2l0aCBzaGFy
ZWQgR1BJT3MgZW5hYmxlZCBvbgo+IGJvYXJkcyB3aGljaCBoYXZlIG11bHRpcGxlIGRldmljZXMg
dXNpbmcgdGhlIHNhbWUgR1BJTzoKPgo+IEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZy
b20gaW52YWxpZCBjb250ZXh0IGF0Cj4ga2VybmVsL2xvY2tpbmcvbXV0ZXguYzo1OTEKPiBpbl9h
dG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAxLCBub25fYmxvY2s6IDAsIHBpZDogMTQyLCBu
YW1lOgo+IGt3b3JrZXIvdTI1OjMKPiBwcmVlbXB0X2NvdW50OiAxLCBleHBlY3RlZDogMAo+IFJD
VSBuZXN0IGRlcHRoOiAwLCBleHBlY3RlZDogMAo+IElORk86IGxvY2tkZXAgaXMgdHVybmVkIG9m
Zi4KPiBpcnEgZXZlbnQgc3RhbXA6IDQ2Mzc5Cj4gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAo
NDYzNzkpOiBbPGZmZmY4MDAwODEzYWNiMjQ+XQo+IF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSsweDc0LzB4NzgKPiBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0ICg0NjM3OCk6IFs8ZmZmZjgw
MDA4MTNhYmYzOD5dCj4gX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSsweDg0LzB4ODgKPiBzb2Z0aXJx
cyBsYXN0ICBlbmFibGVkIGF0ICg0NjMzMCk6IFs8ZmZmZjgwMDA4MDBjNzFiND5dCj4gaGFuZGxl
X3NvZnRpcnFzKzB4NGM0LzB4NGRjCj4gc29mdGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoNDYyOTUp
OiBbPGZmZmY4MDAwODAwMTA2NzQ+XQo+IF9fZG9fc29mdGlycSsweDE0LzB4MjAKPiBDUFU6IDEg
VUlEOiAwIFBJRDogMTQyIENvbW06IGt3b3JrZXIvdTI1OjMgVGFpbnRlZDogRyBDCj4gNi4xOS4w
LXJjNC1uZXh0LTIwMjYwMTA1KyAjMTE5NjMgUFJFRU1QVAo+IFRhaW50ZWQ6IFtDXT1DUkFQCj4g
SGFyZHdhcmUgbmFtZTogS2hhZGFzIFZJTTMgKERUKQo+IFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91
bmQgZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jCj4gQ2FsbCB0cmFjZToKPiAgIHNob3dfc3RhY2sr
MHgxOC8weDI0IChDKQo+ICAgZHVtcF9zdGFja19sdmwrMHg5MC8weGQwCj4gICBkdW1wX3N0YWNr
KzB4MTgvMHgyNAo+ICAgX19taWdodF9yZXNjaGVkKzB4MTQ0LzB4MjQ4Cj4gICBfX21pZ2h0X3Ns
ZWVwKzB4NDgvMHg5OAo+ICAgX19tdXRleF9sb2NrKzB4NWMvMHg4OTQKPiAgIG11dGV4X2xvY2tf
bmVzdGVkKzB4MjQvMHgzMAo+ICAgcGluY3RybF9nZXRfZGV2aWNlX2dwaW9fcmFuZ2UrMHg0NC8w
eDEyOAo+ICAgcGluY3RybF9ncGlvX3NldF9jb25maWcrMHg0MC8weGRjCj4gICBncGlvY2hpcF9n
ZW5lcmljX2NvbmZpZysweDI4LzB4M2MKPiAgIGdwaW9fZG9fc2V0X2NvbmZpZysweGE4LzB4MTk0
Cj4gICBncGlvZF9zZXRfY29uZmlnKzB4MzQvMHhmYwo+ICAgZ3Bpb19zaGFyZWRfcHJveHlfc2V0
X2NvbmZpZysweDZjLzB4ZmMgW2dwaW9fc2hhcmVkX3Byb3h5XQo+ICAgZ3Bpb19kb19zZXRfY29u
ZmlnKzB4YTgvMHgxOTQKPiAgIGdwaW9kX3NldF90cmFuc2l0b3J5KzB4NGMvMHhmMAo+ICAgZ3Bp
b2RfY29uZmlndXJlX2ZsYWdzKzB4YTQvMHg0ODAKPiAgIGdwaW9kX2ZpbmRfYW5kX3JlcXVlc3Qr
MHgxYTAvMHg1NzQKPiAgIGdwaW9kX2dldF9pbmRleCsweDU4LzB4ODQKPiAgIGRldm1fZ3Bpb2Rf
Z2V0X2luZGV4KzB4MjAvMHhiNAo+ICAgZGV2bV9ncGlvZF9nZXQrMHgxOC8weDI0Cj4gICBtbWNf
cHdyc2VxX2VtbWNfcHJvYmUrMHg0MC8weGI4Cj4gICBwbGF0Zm9ybV9wcm9iZSsweDVjLzB4YWMK
PiAgIHJlYWxseV9wcm9iZSsweGJjLzB4Mjk4Cj4gICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3
OC8weDEyYwo+ICAgZHJpdmVyX3Byb2JlX2RldmljZSsweGRjLzB4MTY0Cj4gICBfX2RldmljZV9h
dHRhY2hfZHJpdmVyKzB4YjgvMHgxMzgKPiAgIGJ1c19mb3JfZWFjaF9kcnYrMHg4MC8weGRjCj4g
ICBfX2RldmljZV9hdHRhY2grMHhhOC8weDFiMAo+Cj4gRml4ZXM6IDZhYzczMDk1MTEwNCAoInBp
bmN0cmw6IGFkZCBkcml2ZXIgZm9yIEFtbG9naWMgTWVzb24gU29DcyIpCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiBSZXBvcnRlZC1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzAw
MTA3NTIzLTc3MzctNGI5Mi1hNzg1LTE0Y2U0ZTkzYjhjYkBzYW1zdW5nLmNvbS8KPiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFs
Y29tbS5jb20+CgpQYXRjaCBhcHBsaWVkIGZvciBmaXhlcyEKCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
