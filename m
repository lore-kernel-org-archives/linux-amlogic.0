Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4551CC77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/yc8DTRqbS5GYaCiDk58oEmpsWi7K6DYjAHis0ERXo=; b=qzFtmi2/kskPfF
	dUrEUmLHAFX2mnqHWj2GgMiHp3wlEzG1qW7KGiIVu9gQBhBYboXGHZjv74GWZV6XeJPLKLUPhYRIi
	O8bHUDaT0TdL/Y5TNjNwjpUTZ5T/17Hn0WBwIMjTvYY1GivjU+LCdWXn4OqYPEsyaFxzQkt4dLN//
	4ALf1hFw68gahKJpYjHm4agD6Ns+BoguYO0H4zEvGGg7g8yfI3gKdJSMKC2fcnyy+GrCSXwTH1B/S
	hicaI1v1+7Ls05ElxWgSwWshGn7FMiup+nGxdgqR84kxDeFZ+9FAHsdnvIm5RsN2htDlQOtM6n2YA
	5o30d7VWvgYo4bHD3spQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGpk-0000000AvvC-0N8K;
	Thu, 03 Jul 2025 10:06:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFps-0000000AliD-1JoF
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 09:03:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso4546366f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Jul 2025 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751533347; x=1752138147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLpRhZ8oYlqdUPrBtWQJGdWQR4/qJlb3vPx62hFSxUg=;
        b=JLm4UQMrAtve9MQJ4luEeeEcLRZyUtVHKmkf4m/x2SmXjyst4bjlPMu9PIvNEeWqZA
         8sH+VYamLyo2PI+nI1c1vMUaCCBNqjYkApVMvzL5J96yJp83R8WgDUf1ayN9YpMCT5TC
         yH+W9fZ0QqSdLF9qOv121RdFoTaoeTvKNAjOEjwGKxwC7PT1G/BpiIfiTLeU4wpBcgyY
         mBMGFT9vGtT6bJfomdjwywyTnTDYbAcofBXL/X0MhHFlk+k4YffK5+UeRjPDEnxcCB2d
         wFZH87vdMfsC6/nbEGw+fyRMOZbATeM68T7OgBaZApZgAX4ZEDFqtXpzQxRtBF7A2pot
         ZGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533347; x=1752138147;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLpRhZ8oYlqdUPrBtWQJGdWQR4/qJlb3vPx62hFSxUg=;
        b=j3IQj63m/N7dUxDRfFKRtvt+jz/bXZuJGJP7pE7rTYt4v/QfQA2sPXahveHm8deK5x
         29+NqMluZTdEyQo4UiWaT6YNJtaTBzgbUFGbjK6lxt6l9cw7oRB+VKf6VSexiKCp32oh
         yLMlTQ0VtNy9mbQb1OWZj8IIRUzBD88/3hi3GxJnZJrLquqmw4pnr8NpqqO0vAtVPkGV
         AgZN7elB3bYLALJp/A+3bRBoFhy9pGQdGz/l9CNpvbnZe5BhUHW2TniqCZMI0u0y7Ax5
         j3BaLj3JDiH7Ib0AqE+rsxzancGZRRc6GO2nVaX5M85MsBvTKgYQFoMMRgwHyQGFrXDQ
         3SUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//eVHDMMy4Pv1mNdTr8xtNTYD/O2XpmgTh4F/rQFrwt/X1i8rRxEyPRU0Gn/KipXgEeRxCZB2Wxx9U/1z@lists.infradead.org
X-Gm-Message-State: AOJu0YyWhn9IKuDTj2GGC8JLbPyQ+q4G1PkXn9uWuMnIdN+SfVLKl5aT
	7KjamzG++QoQaqo0GInHEyGkDvX5ywFWBdfOrVJRydKJ8JWAN+WqjDJKfC76Moo93Fk=
X-Gm-Gg: ASbGnctv14VXOxshe65MPYX8XUuWxR+1pUvXzTQRJ4aVNSEmvok2/b1jnJneTH1tSPF
	lYbsYqkWIwNzA0jY8sXV0prexAFG1CEdnGrI50KYwLHZa5cCRP779PAtv3wQOXH8U4YUz1LAj+2
	OAu7SnJqNYSFPTdQQBT/1AzwDZn4lZyd0Tecy/WV52cA+AqQb2Qah4ZqUtXB6ky0glpMZA8Srd6
	wt87AOBeqYrX9c5ABMjxGgAxyRhL1L6aMvk5B9aJjmG5yBRMV6PAd+CrmTBqaQhJw0Ih3exlV65
	qSo/dyHht2HqOBfp279CZtCWSwMC6y2lDesm1I7ZBvXqMfYg23+X81LHef6mImMgd0BVGCai
