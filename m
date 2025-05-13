Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461A9C3ABCC
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 15:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ8EIw72/jBtiPT21P7NwSK72R3VETzHsfaym2B2vlM=; b=EzckIyKH5tDiFJ
	o48iyST3MiMAdGLkv3Zf8D6GA7nhS7SEXavwzlNu+RA2NJq1LZIviK17WWZXEaNgSaz9HMS97M7A9
	CEzwiyMId6WlWtSCI/Z3wtd+/7Z3OGvgQmkBKyu7C2kd95lZZcRnq+dHG0anRKVdxSbaEiBtWHSCE
	QYVUtIqPkCoQFz5GuF5n08f5jrmhjmh5m9+1/de5EEVmvGHJgVyNIMjd3UjowgQfsJNw9a+jJn+kv
	spJtUORgBQTJq6NETB1VU/jEwdJ/fYG7hr9g4mlVUP6MRQoTjy9IGe14sUG/lFC6nS7b+kqzJcDO9
	lhIdqQ919UwHRAAfWwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEruV-0000000CqZu-2opG;
	Tue, 13 May 2025 15:51:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErrS-0000000Cpue-2DVf
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 15:48:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so5598629f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747151285; x=1747756085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twMFRJTKXRFBljK7BAdqD+Wqm66eVS8qvsxadlyE9g0=;
        b=NpCBw3KOYRXWGqliPi35fjTYVujJVMxZrc+K5Krx6+YdCYmQLB0NnYCGxEh7ZPvKCB
         tKG9MEqN0/YJsyKZFQGx7vakaeiKi/dc7KkhrQdpAjgg7HU8dH0Ns/rqrcd3t6a+dfIB
         IfV6A06udHqPATrcxn4lJmJS9IW/90USpbw1jAhEKYjikS+OoQmfgPIMYSaTV7xAQ5vj
         I617TtvOIE76/KU5nB+dXia4kW4Cz5sua1LmuI5+pvHTAIMzMvKHL+WdXn5QlvyObWOm
         6IzHFeC5aA4BJUUvW3OfQjK45i2XSxYw/Eb8FhDvLOW//kkkhrP6krqRKSJ8jHiWYXfr
         gH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151285; x=1747756085;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twMFRJTKXRFBljK7BAdqD+Wqm66eVS8qvsxadlyE9g0=;
        b=ZrHgrQHIBDNrCn+pPJCFlLLa+TraY/j14tw6H38iyfAgba96in+okW5RQ16BcTqhVP
         RU+pLcFpVpWJDOLEFR8zxZSP9rUdz4LmUfkTtZ6hLeUE5NnFcLtJYYILVWJMSPYEfPD5
         FvNV7+S7EWsgks51rHcZ4Ps1lHRhLBqzvxcKZ1WbTaTK2oMufJzyvDSuj4KkGGDBnnQV
         Dhx+JRnleSw0A6LQB9L/eEXQ3wWXSvvPi/KS2eOBoMqvabIgjLa7kS9P5RCPWIXPwhq4
         ruUXNIhduQT3ja5jr1/4PK9+iEc/2GHhhrPIjhTo3yPC1CthSmchtrQwerB7MBPaqj54
         QTBw==
X-Forwarded-Encrypted: i=1; AJvYcCWmRJYXsvs97etZyaLckATGajtEGwjk/p47zm3l2GehKtfbS7FXMy/UQ7Y4DiYl+334biFIoa6mb6ZG0eVE@lists.infradead.org
X-Gm-Message-State: AOJu0YxMsIRpkdCSf1h8xPYWJUp6YCHr5lituuOavYcThdwlGnlD48sZ
	heshkZx96roGFUAfpgT4si1raQXZ3CBLb1E3NrKx7sUg1Qa3uByqpbN93iIjCxMqYCjEWv9sOAY
	C
