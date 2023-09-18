Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F0ACD13D2
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Sep 2023 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qaPxOctcs4HVU1Ga+edyte3nsgtCKSX4gPkRDwP9uaE=; b=eToqkDtn8hue+4
	Sbx2b8fOZiGfTJ6NsNZnFRS/kdjtsyx7aMPWNaTKmj51QkwNMihYoGXPjFHAYL82AdGKrtYDeHkN3
	ykR7Ad7pnDrKWSDfYmIYbvGDGNdN8TppAfiTdzAJozgOnLrq3iW91oN/QBYVLKAvA3HiDpMSjQzlK
	iwclhWBFud3vxzJ5y7ZNbDB6GWAi9/qLsXPDf0v9KCt53us2w8CoU5DUWYPVLku2cV1GSAHkPsdZi
	yWNU2PZprLnSvOCctbTZuI84A5wLpXTWNuOsijBdfErbKMc90TCYpcRS+UELXfxJhIW0m6s79gKac
	QXG0gv7YNIkAdYg6zjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHi-00GDtf-1a;
	Mon, 18 Sep 2023 19:51:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKHf-00GDqd-15
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Sep 2023 19:51:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKHB-0003kL-K7; Mon, 18 Sep 2023 21:51:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH7-007I8N-8m; Mon, 18 Sep 2023 21:51:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiKH6-002mBz-U1; Mon, 18 Sep 2023 21:51:16 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>
Subject: [PATCH net-next 00/19] net: mdio: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:50:43 +0200
Message-Id: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ci0IQrSWXNAJYKg8fc1qgrDF2J0dg2FQPcKK5IFoxug=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKn/qrkWkMR4vATlu8+A8buQtn/uucJFCz2Je IMvpamj1JiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQip/wAKCRCPgPtYfRL+ TgI/CACwpYaVqL2xrOfAhNBLFfB1xVWtYI9VnYPr9stjtL6MTwB9J8cCGV9AZ3kzuvv+WH2Q4rZ 5FI4J3XS7U+/FYU0H3YQQc8TeWJY7Ox15+3DAeFd/J47vAxI040iarzF8Lk1UibG4xlKxeVr/74 7OMIbUZCi0mjPMQzdIUufaXP2vm7IHBsNE5VYDr7pvT1vJixcOEeTtR39oDZmpUGLmjXxJ4FFoZ 80e2dl5Wg/6Lwr0APE2IqAMytjXfRhdW1z8fS7axIlH1JcZePE2Vpwf3V62ohnleM1St4kJJ40I D0TiIGRs/l1V3FjneArpH8rCY8lPmB0ET/0iO0ny4VYL9Wy8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_125151_388165_A95DEC0A 
X-CRM114-Status: GOOD (  10.41  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0IGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRy
aXZlcnMvbmV0L21kaW8gdG8KdXNlIHJlbW92ZV9uZXcuIFRoZSBtb3RpdmF0aW9uIGlzIHRvIGdl
dCByaWQgb2YgYW4gaW50ZWdlciByZXR1cm4gY29kZQp0aGF0IGlzIChtb3N0bHkpIGlnbm9yZWQg
YnkgdGhlIHBsYXRmb3JtIGRyaXZlciBjb3JlIGFuZCBlcnJvciBwcm9uZSBvbgp0aGUgZHJpdmVy
IHNpZGUuCgpTZWUgY29tbWl0IDVjNWE3NjgwZTY3YiAoInBsYXRmb3JtOiBQcm92aWRlIGEgcmVt
b3ZlIGNhbGxiYWNrIHRoYXQKcmV0dXJucyBubyB2YWx1ZSIpIGZvciBhbiBleHRlbmRlZCBleHBs
YW5hdGlvbiBhbmQgdGhlIGV2ZW50dWFsIGdvYWwuCgpUaGVyZSBhcmUgbm8gaW50ZXJkZXBlbmRl
bmNpZXMgYmV0d2VlbiB0aGUgcGF0Y2hlcy4gQXMgdGhlcmUgYXJlIHN0aWxsCnF1aXRlIGEgZmV3
IGRyaXZlcnMgdG8gY29udmVydCwgSSdtIGhhcHB5IGFib3V0IGV2ZXJ5IHBhdGNoIHRoYXQgbWFr
ZXMKaXQgaW4uIFNvIGV2ZW4gaWYgdGhlcmUgaXMgYSBtZXJnZSBjb25mbGljdCB3aXRoIG9uZSBw
YXRjaCB1bnRpbCB5b3UKYXBwbHksIHBsZWFzZSBhcHBseSB0aGUgcmVtYWluZGVyIG9mIHRoaXMg
c2VyaWVzIGFueWhvdy4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgxOSk6
CiAgbmV0OiBtZGlvOiBhc3BlZWQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgbmV0OiBtZGlvOiBiY20taXByb2M6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIG5ldDogbWRpbzogYmNtLXVu
aW1hYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2
b2lkCiAgbmV0OiBtZGlvOiBncGlvOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAogIG5ldDogbWRpbzogaGlzaS1mZW1hYzogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbmV0OiBtZGlvOiBpcHE0
MDE5OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAog
IG5ldDogbWRpbzogaXBxODA2NDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBuZXQ6IG1kaW86IG1veGFydDogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBuZXQ6IG1kaW86IG1zY2MtbWlpbTogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbmV0
OiBtZGlvOiBtdXgtYmNtLWlwcm9jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
awogICAgcmV0dXJuaW5nIHZvaWQKICBuZXQ6IG1kaW86IG11eC1iY202MzY4OiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBuZXQ6IG1kaW86
IG11eC1ncGlvOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcK
ICAgIHZvaWQKICBuZXQ6IG1kaW86IG11eC1tZXNvbi1nMTJhOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjawogICAgcmV0dXJuaW5nIHZvaWQKICBuZXQ6IG1kaW86IG11eC1tZXNv
bi1neGw6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcg
dm9pZAogIG5ldDogbWRpbzogbXV4LW1taW9yZWc6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIG5ldDogbWRpbzogbXV4LW11bHRpcGxleGVy
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjawogICAgcmV0dXJuaW5nIHZvaWQK
ICBuZXQ6IG1kaW86IG9jdGVvbjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBuZXQ6IG1kaW86IHN1bjRpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG5ldDogbWRpbzogeGdlbmU6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9uZXQv
bWRpby9tZGlvLWFzcGVlZC5jICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0L21kaW8v
bWRpby1iY20taXByb2MuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8t
YmNtLXVuaW1hYy5jICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9uZXQvbWRpby9tZGlvLWdwaW8u
YyAgICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0L21kaW8vbWRpby1oaXNpLWZlbWFj
LmMgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8taXBxNDAxOS5jICAgICAg
ICAgfCA2ICsrLS0tLQogZHJpdmVycy9uZXQvbWRpby9tZGlvLWlwcTgwNjQuYyAgICAgICAgIHwg
NyArKy0tLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8tbW94YXJ0LmMgICAgICAgICAgfCA2ICsr
LS0tLQogZHJpdmVycy9uZXQvbWRpby9tZGlvLW1zY2MtbWlpbS5jICAgICAgIHwgNiArKy0tLS0K
IGRyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtYmNtLWlwcm9jLmMgICB8IDYgKystLS0tCiBkcml2
ZXJzL25ldC9tZGlvL21kaW8tbXV4LWJjbTYzNjguYyAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9u
ZXQvbWRpby9tZGlvLW11eC1ncGlvLmMgICAgICAgIHwgNSArKy0tLQogZHJpdmVycy9uZXQvbWRp
by9tZGlvLW11eC1tZXNvbi1nMTJhLmMgIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0L21kaW8vbWRp
by1tdXgtbWVzb24tZ3hsLmMgICB8IDYgKystLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4
LW1taW9yZWcuYyAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tdWx0
aXBsZXhlci5jIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0L21kaW8vbWRpby1vY3Rlb24uYyAgICAg
ICAgICB8IDUgKystLS0KIGRyaXZlcnMvbmV0L21kaW8vbWRpby1zdW40aS5jICAgICAgICAgICB8
IDYgKystLS0tCiBkcml2ZXJzL25ldC9tZGlvL21kaW8teGdlbmUuYyAgICAgICAgICAgfCA2ICsr
LS0tLQogMTkgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0p
CgpiYXNlLWNvbW1pdDogN2ZjNzIyMmQ5NjgwMzY2ZWRlZWNjMjE5YzIxY2E5NjMxMGJkYmMxMAot
LSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
