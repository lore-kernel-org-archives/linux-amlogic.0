Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D00C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 05:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ocAIlVIrMWxlx/+riGF1B3oynbEWJBwKRj8qpQtf2Y=; b=QSnBLRxYQgs1EO
	EVJHpPjUXWT/8E+tNPHkEM/4tAc++6Z7eFkyfp3KFyNnxDQ32adAz0iXBmPYWZcDvE4aRzZdbhPyd
	eE97AV2JcQQyoW1yn3z0UpuFy7VUw62XfwXdzndNfypdDC+j5eEjHiyD7HAk22ODAybLqWb4arYeC
	osLgR0R+vq47W33V6Wmt7pFycjbY8Z7LPG34kT21YdBi11Sz1ZK/BobgIgI8DaENJb3n+Ut/S+uYV
	P0QR2bVSJSlZSXgJOkdUFIqP1khQAZieic9xPmKS0KTvoZKs3xG6B9lZB4Vlv6DP2E1aafkXiosCn
	LdbFmF4gChlakKQVQnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peUH9-00BEgF-17;
	Tue, 21 Mar 2023 05:11:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peUH6-00BEej-1p
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 05:11:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id i10-20020a05600c354a00b003ee0da1132eso2127492wmq.4
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 22:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679375461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCtWwQR28Tf7UMC/1iAqkjlhqVHUlwW/Ubw19PfkJIY=;
        b=eiH13baf9XvbYOtixpZdx6iT9FxgMS/+Cf3V+wNSt2y0sN66RF6nKo44Z/IYBjD6JR
         e/gb40Kb2GhOCHMwq7GKgPxLQI0POhGWIPD7b2wswBFg9xqCtYH5v01tMmqis3CInio2
         oh1WpwDEL3b91e89mBZwk/sOoHeUHCfnH4UubLymCjuVi8N4jNgbnqi25vj6soLrBH9G
         GCLB70NM7wa80lpGMb9VG1KV/GVAyzf1sTTZv1Rkfh0AXr/f+cpCKDpl/xgT7ttt8NqI
         EXAfAk0PCrDjBXTVlui4EyoqQUICp0Bj535kCl757L0Cuc4IQgFELsxigFMncFm9cbT9
         UfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679375461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCtWwQR28Tf7UMC/1iAqkjlhqVHUlwW/Ubw19PfkJIY=;
        b=NYmVB1kH3nuFYzj+qzIHTjWz7G1XXhSNZPw2/v32IjOTSFEvNaTXDPYc8Xwfe1tBzu
         tm38PthjFMDKY53dzVXr4BWHdqJf6yVEq8yRINwkLwG8xSKD0rcaSVvy6CBfwyKjkVi+
         ChZdxHX+GRDi0TwEqRCJ69GVny4TH1tEQGZTMxydCuLzAc+YXfhX//5eeocGTpa9YP8o
         r7mXS+f7jbnrbnjRO70ZOTOKx3kEMdRmowq29WGQctMxeGJhbRtK7RYpuWJiBXqpigt/
         SFPOcrmOef0Vt6QO38fi4/y39yy7kiq/8+1XHa1eb0jn27OGkhV4eZYSf0mQlor5s95x
         xR5Q==
X-Gm-Message-State: AO0yUKXOo5tK5eUy0dkm8d4+64iLG98xhVDWDcCHuc5fNoR8S51g8s/3
	OT6Gz3fBclrMJua3KBZLcWpRNMgZh6MfmMr+
X-Google-Smtp-Source: AK7set8k4rrxv2YWgVlnLsnVPoEsBltbiKqru2Y4Sn0ss4wkMsnLBpzyWxGqTvmBk9Qa3beqBQruqQ==
X-Received: by 2002:a05:600c:2241:b0:3ed:237f:3da with SMTP id a1-20020a05600c224100b003ed237f03damr1296613wmm.22.1679375461501;
        Mon, 20 Mar 2023 22:11:01 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc356000000b003ed2fb86f85sm12227001wmj.47.2023.03.20.22.11.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2023 22:11:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH 29/33] doc: boards: amlogic: update documentation for
 WeTek Core2
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAPnjgZ1HW1x3CJ27icDifh4+hjUJjpwCM--FtatzJhrWjkEueA@mail.gmail.com>
Date: Tue, 21 Mar 2023 09:10:58 +0400
Cc: u-boot@lists.denx.de,
 u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Message-Id: <4DEEACF6-2D41-499E-A2E0-C2DD31E28B03@gmail.com>
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-30-christianshewitt@gmail.com>
 <CAPnjgZ1HW1x3CJ27icDifh4+hjUJjpwCM--FtatzJhrWjkEueA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_221108_604612_1B6FE09C 
X-CRM114-Status: GOOD (  14.52  )
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

Cj4gT24gMjAgTWFyIDIwMjMsIGF0IDEwOjQwIHBtLCBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVt
Lm9yZz4gd3JvdGU6Cj4gCj4gSGkgQ2hyaXN0aWFuLAo+IAo+IE9uIFR1ZSwgMjEgTWFyIDIwMjMg
YXQgMDY6MDUsIENocmlzdGlhbiBIZXdpdHQKPiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+
IHdyb3RlOgo+PiAKPj4gSW1wcm92ZSBkb2N1bWVudGF0aW9uLgo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4+IC0tLQo+
PiBkb2MvYm9hcmQvYW1sb2dpYy93ZXRlay1jb3JlMi5yc3QgfCA4MyArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tCj4+IDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAzNiBk
ZWxldGlvbnMoLSkKPiAKPiBUaGlzIHNob3VsZCByZWFsbHkgbW92ZSB0byBiaW5tYW4uIFdvdWxk
IHlvdSBsaWtlIHRvIHRha2UgYSBsb29rPwo+IAo+IEkgc2VudCBhIHBhdGNoIGZvciB0aGlzIGEg
d2hpbGUgYWdvIGJ1dCBpdCBuZWVkcyBzb21ldGhpbmcgdG8gcmV2aWV3Cj4gYW5kIHRyeSBvdXQu
Cj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIw
MjIwMTEwMDMxNDEzLjE5NzA4MzYtMzktc2pnQGNocm9taXVtLm9yZy8KPiAKPiBJIGFtIGhhcHB5
IHRvIGRvIG1vcmUgb24gaXQgYXMgbmVlZGVkLgoKSGVsbG8gU2ltb24sCgpGb3Igbm93IHRoaXMg
aXMganVzdCBhIGNsZWFudXAgYnV0IGxvbmdlci10ZXJtICh3b27igJl0IGJlIHF1aWNrKSBJIGNh
bgp0YWtlIGEgbG9vay4gRG8geW91IGhhdmUgdGhhdCBzZXJpZXMgcmViYXNlZCBhZ2FpbnN0IGN1
cnJlbnQgYW5kIGluIGEKcmVwbyBzb21ld2hlcmUgZm9yIGVhc2llciBjaGVycnktcGlja2luZz8K
CkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
