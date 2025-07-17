Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E7C83F34
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jul 2025 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3s+O3txGJffVnHkWLmIaeIQTnnaJpUXnpmLLlxD3RQ=; b=KEkTXsk5jg9+IV
	Y7FMRL4C3hItylwEPY8/nNOP6hbQpYcqKl0DDW62wnYrml3dEdqjCnB3IZFxPHG3f8Tag5gUXWlqI
	1HUVjmW06NEGmi7yDdDzFcLnIeMQz1+mFi+rLqlLBf95ETlCAv1VwmQu9r3QmPAA/iaB9Xk4/iQW3
	lceSc6a7TwpxRgCrbLorsbusVz4dmMSRTwIBltWIqmfh/4XjzxLMWAXHRYgDFEwa1IsUAza3d7GNC
	zp7hYV9iDQvTePa1H28YvYgWS2Eyr+tN+M9411Es2IkIOEW1HQ34W7EcHTs3EG6XE99RMLipoCtqc
	bxyDI1QIvW8R8pj9FHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRK8-0000000AcNb-1jNf;
	Thu, 17 Jul 2025 16:19:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQmA-0000000AWxe-40Jr;
	Thu, 17 Jul 2025 15:44:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23dea2e01e4so13346215ad.1;
        Thu, 17 Jul 2025 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1752767042; x=1753371842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN4bJ0MLHsMuhB36620IX8nWVKMPLDlQLQ5oOeKTkGg=;
        b=Y5Bp15vgPFOl3f/oHldwOFX7jqvyQzC6tspDP8v+pw9ndZU13t5EZt7nrRpFU5oyRr
         zHN33FjL5nZRX9EiUR1lBIOom65+JOKe/PPZT8waDEdH10Xzx+3c6pgbUFWLhOLc0ODN
         Pces95uo8gAFYPQPt+OYVQcBfqg6rmGN3CYouNquV4CzcmnSVyg0z1GTGXb7db6m6bdt
         avkLf2ikTBQG+cgk4A9JYmkCSm6HfuhEP1B7jIOpQPXego3sJfAHEdnZzun0bmFmbabd
         hKLmttTqVO4YpeL8MJsgcQOovKHySG/v9iXI1ijIUmuy/70ZZz4xKrjVyFv2UjZgds4o
         npzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752767042; x=1753371842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN4bJ0MLHsMuhB36620IX8nWVKMPLDlQLQ5oOeKTkGg=;
        b=kkNJR3Vbw4nk+pzPDvdMYug3zyS9M7I1s+pB0k9uMNyMfTvoo6+syCjBgG2ebGr7X6
         oKWqGKPiSsonZTKPCmtegZxpIcivyqttkju/svbO7vSm5GUpOOjEgy8SVqHcfGGhJbbf
         l1sOCiEoPEdej/K+ynRZWXUlHX+mmWEbUT/UEX+PTZc6sv5euIjzlzYzDG37zTkYUfkj
         Utr2yDuSmlz5TaJHD1JGe6HVSsBVi4GV3PAdiBo8Wkj+Uc3VvGDoR+9CIKLxVbN8dSpW
         i0ZnkeSmtGNG3a28lvUV2ZaZS15MAYIWUZPRXhyJ6VJgn7sWjhGfF7OXa2bEg3ZMY4/n
         d9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxsN2mZ27WgkdAKTNSSmKSHDRcS/3pUvO0505kmBi6LR1haq5frkdRaww5lG9J49W3gWd0LalAsNcge8eE@lists.infradead.org, AJvYcCXTvVDX89QGdYfI7RzKx6/kp4j2wHDwqE5C3dMn0LxWpGHfCTe47r2LiY8XlBnVAiat+1UNqUWGKAxPAXI0j4puBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjSGYE0u7aS8Lv9QS8mGzE1NURpa1AACYCxXCZVwtj4cVk3Rd
	WdHheNBnPEldLuOzYK2Lui7IVsKlX6OkXozyvngUK8yTPuRfJ2v76wq23i54MDNKMGJ4Fa/n1iG
	HvQXIFtOFWrmKdtadBxhWzEfYAeqAITchg3lq
X-Gm-Gg: ASbGncsEMHqGgfxnSeCPzQEQaHWAzzK8mUlZ2uYPkbJbzmgduIUZGZF6ArvbvVxqHLA
	QZG8JeB3nFWkgLO7849DC549uxYiU7b1euUKs0KKOGfBa23oUZJ6pUnh3xLN46sByK2vmGQdlIe
	1+GhfvLCq01+n9g0oincFwAOduhLMooj5do6v3qdMHT+26885deqbGK7E5Vsfd0iu9a3L+IZ6OP
	BOeDSVGqvppBa2GshyXsZm4cpApIO1O
