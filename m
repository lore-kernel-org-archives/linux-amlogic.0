Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C333FCAC5B5
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Sep 2025 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5iCvpvhjDe3a/B1GMSFEPNAe3iNOqyIkGC731D5tRY=; b=gBruBKA5OqASwY
	pz8ITkRo3b3FkKhFjApwuQR0KEzbnB+MljlnrzDLoiekgkQKWRGCj0aVFSQ7oRj76kOOJ+FM+pV3h
	SVdDxQJ9pNSGbYnG9DB9J5txoc/h+m6OZwSY8TPsAPYl/Cq+YEA5WWlp2RrudhCWSmE1vzdn4dPt5
	0ffoCC870r87FlMzHwUcxdjqnA9G3Rds3x0x+BTyBsZxi5vaiSJo/UpWhn3txaS/uAJcM3yMogBww
	X24YbuuggJQLYJhUyO/zBZU1VZW51D4qfydDXKwhi8mV5zxcKlJ09lqdAhIl2DoKxPcMNUq1p/7tt
	Ck+enqgLfsnjNMye7uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v313T-00000000ZCK-3MeP;
	Sun, 28 Sep 2025 23:43:47 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v313Q-00000000ZAo-2jih
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Sep 2025 23:43:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso4763968e87.3
        for <linux-amlogic@lists.infradead.org>; Sun, 28 Sep 2025 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759103022; x=1759707822; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYuGJU4VUHZh3LQSBZZJ1m72z3IXmhn5eD65/qtg9hg=;
        b=eZztA+/+iVrUgcO5ix58IVcLWXT0r+L4ebTNaVsM3H6IBc/8BonldiHZXOOq49LY6/
         3yvLZMLd6ojmHMq4hT9EbPudBksWcjSloCtrhrBXdBQFaJ29ha77mSIFoHrnOuil4LRQ
         Y79ZWR8selgylTkC6tbVIir/mOICNiaeei26EuAFNJFj3Jzuehv6c+U5SpYDYucc7nuY
         vUDDEa4IQV+HWoaFRvXkDxsIkLubrleJXt5lA9TYQnICiHxVPqhwgHPSl/x1BysTWMWd
         xmBgh5ZTy5Dfbi55XKQHW4PEm6w0ivl7P72TQFbdJ7fqFmbXED3AT0C6DKYcfU0h9eBg
         jAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103022; x=1759707822;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYuGJU4VUHZh3LQSBZZJ1m72z3IXmhn5eD65/qtg9hg=;
        b=wcv5WX8iftCG/6/SgdSIkqS7R71MTvcsk607feyRDn//bEE0pkbOclCaeGzPEdRCeA
         lbmHybNCkWA5ySuOHjxMnqEOOemxeeUfFPv+X5/Uv8/oxcgIMClMBEUeuETgniYpnBal
         G6TXIoWMhYpzbpDoLCrGrTfgpLQHOx79j2+9ORJA0tLgalTEJt6Le2mopDQg7Z3/suE6
         AsAXClp1mL/STHAfTBj6uKvXxdG2z+wcwgvCVCOwJfY07E3lc3Zq1Q64M4TeUr4geK7H
         86lvPcf65DN133+ewPHOVGw6b1gOySCMHncypmKvKcy1gIdGLCA5y8PdESDSmFOrcUiT
         uqTw==
X-Forwarded-Encrypted: i=1; AJvYcCUDffCf2fv60Yl8+HKQI6vU0iba1twuzi7d2qEBOLzwBCLhpjBGCagB3n8Xbp3MQY8DRQv5JrawnJO1qYRS@lists.infradead.org
X-Gm-Message-State: AOJu0YxxzmXblzbNOr2p4KKeYGEsN6uNHmEA2PkEi5aCUBPY7VNRp/++
	978D3RTb6GO1clgqk4wDw1sq3KXZO3fhT9jjVDHZBEKaVsU0se3LdIwn
