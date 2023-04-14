Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943C0C77B72
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Apr 2023 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjxZSqoHbgg+m6O2i7YJ8n6ZrugYGOaqZIKFkfP1MSM=; b=H1lg7MjXsFlwsT
	nY6e8qu8k0K7WzcsZ1wTYUOi9thc8F5rd9EuUfJAtI3sxTHmxCjIgSK1kcqwXD0DkXl/WDU361NaQ
	NKL7/UeLlYchSrP+Ym6/Mtw8f0UP6K2Qkga1u93HzCCuoGtHMa/AZKzXcZ2cNgJPFVc6Ysmv03tTk
	DVYzip0UqyBnKtsfY5joLd3KF41sd+1kAYSAm1UyDm9wHNr2guyoVMVxCP07hOJyZLvDk1jDXfWXJ
	0KazwVpe7j8wVei69i8usz59HKWf0epUyON69aHQcn5lGWv6hLR0jfxvIjX9o0PG8M+vNNKq9fep5
	JuqJuVHsOyzJjJHDTkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnPGk-00AStx-0l;
	Fri, 14 Apr 2023 19:39:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnPGf-00AStK-1s;
	Fri, 14 Apr 2023 19:39:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso2696501a12.1;
        Fri, 14 Apr 2023 12:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681501171; x=1684093171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOUCnEhiDn9WO9Wj97pnKuh3/rJWPv57bu1ARRp0RwI=;
        b=HJQS/icdi5x4jS91dUpb6gdjgmoP4TP+3VSr6r0POjnslRTT3xdJ/vnI4VLpa7iC0o
         DL3YTmT8GbneLc/Gbr1VA4xT8I7Id/yP3h1ziUI2C7iNUyaD+M4moC7UlGqC4qvF39d5
         YW1bxwKmyhOGtUQvm+O1saExy+zMR+ILlNZ+wiCGv+EUKb+x1X7blDWEos8pPvQS2UMq
         hnwGfet1tT71lOQDWT+UDixuiMdl8Wb7ka2s6UDNIsCEc/trlQYNmxBjkPIQ1scJIZm2
         MAT/o0b/bHLZCYIq/A1pu874es6mabUYsxWx1PCE8C+jpkXrahpYi/GP04uLqa9ZfbGf
         cBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681501171; x=1684093171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOUCnEhiDn9WO9Wj97pnKuh3/rJWPv57bu1ARRp0RwI=;
        b=fMCsEjYzsIUeS62zoN4qUwskmAsO3N2LwsNgQbbIxWJbqsBbDy7IQijwg/LLpX88gd
         WbmQRTaYfu0A9ELSi0xtuQAN5R89sioEzUgUhKgpWJK92/9XH3vL5yR9ruu0NbCY6jj0
         eXYoUlO2S34TgK8S7pWijsN4cu4Yx4GOmdS62WbIIjoPTFsUbQ6kdXMgEhPUTJM8xqyM
         ylLUA1P9RpZ4zi5ItdRlH2v0zpBKdG5IFaCM1MUvlqW84/jRUURv7RtKsZMz8KmH4evL
         ar5hJ0xumSbRgqCG9AIVz/lwMmfWQCmltxlPxNJwgswIezw12C9HS/5HhUGKycymlrmF
         8AaA==
X-Gm-Message-State: AAQBX9dA3JbBZHslrkm8xGZvdFTbfUc8VYf5F0sKCwlNh9+WXsnxsa4c
	refCmBNZDF3QpFZB1bcKR/jVuu+nmZqSK6RwBmI=
X-Google-Smtp-Source: AKy350aOcGRUdnjHrdFZhalOBxp4kTr1zQnbUAi69XwVgFFazQRQ74ID+kdnjS8NgtA1ov6R2/PZCLHq6F6LZmQcYA0=
X-Received: by 2002:a05:6402:1489:b0:506:8dba:bd71 with SMTP id
 e9-20020a056402148900b005068dbabd71mr935285edv.27.1681501171316; Fri, 14 Apr
 2023 12:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com> <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
In-Reply-To: <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 14 Apr 2023 21:39:20 +0200
Message-ID: <CAFBinCCzMdQZ4mDF7SEZKHc01MPSepxdzYa+j7G-qDXe5-kBVA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_123933_658649_2EDA1067 
X-CRM114-Status: GOOD (  12.38  )
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

