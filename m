Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65452E9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 18:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vszh27C1VOmSunxKZOI7hokhHPWFuxe9HapuddmmsKs=; b=exeCxRIl2A78vU
	tGCaOQUSlKcux/SYuqeqpuP6w7g0HOUD6S4ZD2JTJ8Een3teptODLpkJtU1yyEMb632rEz3OxNqWp
	O3Sa2uV1z0cP9knIXvxWu9Scy0fk779J6Rc0JUVgkZghZejVb7ET+TPxNNC4Kr4nBd5huhd0qamJC
	h5pJNCT8768kN7NgiU60BYOUwtfSAHuaEYReqn8CTHuhhyqvg1hfaAoYGVWJhWayOzeSxwHAZWjh2
	WtBCO2f/FT7htVjur7GyBzyAlC3hEE869FNr1M+GoMXmjCcBySzZLoMFCP43FGopnszVZO+XavwPI
	KsPQEeCIQqHC0YRR2tXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslz5-0000000ADGU-3E3f;
	Wed, 18 Feb 2026 18:09:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslz3-0000000ADFq-0yay
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 18:09:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48374014a77so1114665e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 10:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771438147; x=1772042947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHxKKXGBHlMMgCTEd77iJPpVcu514Qc+HROZ7KUYSWM=;
        b=w7JmwEm1+PyqdGeu7kVxATjC1u7dfWiEXcApC9UVG3EsoT1he5NbPJUHp4m8ZHnxxw
         nkr2THu2o68oU0ZvHUk6tdtCBh8Z+E06+yzdGGAUOfGm9/4486xYLkR+jept7ll77zW7
         TW40rh7QSmOw27Zw6xJCF0KcPzTTq5CeHUwCJ/mSreXECWijSmU7VckNOG3xY03qNOjw
         FgAX7V22QyqJ/eTVZLqNEQHtGKBoAzNFfbcNipf//R/4za7J7LHBX7pb5uEXbaz73911
         FEG0+gADcolvlX5U8vbL1KRTx58oVzp8foeq4aYdcDdweTJqbzAmwVP4H5uf+Txoquyz
         QwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438147; x=1772042947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHxKKXGBHlMMgCTEd77iJPpVcu514Qc+HROZ7KUYSWM=;
        b=DRTf4lw1LShI293IIIRupiq5crM32LPZr6J68+ESZ/cvG2AjBJrthCtc7cKouhak6v
         G4/oot1AVhqWqvYlaVyy6dA2qxWldtvvzosRt5uo6jbVZ1oQFVnc89+JJfm96ih1r7oY
         OXC65CXgP8vJw77lxiirxlG8FriyeFKAO1cZHBzlOFGLL9HB47Mk5WlgpbmvLp82kxTo
         0Jd9xl17DT085NJ14mc/a8lrY3HE35LbHvv6I9m26dmW0cx46hPchx265dE/e91XpEad
         evvEKvRJpGZ3CMql8IZaC1Xy4MFnyD0+7qX2SZOWguTcoz542tJVSWPp0KPfpzTpPISB
         G5sw==
X-Gm-Message-State: AOJu0YxxC6v2fSs8o7q0XVUb0rD9U0hGYmSF7IJuXfba6B2JXqfZjWve
	b30T7Z/GwtCcKSBmRHIEunLdTV7NsX6R3cA6g0ASyXUH41/uQ7G1eiJ+VJ/BoZdRKjA=
X-Gm-Gg: AZuq6aKq42Jo3lsgPJduEL+0KGmSEGVCY7c2D+rCKdiXVTpYzwT+H2QuD3lBoQ+YlHn
	CwSn9LQmMQjkEmhK0mfIUyAJPG7iuHOVS5EGaxczrfHfhdR+B9ZIqGX3ykw+csA4uxPV+HwgcRc
	K9ylYLMS5GBqhQHN9wqJzE+wpTgmJ6nuuMvXZ0sZgvX3hQgdiqy6BQFqin/pZIKPy2mAD/axLkK
	8BVf+k5gq+TavmqmcTyWNYAPNz2C0ked9HuixqrEtBFZ2PAUCllCjNckN6mK4eOW3rg6tWV7H1z
	SkIhDLTOmmAGuFg6fMqfVrSh0kNrdifRtD1beiDRXJV6vSZmtvMp8RmqkUT8DpQutX57pnH/6O5
	4W1b8fTYlw1R30eGqcg1cdAxn6ts20egqqdA/gAvmHnJ/wTngPGx2ulleJr/K8RmxL0Y5HIK2pr
	7njGdBEKVorNSC3ozQLjumYg==