X-Gm-Gg: ASbGnctgzvvlbaBxcdreohma7ViAXkootfRVraY84kbCrdoT+S7HuWLTgHhqpSo1/MX
	FTtpgjY9DyNqupXU2O74yvkHsLvUrwfjF3Zd/s+nbSCZvvXGdpPaZ6KRQZyWhC5dlQqzAAXgHq1
	5nRx5lHOMhv0bYTojN6XpHuR8eqb76zmuwTE5z4sF9RZrjp7BFwGSZcW+2LcwiqEesL+D7ZCf2J
	rNxWhaLFOtpteC99msiwP9gAQE6ukJ5cKhBkgcasC9V2G8OhX8QUZsCACt92FlPv9cU/5iOqUFY
	gwe4qJqH7znkyS1VpQ78mPei7t5JjSUm8MorSrtFht3C9DkboBQ=
X-Google-Smtp-Source: AGHT+IGwvBiWlgqbXuP8q12INpK112AxGYeN5PxjFrpvlMGtcULzZODQsT3BNuhxlCXGSL0e+o8cKg==
X-Received: by 2002:a05:6000:1884:b0:3a2:2d6:4205 with SMTP id ffacd0b85a97d-3a202d6427cmr9422854f8f.47.1747151284596;
        Tue, 13 May 2025 08:48:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:26f2:6152:bc18:9105])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2fc4sm16882155f8f.56.2025.05.13.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:48:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  sboyd@kernel.org,  daniels
 <daniels@collabora.com>,  Daniel Stone <daniel@fooishbar.org>,
  lumag@kernel.org,  robdclark <robdclark@gmail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
