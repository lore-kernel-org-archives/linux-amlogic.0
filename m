Return-Path: <SRS0=xyi4=UA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C88C28CC4
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Jun 2019 13:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D577127364
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Jun 2019 13:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="foGJR7y4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPzK1xSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D577127364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fH9vF8g9B9cj8CHd4NcTeuoeuT91HwVyF9HxGhNhbns=; b=foGJR7y4/Q5lTg
	Zc5CAjjuUDKyZgDhmRzhpRTjdA3ztS5o34BgoOEnWDcB1+GdhqFLTIfBd17iGSNFfMypVMv8geaIP
	eoWxuaXMOTGTHhp9x1/sB4fw+ykPcYAPK9u512T6Ndd/VMu69GX5xD8DFRCSqHrEkpd/hN+PjN/Nr
	+BhCeHsxsIqiGE/efmDs7p2vDAU4BF4bKKSXyDR5UlS2YJunXR5tzyrR9H5yKemHKN4eODHp8x1q1
	DNHhJ8/SADdglH/7Iqq6zH4d14BvkqGroySIk20SouoPNjLKEbd/sk03xb8w4bK2jRfN+K5O12AMF
	xAWYVmPcCr/mg0/x8/mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hX3yc-0003qP-2W; Sat, 01 Jun 2019 13:23:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hX3yY-0003q5-QL
 for linux-amlogic@lists.infradead.org; Sat, 01 Jun 2019 13:23:12 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BA11240F2;
 Sat,  1 Jun 2019 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395390;
 bh=Abv9GsTyntkTHWoXQ9xFksd//sO3na6syWyCUco9TYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WPzK1xSXCcmV7hK0NssgjaZUcpSnwUJX5GtmJcKDl7UXDBuIB2zwMTut6m3ORb2G5
 9ez2VvSkuiZdz2TqyWr8bIG9v/fw2YcxxDXjq8To/547xoJOMhBHkOrOy4xVYsetQh
 eaNMaapKD1TrRau4sIwuURJzm3igHTqyZlxIuFN0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 031/141] pwm: meson: Use the spin-lock only to
 protect register modifications
