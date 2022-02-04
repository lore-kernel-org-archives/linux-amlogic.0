Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910E6C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dtNA4M3Z2HH7U2YeHaXI4LEgoFOJKZgS4fWm7Lmd+g=; b=adVpoQ/Oh8rDOD
	wqqZI3EbUxZ5NN3KPfW0Gc8Xdw5ySjzF4h9tzw0DFbF8MgVLUc5gH5ONvsrg2W1oPL24goLx7JxwH
	B0115I72wxK9faeaTKwpPmXjhblgPU9GeyPjsqIvMQaL/91POrJ4fcIEPFfOOdaEr2chhiKGgcO+Z
	5w1ftjy2glUClentBpxVSd7rh4U+ehdPRrD3qLQFqOmxlgTepGvfXxDthXPHR0Jj/ENS2FcBg+gzg
	ubfya4hR6Ud2AenHUxm0WJkYT87H/heBBttxeqrR9ED6HDyppyi93xzhV8CAvh0WJmiRNgXhy5rD8
	K9RECwryenmO9/kEXSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFtsb-003lFB-7L; Fri, 04 Feb 2022 08:23:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtsL-003l4x-3z
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:23:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m14so9775217wrg.12
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WsA2JKphRpijiftuKihdH23TIHoxkoFN5l3LxYwIuqU=;
 b=PoPP7HMJmxsQTyGfKRP63CZD5spkJJoTwkFWwm2aTTiJLOUTv5bb4S+9zlgvsfaj07
 46zqVF1GVv3CMYYmRDKXRKC3IGJrfC+ejq0IuOUXbxXnilAI64yvPua76WbENjCmh78c
 R9M0XvRi3rVolFyXvJEn5hvNbFYBezWjwp3EydKeBknyGmde5QnPFAMElrPSyOUFq7Yg
 2hzzQm1phOGDVsdHtP3SjMRl0BcaropWCaoUXSvggkMar0GeZCnfiDvOyMTOok2+bW8t
 ZGeLFRIxprgkER+sIV1QMuG43hVjULTuAAKj4+dKZCUejPw52RlwCqc42pyKmg3T7V+J
 0+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WsA2JKphRpijiftuKihdH23TIHoxkoFN5l3LxYwIuqU=;
 b=g9GguWz+DIwo8yTQemaA8jCT6McUzq0Zc0C4JYOIuwzQxx39x/Dj0WNh72ClFggKH5
 Zn17L8mKcOrfpS1UrIIDwSNjq7tfKim0yg93hkWF4yWg2HRSOZm5b9W3iVCD7r5N2JTN
 PfkGc0AmIfpAvc+f3mQahwM7bu6XJAAVT8RnN4YVXR84x72+5fwqqpZq9ZEhVIzaVAnT
 1nd8iEpKCELH4piP1WmwXOjFhmC2kiGH+XZUco/1sbDALtp4B866pChIv2jx8U2vTL7f
 xsXdbicMMFnany12uExFG2prtn8NA6/TAa5iht/tzRsOhpw6oEOiUA4YFNMC9h2BFoGR
 09vA==
X-Gm-Message-State: AOAM532j+Zjauqfaio2MQZ0PwNx4Nrya98qHFhQ5aBWV4Ah5TbhgkN0n
 fjxYjpsUpWT6KSMnp/0srHlRSQ==
X-Google-Smtp-Source: ABdhPJyf9JLV02jOegwiuzsQi/Mp6bxZdm6QLt9GlBXUY1uydNiZUAieAPIQ9343mdk1++V99qMmQg==
X-Received: by 2002:adf:edc7:: with SMTP id v7mr1440216wro.584.1643963003539; 
 Fri, 04 Feb 2022 00:23:23 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 s22sm8914078wmj.38.2022.02.04.00.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 00:23:22 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Lutz Koschorreck <theleks@ko-hh.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson-sm1-odroid: fix boot loop after reboot
Date: Fri,  4 Feb 2022 09:23:15 +0100
Message-Id: <164396299209.31118.5895566929848483023.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128193150.GA1304381@odroid-VirtualBox>
References: <20220128193150.GA1304381@odroid-VirtualBox>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_002325_222134_BA64610A 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

SGksCgpPbiBGcmksIDI4IEphbiAyMDIyIDIwOjMxOjUwICswMTAwLCBMdXR6IEtvc2Nob3JyZWNr
IHdyb3RlOgo+IFNpbmNlIHRoZSBjb3JyZWN0IGdwaW8gcGluIGlzIHVzZWQgZm9yIGVuYWJsaW5n
IHRmLWlvIHJlZ3VsYXRvciB0aGUKPiBzeXN0ZW0gZGlkIG5vdCBib290IGNvcnJlY3RseSBhZnRl
ciBjYWxsaW5nIHJlYm9vdC4KPiAKPiBbICAgMzYuODYyNDQzXSByZWJvb3Q6IFJlc3RhcnRpbmcg
c3lzdGVtCj4gYmwzMSByZWJvb3QgcmVhc29uOiAweGQKPiBibDMxIHJlYm9vdCByZWFzb246IDB4
MAo+IHN5c3RlbSBjbWQgIDEuCj4gU00xOkJMOjUxMWY2Yjo4MWNhMmY7RkVBVDpBMEY4MzE4MDoy
MDI4MjAwMDtQT0M6QjtSQ1k6MDtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4MTtTRD86
MDtTRDowO1JFQUQ6MDswLjA7Q0hLOjA7Cj4gYmwyX3N0YWdlX2luaXQgMHgwMQo+IGJsMl9zdGFn
ZV9pbml0IDB4ODEKPiBodyBpZDrilpJTTTE6Qkw6NTExZjZiOjgxY2EyZjtGRUFUOkEwRjgzMTgw
OjIwMjgyMDAwO1BPQzpCO1JDWTowO1NQSU5PUjowO0NISzoxRjtFTU1DOjgwMDtOQU5EOjgxO1NE
PzowO1NEOjQwMDtVU0I6ODtMT09QOjE7U1BJTk9SOjA7Q0hLOjFGO0VNTUM6ODAwO05BTkQ6ODE7
U0Q/OjA7U0Q6NDAwO1VTQjo4O0xPT1A6MjtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7TkFORDo4
MTtTRD86MDtTRDo0MDA7VVNCOjg7TE9PUDozO1NQSU5PUjowO0NISzoxRjtFTU1DOjgwMDtOQU5E
OjgxO1NEPzowO1NEOjQwMDtVU0I6ODtMT09QOjQ7U1BJTk9SOjA7Q0hLOjFGO0VNTUM6ODAwO05B
TkQ6ODE7U0Q/OjA7U0Q6NDAwO1VTQjo4O0xPT1A6NTtTUElOT1I6MDtDSEs6MUY7RU1NQzo4MDA7
TkFORDo4MTtTRD86MDtTRDo0MDA7VVNCOjg7Cj4gCj4gWy4uLl0KClRoYW5rcywgQXBwbGllZCB0
byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbWxvZ2lj
L2xpbnV4LmdpdCAodjUuMTcvZml4ZXMpCgpbMS8xXSBhcm02NDogZHRzOiBtZXNvbi1zbTEtb2Ry
b2lkOiBmaXggYm9vdCBsb29wIGFmdGVyIHJlYm9vdAogICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL2FtbG9naWMvYy9lNmIwMzM3NTEzMmZlZmRkYzU1Y2Y3MDA0MThjZjc5NGIzODg0ZTBjCgot
LSAKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