In-Reply-To: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com> (Vignesh
	Raman's message of "Tue, 13 May 2025 19:56:29 +0530")
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
	<b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
	<714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 May 2025 17:48:03 +0200
Message-ID: <1j5xi4zf4c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_084806_569622_9F4F8B60 
X-CRM114-Status: GOOD (  16.91  )
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

T24gVHVlIDEzIE1heSAyMDI1IGF0IDE5OjU2LCBWaWduZXNoIFJhbWFuIDx2aWduZXNoLnJhbWFu
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgoKPiBIaSBOZWlsLAo+Cj4gT24gMTMvMDUvMjUgMTU6MjUs
IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+IEhpLAo+PiBPbiAxMy8wNS8yMDI1
IDExOjQxLCBWaWduZXNoIFJhbWFuIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gVGhlIEFtbG9naWMg
TWVzb24gRzEyQiAoQTMxMUQpIFNvQyBib2FyZCAobWVzb24tZzEyYi1hMzExZC1raGFkYXMtIHZp
bTMpCj4+PiBmYWlscyB0byBib290IHdpdGggdGhlIGZvbGxvd2luZyBsb2dzLAo+Pj4KPj4+IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aWduZXNocmFtYW4vbGludXgvLS9qb2JzLzc2
MjEwMjAwCj4+Pgo+Pj4gMDI6NTg6MjcuODE5OiBTdGFydGluZyBrZXJuZWwgLi4uCj4+PiAwMjo1
ODoyNy44MTk6ICJTeW5jaHJvbm91cyBBYm9ydCIgaGFuZGxlciwgZXNyIDB4OTYwMDAwMTAsIGZh
ciAweDUxMDAwZDgKPj4+IDAyOjU4OjI3LjgxOTogIlN5bmNocm9ub3VzIEFib3J0IiBoYW5kbGVy
LCBlc3IgMHg5NjAwMDAxMCwgZmFyIDB4NTEwMDBjOAo+Pj4gMDI6NTg6MjcuODE5OiBlbHI6IDAw
MDAwMDAwMDEwMDJhNDggbHIgOiAwMDAwMDAwMDAxMDAyYzg4IChyZWxvYykKPj4+IDAyOjU4OjI3
LjgxOTogZWxyOiAwMDAwMDAwMGYyZjI2YTQ4IGxyIDogMDAwMDAwMDBmMmYyNmM4OAo+Pj4gMDI6
NTg6MjcuODE5OiB4MCA6IDAwMDAwMDAwMDUwZmZmYzAgeDEgOiAwMDAwMDAwMDAxMDA0MzgzCj4+
PiAwMjo1ODoyNy44MTk6IHgyIDogMDAwMDAwMDBmMmY2YTM1OCB4MyA6IDAwMDAwMDAwMDAwMDAw
M2YKPj4+IDAyOjU4OjI3LjgxOTogeDQgOiAwMDAwMDAwMGY0ZmVmZmZjIHg1IDogMDAwMDAwMDAw
MDAwMDAxMAo+Pj4gMDI6NTg6MjcuODE5OiB4NiA6IDAwMDAwMDAwZjRlNWIwMDAgeDcgOiAwMDAw
MDAwMDA1MGZmZmEwCj4+PiAwMjo1ODoyNy44MTk6IHg4IDogMDAwMDAwMDAwMDAwMDAwOCB4OSA6
IDAwMDAwMDAwMDAwMDAwMDEKPj4+IDAyOjU4OjI3LjgyMDogeDEwOiAwMDAwMDAwMDAwMDAwMDEw
IHgxMTogMDAwMDAwMDAwMDAwMDAwNAo+Pj4gMDI6NTg6MjcuODIwOiB4MTI6IDAwMDAwMDAwZjRm
ZWZjMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiAwMjo1ODoyNy44MjA6IHgxNDogMDAwMDAw
MDBmNGZlZmMwMCB4MTU6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IDAyOjU4OjI3LjgyMDogeDE2OiAw
MDAwMDAwMGYyZjZkMGUwIHgxNzogMDAwMDAwMDAwMGMwYzBjMAo+Pj4gMDI6NTg6MjcuODIwOiB4
MTg6IDAwMDAwMDAwZjBmMjFkOTAgeDE5OiAwMDAwMDAwMDA1MGZmZmMwCj4+PiAwMjo1ODoyNy44
MjA6IHgyMDogMDAwMDAwMDAwMDAwMDAwMCB4MjE6IDAwMDAwMDAwN2ZmZTkwMDAKPj4+IDAyOjU4
OjI3LjgyMDogeDIyOiAwMDAwMDAwMDAwMDAxNzEwIHgyMzogMDAwMDAwMDBmMGYwZThjMAo+Pj4g
MDI6NTg6MjcuODIwOiB4MjQ6IDAwMDAwMDAwMDAwMDAwMDAgeDI1OiAwMDAwMDAwMDAwMDAwMDAw
Cj4+PiAwMjo1ODoyNy44MjA6IHgyNjogMDAwMDAwMDAwMDAwMDAwMCB4Mjc6IDAwMDAwMDAwMDAw
MDAwMDAKPj4+IDAyOjU4OjI3LjgyMDogeDI4OiAwMDAwMDAwMGYwZjRmNzkwIHgyOTogMDAwMDAw
MDAwNTBmZmY2MAo+Pj4gMDI6NTg6MjcuODIwOiBDb2RlOiBhOTAyNWJmNSBmOTAwMWJmNyBmOTQw
MDY0MSAzNjAwMDE0MSAoZjk0MDg2NjMpCj4+PiAwMjo1ODoyNy44MjA6IFJlc2V0dGluZyBDUFUg
Li4uCj4+Pgo+PiBDb3VsZCB5b3UgYm9vdCB3aXRoIGVhcmx5Y29uIGVuYWJsZWQgdG8gYXQgbGVh
c3QgaGF2ZSBhIGNsdWUgb2Ygd2hhdCdzCj4+IGhhcHBlbmluZyA/Cj4KPiBUaGVyZSBpcyBhIHN5
bmNocm9ub3VzIGFib3J0IHJpZ2h0IGFmdGVyICdTdGFydGluZyBrZXJuZWwuLi4nLiBNYXliZSB0
aGlzCj4gcHJldmVudHMgYW55IGVhcmx5IGNvbnNvbGUgbG9ncyBmcm9tIGFwcGVhcmluZy4KPgo+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aWduZXNocmFtYW4vbGludXgvLS9qb2Jz
Lzc2MjQzNDU1CgpJJ3ZlIGp1c3QgdHJpZWQgdG8gYm9vdCB2Ni4xNS1yYzEgb24gYSB2aW0zIChB
MzExRCkuIEJvb3RlZCBmaW5lLgoKPgo+IDEzOjU0OjAyLjAxMzogPT4gc2V0ZW52IGJvb3Rhcmdz
ICdjb25zb2xlPXR0eUFNTDAsMTE1MjAwbjggcm9vdD0vZGV2L25mcyBydwo+IG5mc3Jvb3Q9MTky
LjE2OC4yMDEuMTovdmFyL2xpYi9sYXZhL2Rpc3BhdGNoZXIvdG1wLzE4NjQxNjY1L2V4dHJhY3Qt
bmZzcm9vdGZzLWgyZmpzbWRjLHRjcCxoYXJkLHYzCj4gaW5pdD0vaW5pdCByb290d2FpdCB1c2Jj
b3JlLnF1aXJrcz0wYmRhOjgxNTM6ayBlYXJseWNvbj1tZXNvbiwweGZmODAzMDAwCj4ga2VlcF9i
b290Y29uICBpcD1kaGNwJwo+IDEzOjU0OjAyLjAxNDogJCBib290aSAweDEwODAwMDAgLSAweDEw
MDAwMDAKPiAxMzo1NDowMi4wMTQ6ID0+IGJvb3RpIDB4MTA4MDAwMCAtIDB4MTAwMDAwMAo+IDEz
OjU0OjAyLjAxNDogTW92aW5nIEltYWdlIGZyb20gMHgxMDgwMDAwIHRvIDB4MTIwMDAwMCwgZW5k
PTUxNjAwMDAKPiAxMzo1NDowMi4wMTQ6ICMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0
IDAxMDAwMDAwCj4gMTM6NTQ6MDIuMDE0OiAgICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBh
dCAweDEwMDAwMDAKPiAxMzo1NDowMi4wMTQ6IFdvcmtpbmcgRkRUIHNldCB0byAxMDAwMDAwCj4g
MTM6NTQ6MDIuMDE0OiBFUlJPUjogcmVzZXJ2aW5nIGZkdCBtZW1vcnkgcmVnaW9uIGZhaWxlZCAo
YWRkcj01MDAwMDAwCj4gc2l6ZT0zMDAwMDAgZmxhZ3M9NCkKPiAxMzo1NDowMi4wMTQ6ICAgIExv
YWRpbmcgRGV2aWNlIFRyZWUgdG8gMDAwMDAwMDA3ZmZlOTAwMCwgZW5kCj4gMDAwMDAwMDA3ZmZm
ZjU3YyAuLi4gT0sKPiAxMzo1NDowMi4wMTQ6IFdvcmtpbmcgRkRUIHNldCB0byA3ZmZlOTAwMAo+
IDEzOjU0OjAyLjAxNDogU3RhcnRpbmcga2VybmVsIC4uLgo+IDEzOjU0OjAyLjAxNDogIlN5bmNo
cm9ub3VzIEFib3J0IiBoYW5kbGVyLCBlc3IgMHg5NjAwMDAxMCwgZmFyIDB4NTEwMDBkOAo+IDEz
OjU0OjAyLjAxNDogIlN5bmNocm9ub3VzIEFib3J0IiBoYW5kbGVyLCBlc3IgMHg5NjAwMDAxMCwg
ZmFyIDB4NTEwMDBjOAo+IDEzOjU0OjAyLjAxNDogZWxyOiAwMDAwMDAwMDAxMDAyYTQ4IGxyIDog
MDAwMDAwMDAwMTAwMmM4OCAocmVsb2MpCj4gMTM6NTQ6MDIuMDE0OiBlbHI6IDAwMDAwMDAwZjJm
MjZhNDggbHIgOiAwMDAwMDAwMGYyZjI2Yzg4Cj4gMTM6NTQ6MDIuMDE0OiB4MCA6IDAwMDAwMDAw
MDUwZmZmYzAgeDEgOiAwMDAwMDAwMDAxMDA0MzgzCj4gMTM6NTQ6MDIuMDE0OiB4MiA6IDAwMDAw
MDAwZjJmNmEzNTggeDMgOiAwMDAwMDAwMDAwMDAwMDNmCj4gMTM6NTQ6MDIuMDE0OiB4NCA6IDAw
MDAwMDAwZjRmZWZmZmMgeDUgOiAwMDAwMDAwMDAwMDAwMDEwCj4gMTM6NTQ6MDIuMDE0OiB4NiA6
IDAwMDAwMDAwZjRlNWIwMDAgeDcgOiAwMDAwMDAwMDA1MGZmZmEwCj4gMTM6NTQ6MDIuMDE0OiB4
OCA6IDAwMDAwMDAwMDAwMDAwMDggeDkgOiAwMDAwMDAwMDAwMDAwMDAxCj4gMTM6NTQ6MDIuMDE0
OiB4MTA6IDAwMDAwMDAwMDAwMDAwMTAgeDExOiAwMDAwMDAwMDAwMDAwMDA0Cj4gMTM6NTQ6MDIu
MDE0OiB4MTI6IDAwMDAwMDAwZjRmZWZjMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwCj4gMTM6NTQ6
MDIuMDE0OiB4MTQ6IDAwMDAwMDAwZjRmZWZjMDAgeDE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gMTM6
NTQ6MDIuMDE0OiB4MTY6IDAwMDAwMDAwZjJmNmQwZTAgeDE3OiAwMDAwMDAwMDAwYzBjMGMwCj4g
MTM6NTQ6MDIuMDE0OiB4MTg6IDAwMDAwMDAwZjBmMjFkOTAgeDE5OiAwMDAwMDAwMDA1MGZmZmMw
Cj4gMTM6NTQ6MDIuMDE0OiB4MjA6IDAwMDAwMDAwMDAwMDAwMDAgeDIxOiAwMDAwMDAwMDdmZmU5
MDAwCj4gMTM6NTQ6MDIuMDE0OiB4MjI6IDAwMDAwMDAwMDAwMDE3MTAgeDIzOiAwMDAwMDAwMGYw
ZjBlOGMwCj4gMTM6NTQ6MDIuMDE0OiB4MjQ6IDAwMDAwMDAwMDAwMDAwMDAgeDI1OiAwMDAwMDAw
MDAwMDAwMDAwCj4gMTM6NTQ6MDIuMDE0OiB4MjY6IDAwMDAwMDAwMDAwMDAwMDAgeDI3OiAwMDAw
MDAwMDAwMDAwMDAwCj4gMTM6NTQ6MDIuMDE0OiB4Mjg6IDAwMDAwMDAwZjBmNTY2YTAgeDI5OiAw
MDAwMDAwMDA1MGZmZjYwCj4gMTM6NTQ6MDIuMDE0OiBDb2RlOiBhOTAyNWJmNSBmOTAwMWJmNyBm
OTQwMDY0MSAzNjAwMDE0MSAoZjk0MDg2NjMpCj4gMTM6NTQ6MDIuMDE0OiBSZXNldHRpbmcgQ1BV
IC4uLgo+Cj4gU3VjY2Vzc2Z1bCBsb2dzIHdpdGggdjYuMTQtcmM3LAo+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy92aWduZXNocmFtYW4vbGludXgvLS9qb2JzLzc2MjQ4MTQzCj4KPj4g
QlBJLU0yUyAoQTMxMUQpIGlzIGJvb3RpbmcgZmluZSBvbiB2Ni4xNS1yYywgc2VlIGh0dHBzOi8v
Z2l0bGFiLmNvbS8KPj4gYW1sb2dpYy1mb3NzL2FiY2QtbGludXgtdGVzdC8tL2pvYnMvMTAwMDQ5
OTcwMzIKPj4gQnV0IHBlcmhhcHMgc29tZXRoaW5nIHNwZWNpZmljIHRvIHRoZSBWSU0zIGlzIGJy
ZWFraW5nLCBkbyB5b3UgY2hhbmdlIHRoZQo+PiBrZXJuZWwgY29uZmlnIGZvciB0aGUgRFJNID8K
Pgo+IFllcywgd2UgY2hhbmdlIHRoZSBjb25maWcuIFBsZWFzZSBzZWUgdGhlIGNvbmZpZyB1c2Vk
IHRvIGJ1aWxkIHRoZSBrZXJuZWwsCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Zp
Z25lc2hyYW1hbi9saW51eC8tL2pvYnMvNzYyNDM0MzkvYXJ0aWZhY3RzL2ZpbGUvYXJ0aWZhY3Rz
L3Rlc3Rpbmc6YXJtNjRfY29uZmlnCj4KPiBSZWdhcmRzLAo+IFZpZ25lc2gKPgo+PiBOZWlsCj4+
IAo+Pj4gVGhlIGJvYXJkIGJvb3RzIHN1Y2Nlc3NmdWxseSBpbiB2Ni4xNC1yYzcsIGJ1dCB0aGUg
aXNzdWUgYXBwZWFycwo+Pj4gc3RhcnRpbmcgZnJvbSB2Ni4xNS1yYzEuIFRoZXNlIHRlc3RzIHdl
cmUgcnVuIGluIGRybS1jaS4KPj4+Cj4+PiBPbiBiaXNlY3RpbmcgdGhlIGtlcm5lbCwgdGhlIGZp
cnN0IGJhZCBjb21taXQgaWRlbnRpZmllZCBieSBnaXQgYmlzY2V0Cj4+PiBpcywKPj4+Cj4+PiA1
OWMzNTQxNmY0MjQ2YWVlNjZiNWY1NTIzZmRjOTUwYjgzMzI1ZDgyIGlzIHRoZSBmaXJzdCBiYWQg
Y29tbWl0Cj4+PiBjb21taXQgNTljMzU0MTZmNDI0NmFlZTY2YjVmNTUyM2ZkYzk1MGI4MzMyNWQ4
Mgo+Pj4gTWVyZ2U6IDQ3Mjg2M2FiMmFjYSBlOTg4YWRjYjVkZWUKPj4+IEF1dGhvcjogTGludXMg
VG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+Pj4gRGF0ZTrCoMKgIFNh
dCBNYXIgMjkgMTc6MjM6MzQgMjAyNSAtMDcwMAo+Pj4KPj4+IMKgwqDCoMKgIE1lcmdlIHRhZyAn
Y2xrLWZvci1saW51cycgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC8KPj4+
IGtlcm5lbC9naXQvY2xrL2xpbnV4CgpJdCBpcyBvZGQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXMg
YSBtZXJnZSA6LwoKPj4+Cj4+PiBQbGVhc2UgY291bGQgeW91IGxvb2sgaW50byB0aGlzIGlzc3Vl
LiBUaGFuayB5b3UuCgpBc3N1bWluZyBpdCBpcyBub3Qgc29tZXRoaW5nIGluIENDRiBpdHNlbGYs
IDIgY29tbWl0cyBmb3IgdGhpcyBwbGF0Zm9ybQppbiB0aGUgUFIgbWVudGlvbm5lZCBhYm92ZToK
CjAwNzllNzdjMDhkZSBjbGs6IGFtbG9naWM6IGcxMmE6IGZpeCBtbWMgQSBwZXJpcGhlcmFsIGNs
b2NrCjg5OTVmOGYxMDhjMyBjbGs6IGFtbG9naWM6IGcxMmI6IGZpeCBjbHVzdGVyIEEgcGFyZW50
IGRhdGEKCkNoZWNraW5nIHRoZSBjbG9jayB0cmVlLCB0aG9zZSBhcHBlYXJzIHRvIHdvcmsgYXMg
aW50ZW5kZWQsIGluY2x1ZGluZwp0aGUgVklNMyBwbGF0Zm9ybS4KCk1heWJlIHRyeSByZXZlcnRp
bmcgb25lIG9yIHRoZSBvdGhlciwgc2VlIGlmIHRoYXQgY2hhbmdlcyBhbnl0aGluZy4KCj4+Pgo+
Pj4gUmVnYXJkcywKPj4+IFZpZ25lc2gKPj4gCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