SGVsbG8gSGVpbmVyLAoKT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgNzo1NeKAr0FNIEhlaW5lciBL
YWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+IFRlc3RlZC1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
VW5mb3J0dW5hdGVseSBJIGhhdmUgc29tZSBiYWQgbmV3cyBhbmQgSSBuZWVkIHRvIHRha2UgYmFj
ayBteSBUZXN0ZWQtYnkgOi0oClByZXZpb3VzbHkgbXkgdGVzdCB3YXM6IGN5Y2xlIHRocm91Z2gg
YWxsIGF2YWlsYWJsZSBDUFUgZnJlcXVlbmNpZXMKd2hpbGUgc3RyZXNzaW5nIHRoZSBDUFUuCk15
IGFzc3VtcHRpb24gd2FzOiBpZiB0aGUgc3lzdGVtIGRvZXNuJ3QgbG9jayB1cCBldmVyeXRoaW5n
J3MgZmluZQpiZWNhdXNlIHdlIGhhdmUgYSBoaWdoIGVub3VnaCB2b2x0YWdlLgoKVGhpcyBldmVu
aW5nIGhvd2V2ZXIgSSBnb3QgYSBtZW1vcnkgY29ycnVwdGlvbiBlcnJvciB3aGlsZSB0cnlpbmcg
dG8KbG9nIGluIHZpYSBVQVJUIC0gd2hpY2ggSSB0aG91Z2h0IHdhcyBzdHJhbmdlLgpTbyBJIGNv
bm5lY3RlZCBteSBsb2dpYyBhbmFseXplciB0byBteSBPZHJvaWQtQzEgYW5kIGRpZCBzb21lIGV4
cGVyaW1lbnRzOgoKcGVyaW9kID0gMzA1MTgsIGR1dHkgY3ljbGUgPSAxNTI1OSAodHlwaWNhbGx5
IHVzZWQgZm9yIHRoZSAzMmtIegpvdXRwdXQgdG8gdGhlIFNESU8gd2lmaSBjaGlwKQpiZWZvcmUg
eW91ciBwYXRjaGVzIC8gYWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaGVzOgpQV006IGR1dHkgY3lj
bGU6IDUwLjAwMDAwMCUgLyA1MC4wMDAwMDAlClBXTTogcGVyaW9kOiAzMC42IMK1cyAvIDMwLjUg
wrVzClRpbWluZzogVGltZTogMTUuMjkyIMK1cyAoNjUuMzk1IGtIeikgLyAxNS4yNTAgwrVzICg2
NS41NzQga0h6KQpUaW1pbmc6IEF2ZXJhZ2U6IDE1LjI5NiDCtXMgKDY1LjM3NyBrSHopIC8gMTUu
MjY0IMK1cyAoNjUuNTEzIGtIeikKZHJpdmVyIGRlYnVnIG1lc3NhZ2VzIHdpdGggeW91ciBwYXRj
aGVzIGFwcGxpZWQ6CmZpbl9mcmVxOiA4NTAwMDAwMDAgSHoKcGVyaW9kPTMwNTE4IGNudD0yNTk0
MApkdXR5PTE1MjU5IGR1dHlfY250PTEyOTcwCgpUaGVuIEkgdHJpZWQgcGVyaW9kID0gMTIyMTgs
IGR1dHkgY3ljbGUgPSAwICh0eXBpY2FsbHkgdXNlZCBmb3IgdGhlCmhpZ2hlc3QgQ1BVIHZvbHRh
Z2UpOgpiZWZvcmUgeW91ciBwYXRjaGVzIC8gYWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaGVzOgpQ
V006IGR1dHkgY3ljbGU6IDAuMzM4OTgzJSAvIG4vYSAoY29uc3RhbnQgbG93IG91dHB1dCkKUFdN
OiBwZXJpb2Q6IDEyLjMgwrVzIC8gbi9hClRpbWluZzogVGltZTogMTIuMjUwIMK1cyAoODEuNjMz
IGtIeikgLyBuL2EKVGltaW5nOiBBdmVyYWdlOiA2LjE0OCDCtXMgKDE2Mi42Njgga0h6KSAvIG4v
YQpkcml2ZXIgZGVidWcgbWVzc2FnZXMgd2l0aCB5b3VyIHBhdGNoZXMgYXBwbGllZDoKZmluX2Zy
ZXE6IDg1MDAwMDAwMCBIegpwZXJpb2Q9MTIyMTggY250PTEwMzg1CgpGaW5hbGx5IEkgdHJpZWQg
cGVyaW9kID0gMTIyMTgsIGR1dHkgY3ljbGUgPSAxMjIxOCAodHlwaWNhbGx5IHVzZWQgZm9yCnRo
ZSBsb3dlc3QgQ1BVIHZvbHRhZ2UpOgpiZWZvcmUgeW91ciBwYXRjaGVzIC8gYWZ0ZXIgYXBwbHlp
bmcgeW91ciBwYXRjaGVzOgpQV006IGR1dHkgY3ljbGU6IDk5LjY2MTAxNyUgLyBuL2EgKGNvbnN0
YW50IGxvdyBvdXRwdXQpClBXTTogcGVyaW9kOiAxMi4zIMK1cyAvIG4vYQpUaW1pbmc6IFRpbWU6
IDEyLjI1MCDCtXMgKDgxLjYzMyBrSHopIC8gbi9hClRpbWluZzogQXZlcmFnZTogNi4xNDggwrVz
ICgxNjIuNjY4IGtIeikgLyBuL2EKZHJpdmVyIGRlYnVnIG1lc3NhZ2VzIHdpdGggeW91ciBwYXRj
aGVzIGFwcGxpZWQ6CmZpbl9mcmVxOiA4NTAwMDAwMDAgSHoKcGVyaW9kPTEyMjE4IGNudD0xMDM4
NQoKQWZ0ZXIgc2VlaW5nIHRoZSBjb25zdGFudCBsb3cgb3V0cHV0IHdpdGggcGVyaW9kIDEyMjE4
IEkgcmVhbGl6ZWQgdGhhdApteSBwcmV2aW91cyB0ZXN0IHdhcyBubyBnb29kOiB0aGUgQ1BVIHdh
cyBmZWQgdGhlIGhpZ2hlc3QgcG9zc2libGUKdm9sdGFnZSBhbGwgdGhlIHRpbWUuCkl0J3Mgbm90
IGNsZWFyIHRvIG1lIHdoeSBwZXJpb2QgMTIyMTggd291bGQgZ2l2ZSBubyBQV00gb3V0cHV0IGF0
IGFsbAp3aGlsZSBwZXJpb2QgMzA1MTggd29ya3MgZmluZS4KSSBkaWQgYW4gZXhwZXJpbWVudCBi
eSByZW1vdmluZyBDTEtfU0VUX1JBVEVfUEFSRU5UIGZyb20gdGhlIGRpdmlkZXIncwppbml0LmZs
YWdzIC0+IG5vdyBYVEFMICgyNE1IeikgaXMgdGhlIG9ubHkgcG9zc2libGUgY2xvY2sgKGl0J3Mg
dGhlCmhhcmR3YXJlIGRlZmF1bHQpLiBJdCBkb2VzIGluZGVlZCBicmluZyBiYWNrIHRoZSBleGFj
dCBzYW1lIHJlc3VsdHMgYXMKYmVmb3JlICh3aGVyZSB0aGUgWFRBTCBjbG9jayB3YXMgYWxzbyB1
c2VkOyB3aXRoIHRoZSBjaGFuZ2VzIGZyb20gdGhpcwpzZXJpZXMgRkNMS19ESVYzIGlzIG5vdyBj
aG9zZW4sIHdoaWNoIHJ1bnMgYXQgODUwTUh6KS4KCkRvIHlvdSBoYXZlIGFueSBpZGVhIHdoYXQg
Y291bGQgY2F1c2UgdGhpcz8KVGhlIEZDTEtfRElWMyBpbnB1dCBzZWVtcyB0byB3b3JrIGFzIG90
aGVyd2lzZSBwZXJpb2QgMzA1MTggd291bGQgYWxzbyBub3Qgd29yay4KVGhlIGNhbGN1bGF0ZWQg
dmFsdWVzIGFsc28gbG9vayBzYW5lLCBzbyBpdCdzIG5vdCB0aGF0IHdlIGhhdmUgc29tZQozMi1i
aXQgb3ZlcmZsb3cgKGFzIEknbSB0ZXN0aW5nIG9uIGEgMzItYml0IE1lc29uOGIgU29DKS4KCgpC
ZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
