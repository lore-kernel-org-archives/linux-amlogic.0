Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF70C5478C
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Feb 2024 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+sMbiq3L8GMHsoFDSvDE8McH+Uyk68WHG6tIpIez8s=; b=W4cr6r68ziiKBD
	5QH/ECoFsGv4F4knXIJ/uwfwqMYeRCgSVdNOwvKq8aAf34GRc4oL2LQz1xyifUKxNgVfe4ow7feqr
	Lnh2dCysmfdNLfKraCSbxynP7p5wvaw/cXXoZynNw7u/PMtr5NO7XxHIcNqv24lkaNvQATa34qOlW
	bF18mYmphBphNh9p4InCWmN3Hb3cyBc3H/tdiz4CNnHX4Ufcbi6+G8AwKSb+dRyt8M74WM/LDg32H
	oXmoEq9vb+y7EazjN9U6mf+VpLxlTSWmMhXmz19Dj9NunmvJM2qoFR03ub0ghTqrlJ+N4RSN/uj+p
	CU7bNDNg9zgK70YdkTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7j-00000005Ixr-1uos;
	Tue, 27 Feb 2024 13:03:55 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7T-00000005Iox-4BFS;
	Tue, 27 Feb 2024 13:03:41 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5a04dd6721dso1128617eaf.0;
        Tue, 27 Feb 2024 05:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039018; x=1709643818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3JVqu+QlLfD+a7olzF5yj2OYnoi6pWCcsDzhbKv67M=;
        b=Z2IWu74v3PxyYaPPLPND5eEh7OYJPv4VDj/aPRdjMfUia7bzmYsX27W3gU7r7Ry5Fm
         AZLFlxW6NW7c3m7byCAQGOjYcVxRZTyVyYEvjmZaepldV212HkGEN3AurMVHkdGZjkdp
         YKUf+GUh/wYj80orOEALT0kDFRmB2Iq2jUnHSJIknX4VB4QFCKF8PA/l/tFbdthYntHA
         avHzjjMf4XUbnMTZvl2pAV4P6nN38HaAxOZYyRqI8pJ4CEgu+wZX/z04YsDdLaYvCFpZ
         XanxuND7kfHAH6kVgQyU3jonc/81V/NhBiYO/sPL6Vhi/u8AMpzBrsusxQb9xm0BAkL/
         2HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039018; x=1709643818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3JVqu+QlLfD+a7olzF5yj2OYnoi6pWCcsDzhbKv67M=;
        b=P7mZIF10afTE5Pf9Mk91ZAeCuLUzTZGBysszZmuehGaUZAHwnAfEQU/4WOiLP3PQSY
         qDBJOauPIdwVKT2VWhGMVA0P1E3f9sLIwQepyJVWf3nWndsllVhLQCwdcw6nD4UZFFCB
         MNK68voDpxDAyLn8XQeisY7Ta9MhXJCSIb5T6ScyQLdQipizTmkJPV3yfyRfsF9jLWHs
         hhLH4mnCkzDmhtenTkUDTNb8hAQu6R1biZHFYe+jNOXAcocB+B33Nyx1dBw3Fof3KInI
         qPXSbCcxJRDMETBG7fZ5KkqhakbA3t0vPTCsbuebIZNwF+ZiUnc9bcGmTuT2gwptvtFP
         NRIw==
X-Forwarded-Encrypted: i=1; AJvYcCVDh5SHQcYmApdSHnECyRIyUfb+Nw7sfSWPnp6LGCl2U/NP9Wu51SOvphUUWfUeDSB78Ul4HL8H3+M9UnEXMM0XXvBUM7iYNy5tei7C0OdbA60n6B1b/7yW77icLea/OhloazzsmNNe7hfqoJsOf0Eoq81ykaQ2rg==
X-Gm-Message-State: AOJu0YzpaqxPjbwxAsstJFWVG4usKrmjZlMVAabvNoONi85UKzfdogmZ
	xODa3+tZjxR7YZTg3mV1zdtN0kaT7l+4kboYALz6AD975qmRQN2N3xpPLzXloEUP30aqmQh4JJK
	JzxvF1doHvhEARtmXRJfahTNRErI=
X-Google-Smtp-Source: AGHT+IFBJnd1JbLgNvE3v1j3u/f3xE8yJrMViSPG+A0o5LOyHyqt2s5jOPEtzNXGxcrcf3l2cU9wBQ2ClEFo2vLEOas=
X-Received: by 2002:a4a:625a:0:b0:5a0:3bfa:72a6 with SMTP id
 y26-20020a4a625a000000b005a03bfa72a6mr9123958oog.1.1709039016537; Tue, 27 Feb
 2024 05:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-3-linux.amoon@gmail.com>
 <26732d5a-9fe1-4662-9362-ed397d266e01@linaro.org>
