Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8438AC5B543
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jun 2025 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Riw3tLokF6AZibJnVguhRfyY/+zzs8WXSFusMZgtI5Q=; b=TmL2RESha3RSZe
	9LaB9FfxetPqohhR1IYEHeI2YtPPqzN4CTKKBOQS4ccR9kOetK7znJFeJQ7YgVTc9JmjpFljE2JwR
	qC/YBjRK1DI9P1Kc6vI1WJY1th5jbTSPAKlZsiYkpm8QWkE3FwJlwPeB4i6UnmkXVwJAbRMX8C02e
	qnNtEvooqI96VyssHjyP6XhjqjCnQOpl1hAYSaRHWw31MP2iZmo+ghY9jrf6XwRTtWojeQ0AT+mm4
	JUxwKUBlaRvpjEurc50LG5lMQDHQhab4WN7QsMU/eMM95/Zzeda/qY0qubS5V+IpaB7Kh6GJz4SOV
	TyYrs8g/+922rqDdROEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtvL-0000000E6Lx-25E1;
	Wed, 04 Jun 2025 19:37:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtvI-0000000E6La-3uw9
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Jun 2025 19:37:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235e1d4cba0so2048165ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jun 2025 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749065836; x=1749670636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzTHN9G4S37kMz+moCZu6NRvrTBVp2uwAQXRktRL1Ak=;
        b=fjJIXXynFu+t0bwqNfWHVd4vDPtQPjnBFZ5fP3F68dOkfkRkieu+CRRifN/N7jXCR3
         RukWLqegoH8UwLJt4I2N2qEXRulrCMEfrw6YkelIluDoXhu4DaTw0kzCn2CqkIXOWsu/
         bpuBBhRyNPx7DNxlj4E2dFANVPeuEue2E4l/tSTrxuHJfWc6HTV6eGrSLUOJF9kg6D7W
         vJBKKOPEKuTvokhozVIRzZzYi4cbIlJ/w075UPaEB9X8ZhsKJI3TkZSTuqoKKSLUwfAh
         rVh5CVl6fev08pHOhgeH1v6sc/KAMIljIznEOTJ/CJcBszNz8ZeHa0jU2ub1DN7yxuGc
         bt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749065836; x=1749670636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzTHN9G4S37kMz+moCZu6NRvrTBVp2uwAQXRktRL1Ak=;
        b=Z6YE31I7B8LdE5855ptLYAU5St+C5buIfVMWU7vU3fx3Uff4LhF2sGi7sMBiNeWy23
         0i3s43PJ00lti+VAkWzzmF6mRWpIDjIpL7toRNkdEYtjBJCWaOoFwysyn2/3ufOF7Ekr
         gClgtE0tcJjoBtt3NoOfZQ/b/QrkLDEp4TeMR/Kpid0Hc2IYCx5XcSfQnZSmPEdO004Y
         mzYPayXpyYpSr6yXECedki4BszliN/Erkwv0aQgUfK466tlpbT7YLpQosWCPiBiQMXcb
         DLAAxyqAes0997HzNqJL239r9i/xm95pCud0YlYD5b18+gq/onhYn6NHneGSicjxOu13
         dMnw==
X-Forwarded-Encrypted: i=1; AJvYcCUA9/Tht83W60MFpg81lArswGo5BkKf3/MppleKu38qelshSBXql8hYQ9KMAyd0mc/Zdamh0/ooAzWqxlkX@lists.infradead.org
X-Gm-Message-State: AOJu0YwBlMwJq8q4tv++/B0/sUjPeDFinvfoMJxIZAfvubkGYjEbC6yI
	0uWIMyXAKrSDnSgrTjhjn7j4tQ/aP6ISyEXQLxgKOWESN+2re287xfRUQEQ8TwzwDgo++rgp5hm
	+UTpOwVsWHzCtqWo/55LGe3LrOcNst6I=
X-Gm-Gg: ASbGnctYIkmqOIuxpAOrbYaNYPO+5NtCI5+NESAsXc7RHdIbzHuwwz+ef0afqpzCMLr
	WR6QCbSJovYqs2rTQox8uaEMDoUibQuVAH0MM0qra8zB7VTisNHWIOxIGjEbiM+h1EGN7qB3oK7
	6IYjJV9rEbxDdJ2D4+OqFuOr9BDesw3qxhKmfwJiX36xRhLCM=
