Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6801C7618D
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBZW1eQE3Xtj7G+oA+O+jqQKAIKX4910xy1tDAlGdb4=; b=VulJBViyN/5SWX
	+d/NJXJnJWgBKV8ZuNNffOf/9w8VbilyzVzLB2TTLfURZdkdMgBG/n04uJOnHR/yyh6/qUUsjJ5OH
	ZN20hmirciBj7Y5Xo95SDg00AoHrQfDUoV/gzSSJ9FPgV4jdc7M7SkeRaOYRltE58oL2YSy8IZlct
	v3KG7vZb9VzAIsCsz44V4cMFPHkSBSDLn+t6iXKS3dTGyrViSAFyiAz4JXxEWp4cSNotWaAxQqwre
	8E3ydj6/aIORTtIwbAAJvwVKscLcC4TQ6mUPdCoc5m1OVoBDX5CbXkE3a0MWipbjIdw3GCzJL4w+o
	I4o2/7++46dLoPe+Z6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSow-00Do2b-28;
	Wed, 15 Mar 2023 15:13:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkN-00DkB8-2W
	for linux-amlogic@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zOe4trkYjuSF1ApFJXP8vNz1QKxPE7fRqdv/Z0pszv8=; b=Vyj64IZvGRXbZGneBk4GmD7b6r
	+uOzfNwsVDH+TZn3ETNHcXAwj/KxbZdSC/6ffl/ZfEbgy4lCJg9+wfRPFjnL1Ab2F2z0qvmvti9Hs
	VJIjpvWv4tVLT7fNGfDvroGGl2ql09UjjBIKbm52Xy1tfs6Nmkb6xCd342kQSUQDVuw9Fo2LJMrpf
	7qjdMEYF0t8PWaJGpVyz6uOBXg4sTIySI/rJVmWsA3ZmLYFgZ2M7/AYyWTudX+bURGIrERHCwfbhZ
	sOGOSFFDtkus4H8XdLCa5JwYF3IPoKt+DNL+jzM/gG73Mzknf/J3Nl9iWZ2reOt+R92pMkBc7BIDo
	1x8Yg6Qg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcSkC-00Dw1K-M9
	for linux-amlogic@lists.infradead.org; Wed, 15 Mar 2023 15:08:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008Ss-Lv; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcQ-M1; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0057j8-0A; Wed, 15 Mar 2023 16:08:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 114/173] ASoC: meson: aiu: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:46 +0100
Message-Id: <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dFzHDZxFY1LnF/vH5qoG7cREA6ZssUK4dysHkK1fy3A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6IFDyIZ+oP9ndVzNSV6myRohvWzvUoe1phQ d70M0WZcFGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeiAAKCRDB/BR4rcrs CedYCACaTxr2Cr6x7kpn5otGsM2h3AKhrioeNQ8GDsl1gB4YmGd9E1ofZNVLrIZTrNUaWI0Zde7 Y1zXna1xWS3sHW9SJCuBa+HQ/xaETvenpY4Fe+wV304I0Apc9wOMK+cm1L56OfMmTKcFowRQV5w 4ua2v/XE+PN1Z/YYoZk+NXdcmR/MDs2X4Fd/mfYn4QdYpfeOC598kaD2KQow3eBjWAis2TClebj SFO6orzadXQ7yAjJoAt/pOVhjOaDP4/jU10XNl18SKLlFveYaHXQStNg/mhYO6c+o0BjON1RTVK dLpi1gJ8qzhs/LzSOEhsE1ZIUC5GqBxDNsuzwMdOu7E3tOU5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150849_237690_5E3A0F61 
X-CRM114-Status: GOOD (  12.70  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogc291
bmQvc29jL21lc29uL2FpdS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL21lc29uL2FpdS5j
IGIvc291bmQvc29jL21lc29uL2FpdS5jCmluZGV4IDg4ZTYxMWU2NGQxNC4uZGEzNTFhNjBkZjBj
IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvbWVzb24vYWl1LmMKKysrIGIvc291bmQvc29jL21lc29u
L2FpdS5jCkBAIC0zMzEsMTEgKzMzMSw5IEBAIHN0YXRpYyBpbnQgYWl1X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBhaXVf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBhaXVfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc25kX3NvY191bnJlZ2lzdGVy
X2NvbXBvbmVudCgmcGRldi0+ZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGFpdV9wbGF0Zm9ybV9kYXRhIGFpdV9neGJiX3BkYXRhID0gewpAQCAtMzY0LDcgKzM2
Miw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGFpdV9vZl9tYXRjaCk7CiAKIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFpdV9wZHJ2ID0gewogCS5wcm9iZSA9IGFpdV9wcm9iZSwK
LQkucmVtb3ZlID0gYWl1X3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IGFpdV9yZW1vdmUsCiAJLmRy
aXZlciA9IHsKIAkJLm5hbWUgPSAibWVzb24tYWl1IiwKIAkJLm9mX21hdGNoX3RhYmxlID0gYWl1
X29mX21hdGNoLAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
