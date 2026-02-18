Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427EE9A047
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MhfP9tW0z8ovmlOLQDG7vthUgBP86ryZn3+ROByCSI=; b=C5/Q8/eyEUNd0D
	qtTm4sattTc+h5h7L0T/+IDY8kWLa2DT9KQOYNmXymviOrC9XxGlFCeku6KFcw1kuOQ9LsPLVLye2
	3IyHliNgDjoGktUjF7QhdZ/QXanZYeTVwRfyIlKlC/jqjPv4SaJH/gjeChCJpA9S8x+nns+2iyjmF
	D99sU0HO69KiECvtTaJuQE5xbrIdyykvjr846dzZOyYjRPD4ck4fbHUNBWam2NFPpu7eCN+Fkq3oE
	761pvFFcDx0e+8gQXUFlIVos+nwYXN496hiEqCN2zDp2tzeY3RXopPhKxmPhGiLnCxquAqzoNWZ7D
	c8kP2aWvrlKDRBkfSTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmJd-0000000AFaL-36Tn;
	Wed, 18 Feb 2026 18:30:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmJZ-0000000AFYu-0alm
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 18:30:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4359249bbacso832252f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 10:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771439419; x=1772044219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=rwsGQfNsxckNPxXed9bbDNvoeb5pn+v5+Q7r71jt0ORvY94FFRZlKc8vPESmG3/QxO
         v3+3SeYMX3bLeOxT2DuJfZP4kgcAHWL1on03TDcZY5QFxahtFjE7COnnWRLq16PtYPnG
         tAgqW/TWo95Zm1QZWBwRg7AaFEtS43rDGq9dBNKcqk4yQOHQ7uMi9AcmURPvxIP02+G1
         VVLPs7jKV8MoYt0yXeYy85KMvfxsVtV8ll0EPvhbWYV9h0EKu534K324v5ExLS+8Vu79
         fPTBRWGIpzKbESn8zYBlsPPRBIos1mwn0bJIyvLSAsqhBJPUOXSB0+AAuElZZ+xgb1Zp
         D4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439419; x=1772044219;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=MiDxzWPJpPxqSTcCMXqQspt4XxI8MukJc59RYlqrd1ToDlrIca2yvlh6qefG4dsL41
         nzVq/MGa/iSE3215rDHe21ro63rcvfz5/EPvjcbkfk6lJvyYIY92uNA6uYbsW/UpP17q
         lW3je8jXt03QdJBk2pCBSkPSi4FA5HZbODeup0DHEeMgBD2FTtx23KZIV9rp8fxNQT0y
         oJ3WrCfwI3ubLw6i2n0A1VzQdMAxNag8Og607JbdOUw++nEXDCxPpNan1CSay5OK6pUy
         64YxesLQL9GaZvz3iQbleUUaEeftoSbz6EJ/ABrtQ7RIpeJJT/xgQXAaXCJzEtxmC/5Q
         g8Pw==
X-Gm-Message-State: AOJu0YzfwQwUrCVFYhkWNsnAYY3SKy2ojORXbhC1v/Tp0ps4Y4I+/z5o
	a14yqXGvgoM0XjMzYFZ/UP2KMCFo/aJ9M7nyLUVGk4JDf9NtOVVQpReIyxjTCX9WNlE=
X-Gm-Gg: AZuq6aL7f/U5hzexEP8C3xZMgCFSQgXaVVl6Z/mhMg/f+qVHDGJopkm6pEQhiQ4WvX6
	X1qSC7Ed4Io6bujFx0PwpomtJZOHEFNaN77tTp2IaMgjg6EfLxdMTsvQzNX0DbetL44NKmA3k1B
	ubJpyaaFcrD3N8HWacY+kXO8LyTowKLq1+YmrVOXqL880O2JzZgtC0JQ7yyrfmh8lG2byW1unki
	btpdrqQKA9HvYZPlu2xGnExPiPk/KtrcY4J5vxfmEWXN75G6p47yLGpqTrQgxuTcbZ3InFrkshx
	xVSxLvWJj9TDBkHk1Ws2e5bAb9562D02IsXR9tW5dXf3OHB79TYvI4xNm9cGr9bsxNcFjrWPOal
	jzUpB3ELf+Ds7vmPZVsMkjJdMd6lOWlZ5InCkSOrAkH7JWovaqu8NcLFctDSZTg7BEcM//9DTWL
	2PU6NetVsxHpMf21R88kQXPg==