X-Google-Smtp-Source: AGHT+IHA1ZrKnYuPXE4GXLTfL1TF9TCNgu66q+ocBubO7yF3+9AbPVtS6s8vpRxMX8NX3hB8Al+UyUorAl8wjgpvBEM=
X-Received: by 2002:a17:902:ebcb:b0:234:f200:51a1 with SMTP id
 d9443c01a7336-23e2566a7bfmr87576115ad.9.1752767042136; Thu, 17 Jul 2025
 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
In-Reply-To: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jul 2025 17:43:51 +0200
X-Gm-Features: Ac12FXxyJdrkT0-Udvls8NBCEN5HDOxcf-2RPU7Aaa4UPg2Q8zxybsDbpxTtPl4
Message-ID: <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_084402_992901_D9E6CCCC 
X-CRM114-Status: GOOD (  14.65  )
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

SGVsbG8sCgp0aGFuayB5b3UgZm9yIHRoaXMgcGF0Y2ghCgpPbiBUaHUsIEp1bCAxNywgMjAyNSBh
dCA1OjA44oCvQU0gQ2h1YW4gTGl1IHZpYSBCNCBSZWxheQo8ZGV2bnVsbCtjaHVhbi5saXUuYW1s
b2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxp
dUBhbWxvZ2ljLmNvbT4KPgo+IFRoZSBjeWNsZSBjb3VudCByZWdpc3RlciBoYXMgYSAyMC1iaXQg
ZWZmZWN0aXZlIHdpZHRoLCBidXQgdGhlIGRyaXZlcgo+IG9ubHkgdXRpbGl6ZXMgMTYgYml0cy4g
VGhpcyByZWR1Y2VzIHRoZSBzYW1wbGluZyB3aW5kb3cgd2hlbiBtZWFzdXJpbmcKPiBoaWdoLWZy
ZXF1ZW5jeSBjbG9ja3MsIHJlc3VsdGluZyBpbiAoc2xpZ2h0bHkpIGRlZ3JhZGVkIG1lYXN1cmVt
ZW50Cj4gYWNjdXJhY3kuCkkgY2hlY2tlZCB0aGUgTWVzb244IGRvd25zdHJlYW0gY29kZSBbMF0g
YW5kIGl0IHVzZXMgMHgwMDBGRkZGRiB0bwptYXNrIHRoZSByZWdpc3RlciB2YWx1ZSAtPiB0aGlz
IG1lYW5zIHRoYXQgb2xkIFNvQ3MgYWxzbyBoYXZlIGEgMjAtYml0CndpZGUgd2lkdGguCgpbLi4u
XQo+IEhlcmUgYXJlIHRoZSB0ZXN0IGNvbXBhcmlzb25zIGJhc2VkIG9uIEMzOgpbLi4uXQo+IEhl
cmUgYXJlIHRoZSB0ZXN0IGNvbXBhcmlzb25zIGJhc2VkIG9uIEMzOgpJIGhhdmUgdGVzdGVkIHRo
aXMgcGF0Y2ggd2l0aCBNZXNvbjhiIGJhc2VkIE9kcm9pZC1DMToKcHJlLW9wdGltaXphdGlvbjoK
IyB0aW1lIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21lYXN1cmVfc3VtbWFy
eSB8IGdyZXAgLXYgIiAgMCAgIgogIGNsb2NrICAgICAgICAgICAgICAgICAgICAgcmF0ZSAgICBw
cmVjaXNpb24KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBj
bGs4MSAgICAgICAgICAgICAgICAgMTU5MzcyMzk2ICAgICsvLTUyMDhIegogYTlfY2xrX2RpdjE2
ICAgICAgICAgICAyNDAwMDAwMCAgICArLy0zMTI1SHoKIHJ0Y19vc2NfY2xrX291dCAgICAgICAg
ICAgMzEyNTAgICAgKy8tMzEyNUh6CiBoZG1pX2NoMF90bWRzICAgICAgICAgMTQ2Mzk5MDM4ICAg
ICsvLTQ4MDdIegogc2FyX2FkYyAgICAgICAgICAgICAgICAgMTE0MDYyNSAgICArLy0zMTI1SHoK
IHNkaGNfcnggICAgICAgICAgICAgICAgOTQ0NDM3NTAgICAgKy8tMzEyNUh6CiBzZGhjX3NkICAg
ICAgICAgICAgICAgIDk0NDQzNzUwICAgICsvLTMxMjVIegogcHdtX2QgICAgICAgICAgICAgICAg
IDg0OTkyMTg3NSAgICArLy0zMTI1MEh6CiBwd21fYyAgICAgICAgICAgICAgICAgODQ5OTIxODc1
ICAgICsvLTMxMjUwSHoKCnJlYWwgICAgMG0wLjEwMnMKdXNlciAgICAwbTAuMDA1cwpzeXMgICAg
IDBtMC4wNjlzCgoKcG9zdC1vcHRpbWl6YXRpb246CiMgdGltZSBjYXQgL3N5cy9rZXJuZWwvZGVi
dWcvbWVzb24tY2xrLW1zci9tZWFzdXJlX3N1bW1hcnkgfCBncmVwIC12ICIgIDAgICIKICBjbG9j
ayAgICAgICAgICAgICAgICAgICAgIHJhdGUgICAgcHJlY2lzaW9uCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogY2xrODEgICAgICAgICAgICAgICAgIDE1OTM3
MzQzOCAgICArLy0xNTYySHoKIGE5X2Nsa19kaXYxNiAgICAgICAgICAgMTIwMDAwMDAgICAgKy8t
MTU2Mkh6CiBydGNfb3NjX2Nsa19vdXQgICAgICAgICAgIDMyODEzICAgICsvLTE1NjJIegogaGRt
aV9jaDBfdG1kcyAgICAgICAgIDE0NjM5ODQzOCAgICArLy0xNTYySHoKIHNhcl9hZGMgICAgICAg
ICAgICAgICAgIDExNDM3NTAgICAgKy8tMTU2Mkh6CiBzZGhjX3J4ICAgICAgICAgICAgICAgIDk0
NDQzNzUwICAgICsvLTE1NjJIegogc2RoY19zZCAgICAgICAgICAgICAgICA5NDQ0Mzc1MCAgICAr
Ly0xNTYySHoKIHB3bV9kICAgICAgICAgICAgICAgICA4NDk5OTIxODggICAgKy8tMTU2Mkh6CiBw
d21fYyAgICAgICAgICAgICAgICAgODQ5OTkyMTg4ICAgICsvLTE1NjJIegoKcmVhbCAgICAwbTAu
MTczcwp1c2VyICAgIDBtMC4wMDhzCnN5cyAgICAgMG0wLjEwOXMKClNvIHRoZXJlJ3MgYWxzbyBh
biBpbXByb3ZlbWVudCBpbiBhY2N1cmFjeS4gVGhlIG9ubHkgZG93bnNpZGUgSSdtCnNlZWluZyBp
cyB0aGF0IGl0IHRha2VzIDc1JSBleHRyYSB0aW1lIGZvciB0aGUgbWVhc3VyZW1lbnQuIEZvciBt
ZQp0aGlzIGlzIGlycmVsZXZhbnQgc2luY2Ugd2UgdXNlIHRoaXMgZm9yIGRlYnVnZ2luZy4KClsu
Li5dCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogSEFDSzogVGhlIGlucHV0IGNsb2NrIHNpZ25h
bCBwYXRoIGZyb20gZ2F0ZSAoQ29udHJvbGxlZCBieSBNU1JfUlVOKQo+ICsgICAgICAgICogdG8g
aW50ZXJuYWwgc2FtcGxpbmcgY2lyY3VpdCBpbiBjbGstbWVhc3VyZSBoYXMgYSBwcm9wYWdhdGlv
biBkZWxheQo+ICsgICAgICAgICogcmVxdWlyZW1lbnQ6IDI0IGNsb2NrIGN5Y2xlcyBtdXN0IGVs
YXBzZSBhZnRlciBtdXggc2VsZWN0aW9uIGJlZm9yZQo+ICsgICAgICAgICogc2FtcGxpbmcuCj4g
KyAgICAgICAgKgo+ICsgICAgICAgICogRm9yIGEgMzBrSHogbWVhc3VyZW1lbnQgY2xvY2ssIHRo
aXMgdHJhbnNsYXRlcyB0byBhbiA4MDDOvHMgZGVsYXk6Cj4gKyAgICAgICAgKiA4MDB1cyA9IDI0
IC8gMzAwMDBIei4KPiArICAgICAgICAqLwo+ICsgICAgICAgZnNsZWVwKDgwMCk7CldoYXQgaXMg
bmVlZGVkIHRvIG1ha2UgdGhpcyBub3QgYSBIQUNLIGFueW1vcmU/IElzIHRoZXJlIGEgcmVnaXN0
ZXIKdGhhdCB3ZSBjYW4gcG9sbCBmb3IgdGhlIG51bWJlciBvZiBjbG9jayBjeWNsZXMgdGhhdCBo
YXZlIHBhc3NlZD8KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