Date: Sat,  1 Jun 2019 09:20:07 -0400
Message-Id: <20190601132158.25821-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132158.25821-1-sashal@kernel.org>
References: <20190601132158.25821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190601_062310_888940_88F24E06 
X-CRM114-Status: GOOD (  17.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-pwm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGYxNzM3NDdmZmZkZjAzN2M3OTE0MDVhYjRmMWVjMGVi
MzkyZmM0OGUgXQoKSG9sZGluZyB0aGUgc3Bpbi1sb2NrIGZvciBhbGwgb2YgdGhlIGNvZGUgaW4g
bWVzb25fcHdtX2FwcGx5KCkgY2FuCnJlc3VsdCBpbiBhICJCVUc6IHNjaGVkdWxpbmcgd2hpbGUg
YXRvbWljIi4gVGhpcyBjYW4gaGFwcGVuIGJlY2F1c2UKY2xrX2dldF9yYXRlKCkgKHdoaWNoIGlz
IGNhbGxlZCBmcm9tIG1lc29uX3B3bV9jYWxjKCkpIG1heSBzbGVlcC4KT25seSBob2xkIHRoZSBz
cGluLWxvY2sgd2hlbiBtb2RpZnlpbmcgcmVnaXN0ZXJzIHRvIHNvbHZlIHRoaXMuCgpUaGUgcmVh
c29uIHdoeSB3ZSBuZWVkIGEgc3Bpbi1sb2NrIGluIHRoZSBkcml2ZXIgaXMgYmVjYXVzZSB0aGUK
UkVHX01JU0NfQUIgcmVnaXN0ZXIgaXMgc2hhcmVkIGJldHdlZW4gdGhlIHR3byBjaGFubmVscyBw
cm92aWRlZCBieSBvbmUKUFdNIGNvbnRyb2xsZXIuIFRoZSBvbmx5IGZ1bmN0aW9ucyB3aGVyZSBS
RUdfTUlTQ19BQiBpcyBtb2RpZmllZCBhcmUKbWVzb25fcHdtX2VuYWJsZSgpIGFuZCBtZXNvbl9w
d21fZGlzYWJsZSgpIHNvIHRoZSByZWdpc3RlciByZWFkcy93cml0ZXMKaW4gdGhlcmUgbmVlZCB0
byBiZSBwcm90ZWN0ZWQgYnkgdGhlIHNwaW4tbG9jay4KClRoZSBvcmlnaW5hbCBjb2RlIGFsc28g
dXNlZCB0aGUgc3Bpbi1sb2NrIHRvIHByb3RlY3QgdGhlIHZhbHVlcyBpbgpzdHJ1Y3QgbWVzb25f
cHdtX2NoYW5uZWwuIFRoaXMgY291bGQgYmUgbmVjZXNzYXJ5IGlmIHR3byBjb25zdW1lcnMgY2Fu
CnVzZSB0aGUgc2FtZSBQV00gY2hhbm5lbC4gSG93ZXZlciwgUFdNIGNvcmUgZG9lc24ndCBhbGxv
dyB0aGlzIHNvIHdlCmRvbid0IG5lZWQgdG8gcHJvdGVjdCB0aGUgdmFsdWVzIGluIHN0cnVjdCBt
ZXNvbl9wd21fY2hhbm5lbCB3aXRoIGEKbG9jay4KCkZpeGVzOiAyMTFlZDYzMDc1M2QyZiAoInB3
bTogQWRkIHN1cHBvcnQgZm9yIE1lc29uIFBXTSBDb250cm9sbGVyIikKU2lnbmVkLW9mZi1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
UmV2aWV3ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5j
b20+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBk
cml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKaW5k
ZXggYzFlZDY0MWIzZTI2Ni4uZjZlNzM4YWQ3YmQ5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20v
cHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKQEAgLTExMSw2ICsxMTEs
MTAgQEAgc3RydWN0IG1lc29uX3B3bSB7CiAJY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhICpk
YXRhOwogCXZvaWQgX19pb21lbSAqYmFzZTsKIAl1OCBpbnZlcnRlcl9tYXNrOworCS8qCisJICog
UHJvdGVjdHMgcmVnaXN0ZXIgKHdyaXRlKSBhY2Nlc3MgdG8gdGhlIFJFR19NSVNDX0FCIHJlZ2lz
dGVyCisJICogdGhhdCBpcyBzaGFyZWQgYmV0d2VlbiB0aGUgdHdvIFBXTXMuCisJICovCiAJc3Bp
bmxvY2tfdCBsb2NrOwogfTsKIApAQCAtMjM1LDYgKzIzOSw3IEBAIHN0YXRpYyB2b2lkIG1lc29u
X3B3bV9lbmFibGUoc3RydWN0IG1lc29uX3B3bSAqbWVzb24sCiB7CiAJdTMyIHZhbHVlLCBjbGtf
c2hpZnQsIGNsa19lbmFibGUsIGVuYWJsZTsKIAl1bnNpZ25lZCBpbnQgb2Zmc2V0OworCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CiAKIAlzd2l0Y2ggKGlkKSB7CiAJY2FzZSAwOgpAQCAtMjU1LDYgKzI2
MCw4IEBAIHN0YXRpYyB2b2lkIG1lc29uX3B3bV9lbmFibGUoc3RydWN0IG1lc29uX3B3bSAqbWVz
b24sCiAJCXJldHVybjsKIAl9CiAKKwlzcGluX2xvY2tfaXJxc2F2ZSgmbWVzb24tPmxvY2ssIGZs
YWdzKTsKKwogCXZhbHVlID0gcmVhZGwobWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQik7CiAJdmFs
dWUgJj0gfihNSVNDX0NMS19ESVZfTUFTSyA8PCBjbGtfc2hpZnQpOwogCXZhbHVlIHw9IGNoYW5u
ZWwtPnByZV9kaXYgPDwgY2xrX3NoaWZ0OwpAQCAtMjY3LDExICsyNzQsMTQgQEAgc3RhdGljIHZv
aWQgbWVzb25fcHdtX2VuYWJsZShzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwKIAl2YWx1ZSA9IHJl
YWRsKG1lc29uLT5iYXNlICsgUkVHX01JU0NfQUIpOwogCXZhbHVlIHw9IGVuYWJsZTsKIAl3cml0
ZWwodmFsdWUsIG1lc29uLT5iYXNlICsgUkVHX01JU0NfQUIpOworCisJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmbWVzb24tPmxvY2ssIGZsYWdzKTsKIH0KIAogc3RhdGljIHZvaWQgbWVzb25fcHdt
X2Rpc2FibGUoc3RydWN0IG1lc29uX3B3bSAqbWVzb24sIHVuc2lnbmVkIGludCBpZCkKIHsKIAl1
MzIgdmFsdWUsIGVuYWJsZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJc3dpdGNoIChpZCkg
ewogCWNhc2UgMDoKQEAgLTI4Niw5ICsyOTYsMTMgQEAgc3RhdGljIHZvaWQgbWVzb25fcHdtX2Rp
c2FibGUoc3RydWN0IG1lc29uX3B3bSAqbWVzb24sIHVuc2lnbmVkIGludCBpZCkKIAkJcmV0dXJu
OwogCX0KIAorCXNwaW5fbG9ja19pcnFzYXZlKCZtZXNvbi0+bG9jaywgZmxhZ3MpOworCiAJdmFs
dWUgPSByZWFkbChtZXNvbi0+YmFzZSArIFJFR19NSVNDX0FCKTsKIAl2YWx1ZSAmPSB+ZW5hYmxl
OwogCXdyaXRlbCh2YWx1ZSwgbWVzb24tPmJhc2UgKyBSRUdfTUlTQ19BQik7CisKKwlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZtZXNvbi0+bG9jaywgZmxhZ3MpOwogfQogCiBzdGF0aWMgaW50IG1l
c29uX3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20sCkBAIC0yOTYsMTkgKzMxMCwxNiBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9hcHBseShzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiB7CiAJc3RydWN0IG1l
c29uX3B3bV9jaGFubmVsICpjaGFubmVsID0gcHdtX2dldF9jaGlwX2RhdGEocHdtKTsKIAlzdHJ1
Y3QgbWVzb25fcHdtICptZXNvbiA9IHRvX21lc29uX3B3bShjaGlwKTsKLQl1bnNpZ25lZCBsb25n
IGZsYWdzOwogCWludCBlcnIgPSAwOwogCiAJaWYgKCFzdGF0ZSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAKLQlzcGluX2xvY2tfaXJxc2F2ZSgmbWVzb24tPmxvY2ssIGZsYWdzKTsKLQogCWlmICghc3Rh
dGUtPmVuYWJsZWQpIHsKIAkJbWVzb25fcHdtX2Rpc2FibGUobWVzb24sIHB3bS0+aHdwd20pOwog
CQljaGFubmVsLT5zdGF0ZS5lbmFibGVkID0gZmFsc2U7CiAKLQkJZ290byB1bmxvY2s7CisJCXJl
dHVybiAwOwogCX0KIAogCWlmIChzdGF0ZS0+cGVyaW9kICE9IGNoYW5uZWwtPnN0YXRlLnBlcmlv
ZCB8fApAQCAtMzI5LDcgKzM0MCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2FwcGx5KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJZXJyID0gbWVzb25f
cHdtX2NhbGMobWVzb24sIGNoYW5uZWwsIHB3bS0+aHdwd20sCiAJCQkJICAgICBzdGF0ZS0+ZHV0
eV9jeWNsZSwgc3RhdGUtPnBlcmlvZCk7CiAJCWlmIChlcnIgPCAwKQotCQkJZ290byB1bmxvY2s7
CisJCQlyZXR1cm4gZXJyOwogCiAJCWNoYW5uZWwtPnN0YXRlLnBvbGFyaXR5ID0gc3RhdGUtPnBv
bGFyaXR5OwogCQljaGFubmVsLT5zdGF0ZS5wZXJpb2QgPSBzdGF0ZS0+cGVyaW9kOwpAQCAtMzQx
LDkgKzM1Miw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJY2hhbm5lbC0+c3RhdGUuZW5hYmxlZCA9
IHRydWU7CiAJfQogCi11bmxvY2s6Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbWVzb24tPmxv
Y2ssIGZsYWdzKTsKLQlyZXR1cm4gZXJyOworCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZCBt
ZXNvbl9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
