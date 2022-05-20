Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DB5C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 May 2022 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i54pqJbRZF5a5CyPvdZD4cCoilsM9+irEfxl4pkxmcg=; b=XDPR7iJOtk1yTw
	0UHaGNrw0fxTIW3pJSPzwqZhVbiYnJa8+S5GnFC3+ZauNXJt5Cij3dzZO1DbIvaQ/uEQQs2no2Dsx
	ZfpkhR3OeD6aHZ0493SYvQwy1fh7Vw0puolu28PdZwuTXRrHYZUZwC4lljcA3ojA0tm4GdlECs4Jo
	r1TC6oIe6ZS4hSin3hR+UzghKXhJwY4b0QqCxVdqGqVrkF0tT/mjU8fGmVyD3usXLdjhMtqXeAoXl
	g1NTNSowQ5zedOIQzidHzvl4+WsbDsPAZnFLVbb3MczwnRcIfr5VpoT8wdlgmt3VuC5Fz+hkEmNHl
	iuLVO0s0z2fbmEdeTsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrxWf-00BAEW-Vz; Fri, 20 May 2022 07:58:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrxWc-00BACI-4R
 for linux-amlogic@lists.infradead.org; Fri, 20 May 2022 07:58:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWI-0006bH-3M; Fri, 20 May 2022 09:57:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWH-003ROu-O1; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrxWF-00AveO-69; Fri, 20 May 2022 09:57:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Michael Turquette <mturquette@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v9 0/4] clk: provide new devm helpers for prepared and enabled
 clocks
Date: Fri, 20 May 2022 09:57:33 +0200
Message-Id: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; h=from:subject;
 bh=sEhuMmJW8l03//A/Pq9UCpgGc389v3t6wXwl4AtmbV0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nW4RmK5Skbk1HhqzFWTduO8ASNdMPskUzcaNyF
 DKDG/iyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ1gAKCRDB/BR4rcrsCTC9B/
 9J9jmZqoBS7CZI8eRtCxLpm5BhzRPL8uY4LD07XNagLaYHx9kNRbQKyNr/W3e6TTxQDlSO29xUogcn
 NetIM7xPbD4dLe/4Z65dxaziw0a/j9YxEFOacX4DrnA3bvaVA6ML47qngWs9ss70L/sIOzwQGhhNzy
 KG1KT03FW4cANfcgaD+rmyCH7q+Fob/Les4PVhNKOY6O2O9kA2Ayf5bRoAdWs7U09x76iLuO2IqEmt
 /u0JKbEoFLHbzSy3rNvsb4Sz2qYFH5PzLvP0u0oHGSJ4P2Jqdi6qenBzdslpOHD/d6WVXYw+A/P1CX
 fHyHLW9F+naC/qAWydNC3FC18Z51R/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_005818_215262_9BD71B66 
X-CRM114-Status: GOOD (  12.56  )
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