X-Received: by 2002:a05:6000:400d:b0:436:e875:7911 with SMTP id ffacd0b85a97d-43958be4a76mr5368651f8f.4.1771439419072;
        Wed, 18 Feb 2026 10:30:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a6b563sm43048552f8f.12.2026.02.18.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:30:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: clk: meson: Add Amlogic T7 sys pll support
In-Reply-To: <20260218110018.36348-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 12:00:15 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218110018.36348-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:30:17 +0100
Message-ID: <1jjyw96h1i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_103021_223669_72C57CF1 
X-CRM114-Status: GOOD (  13.63  )
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

T24gbWVyLiAxOCBmw6l2ci4gMjAyNiBhdCAxMjowMCwgUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+IHdyb3RlOgoKPiBBZGQgU1lTIFBMTCBmb3IgdGhlIGNsb2NrIGNv
bnRyb2xsZXIgb2YgdGhlIEFtbG9naWMgVDcgU29DIGZhbWlseS4KCkxpa2UgdGhlIEZESVZzLCBJ
IHRoaW5rIHRoaXMgaXMgcHJvdmlkZWQgYnkgU0NNSS4KCkNoZWNrIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svYW1sb2dpYyx0Ny1zY21pLmgKCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAtLS0KPiAgZHJpdmVycy9jbGsvbWVz
b24vdDctcGVyaXBoZXJhbHMuYyB8IDEzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vdDctcGVyaXBoZXJhbHMuYyBiL2RyaXZlcnMv
Y2xrL21lc29uL3Q3LXBlcmlwaGVyYWxzLmMKPiBpbmRleCAyMTRkYjc4NTBkODYuLmRlMjA2NDcz
ZjNhNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jCj4g
KysrIGIvZHJpdmVycy9jbGsvbWVzb24vdDctcGVyaXBoZXJhbHMuYwo+IEBAIC0xNzYsNiArMTc2
LDEyNyBAQCBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdfcnRjID0gewo+ICAJfSwKPiAgfTsK
PiAgCj4gK3N0YXRpYyB1MzIgdDdfc3lzX3BhcmVudHNfdmFsX3RhYmxlW10gPSB7IDAsIDEsIDIs
IDMsIDQsIDUsIDcgfTsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgdDdf
c3lzX3BhcmVudHNbXSA9IHsKPiArCXsgLmZ3X25hbWUgPSAieHRhbCIsIH0sCj4gKwl7IC5md19u
YW1lID0gImZkaXYyIiwgfSwKPiArCXsgLmZ3X25hbWUgPSAiZmRpdjMiLCB9LAo+ICsJeyAuZndf
bmFtZSA9ICJmZGl2NCIsIH0sCj4gKwl7IC5md19uYW1lID0gImZkaXY1IiwgfSwKPiArCXsgLmZ3
X25hbWUgPSAiYXhpX2Nsa19mcmNwdSIsIH0sCj4gKwl7IC5odyA9ICZ0N19ydGMuaHcgfSwKPiAr
fTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19zeXNfYV9zZWwgPSB7Cj4gKwku
ZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2RhdGEpewo+ICsJCS5vZmZzZXQgPSBTWVNf
Q0xLX0NUUkwwLAo+ICsJCS5tYXNrID0gMHg3LAo+ICsJCS5zaGlmdCA9IDEwLAo+ICsJCS50YWJs
ZSA9IHQ3X3N5c19wYXJlbnRzX3ZhbF90YWJsZSwKPiArCX0sCj4gKwkuaHcuaW5pdCA9ICYoc3Ry
dWN0IGNsa19pbml0X2RhdGEpewo+ICsJCS5uYW1lID0gInN5c19hX3NlbCIsCj4gKwkJLm9wcyA9
ICZjbGtfcmVnbWFwX211eF9vcHMsCj4gKwkJLnBhcmVudF9kYXRhID0gdDdfc3lzX3BhcmVudHMs
Cj4gKwkJLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRSh0N19zeXNfcGFyZW50cyksCj4gKwl9LAo+
ICt9Owo+ICsKPiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHQ3X3N5c19hX2RpdiA9IHsKPiAr
CS5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9kaXZfZGF0YSl7Cj4gKwkub2Zmc2V0ID0gU1lT
X0NMS19DVFJMMCwKPiArCQkuc2hpZnQgPSAwLAo+ICsJCS53aWR0aCA9IDEwLAo+ICsJfSwKPiAr
CS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4gKwkJLm5hbWUgPSAic3lzX2Ff
ZGl2IiwKPiArCQkub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9vcHMsCj4gKwkJLnBhcmVudF9o
d3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAqW10pIHsKPiArCQkJJnQ3X3N5c19hX3NlbC5odwo+
ICsJCX0sCj4gKwkJLm51bV9wYXJlbnRzID0gMSwKPiArCQkuZmxhZ3MgPSBDTEtfU0VUX1JBVEVf
UEFSRU5ULAo+ICsJfSwKPiArfTsKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19z
eXNfYSA9IHsKPiArCS5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpewo+ICsJ
CS5vZmZzZXQgPSBTWVNfQ0xLX0NUUkwwLAo+ICsJCS5iaXRfaWR4ID0gMTMsCj4gKwl9LAo+ICsJ
Lmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKXsKPiArCQkubmFtZSA9ICJzeXNfYSIs
Cj4gKwkJLm9wcyA9ICZjbGtfcmVnbWFwX2dhdGVfb3BzLAo+ICsJCS5wYXJlbnRfaHdzID0gKGNv
bnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gKwkJCSZ0N19zeXNfYV9kaXYuaHcKPiArCQl9LAo+
ICsJCS5udW1fcGFyZW50cyA9IDEsCj4gKwl9LAo+ICt9Owo+ICsKPiArc3RhdGljIHN0cnVjdCBj
bGtfcmVnbWFwIHQ3X3N5c19iX3NlbCA9IHsKPiArCS5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21h
cF9tdXhfZGF0YSl7Cj4gKwkJLm9mZnNldCA9IFNZU19DTEtfQ1RSTDAsCj4gKwkJLm1hc2sgPSAw
eDcsCj4gKwkJLnNoaWZ0ID0gMjYsCj4gKwkJLnRhYmxlID0gdDdfc3lzX3BhcmVudHNfdmFsX3Rh
YmxlLAo+ICsJfSwKPiArCS5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4gKwkJ
Lm5hbWUgPSAic3lzX2Jfc2VsIiwKPiArCQkub3BzID0gJmNsa19yZWdtYXBfbXV4X29wcywKPiAr
CQkucGFyZW50X2RhdGEgPSB0N19zeXNfcGFyZW50cywKPiArCQkubnVtX3BhcmVudHMgPSBBUlJB
WV9TSVpFKHQ3X3N5c19wYXJlbnRzKSwKPiArCX0sCj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0
IGNsa19yZWdtYXAgdDdfc3lzX2JfZGl2ID0gewo+ICsJLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVn
bWFwX2Rpdl9kYXRhKXsKPiArCQkub2Zmc2V0ID0gU1lTX0NMS19DVFJMMCwKPiArCQkuc2hpZnQg
PSAxNiwKPiArCQkud2lkdGggPSAxMCwKPiArCX0sCj4gKwkuaHcuaW5pdCA9ICYoc3RydWN0IGNs
a19pbml0X2RhdGEpewo+ICsJCS5uYW1lID0gInN5c19iX2RpdiIsCj4gKwkJLm9wcyA9ICZjbGtf
cmVnbWFwX2RpdmlkZXJfb3BzLAo+ICsJCS5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtf
aHcgKltdKSB7Cj4gKwkJCSZ0N19zeXNfYl9zZWwuaHcKPiArCQl9LAo+ICsJCS5udW1fcGFyZW50
cyA9IDEsCj4gKwl9LAo+ICt9Owo+ICsKPiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHQ3X3N5
c19iID0gewo+ICsJLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX2dhdGVfZGF0YSl7Cj4gKwkJ
Lm9mZnNldCA9IFNZU19DTEtfQ1RSTDAsCj4gKwkJLmJpdF9pZHggPSAyOSwKPiArCX0sCj4gKwku
aHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2RhdGEpewo+ICsJCS5uYW1lID0gInN5c19iIiwK
PiArCQkub3BzID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsCj4gKwkJLnBhcmVudF9od3MgPSAoY29u
c3Qgc3RydWN0IGNsa19odyAqW10pIHsKPiArCQkJJnQ3X3N5c19iX2Rpdi5odwo+ICsJCX0sCj4g
KwkJLm51bV9wYXJlbnRzID0gMSwKPiArCX0sCj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGNs
a19yZWdtYXAgdDdfc3lzID0gewo+ICsJLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX211eF9k
YXRhKXsKPiArCQkub2Zmc2V0ID0gU1lTX0NMS19DVFJMMCwKPiArCQkubWFzayA9IDB4MSwKPiAr
CQkuc2hpZnQgPSAxNSwKPiArCX0sCj4gKwkuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2Rh
dGEpewo+ICsJCS5uYW1lID0gInN5c19jbGsiLAo+ICsJCS5vcHMgPSAmY2xrX3JlZ21hcF9tdXhf
b3BzLAo+ICsJCS5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gKwkJ
CSZ0N19zeXNfYS5odywKPiArCQkJJnQ3X3N5c19iLmh3LAo+ICsJCX0sCj4gKwkJLm51bV9wYXJl
bnRzID0gMiwKPiArCX0sCj4gK307Cj4gKwo+ICBzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgdDdf
Y2VjYV9kdWFsZGl2X2luID0gewo+ICAJLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFwX2dhdGVf
ZGF0YSl7Cj4gIAkJLm9mZnNldCA9IENFQ0FfQ1RSTDAsCj4gQEAgLTgyNCw3ICs5NDUsNyBAQCBz
dGF0aWMgVDdfQ09NUF9HQVRFKHNkX2VtbWNfYywgTkFORF9DTEtfQ1RSTCwgNywgMCk7Cj4gIAo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSB0N19zcGljY19wYXJlbnRzW10g
PSB7Cj4gIAl7IC5md19uYW1lID0gInh0YWwiLCB9LAo+IC0JeyAuZndfbmFtZSA9ICJzeXMiLCB9
LAo+ICsJeyAuaHcgPSAmdDdfc3lzLmh3IH0sCj4gIAl7IC5md19uYW1lID0gImZkaXY0IiwgfSwK
PiAgCXsgLmZ3X25hbWUgPSAiZmRpdjMiLCB9LAo+ICAJeyAuZndfbmFtZSA9ICJmZGl2MiIsIH0s
Cj4gQEAgLTg1OSw3ICs5ODAsNyBAQCBzdGF0aWMgVDdfQ09NUF9HQVRFKHNwaWNjNSwgU1BJQ0Nf
Q0xLX0NUUkwyLCAyMiwgMCk7Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRf
ZGF0YSB0N19zYXJhZGNfcGFyZW50c1tdID0gewo+ICAJeyAuZndfbmFtZSA9ICJ4dGFsIiB9LAo+
IC0JeyAuZndfbmFtZSA9ICJzeXMiIH0sCj4gKwl7IC5odyA9ICZ0N19zeXMuaHcgfSwKPiAgfTsK
PiAgCj4gIHN0YXRpYyBUN19DT01QX1NFTChzYXJhZGMsIFNBUl9DTEtfQ1RSTDAsIDksIDB4MSwg
dDdfc2FyYWRjX3BhcmVudHMpOwo+IEBAIC05MjksNyArMTA1MCw3IEBAIHN0YXRpYyBUN19DT01Q
X1NFTChwd21fYW9faCwgUFdNX0NMS19BT19HSF9DVFJMLCAyNSwgMHgzLCB0N19wd21fcGFyZW50
cyk7Cj4gIHN0YXRpYyBUN19DT01QX0RJVihwd21fYW9faCwgUFdNX0NMS19BT19HSF9DVFJMLCAx
NiwgOCk7Cj4gIHN0YXRpYyBUN19DT01QX0dBVEUocHdtX2FvX2gsIFBXTV9DTEtfQU9fR0hfQ1RS
TCwgMjQsIDApOwo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgdDdf
c3lzX3BjbGtfcGFyZW50cyA9IHsgLmZ3X25hbWUgPSAic3lzIiB9Owo+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGNsa19wYXJlbnRfZGF0YSB0N19zeXNfcGNsa19wYXJlbnRzID0geyAuaHcgPSAmdDdf
c3lzLmh3IH07Cj4gIAo+ICAjZGVmaW5lIFQ3X1NZU19QQ0xLKF9uYW1lLCBfcmVnLCBfYml0LCBf
ZmxhZ3MpIFwKPiAgCU1FU09OX1BDTEsodDdfIyNfbmFtZSwgX3JlZywgX2JpdCwgJnQ3X3N5c19w
Y2xrX3BhcmVudHMsIF9mbGFncykKPiBAQCAtMTE2MSw2ICsxMjgyLDEzIEBAIHN0YXRpYyBzdHJ1
Y3QgY2xrX2h3ICp0N19wZXJpcGhlcmFsc19od19jbGtzW10gPSB7Cj4gIAlbQ0xLSURfUFdNX0FP
X0hfU0VMXQkJPSAmdDdfcHdtX2FvX2hfc2VsLmh3LAo+ICAJW0NMS0lEX1BXTV9BT19IX0RJVl0J
CT0gJnQ3X3B3bV9hb19oX2Rpdi5odywKPiAgCVtDTEtJRF9QV01fQU9fSF0JCT0gJnQ3X3B3bV9h
b19oLmh3LAo+ICsJW0NMS0lEX1NZU19BX1NFTF0JCT0gJnQ3X3N5c19hX3NlbC5odywKPiArCVtD
TEtJRF9TWVNfQV9ESVZdCQk9ICZ0N19zeXNfYV9kaXYuaHcsCj4gKwlbQ0xLSURfU1lTX0FdCQkJ
PSAmdDdfc3lzX2EuaHcsCj4gKwlbQ0xLSURfU1lTX0JfU0VMXQkJPSAmdDdfc3lzX2Jfc2VsLmh3
LAo+ICsJW0NMS0lEX1NZU19CX0RJVl0JCT0gJnQ3X3N5c19iX2Rpdi5odywKPiArCVtDTEtJRF9T
WVNfQl0JCQk9ICZ0N19zeXNfYi5odywKPiArCVtDTEtJRF9TWVNdCQkJCT0gJnQ3X3N5cy5odywK
PiAgCVtDTEtJRF9TWVNfRERSXQkJCT0gJnQ3X3N5c19kZHIuaHcsCj4gIAlbQ0xLSURfU1lTX0RP
U10JCQk9ICZ0N19zeXNfZG9zLmh3LAo+ICAJW0NMS0lEX1NZU19NSVBJX0RTSV9BXQkJPSAmdDdf
c3lzX21pcGlfZHNpX2EuaHcsCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