X-Google-Smtp-Source: AGHT+IEpB6jnvVhDM96CIt4ZF+uBHmqcylICsBSVvBhL7X6XFgQme1VhuXRkTOD5F0uhXQjbeKMrBQ==
X-Received: by 2002:a05:6000:4914:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3b1ff9f5966mr5613528f8f.35.1751533346613;
        Thu, 03 Jul 2025 02:02:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a35sm18381340f8f.57.2025.07.03.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
In-Reply-To: <99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 16:31:12 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
	<eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
	<1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
	<99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 11:02:25 +0200
Message-ID: <1jtt3tbqam.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_020228_459185_671C170C 
X-CRM114-Status: GOOD (  18.79  )
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

Pj4+Pgo+Pj4+IC0jZGVmaW5lIEMzX0NMS19HQVRFKF9uYW1lLCBfcmVnLCBfYml0LCBfZndfbmFt
ZSwgX29wcywgX2ZsYWdzKSAgICAgICAgIFwKPj4+PiAtc3RydWN0IGNsa19yZWdtYXAgX25hbWUg
PSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyNk
ZWZpbmUgQzNfUENMSyhfbmFtZSwgX3JlZywgX2JpdCwgX2Z3X25hbWUsIF9vcHMsIF9mbGFncykg
ICAgICAgICAgICAgXAo+Pj4+ICtzdHJ1Y3QgY2xrX3JlZ21hcCBjM18jI19uYW1lID0geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAgLmRhdGEg
PSAmKHN0cnVjdCBjbGtfcmVnbWFwX2dhdGVfZGF0YSl7ICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPj4+PiAgICAgICAgICAgICAgICAgICAub2Zmc2V0ID0gKF9yZWcpLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAgICAgICAgICAuYml0X2lk
eCA9IChfYml0KSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAg
ICAgICAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtf
aW5pdF9kYXRhKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAtICAgICAgICAg
ICAgICAgLm5hbWUgPSAjX25hbWUsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gImMzXyIgI19uYW1lLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4KPj4+IFByZWZpeGluZyB2YXJpYWJsZSBu
YW1lcyB3aXRoICdTb0MnIGlzIHVuZGVyc3RhbmRhYmxlICh0byBhdm9pZCBkdXBsaWNhdGUKPj4+
IGRlZmluaXRpb25zIGFuZCBmYWNpbGl0YXRlIHZhcmlhYmxlIHNlYXJjaGluZyksIGJ1dCBpcyBp
dCBuZWNlc3NhcnkgdG8gYWRkCj4+PiAnU29DJyBwcmVmaXhlcyB0byBjbG9jayBuYW1lcz8KPj4g
VGhpcyBpcyBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbiBidXQgSSdsbCBlbGxhYm9yYXRlLgo+Pgo+
PiBTb21lIGNvbnRyb2xsZXJzIGRvIHNvLCBzb21lIGRvIG5vdC4gVGhpcyBpcyBhIHR5cGljYWwg
cG9pbnRsZXNzCj4+IGRpZmZlcmVuY2UgdGhhdCBtYWtlIGNvZGUgc2hhcmluZyBkaWZmaWN1bHQg
YW5kIGxlYWQgdG8gdGhlIGR1cGxpY2F0aW9uCj4+IEknbSBhZGRyZXNzaW5nIG5vdy4KPgo+Cj4g
WWVzLCBpbiBmYWN0IG1vc3QgY2xvY2sgY29uZmlndXJhdGlvbnMgYXJlIGNvbnNpc3RlbnQgYWNy
b3NzIG91ciBTb0NzLiBPdmVyCj4gdGhlIHllYXJzLCB3ZSd2ZSBiZWVuIGNvbnRpbnVvdXNseSB3
b3JraW5nIHRvIG1ha2Ugb3VyIGRyaXZlciBjb2RlIG1vcmUKPiAnY29tbW9uJwo+IGFuZCBlZmZp
Y2llbnQuCj4KCk5vIHRoZXkgYXJlIG5vdCBjb25zaXN0ZW50IGF0IGFsbCB3aGVuIGl0IGNvbWUg
dG8gdGhpcwoKQ29udHJvbGxlciBwcmVmaXhpbmcgdGhlIHBjbGtzOgoqIGF4Zy1hbwoqIGF4Zwoq
IGcxMi1hbwoqIGcxMgoqIGd4YmIKKiBzNC1wZXJpcGhzCgpDb250cm9sbGVycyBub3QgcHJlZml4
aW5nIHRoZSBwY2xrcwoqIGd4YmItYW8KKiBhMS1wZXJpcGhzCiogYzMtcGVyaXBocwoqIG1lc29u
OGIKCkkgZG8gbm90IHdhbnQgdG8gaW52ZW50IG5ldyBuYW1lcyB0byBhdm9pZCB0aGUgbmFtZXMg
Y2xhc2hlcyBpZiB0aGUKcHJlZml4ZXMgYXJlIGRyb3BwZWQuIEkgdHJpZWQgdGhhdCB3YXkgYW5k
IGl0IHdhcyBhIG1lc3MuCgpBcyBub3RlZCBpbiB0aGUgZGVzY3JpcHRpb24sIGNsb2NrIG5hbWVz
IHdpbGwgbm90IGJlIHByZWZpeGVkIHdpdGggU29DCm5hbWUsICpleGNlcHQqIGZvciB0aGUgcGNs
a3MgZm9yIHRoZSBoaXN0b3JpYyByZWFzb24gZXhwbGFpbmVkIGFib3ZlLgoKPgo+Pgo+PiBCb3Ro
IHdpdGggYW5kIHdpdGhvdXQgYXJlIGZpbmUgYnV0IHBpY2tpbmcgb25lIGEgc3RpY2tpbmcgdG8g
aXQgaGVscHMgYQo+PiBsb3QuIEkgd291bGQgaGF2ZSBwcmVmZXJyZWQgdG8gZHJvcCB0aGUgcHJl
Zml4IGZyb20gdGhlIHBjbGsgY2xvY2sKPj4gbmFtZXMsIHNhbWUgYXMgdGhlIG90aGVyIGNsb2Nr
LCBidXQ6Cj4KPgo+IEkgc3RpbGwgcHJlZmVyIGFkZGluZyBTb0MgcHJlZml4ZXMgdG8gdmFyaWFi
bGUgbmFtZXMgYnV0IG5vdCB0byBjbG9jayBuYW1lcy4KPiBjbG9ja3Mgd2l0aCB0aGUgc2FtZSBu
YW1lIGdlbmVyYWxseSBoYXZlIHNpbWlsYXIgZnVuY3Rpb25zIGFjcm9zcyBkaWZmZXJlbnQKPiBj
aGlwcy4KCkl0IGlzIG5vdCBhIG1hdHRlciBvZiBwcmVmZXJlbmNlLgoKPgo+Cj4+ICogSXQgd291
bGQgaGF2ZSBjaGFuZ2VkIG1vcmUgY2xvY2sgbmFtZXMgYW5kIEkgcHJlZmVyIHRvIG1pbmltaXpl
IHRob3NlCj4+IGNoYW5nZXMKPgo+Cj4gWW91ciByZWNlbnQgcGF0Y2ggc2VyaWVzIGhhcyBhbHJl
YWR5IG1hZGUgc2lnbmlmaWNhbnQgY2hhbmdlcywgYW5kIHRoaXMgaXMKPiByZWxhdGl2ZWx5IGEg
bWlub3IgYWRqdXN0bWVudPCfmIkKPgo+Cj4+ICogSXQgd291bGQgaGF2ZSBjYXVzZWQgc2V2ZXJh
bCBuYW1lIGNsYXNoZXMgd2l0aCBvdGhlciBjbG9ja3MuCj4+Cj4+IHNvIHByZWZpeCBpdCBpcyBm
b3IgdGhlIHBlcmlwaGVyYWwgY2xvY2suCj4+Cj4+IEluIHRoZSBlbmQsIHdoYXQgbWF0dGVycyBp
cyBjb25zaXN0ZW5jeS4KPj4KPj4+Cj4+Pj4gICAgICAgICAgICAgICAgICAgLm9wcyA9IF9vcHMs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gICAgICAg
ICAgICAgICAgICAgLnBhcmVudF9kYXRhID0gJihjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRh
KSB7ICAgICAgICBcCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgLmZ3X25hbWUgPSAjX2Z3
X25hbWUsICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIC5md19uYW1lID0gKF9md19uYW1lKSwgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4+PiAgICAgICAgICAgICAgICAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAgICAgICAgICAubnVtX3BhcmVu
dHMgPSAxLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAg
ICAgICAgICAgICAgICAuZmxhZ3MgPSAoX2ZsYWdzKSwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICB9Cj4+Pgo+Pj4g
Wy4uLl0KPj4gLS0KPj4gSmVyb21lCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