SGVsbG8sCgphZnRlciBTdGVwaGVuIHNpZ25hbGVkIHRvIGFjY2VwdCB0aGUgaWRlYSwgdGhpcyBp
cyBhIHJld29yayBvZiB2OFsxXSB3aXRoCnRoZSBmb2xsb3dpbmcgY2hhbmdlczoKCiAtIERyb3Ag
dGhlIGZvbGxvdyB1cCBjb252ZXJzaW9ucy4gSSB3aWxsIHJlc2VuZCB0aGVtIGluZGl2aWR1YWxs
eSBwZXIKICAgc3Vic3lzdGVtIG9uY2UgdGhlIHByZWNvbmRpdGlvbnMgZnJvbSB0aGlzIHY5IGFy
ZSBpbi4gSSBvbmx5IGtlcHQgb25lCiAgIGNsayBwYXRjaCB0aGF0IHdpbGwgZ28gaW4gdmlhIHRo
ZSBjbGsgdHJlZSBhbnlob3cuIEkgdHJpbW1lZCB0aGUgQ2M6CiAgIGxpc3QgYWNjb3JkaW5nbHku
CgogLSAodHJpdmlhbGx5KSByZWJhc2VkIHRvIHY1LjE4LXJjMQoKIC0gSW50cm9kdWNlIGEgbmV3
IGNvbW1pdCB0aGF0IGZpcnN0IGltcHJvdmVzIHRoZSBkb2N1bWVudGlvbiBvZgogICBkZXZtX2Ns
a19nZXQoKSBhbmQgZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkgYmVmb3JlIChtb3N0bHkpCiAgIGR1
cGxpY2F0aW5nIHRoZXNlIGZvciB0aGUgbmV3IGZ1bmN0aW9ucy4KCiAtIE1ha2UgdGhlIG5ldyBm
dW5jdGlvbnMgdXNlIGEgR1BMIGV4cG9ydC4gKE5vdGUgdGhlIGV4aXN0aW5nIGZ1bmN0aW9ucwog
ICB1c2UgYSBwbGFpbiBleHBvcnQsIEkgZGlkbid0IGNoYW5nZSB0aGF0LikKCiAtIERyb3AgYSBi
b2d1cyBlbXB0eSBsaW5lIHRoYXQgd2FzIGN1dC1uLXBhc3RlZCBpbnRvIHNldmVyYWwgZnVuY3Rp
b25zLgoKVGhhbmtzIGZvciBmZWVkYmFjayBieSBTdGVwaGVuIGFuZCBKb25hdGhhbi4KCkBSdXNz
ZWxsOiBTdGVwaGVuIHdyb3RlIGluIHY4OiAiSSdtIGxhcmdlbHkgd2FpdGluZyBmb3IgUnVzc2Vs
bCB0byBhY2sKdGhlIGNsay5oIGNoYW5nZSBbLi4uXSIuIFdvdWxkIGJlIGdyZWF0IGlmIHlvdSBs
b29rZWQgYXQgdGhlIHNlcmllcyBhbmQKdGVsbCB1cyB5b3VyIHRob3VnaHRzLgoKQFN0ZXBoZW46
IFlvdSBhc2tlZCB0byBhZGQgdGhlIGFja3MgZnJvbSB2OC4gVGhlcmUgd2VyZSBob3dldmVyIG9u
bHkKYWNrcyBmb3IgdGhlIGZvbGxvd3VwIGNvbnZlcnNpb25zLiBTbyBubyBjaGFuZ2VzIGhlcmUu
CihBbmR5IFNoZXZjaGVua28gcmVwbGllZCB0byBwYXRjaCAwLCBidXQgaGlzIFJldmlld2VkLWJ5
OiBvbmx5IGFmZmVjdGVkCnRoZSBwYXRjaCAiaWlvOiBNYWtlIHVzZSBvZiBkZXZtX2Nsa19nZXRf
ZW5hYmxlZCgpIi4pCgpCZXN0IHJlZ2FyZHMKVXdlCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtY2xrLzIwMjIwMzE0MTQxNjQzLjIyMTg0LTEtdS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlCgpVd2UgS2xlaW5lLUvDtm5pZyAoNCk6CiAgY2xrOiBJbXByb3ZlIGRvY3VtZW50
YXRpb24gZm9yIGRldm1fY2xrX2dldCgpIGFuZCBpdHMgb3B0aW9uYWwgdmFyaWFudAogIGNsazog
Z2VuZXJhbGl6ZSBkZXZtX2Nsa19nZXQoKSBhIGJpdAogIGNsazogUHJvdmlkZSBuZXcgZGV2bV9j
bGsgaGVscGVycyBmb3IgcHJlcGFyZWQgYW5kIGVuYWJsZWQgY2xvY2tzCiAgY2xrOiBtZXNvbjog
YXhnLWF1ZGlvOiBEb24ndCBkdXBsaWNhdGUgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKQoKIGRyaXZl
cnMvY2xrL2Nsay1kZXZyZXMuYyAgICAgIHwgIDkxICsrKysrKysrKysrKysrKysrKystLS0tCiBk
cml2ZXJzL2Nsay9tZXNvbi9heGctYXVkaW8uYyB8ICAzNiArLS0tLS0tLS0KIGluY2x1ZGUvbGlu
dXgvY2xrLmggICAgICAgICAgIHwgMTM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMjA3IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQoK
CmJhc2UtY29tbWl0OiAzMTIzMTA5Mjg0MTc2YjE1MzI4NzQ1OTFmN2M4MWYzODM3YmJkYzE3Ci0t
IAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