In-Reply-To: <26732d5a-9fe1-4662-9362-ed397d266e01@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 27 Feb 2024 18:33:20 +0530
Message-ID: <CANAwSgTgh1eBf5ptaLWNv1g6vzLJnNfKdvjkhqn-K2555nmjgA@mail.gmail.com>
Subject: Re: [PATCHv1 2/5] arm64: dts: amlogic: Add cache information to the
 Amlogic SM1 SoC
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050340_068444_43EBD9F0 
X-CRM114-Status: GOOD (  10.11  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgNiBGZWIgMjAyNCBhdCAxNDoyNCwgTmVpbCBBcm1zdHJvbmcgPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMDIvMjAyNCAxODoxOSwg
QW5hbmQgTW9vbiB3cm90ZToKPiA+IEFzIHBlciBTOTA1WDMgZGF0YXNoZWV0IGFkZCBtaXNzaW5n
IGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljCj4gPiBTTTEgU29DLiBBUk0gQ29ydGV4
LUE1NSBDUFUgdXNlcyB1bmlmaWVkIEwzIGNhY2hlIGluc3RlYWQgb2YgTDIgY2FjaGUuCj4gPgo+
ID4gLSBFYWNoIENvcnRleC1BNTUgY29yZSBoYXMgMzJLQiBvZiBMMSBpbnN0cnVjdGlvbiBjYWNo
ZSBhdmFpbGFibGUgYW5kCj4gPiAgICAgICAzMktCIG9mIEwxIGRhdGEgY2FjaGUgYXZhaWxhYmxl
Lgo+ID4gLSBBbG9uZyB3aXRoIDUxMktCIFVuaWZpZWQgTDMgY2FjaGUuCj4KPiBUaGlzIDUxMksg
bnVtYmVyIGlzIGZvciB0aGUgTlBVLCBBRkFJSyB0aGUgQ1BVIEwzIENhY2hlIHNpemUgaXNuJ3Qg
c3BlY2lmaWVkIGluIHRoZSBkYXRhc2hlZXQKPgpPSywKCkFzIHBlciBBcm0gQ290ZXggQTU1IFRS
TSBpdCBzdXBwb3J0cyBjYWNoZS4KWzBdIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1l
bnRhdGlvbi8xMDA0NDIvMDIwMC9GdW5jdGlvbmFsLWRlc2NyaXB0aW9uL0ludHJvZHVjdGlvbi10
by10aGUtQ29ydGV4LUE1NS1jb3JlL0ltcGxlbWVudGF0aW9uLW9wdGlvbnMKCkFzIHBlciB0aGUg
ZGF0YXNoZWV0ClsxXSBodHRwczovL2RuLm9kcm9pZC5jb20vUzkwNVgzL09EUk9JRC1DNC9Eb2Nz
L1M5MDVYM19QdWJsaWNfRGF0YXNoZWV0X0hhcmRrZXJuZWwucGRmCgpUaGVDb3J0ZXjihKItQTU1
TSBzdWJzeXN0ZW0gb2YgdGhlIGNoaXBpc2EgaGlnaC1wZXJmb3JtYW5jZSwKbG93LXBvd2VyLEFS
TSBtYWNybyBjZWxsIHdpdGggYW4gTDEgYW5kIEwzCmNhY2hlIHN1YiBzeXN0ZW0gdGhhdCBwcm92
aWRlIGZ1bGwgdmlydHVhbCBtZW1vcnkgY2FwYWJpbGl0aWVzLgoKQmVzdCB3YXkgdG8gbGV0IHRo
ZSBBbWxvZ2ljIFNvQyBtZW1iZXJzIGNvbW1lbnQgb24gdGhlIENQVSAgTDEvIC8vTDIvCkwzIGNh
Y2hlIHNpemUuCkJ1dCB3aXRoIHRoZSBsYWNrIG9mIHByZWYgUE1VIGV2ZW50cyB3ZSBjYW5ub3Qg
dGVzdCB0aGlzIGZlYXR1cmUuCgpbcm9vdEBvZHJvaWQtYzQgYWxhcm1dIyBwZXJmIGxpc3QKCkxp
c3Qgb2YgcHJlLWRlZmluZWQgZXZlbnRzICh0byBiZSB1c2VkIGluIC1lIG9yIC1NKToKCiAgYWxp
Z25tZW50LWZhdWx0cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW1NvZnR3YXJl
IGV2ZW50XQogIGJwZi1vdXRwdXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFtTb2Z0d2FyZSBldmVudF0KICBjZ3JvdXAtc3dpdGNoZXMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbU29mdHdhcmUgZXZlbnRdCiAgY29udGV4dC1zd2l0Y2hlcyBPUiBj
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW1NvZnR3YXJlIGV2ZW50XQoKTGlzdCBvZiBw
cmUtZGVmaW5lZCBldmVudHMgKHRvIGJlIHVzZWQgaW4gLWUgb3IgLU0pOgoKICBhbGlnbm1lbnQt
ZmF1bHRzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdhcmUgZXZlbnRd
CiAgYnBmLW91dHB1dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW1Nv
ZnR3YXJlIGV2ZW50XQogIGNncm91cC1zd2l0Y2hlcyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBjb250ZXh0LXN3aXRjaGVzIE9SIGNzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdhcmUgZXZlbnRdCiAgY3B1LWNsb2NrICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW1NvZnR3YXJlIGV2ZW50XQogIGNw
dS1taWdyYXRpb25zIE9SIG1pZ3JhdGlvbnMgICAgICAgICAgICAgICAgICAgICAgIFtTb2Z0d2Fy
ZSBldmVudF0KICBkdW1teSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBbU29mdHdhcmUgZXZlbnRdCiAgZW11bGF0aW9uLWZhdWx0cyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgW1NvZnR3YXJlIGV2ZW50XQogIG1ham9yLWZhdWx0cyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBtaW5vci1m
YXVsdHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdhcmUgZXZl
bnRdCiAgcGFnZS1mYXVsdHMgT1IgZmF1bHRzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
W1NvZnR3YXJlIGV2ZW50XQogIHRhc2stY2xvY2sgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBkdXJhdGlvbl90aW1lICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbVG9vbCBldmVudF0KICB1c2VyX3RpbWUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbVG9vbCBldmVudF0KICBzeXN0ZW1f
dGltZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbVG9vbCBldmVudF0K
ICByTk5OICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbUmF3
IGhhcmR3YXJlIGV2ZW50IGRlc2NyaT4KICBjcHUvdDE9djFbLHQyPXYyLHQzIC4uLl0vbW9kaWZp
ZXIgICAgICAgICAgICAgICAgICBbUmF3IGhhcmR3YXJlIGV2ZW50IGRlc2NyaT4KICAgICAgIFso
c2VlICdtYW4gcGVyZi1saXN0JyBvbiBob3cgdG8gZW5jb2RlIGl0KV0KICBtZW06PGFkZHI+Wy9s
ZW5dWzphY2Nlc3NdICAgICAgICAgICAgICAgICAgICAgICAgICBbSGFyZHdhcmUgYnJlYWtwb2lu
dF0KICBhbGFybXRpbWVyOmFsYXJtdGltZXJfY2FuY2VsICAgICAgICAgICAgICAgICAgICAgICBb
VHJhY2Vwb2ludCBldmVudF0KICBhbGFybXRpbWVyOmFsYXJtdGltZXJfZmlyZWQgICAgICAgICAg
ICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhbGFybXRpbWVyOmFsYXJtdGltZXJf
c3RhcnQgICAgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhbGFybXRp
bWVyOmFsYXJtdGltZXJfc3VzcGVuZCAgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBl
dmVudF0KICBhc29jOnNuZF9zb2NfYmlhc19sZXZlbF9kb25lICAgICAgICAgICAgICAgICAgICAg
ICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfYmlhc19sZXZlbF9zdGFydCAgICAg
ICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFwbV9j
b25uZWN0ZWQgICAgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29j
OnNuZF9zb2NfZGFwbV9kb25lICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2lu
dCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFwbV9wYXRoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFwbV9zdGFydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFw
bV93YWxrX2RvbmUgICAgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBh
c29jOnNuZF9zb2NfZGFwbV93aWRnZXRfZXZlbnRfZG9uZSAgICAgICAgICAgICAgICBbVHJhY2Vw
b2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFwbV93aWRnZXRfZXZlbnRfc3RhcnQgICAgICAg
ICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KICBhc29jOnNuZF9zb2NfZGFwbV93aWRnZXRfcG93
ZXIgICAgICAgICAgICAgICAgICAgICBbVHJhY2Vwb2ludCBldmVudF0KCgoKVGhhbmtzCgoKCi1B
bmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