X-Received: by 2002:a05:600c:450d:b0:482:eec4:758 with SMTP id 5b1f17b1804b1-48373a4f05bmr316456575e9.26.1771438147319;
        Wed, 18 Feb 2026 10:09:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4835dcfb28dsm560787365e9.11.2026.02.18.10.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:09:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <20260218105611.36216-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:56:09 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105611.36216-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:09:05 +0100
Message-ID: <1jy0kp6i0u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100909_296707_CA8BAE3C 
X-CRM114-Status: GOOD (  12.97  )
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

T24gbWVyLiAxOCBmw6l2ci4gMjAyNiBhdCAxMTo1NiwgUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+IHdyb3RlOgoKPiBBZGQgUExMIGZvciB0aGUgY2xvY2sgY29udHJv
bGxlciBvZiB0aGUgQW1sb2dpYyBUNyBTb0MgZmFtaWx5LgoKVXN1YWxseSBiaW5kaW5ncyBjaGFu
Z2VzIHNob3VsZCBjb21lcyBiZWZvcmUgdGhlIGRyaXZlciBjaGFuZ2VzIGluIGEKc2VyaWVzLgoK
VGhpcyBpcyBlc3BlY2lhbGx5IGltcG9ydGFudCBoZXJlIGJlY2F1c2UgeW91IGFyZSB1c2luZyB0
aGUgSURzIGluIHRoZQpkcml2ZXIuIFdpdGggb3JkZXIgdXNlZCBoZXJlLCBiaXNlY3QgaXMgYnJv
a2VuLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2
QGFsaWVsLmZyPgo+IC0tLQo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDct
cGxsLWNsa2MuaCB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2Ft
bG9naWMsdDctcGxsLWNsa2MuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyx0
Ny1wbGwtY2xrYy5oCj4gaW5kZXggZTI0ODFmMmYxMTYzLi42OTA0MjEwMDllYWIgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLmgKPiAr
KysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MuaAo+IEBA
IC01Myw0ICs1MywyMCBAQAo+ICAjZGVmaW5lIENMS0lEX01DTEtfMV9QUkUJOQo+ICAjZGVmaW5l
IENMS0lEX01DTEtfMQkJMTAKPiAgCj4gKy8qIEFOQUxPRyAqLwpObyBpZGVhIHdoYXQgeW91IG1l
YW4gd2l0aCB0aGlzIC4uLgoKPiArI2RlZmluZSBDTEtJRF9GUExMX0RDTwkJMAo+ICsjZGVmaW5l
IENMS0lEX0ZQTEwJCQkxCj4gKyNkZWZpbmUgQ0xLSURfRkRJVjJfRElWCQkyCj4gKyNkZWZpbmUg
Q0xLSURfRkRJVjIJCQkzCj4gKyNkZWZpbmUgQ0xLSURfRkRJVjJQNV9ESVYJNAo+ICsjZGVmaW5l
IENMS0lEX0ZESVYyUDUJCTUKPiArI2RlZmluZSBDTEtJRF9GRElWM19ESVYJCTYKPiArI2RlZmlu
ZSBDTEtJRF9GRElWMwkJCTcKPiArI2RlZmluZSBDTEtJRF9GRElWNF9ESVYJCTgKPiArI2RlZmlu
ZSBDTEtJRF9GRElWNAkJCTkKPiArI2RlZmluZSBDTEtJRF9GRElWNV9ESVYJCTEwCj4gKyNkZWZp
bmUgQ0xLSURfRkRJVjUJCQkxMQo+ICsjZGVmaW5lIENMS0lEX0ZESVY3X0RJVgkJMTIKPiArI2Rl
ZmluZSBDTEtJRF9GRElWNwkJCTEzCj4gKwo+ICAjZW5kaWYgLyogX19UN19QTExfQ0xLQ19IICov
CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