X-Gm-Gg: ASbGncs34e1aGaOAfzw+c1sGdSMl66cIu1PBcZ4IlFFgyNIWbOMBWs24l8LDwllsNLJ
	D23dWEUfpiKRMlU/HziczfjCKlm3bwAnnhkUus6ssfv/pJZxBHcYhm8yghsPBfUAsutsvTPQUge
	e1ElFf26VswBOh1ZmLFF9o1y3vpC8+evEvr73NVju5V+pGR8tCsamlWIEl2axWbhA9lbsbwBpbj
	tp3cwhVfRLMAYfRO9oqn4oOTX0ZnOxX56LQJhUcSddM0G1zpYkQpBjZpn8vOEG+xKF4nVjsvQOT
	uHcg6duUwP3elZG19wzJJHs8P6/Ma66lIUKHgPtT8hQMa3tAo7q/Eo9Fy13LoXgScG1WwFI+IAo
	gAW16Dmbrc2urwQNQFVFVxvtOTykEyp5FosCNb/R+fz8PbrOlaQ0YsFzQFw==
X-Google-Smtp-Source: AGHT+IHR/3oBhcou/nqFCZJEmzF9GzjQUOYYNk7PFauGlRhY9drF2R0iP+r/p0o6ucZSI3AqqdXoWQ==
X-Received: by 2002:a05:6512:3ca2:b0:55f:6adb:b867 with SMTP id 2adb3069b0e04-582d3111187mr4279256e87.45.1759103021915;
        Sun, 28 Sep 2025 16:43:41 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5879e9b80cesm512772e87.112.2025.09.28.16.43.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:43:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
Date: Mon, 29 Sep 2025 03:43:26 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
 <20250927125006.824293-2-christianshewitt@gmail.com>
 <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_164344_700848_5383D692 
X-CRM114-Status: GOOD (  12.31  )
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

PiBPbiAyOSBTZXAgMjAyNSwgYXQgMToxMuKAr2FtLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiAKPiBIaSBDaHJpc3RpYW4s
Cj4gCj4gdGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghCj4gCj4gT24gU2F0LCBTZXAgMjcsIDIwMjUg
YXQgMjo1MOKAr1BNIENocmlzdGlhbiBIZXdpdHQKPiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5j
b20+IHdyb3RlOgo+IFsuLi5dCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1neG0tdHg5LXByby5kdHMKPj4gQEAgLTAsMCArMSw5MCBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+PiArICogQ29weXJpZ2h0
IChjKSAyMDE2IEVuZGxlc3MgQ29tcHV0ZXJzLCBJbmMuCj4+ICsgKiBBdXRob3I6IENhcmxvIENh
aW9uZSA8Y2FybG9AZW5kbGVzc20uY29tPgo+IElzIENhcmxvIHJlYWxseSB0aGUgYXV0aG9yPwoK
SGXigJlzIHRoZSBhdXRob3Igb2YgdGhlIG9yaWdpbmFsIGRldmljZSB0cmVlIHRoYXQgOTUlCm9m
IHRoZSBjb250ZW50IGZvciB0aGlzIG9uZSBpcyB0YWtlbiBmcm9tOyBhcyBpcyB0aGUKY2FzZSBm
b3IgbW9zdCBvbGRlciBBbWxvZ2ljIGhhcmR3YXJlLiBUaGUgZGVjaXNpb24Kb24gd2hpY2ggYml0
cyB0byBjb3B5IGFuZCBwYXN0ZSB3YXMgYWxsIG1pbmUsIGJ1dCBJ4oCZbQpub3QgIHN1cmUgdGhh
dCBza2lsbCBkZXNlcnZlcyB0b28gbXVjaCBjcmVkaXQgOikKCkkgY2FuIHJlc2VuZCB3aXRoIG15
IG93biBuYW1lIChvciBtaW5lIGFwcGVuZGVkKSBpZgp0aGF0IHdvdWxkIGJlIHByZWZlcnJlZD8K
CkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