X-Google-Smtp-Source: AGHT+IEUmGuVQmLcwyMnV1bOqYxUjgfradWkNpF4Glj3QjYkzZjdSQ8kaY5lGLu+UTnlIxGPlZiy+vmXsefKUPPGOe0=
X-Received: by 2002:a17:902:f54b:b0:234:8c64:7875 with SMTP id
 d9443c01a7336-235e11fbfe9mr61897625ad.38.1749065835514; Wed, 04 Jun 2025
 12:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748933789.git.zhoubinbin@loongson.cn> <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
 <CAFBinCA6f6jJQZEgHTiK8FqXW=v465a5rB0BZutDhct-4yhX_Q@mail.gmail.com> <CAMpQs4LYc76RMJU0JRG9Rcihx8zoOeaJgYHb1CNrgg1GFzA9Hw@mail.gmail.com>
In-Reply-To: <CAMpQs4LYc76RMJU0JRG9Rcihx8zoOeaJgYHb1CNrgg1GFzA9Hw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 4 Jun 2025 21:37:04 +0200
X-Gm-Features: AX0GCFtYQRcLyxkDVGWPb_uB7leq0w6W0I1zKcTM8pl57bVhbtaLBXQCbV01GfE
Message-ID: <CAFBinCBj-y5_vFDVTSMpZXUcGXReYc41hqGcqt1U43ZR2y6QrQ@mail.gmail.com>
Subject: Re: [PATCH v3 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_123716_989149_3958BAD1 
X-CRM114-Status: GOOD (  26.16  )
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

SGkgQmluYmluLAoKT24gV2VkLCBKdW4gNCwgMjAyNSBhdCA1OjAy4oCvQU0gQmluYmluIFpob3Ug
PHpob3ViYi5hYXJvbkBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ID4gPiAtICAgICAgIG1tYyA9
IG1tY19hbGxvY19ob3N0KHNpemVvZigqaG9zdCksICZzbG90X3BkZXYtPmRldik7Cj4gPiA+ICsg
ICAgICAgbW1jID0gZGV2bV9tbWNfYWxsb2NfaG9zdCgmc2xvdF9wZGV2LT5kZXYsIHNpemVvZigq
aG9zdCkpOwo+ID4gVGhpcyBjaGFuZ2UgaXMgZmluZSBhdCBydW50aW1lIChvbiBteSBPZHJvaWQt
QzEgYm9hcmQpIGJ1dCBpdCBjYW4gbGVhZAo+ID4gdG8gYSB1c2UtYWZ0ZXItZnJlZSBpc3N1ZS4K
PiA+IG1lc29uX214X21tY19yZWdpc3Rlcl9jbGtzKCkgZGV2bV8gcmVnaXN0ZXJzIHR3byBjbG9j
a3MgYW5kIHVzZXMKPiA+IGhvc3QtPmNvbnRyb2xsZXJfZGV2IGFzIGRldmljZS4KPiA+IFRoaXMg
bGVhZHMgdG8gdGhlIGZhY3QgdGhhdCBkdXJpbmcgZHJpdmVyIHJlbW92YWwgc3RydWN0Cj4gPiBt
ZXNvbl9teF9tbWNfaG9zdCBpcyBmcmVlJ2QgYmVmb3JlIGhvc3QtPmNvbnRyb2xsZXJfZGV2LCB3
aGljaCBtZWFucwo+ID4gdGhlIGNsb2NrcyBhcmUgYWxzbyBmcmVlJ2QgYWZ0ZXIgc3RydWN0IG1l
c29uX214X21tY19ob3N0IGlzIGFscmVhZHkKPiA+IGdvbmUuIFRoZSBwcm9ibGVtIGhlcmU6IHRo
ZSBjbG9ja3MgbmVlZCB0aGUgc3RydWN0IGNsa19kaXZpZGVyIGFuZAo+ID4gc3RydWN0IGNsa19m
aXhlZF9mYWN0b3IgZnJvbSBzdHJ1Y3QgbWVzb25fbXhfbW1jX2hvc3QuCj4KPiBTb3JyeSwgSSBo
YXZlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IG9waW5pb24sIHdoaWNoIG1heSBub3QgbmVjZXNzYXJp
bHkKPiBiZSBjb3JyZWN0Lgo+Cj4gbWVzb25fbXhfbW1jX2hvc3QgaXMga3phbGxvYyBhcyBgZXh0
cmFgIGluIG1tY19hbGxvY19ob3N0KClbMV0sIGJ1dCBpbgo+IGZhY3QsIHRoZSBlbnRpcmUgaG9z
dCBpcyByZWxlYXNlZCBpbiBtbWNfaG9zdF9jbGFzc2Rldl9yZWxlYXNlKClbMl0sCj4gc28gSSBk
b24ndCB0aGluayBpdCB3aWxsIGFmZmVjdCB0aGUgdXNlIG9mIGhvc3QtPmNvbnRyb2xsZXJfZGV2
LgpJdCdzIHdlbGwgaGlkZGVuLCBzbyBpdCdzIHRyaWNreSB0byBzcG90OiB3ZSBoYXZlIHR3byAi
c3RydWN0IGRldmljZSIKaW4gdGhlIG1lc29uLW14LXNkaW8gZHJpdmVyOgoxLiB0aGUgImNvbnRy
b2xsZXJfZGV2IiB3aGljaCBpcyBiZWxvbmdzIHRvIHRoZSBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
Cm9mIHRoZSBkcml2ZXIvZGV2aWNlLXRyZWUgbm9kZSBbMF0KMi4gYSBzZWNvbmQgc3RydWN0IHBs
YXRmb3JtX2RldmljZSBhbmQgdGh1cyBhIHNlY29uZCBzdHJ1Y3QgZGV2aWNlCndob3NlIG9mX25v
ZGUgYmVsb25ncyB0byB0aGUgInNsb3QiICh3aGljaCBpcyBhIGNoaWxkIG5vZGUgb2YgdGhlCmNv
bnRyb2xsZXIpIFsxXQoKQ2xvY2sgY29udHJvbGxlciBpbml0aWFsaXphdGlvbiBpcyB0aGUgc2Ft
ZSBmb3IgYWxsIHNsb3RzLCBzbyBJIGNob3NlCnRvIGxpbmsgaXQgd2l0aCB0aGUgY29udHJvbGxl
cl9kZXZpY2UuCldlIHdhbnQgdG8gcGFyc2UgdGhlIG1tYyBzbG90IHByb3BlcnRpZXMgKGJ1cy13
aWR0aCwgY2QtZ3Bpb3MsIGNhcC0qLAouLi4pIGZyb20gdGhlIHNsb3Qgbm9kZSBpbiBkZXZpY2Ut
dHJlZSwgc28gd2UgY3JlYXRlIGEgc2Vjb25kCnBsYXRmb3JtX2RldmljZSBmb3IgdGhlIHNsb3Qg
KGNoaWxkKSBub2RlLiBUaGlzIGRlc2lnbiB3YXMgY2hvc2VuCmJlY2F1c2UgdGhlIGNvbnRyb2xs
ZXIgc3VwcG9ydHMgbXVsdGlwbGUgKHVwIHRvIDMpIHNsb3RzIHdoaWxlIHRoZSBtbWMKY29yZSBp
biBMaW51eCBkb2Vzbid0LiBIb3dldmVyLCBpdCB3YXMgaW1wb3J0YW50IGZvciBtZSB0byBhdCBs
ZWFzdCBiZQpwcmVwYXJlZCBpbiB0ZXJtcyBvZiBkZXZpY2UtdHJlZSBiaW5kaW5ncyBpbiBjYXNl
IExpbnV4IHdvdWxkIGV2ZXIKc3VwcG9ydCBjb250cm9sbGVycyB3aXRoIG11bHRpcGxlIHNsb3Rz
LgoKU28gdGhlIGxpZmVjeWNsZSBkdXJpbmcgcHJvYmUgaXM6CmEpIGNvbnRyb2xsZXJfZGV2aWNl
IGlzIGluc3RhbnRpYXRlZCBieSBkZXZpY2UtdHJlZSBub2RlIHdpdGgKY29tcGF0aWJsZSA9ICJh
bWxvZ2ljLG1lc29uOC1zZGlvIgpiKSBzbG90IGRldmljZSBpcyBpbnN0YW50aWF0ZWQgdXNpbmcg
dGhlICJtbWMtc2xvdCIgY29tcGF0aWJsZSBhbmQKdXNpbmcgY29udHJvbGxlcl9kZXZpY2UgYXMg
cGFyZW50IGRldmljZQpjKSBkZXZtX21tY19hbGxvY19ob3N0KCkgaXMgY2FsbGVkCmQpIGNsb2Nr
IHByb3ZpZGVycyBhcmUgZGV2bV8qIHJlZ2lzdGVyZWQgYW5kIGF0dGFjaGVkIHRvIGNvbnRyb2xs
ZXJfZGV2aWNlCmUpIHRoZSBtZXNvbi1teC1zZGlvIGRyaXZlciBhY3RzIGFzIGNsb2NrIGNvbnN1
bWVyIGZvciB0aGUgY2xvY2sgaXQncyBwcm92aWRpbmcKCkhvd2V2ZXIsIGlmIHdlIHdhbnQgdG8g
cmVtb3ZlIHRoZSBkcml2ZXIgdGhlIG9yZGVyIGlzOgotIHJlbW92ZSB0aGUgZGV2aWNlIGF0dGFj
aGVkIHRvIHRoZSAibW1jLXNsb3QiIGNvbXBhdGlibGUgLSBiZWZvcmUKdGhhdCBoYXBwZW5zIHN0
cnVjdCBtbWMgaXMgZnJlZWQgKGFzIGl0J3MgcGFyZW50IGlzIGJlaW5nIHJlbW92ZWQpCndoaWNo
IGFsc28gZnJlZXMgc3RydWN0IG1lc29uX214X21tY19ob3N0Ci0gKHN0cnVjdCBjbGtfZGl2aWRl
ciBhbmQgc3RydWN0IGNsa19maXhlZF9mYWN0b3IgYXJlIGxpbmtlZCB3aXRoIHRoZQpjbG9ja3Mg
d2hpY2ggYXJlIHN0aWxsIHJlZ2lzdGVyZWQgPC0gaGVyZSB3ZSBoYXZlIGEgcHJvYmxlbSBiZWNh
dXNlCnRob3NlIHR3byBzdHJ1Y3RzIGFyZSBwYXJ0IG9mIHN0cnVjdCBtZXNvbl9teF9tbWNfaG9z
dCB3aGljaCBoYXMKYWxyZWFkeSBiZWVuIGZyZWVkKQotIGNvbnRyb2xsZXJfZGV2aWNlIGlzIGZy
ZWVkIC0gYmVmb3JlIHRoYXQgaGFwcGVucyB0aGUgcHJvdmlkZWQgY2xvY2tzCmFyZSBmcmVlZCAo
YXMgdGhlaXIgcGFyZW50IGlzIGJlaW5nIHJlbW92ZWQpCgpJIHRha2UgeW91ciBxdWVzdGlvbnMg
YXMgZmVlZGJhY2sgb24gaG93IHRvIG1ha2UgdGhlIGNvZGUgZWFzaWVyIHRvCnJlYWQvdW5kZXJz
dGFuZC4KVGhpcyBpcyB2ZXJ5IHdlbGNvbWUsIGJlY2F1c2UgaXQncyBiZWVuIDggeWVhcnMgc2lu
Y2UgSSBpbnRyb2R1Y2VkIHRoZQpkcml2ZXIgYW5kIEkgYWxzbyBoYXZlIHRvIHRoaW5rIHR3aWNl
IGFib3V0IHNvbWUgb2YgaXRzIGRldGFpbHMuCgpMZXQgbWUga25vdyBpZiB0aGluZ3MgYXJlIG1v
cmUgY2xlYXIgbm93IC0gb3IgaWYgeW91IHN0aWxsIGhhdmUgYW55CmRvdWJ0cy9xdWVzdGlvbnMu
CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTUtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bW1jL2FtbG9naWMsbWVzb24tbXgtc2Rpby55YW1sI0w4MwpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuMTUtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tbXgtc2Rpby55YW1sI0w5MgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
